#!/bin/sh

# Makes pdf files from eps files.
for epsfile in *.eps ; do
    echo "$epsfile ..."
    epstopdf $epsfile
done
