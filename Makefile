# -*- Makefile -*-

TARGET = vtkicet

LATEX_FLAGS	= -interaction=nonstopmode
BIBTEX_FLAGS	=

.SUFFIXES:
.SUFFIXES: .tex .dvi .pdf .ps

.tex.dvi:
	rm -f $*.aux
	@echo "[[ Finding Bibliography citings. ]]"
	-latex $(LATEX_FLAGS) $<
	@echo "[[[ Building Bibliography Database. ]]]"
	bibtex $(BIBTEX_FLAGS) $*
	@echo "[[ Building Numbering. ]]"
	-latex $(LATEX_FLAGS) $<
	@echo "[[[ Final LATEX Run ]]]"
	latex $(LATEX_FLAGS) $<

.tex.pdf:
	rm -f $*.aux
	@echo "[[ Finding Bibliography citings. ]]"
	-pdflatex $(LATEX_FLAGS) $<
	@echo "[[[ Building Bibliography Database. ]]]"
	bibtex $(BIBTEX_FLAGS) $*
	@echo "[[ Building Numbering. ]]"
	-pdflatex $(LATEX_FLAGS) $<
	@echo "[[[ Final LATEX Run ]]]"
	pdflatex $(LATEX_FLAGS) $<

quick: .final

it: $(TARGET).dvi

pdf: $(TARGET).pdf

$(TARGET).aux:
	@echo "[[ Finding Bibliography citings. ]]"
	pdflatex $(LATEX_FLAGS) $(TARGET).tex

.bibcite:
	@echo "[[ Finding Bibliography citings. ]]"
	pdflatex $(LATEX_FLAGS) $(TARGET).tex
	touch .bibcite

$(TARGET).bbl: $(TARGET).bib $(TARGET).aux
	@echo "[[[ Building Bibliography Database. ]]]"
	bibtex $(BIBTEX_FLAGS) $(TARGET)

.bibentries: .bibcite
	@echo "[[[ Building Bibliography Database. ]]]"
	bibtex $(BIBTEX_FLAGS) $(TARGET)
	touch .bibentries

.numbering: .bibentries
	@echo "[[ Building Numbering ]]"
	pdflatex $(LATEX_FLAGS) $(TARGET).tex
	touch .numbering

.final: .numbering $(TARGET).bbl $(TARGET).tex
	@echo "[[[ Final LaTex Run ]]]"
	pdflatex $(LATEX_FLAGS) $(TARGET).tex
	touch .final

$(TARGET).dvi: $(TARGET).tex $(TARGET).bib
$(TARGET).pdf: $(TARGET).tex $(TARGET).bib

clean:
	rm -f $(TARGET).aux $(TARGET).log $(TARGET).bbl $(TARGET).blg
	rm -f $(TARGET).out $(TARGET).dvi $(TARGET).pdf $(TARGET).ps
	rm -f .bibcite .bibentries .numbering .final
	rm -f *~
