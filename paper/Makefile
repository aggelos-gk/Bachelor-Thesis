MAIN ?= main
PDF := $(MAIN).pdf
LATEX ?= pdflatex
BIBTEX ?= bibtex
TEXFLAGS := -interaction=nonstopmode -halt-on-error
DEPS := $(MAIN).tex report1col.cls refs.bib $(wildcard sections/*.tex) $(wildcard figures/*)

.PHONY: all clean

all: $(PDF)

$(PDF): $(DEPS)
	$(LATEX) $(TEXFLAGS) $(MAIN).tex
	$(BIBTEX) $(MAIN)
	$(LATEX) $(TEXFLAGS) $(MAIN).tex
	$(LATEX) $(TEXFLAGS) $(MAIN).tex

clean:
	rm -f *.aux *.bbl *.bcf *.blg *.fdb_latexmk *.fls *.log *.out *.run.xml *.toc *.pdf
