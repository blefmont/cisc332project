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
<h2>Update Schedule</h2>



<?php
  $id = $_GET['id'];
  echo "<form action=\"schedule_return.php?id=".$id."\" method=\"post\">";
  #connect to database and get the information concerning this specific id
  $pdo = new PDO('mysql:host=localhost;dbname=conference_database',"root","");
  $sql = "SELECT  * from session where id=?";
  $stmt = $pdo->prepare($sql); #create the query
  $stmt->execute([$id]); #execute query
  
  #get the speaker's information 
  $sql2 = "select * from is_speaking where id=?";
  $stmt2 = $pdo->prepare($sql2);
  $stmt2->execute([$id]);
  
  $row = $stmt->fetch();
  echo "<p> Name: ".$row['name']."<br>";
  echo "Speaker(s): ";
  while ($row2 = $stmt2->fetch()){
    echo $row2['fname']." ".$row2['lname']." ";
  }
  echo "</p>";
  #echo "<input type=\"text\" name=\"name\"><br>";
  echo "Room #:<br>";
  echo "<input type=\"text\" name=\"room\", value=\"".$row['room']."\"><br>";
  echo "Session  Day<br>";
  echo "<input type=\"date\" name=\"session_day\" value=\"".$row['session_day']."\"><br>";
  echo "Start Time<br>";
  #make sure the seconds field is marked using css
  echo "<input type=\"time\" name=\"starttime\" min=\"8:30\" max=\"23:00\" step=\"1800\", value=\"".$row['starttime']."\"><br>";
  echo "End Time<br>";
  echo "<input type=\"time\" name=\"endtime\" min=\"8:30\" max=\"23:00\" step=\"1800\", value=\"".$row['endtime']."\"><br>";
  #echo "Speaker<br>";
  #connect to database
  #$pdo = new PDO('mysql:host=localhost;dbname=conference_database',"root","");
  #$sql = "SELECT DISTINCT * from attendees";

  #$stmt = $pdo->prepare($sql); #create the query
  #$stmt->execute(); #execute query
  #echo "<select name=\"speaker\">";
  #echo "<option value=\"\"></option>";
  #stmt contains the result, place it in a table
  #while ($row = $stmt->fetch()){
  #     echo "<option value=\"".$row["email"]."\">".$row["fname"]." ".$row["lname"]."</option>";
  # }
  # echo "</select>";
   
?>
  <br> <input type="submit">
  </form>

</body>
</html>






