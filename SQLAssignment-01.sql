create database demo;

use demo;

-- creating dept table 
create table dept(
deptcode varchar(15),
deptName varchar(60),
budget integer
);


-- creating grade table 
create table grade (
gradeCode varchar(15),
gradelevel varchar(30),
gradedescription varchar(60),
basic integer
);

-- creating grade table 
create table desig(
desigcode varchar(15),
designame varchar(15)
);

-- creating Employee table 
create table emp(
empcode varchar(15),
empname varchar(60),
deptcode varchar(15),
birthdate date not null,
joindate date not null,
sex char(1) check(sex in ('M','F','T')),
desigcode varchar(15),
supcode varchar(15),
gradecode varchar(15),
gradelevel varchar(30),
basicpay integer
);

-- creating Employee table 
create table salary(
empcode varchar(15),
salmonth date not null,
basic integer,
allow integer,deduct integer
); 
-- creating history table
create table history
(empcode varchar(15),
changedate date not null, 
desigcode varchar(15), 
gradecode varchar(15), 
gradelevel varchar(30), basicpay integer); 

--  update dept for adding deptcode as primary key
Alter table dept add primary key (deptcode);

--  update desig for adding desigcode as primary key
Alter table desig add primary key (desigcode);

--  update emp for adding empcode as primary key
Alter table emp add primary key (empcode);
--  update grade for adding gradecode,gradelevel as primary key
Alter table grade add primary key(gradecode,gradelevel);

--  update salary for adding empcode,salmonth as primary key
Alter table salary add primary key (empcode,salmonth);

--  update history for adding empcode, changedate, desigcode, gradecode, gradelevel as primary key
Alter table history add primary key (empcode, changedate, desigcode, gradecode, gradelevel);


--  update foreign key for all tables
alter table emp add foreign key(deptcode) references dept(deptcode);
alter table emp add foreign key(desigcode) references desig(desigcode);
alter table emp add foreign key(supcode) references emp(empcode);
alter table emp add foreign key(gradecode,gradelevel) references grade(gradecode,gradelevel);
alter table salary add foreign key (empcode) references emp(empcode);
alter table history add foreign key (empcode) references emp (empcode);
alter table history add foreign key (desigcode) references desig(desigcode);
alter table history add foreign key (gradecode, gradelevel) references grade(gradecode, gradelevel);

-- inserting data in dept table 
insert into dept (deptcode,deptname,budget) 
values('ACCT', 'Accounts', 19),
('PRCH', 'Purchase', 25),
('SALE', 'Sales', 39),
('STOR', 'Stores', 33),
('FACL', 'Facilities', 42),
('PERS', 'Personal', 12); 


-- inserting data in grade table 
insert into grade (gradecode,gradelevel,gradedescription,basic) values ('GC1',  'GL1', 'GC-GL-1',   25000),
('GC4',  'GL1', 'GC-4-GL-1', 21000),
('GC4',  'GL4', 'GC-4-GL-4', 15000),
('GC6',  'GL1', 'GC-6-GL-1', 13000),
('GC6',  'GL2', 'GC-6-GL-2', 11000),
('GC12', 'GL1', 'GC-12-GL-1', 9000),
('GC12', 'GL2', 'GC-12-GL-2', 8500),
('GC12', 'GL3', 'GC-12-GL-3', 8000),
('GC15', 'GL1', 'GC-15-GL-1', 7000),
('GC15', 'GL2', 'GC-15-GL-2', 6500),
('GC15', 'GL3', 'GC-15-GL-3', 6000),
('GC20', 'GL1', 'GC-20-GL-1', 3500),
('GC20', 'GL2', 'GC-20-GL-2', 3000),
('GC20', 'GL3', 'GC-20-GL-3', 2500),
('GC20', 'GL4', 'GC-20-GL-4', 2000);


-- inserting data in desig table 
insert into desig(desigcode,designame) 
values ('CLRK', 'Clerk'),
('SLMN', 'Sales Man'),
('MNGR', 'Manager'),
('SPRV', 'Supervisor'),
('PRES', 'Personal'); 


-- inserting data in emp table 
insert into emp(empcode,empname,deptcode,birthdate,joindate,sex,desigcode,supcode,gradecode,gradelevel,basicpay) 
values ('7839', 'Reddy',  'ACCT', '1959-12-12', '1981-07-17', 'M', 'PRES',  null,  'GC1', 'GL1', 32000),
('7566', 'Jain',   'PRCH', '1955-01-24', '1981-04-02', 'F', 'MNGR', '7839', 'GC6', 'GL2', 12400),
('7698', 'Murthy', 'SALE', '1960-09-16', '1981-05-01', 'F', 'MNGR', '7839', 'GC6', 'GL1', 14700),
('7782', 'Menon',  'ACCT', '1967-08-30', '1981-06-09','M', 'MNGR', '7839', 'GC6', 'GL2', 12400),
('7902', 'Naik',   'PRCH', '1958-02-20', '1981-12-03', 'M', 'MNGR', '7839', 'GC6', 'GL2', 11800),
('7654', 'Gupta', 'SALE', '1957-01-22', '1981-09-28', 'M', 'SLMN', '7698', 'GC6', 'GL2', 12600),
('7521', 'Wilson', 'STOR', '1956-03-18', '1981-02-22', 'M', 'MNGR', '7698', 'GC6', 'GL2', 12200),
('7844', 'Singh',  'SALE', '1956-09-09', '1981-09-08', 'F', 'SLMN', '7698', 'GC6', 'GL1', 14300),
('7900', 'Shroff', 'SALE', '1956-06-28', '1981-12-03', 'M', 'CLRK', '7698', 'GC6', 'GL2', 12000),
('7788', 'Khan', 'PRCH', '1957-02-03', '1982-12-09', 'M', 'SPRV', '7566', 'GC6', 'GL2', 11900),
('7499', 'Roy', 'SALE', '1957-09-27', '1981-02-20', 'M', 'SLMN', '7698', 'GC6', 'GL1', 14200),
('7934', 'Kaul',   'ACCT', '1957-05-02', '1982-01-23', 'M', 'CLRK', '7782', 'GC6', 'GL2', 11950),
('7369', 'Shah',   'PRCH', '1960-05-25','1983-12-17', 'M', 'CLRK', '7902', 'GC6', 'GL2', 12200),
('7876', 'Patil',  'PRCH', '1965-09-02', '1990-12-17', 'M', 'CLRK', '7788', 'GC6', 'GL2', 12300),
('7999', 'Sinha',  'SALE', '1970-04-11', '1992-02-20', 'M', 'SLMN', '7782', 'GC6', 'GL1', 14600),
('7939', 'Rai',    'PRCH', '1988-08-10', '2012-12-06', 'M', 'CLRK', '7782', 'GC6', 'GL2', 11800),
('7192', 'John',   'ACCT', '1968-11-05', '1994-12-03', 'M', 'CLRK', '7902', 'GC6', 'GL2', 12300),
('9902', 'Ahmad',  'SALE', '1970-02-16', '1992-04-17', 'M', 'SLMN', '7698', 'GC6', 'GL1', 14200),
('7802', 'Sanghvi','STOR', '1980-05-06', '1993-01-01', 'M', 'MNGR', '7566', 'GC6', 'GL2', 12400),
('6569', 'Tiwari', 'STOR', '1989-08-19', '2010-08-21', 'M', 'MNGR', '7782', 'GC6', 'GL2', 12400);



-- inserting data in emp table 
insert into salary(empcode,salmonth,basic,allow,deduct) values('7839', '2011-12-01', 30000, 3000, 1200),
('7839', '2012-01-01', 32000, 3200, 1250),
('7839', '2012-02-01', 32000, 3200, 1250),
('7566', '2011-12-01', 12000, 600,   400),
('7566', '2012-01-01', 12400, 1240,  550),
('7566', '2012-02-01', 12400, 1240,  550),
('7698', '2011-12-01', 13900, 800,   500),
('7698', '2012-01-01', 14700, 1470,  650),
('7698', '2012-02-01', 14700, 1470,  650),
('7782', '2011-12-01', 11800, 600,   500),
('7782', '2012-01-01', 12400, 1240,  550),
('7782', '2012-02-01', 12400, 1240,  550),
('7902', '2011-12-01', 11200, 600,   450),
('7902', '2012-01-01', 11800, 1180,  550),
('7902', '2012-02-01', 11800, 1180,  550),
('7654', '2011-12-01', 11900, 700,   500),
('7654', '2012-01-01', 12600, 1260,  550),
('7654', '2012-02-01', 12600, 1260,  550),
('7521', '2011-12-01', 11400,  800,  500),
('7521', '2012-01-01', 12200, 1220,  550),
('7521', '2012-02-01', 12200, 1220,  550),
('7844', '2011-12-01', 13400,  900,  600),
('7844', '2012-01-01', 14300, 1430,  650),
('7844', '2012-02-01', 14300, 1430,  650),
('7900', '2011-12-01', 11500,  500,  300),
('7900', '2012-01-01', 12000, 1200,  550),
('7900', '2012-02-01', 12000, 1200,  550),
('7788', '2011-12-01', 11300,  600,  450),
('7788', '2012-01-01', 11900, 1190,  550),
('7788', '2012-02-01', 11900, 1190,  550),
('7499', '2011-12-01', 13400,  800,  550),
('7499', '2012-01-01', 14200, 1420,  650),
('7499', '2012-02-01', 14200, 1420,  650),
('7934', '2011-12-01', 11450,  500,  250),
('7934', '2012-01-01', 11950, 1195,  550),
('7934', '2012-02-01', 11950, 1195,  550),
('7369', '2011-12-01', 11600,  600,  450),
('7369', '2012-01-01', 12200, 1220,  550),
('7369', '2012-02-01', 12200, 1220,  550),
('7876', '2011-12-01', 11700,  600,  500),
('7876', '2012-01-01', 12300, 1230,  550),
('7876', '2012-02-01', 12300, 1230,  550),
('7999', '2011-12-01', 13950,  650,  600),
('7999', '2012-01-01', 14600, 1460,  650),
('7999', '2012-02-01', 14600, 1460,  650),
('7939', '2011-12-01', 11100,  700,  400),
('7939', '2012-01-01', 11800, 1180,  550),
('7939', '2012-02-01', 11800, 1180,  550),
('7192', '2011-12-01', 11700,  600,  500),
('7192', '2012-01-01', 12300, 1230,  550),
('7192', '2012-02-01', 12300, 1230,  550),
('9902', '2011-12-01', 13400,  800,  500),
('9902', '2012-01-01', 14200, 1420,  650),
('9902', '2012-02-01', 14200, 1420,  650),
('7802', '2011-12-01',  11900,  500,  300),
('7802', '2012-01-01',  12400, 1240,  550),
('7802', '2012-02-01',  12400, 1240,  550),
('6569', '2011-12-01', 11800,  600,  400),
('6569', '2012-01-01', 12400, 1240,  550),
('6569', '2012-02-01', 12400, 1240,  550); 



-- inserting data in history table 
insert into history (empcode,changedate,desigcode,gradecode,gradelevel,basicpay) values ( '7839', '1981-09-17',  'CLRK', 'GC15','GL1',  7000),
( '7839', '1985-12-31',  'SLMN', 'GC12','GL3',  8000),
( '7839', '1988-12-31',  'SPRV', 'GC12','GL2',  8500),
( '7839', '1990-12-31',  'MNGR', 'GC12','GL1',  9000),
( '7839', '1994-12-31',  'CLRK', 'GC6', 'GL2', 11000),
( '7839', '1998-12-31',  'SLMN', 'GC6', 'GL1', 13000),
( '7839', '2001-12-31',  'SPRV', 'GC4', 'GL4', 15000),
( '7839', '2006-12-31',  'MNGR', 'GC4', 'GL1', 21000),
( '7839', '2011-12-31',  'PRES', 'GC1', 'GL1', 25000),
( '7566', '1981-04-02',  'CLRK', 'GC12','GL3',  8000),
( '7566', '1991-12-31',  'SLMN', 'GC12','GL2',  8500),
( '7566', '2001-12-31',  'SPRV', 'GC12','GL1',  9000),
( '7566', '2011-12-31',  'MNGR', 'GC6', 'GL2', 11000),
( '7698', '1981-05-01',  'CLRK', 'GC12','GL3',  8000),
( '7698', '1991-05-01',  'SLMN', 'GC12','GL2',  8500),
( '7698', '2001-05-01',  'MNGR', 'GC12','GL1',  9000),
( '7698', '2006-05-01',  'SPRV', 'GC6', 'GL2', 11000),
( '7698', '2011-05-01',  'MNGR', 'GC6', 'GL1', 13000),
( '7782', '1981-06-09',  'CLRK', 'GC12','GL3',  8000),
( '7782', '1991-06-09',  'SLMN', 'GC12','GL2',  8500),
( '7782', '2001-06-09',  'SPRV', 'GC12','GL1',  9000),
( '7782', '2011-06-09',  'MNGR', 'GC6', 'GL2', 11000),
( '7902', '1981-12-03',  'CLRK', 'GC12','GL3',  8000),
( '7902', '1991-12-03',  'SLMN', 'GC12','GL2',  8500),
( '7902', '2001-12-03',  'SPRV', 'GC12','GL1',  9000),
( '7902', '2011-12-03',  'MNGR', 'GC6', 'GL2', 11000),
( '7654', '1981-09-28',  'SLMN', 'GC12','GL3',  8000),
( '7654', '1991-09-28',  'SLMN', 'GC12','GL2',  8500),
( '7654', '2001-09-28',  'SLMN', 'GC12','GL1',  9000),
( '7654', '2011-09-28',  'SLMN', 'GC6', 'GL2', 11000),
( '7521', '1981-02-22',  'CLRK', 'GC12','GL3',  8000),
( '7521', '1991-02-22',  'SLMN', 'GC12','GL2',  8500),
( '7521', '2001-02-22',  'SPRV', 'GC12','GL1',  9000),
( '7521', '2011-02-22',  'MNGR', 'GC6', 'GL2', 11000),
( '7844', '1981-09-08',  'SLMN', 'GC12','GL3',  8000),
( '7844', '1991-09-08',  'SLMN', 'GC12','GL2',  8500),
( '7844', '2001-09-08',  'SLMN', 'GC12','GL1',  9000),
( '7844', '2006-09-08',  'SLMN', 'GC6', 'GL2', 11000),
( '7844', '2011-09-08',  'SLMN', 'GC6', 'GL1', 13000),
( '7900', '1981-12-03',  'SLMN', 'GC12','GL3',  8000),
( '7900', '1991-12-03',  'SLMN', 'GC12','GL2',  8500),
( '7900', '2001-12-03',  'CLRK', 'GC12','GL1',  9000),
( '7900', '2011-12-03',  'CLRK', 'GC6', 'GL2', 11000),
( '7788', '1982-12-09',  'SLMN', 'GC12','GL3',  8000),
( '7788', '1992-12-09',  'CLRK', 'GC12','GL2',  8500),
( '7788', '2002-12-09',  'MNGR', 'GC12','GL1',  9000),
( '7788', '2012-12-09',  'SPRV', 'GC6', 'GL2', 11000),
( '7499', '1981-02-20',  'SLMN', 'GC12','GL3',  8000),
( '7499', '1991-02-20',  'SLMN', 'GC12','GL2',  8500),
( '7499', '2001-02-20',  'SLMN', 'GC12','GL1',  9000),
( '7499', '2006-02-20',  'SLMN', 'GC6', 'GL2', 11000),
( '7499', '2011-02-20',  'SLMN', 'GC6', 'GL1', 13000),
( '7934', '1982-01-23',  'SLMN', 'GC12','GL3',  8000),
( '7934', '1992-01-23',  'SLMN', 'GC12','GL2',  8500),
( '7934', '2002-01-23',  'CLRK', 'GC12','GL1',  9000),
( '7934', '2012-01-23',  'CLRK', 'GC6', 'GL2', 11000),
( '7369', '1983-12-17',  'SLMN', 'GC12','GL3',  8000),
( '7369', '1993-12-17',  'SLMN', 'GC12','GL2',  8500),
( '7369', '2003-12-17',  'CLRK', 'GC12','GL1',  9000),
( '7369', '2006-12-17',  'CLRK', 'GC6', 'GL2', 11000);



-- List the all employee of the office
select * from emp;

-- Q1 List the name, employee code and designationcode of each employee of the office
select empcode,desigcode from emp;

-- Q2 List all the departments and the budgets
select deptName,budget from dept;

--  Q3 List the employees and their respective department names
select empname,deptName 
from emp,dept
where emp.deptcode = dept.deptcode;

-- Q4 List the employees who are not having any superior to work under
select *
from emp
where supcode is null;

 -- Q5 List the employees who are working directly under superior most employee of the office. 
 select empcode, empname
 from emp
 where supcode in
 (select empcode
 from emp
 where supcode is null
 );
 
 -- Q6 List the employee(s) who is senior most in the office
select * ,timestampdiff(year,joindate,curdate()) as age
from emp  
order by age desc
limit 1 ;



-- Q7  List the employees who will retire from the office next
select empname,timestampdiff(year,birthdate,curdate()) as yearOld
from emp
where timestampdiff(year,birthdate,curdate()) >60;


-- Q8List the departments with the respective department managers
select empname,deptname,emp.desigcode
from emp, dept
where emp.desigcode = 'MNGR' AND emp.deptcode = dept.deptcode;


-- Q9 List the number of employees working for either ‘accounts’ or ‘personal’ or ‘purchase’ departments
select count(*) as employeesWorkingInAccountPersonalPurchase
from emp 
where deptcode in (
select deptcode
from dept
where deptname = 'accounts' OR deptname = 'personal' OR deptname = 'purchase'
);

-- Q10  List the employees working for ‘accounts’ or ‘personal’ department
 select * 
 from emp 
 where deptcode in  (
select deptcode
from dept
where deptname = 'accounts' OR deptname = 'personal'
);

-- Q11  List the employees working for ‘accounts’ and ‘personal’ department
 select * 
 from emp 
 where deptcode in  (
select deptcode
from dept
where deptname = 'accounts' and deptname = 'personal'
);

-- Q12. List the employees working for ‘accounts’ but not for ‘personal’ department
 select * 
 from emp 
 where deptcode in  (
select deptcode
from dept
where deptname = 'accounts' and deptname   != 'personal'
);


-- Q13 List the youngest employee of the office
select empname,timestampdiff(year,birthdate,curdate()) as age
from emp
order by age asc
limit 1;


-- Q14 List the employees who are drawing basic pay not equal to 12400.
select empname,basicpay
from emp
where basicpay != '12400';

-- Q15  List the employees who are drawing basic salary between 11000 and 12000
select empname , basicpay
from emp
where  basicpay between 11000 and 12000;


-- Q16 List the employees who are drawing basic salary not between 11000 and 12000
select empname , basicpay
from emp
where  basicpay not between 11000 and 12000;

-- Q17 . List the employees who got salary allowance between Rs.1000 to Rs.1500 in the month of January 2012.
select *
from emp
where empcode in (
select empcode
from salary
where allow between 1000 and 1500
and salmonth between '2012-01-01' and '2012-01-31'
);


-- Q18 List the employees whose name ends with ‘i’ or ‘y’ 
select empname
from emp
where empname like "%i" or empname like "%y" ;


-- Q19 List the employees who have atleast 25 years of experience
select empname,joindate
from emp
where 25 <= timestampdiff(year,joindate,curdate());

-- Q20 List the ‘Salesmen’ who have minimum 30 to 20 years of experience
select empname
from emp 
where timestampdiff(year,joindate,curdate()) between 20 and 30
and desigcode in
(
select desigcode
from desig
where designame =  'Sales Man'
);

 -- Q21 List the basic salary and half of the basic salary for each employee. 
 select basicpay ,basicpay/2 as halfOfbasicSalary
 from emp;
 
 -- Q22 List the employees and the latest take-home-pay of each employee. (Hint: Take- home-pay = basic + allowance - deductions) 
select empname, basic+allow-deduct as takeHomePay
from emp,salary;

-- Q23 . List the employees and the latest take-home-pay of each employee of ‘Accounts’ department. 
select empname,dept.deptName, basic+allow-deduct as takeHomePay
from emp,dept,salary
where emp.deptcode = dept.deptcode
and dept.deptName = 'Accounts';


-- Q24 List employees and their respective ages. 
select empname , timestampdiff(year,birthdate,curdate()) as age
from emp
order by age asc;

-- Q25  List all the ‘Accounts’ department employees, first ordered by their age and then by their names. 
select timestampdiff(year,birthdate,curdate()) as age,empname 
from emp,dept
where emp.deptcode = dept.deptcode
and dept.deptName = 'Accounts'
order by age asc;

-- Q26  List the number of employees directly reporting to ‘Reddy’
select count(*) as NoOfEmployee
from emp
where supcode in (select empcode
from emp
where empname = 'Reddy'
);


-- Q27  List the employees who have at least one person working under him/her and the 
-- number of their subordinates. List the employee with highest number of 
-- subordinates first, next the person with next highest number of subordinates and 
-- so on. 
select supcode, count(*) AS numOfSubordinates
from emp
where supcode is not null
group by  supcode
order by  numOfSubordinates desc;


-- Q28 List the employees who have minimum 3 employees working under him/her. 
select supcode, count(*) AS numOfSubordinates
from emp
where supcode is not null
group by  supcode
having numOfSubordinates >= 3;


-- Q29 9. List the minimum and maximum salaries drawn in each grade code. 
select gradecode,min(basic+allow-deduct)as minimumSalaries ,max(basic+allow-deduct) as maximumSalaries
from salary,emp
where emp.empcode = salary.empcode
group by gradecode;


-- Q30. List the employees with names of their supervisors (Hint: Use Join). 
select e.empname as employee ,s.empname as supervisors
from emp e inner join emp s
on e.supcode =  s.empcode;


-- Q31  List the number of officers reporting to each supervisor having more than 3 people working under them 
select supcode, count(*) AS numOfOfficers
from emp
where supcode IS NOT NULL
group by  supcode
having count(*) > 3;

-- Q32 List the employees who have not got any promotion till now.
select empname
from emp,history
where emp.empcode != history.empcode;

-- Q33 List the employee with maximum number of promotions. Also list the number of promotions that he/she got.
select emp.empname,emp.empcode, count(*) as NoPromotions
	from emp,history
	where emp.empcode = history.empcode
	group by empcode 
	order by NoPromotions desc
	limit 1;


-- Q34 . List the employees who got promoted in the year 1991. count(*) as NoOFpromotion
select emp.empcode as CODES, emp.empname as Thenames 
from emp
join history on emp.empcode = history.empcode
where history.changedate between '1991-01-01' and '1991-12-31'
group by  emp.empcode,
    emp.empname;

-- Q35 List the department budget and the total salary drawn (by the employees of this department).
select emp.empcode,emp.empname,deptName,budget,allow+basic-deduct as netSalary
from dept,emp
join salary on emp.empcode = salary.empcode;

-- Q36  Display the employee names in full uppercase.
select UPPER(empname) as Thenames from emp;

-- Q37 . List all the employees drawing salary higher than the salary drawn by ‘Jain --
select empname, (basic+allow-deduct) as netSal
from emp
join salary on emp.empcode = salary.empcode
 where (salary.basic + salary.allow - salary.deduct) > (
select  AVG(salary.basic + salary.allow - salary.deduct)
from emp
join salary on emp.empcode = salary.empcode
where empname = 'Jain'
);

SELECT empname, (s.basic+s.allow-s.deduct) AS TotalSalWithdraw FROM emp e
JOIN
    salary s ON e.empcode = s.empcode
WHERE (s.basic+s.allow-s.deduct) IN (
	select (salary.basic+salary.allow-salary.deduct)
	from emp
	join salary on e.empcode = s.empcode
	where empname = 'Jain'
);


-- Q38. List all the employees who have higher salary than all the employees who draw salary in the range of 11000 to 12000.
select e.empcode,
	e.empname
from emp e join salary s on e.empcode = s.empcode 
where  (s.basic + s.allow - s.deduct) >
ALL(
	select (s.basic + s.allow - s.deduct) as netSal
	from salary s
	where (s.basic + s.allow - s.deduct)  between 11000 and 12000
    );
    
-- Q39  List all the employees who have greater than average pay. Display the result in the increasing order of the salary.-- 
select empname, (s.basic + s.allow - s.deduct) AS NET_salary
from emp e 
join salary s on e.empcode = s.empcode 
where (s.basic + s.allow - s.deduct) > ALL(
	
    select avg(s.basic + s.allow - s.deduct) 
	from salary s

);


-- Q40  List the employees who draws highest salary
select empname, (s.basic + s.allow - s.deduct) AS NET_salary
from emp ,salary s
where (s.basic + s.allow - s.deduct) =
(
select (s.basic + s.allow - s.deduct)
from emp ,salary s
order by (s.basic + s.allow - s.deduct)  desc
limit 1
);

select empname, sum(s.basic + s.allow - s.deduct) AS NET_salary
from emp e 
join salary s on e.empcode = s.empcode
where (s.basic + s.allow - s.deduct) =
(
select max(s.basic + s.allow - s.deduct)
from salary s
)
group by e.empname;


-- Q41 . List all the employees other than the employees who draw highest salary
select empname, (s.basic + s.allow - s.deduct) AS NET_salary
from emp ,salary s
where (s.basic + s.allow - s.deduct) !=
(
select (s.basic + s.allow - s.deduct)
from emp ,salary s
order by (s.basic + s.allow - s.deduct)  desc
limit 1
)
order by NET_salary desc;

select empname, sum(s.basic + s.allow - s.deduct) AS NET_salary
from emp e 
join salary s on e.empcode = s.empcode
where (s.basic + s.allow - s.deduct) !=
(
select max(s.basic + s.allow - s.deduct)
from salary s
)
group by e.empname;


-- Q42. List the employees who draw highest salary in each department 
select e1.empname,sex, dept.deptName, (s.basic + s.allow - s.deduct) as Netsalary
from emp e1 
join dept on e1.deptcode = dept.deptcode
join salary s on e1.empcode = s.empcode
where  (s.basic + s.allow - s.deduct) =
(
	select max(s2.basic + s2.allow - s2.deduct)
    from salary s2
    join emp e2 on s2.empcode = e2.empcode
    where e2.deptcode = e1.deptcode
);

-- Q43. List the employee(s) getting second highest salary
select empname, (s.basic + s.allow - s.deduct) as secondHighestSalary
from emp
join salary s on emp.empcode = s.empcode
where (s.basic + s.allow - s.deduct) =
(
	select max(s2.basic + s2.allow - s2.deduct)
    from salary s2
    where(s2.basic + s2.allow - s2.deduct)<
    (
    select max(s3.basic + s3.allow - s3.deduct)
    from salary s3
    )
);


--  Q44 List the employee(s) who are getting fifth highest salary
select empname, (s.basic + s.allow - s.deduct) as secondHighestSalary
from emp
join salary s on emp.empcode = s.empcode
where (s.basic + s.allow - s.deduct) =
(
	select max(s2.basic + s2.allow - s2.deduct)
    from salary s2
    where(s2.basic + s2.allow - s2.deduct)<
    (
		select max(s3.basic + s3.allow - s3.deduct)
		from salary s3
		where(s3.basic + s3.allow - s3.deduct)<
		(
			select max(s4.basic + s4.allow - s4.deduct)
			from salary s4
            where(s4.basic + s4.allow - s4.deduct)<
			(
				select max(s5.basic + s5.allow - s5.deduct)
				from salary s5
                where(s5.basic + s5.allow - s5.deduct)<
				(
					select max(s6.basic + s6.allow - s6.deduct)
					from salary s6
				)
			)
    )
    )
);


-- Q45. List the department name of the female employee who draws the highest salary higher than any other female employee
select deptName,sex,(s.basic + s.allow - s.deduct) as HighestSalaryInFemale
from emp e join salary s on e.empcode = s.empcode
join dept on dept.deptcode = e.deptcode
where e.sex = 'F' and  
(s.basic + s.allow - s.deduct)=
(
	select max(s2.basic + s2.allow - s2.deduct)
	from salary s2
    join emp e2 on e2.empcode = s2.empcode
    where e2.sex ='F'
);

-- 46. List all male employees who draw salary greater than at least on female employee
select empname,sex,(s.basic + s.allow - s.deduct) as HighestSalarythen
from emp e join salary s on e.empcode = s.empcode
where e.sex = 'M' and  
(s.basic + s.allow - s.deduct)>
(
	select min(s2.basic + s2.allow - s2.deduct)
	from salary s2
    join emp e2 on e2.empcode = s2.empcode
    where e2.sex ='F'
);

-- Q47  List the departments in which average salary of employees is more than average salary of the company
select dept.deptName
from emp e
join salary s on e.empcode = s.empcode
join dept on e.deptcode = dept.deptcode
group by  dept.deptName
having AVG(s.basic + s.allow - s.deduct) >
(
	select avg(s2.basic + s2.allow - s2.deduct)
	from salary s2
);

-- Q48. List the employees drawing salary lesser than the average salary of employees working for ‘accounts’ department
select e.empname,(s.basic + s.allow - s.deduct) AS salary
from emp e
join salary s on e.empcode = s.empcode
join dept d on e.deptcode = d.deptcode
where (s.basic + s.allow - s.deduct) < 
(
        select avg(s2.basic + s2.allow - s2.deduct)
        from salary s2
        join emp e2 on s2.empcode = e2.empcode
        join dept d2 on e2.deptcode = d2.deptcode
        where d2.deptName = 'Accounts'
    );


