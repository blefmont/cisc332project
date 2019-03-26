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
$pdo = new PDO('mysql:host=localhost;dbname=conference_database', "root", "");
if(isset($_POST['deleteCompany']) )
{
	$company = $_POST['deleteCompany'];
	$sql = "DELETE FROM `company` WHERE `company`.`name` = ?";
	$stmt = $pdo->prepare($sql);   #create the query
	$stmt->execute([$company]);   #bind the parameters
    echo "<p>".$company." has been successfully deleted</p>";
}
?>

<h1>Delete company</h1>
<form action="<?php echo htmlentities($_SERVER['PHP_SELF']); ?>" method="post">
	<select name="deleteCompany">
<?php
$sql = "select * from company";
$stmt = $pdo->prepare($sql);   #create the query
$stmt->execute([]);   #bind the parameters
while ($row = $stmt->fetch()) {
	echo "<option value = '".$row["name"]."'>".$row["name"]."</option>";
}
?>
	</select>
    <br>
    <br>
	<input type="submit" name="formSubmit" value="Submit" >
</form>
<p>
<?php 
#connect to the database

$sql = "select * from company";
$stmt = $pdo->prepare($sql);   #create the query
$stmt->execute([]);   #bind the parameters
echo "<table><tr><th>Company name</th><th>Sponsor level</th></tr>";
while ($row = $stmt->fetch()) {
	echo "<tr><td>".$row["name"]."</td><td>".$row["sponsor_level"]."</td></tr>";
}
?>
</p>
</body>
</html>