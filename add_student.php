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
      <a href="/hotel_occupants.php">Add Room</a>
    </div>
    </div>
    </div>
</head>
<body>

<?php
$fname = $_POST["fname"];                      
$lname = $_POST["lname"];
$email = $_POST["email"];
$roomNumber = $_POST["roomNumber"];

$pdo = new PDO('mysql:host=localhost;dbname=conference_database', "root", "");

if($roomNumber < 1){ //no room needed

	$roomNumber = null;
	
	$stmt = $pdo->prepare("insert into Attendees values(:fname, :lname, :email)");
			$stmt->execute([':fname' => $fname, 'lname' => $lname, 'email' => $email]);
	
			$stmt = $pdo->prepare("insert into Student values(:fname, :lname, :email, :roomNumber)");
			$stmt->execute([':fname' => $fname, 'lname' => $lname, 'email' => $email, 'roomNumber' => $roomNumber]);
		
			echo "<h2>Success</h2>";
			echo "<p>$fname $lname was added to the database.</p>";	
}
else { //room needed
	
	$sql = "select count(fname) from student where roomnumber = ?";
	$stmt = $pdo->prepare($sql);
	$stmt->execute([$roomNumber]);
	$occupancy = $stmt->fetch();
	
	if($occupancy["count(fname)"] == 0) {
		
		//add tuple to rooms
		$stmt = $pdo->prepare("insert into Rooms values(:roomNumber,4)");
		$stmt->execute([':roomNumber' => $roomNumber]);
		
		$stmt = $pdo->prepare("insert into Attendees values(:fname, :lname, :email)");
		$stmt->execute([':fname' => $fname, 'lname' => $lname, 'email' => $email]);
	
		$stmt = $pdo->prepare("insert into Student values(:fname, :lname, :email, :roomNumber)");
		$stmt->execute([':fname' => $fname, 'lname' => $lname, 'email' => $email, 'roomNumber' => $roomNumber]);
		
		echo "<h2>Success</h2>";
		echo "<p>$fname $lname was added to the database.</p>";		
	}
	else {
		
		$sql = "select numberofbeds from rooms where roomnumber = ?";
		$stmt = $pdo->prepare($sql);
		$stmt->execute([$roomNumber]);
		$capacity = $stmt->fetch();
		
		if($occupancy["count(fname)"] >= $capacity["numberofbeds"]) {
	
			echo "<h2>Error</h2>";
			echo "<p>The selected hotel room is full. Please try again with a different hotel room number.</p>";
		}
		else {
	
			$stmt = $pdo->prepare("insert into Attendees values(:fname, :lname, :email)");
			$stmt->execute([':fname' => $fname, 'lname' => $lname, 'email' => $email]);
	
			$stmt = $pdo->prepare("insert into Student values(:fname, :lname, :email, :roomNumber)");
			$stmt->execute([':fname' => $fname, 'lname' => $lname, 'email' => $email, 'roomNumber' => $roomNumber]);
		
			echo "<h2>Success</h2>";
			echo "<p>$fname $lname was added to the database.</p>";
		}
	}
}
?>
<p><a href="attendees.php">Back</a></p>
</table>
</body>
</html>
