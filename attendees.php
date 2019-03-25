<html>
	<head>
		<link href="stylesheet.css" type="text/css" rel="stylesheet" >
	</head>

	<body>
		<h1>Conference Attendees</h1>
		
		<h2>View Attendees</h2>
		<p><a href="attendees.php">Click here to view a list of all conference attendees</a></p>
	
		<h2>Add Student</h2>
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
	
		<h2>Add Professional</h2>
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
	
		<h2>Add Sponsor</h2>
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
	
		<h2>View Hotel Room Occupants</h2>
		<form action="hotel_occupants.php" method="post">
			<p>Room Number</p>
			<?php
				$pdo = new PDO('mysql:host=localhost;dbname=conference_database',"root","");
				$sql = "select roomnumber from rooms";
				$stmt = $pdo->prepare($sql);
				$stmt->execute();

				while($row = $stmt.fetch()) {
					echo "
				
			?>
			<input type="submit">
		</form>
		
		<p><a href="main_page.php">Back to Main Page</a></p>
	</body>
</html> 
