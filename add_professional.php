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

$pdo = new PDO('mysql:host=localhost;dbname=conference_database', "root", "");

$stmt = $pdo->prepare("insert into Attendees values(:fname, :lname, :email)");
$stmt->execute([':fname' => $fname, 'lname' => $lname, 'email' => $email]);
	
$stmt = $pdo->prepare("insert into Professional values(:fname, :lname, :email)");
$stmt->execute([':fname' => $fname, 'lname' => $lname, 'email' => $email]);

echo "<h2>Success</h2>";
echo "<p>$fname $lname was added to the database.</p>";

?>
<p><a href="attendees.php">Back</a></p>
</table>
</body>
</html> 
