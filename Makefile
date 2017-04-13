main:all

all:template.tex
	latexmk -xelatex -shell-escape template.tex

simplest:simplest.tex
	latexmk -xelatex simplest.tex

clean:
	rm -f *.aux *.bbl *.blg *.log *.out *.toc *.bcf *.xml *~
