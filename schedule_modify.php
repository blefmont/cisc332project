<!DOCTYPE html>
<html>
<head>
<link href="stylesheet.css" type="text/css" rel="stylesheet" >
</head>
<body>
<h2>Modify Schedule</h2>


  <form action="schedule_return.php" method="post">
<?php
  $id = $_GET['id'];

  echo "Name:<br>";
  echo "<input type=\"text\" name=\"name\"><br>";
  echo "Room #:<br>";
  echo "<input type=\"text\" name=\"room\"><br>";
  echo "Session  Day<br>";
  echo "<input type=\"date\" name=\"session_day\"><br>";
  echo "Start Time<br>";
  #make sure the seconds field is marked using css
  echo "<input type=\"time\" name=\"starttime\" min=\"8:30\" max=\"23:00\" step=\"1800\"><br>";
  echo "End Time<br>";
  echo "<input type=\"time\" name=\"endtime\" min=\"8:30\" max=\"23:00\" step=\"1800\"><br>";
  echo "Speaker<br>";
  #connect to database
  $pdo = new PDO('mysql:host=localhost;dbname=conference_database',"root","");
  $sql = "SELECT DISTINCT * from attendees";

  $stmt = $pdo->prepare($sql); #create the query
  $stmt->execute(); #execute query
  echo "<select name=\"speaker\">";
  echo "<option value=\"\"></option>";
  #stmt contains the result, place it in a table
  while ($row = $stmt->fetch()){
       echo "<option value=\"".$row["email"]."\">".$row["fname"]." ".$row["lname"]."</option>";
   }
   echo "</select>";
   
?>
  <br><br> <input type="submit", value="Create">
  </form>

</body>
</html>




