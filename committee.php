<!DOCTYPE html>
<html>
<head>
  <link href="stylesheet.css" type="text/css" rel="stylesheet" >
</head>
<body>
  <h1>Commitee Page</h1>
  <p>Welcome</p>
  <a href = "main_page.php">Main Page</a>

  <p> Please Pick a Committee: </p>
  <form action="committee_return.php" method="post">
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

</body>

</html>

