<!DOCTYPE html>
<html>
<head>
<link href="stylesheet.css" type="text/css" rel="stylesheet" >
</head>
<body>

<?php
	$pdo = new PDO('mysql:host=localhost;dbname=conference_database', "root", "");
	
	echo "<h2>Conference Intake</h2>";
	
	$stmt = $pdo->prepare("select count(fname) as students from Student");
	$stmt->execute();
	$students = $stmt->fetch()["students"];
	$studentTotal = 50 * $students;
	
	$stmt = $pdo->prepare("select count(fname) as professionals from Professional");
	$stmt->execute();
	$professionals = $stmt->fetch()["professionals"];
	$professionalTotal = 100 * $professionals;
	
	$stmt = $pdo->prepare("select count(name) as num from Company where sponsor_level='Bronze'");
	$stmt->execute();
	$bronzes = $stmt->fetch()["num"];
	$bronzeTotal = 1000 * $bronzes;
	
	$stmt = $pdo->prepare("select count(name) as num from Company where sponsor_level='Silver'");
	$stmt->execute();
	$silvers = $stmt->fetch()["num"];
	$silverTotal = 3000 * $silvers;
	
	$stmt = $pdo->prepare("select count(name) as num from Company where sponsor_level='Gold'");
	$stmt->execute();
	$golds = $stmt->fetch()["num"];
	$goldTotal = 5000 * $golds;
	
	$stmt = $pdo->prepare("select count(name) as num from Company where sponsor_level='Platinum'");
	$stmt->execute();
	$platinums = $stmt->fetch()["num"];
	$platinumTotal = 10000 * $platinums;
	
	$conferenceTotal = $studentTotal + $professionalTotal + $bronzeTotal + $silverTotal + $goldTotal + $platinumTotal;
	
	
	echo "<table border><tr><th>Source</th><th>Amount</th></tr>";
	
	echo "<tr><td>$students students</td><td>\$$studentTotal</td></tr>";
	echo "<tr><td>$professionals professionals</td><td>\$$professionalTotal</td></tr>";
	echo "<tr><td>$bronzes bronze sponsors</td><td>\$$bronzeTotal</td></tr>";
	echo "<tr><td>$silvers silver sponsors</td><td>\$$silverTotal</td></tr>";
	echo "<tr><td>$golds gold sponsors</td><td>\$$goldTotal</td></tr>";
	echo "<tr><td>$platinums platinum sponsors</td><td>\$$platinumTotal</td></tr>";
	echo "<tr><td><b>Total</b></td><td><b>\$$conferenceTotal</b></td></tr>";
	echo "</table>";
	
?>

<p><a href="attendees.html">Back</a></p>

</body>
</html> 