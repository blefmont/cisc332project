create table Attendings
    (fname varchar(32),
     lname varchar(32),
     primary key (fname, lname)
     );
     
create table Student(
    fname varchar(32) not null,
    lname varchar(32) not null,
	roomnumber varchar(8),
    primary key (fname, lname),
    foreign key (fname, lname) references Attendings(fname, lname) on delete cascade,
	foreign key (roomnumber) references rooms(roomnumber) on delete set null
);

create table Professional(
    fname varchar(32) not null,
    lname varchar(32) not null,
    primary key (fname, lname),
    foreign key (fname, lname) references Attendings(fname, lname) on delete cascade
);


create table Sponsor(
    fname varchar(32) not null,
    lname varchar(32) not null,
    primary key (fname, lname),
    foreign key (fname, lname) references Attendings(fname, lname) on delete cascade
);

create table committee_member
	(fname varchar(32) not null, 
     lname varchar(32) not null,
     primary key (fname, lname)
     );
/*chair_f is first name of chair_f, chair_l is last name of chair*/ 
create table committee 
    (name varchar(64) not null primary key,
     chair_f varchar(32) not null,
     chair_l varchar(32) not null,
     foreign key (chair_f, chair_l) REFERENCES committee_member(fname, lname)
     
    
    );
    
create table is_on
    (fname varchar(32) not null,
     lname varchar(32) not null,
     committee_name varchar(64) not null,
     primary key (fname, lname, committee_name),
     foreign key (fname,lname) references committee_member(fname,lname) on delete cascade,
     foreign key (committee_name) references committee(name) on delete cascade
     
     );

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
	
create table Attendings
    (fname varchar(32),
     lname varchar(32),
     email varchar(128),
     primary key (fname, lname)
     );
     
create table Student(
    fname varchar(32) not null,
    lname varchar(32) not null,
    primary key (fname, lname),
    foreign key (fname, lname) references Attendings(fname, lname) on delete cascade
);

create table Professional(
    fname varchar(32) not null,
    lname varchar(32) not null,
    primary key (fname, lname),
    foreign key (fname, lname) references Attendings(fname, lname) on delete cascade
);




create table Sponsor_status
  (metal varchar(32) not null primary key,
   amount int,
   email_cap int
   );
   
   
create table Company
  (name varchar(32) not null primary key,
   emails_sent int not null,
   sponsor_level  varchar(32) not null,
   foreign key (sponsor_level) references Sponsor_status (metal) 
   );
   
create table Sponsor(
    fname varchar(32) not null,
    lname varchar(32) not null,
    representing varchar(32) not null,
    primary key (fname, lname),
    foreign key (fname, lname) references Attendings(fname, lname) on delete cascade,
    foreign key (representing) references Company(name) on delete cascade
);
   
 create table Ad
  (job_title varchar(32) not null,
   city varchar(32),
   province varchar(32),
   salary int,
   company varchar(32) not null,
   primary key (job_title, company),
   foreign key (company) references Company (name) on delete cascade
   );
   
insert into Attendings values ('Liam','Smith');
insert into Attendings values ('Noah','Johnson');
insert into Attendings values ('William','Jones');
insert into Attendings values ('James','Brown');
insert into Attendings values ('Logan','Davis');
insert into Attendings values ('David','Miller');
insert into Attendings values ('Robert','Moore');
insert into Attendings values ('Michael','Taylor');
insert into Attendings values ('Richard','Anderson');
insert into Attendings values ('Emma','Jackson');
insert into Attendings values ('Mary','Thompson');
insert into Attendings values ('Olivia','Garcia');
insert into Attendings values ('Jennifer','Clark');
insert into Attendings values ('Victoria','Robinson');
insert into Attendings values ('Zoe','Lewis');
insert into Attendings values ('Mia','Allen');
insert into Attendings values ('Alice','Lee');


insert into Attendings values ('Ava', 'Young');
insert into Attendings values ('Charlotte', 'King');
insert into Attendings values ('Julia', 'Wright');
insert into Attendings values ('Adam', 'Lopez');
insert into Attendings values ('Jacob', 'Hill');
insert into Attendings values ('Oliver', 'Martin');
insert into Attendings values ('Juan', 'Scott');
insert into Attendings values ('Thomas', 'Nelson');
insert into Attendings values ('John', 'Gonzalez');
insert into Attendings values ('Charles', 'Green');

insert into Attendings values ('Mae', 'Perez');
insert into Attendings values ('Lissa', 'Roberts');
insert into Attendings values ('Celica', 'Turner');
insert into Attendings values ('Priscilla','Phillips');
insert into Attendings values ('Evelyn','Campbell');
insert into Attendings values ('Roy','Parker');
insert into Attendings values ('Chrom','Evans');
insert into Attendings values ('Lucina','Evans');
insert into Attendings values ('Gray', 'Stewart');
insert into Attendings values ('Alm', 'Sanchez');
insert into Attendings values ('Robin','Morris');
insert into Attendings values ('Fredrick','Rogers');
insert into Attendings values ('Virion','Bell');





insert into Student values ('Liam','Smith', '001');
insert into Student values ('Noah','Johnson', '001');
insert into Student values ('William','Jones', '011');
insert into Student values ('James','Brown', '011');
insert into Student values ('Logan','Davis', '011');
insert into Student values ('David','Miller', '123');
insert into Student values ('Robert','Moore', '123');
insert into Student values ('Michael','Taylor', '123');
insert into Student values ('Richard','Anderson', '123');
insert into Student values ('Emma','Jackson', '124');
insert into Student values ('Mary','Thompson', '203');
insert into Student values ('Olivia','Garcia', '203');
insert into Student values ('Jennifer','Clark', null);
insert into Student values ('Victoria','Robinson', null);
insert into Student values ('Zoe','Lewis', null);
insert into Student values ('Mia','Allen', null);
insert into Student values ('Alice','Lee', null);


insert into Sponsor values ('Ava', 'Young');
insert into Sponsor values ('Charlotte', 'King');
insert into Sponsor values ('Julia', 'Wright');
insert into Sponsor values ('Adam', 'Lopez');
insert into Sponsor values ('Jacob', 'Hill');
insert into Sponsor values ('Oliver', 'Martin');
insert into Sponsor values ('Juan', 'Scott');
insert into Sponsor values ('Thomas', 'Nelson');
insert into Sponsor values ('John', 'Gonzalez');
insert into Sponsor values ('Charles', 'Green');


insert into Professional values ('Mae', 'Perez');
insert into Professional values ('Lissa', 'Roberts');
insert into Professional values ('Celica', 'Turner');
insert into Professional values ('Priscilla','Phillips');
insert into Professional values ('Evelyn','Campbell');
insert into Professional values ('Roy','Parker');
insert into Professional values ('Chrom','Evans');
insert into Professional values ('Lucina','Evans');
insert into Professional values ('Gray', 'Stewart');
insert into Professional values ('Alm', 'Sanchez');
insert into Professional values ('Robin','Morris');
insert into Professional values ('Fredrick','Rogers');
insert into Professional values ('Virion','Bell');



/* commitee members */     
insert into committee_member values ('Joshua', 'Charkow');
insert into committee_member values ('Michael', 'Olson');
insert into committee_member values ('Matthew', 'Kruzich');
insert into committee_member values ('Spongebob', 'Squarepants');
insert into committee_member values ('Patrick', 'Star');
insert into committee_member values ('Squidward', 'Tentacles');
insert into committee_member values ('Sandy', 'Cheeks');
insert into committee_member values ('Pearl', 'Krabs');
insert into committee_member values ('Ted', 'Mosby');
insert into committee_member values ('Robin','Scherbatsky');
insert into committee_member values ('Barney', 'Stinson');
insert into committee_member values ('Marshall','Eriksen');
insert into committee_member values ('Rachel', 'Green');
insert into committee_member values ('Monica', 'Geller');
insert into committee_member values ('Phoebe','Buffay');
insert into committee_member values ('Joey','Tribbiani');
insert into committee_member values ('Chandler','Bing');
insert into committee_member values ('Ross', 'Geller');

/* Committees */
insert into committee values ('Food Committee', 'Joshua', 'Charkow');
insert into committee values ('Programming Committee', 'Michael', 'Olson');
insert into committee values ('Promotion Committee', 'Matthew', 'Kruzich');
insert into committee values ('Finance Committee', 'Ted', 'Mosby');
insert into committee values ('Safety Committee', 'Monica', 'Geller');
insert into committee values ('Sponsorship Committee', 'Spongebob', 'Squarepants');


/* is on */
insert into is_on values ('Joshua', 'Charkow', 'Food Committee');
insert into is_on values ('Robin','Scherbatsky','Food Committee');
insert into is_on values ('Matthew', 'Kruzich', 'Food Committee');
insert into is_on values ('Squidward', 'Tentacles', 'Food Committee');
insert into is_on values ('Pearl', 'Krabs', 'Food Committee');


insert into is_on values ('Michael', 'Olson', 'Programming Committee');
insert into is_on values ('Matthew', 'Kruzich', 'Programming Committee');
insert into is_on values ('Joshua', 'Charkow', 'Programming Committee');
insert into is_on values ('Phoebe','Buffay','Programming Committee');

insert into is_on values ('Matthew', 'Kruzich', 'Promotion Committee');
insert into is_on values ('Ross', 'Geller','Promotion Committee');
insert into is_on values ('Squidward', 'Tentacles', 'Promotion Committee');
insert into is_on values ('Marshall','Eriksen','Promotion Committee');



insert into is_on values ('Ted', 'Mosby', 'Finance Committee');
insert into is_on values ('Robin','Scherbatsky','Finance Committee');
insert into is_on values ('Barney', 'Stinson','Finance Committee');
insert into is_on values ('Marshall','Eriksen','Finance Committee');


insert into is_on values ('Monica', 'Geller', 'Safety Committee');
insert into is_on values ('Phoebe','Buffay','Safety Committee');
insert into is_on values ('Joey','Tribbiani','Safety Committee');
insert into is_on values ('Chandler','Bing','Safety Committee');
insert into is_on values ('Ross', 'Geller','Safety Committee');


insert into is_on values ('Spongebob', 'Squarepants', 'Sponsorship Committee');
insert into is_on values ('Patrick', 'Star','Sponsorship Committee');
insert into is_on values ('Squidward', 'Tentacles', 'Sponsorship Committee');
insert into is_on values ('Sandy', 'Cheeks', 'Sponsorship Committee');
insert into is_on values ('Pearl', 'Krabs', 'Sponsorship Committee');

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

insert into rooms values('001', 2);
insert into rooms values('011', 3);
insert into rooms values('123', 4);
insert into rooms values('124', 4);
insert into rooms values('203', 2);
insert into rooms values('433', 3);

/* status values */
insert into Sponsor_status values('Platinum', 10000, 5); 
insert into Sponsor_status values('Gold', 5000, 4); 
insert into Sponsor_status values('Silver', 3000, 3); 
insert into Sponsor_status values('Bronze', 1000, 0); 


/* companies */
insert into Company values('Google', 4, 'Platinum');
insert into Company values('Facebook', 2, 'Gold');
insert into Company values('Microsoft', 3, 'Silver');
insert into Company values('Apple', 0, 'Bronze');



/* job ads */
insert into Ad values('Butcher', 'Kamloops', 'BC', 50000, 'Google'); 
insert into Ad values('Baker', 'Barrie', 'ON', 60000, 'Facebook'); 
insert into Ad values('Candlestick Maker', 'Saguenay', 'QC', 70000, 'Microsoft'); 
insert into Ad values('Junior Dev', 'Cavendish', 'PEI', 80000, 'Apple'); 
insert into Ad values('Butcher','Kamloops','BC', 50000, 'Apple');


    