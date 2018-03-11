main: simplest

all: doc simplest

doc:doc.tex
	latexmk -xelatex -shell-escape doc.tex

simplest:simplest.tex
	latexmk -xelatex simplest.tex

clean:
	rm -f *.aux *.bbl *.blg *.log *.out *.toc *.bcf *.xml *~ *.pyg *.xdv *.thm\
			*.fls *.fdb_latexmk
