create table session
	(starttime time not null,
	endtime time,
	sessionday date,
	room varchar(32) not null,
	name varchar(64) not null,
	primary key(starttime, room, name)
	);
	
create table is_speaking
	(starttime time not null,
	room varchar(32) not null,
	name varchar(64) not null,
	fname varchar(32) not null,
	lname varchar(32) not null,
	primary key(starttime, room, name, fname, lname),
	foreign key (starttime, room, name) references session(starttime, room, name) on delete cascade,
	foreign key (fname, lname) references Attendings(fname, lname) on delete cascade
	);
insert into session values (TIME('12:00:00'), TIME('13:00:00'), DATE('2019-02-14'), '101', 'Intro to running a pyramid scheme');
insert into session values (TIME('14:00:00'), TIME('15:00:00'), DATE('2019-02-14'), '101', 'How to be your own boss');
insert into session values (TIME('9:00:00'), TIME('10:00:00'), DATE('2019-02-14'), '103', 'Quirks of the Dewy Decimal System');
insert into session values (TIME('21:00:00'), TIME('23:00:00'), DATE('2019-02-15'), '503', 'Famous Queen\'s Grads');
insert into session values (TIME('10:00:00'), TIME('11:00:00'), DATE('2019-02-15'), '101', 'Why Mace Windu May Have Been a Sith Lord');
insert into session values (TIME('17:00:00'), TIME('20:00:00'), DATE('2019-02-14'), 'E14', 'What Are Ferarri Owners Compensating For?');

insert into is_speaking values (TIME('12:00:00'), '101', 'Intro to running a pyramid scheme', 'David','Miller');
insert into is_speaking values (TIME('12:00:00'), '101', 'Intro to running a pyramid scheme', 'Robert','Moore');
insert into is_speaking values (TIME('12:00:00'), '101', 'Intro to running a pyramid scheme', 'Adam', 'Lopez');
insert into is_speaking values (TIME('14:00:00'), '101', 'How to be your own boss', 'David','Miller');
insert into is_speaking values (TIME('14:00:00'), '101', 'How to be your own boss', 'Robert','Moore');
insert into is_speaking values (TIME('14:00:00'), '101', 'How to be your own boss',  'Adam', 'Lopez');
insert into is_speaking values (TIME('9:00:00'), '103', 'Quirks of the Dewy Decimal System', 'Roy','Parker');
insert into is_speaking values (TIME('21:00:00'), '503', 'Famous Queen\'s Grads', 'Virion','Bell');
insert into is_speaking values (TIME('10:00:00'), '101', 'Why Mace Windu May Have Been a Sith Lord', 'Virion','Bell');
insert into is_speaking values (TIME('17:00:00'), 'E14', 'What Are Ferarri Owners Compensating For?', 'Celica', 'Turner');



