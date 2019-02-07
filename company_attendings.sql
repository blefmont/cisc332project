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
   
/* Sample data */

/*Attendings*/
insert into Attendings values ('Liam','Smith','lsmith@whoohoo.com');
insert into Attendings values ('Noah','Johnson','njohnson@whoohoo.com');
insert into Attendings values ('William','Jones', 'wjones@whoohoo.com');
insert into Attendings values ('James','Brown', 'jbrown@whoohoo.com');
insert into Attendings values ('Logan','Davis','fluffycorn17@wahaha.com');
insert into Attendings values ('David','Miller','dmiller@whohoo.com');
insert into Attendings values ('Robert','Moore','rmoore@whohoo.com');
insert into Attendings values ('Michael','Taylor','mtaylor@whohoo.com');
insert into Attendings values ('Richard','Anderson','randerson@wahaha.com');
insert into Attendings values ('Emma','Jackson', 'em12@whohoo.com');
insert into Attendings values ('Mary','Thompson', 'mthompson@whohoo.com');
insert into Attendings values ('Olivia','Garcia', 'ogarcia@whohoo.com');
insert into Attendings values ('Jennifer','Clark','jclark@whohoo.com');
insert into Attendings values ('Victoria','Robinson', 'vrobinson@whohoo.com');
insert into Attendings values ('Zoe','Lewis', 'zlewis@wahaha.com');
insert into Attendings values ('Mia','Allen','mallen@wahaha.com');
insert into Attendings values ('Alice','Lee', 'alee@whohoo.com');
insert into Attendings values ('Ava', 'Young', 'ayoung@whohoo.com');
insert into Attendings values ('Charlotte', 'King', 'cking@whohoo.com');
insert into Attendings values ('Julia', 'Wright', 'jwright@wahaha.com');
insert into Attendings values ('Adam', 'Lopez', 'fluffycorn18@wahaha.ca');
insert into Attendings values ('Jacob', 'Hill','jhill@whohoo.com');
insert into Attendings values ('Oliver', 'Martin', 'omartin@whohoo.com');
insert into Attendings values ('Juan', 'Scott', 'jscott@whohoo.com');
insert into Attendings values ('Thomas', 'Nelson', 'thomas_nelson@wahaha.com');
insert into Attendings values ('John', 'Gonzalez', 'jgonzalez@wahaha.com');
insert into Attendings values ('Charles', 'Green', 'greenc@qwl.com');
insert into Attendings values ('Mae', 'Perez','mperez@whohoo.com');
insert into Attendings values ('Lissa', 'Roberts', 'lroberts@fe.com');
insert into Attendings values ('Celica', 'Turner', 'lroberts@sov.com');
insert into Attendings values ('Priscilla','Phillips', 'lroberts@fe.com');
insert into Attendings values ('Evelyn','Campbell', 'lroberts@fe.com');
insert into Attendings values ('Roy','Parker', 'roy1234@fe.com');
insert into Attendings values ('Chrom','Evans', 'chrom@fea.com');
insert into Attendings values ('Lucina','Evans', 'lucina@fea.com');
insert into Attendings values ('Gray', 'Stewart', 'gstewart@sov.com');
insert into Attendings values ('Alm', 'Sanchez', 'alm@sov.com');
insert into Attendings values ('Robin','Morris', 'rmorris@fea.com');
insert into Attendings values ('Fredrick','Rogers', 'frogers@fea.com');
insert into Attendings values ('Virion','Bell', 'virion@fea.com');



/*Students*/
insert into Student values ('Liam','Smith');
insert into Student values ('Noah','Johnson');
insert into Student values ('William','Jones');
insert into Student values ('James','Brown');
insert into Student values ('Logan','Davis');
insert into Student values ('David','Miller');
insert into Student values ('Robert','Moore');
insert into Student values ('Michael','Taylor');
insert into Student values ('Richard','Anderson');
insert into Student values ('Emma','Jackson');
insert into Student values ('Mary','Thompson');
insert into Student values ('Olivia','Garcia');
insert into Student values ('Jennifer','Clark');
insert into Student values ('Victoria','Robinson');
insert into Student values ('Zoe','Lewis');
insert into Student values ('Mia','Allen');
insert into Student values ('Alice','Lee');



/*Professional*/
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


/*Sponsors*/
insert into Sponsor values ('Ava', 'Young', 'Google');
insert into Sponsor values ('Charlotte', 'King', 'Google');
insert into Sponsor values ('Julia', 'Wright', 'Google');
insert into Sponsor values ('Adam', 'Lopez', 'Apple');
insert into Sponsor values ('Jacob', 'Hill','Facebook');
insert into Sponsor values ('Oliver', 'Martin', 'Apple');
insert into Sponsor values ('Juan', 'Scott', 'Microsoft');
insert into Sponsor values ('Thomas', 'Nelson', 'Microsoft');
insert into Sponsor values ('John', 'Gonzalez', 'Microsoft');
insert into Sponsor values ('Charles', 'Green', 'Microsoft');


/* job ads */
insert into Ad values('Butcher', 'Kamloops', 'BC', 50000, 'Google'); 
insert into Ad values('Baker', 'Barrie', 'ON', 60000, 'Facebook'); 
insert into Ad values('Candlestick Maker', 'Saguenay', 'QC', 70000, 'Microsoft'); 
insert into Ad values('Junior Dev', 'Cavendish', 'PEI', 80000, 'Apple'); 
insert into Ad values('Butcher','Kamloops','BC', 50000, 'Apple');



