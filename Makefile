main: simplest

all: doc simplest

doc:doc.tex
	latexmk --quiet doc.tex

simplest:simplest.tex
	latexmk --quiet simplest.tex

clean:
	rm -fr build
