<!DOCTYPE html>
<html>
<head>
  <link href="stylesheet.css" type="text/css" rel="stylesheet" >
</head>
<body>
  <h1>Committee Page</h1>
  

  <p> Please Pick a Committee: </p>
  <form action="committee.php" method="post">
  <?php
   #connect to database
   $pdo = new PDO('mysql:host=localhost;dbname=conference_database',"root","");
   $sql = "SELECT name from committee";
   $stmt = $pdo->prepare($sql); #create the query
   $stmt->execute(); #execute query
   echo "<select name=\"committeeName\">";
   #stmt contains the result, place it in a table
   while ($row = $stmt->fetch()){
       echo "<option value=\"".$row["name"]."\">".$row["name"]."</option>";
   }
   echo "</select>";
  ?>
  <input type="submit">
  </form>
<br><br>


<?php
if (isset($_POST["committeeName"])){
    $comm = $_POST["committeeName"];
    echo "<p>Here is a list of the $comm members </p>";
    echo "<p>The bolded entry is the committee leader </p>";
    echo "<table><tr><th align=\"center\" colspan=\"2\">Name</th></tr>";

    #connect to the database
    $pdo = new PDO('mysql:host=localhost;dbname=conference_database', "root", "");

    #first print the committee leader in bold 
    $sql = "select chair_f, chair_l from committee where name = ?";
    $stmt = $pdo -> prepare($sql); #create query 
    $stmt-> execute([$comm]); #bind the parameters

    #use fetch to get the committee leader 
    $row = $stmt->fetch();
    echo "<tr><td><b>".$row["chair_f"]."</b></td><td><b>".$row["chair_l"]."</b></td></tr>";

    $sql = "select DISTINCT fname, lname from is_on WHERE committee_name = ? and (fname, lname) not in (SELECT chair_f as fname, chair_l as lname FROM committee where name=?)";
    $stmt = $pdo->prepare($sql);   #create the query
    $stmt->execute([$comm, $comm]);   #bind the parameters

    #stmt contains the result of the program execution
    #use fetch to get results row by row.
    while ($row = $stmt->fetch()) {
        echo "<tr><td>".$row["fname"]."</td><td>".$row["lname"]."</td></tr>";
    }
}

?>
</table>
<br><br>
<a href = "main_page.php">Back to Main Page</a>
</body>

</html>