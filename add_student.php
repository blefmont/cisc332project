<!DOCTYPE html>
<html>
<head>
	<link href="stylesheet.css" type="text/css" rel="stylesheet" >
</head>
<body>

<?php
$fname = $_POST["fname"];                      
$lname = $_POST["lname"];
$email = $_POST["email"];
$roomNumber = $_POST["roomNumber"];

$pdo = new PDO('mysql:host=localhost;dbname=conference_database', "root", "");

if($roomNumber < 1){
	
	$occupancy = -1;
	$roomNumber = null;
}
else {
	
	$sql = "select count(student) from student where roomnumber = ?";
	$stmt = $pdo->prepare($sql);
	$stmt->execute([$roomNumber]);
	$occupancy = $stmt->fetch()
}


if($occupancy > 3) {
	
	echo "<h2>Error</h2>";
	echo "<p>The selected hotel room is full. Please try again with a different hotel room number.</p>";
}
else {
	
	if($occupancy["count(student)"] == 0) {
		
		//add tuple to rooms
		$stmt = $pdo->prepare("insert into Rooms values(:roomNumber,4)");
		$stmt->execute([':roomNumber' => $roomNumber]);
	}
	$stmt = $pdo->prepare("insert into Attendees values(:fname, :lname, :email)");
	$stmt->execute([':fname' => $fname, 'lname' => $lname, 'email' => $email]);
	
	$stmt = $pdo->prepare("insert into Student values(:fname, :lname, :email, :roomNumber)");
	$stmt->execute([':fname' => $fname, 'lname' => $lname, 'email' => $email, 'roomNumber' => $roomNumber]);
	
	echo "<h2>Success</h2>";
	echo "<p>$fname $lname was added to the database.</p>";
}
?>
<p><a href="attendees.html">Back</a></p>
</table>
</body>
</html> 