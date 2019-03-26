<!DOCTYPE html>
<html>
<head>
<link href="stylesheet.css" type="text/css" rel="stylesheet" >
        <div class="menu">
          
          <a href="/jobs.php">Jobs</a>
          <a href="/committee.php">Committees</a>
          <a href="/schedule_return.php">Sessions</a>
          <a href="/finances.php">Finances</a>
            
          <div class="dropdown">
            <button class="dropdown_button">Attendees
            </button>
            <div class="dropdown_content">
              <a href="/show_attendees.php">View All</a>
              <a href="/attendees.php#add_student">Add Student</a>
              <a href="/attendees.php#add_professional">Add Professional</a>
              <a href="/attendees.php#add_sponsor">Add Sponsor</a>
              <a href="/attendees.php">Add Room</a>
            </div>
          </div>
          </div> 
        </div>
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

</body>
</html> 