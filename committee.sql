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








              
     

     

     
