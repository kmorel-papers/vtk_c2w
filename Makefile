# -*- Makefile -*-

TARGET = vtkicet

LATEX_FLAGS	=
BIBTEX_FLAGS	=

.SUFFIXES:
.SUFFIXES: .tex .dvi .pdf .ps

.tex.dvi:
	rm -f $*.aux
	@echo "[[ Finding Bibliography citings. ]]"
	latex $(LATEX_FLAGS) $<
	@echo "[[[ Building Bibliography Database. ]]]"
	bibtex $(BIBTEX_FLAGS) $*
	@echo "[[ Building Numbering. ]]"
	latex $(LATEX_FLAGS) $<
	@echo "[[[ Final LATEX Run ]]]"
	latex $(LATEX_FLAGS) $<

.tex.pdf:
	rm -f $*.aux
	@echo "[[ Finding Bibliography citings. ]]"
	pdflatex $(LATEX_FLAGS) $<
	@echo "[[[ Building Bibliography Database. ]]]"
	bibtex $(BIBTEX_FLAGS) $*
	@echo "[[ Building Numbering. ]]"
	pdflatex $(LATEX_FLAGS) $<
	@echo "[[[ Final LATEX Run ]]]"
	pdflatex $(LATEX_FLAGS) $<

it: $(TARGET).dvi

pdf: $(TARGET).pdf

$(TARGET).dvi: $(TARGET).tex $(TARGET).bib
$(TARGET).pdf: $(TARGET).tex $(TARGET).bib

clean:
	rm -f $(TARGET).aux $(TARGET).log $(TARGET).bbl $(TARGET).blg
	rm -f $(TARGET).out $(TARGET).dvi $(TARGET).pdf