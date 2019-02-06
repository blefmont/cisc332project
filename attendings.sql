create table attendings
    (fname varchar(32),
     lname varchar(32),
     primary key (fname, lname)
     );
     
create table student(
    fname varchar(32),
    lname varchar(32),
    primary key (fname, lname),
    foreign key (fname, lname) references attendings(fname, lname)
);

create table professional(
    fname varchar(32),
    lname varchar(32),
    primary key (fname, lname),
    foreign key (fname, lname) references attendings(fname, lname)
);


create table sponsor(
    fname varchar(32),
    lname varchar(32),
    primary key (fname, lname),
    foreign key (fname, lname) references attendings(fname, lname)
);



    