main:all

all:template.tex
	xelatex template.tex
	biber template
	xelatex template.tex
	xelatex template.tex

clean:
	rm -f *.aux *.bbl *.blg *.log *.out *.toc *.bcf *.xml
