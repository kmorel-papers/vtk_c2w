# -*- makefile -*-

# This makefile relies on the convert program provided by imagemagic, available
# at http://www.imagemagick.org

.SUFFIXES: .eps .png .pdf

EPSFILES =			\
	FullWall.eps		\
	PhilwBlob.eps

PDFFILES =					\
	AppLayers.pdf				\
	DesktopDeliveryInteraction.pdf		\
	ParallelRenderManagerInteraction.pdf	\
	scaling_chromium.pdf			\
	scaling_icet_weak.pdf

.png.eps:
	@echo "[[ Converting $< to $@ ]]"
	convert $< $@

.eps.pdf:
	@echo "[[ Converting $< to $@ ]]"
	convert $< $@

ps: $(EPSFILES)

pdf: ${PDFFILES}

clean:
	rm -f $(EPSFILES) ${PDFFILES}
