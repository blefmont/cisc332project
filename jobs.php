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
</div>
</head>
<body>
  <h1>View jobs</h1>
  
<?php 
#connect to the database
$pdo = new PDO('mysql:host=localhost;dbname=conference_database', "root", "");
$sql = "select * from company";
$stmt = $pdo->prepare($sql);   #create the query
$stmt->execute([]);   #bind the parameters
?>
<p>
	<form action="<?php echo htmlentities($_SERVER['PHP_SELF']); ?>" method="post">
		<select name="filterCompany">
			<option value = 'all'>All</option>
<?php
while ($row = $stmt->fetch()) {
	echo "<option value = '".$row["name"]."'>".$row["name"]."</option>";
}
?>
		</select>
		<input type="submit" name="formSubmit" value="Submit" >
	</form>
</p>
<?php

echo "<table><tr><th>Job title</th><th>City</th><th>Province</th><th>Salary</th><th>Company</th></tr>";

$company = '*';
if(isset($_POST['filterCompany']) )
{
	$company = $_POST['filterCompany'];
	if ($company == "all"){
		$sql =  "select * from ad";
	}
	else {$sql = "select * from ad where company = ?";}	
}
else { $sql = "select * from ad";}


$stmt = $pdo->prepare($sql);   #create the query
$stmt->execute([$company]);   #bind the parameters

#stmt contains the result of the program execution
#use fetch to get results row by row.
while ($row = $stmt->fetch()) {
	echo "<tr><td>".$row["job_title"]."</td><td>".$row["city"]."</td><td>".$row["province"]."</td><td>".$row["salary"]."</td><td>".$row["company"]."</td></tr>";
}


?>
</table>
<p><a href="main_page.php">Back to Main Page</a></p>
</body>
</html>