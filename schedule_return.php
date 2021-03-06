<!DOCTYPE html>
<html>
<head>
<link href="schedule.css" type="text/css" rel="stylesheet" >
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


<h1>Full Schedule</h1>


<?php
 if (isset($_GET["id"])){
        #update the session with the target id 
        $id = $_GET["id"];
        $room = $_POST['room'];
        $day = $_POST["session_day"];
        $starttime = $_POST["starttime"];
        $endtime = $_POST["endtime"];
        $pdo = new PDO('mysql:host=localhost;dbname=conference_database',"root","");
        $sql = "update SESSION set room=?, starttime=TIME(?), endtime=TIME(?), session_day=DATE(?) where id=?";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([$room,$starttime,$endtime,$day,$id]);
        echo "<p>Success, the entry has successfully been updated!</p>";
        $_POST["date"] = $day;
    } 
?>

<h3> Please select a date <h3>
<!-- the form for resubmission --> 
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
       if ($_POST["date"] == $row["session_day"]){
         echo "<option value=\"".$row["session_day"]."\" selected=\"selected\">".$row["session_day"]."</option>";
       }
       else {
           echo "<option value=\"".$row["session_day"]."\">".$row["session_day"]."</option>";  
       }
   }
   echo "</select>";
   
?> 
  <br>
  <br>
  <input type="submit">
  </form>


<?php
#only put chart if the date is set
if (isset($_POST['date'])){
    $date = $_POST["date"];
    echo "<h2> Schedule for $date:</h2>";
    echo "<table border=\"1\">";
    echo "<tr><th>Time</th><th colspan=\"2\">Session</th></tr>";

    #connect to the database
    $pdo = new PDO('mysql:host=localhost;dbname=conference_database', "root", "");

    #get the maximum number of overlapping events (so know how thick the table has to be)
    #going to try without doing this


    #assumption -- all events will be from 8:30-11:30
    $cur_time = date("H:i", strtotime("8:30")); #store the time that currently on (date is just a placeholder)
    $bound_time = date("H:i", strtotime("21:30"));

    while ($cur_time <= $bound_time){
        #format curtime
        echo "<tr><td>".$cur_time."</td>";

        #get all of the events scheduled at the particular time
        $sql = "select * from session where starttime=? and session_day=?";
        $stmt = $pdo-> prepare($sql);
        $stmt->execute([$cur_time, $date]);
        while ($row = $stmt -> fetch()){
            #get the length of time the thing is running for
            $len_time = strtotime($row["endtime"]) - strtotime($row["starttime"]);
            #determine from len_time above how many half hour segments there are to determine how much the columns should span
            $len_time = $len_time / 1800;
            
            #make the event links clickable so that they can lead to a page where events can be modified
            echo "<td rowspan=\"".$len_time."\">";
            echo "<table>";
            echo "<tr><td colspan=\"5\"> <a href=\"/schedule_update.php?id=".$row['id']."\">".$row["name"]."</a></td></tr>";
            #get the speaker's information 
            echo "<tr>";
            $sql2 = "select * from is_speaking where id=?";
            $stmt2 = $pdo->prepare($sql2);
            $stmt2->execute([$row['id']]);
            #$row2 = $stmt->fetch();
            while ($row2 = $stmt2->fetch()){
                echo "<td>".$row2['fname']." ".$row2['lname']."&nbsp</td>";
            }
            echo "</tr>";
            echo "<tr><td name=\"set_room\">".$row["room"]."</td></tr>";
            echo "</table>";
        }
        echo "</tr>";
     
    $cur_time = date('H:i', strtoTime('+30 minutes',strtotime($cur_time))); 

    }
}
?>
</table>
</body>
</html> 