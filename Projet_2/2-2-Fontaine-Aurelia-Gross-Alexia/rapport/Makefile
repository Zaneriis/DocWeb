TEXFILE=Rapport

STYLES = $(shell echo *.sty)

$(TEXFILE).pdf: $(TEXFILE).tex
	pdflatex -interaction=nonstopmode $(TEXFILE)
	pdflatex -interaction=nonstopmode $(TEXFILE)

clean:
	rm Rapport.pdf Rapport.aux Rapport.log Rapport.out Rapport.toc
