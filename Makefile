# -*- Makefile -*-

TARGET = vtk_c2w

LATEX_FLAGS	= -interaction=nonstopmode
BIBTEX_FLAGS	=

LATEX = latex
BIBTEX	= bibtex

.SUFFIXES:
.SUFFIXES: .tex .dvi .ps .pdf

it: .final

$(TARGET).aux:
	(cd images ; ${MAKE} ps)
	@echo "[[ Finding Bibliography citings. ]]"
	$(LATEX) $(LATEX_FLAGS) $(TARGET).tex

.bibcite:
	(cd images ; ${MAKE} ps)
	@echo "[[ Finding Bibliography citings. ]]"
	$(LATEX) $(LATEX_FLAGS) $(TARGET).tex
	touch .bibcite

$(TARGET).bbl: $(TARGET).bib $(TARGET).aux
	@echo "[[[ Building Bibliography Database. ]]]"
	$(BIBTEX) $(BIBTEX_FLAGS) $(TARGET)

.bibentries: .bibcite
	@echo "[[[ Building Bibliography Database. ]]]"
	$(BIBTEX) $(BIBTEX_FLAGS) $(TARGET)
	touch .bibentries

.numbering: .bibentries
	@echo "[[ Building Numbering ]]"
	$(LATEX) $(LATEX_FLAGS) $(TARGET).tex
	touch .numbering

.final: .numbering $(TARGET).bbl $(TARGET).tex
	@echo "[[[ Final LaTex Run ]]]"
	$(LATEX) $(LATEX_FLAGS) $(TARGET).tex
	touch .final

ps: $(TARGET).ps

$(TARGET).ps: .final
	@echo "[[[ Converting dvi to ps ]]]"
	dvips -Ppdf -G0 -t letter -o $(TARGET).ps $(TARGET).dvi

pdf: $(TARGET).pdf

.ps.pdf:
	@echo "[[[ Converting ps to pdf ]]]"
	ps2pdf -dMaxSubsetPct=100 -dCompatibilityLevel=1.3 \
         -dSubsetFonts=true -dEmbedAllFonts=true \
         -dAutoFilterColorImages=true \
         -dAutoFilterGrayImages=false \
         -dColorImageFilter=/FlateEncode \
         -dGrayImageFilter=/FlateEncode \
         -dMonoImageFilter=/FlateEncode  $< $@

clean:
	(cd images ; ${MAKE} clean)
	rm -f $(TARGET).aux $(TARGET).log $(TARGET).bbl $(TARGET).blg
	rm -f $(TARGET).out $(TARGET).dvi $(TARGET).pdf $(TARGET).ps
	rm -f .bibcite .bibentries .numbering .final
	rm -f *~
