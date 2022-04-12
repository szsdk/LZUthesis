main: simplest

all: doc simplest

doc:doc.tex
	latexmk -xelatex --shell-escape doc.tex
	cp build/doc.pdf ./

simplest:simplest.tex
	latexmk -xelatex simplest.tex

clean:
	rm build -fr
