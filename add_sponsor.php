<!DOCTYPE html>
<html>
<head>
	<link href="stylesheet.css" type="text/css" rel="stylesheet" >
<div class="menu">
  <a href="/main_page.php">Home</a>
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
      <a href="/hotel_occupants.php">View Room</a>
    </div>
  </div>
  <div class="dropdown">
    <button class="dropdown_button">Companies
    </button>
    <div class="dropdown_content">
      <a href="/companies.php">Add Company</a>
      <a href="/delete_company.php">Delete Compnay</a>
    </div>
  </div>
  </div> 
</head>
<body>

<?php
$fname = $_POST["fname"];                      
$lname = $_POST["lname"];
$email = $_POST["email"];
$representing = $_POST["representing"];

$pdo = new PDO('mysql:host=localhost;dbname=conference_database', "root", "");

$stmt = $pdo->prepare("select count(name) from Company where name = :representing");
$stmt->execute([':representing' => $representing]);
$exists = $stmt->fetch();

if($exists[0] < 1) {
	
	echo "<h2>Error</h2>";
	echo "<p>This company is not a sponsor of the conference. Please try again with a different company.</p>";
}
else {
	$stmt = $pdo->prepare("insert into Attendees values(:fname, :lname, :email)");
	$stmt->execute([':fname' => $fname, ':lname' => $lname, ':email' => $email]);
	
	$stmt = $pdo->prepare("insert into Sponsor values(:fname, :lname, :representing, :email)");
	$stmt->execute([':fname' => $fname, ':lname' => $lname, ':representing' => $representing, ':email' => $email]);
	
	echo "<h2>Success</h2>";
	echo "<p>$fname $lname from $representing was added to the database.</p>";
}
?>
<p><a href="attendees.php">Back</a></p>
</table>
</body>
</html> 
