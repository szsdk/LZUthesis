main:all

all:template.tex
	xelatex template.tex
	biber template
	xelatex template.tex
	xelatex template.tex

simplest:simplest.tex
	xelatex simplest.tex
	biber simplest
	xelatex simplest.tex
	xelatex simplest.tex

clean:
	rm -f *.aux *.bbl *.blg *.log *.out *.toc *.bcf *.xml
