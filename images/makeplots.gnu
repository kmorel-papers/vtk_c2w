#!/usr/bin/gnuplot

#set terminal postscript eps color
#set output "scaling_icet.eps"
#set output "| gs"

# set data style lines
# set xlabel "Geometry Size (Millions of triangles)"
# set ylabel "Rendering Speed (Millions of triangles per second)"

# set title 'ICE-T Performance on 64 Processors'
# plot	'scaling_icet.dat' index 2					\
# 		using ($1/1000000):($2/1000000) '%lf,%*lf,%lf'		\
# 		title "1x1 Tiles",					\
# 	'scaling_icet.dat' index 3					\
# 		using ($1/1000000):($2/1000000) '%lf,%*lf,%lf'		\
# 		title "4x4 Tiles",					\
# 	'scaling_icet.dat' index 4					\
# 		using ($1/1000000):($2/1000000) '%lf,%*lf,%lf'		\
# 		title "12x4 Tiles" ,\
# 	'scaling_icet.dat' index 0					\
# 		using ($1/1000000):($2/1000000) '%lf,%*lf,%lf'		\
# 		title "1x1 Tiles",					\
# 	'scaling_icet.dat' index 1					\
# 		using ($1/1000000):($2/1000000) '%lf,%*lf,%lf'		\
# 		title "4x4 Tiles",					\
# 	'scaling_icet.dat' index 5					\
# 		using ($1/1000000):($2/1000000) '%lf,%*lf,%lf'		\
# 		title "1x1 Tiles",					\
# 	'scaling_icet.dat' index 6					\
# 		using ($1/1000000):($2/1000000) '%lf,%*lf,%lf'		\
# 		title "4x4 Tiles",					\
# 	'scaling_icet.dat' index 7					\
# 		using ($1/1000000):($2/1000000) '%lf,%*lf,%lf'		\
# 		title "12x4 Tiles"

# pause -1 "Press <enter> to continue."

set terminal postscript eps color
#set output "scaling_icet.eps"
#set output "| gs"

set data style linespoints
set pointsize 1.5
set size 0.75, 0.75

# -----------------------------------------------------------------------------

set output "scaling_icet_strong.eps"
set title 'Sort-Last Strong Scaling'
set xlabel "Number of Processors"
set ylabel "Rendering Speed (Millions of triangles per second)"
set xtics 16
set xrange [16:128]
set rmargin 9
set label 1 " 1 Tile" at 128, 446 left
set label 16 " 16 Tiles" at 128, 372 left
set label 48 " 48 Tiles" at 128, 160 left
set label 99 " VTK" at 128, 320 left
set nokey
plot	'scaling_icet_strong.dat' index 0				\
		using 4:($3/1000000) '%lf,%lf,%lf,%lf'			\
		title "1x1 Tiles",					\
	'scaling_icet_strong.dat' index 1				\
		using 4:($3/1000000) '%lf,%lf,%lf,%lf'			\
		title "4x4 Tiles",					\
	'scaling_icet_strong.dat' index 2				\
		using 4:($3/1000000) '%lf,%lf,%lf,%lf'			\
		title "12x4 Tiles",					\
	'scaling_icet_strong.dat' index 3				\
		using 4:($3/1000000) '%lf,%lf,%lf,%lf'			\
		title "VTK Composite"

# pause -1 "Press <enter> to continue."

# -----------------------------------------------------------------------------

set output "scaling_icet_weak.eps"
set title 'Sort-Last Weak Scaling'
set xlabel "Number of Processors"
set ylabel "Rendering Speed (Millions of triangles per second)"
set xtics 16
set xrange [16:128]
set rmargin 9
set label 1 " 1 Tile" at 128, 579 left
set label 16 " 16 Tiles" at 128, 488 left
set label 48 " 48 Tiles" at 128, 164 left
set label 99 " VTK" at 128, 353 left
set nokey
plot	'scaling_icet_weak.dat' index 0					\
		using 4:($3/1000000) '%lf,%lf,%lf,%lf'			\
		title "1x1 Tiles",					\
	'scaling_icet_weak.dat' index 1					\
		using 4:($3/1000000) '%lf,%lf,%lf,%lf'			\
		title "4x4 Tiles",					\
	'scaling_icet_weak.dat' index 2					\
		using 4:($3/1000000) '%lf,%lf,%lf,%lf'			\
		title "12x4 Tiles",					\
	'scaling_icet_weak.dat' index 3					\
		using 4:($3/1000000) '%lf,%lf,%lf,%lf'			\
		title "VTK Composite"

# pause -1 "Press <enter> to continue."

# -----------------------------------------------------------------------------

set output "scaling_chromium.eps"
set title 'Sort-First Weak Scaling'
set xlabel "Number of Application Processors"
set ylabel "Rendering Speed (Millions of triangles per second)"
set xtics autofreq
set autoscale x
set rmargin 9
set label 4 " 4 Tiles" at 8, .29 left
set label 16 " 16 Tiles" at 8, .24 left
set label 48 " 48 Tiles" at 8, .22 left
set nokey
plot	'scaling_chromium.dat' index 0					\
		using 4:($3/1000000) '%lf,%lf,%lf,%lf'			\
		title "2x2 Tiles",					\
	'scaling_chromium.dat' index 1					\
		using 4:($3/1000000) '%lf,%lf,%lf,%lf'			\
		title "4x4 Tiles",					\
	'scaling_chromium.dat' index 2					\
		using 4:($3/1000000) '%lf,%lf,%lf,%lf'			\
		title "12x4 Tiles"

# pause -1 "Press <enter> to continue."
