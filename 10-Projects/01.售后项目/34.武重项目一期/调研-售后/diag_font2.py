# -*- coding: utf-8 -*-
"""诊断 PyMuPDF Story：无字体对照 + 字体路径写法。"""
import pymupdf

def render(tag, css, html):
    path = f"diag_{tag}.pdf"
    try:
        story = pymupdf.Story(html=html, user_css=css)
        writer = pymupdf.DocumentWriter(path)
        more = 1
        while more:
            dev = writer.begin_page(pymupdf.paper_rect("a4"))
            more, filled = story.place(dev)
            writer.end_page()
        writer.close()
        with pymupdf.open(path) as d:
            text = d[0].get_text("text").strip()
            print(f"[{tag}] more={more} filled={filled} text={text!r}")
    except Exception as e:
        print(f"[{tag}] ERROR {type(e).__name__}: {e}")

# 1) 无字体声明（默认）
render("nofont", "", "<html><body><p>Hello AB 123</p></body></html>")

# 2) file:// 协议 + 黑体
render("simhei_file", 
  '@font-face{font-family:"TH";src:url("file:///C:/Windows/Fonts/simhei.ttf");}body{font-family:"TH";font-size:12pt;}',
  "<html><body><p>中文测试 武重项目 AB</p></body></html>")

# 3) 反斜杠路径
render("simhei_bs",
  '@font-face{font-family:"TH";src:url("C:\\Windows\\Fonts\\simhei.ttf");}body{font-family:"TH";}',
  "<html><body><p>中文测试</p></body></html>")
