from pathlib import Path
import shutil
import os
from subprocess import check_call

VERSION = "0.2.2022"
FOLDER = Path(f"LZUThesis_{VERSION}".replace(".", "_"))

FILES = {
    "pic": {"lzu.eps": "lzu.eps", "signature.pdf": "signature.pdf"},
    "compile.bat": "compile.bat",
    "LZU.cfg": "LZU.cfg",
    "LZU.cls": "LZU.cls",
    "ref.bib": "ref.bib",
    "simplest.tex": "simplest.tex",
    "build/simplest.pdf": "simplest.pdf",
    "build/doc.pdf": "帮助文档.pdf",
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

check_call("make all -j2", shell=True)
if FOLDER.exists():
    shutil.rmtree(FOLDER)

copy_files(FILES, src_folder=".", tag_folder=FOLDER)
with open(f"{FOLDER}/Makefile", "w") as fp:
    print("""main: simplest.tex
	latexmk --quiet -xelatex simplest.tex

clean:
	latexmk -c""", file = fp)

zip_dir = FOLDER.with_suffix(".zip")
if zip_dir.exists():
    os.remove(zip_dir)
check_call(f"zip {zip_dir} {FOLDER}/*", shell=True)
