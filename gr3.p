#set terminal postscript eps enhanced color size 3.9,2.9
set term postscript eps enhanced monochrome 20 dashed dashlength 1 lw 1.5
set output "gr3_1.eps"

set key font ",10"
set xtics font ",10"
set ytics font ",10"
set ylabel font ",10"
set xlabel font ",10"
set xlabel "Number of Elements"
set ylabel "Average Speedup"
set ytic auto
set boxwidth 1 relative
set style data histograms
set style histogram cluster
set style fill pattern border
plot 't11.txt' u 2:xticlabels(1) title "Thread 1",\
'' u 3 title "Thread 2" fillstyle pattern 7,\
'' u 4 title "Thread 4" fillstyle pattern 12,\
'' u 5 title "Thread 8" fillstyle pattern 14,\
'' u 6 title "Thread 16" fillstyle pattern 15

set terminal postscript eps enhanced color size 3.9,2.9
set output "gr3_2.eps"
plot 't11.txt' u 2:xticlabels(1) title "Thread 1",\
'' u 3 title "Thread 2" fillstyle pattern 7,\
'' u 4 title "Thread 4" fillstyle pattern 12,\
'' u 5 title "Thread 8" fillstyle pattern 14,\
'' u 6 title "Thread 16" fillstyle pattern 15

set term postscript eps enhanced monochrome 20 dashed dashlength 1 lw 1.5
set output "gr3_3.eps"
set xtics rotate by -45
set style histogram errorbars lw 3
set style data histogram

plot 't11.txt' u 2:7:xticlabels(1) title "Thread 1",\
'' u 3:8 title "Thread 2" fillstyle pattern 7,\
'' u 4:9 title "Thread 4" fillstyle pattern 12,\
'' u 5:10 title "Thread 8" fillstyle pattern 14,\
'' u 6:11 title "Thread 16" fillstyle pattern 15
