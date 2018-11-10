# makefile for pdflatex
LATEX=xelatex

pki-introduction.pdf: pki-introduction.tex
	while ($(LATEX) $< ; \
	grep -q "Rerun to get" pki-introduction.log ) do true ; \
	done

pdf: pki-introduction.pdf
	xreader pki-introduction.pdf

presentation: pki-introduction.pdf
	pdfpc --duration=45 --disable-compression --disable-auto-grouping --notes right pki-introduction.pdf

clean:
	rm -f *.pdf *.aux *.log *.out *.toc *.nav *.snm
