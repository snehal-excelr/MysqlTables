-- Single line comment
# Single line comment
/*
This is a multiline comment. 
Press ctrl + Enter to execute a command
To move to next line only press Enter key.
*/

show databases;
create database pdb1;
use pdb1;
show tables;
select * from students;
create table students(sid integer,sname char(30),age integer,course char(30));
show tables;
desc students;
-- Insert records. This is a comment.
insert into students values (1,'Amit',25,'Mysql');
insert into students values (2,'Neha',24,'Mysql');
insert into students values (3,'Soham',27,'Mysql');
insert into students values (4,'Snehal',28,'Mysql'); 
select * from students; -- comment
show tables;

-- Null Datatype
select 5+5 as result;
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
update students
set sname = 'Natasha' 
where std_id = 10;
-- If Error - type this command: set sql_safe_updates = 0;
set sql_safe_updates = 0;
select * from students;

-- set marks = null wherever marks are 0.
update students
set marks = null 
where marks = 0;
select * from students;

-- change values of 2 columns at the same time
update students
set course = 'DA', marks = 85 
where std_id = 9;
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
delete from students
where marks is null; -- Only operator you can use with Null is: 'is null' or 'is not null'
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