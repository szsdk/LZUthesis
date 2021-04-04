import os
from subprocess import check_call

VERSION = "0.2.2021"
FOLDER = f"LZUThesis_{VERSION}"
check_call("make all -j2", shell=True)
check_call("make clean", shell=True)
os.system("rm LZUThesis_* -fr")

files = {
    "pic": {"lzu.eps": "lzu.eps", "signature.pdf": "signature.pdf"},
    "compile.bat": "compile.bat",
    "LZU.cfg": "LZU.cfg",
    "LZU.cls": "LZU.cls",
    "Makefile": "Makefile",
    "ref.bib": "ref.bib",
    "simplest.tex": "simplest.tex",
    "simplest.pdf": "simplest.pdf",
    "doc.pdf": "帮助文档.pdf",
}


def copy_files(fs: dict, src_folder, tag_folder):
    check_call(f"mkdir {tag_folder}", shell=True)
    for src, tag in fs.items():
        if isinstance(tag, dict):
            copy_files(
                tag, src_folder=f"{src_folder}/{src}", tag_folder=f"{tag_folder}/{src}"
            )
        else:
            check_call(f"cp {src_folder}/{src} {tag_folder}/{tag}", shell=True)


copy_files(files, src_folder=".", tag_folder=FOLDER)
check_call(f"zip {FOLDER}.zip {FOLDER}/*", shell=True)
