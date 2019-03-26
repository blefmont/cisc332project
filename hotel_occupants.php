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
<h2>View Hotel Room Occupants</h2>
		<form action="hotel_occupants.php" method="post">
			<p>Room Number</p>
			<?php
				$pdo = new PDO('mysql:host=localhost;dbname=conference_database',"root","");
				$sql = "select roomnumber from rooms";
				$stmt = $pdo->prepare($sql);
				$stmt->execute();
			        echo "<select name=\"roomNumber\">";
                                #stmt contains the result, place it in a table
                                while ($row = $stmt->fetch()){
                                    if ($_POST["roomNumber"] == $row["roomnumber"]){
                                        #make sure the selected value is the default selection
                                        echo "<option value=\"".$row["roomnumber"]."\" selected =\"selected\">".$row["roomnumber"]."</option>";
                                         }
                                        else {
                                            echo "<option value=\"".$row["roomnumber"]."\">".$row["roomnumber"]."</option>";
                                        }
                                }
                                echo "</select>";
				
			?>
            <br>
            <br>
			<input type="submit">
		</form>
<?php
	if (isset($_POST["roomNumber"])){
    $pdo = new PDO('mysql:host=localhost;dbname=conference_database', "root", "");
	$roomNumber = $_POST["roomNumber"];
	
	echo "<h2>Room $roomNumber</h2>";
	
	$stmt = $pdo->prepare("select count(fname) as occupancy from Student where roomnumber = :roomNumber");
	$stmt->execute([':roomNumber' => $roomNumber]);
	$occupancy = $stmt->fetch()["occupancy"];
	
	if($occupancy < 1) {
		
		echo "<p>There are no students in this room.</p>";
	}
	else {
		
		echo "<table border><tr><th>First Name</th><th>Last Name</th></tr>";

		$sql = "select fname, lname from student where roomnumber = :roomNumber";
		$stmt = $pdo->prepare($sql);
		$stmt->execute(['roomNumber' => $roomNumber]);

		while ($row = $stmt->fetch())  {
			echo "<tr><td>".$row["fname"]."</td><td>".$row["lname"]."</td></tr>";
		}
		echo "</table>";
	}
    }
?>

</body>
</html> 
