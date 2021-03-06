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

<?php
$pdo = new PDO('mysql:host=localhost;dbname=conference_database', "root", "");
#if(isset($_POST['deleteCompany']) )
#{
#	$company = $_POST['deleteCompany'];
#	$sql = "DELETE FROM `company` WHERE `company`.`name` = ?";
#	$stmt = $pdo->prepare($sql);   #create the query
#	$stmt->execute([$company]);   #bind the parameters
#}
if(isset($_POST['add_company']))
{
	if(isset($_POST['company_name']) and $_POST['company_name'] != "" and isset($_POST['sponsor_level']) and $_POST['sponsor_level'] != ""){
		$company = $_POST['company_name'];
		$sLevel = $_POST['sponsor_level'];
		$sql = "insert into Company values(?, 0, ?)";
		$pdo->prepare($sql)->execute([$company, $sLevel]);   
	}
	else{
		echo("Too add company both inputs must be valid");
	}
}
?>

<h1>
Add Company
</h1>
<body>
<!--
<p>Delete company
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
	<input type="submit" name="formSubmit" value="Submit" >
</form>
</p>
-->

<form action="<?php echo htmlentities($_SERVER['PHP_SELF']); ?>" method="post">
<p>Company name:</p>
<input type="text" name="company_name">
<br>
<p>Sponsor level:</p>
<select name="sponsor_level">
<?php
$sql = "select * from sponsor_status";
$stmt = $pdo->prepare($sql);   #create the query
$stmt->execute([]);   #bind the parameters
while ($row = $stmt->fetch()) {
	echo "<option value = '".$row["metal"]."'>".$row["metal"]."</option>";
}
?>
</select>
<br>
<br>
<input type="submit" name="add_company">
</form> 
</p>
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
</table>
</p>
<body>
</html>