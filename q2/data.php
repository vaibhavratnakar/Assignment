<!DOCTYPE html>
<html>
<head>
</head>
<body>
<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
<right><input type="button" value="Another Registration" onClick="window.location='reg.php';"></right>
</form>
<?php
	$db = new SQLite3('mydatabase.db');
	$results = $db->query("select * from reg_data");
	echo"<table border='1'>";
	echo"<tr><td>Name</td><td>Address</td><td>Email</td><td>Mobile</td></tr>";
	while ($row = $results->fetchArray()) {
	    echo "<tr><td>{$row[0]}</td><td>{$row[1]}</td><td>{$row[2]}</td><td>{$row[3]}</td></tr>";
	}
?>
</body>
