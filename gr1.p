set term postscript eps enhanced monochrome 20 dashed dashlength 1 lw 1.5
set terminal postscript eps enhanced color

set key samplen 2 spacing 1 font ",22"

set xtics font ",22"
set ytics font ",22"
set ylabel font ",25"
set xlabel font ",25"

set xlabel "Number of Elements"
set ylabel "Time in Microseconds"
set ytic auto
set xtic auto
set logscale x

set output "gr1_1.eps"
plot 't1.txt' using 1:2 with points pt 1 ps 1.5 lc rgb "violet" notitle
set output "gr1_2.eps"
plot 't2.txt' using 1:2 with points pt 1 ps 1.5 lc rgb "red" notitle
set output "gr1_3.eps"
plot 't3.txt' using 1:2 with points pt 1 ps 1.5 lc rgb "orange" notitle
set output "gr1_4.eps"
plot 't4.txt' using 1:2 with points pt 1 ps 1.5 lc rgb "yellow" notitle
set output "gr1_5.eps"
plot 't5.txt' using 1:2 with points pt 1 ps 1.5 lc rgb "green" notitle

