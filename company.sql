create table company
  (name varchar(32) not null primary key,
   emails_sent int not null,
   sponsor_level varchar(32) not null,
   foreign key(sponsor_level) references sponsor_status(metal) 
   )
   
create table sponsor_status
  (metal varchar(32) not null primary key,
   amount int,
   email_cap int
   )
   
 create table ad
  (job_title varchar(32) not null primary key,
   city varchar(32),
   province varchar(32),
   salary int,
   company varchar(32),
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
insert into status values('Butcher', 'Kamloops', 'BC', 50000, 'Google'); 
insert into status values('Baker', 'Barrie', 'ON', 60000, 'Facebook'); 
insert into status values('Candlestick Maker', 'Saguenay', 'QC', 70000, 'Microsoft'); 
insert into status values('Junior Dev', 'Cavendish', 'PEI', 80000, 'Apple'); 
