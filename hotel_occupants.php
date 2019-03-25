<!DOCTYPE html>
<html>
<head>
<link href="stylesheet.css" type="text/css" rel="stylesheet" >
</head>
<body>

<?php
	$pdo = new PDO('mysql:host=localhost;dbname=conference_database', "root", "");
	$roomNumber = $_POST["roomNumber"];
	
	echo "<h2>Room $roomNumber</h2>";
	
	$stmt = $pdo->prepare("select count(fname) as occupancy from Student where roomnumber = :roomNumber");
	$stmt->execute([':roomNumber' => $roomNumber]);
	$occupancy = $stmt->fetch()["occupancy"];
	
	if($occupancy < 1) {
		
		echo "<p>There are no students in this room.</p>";
	}
	else {
		
		echo "<table border><tr><th>First Name</th><th>Last Name</th></tr>";

		$sql = "select fname, lname from student where roomnumber = :roomNumber";
		$stmt = $pdo->prepare($sql);
		$stmt->execute(['roomNumber' => $roomNumber]);

		while ($row = $stmt->fetch())  {
			echo "<tr><td>".$row["fname"]."</td><td>".$row["lname"]."</td></tr>";
		}
		echo "</table>";
	}
?>

<p><a href="attendees.php">Back</a></p>

</body>
</html> 
