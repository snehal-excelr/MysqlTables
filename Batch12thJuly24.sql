-- Single line comment
# Single line comment
/*
This is a multiline comment. 
Press ctrl + Enter to execute a command
To move to next line only press Enter key.
*/

show databases;
create database prdb;
use prdb;
show tables;

create table students(sid integer,sname char(30),age integer,course char(30));
show tables;
desc students;
select * from students;
-- Insert records. This is a comment.
insert into students values (1,'Amit',25,'Mysql');
insert into students values (2,'Neha',24,'Mysql');
insert into students values (3,'Soham',27,'Mysql');
insert into students values (4,'Snehal',28,'Mysql'); 
select * from students; -- comment
show tables;

-- Null Datatype
select 5*5 as result;
select '2024-09-19' as date;
select 'Hello' as greeting;
select 5 = 5 as result;
select 5 != 5 as result; -- not equal to
select 5 <> 5 as result; -- not equal to
select 5 + null as result;
select 5 = null as result;

create table patients (pid integer, pname varchar(255), dob date, toa datetime);
show tables;
desc patients;
insert into patients values (1,'Harry','2000-05-26','2023-04-04 08:30:00');
insert into patients values (2,'Potter','2000-04-27','2023-04-04 08:30:00');
insert into patients values (3,'Jim','2000-05-26','2023-04-04 08:30:00');
insert into patients values (4,'Tom','2000-05-26','2023-04-04 08:30:00');
select * from patients;
create table students(sid integer);

-- DAY 3
-- DDL Commands
create table if not exists patients (pid integer, pname varchar(255), dob date, toa datetime);
show tables;
create table test(id integer);
show tables;
drop table test;
show tables;

-- Alter Command: used to change following:
-- Table name: rename to,
-- Column name:change column, 
-- data type: modify column, 
-- no. of columns: add column, drop column 

select * from students;
alter table students add column marks integer default 0; -- add column
select * from students;
alter table students drop column age; -- delete column
select * from students;
alter table students change column sid std_id integer; -- change column name
select * from students;
desc students;
alter table students modify column sname varchar(30); -- change data type
desc students;
alter table students rename to myclass;
show tables;
-- Rename command
rename table myclass to students;
show tables;

-- DML INSERT Commands
select * from students;
insert into students values(5,'Jon',null,50); -- Type 1 Insert
select * from students;

insert into students (std_id,sname,marks) values (6,'Jim',60); -- Type 2 Insert
select * from students;
insert into students (std_id,sname,course) values (7,'Tim','Mysql'); -- by default 0 will be filled in marks column
select * from students;


-- Type 3 Insert: with single insert command we can add multiple records
insert into students values (8,'Potter','Mysql',78),(9,'Pat','Mysql',77),(10,'Albert','Mysql',88);
select * from students;

-- DML UPDATE Command
update students set sname = 'Natasha' where std_id = 10;
select * from students;
update students set course = 'DA' where sname = 'Natasha';
update students set marks=85 where std_id=8;
select * from students;
-- If Error - type this command: set sql_safe_updates = 0;
set sql_safe_updates = 0;
select * from students;

-- set marks = null wherever marks are 0.
update students set marks = null where marks = 0;
select * from students;

-- change values of 2 columns at the same time
update students set course = 'DA', marks = 85 where std_id = 9;
select * from students;

-- What will be the output of following command without where clause? 
update students set course = 'Mysql'; -- all values of course will be updated
select * from students;

-- DML DELETE Command
-- Syntax: delect from students where <condition>;
delete from students where std_id = 2;
select * from students;

/* -- delete all records which don't have any marks.
If you give following query: */
delete from students where marks = null;
select * from students;
/* 0 rows affected. Because we can't do any comparisons with null
 So correct query is as follows: */
delete from students where marks is null; -- Only operator you can use with Null is: 'is null' or 'is not null'
select * from students;

-- To delete all records from table:
delete from students;
select * from students;

-- Insert 3 records in students table:
insert into students values(1,'Ritesh','Mysql',70);
insert into students values(2,'Natasha','Mysql',90);
insert into students values(3,'Saloni','Mysql',95);
select * from students;

-- DDL DRCAT - TRUNCATE Command
truncate students; -- all records are deleted 
select * from students;
/* What is the difference between a DML command: 'delete from students' and DDL command: 'truncate students'?
 Internally when truncate is executed it deals with table structure.
 Truncate will: 1st: delete tabel with which all records will be deleted and 2nd: it will automatically create empty table again. 
 Delete will: will delete all records and empty table will remain as it is.
 So End Results of both commands are same.
 
 How Truncate creates table automatically?
 Ans: Initially we had seen: show databases;
 In that on system database was there: 'information_schema' in which all information about all tables is stored.
 It is data about data. Mysql refers that information to create table again. */
 show databases;
 show create table students;
 show create table patients;
 
 
 -- DAY 4: DQL - Data Query Language -  SELECT Command 
 /* Share practicetables5.sql and follow following steps:
 1. Open Workbench
 2. Click on Local instance
 3. Click on File - Open SQL script
 4. Select 'practicetables5' file and click Open
 5. On very first line type 'use pracicedb' (the database name that you have created)
 6. Make sure no line is selected
 7.Click on lightning icon near to floppy icon which says: Execute the selected portion of the script or everything, if there is no selection'.
 All commands in files will be executed.
 Refresh icon in front of Schemas. Under Tables tab you will get all tables
 OR
 Go to command prompt or your workbench file and type: show tables;*/
 show tables;
 -- all tables from practicetables5 will be available here.
 -- SELECT Command - only for display purpose
 
 -- display all records from myemp table
 select * from myemp;
 
 -- limit those records to first  records only
 select * from myemp limit 10; -- Top 10 records
 select * from myemp limit 10 offset 20; -- leave first 20 records (offset) and then display 10 records (limit).
 
 -- select few columns from myemp;
 select emp_id,first_name,last_name,job_id from myemp;
 select emp_id,first_name,last_name,job_id from myemp limit 10;
 select * from myemp limit 10;
 
 -- Display first 3 columns along with salary and bonus calculation.
 -- Suppose every employee gets 20% bonus of his/her salary
 select emp_id,first_name,last_name,salary,salary*0.2 from myemp limit 10; -- salary*0.2 is a derived column here.
 
 -- Instead of column name as 'salary*0.2' make it as 'bonus'
 select emp_id,first_name,last_name,salary,salary*0.2 as bonus from myemp limit 10;
 
 -- add one more column in above command as total_sal = salary + bonus
 select emp_id,first_name,last_name,salary,salary*0.2 as bonus, salary + salary*0.2 as total_sal from myemp limit 10;
 
 select * from myemp limit 10; -- check dep_id column values.
 
 -- Find UNIQUE dep_id from column
 select dep_id from myemp; -- will show all dep_id, we want only unique
 -- use 'DISTINCT' keyword
 select distinct dep_id from myemp; -- 11 rows
 
 -- Find what job roles are available in this company.
 select distinct job_id from myemp;
 
 -- If we give distinct col1, col2,... it will look for distinct combination of all columns.
 show tables;
 select * from person;
  -- find unique fnames and unique lnames from table;
  select distinct fname from person; -- John Tom
  select distinct lname from person; -- Perry Peters England Cruise
  -- Now give both fname and lname combination
  select distinct fname, lname from person; -- first 5 records will be displayed
  
    -- ORDER BY Clause - Change Order of columns - Sorting(Ascending / Descending) - Only for display purpose
 select * from myemp; -- by default it will display records in the order in which you created the table.
 select * from myemp order by  dep_id; -- default is Ascending Order
    -- Sort in Descending order
 select * from myemp order by  dep_id desc;
 select * from myemp order by  dep_id, mgr_id; -- 1st sort by dep_id and then by mgr_id
    
    -- Arrange records based on dep_id and in each department find who is junior most and who is senior most
 select * from myemp order by  dep_id, hire_date; -- senior first, junior last
 select first_name, dep_id, hire_date from myemp order by  dep_id, hire_date;
 select first_name, dep_id, hire_date from myemp order by  dep_id, hire_date desc; -- Jr 1st, Sr last. sort in asc order by dep_id and desc order by hire_date
 
 -- Find all departments in company and ordert in ascending order (10 20 30 ... 110
 select distinct dep_id from myemp;
 select distinct dep_id from myemp order by dep_id; -- put 'order by' clause always at last
 
  select * from myemp where first_name like 'A%'; -- name starting with A - 10 people
  
  
  select * from myemp where first_name like '%A'; -- name ending with A - 16 people
  select * from myemp where first_name like '%A%'; -- A anywhere in the name - 70 people

  -- Find all who are in sales department
  select * from myemp where job_id like 'SA%'; -- 34 people
  -- Find all clerks in company
  select * from myemp where job_id like '%erk'; -- 45 people
  
  -- UNDERSCORE - Single Character
  -- Find all whose name start with J and have 5 characters in name
  select * from myemp where first_name like 'J____'; -- 4 underscores - 5 people
  -- Find all whose name start with J
  select * from myemp where first_name like 'J%'; -- 16 people
  -- Find all who have 2 names in first name
  select * from myemp where first_name like '% %'; -- 1 people Jose Manuel
  -- Find all whose name is not starting with A
  
  
  select * from myemp where first_name NOT like 'A%'; -- 96 people
  
  -- GROUPING
  
  select * from patients;
  select dob from patients;
  select adddate(dob, interval 5 day)  as result from patients; -- dob - column name, adddate() - function name
  
  select year(dob) from patients;
  select year(dob), month(dob) from patients;
  select year(dob), month(dob), monthname(dob) from patients;
  select hire_date, year(hire_date) from myemp limit 10;
  -- all these above are row level functions.
  
  -- Group level functions: Aggregate functions:
  
  -- Group Functions, Joins
  -- install all tables from pacticetables(4) in newdb;
  use newdb;
  select * from cats;
  select avg(weight) from cats;
  
-- The HAVING clause 
  select * from cats;

select avg(age), breed from cats group by breed;

select avg(age), breed from cats group by breed where avg(age) > 3; -- will raise error

select avg(age), breed from cats group by breed having avg(age) > 3;

select round(weight) from cats; -- row level function
select sum(weight) from cats;
select min(weight) from cats;
select max(weight) from cats;
select count(*) from cats; -- * all records
select count(weight) from cats;
select std(weight) from cats; -- standard deviation 

-- how many breeds are there in table?


select distinct breed from cats;
-- Find total unique breeds


select count(distinct breed) from cats;
-- Find avg weight of every breed


select avg(weight) from cats group by breed;
select breed, avg(weight) from cats group by breed;
select breed,round(avg(weight)) from cats group by breed;  

-- output with 1 decimal value

select breed,round(avg(weight),1) from cats group by breed;
select breed,round(avg(weight),2) from cats group by breed;

-- Find dep_id, average salary in each dept from myemp table

select * from myemp limit 10;

select dep_id, avg(salary) from myemp group by dep_id;

-- find in each dept, under each manager what is the avg salary.

select dep_id, mgr_id, avg(salary) from myemp group by dep_id, mgr_id;

select * from cats;
select breed, avg(weight) from cats group by breed;
select sum(weight) from cats;

-- Joins in SQL
-- switch to command prompt
select * from movies;
select * from members;
-- check common columns in both tables: id in movies, movieid in members
-- common records in both tables: 1,2,5,8,10: 5 records

-- Inner Join: Common records will be displayed
select * from movies inner join members on movieid = id;
-- writing 'inner' keyword is optional
select * from movies join members on movieid = id; -- same result as above command
select * from movies inner join members on id = movieid;

-- Left Join: 1st table name is considered as left table and 2nd as right table
-- all records from left table and respective from right table
select * from movies left join members on movieid = id;

-- Right Join: opposite to left join
select * from movies right join members on movieid = id;

select * from authors;
select * from books;

-- Display authorid of authors and title of books
select title, Name from authors inner join books on books.authorid=authors.authorid; -- common records
select Name, title from authors inner join books on books.authorid=authors.authorid;
select title, Name, books.authorid from books left join authors on books.authorid=authors.authorid;


-- Cross Join: Most simplest join, No common columns are needed
-- Here we have cartecian join or cartecian product
-- Say table T1 and T2 has 3 records each. It is just a blind join.
-- Every record in T1 will be connected to all records in T2.

select * from meals;
select * from meals cross join drinks; -- Output: 9 records
-- combination of Omlet with all 3 drinks from drinks table,
-- similarly combination of sausage and pancake with all 3 drinks.
-- Display Total rate as 40.75 + 5 = 45.75


select mealname,drinkname,
meals.rate + drinks.rate as Total_Rate 
from meals cross join drinks;
-- Always have a habit of writing prefix before col.name even if there is no ambiguity or colflict.
-- Sometimes table names are very big so you can give alias to table names.
-- eg. alias 'd' can be used for table drinks
  
select m.mealname,d.drinkname,
m.rate + d.rate as Total_Rate 
from meals as m cross join drinks as d; -- will get same result as above code

-- Self Join: Connection with same table
-- Till now we established connection with different tables.
-- Find empid, firstname,lastname,mgrid from myemp table and disply top 20 records.


select emp_id,first_name,last_name,mgr_id from myemp limit 20;
-- To find manager of every person use self join i.e. connection on single table only
-- Consider 1st myemp table as emp table and 2nd myemp table as mgr table.
-- we can write inner join here.



select emp.emp_id,emp.first_name,emp.last_name,
mgr.first_name as mgr_fname,mgr.last_name as mgr_lname
from myemp as emp join myemp as mgr on emp.mgr_id=mgr.emp_id; -- 105 rows

-- DAY 6: Database Constraints, Primary and Foreign Keys, Sequence Object

use pdb1;
  show tables;
  select * from students; -- empty set
  
  desc students; -- no constraints
  insert into students values(1,'Tommy','Mysql',45);
  insert into students values(1,'Tom','Mysql',45);
  select * from students;
  drop table students;
  
  create table students(
  sid integer UNIQUE,
  sname varchar(20) NOT NULL,
  age integer CHECK (age > 18),
  course varchar(20));
 
  desc students;
  
  -- Insert some records in students table
  insert into students values(1,'Tom',19,'Mysql');
  insert into students values(1,'Tom',19,'Mysql');  
 
 -- try to insert duplicate sid: error will be raised
 
 insert into students values(1,'Tammy',19,'Mysql'); 
 insert into students values(2,'Tammy',19,'Mysql'); 
  select * from students;
  
  -- check if sid allows NULL values
  insert into students values(NULL,'John',22,'Analytics'); -- it allows us
  
  -- check if sid allows multiple NULL values
   insert into students values(NULL,'Jim',32,'Mysql'); -- it allows us as NULL is not comparable
   
   select * from students;
   
   -- put record where age<18
    insert into students values(3,'Jack',17,'Mysql'); -- error
    
    desc students;
  select * from students;
  insert into students values(4,Null,25,'Mysql'); -- read error: sname can not be null
  
  insert into students (sid,age,course) values(5,32,'Mysql'); -- error
  
  alter table students modify column sname varchar(20) NOT NULL DEFAULT "Smith";
  desc students;
  
  select * from students;
  
  insert into students values(4,NULL,25,'Mysql'); -- error
  
  insert into students (sid,age,course) values (5,32,'Mysql'); -- record inserted
  select * from students;
  
  
  -- Key Constraints
  use pdb1;
  select * from authors;
  select * from books;
  
  drop table authors; -- read the error
  select * from books;
  
  -- delete table books
  drop table books; -- successfully deleted
  select * from books;
  
  -- Now delete authors again.
  drop table authors; -- successfully deleted
  select * from authors;
  
  -- create both the tables again
  
  create table authors(authorid integer PRIMARY KEY, name varchar(100));
  
  desc authors;
  
  -- when we define primary key, authorid automatically becomes UNIQUE and NOT NULL
  
  -- books is a child table
  create table books(bookid integer PRIMARY KEY,
  title varchar(255),
  aid integer,
  FOREIGN KEY(aid) REFERENCES authors(authorid)
  ON DELETE CASCADE
  ON UPDATE CASCADE);
  
  desc books;
  -- MUL represents a FOREIGN KEY
  -- open sql script from File Menu - Practicetables(5)
  -- Selece insert into authors (8 commands) and click on lightning icon to execute
  -- select inset into books (14 commands) and execute it
  
  select * from authors;
  select * from books;
  
  -- There are 1st four records where aid=1
    
  -- Delete authorid=1 from authors table only. Then check directly in books table
  
  delete from authors where authorid=1; -- In authors only 1 row is affected
  
  select * from authors; -- now only 7 records are available
  select * from books; -- now only 10 records are available. aid=1 are deleted automatically

  -- ON UPDATE CASCADE
    select * from authors;
  -- In authors table whereever authorid=8 set it to 88
    
  update authors set authorid=88 where authorid=8;
  -- now check both the tables 
  select * from authors;
  select * from books;
  -- changes are automatically propagated to child table
  
  -- SEQUENCE (AUTO_INCREMENT)
  create table test(
  id integer PRIMARY KEY AUTO_INCREMENT,
  name varchar(20),
  age integer);
  
  desc test;
  -- insert few records in test without mentioning id values
  
  insert into test (name,age) values('Tom',22);
  insert into test (name,age) values('Tim',20),('Jim',25);
  
  select * from test; -- check id column
  -- delete all records from test
  
  -- if safety related error, then type following command
  set sql_safe_updates = 0;
  
  delete from test; 
  select * from test;
  
  insert into test (name,age) values('Tom',22);
  select * from test;
  
  
  truncate test;
  select * from test;
  insert into test (name,age) values('Tom',22);
  select * from test; -- now id is reset to 1.
  
  alter table test auto_increment=100;
  
  insert into test (name,age) values('Tim',23);
  select * from test;
  insert into test (name,age) values('Jim',25);
  select * from test;
  
  
  -- COMMIT & ROLLBACK, VIEWS
  use pdb1;
  select * from students;
  insert into students values(6,'Harry',44,'Dance');
  select * from students;
  rollback; -- We expect undo operation will be done
  select * from students; -- Record is still available in table
  
  set autocommit = 0;
  -- now again insert a record and execute rollback
  
  insert into students values(9,'SS',40,'Dance');
  select * from students;
  rollback; 
  select * from students; -- Now SS is not there in table
  -- again insert one record
  
  insert into students values(10,'Snehal',40,'Dance');
  select * from students;
  commit; -- to write record permanently in table
  
  rollback; 
  select * from students; -- because of commit record is permanently stored in table
  
  set autocommit = 1; -- reset autocommit value to 1
  
  set autocommit = 0;
  -- now again insert a record and execute rollback
  
  insert into students values(9,'SS',40,'Dance');
  select * from students;
  rollback; 
  select * from students; -- Now SS is not there in table
  -- again insert one record
  
  insert into students values(10,'Snehal',40,'Dance');
  select * from students;
  commit; -- to write record permanently in table
  
  rollback; 
  select * from students; -- because of commit record is permanently stored in table
  
  set autocommit = 1; -- reset autocommit value to 1
  
-- create a small table 'tt'

create table tt(id char);
insert into tt values('a');
insert into tt values('b');
select * from tt;
-- delete all records from tt


delete from tt;
select * from tt; -- no records are available

START TRANSACTION; -- At backend 'Autocommit=0' will be executed
insert into tt values('a');
insert into tt values('b');
select * from tt;
rollback; 


-- both the records will be removed from table because of undo action
-- Table went to previous state i.e. before 'start transaction'.
select * from tt;


-- SAVEPOINT
select * from tt;

START TRANSACTION; -- Automatically AUTOCOMMIT=0
insert into tt values('a');
insert into tt values('b');
savepoint sb;
insert into tt values('c');
insert into tt values('d');
savepoint sd;
insert into tt values('e');
insert into tt values('f');
select * from tt;
rollback to sd;
select * from tt;
commit; -- automatically autocommit=1
select * from tt;
rollback;
select * from tt;


-- DATABASE OBJECT: VIEWS
show tables;
select * from myemp limit 10;
-- now select 1st 3 columns, job_id and salary in a view

create view myview as select emp_id,first_name,last_name,job_id,salary from myemp;
select * from myview;
select * from myview limit 10;

-- Let us write a big left join query
select * from movies;
select * from members;

select mv.title,mm.first_name,mm.last_name 
from movies as mv left join members as mm
on mv.id = mm.movieid;

-- Suppose in this output I want to do some formatting
-- Put '--' in place of NULL in the output
-- For this we have a function called 'ifnull()'

select mv.title,ifnull(mm.first_name,'----'),ifnull(mm.last_name,'----')
from movies as mv left join members as mm
ON mv.id = mm.movieid;

-- check last 2 column names. Change it to fname and lname



select mv.title,
ifnull(mm.first_name,'--') as fname,
ifnull(mm.last_name,'--') as lname
from movies as mv left join members as mm
ON mv.id = mm.movieid;


-- Now for the above query write a view named 'rentals'



create view rentals as
select mv.title,
ifnull(mm.first_name,'--') as fname,
ifnull(mm.last_name,'--') as lname
from movies as mv left join members as mm
ON mv.id = mm.movieid;

select * from rentals;

-- Let us create a simple view

select * from authors;
-- put all the records in a view with authorid <15



create view aview as select * from authors where authorid<15;
select * from aview;

insert into aview values(20,'John Hamm');
select * from aview; -- only 6 records
select * from authors; -- new record is inserted in authors and not in aview

drop view aview;

create view aview as
select * from authors where authorid<15 WITH CHECK OPTION;


insert into aview values(22,'John Hamm'); -- can't add
insert into aview values(14,'Tom Cruise'); -- added
select * from authors;
select * from aview;

insert into aview values(13,'John Hamm'); -- query ok
select * from aview; -- 7 records as authorid<15
select * from authors; -- 9 records

delete from authors where authorid=13;
select * from aview; -- only 6 records
select * from authors; -- 8 records

-- INDEXES, STORED PROCEDURES INTRODUCTION


