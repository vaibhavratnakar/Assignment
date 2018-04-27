#!/usr/bin/python
import os
import sys
import numpy as np
import matplotlib.pyplot as plt
import csv
import math
mode = 'r'
fo = open('train.csv',mode)
readCSV = csv.reader(fo,delimiter=',')
n_train=0
for row in readCSV:
	n_train+=1
n_train-=1;
x_train = np.zeros(shape=(n_train,1))
y_train = np.zeros(shape=(n_train,1))
x_data = np.zeros(shape=(n_train,1))
counter = 0
fo.seek(0)
readCSV = csv.reader(fo,delimiter=',')
control = 0
for row in readCSV:
	if(control==0):
		control = 1
		continue
	x_data[counter,0] = float(row[0])
	x_train[counter,0] = float(row[0])
	y_train[counter,0] = float(row[1])
	counter+=1
temp = np.zeros(shape=(n_train,1))
counter = 0
while(counter<n_train):
	temp[counter,0] = x_train[counter,0]
	x_train[counter,0] = 1
	counter+=1
x_train = np.append(x_train,temp,axis=1)
w = np.random.rand(2,1)
counter = 0
a_train = np.zeros(shape=(n_train,1))
while(counter<n_train):
	a_train[counter] = w[0,0] + w[1,0] * x_train[counter,1]
	counter+=1
plt.plot(x_data,y_train,'bo')
plt.plot(x_data,a_train,'g')
plt.show()
arr1 = x_train.transpose()
arr2 = np.linalg.inv(arr1.dot(x_train))
w_direct = (arr2.dot(arr1)).dot(y_train)
counter = 0
while(counter<n_train):
	a_train[counter] = w_direct[0,0] + w_direct[1,0] * x_train[counter,1]
	counter+=1
plt.plot(x_data,y_train,'bo')
plt.plot(x_data,a_train,'g')
plt.show()
n = 2
eta = 0.00000001
for nepoch in range(1,n+1):
	for j in range(0,n_train):
		w[0,0] = w[0,0]-eta*(w[0,0]+w[1,0]*x_data[j,0]-y_train[j,0])
		w[1,0] = w[1,0]-eta*(w[0,0]+w[1,0]*x_data[j,0]-y_train[j,0])*x_data[j,0]
		if(j%100==0):
			counter=0
			while(counter<n_train):
				a_train[counter] = w[0,0] + w[1,0] * x_train[counter,1]
				counter+=1
			plt.plot(x_data,a_train,'g')
counter=0
while(counter<n_train):
	a_train[counter] = w[0,0] + w[1,0] * x_train[counter,1]
	counter+=1
plt.plot(x_data,y_train,'bo')
plt.plot(x_data,a_train,'g')
plt.show()
fo.close()
fo = open('test.csv',mode)
readCSV = csv.reader(fo,delimiter=',')
n_test=0
for row in readCSV:
	n_test+=1
n_test-=1;
x_test = np.zeros(shape=(n_test,1))
y_test = np.zeros(shape=(n_test,1))
x_data = np.zeros(shape=(n_test,1))
counter = 0
fo.seek(0)
readCSV = csv.reader(fo,delimiter=',')
control = 0
for row in readCSV:
	if(control==0):
		control = 1
		continue
	x_data[counter,0] = float(row[0])
	x_test[counter,0] = float(row[0])
	y_test[counter,0] = float(row[1])
	counter+=1
temp = np.zeros(shape=(n_test,1))
counter = 0
while(counter<n_test):
	temp[counter,0] = x_test[counter,0]
	x_test[counter,0] = 1
	counter+=1
x_test = np.append(x_test,temp,axis=1)
y_pred1 = x_test.dot(w)
y_pred2 = x_test.dot(w_direct)
counter = 0
error = 0
while(counter<n_test):
	error = error + (y_pred1[counter]-y_test[counter])**2
	counter+=1
error = math.sqrt(error*1.0/n_test)
print error
counter = 0
error = 0
while(counter<n_test):
	error = error + (y_pred2[counter]-y_test[counter])**2
	counter+=1
error = math.sqrt(error*1.0/n_test)
print error
