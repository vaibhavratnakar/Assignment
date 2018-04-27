#!/bin/bash
while read line2
do
	t_arr=$(echo $line2 | tr " " "\n")
	while read line1
	do
		n_arr=$(echo $line1 | tr " " "\n")
		for y in $t_arr
		do
			for x in $n_arr
			do
				#echo "elements:" $x "threads:" $y
				l=0
				while [ $l -lt 100 ]; do
					./App $x $y
					let l=l+1
				done
			done
		done
	done <$1
done <$2

