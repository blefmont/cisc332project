create table session
	(starttime time not null,
	endtime time,
	sessionday date,
	room varchar(32) not null,
	name varchar(32) not null,
	primary key(starttime, room, name)
	);
	
create table is_speaking
	(starttime time not null,
	room varchar(32) not null,
	name varchar(32) not null,
	fname varchar(32) not null,
	lname varchar(32) not null,
	primary key(starttime, name, fname, lname),
	foreign key (starttime, room, name) references session(starttime, room, name) on delete cascade,
	foreign key (fname, lname) references Attendings(fname, lname) on delete cascade
	);