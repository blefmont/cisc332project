create table Attendings
    (fname varchar(32),
     lname varchar(32),
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


create table Sponsor(
    fname varchar(32) not null,
    lname varchar(32) not null,
    primary key (fname, lname),
    foreign key (fname, lname) references Attendings(fname, lname) on delete cascade
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






    