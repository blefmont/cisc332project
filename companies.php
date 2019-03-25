<!DOCTYPE html>
<html>
<head>
  <link href="stylesheet.css" type="text/css" rel="stylesheet" >
</head>

<?php
$pdo = new PDO('mysql:host=localhost;dbname=conference_database', "root", "");
if(isset($_POST['deleteCompany']) )
{
	$company = $_POST['deleteCompany'];
	$sql = "DELETE FROM `company` WHERE `company`.`name` = ?";
	$stmt = $pdo->prepare($sql);   #create the query
	$stmt->execute([$company]);   #bind the parameters
}
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
Manage Companies
</h1>
<body>
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
<p>
Add Company
<form action="<?php echo htmlentities($_SERVER['PHP_SELF']); ?>" method="post">
Company name:
<input type="text" name="company_name">
<br>
Sponsor level:
<input type="text" name="sponsor_level"><br><br>
<input type="submit" name="add_company">
</form> 
</p>
<p>
<?php 
#connect to the database


$stmt = $pdo->prepare($sql);   #create the query
$stmt->execute([]);   #bind the parameters
echo "<table><tr><th>Company name</th><th>Sponsor level</th></tr>";
while ($row = $stmt->fetch()) {
	echo "<tr><td>".$row["name"]."</td><td>".$row["sponsor_level"]."</td></tr>";
}
?>
</table>
</p>
<p><a href="main_page.php">Back to Main Page</a></p>
<body>
</html>