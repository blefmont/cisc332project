create table company
  (varchar(32) name not null primary key,
   int emails_sent,
   varchar(32) sponsor_level,
   foreign key(sponsor_level) references status(metal) 
   )
   
create table status
  (varchar(32) metal not null primary key,
   int amount,
   int email_cap
   )
   
 create table ad
  (varchar(32) job_title not null primary key,
   varchar(32) city,
   varchar(32) province,
   int salary,
   varchar(32) company,
   foreign key(company) references company(name) on delete cascade
   )
   
/* Sample data */

--companies
insert into company values('Google', 4, 'Platinum');
insert into company values('Facebook', 2, 'Gold');
insert into company values('Microsoft', 3, 'Silver');
insert into company values('Apple', 0, 'Bronze');

--status values
insert into status values('Platinum', 10000, 5); 
insert into status values('Gold', 5000, 4); 
insert into status values('Silver', 3000, 3); 
insert into status values('Bronze', 1000, 0); 

--job ads
insert into status values('Butcher', Kamloops, BC, 50000, 'Google'); 
insert into status values('Baker', Barrie, ON, 60000, 'Facebook'); 
insert into status values('Candlestick Maker', Saguenay, QC, 70000, 'Microsoft'); 
