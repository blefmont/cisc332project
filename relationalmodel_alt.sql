create table Rooms(
	roomnumber varchar(8) not null primary key,
	numberofbeds int not null
	);
create table Attendees(
     fname varchar(32) not null,
     lname varchar(32) not null,
     email varchar(128) not null,
     primary key (fname, lname, email)
     );
     
create table Student(
    fname varchar(32) not null,
    lname varchar(32) not null,
    email varchar(128),
	roomnumber varchar(8),
    primary key (fname, lname, email),
    foreign key (fname, lname, email) references Attendees(fname, lname, email) on delete cascade,
	foreign key (roomnumber) references Rooms(roomnumber) on delete set null
	
);

create table Professional(
    fname varchar(32) not null,
    lname varchar(32) not null,
    email varchar(128),
    primary key (fname, lname, email),
    foreign key (fname, lname, email) references Attendees(fname, lname, email) on delete cascade
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
    email varchar(128),
    primary key (fname, lname, email),
    foreign key (fname, lname, email) references Attendees(fname, lname, email) on delete cascade,
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
   
create table Committee_member
	(fname varchar(32) not null, 
     lname varchar(32) not null,
     primary key (fname, lname)
     );
/*chair_f is first name of chair_f, chair_l is last name of chair*/ 
create table Committee 
    (name varchar(64) not null primary key,
     chair_f varchar(32) not null,
     chair_l varchar(32) not null,
     foreign key (chair_f, chair_l) REFERENCES Committee_member(fname, lname)
     
    
    );
    
create table Is_on
    (fname varchar(32) not null,
     lname varchar(32) not null,
     committee_name varchar(64) not null,
     primary key (fname, lname, committee_name),
     foreign key (fname,lname) references Committee_member(fname,lname) on delete cascade,
     foreign key (committee_name) references Committee(name) on delete cascade
     
     );

create table Session
	(id int primary key not null,
    starttime time not null,
	endtime time not null,
	session_day date not null,
	room varchar(32) not null,
	name varchar(64) not null
	);
	
create table Is_speaking
	(id int not null, 
	fname varchar(32) not null,
	lname varchar(32) not null,
    email varchar(128) not null,
    primary key(id,fname,lname,email),
	foreign key (id) references Session(id) on delete cascade,
	foreign key (fname, lname, email) references Attendees(fname, lname, email) on delete cascade
	);
	
insert into Rooms values('001', 2);
insert into Rooms values('011', 3);
insert into Rooms values('123', 4);
insert into Rooms values('124', 4);
insert into Rooms values('203', 2);
insert into Rooms values('433', 3);




/* commitee members */     
insert into Committee_member values ('Joshua', 'Charkow');
insert into Committee_member values ('Michael', 'Olson');
insert into Committee_member values ('Matthew', 'Kruzich');
insert into Committee_member values ('Spongebob', 'Squarepants');
insert into Committee_member values ('Patrick', 'Star');
insert into Committee_member values ('Squidward', 'Tentacles');
insert into Committee_member values ('Sandy', 'Cheeks');
insert into Committee_member values ('Pearl', 'Krabs');
insert into Committee_member values ('Ted', 'Mosby');
insert into Committee_member values ('Robin','Scherbatsky');
insert into Committee_member values ('Barney', 'Stinson');
insert into Committee_member values ('Marshall','Eriksen');
insert into Committee_member values ('Rachel', 'Green');
insert into Committee_member values ('Monica', 'Geller');
insert into Committee_member values ('Phoebe','Buffay');
insert into Committee_member values ('Joey','Tribbiani');
insert into Committee_member values ('Chandler','Bing');
insert into Committee_member values ('Ross', 'Geller');

/* Committees */
insert into Committee values ('Food Committee', 'Joshua', 'Charkow');
insert into Committee values ('Programming Committee', 'Michael', 'Olson');
insert into Committee values ('Promotion Committee', 'Matthew', 'Kruzich');
insert into Committee values ('Finance Committee', 'Ted', 'Mosby');
insert into Committee values ('Safety Committee', 'Monica', 'Geller');
insert into Committee values ('Sponsorship Committee', 'Spongebob', 'Squarepants');


/* is on */
insert into Is_on values ('Joshua', 'Charkow', 'Food Committee');
insert into Is_on values ('Robin','Scherbatsky','Food Committee');
insert into Is_on values ('Matthew', 'Kruzich', 'Food Committee');
insert into Is_on values ('Squidward', 'Tentacles', 'Food Committee');
insert into Is_on values ('Pearl', 'Krabs', 'Food Committee');


insert into Is_on values ('Michael', 'Olson', 'Programming Committee');
insert into Is_on values ('Matthew', 'Kruzich', 'Programming Committee');
insert into Is_on values ('Joshua', 'Charkow', 'Programming Committee');
insert into Is_on values ('Phoebe','Buffay','Programming Committee');

insert into Is_on values ('Matthew', 'Kruzich', 'Promotion Committee');
insert into Is_on values ('Ross', 'Geller','Promotion Committee');
insert into Is_on values ('Squidward', 'Tentacles', 'Promotion Committee');
insert into Is_on values ('Marshall','Eriksen','Promotion Committee');



insert into Is_on values ('Ted', 'Mosby', 'Finance Committee');
insert into Is_on values ('Robin','Scherbatsky','Finance Committee');
insert into Is_on values ('Barney', 'Stinson','Finance Committee');
insert into Is_on values ('Marshall','Eriksen','Finance Committee');


insert into Is_on values ('Monica', 'Geller', 'Safety Committee');
insert into Is_on values ('Phoebe','Buffay','Safety Committee');
insert into Is_on values ('Joey','Tribbiani','Safety Committee');
insert into Is_on values ('Chandler','Bing','Safety Committee');
insert into Is_on values ('Ross', 'Geller','Safety Committee');


insert into Is_on values ('Spongebob', 'Squarepants', 'Sponsorship Committee');
insert into Is_on values ('Patrick', 'Star','Sponsorship Committee');
insert into Is_on values ('Squidward', 'Tentacles', 'Sponsorship Committee');
insert into Is_on values ('Sandy', 'Cheeks', 'Sponsorship Committee');
insert into Is_on values ('Pearl', 'Krabs', 'Sponsorship Committee');

insert into Session values (1,TIME('12:00:00'), TIME('13:00:00'), DATE('2019-02-14'), '101', 'Intro to running a pyramid scheme');
insert into Session values (2,TIME('14:00:00'), TIME('15:00:00'), DATE('2019-02-14'), '101', 'How to be your own boss');
insert into Session values (3,TIME('9:00:00'), TIME('10:00:00'), DATE('2019-02-14'), '103', 'Quirks of the Dewy Decimal System');
insert into Session values (4,TIME('21:00:00'), TIME('23:00:00'), DATE('2019-02-15'), '503', 'Famous Queen\'s Grads');
insert into Session values (5,TIME('10:00:00'), TIME('11:00:00'), DATE('2019-02-15'), '101', 'Why Mace Windu May Have Been a Sith Lord');
insert into Session values (6,TIME('17:00:00'), TIME('20:00:00'), DATE('2019-02-14'), 'E14', 'What Are Ferarri Owners Compensating For?');


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

/*Attendees*/
insert into Attendees values ('Mae', 'Perez','mperez@whohoo.com');
insert into Attendees values ('Lissa', 'Roberts', 'lroberts@fe.com');
insert into Attendees values ('Celica', 'Turner', 'cturner@sov.com');
insert into Attendees values ('Priscilla','Phillips', 'lroberts@fe.com');
insert into Attendees values ('Evelyn','Campbell', 'lroberts@fe.com');
insert into Attendees values ('Roy','Parker', 'roy1234@fe.com');
insert into Attendees values ('Chrom','Evans', 'chrom@fea.com');
insert into Attendees values ('Lucina','Evans', 'lucina@fea.com');
insert into Attendees values ('Gray', 'Stewart', 'gstewart@sov.com');
insert into Attendees values ('Alm', 'Sanchez', 'alm@sov.com');
insert into Attendees values ('Robin','Morris', 'rmorris@fea.com');
insert into Attendees values ('Fredrick','Rogers', 'frogers@fea.com');
insert into Attendees values ('Virion','Bell', 'virion@fea.com');

insert into Attendees values ('Liam','Smith','lsmith@whoohoo.com');
insert into Attendees values ('Noah','Johnson','njohnson@whoohoo.com');
insert into Attendees values ('William','Jones', 'wjones@whoohoo.com');
insert into Attendees values ('James','Brown', 'jbrown@whoohoo.com');
insert into Attendees values ('Logan','Davis','fluffycorn17@wahaha.com');
insert into Attendees values ('David','Miller','dmiller@whohoo.com');
insert into Attendees values ('Robert','Moore','rmoore@whohoo.com');
insert into Attendees values ('Michael','Taylor','mtaylor@whohoo.com');
insert into Attendees values ('Richard','Anderson','randerson@wahaha.com');
insert into Attendees values ('Emma','Jackson', 'em12@whohoo.com');
insert into Attendees values ('Mary','Thompson', 'mthompson@whohoo.com');
insert into Attendees values ('Olivia','Garcia', 'ogarcia@whohoo.com');
insert into Attendees values ('Jennifer','Clark','jclark@whohoo.com');
insert into Attendees values ('Victoria','Robinson', 'vrobinson@whohoo.com');
insert into Attendees values ('Zoe','Lewis', 'zlewis@wahaha.com');
insert into Attendees values ('Mia','Allen','mallen@wahaha.com');
insert into Attendees values ('Alice','Lee', 'alee@whohoo.com');

insert into Attendees values ('Ava', 'Young', 'ayoung@whohoo.com');
insert into Attendees values ('Charlotte', 'King', 'cking@whohoo.com');
insert into Attendees values ('Julia', 'Wright','jwright@wahaha.com');
insert into Attendees values ('Adam', 'Lopez', 'fluffycorn18@wahaha.ca');
insert into Attendees values ('Jacob', 'Hill', 'jhill@whohoo.com');
insert into Attendees values ('Oliver', 'Martin','omartin@whohoo.com');
insert into Attendees values ('Juan', 'Scott','jscott@whohoo.com');
insert into Attendees values ('Thomas', 'Nelson','thomas_nelson@wahaha.com');
insert into Attendees values ('John', 'Gonzalez','jgonzalez@wahaha.com');
insert into Attendees values ('Charles', 'Green','greenc@qwl.com');

/*Professional*/
insert into Professional values ('Mae', 'Perez','mperez@whohoo.com');
insert into Professional values ('Lissa', 'Roberts', 'lroberts@fe.com');
insert into Professional values ('Celica', 'Turner', 'cturner@sov.com');
insert into Professional values ('Priscilla','Phillips', 'lroberts@fe.com');
insert into Professional values ('Evelyn','Campbell', 'lroberts@fe.com');
insert into Professional values ('Roy','Parker', 'roy1234@fe.com');
insert into Professional values ('Chrom','Evans', 'chrom@fea.com');
insert into Professional values ('Lucina','Evans', 'lucina@fea.com');
insert into Professional values ('Gray', 'Stewart', 'gstewart@sov.com');
insert into Professional values ('Alm', 'Sanchez', 'alm@sov.com');
insert into Professional values ('Robin','Morris', 'rmorris@fea.com');
insert into Professional values ('Fredrick','Rogers', 'frogers@fea.com');
insert into Professional values ('Virion','Bell', 'virion@fea.com');

insert into Student values ('Liam','Smith','lsmith@whoohoo.com', '001');
insert into Student values ('Noah','Johnson','njohnson@whoohoo.com', '001');
insert into Student values ('William','Jones', 'wjones@whoohoo.com', '011');
insert into Student values ('James','Brown', 'jbrown@whoohoo.com', '011');
insert into Student values ('Logan','Davis','fluffycorn17@wahaha.com', '011');
insert into Student values ('David','Miller','dmiller@whohoo.com', '123');
insert into Student values ('Robert','Moore','rmoore@whohoo.com', '123');
insert into Student values ('Michael','Taylor','mtaylor@whohoo.com', '123');
insert into Student values ('Richard','Anderson','randerson@wahaha.com', '123');
insert into Student values ('Emma','Jackson', 'em12@whohoo.com', '124');
insert into Student values ('Mary','Thompson', 'mthompson@whohoo.com', '203');
insert into Student values ('Olivia','Garcia', 'ogarcia@whohoo.com', '203');
insert into Student values ('Jennifer','Clark','jclark@whohoo.com', null);
insert into Student values ('Victoria','Robinson', 'vrobinson@whohoo.com', null);
insert into Student values ('Zoe','Lewis', 'zlewis@wahaha.com', null);
insert into Student values ('Mia','Allen','mallen@wahaha.com', null);
insert into Student values ('Alice','Lee', 'alee@whohoo.com', null);

/*Sponsors*/
insert into Sponsor values ('Ava', 'Young', 'Google', 'ayoung@whohoo.com');
insert into Sponsor values ('Charlotte', 'King', 'Google', 'cking@whohoo.com');
insert into Sponsor values ('Julia', 'Wright', 'Google','jwright@wahaha.com');
insert into Sponsor values ('Adam', 'Lopez', 'Apple','fluffycorn18@wahaha.ca');
insert into Sponsor values ('Jacob', 'Hill', 'Facebook','jhill@whohoo.com');
insert into Sponsor values ('Oliver', 'Martin', 'Apple','omartin@whohoo.com');
insert into Sponsor values ('Juan', 'Scott', 'Microsoft','jscott@whohoo.com');
insert into Sponsor values ('Thomas', 'Nelson', 'Microsoft','thomas_nelson@wahaha.com');
insert into Sponsor values ('John', 'Gonzalez', 'Microsoft','jgonzalez@wahaha.com');
insert into Sponsor values ('Charles', 'Green', 'Microsoft','greenc@qwl.com');

insert into Is_speaking values (1, 'David','Miller','dmiller@whohoo.com');
insert into Is_speaking values (1, 'Robert','Moore', 'rmoore@whohoo.com');
insert into Is_speaking values (1, 'Adam', 'Lopez', 'fluffycorn18@wahaha.ca');
insert into Is_speaking values (2, 'David','Miller', 'dmiller@whohoo.com' );
insert into Is_speaking values (2, 'Robert','Moore','rmoore@whohoo.com');
insert into Is_speaking values (2, 'Adam', 'Lopez', 'fluffycorn18@wahaha.ca' );
insert into Is_speaking values (3,'Roy','Parker', 'roy1234@fe.com');
insert into Is_speaking values (4, 'Virion','Bell', 'virion@fea.com');
insert into Is_speaking values (5, 'Virion','Bell', 'virion@fea.com');
insert into is_speaking values (6,'Celica', 'Turner', 'cturner@sov.com');

