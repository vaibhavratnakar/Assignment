#!/usr/bin/python
import sys
nb = sys.argv[1]
b = sys.argv[2]
b = int(b)
neg=0
if(nb[0]=='-'):
    nb=nb[1:]
    neg=1
length=len(nb)
print length
dict={'0':0,'1':1,'2':2,'3':3,'4':4,'5':5,'6':6,'7':7,'8':8,'9':9,'A':10,'B':11,'C':12,
 'D':13,'E':14,'F':15,'G':16,'H':17,'I':18,'J':19,'K':20,'L':21,'M':22,'N':23,'O':24,
      'P':25,'Q':26,'R':27,'S':28,'T':29,'U':30,'V':31,'W':32,'X':33,'Y':34,'Z':35
    }
count=0
flag=1
for i in range(0,length):
    x=ord(nb[i])
    if(x>=48 and x<=57):
        flag=1
    elif(x==46):
        count+=1
        flag=1
    elif(x>=65 and x<=90 and dict[nb[i]]<b):
        flag=1
    else:
        flag=0
        break
if(flag==0 or count>=2):
    print "invalid input"
elif(nb[length-1]=='.'):
    print "invalid input"
else:
    left=0
    right=0
    i=0
    while(i<length):
        if(nb[i]=='.'):
            break
        i+=1
    if(i==0):
        for j in range(1,length):
            right=right+dict[nb[j]]*1.0/(b**j)
        if(neg==0):
            print right
        else:
            print right*-1
    elif(i==length):
        j=length-1
        while(j>=0):
            left=left+dict[nb[j]]*(b**(length-1-j))
            j-=1
        if(neg==0):
            print left
        else:
            print left*-1
    else:
        j=i-1
        while(j>=0):
            left=left+dict[nb[j]]*(b**(i-1-j))
            j-=1
        j=i+1
        while(j<length):
            right=right+dict[nb[j]]*1.0/(b**(j-i))
            j=j+1
        result=(left+right)
        if(neg==0):
            print result
        else:
            print result*-1
