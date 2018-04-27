#!/usr/bin/awk
BEGIN {
	c=1
	z=1
}
{
	split($0,a," ")
	ip1=a[3]
	ip2=substr(a[5],1,length(a[5])-1)
	if(c==1)
	{
		IP[1,c]=ip1
		IP[1,c+1]=ip2
		IP[2,c]=-1
		IP[2,c+1]=-1
		c=c+2
	}
	else
	{
		flag=0
		for(l=1;l<c;l=l+2)
		{
			if((ip1==IP[1,l] && ip2==IP[1,l+1]) || (ip1==IP[1,l+1] && ip2==IP[1,l]))
			{
				flag=1;
				break;
			}
		}
		if(flag==0)
		{
			IP[1,c]=ip1
			IP[1,c+1]=ip2
			IP[2,c]=-1
			IP[2,c+1]=-1
			c=c+2
		}
	}
	for(l=1;l<c;l=l+2)
	{
		if(ip1==IP[1,l] && ip2==IP[1,l+1])
		{
			break;
		}
		else if(ip1==IP[1,l+1] && ip2==IP[1,l])
		{
			l=l+1;
			break;
		}
	}
	cs=a[8]
	if(cs=="ack")
	{
		np[l]=np[l]+1
		if(IP[2,l]==-1)
		{
			IP[2,l]=a[1]
			IP[3,l]=a[1]
		}
		else
			IP[3,l]=a[1]
	}
	else
	{
		split(a[9],s,":")
		s[2]=substr(s[2],1,length(s[2])-1)
		if(s[2]=="")
		{	
			s[1]=substr(s[1],1,length(s[1])-1)
			np[l]=np[l]+1
			if(IP[2,l]==-1)
			{
				IP[2,l]=a[1]
				IP[3,l]=a[1]
			}
			else
				IP[3,l]=a[1]
		}		
		else
		{		
			info[z,1]=ip1
			info[z,2]=ip2
			info[z,3]=s[1]
			info[z,4]=s[2]
			z=z+1
			np[l]=np[l]+1
			dp[l]=dp[l]+1
			data[l]=data[l]+s[2]-s[1]
			arr[1]=s[1]
			arr[2]=s[2]
			q=3
			for(x=1;x<z-1;x++)
			{
				if(ip1==info[x,1] && ip2==info[x,2])          
				{
					for(t=1;t<q;t=t+2)
					{
						if(arr[t]>=info[x,4])
							arr[t]=arr[t]
						else if(arr[t]>=info[x,3] && info[x,4]<=arr[t+1])
							arr[t]=info[x,4]
						else if(arr[t]>=info[x,3] && arr[t+1]<info[x,4])
							arr[t]=arr[t+1]
						else if(arr[t+1]<=info[x,3])
							arr[t+1]=arr[t+1]
						else if(arr[t]<info[x,3] && info[x,4]<arr[t+1])
						{
							for(k=q+1;k>=t+3;k--)
							{
								arr[k]=arr[k-2]
							}
							arr[t+1]=info[x,3]
							arr[t+2]=info[x,4]
							q=q+2
						}
						else
							arr[t+1]=info[x,3]
					}
				}
			}
			u=0
			for(x=1;x<q;x=x+2)
			{
				u=u+arr[x+1]-arr[x]
			}
			rdata[l]=rdata[l]+s[2]-s[1]-u;
			thr[l]=thr[l]+u
			if(IP[2,l]==-1)
			{
				IP[2,l]=a[1]
				IP[3,l]=a[1]
			}
			else
				IP[3,l]=a[1]
		}
	}
}
END {
	for(l=1;l<c;l=l+2)
	{
		if(np[l]=="")		np[l]=0
		if(np[l+1]=="")		np[l+1]=0
		if(dp[l]=="")		dp[l]=0
		if(dp[l+1]=="") 	dp[l+1]=0
		if(data[l]=="") 	data[l]=0
		if(data[l+1]=="")	data[l+1]=0
		if(rdata[l]=="")	rdata[l]=0
		if(rdata[l+1]=="")	rdata[l+1]=0
		if(thr[l]=="")		thr[l]=0
		if(thr[l+1]=="")	thr[l+1]=0
		split(IP[2,l],w1,":")
		split(IP[3,l],w2,":")
		if(substr(w1[1],1,1)==0)	w1[1]=substr(w1[1],2,1)
		if(substr(w1[2],1,1)==0)	w1[2]=substr(w1[2],2,1)
		if(substr(w1[3],1,1)==0)	w1[3]=substr(w1[3],2,8)
		if(substr(w2[1],1,1)==0)	w2[1]=substr(w2[1],2,1)
		if(substr(w2[2],1,1)==0)	w2[2]=substr(w2[2],2,1)
		if(substr(w2[3],1,1)==0)	w2[3]=substr(w2[3],2,8)
		time=w2[1]*3600+w2[2]*60+w2[3]-w1[1]*3600-w1[2]*60-w1[3]
		if(time==0)	thr[l]=0
		else		thr[l]=int(thr[l]/time)
		split(IP[2,l+1],w1,":")
		split(IP[3,l+1],w2,":")
		if(substr(w1[1],1,1)==0)	w1[1]=substr(w1[1],2,1)
		if(substr(w1[2],1,1)==0)	w1[2]=substr(w1[2],2,1)
		if(substr(w1[3],1,1)==0)	w1[3]=substr(w1[3],2,8)
		if(substr(w2[1],1,1)==0)	w2[1]=substr(w2[1],2,1)
		if(substr(w2[2],1,1)==0)	w2[2]=substr(w2[2],2,1)
		if(substr(w2[3],1,1)==0)	w2[3]=substr(w2[3],2,8)
		time=w2[1]*3600+w2[2]*60+w2[3]-w1[1]*3600-w1[2]*60-w1[3]
		if(time==0)	thr[l+1]=0
		else		thr[l+1]=int(thr[l+1]/time)
		print "Connection (A="IP[1,l],"B="IP[1,l+1]")"
		print "A-->B #packets="np[l]", #datapackets="dp[l]", #bytes="data[l]", #retrans="rdata[l]" xput="thr[l]" bytes/sec"
		print "B-->A #packets="np[l+1]", #datapackets="dp[l+1]", #bytes="data[l+1]", #retrans="rdata[l+1]" xput="thr[l+1]" bytes/sec"
	}
}
