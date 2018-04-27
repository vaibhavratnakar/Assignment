# _*_ MakeFile _*_

App:prog.o thread_function.o
	gcc prog.o thread_function.o -o App -lpthread -lm

prog.o:prog.c common.h
	gcc -I. -c prog.c -lpthread -lm

thread_function.o:thread_function.c common.h
	gcc -I. -c thread_function.c -lpthread -lm

runtest:App params.txt threads.txt log.sh
	./log.sh params.txt threads.txt > runtest

analyse:App params.txt threads.txt gen.py runtest
	python gen.py runtest params.txt > analyse

plot:analyse gr1_1.eps gr2.eps gr3_1.eps
	echo Plotted > plot

gr1_1.eps:analyse gr1.p
	gnuplot gr1.p

gr2.eps:analyse gr2.p
	gnuplot gr2.p

gr3_1.eps:analyse gr3.p
	gnuplot gr3.p
	
report:plot report.tex
	./rep.sh

clean:
	rm -f *.o App runtest analyse *.eps *converted-to.pdf
	rm report plot report.log report.dvi report.pdf report.aux
	rm t1.txt t2.txt t3.txt t4.txt t5.txt t6.txt t7.txt t8.txt
	rm t9.txt t10.txt t11.txt















