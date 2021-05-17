TEXFILE=Presentation

STYLES = $(shell echo *.sty)

$(TEXFILE).pdf: $(TEXFILE).tex
	pdflatex -interaction=nonstopmode $(TEXFILE)
	pdflatex -interaction=nonstopmode $(TEXFILE)

clean:
	rm $(TEXFILE).aux $(TEXFILE).log $(TEXFILE).nav $(TEXFILE).out $(TEXFILE).snm $(TEXFILE).toc $(TEXFILE).vrb $(TEXFILE).pdf
