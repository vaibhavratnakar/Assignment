function validate(){
	var t1=document.reg_form.name.value;
	var t2=document.reg_form.address.value;
	var t3=document.reg_form.email.value;
	var t4=document.reg_form.mobile.value.toString();
	var t5=document.reg_form.account.value;
	var t6=document.reg_form.password.value;
	document.getElementById("Message_1").innerHTML="";
	document.getElementById("Message_2").innerHTML="";
	document.getElementById("Message_3").innerHTML="";
	document.getElementById("Message_4").innerHTML="";
	document.getElementById("Message_5").innerHTML="";
	document.getElementById("Message_6").innerHTML="";
	var flag=1;
	// Check Name
	if(t1.length==0){
		document.getElementById("Message_1").innerHTML="Cannot be Empty!!";
		flag=0;
	}else if(t1.length>20){
		document.getElementById("Message_1").innerHTML="Too Long!!";
		flag=0;
	}else{
	    for(x=0;x<t1.length;x++){
	      var y=t1.charCodeAt(x);
	      if(!(y==32 || (y>=65 && y<=90) || (y>=97 && y<=122)))
	      {
	      document.getElementById("Message_1").innerHTML="Name should contain letters and spaces only";
	      flag=0;
	      break;
	      }
	    }
	}

	// Check Address
	if(t2.length==0){
		document.getElementById("Message_2").innerHTML="Cannot be Empty!!";
		flag=0;
	}else if(t2.length>100){
		document.getElementById("Message_2").innerHTML="Too Long!!";
		flag=0;
	}

	// Check Email
	if(t3.length==0){
		document.getElementById("Message_3").innerHTML="Cannot be Empty!!";
		flag=0;
	}else if(t3.charAt(0)=='@' || t3.length<7){
		document.getElementById("Message_3").innerHTML="Invalid Email";
		flag=0;
	}else{
		if(!((t3.charAt(t3.length-1)=='m') && (t3.charAt(t3.length-2))=='o' && (t3.charAt(t3.length-3))=='c' && (t3.charAt(t3.length-4))=='.')){
			document.getElementById("Message_3").innerHTML="Invalid Email";
			flag=0;
		}else{
			var count=0;
			var index=0;
			for(x=0;x<t3.length-4;x++){
				if(t3.charAt(x)=='@'){
					count=count+1;
					index=x;
				}
			}
			if(count==1 && index!=t3.length-5){
				for(x=0;x<index;x++){
					var y=t3.charCodeAt(x);
					if(!((y>=65 && y<=90) || (y>=97 && y<=122))){
						document.getElementById("Message_3").innerHTML="Invalid Email";
						flag=0;
						break;
					}
				}
			}else{
				document.getElementById("Message_3").innerHTML="Invalid Email";
				flag=0;
			}
		}
	}
	// Check Mobile
	if(t4.length==0){
		document.getElementById("Message_4").innerHTML="Cannot be Empty!!";
		flag=0;
	}else if(t4.length!=10 || t4.charAt(0)=='0'){
		document.getElementById("Message_4").innerHTML="Invalid Mobile Number";
		flag=0;
	}else{
		for(x=0;x<t4.length;x++){
	     		var y=t4.charCodeAt(x);
			if(!(y>=48 && y<=57)){
				document.getElementById("Message_4").innerHTML="Invalid Mobile Number";
				flag=0;
				break;
			}
	    	}
	}
	// Check Account
	if(t5.length==0){
		document.getElementById("Message_5").innerHTML="Cannot be Empty!!";
		flag=0;
	}else if(t5.length!=5){
		document.getElementById("Message_5").innerHTML="Invalid Account Number";
		flag=0;
	}else{
		for(x=0;x<t5.length;x++){
	     		var y=t5.charCodeAt(x);
			if(!(y>=48 && y<=57)){
				document.getElementById("Message_5").innerHTML="Invalid Account Number";
				flag=0;
				break;
			}
	    	}
	}

	// Check Password
	if(t6.length==0){
		document.getElementById("Message_6").innerHTML="Cannot be Empty!!";
		flag=0;
	}else if(t6.length>20){
		document.getElementById("Message_6").innerHTML="Invalid Password";
		flag=0;
	}else{
		for(x=0;x<t6.length;x++){
	     		var y=t6.charCodeAt(x);
			if(!((y>=48 && y<=57) || (y>=65 && y<=90) || (y>=97 && y<=122))){
				document.getElementById("Message_6").innerHTML="Invalid Password";
				flag=0;
				break;
			}
	    	}
	}
	if(flag==1){
		return true;
	}else{
		return false;
	}
}
