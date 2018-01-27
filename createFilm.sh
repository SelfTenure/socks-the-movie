#!/bin/bash

#create the .pdf 
pdflatex Film.tex

# split the .pdf up in single paged documents
pdftk Film.pdf burst output Frame-%03d.pdf


# convert to .png files using inkscape. (when it comes to the conversion of vector graphics to bitmaps, inkscape leads to better results than imagemagick's "convert")
for i in Frame-*.pdf
do
	inkscape ${i} --export-height=216 -e ${i/pdf/png}
done

# remove old files
rm Frame-*.pdf

# remove old version of movie
rm Presentation.mov

# use single frames to create movie file 
avconv -framerate 0.3 -f image2 -i Frame-%03d.png -r 25 Presentation.mov

# maybe, you'd also like a .gif?
convert -delay 200 -loop 1 *.png Presentation.gif

# remove old files
rm Frame-*.png

