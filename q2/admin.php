<!DOCTYPE html>
<html>
<head>
</head>
<body>

<form name="admin_form" action=data.php onSubmit="return verify()">
	<table>
		<tr>
			<td>
				Admin Login:
			</td>
			<td>
				<input type="text" name="name" value="">
				<span id="Message_1"></span></br>
			</td>
		</tr>
		<tr>
			<td>
				Admin Password:
			</td>
			<td>
				<input type="password" name="password" value="">
				<span id="Message_2"></span></br>
			</td>
		</tr>
	</table>
	<right><input type="submit" value="Submit" onClick="return verify()"></right>
	<right><input type="button" value="Another Registration" onClick="window.location='reg.php';"></right>
</form>
<script>
	function verify(){
		var t1=document.admin_form.name.value;
		var t2=document.admin_form.password.value;
		if(t1=='abhinav' && t2=='asdfg'){
			return true;
		}else{
			return false;
		}
	}
</script>
</body>
</html>
















