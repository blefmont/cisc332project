create table attendings
    (fname varchar(32),
     lname varchar(32),
     primary key (fname, lname)
     );
     
create table student(
    fname varchar(32) not null,
    lname varchar(32) not null,
    primary key (fname, lname),
    foreign key (fname, lname) references attendings(fname, lname) on delete cascade
);

create table professional(
    fname varchar(32) not null,
    lname varchar(32) not null,
    primary key (fname, lname),
    foreign key (fname, lname) references attendings(fname, lname) on delete cascade
);


create table sponsor(
    fname varchar(32) not null,
    lname varchar(32) not null,
    primary key (fname, lname),
    foreign key (fname, lname) references attendings(fname, lname) on delete cascade
);

insert into attendings values ('Liam','Smith');
insert into attendings values ('Noah','Johnson');
insert into attendings values ('William','Jones');
insert into attendings values ('James','Brown');
insert into attendings values ('Logan','Davis');
insert into attendings values ('David','Miller');
insert into attendings values ('Robert','Moore');
insert into attendings values ('Michael','Taylor');
insert into attendings values ('Richard','Anderson');
insert into attendings values ('Emma','Jackson');
insert into attendings values ('Mary','Thompson');
insert into attendings values ('Olivia','Garcia');
insert into attendings values ('Jennifer','Clark');
insert into attendings values ('Victoria','Robinson');
insert into attendings values ('Zoe','Lewis');
insert into attendings values ('Mia','Allen');
insert into attendings values ('Alice','Lee');


insert into attendings values ('Ava', 'Young');
insert into attendings values ('Charlotte', 'King');
insert into attendings values ('Julia', 'Wright');
insert into attendings values ('Adam', 'Lopez');
insert into attendings values ('Jacob', 'Hill');
insert into attendings values ('Oliver', 'Martin');
insert into attendings values ('Juan', 'Scott');
insert into attendings values ('Thomas', 'Nelson');
insert into attendings values ('John', 'Gonzalez');
insert into attendings values ('Charles', 'Green');

insert into attendings values ('Mae', 'Perez');
insert into attendings values ('Lissa', 'Roberts');
insert into attendings values ('Celica', 'Turner');
insert into attendings values ('Priscilla','Phillips');
insert into attendings values ('Evelyn','Campbell');
insert into attendings values ('Roy','Parker');
insert into attendings values ('Chrom','Evans');
insert into attendings values ('Lucina','Evans');
insert into attendings values ('Gray', 'Stewart');
insert into attendings values ('Alm', 'Sanchez');
insert into attendings values ('Robin','Morris');
insert into attendings values ('Fredrick','Rogers');
insert into attendings values ('Virion','Bell');





insert into student values ('Liam','Smith');
insert into student values ('Noah','Johnson');
insert into student values ('William','Jones');
insert into student values ('James','Brown');
insert into student values ('Logan','Davis');
insert into student values ('David','Miller');
insert into student values ('Robert','Moore');
insert into student values ('Michael','Taylor');
insert into student values ('Richard','Anderson');
insert into student values ('Emma','Jackson');
insert into student values ('Mary','Thompson');
insert into student values ('Olivia','Garcia');
insert into student values ('Jennifer','Clark');
insert into student values ('Victoria','Robinson');
insert into student values ('Zoe','Lewis');
insert into student values ('Mia','Allen');
insert into student values ('Alice','Lee');


insert into sponsor values ('Ava', 'Young');
insert into sponsor values ('Charlotte', 'King');
insert into sponsor values ('Julia', 'Wright');
insert into sponsor values ('Adam', 'Lopez');
insert into sponsor values ('Jacob', 'Hill');
insert into sponsor values ('Oliver', 'Martin');
insert into sponsor values ('Juan', 'Scott');
insert into sponsor values ('Thomas', 'Nelson');
insert into sponsor values ('John', 'Gonzalez');
insert into sponsor values ('Charles', 'Green');


insert into professional values ('Mae', 'Perez');
insert into professional values ('Lissa', 'Roberts');
insert into professional values ('Celica', 'Turner');
insert into professional values ('Priscilla','Phillips');
insert into professional values ('Evelyn','Campbell');
insert into professional values ('Roy','Parker');
insert into professional values ('Chrom','Evans');
insert into professional values ('Lucina','Evans');
insert into professional values ('Gray', 'Stewart');
insert into professional values ('Alm', 'Sanchez');
insert into professional values ('Robin','Morris');
insert into professional values ('Fredrick','Rogers');
insert into professional values ('Virion','Bell');






    