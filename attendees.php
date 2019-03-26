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
		<h1>Conference Attendees</h1>
	
		<h2><a name="add_student">Add Student</a></h2>
		<form action="add_student.php" method="post">
			<p>First Name</p>
			<input type="text" name="fname"><br>
			<p>Last Name</p>
			<input type="text" name="lname"><br>
			<p>email</p>
			<input type="text" name="email"><br>
			<p>Room Number <i>(enter 0 if no room)</i></p>
			<input type="number" name="roomNumber" min="0"><br>
			<br>
			<input type="submit"><br>
		</form>
	
		<h2><a name="add_professional">Add Professional</a></h2>
		<form action="add_professional.php" method="post">
			<p>First Name</p>
			<input type="text" name="fname"><br>
			<p>Last Name</p>
			<input type="text" name="lname"><br>
			<p>email</p>
			<input type="text" name="email"><br>
			<br>
			<input type="submit">
		</form>
	
		<h2><a name="add_sponsor">Add Sponsor</a></h2>
		<form action="add_sponsor.php" method="post">
			<p>First Name</p>
			<input type="text" name="fname"><br>
			<p>Last Name</p>
			<input type="text" name="lname"><br>
			<p>email</p>
			<input type="text" name="email"><br>
			<p>Company</p>
			<input type="text" name="representing"><br>
			<br>
			<input type="submit">
		</form>
		
		<p><a href="/main_page.php">Back to Main Page</a></p>
	</body>
</html> 
