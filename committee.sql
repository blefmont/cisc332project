create table committee_member
	(fname varchar(32) not null, 
     lname varchar(32) not null,
     primary key (fname, lname)
     );
--chair_f is first name of chair_f, chair_l is last name of chair 
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
     
     

     

     
