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
