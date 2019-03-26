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
  <h1>Committee Page</h1>
  

  <p> Please Pick a Committee to view the members of: </p>
  <form action="committee.php" method="post">
  <?php
   #connect to database
   $pdo = new PDO('mysql:host=localhost;dbname=conference_database',"root","");
   $sql = "SELECT name from committee";
   $stmt = $pdo->prepare($sql); #create the query
   $stmt->execute(); #execute query
   echo "<select name=\"committeeName\">";
   #stmt contains the result, place it in a table
   echo "<option value=\"\">"." "."</option>";
   while ($row = $stmt->fetch()){
       if ($_POST["committeeName"] == $row["name"]){
         echo "<option value=\"".$row["name"]."\" selected =\"selected\">".$row["name"]."</option>";
       }
       else {
           echo "<option value=\"".$row["name"]."\">".$row["name"]."</option>";
       }
         
        
   }
   echo "</select>";
  ?>
  <br>
  <br>
  <input type="submit">
  </form>
<br><br>


<?php
if (isset($_POST["committeeName"]) and $_POST["committeeName"] != ""){
    $comm = $_POST["committeeName"];
    echo "<p>Here is a list of the $comm members. </p>";
    echo "<p>The <b>bolded entry</b> is the committee leader. </p>";
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
</body>

</html>