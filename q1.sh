#!/bin/bash
IFS=$'\n'
zs=0
zc=0
ns=0
nc=0
travel () {
	local num1=0
	local num2=0
	if [ -f "$1" ]; then
		name=$(basename $1)
		if [ ${name: -2} == .c ]; then
			str=$(awk -f "qn2.awk" $1)
			ns=$(cut -d' ' -f1 <<< "$str")
			nc=$(cut -d' ' -f2 <<< "$str")
		fi
	else
		for i in $(ls $1); do
			travel $1/$i $(($2+1))
			let num1=num1+$ns
			let num2=num2+$nc
			ns=0
			nc=0
		done
		ns=$num1
		nc=$num2
	fi	
	if [ $2 == 0 ]; then
		zs=$num1
		zc=$num2
	fi
}
depth=0
travel $1 $depth
echo $zs "strings"
echo $zc "comments"
