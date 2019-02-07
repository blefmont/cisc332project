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
