<!DOCTYPE html>
<html>
<head>
<link href="stylesheet.css" type="text/css" rel="stylesheet" >
</head>
<body>

<?php
	$pdo = new PDO('mysql:host=localhost;dbname=conference_database', "root", "");

	echo "<h2>Students</h2>";
	echo "<table border><tr><th>First Name</th><th>Last Name</th><th>email</th><th>Room Number</th></tr>";

	$sql = "select fname, lname, email, roomnumber from student";
	$stmt = $pdo->prepare($sql);
	$stmt->execute();

	while ($row = $stmt->fetch())  {
		echo "<tr><td>".$row["fname"]."</td><td>".$row["lname"]."</td><td>".$row["email"]."</td><td>".$row["roomnumber"]."</td></tr>";
	}
	echo "</table>";

	echo "<h2>Professionals</h2>";
	echo "<table border><tr><th>First Name</th><th>Last Name</th><th>email</th></tr>";

	$sql = "select fname, lname, email from professional";
	$stmt = $pdo->prepare($sql);
	$stmt->execute();

	while ($row = $stmt->fetch())  {
		echo "<tr><td>".$row["fname"]."</td><td>".$row["lname"]."</td><td>".$row["email"]."</td></tr>";
	}
	echo "</table>";
	
	echo "<h2>Sponsors</h2>";
	echo "<table border><tr><th>First Name</th><th>Last Name</th><th>email</th><th>Company</th></tr>";

	$sql = "select fname, lname, email, representing from sponsor";
	$stmt = $pdo->prepare($sql);
	$stmt->execute();

	while ($row = $stmt->fetch())  {
		echo "<tr><td>".$row["fname"]."</td><td>".$row["lname"]."</td><td>".$row["email"]."</td><td>".$row["representing"]."</td></tr>";
	}
	echo "</table>";
?>

<p><a href="attendees.html">Back</a></p>

</body>
</html> 