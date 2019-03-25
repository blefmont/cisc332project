<!DOCTYPE html>
<html>
<head>
<link href="firstPage.css" type="text/css" rel="stylesheet" >
</head>
<body>
<h2>Full Schedule</h2>

<p> select a date </p>
<form action="schedule_return.php" method="post">
<?php
   #connect to database
   $pdo = new PDO('mysql:host=localhost;dbname=conference_database',"root","");
   $sql = "select DISTINCT session_day from session";
   $stmt = $pdo->prepare($sql); #create the query
   $stmt->execute(); #execute query
   echo "<select name=\"date\">";
   #stmt contains the result, place it in a table
   while ($row = $stmt->fetch()){
       echo "<option value=\"".$row["session_day"]."\">".$row["session_day"]."</option>";
   }
   echo "</select>";
?>
  <input type="submit">
  </form>

<h3>Day 1</h3>

<table border="1">
<tr>
    <th rowspan="2"> Hello </th>
    <th> WOW </th>
</tr>
<tr>
    <td> WOW </td>
</tr>




</table>
</body>
</html> 