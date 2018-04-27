#!/usr/bin/python
import sys
t1=open('t1.txt','w+')
t2=open('t2.txt','w+')
t3=open('t3.txt','w+')
t4=open('t4.txt','w+')
t5=open('t5.txt','w+')
t6=open('t6.txt','w+')
t7=open('t7.txt','w+')
t8=open('t8.txt','w+')
t9=open('t9.txt','w+')
t10=open('t10.txt','w+')
t11=open('t11.txt','w+')
with open(sys.argv[2],'r') as f:
	num_arr=f.readline()
num_arr=num_arr.strip('\n')
num_arr=num_arr.split(' ')
length= len(num_arr)
with open(sys.argv[1],'r') as f:
	i=1
	while i<=5:
		j=1;
		while j<=length:
			k=1
			sum=0
			N=[]
			while k<=100:
				line=f.readline()
				sum+=(int)(line.split(' ')[3])
				N.append((int)(line.split(' ')[3]))
				if i==1:
					t1.write(num_arr[j-1]+" "+line.split(' ')[3]+"\n")
				elif i==2:
					t2.write(num_arr[j-1]+" "+line.split(' ')[3]+"\n")
				elif i==3:
					t3.write(num_arr[j-1]+" "+line.split(' ')[3]+"\n")
				elif i==4:
					t4.write(num_arr[j-1]+" "+line.split(' ')[3]+"\n")
				elif i==5:
					t5.write(num_arr[j-1]+" "+line.split(' ')[3]+"\n")
				if k==100:
					z=0
					avg=sum/100.0
					variance=0
					while z<100:
						variance+=(N[z]-avg)**2
						z+=1
					variance=variance/100.0
					if i==1:
						t6.write(num_arr[j-1]+" "+" "+(str)(avg)+" "+str(variance)+"\n")
					elif i==2:
						t7.write(num_arr[j-1]+" "+" "+(str)(avg)+" "+str(variance)+"\n")
					elif i==3:
						t8.write(num_arr[j-1]+" "+" "+(str)(avg)+" "+str(variance)+"\n")
					elif i==4:
						t9.write(num_arr[j-1]+" "+" "+(str)(avg)+" "+str(variance)+"\n")
					elif i==5:
						t10.write(num_arr[j-1]+" "+" "+(str)(avg)+" "+str(variance)+"\n")
				k+=1
			j+=1
		i+=1
f.close()
w, h = 12, length;
matrix = [[0 for x in range(w)] for y in range(h)]
t1_avg=1
with open(sys.argv[1],'r') as f:
	i=1
	while i<=5:
		j=1
		while j<=length:
			k=1
			N=[]
			sum=0
			while k<=100:
				line=f.readline()
				sum+=(int)(line.split(' ')[3])
				N.append((int)(line.split(' ')[3]))
				k+=1
			avg=sum/100.0
			z=0
			cal=0
			if i==1:
				matrix[j-1][11]=sum/100.0
			while z<100:
				cal+=(matrix[j-1][11]/N[i]-matrix[j-1][11]/avg)**2
				z+=1
			cal=cal/100.0
			ratio=matrix[j-1][11]/avg
			matrix[j-1][0]=num_arr[j-1]
			if i==1:
				matrix[j-1][1]=ratio
				matrix[j-1][6]=cal
			if i==2:
				matrix[j-1][2]=ratio
				matrix[j-1][7]=cal
			if i==3:
				matrix[j-1][3]=ratio
				matrix[j-1][8]=cal
			if i==4:
				matrix[j-1][4]=ratio
				matrix[j-1][9]=cal
			if i==5:
				matrix[j-1][5]=ratio
				matrix[j-1][10]=cal
			j+=1
		i+=1
i=0
while i<length:
	word=(str)(matrix[i][0])+" "+(str)(matrix[i][1])+" "+(str)(matrix[i][2])+" "+(str)(matrix[i][3])+" "+(str)(matrix[i][4])+" "+(str)(matrix[i][5])+" "+(str)(matrix[i][6])+" "+(str)(matrix[i][7])+" "+(str)(matrix[i][8])+" "+(str)(matrix[i][9])+" "+(str)(matrix[i][10])+"\n"
	t11.write(word)
	i+=1
t1.close()
t2.close()
t3.close()
t4.close()
t5.close()
t6.close()
t7.close()
t8.close()
t9.close()
t10.close()
t11.close()




















print "Analysis Done"








