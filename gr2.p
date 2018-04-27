#set term postscript eps enhanced monochrome 20 dashed dashlength 1 lw 1.5
set terminal postscript eps enhanced color

set key samplen 2 spacing 1.5 font ",22"

set xtics font ",10"
set ytics font ",10"
set ylabel font ",10"
set xlabel font ",10"

set xlabel "Number of Elements"
set ylabel "Average Time"
set ytic auto
set xtic auto
set logscale x

set key top left

set output "gr2.eps"
plot 't6.txt' using 1:2 title "Threads 1" with linespoints, \
     't7.txt' using 1:2 title "Threads 2" with linespoints pt 5 lc 2,\
     't8.txt' using 1:2 title "Threads 4" with linespoints lc 7, \
     't9.txt' using 1:2 title "Threads 8" with linespoints lc 4, \
     't10.txt' using 1:2 title "Threads 16" with linespoints lc 1

#set key top right
#set output "musage_single_line.eps"
#plot 'usage.out' using 1:($2/256) title "Application 1" with lines lw 2
