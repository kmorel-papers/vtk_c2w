# -*- makefile -*-

# This makefile relies on the convert program provided by imagemagic, available
# at http://www.imagemagick.org

.SUFFIXES: .eps .png

EPSFILES =			\
	FullWall.eps		\
	PhilwBlob.eps

.png.eps:
	@echo "[[ Converting $< to $@ ]]"
	convert $< $@

ps: $(EPSFILES)

clean:
	rm -f $(EPSFILES)
