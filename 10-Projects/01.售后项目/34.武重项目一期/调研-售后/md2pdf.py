# -*- coding: utf-8 -*-
"""批量将整理后的 Markdown 调研记录转换为 PDF（A4，中文排版）。"""
import sys, re, pathlib, html as html_mod
import pymupdf
import markdown

# ---------- 中文字体（font-face） ----------
FONT_FILES = {
    "YaHei": r"C:/Windows/Fonts/msyh.ttc",
    "SimHei": r"C:/Windows/Fonts/simhei.ttf",
    "SimSun": r"C:/Windows/Fonts/simsun.ttc",
}

CSS = """
@font-face { font-family:"YaHei"; src:url("@YAHEI@"); }
@font-face { font-family:"SimHei"; src:url("@SIMHEI@"); }
@font-face { font-family:"SimSun"; src:url("@SIMSUN@"); }
* { box-sizing: border-box; }
body {
  font-family:"YaHei","SimHei","SimSun";
  font-size:10.5pt; line-height:1.65; color:#2b2b2b;
  margin:0; padding:0;
}
h1 { font-size:17pt; font-weight:bold; color:#1a3351;
     border-bottom:2.5pt solid #1a3351; padding-bottom:6pt; margin:6pt 0 14pt 0;}
h2 { font-size:13.5pt; font-weight:bold; color:#1f4e79;
     border-bottom:1pt solid #c9d4e0; padding-bottom:3pt; margin:16pt 0 8pt 0;}
h3 { font-size:12pt; font-weight:bold; color:#333; margin:13pt 0 6pt 0;}
p  { margin:5pt 0; }
ul, ol { margin:5pt 0; padding-left:22pt; }
li { margin:2.5pt 0; }
table { border-collapse:collapse; width:100%; margin:8pt 0; font-size:9.5pt;
        table-layout:fixed; word-wrap:break-word;}
th { background:#eef2f7; border:0.75pt solid #b8c2cf; padding:4pt 6pt;
     text-align:left; font-weight:bold; color:#1a3351;}
td { border:0.75pt solid #c9d2dc; padding:4pt 6pt; vertical-align:top;}
blockquote { border-left:3pt solid #7f9bb8; background:#f5f7fa;
             margin:6pt 0; padding:4pt 10pt; color:#44546a;}
code { font-family:"Consolas","Courier New"; font-size:9pt;
       background:#f0f0f0; padding:0 3pt; }
pre { background:#f6f6f6; border:0.75pt solid #ddd; padding:6pt 8pt; overflow-wrap:break-word;}
hr { border:none; border-top:0.75pt solid #ccc; margin:10pt 0;}
strong { color:#1a3351; }
"""

def strip_frontmatter(text):
    """剥离 YAML frontmatter，返回 (meta, body)。"""
    if text.lstrip().startswith("---"):
        parts = text.split("---", 2)
        if len(parts) >= 3:
            meta = {}
            for line in parts[1].strip().splitlines():
                if ":" in line:
                    k, _, v = line.partition(":")
                    meta[k.strip()] = v.strip()
            return meta, parts[2].lstrip()
    return {}, text

def sanitize_symbols(html):
    """将 emoji 图形符号替换为语义文本，避免中文字体缺字形显示为方框。"""
    repl = {
        "🔴": "【重点】", "🟣": "【待验证】", "⚠️": "【注意】",
        "⚠": "【注意】",
    }
    for sym, word in repl.items():
        html = html.replace(sym, word)
    return html

def md_to_pdf(md_path, pdf_path):
    text = pathlib.Path(md_path).read_text(encoding="utf-8")
    meta, body = strip_frontmatter(text)
    body_html = markdown.markdown(
        body,
        extensions=["tables", "fenced_code", "sane_lists"],
        output_format="html5",
    )
    # 内部 Obsidian 链接保持原文文本（不解析为外部跳转）
    body_html = sanitize_symbols(body_html)
    full_html = f"<!DOCTYPE html><html><head><meta charset='utf-8'></head><body>{body_html}</body></html>"
    css = (CSS
           .replace("@YAHEI@", FONT_FILES["YaHei"])
           .replace("@SIMHEI@", FONT_FILES["SimHei"])
           .replace("@SIMSUN@", FONT_FILES["SimSun"]))

    story = pymupdf.Story(html=full_html, user_css=css)
    writer = pymupdf.DocumentWriter(pdf_path)
    more = 1
    while more:
        dev = writer.begin_page(pymupdf.paper_rect("a4"))
        more, _ = story.place(dev)
        writer.end_page()
    writer.close()
    return meta

def main():
    out_dir = pathlib.Path(r"D:\ImportantFiles\Obsidian\Vault\10-Projects\01.售后项目\34.武重项目一期\调研-售后")
    files = sorted(out_dir.glob("*.md"))
    files = [f for f in files if f.name != "md2pdf.py" and "备份" not in f.name]
    if not files:
        print("未找到待转换的 md 文件")
        return
    for md_path in files:
        pdf_path = md_path.with_suffix(".pdf")
        meta = md_to_pdf(str(md_path), str(pdf_path))
        pages = pymupdf.open(str(pdf_path)).page_count
        print(f"OK  {md_path.name} -> {pdf_path.name}  ({pages} 页)")

if __name__ == "__main__":
    main()
