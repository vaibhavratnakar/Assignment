<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<style>
	body {
		background: url('back.jpg');
		background-size: cover;
	}
	</style>
</head>
<body>
<?php
	$str1=$str2=$str3=$str4=$str5="";
	if ($_SERVER["REQUEST_METHOD"] == "POST") {
	  $str1 = "Already Registered";
	  $str2 = "Invalid Account";
	  $str3 = "Invalid Password";
	  $str4 = "Insufficient Balance";
	  $str5 = "Registration Successful";
	}
	$name = $_POST['name'];
	$address = $_POST['address'];
	$email = $_POST['email'];
	$mobile = $_POST['mobile'];
	$account = $_POST['account'];
	$password = $_POST['password'];
	$db = new SQLite3('mydatabase.db');

	$results = $db->query("select * from reg_data where Email='$email'");
	$c = 0;
	while ($row = $results->fetchArray()) {
	    	$c = $c + 1;
	}
	if($c!=0){
		echo $str1;
	}else{
		$results = $db->query("select * from bank where Account='$account'");
		$c = 0;
		while ($row = $results->fetchArray()) {
	    		$c = $c + 1;
			break;
		}
		if($c==0){
			echo $str2;
		}else{
			if($row[1]!=$password){
				echo $str3;
			}else{
				if($row[2]<1000){
					echo $str4;
				}else{
					echo $str5;
					$db->query("update bank set amount=amount-1000 where account='$account'");
					$db->query("insert into reg_data values ('$name','$address','$email','$mobile')");
				}
			}
		}
	}
?>
<h1><center>Let's Build Stuff!!</center></h1>
<form name="reg_form" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" method="post" onSubmit="return validate()">
<table>
	<tr>
		<td>
			Name:
		</td>
		<td>
			<input type="text" name="name" value="">
			<span id="Message_1"></span></br>
		</td>
	</tr>
	<tr>
		<td>
			Address:
		</td>
		<td>
			<input type="text" name="address" value="">
			<span id="Message_2"></span></br>
		</td>
	</tr>
	<tr>
		<td>
			Email:
		</td>
		<td>
			<input type="text" name="email" value="">
			<span id="Message_3"></span></br>
		</td>
	</tr>
	<tr>
		<td>
			Mobile:
		</td>
		<td>
			<input type="text" name="mobile" value="">
			<span id="Message_4"></span></br>
		</td>
	</tr>
	<tr>
		<td>
			Bank A/C:
		</td>
		<td>
			<input type="text" name="account" value="">
			<span id="Message_5"></span></br>
		</td>
	</tr>
	<tr>
		<td>
			Password:
		</td>
		<td>
			<input type="password" name="password" value="">
			<span id="Message_6"></span></br>
		</td>
	</tr>
</table>
<right><input type="submit" value="Submit" onClick="return validate()"></right>
<right><input type="button" value="See All Registrations" onClick="window.location='admin.php';"></right>
</form>
<script src=script.js></script>
</body>
</html>
