# -*- coding: utf-8 -*-
"""诊断 PyMuPDF Story 字体加载问题。"""
import pymupdf

tests = {
    "ttf_plain": r"C:/Windows/Fonts/simhei.ttf",
    "ttf_file": "file:///C:/Windows/Fonts/simhei.ttf",
    "ttc_plain": r"C:/Windows/Fonts/msyh.ttc",
    "ttc_file": "file:///C:/Windows/Fonts/msyh.ttc",
    "ttc2_file": "file:///C:/Windows/Fonts/simsun.ttc",
}

for name, src in tests.items():
    css = f"""
    @font-face {{ font-family:"TestFont"; src:url("{src}"); }}
    body {{ font-family:"TestFont"; font-size:12pt; }}
    """
    html = "<html><body><p>中文测试 AB 123 武重项目</p></body></html>"
    story = pymupdf.Story(html=html, user_css=css)
    writer = pymupdf.DocumentWriter("diag.pdf")
    dev = writer.begin_page(pymupdf.paper_rect("a4"))
    more, filled = story.place(dev)
    writer.end_page()
    writer.close()
    # 检查页面文字
    d = pymupdf.open("diag.pdf")
    text = d[0].get_text("text").strip()
    print(f"[{name}] more={more} filled={filled} text={text!r}")
    d.close()
