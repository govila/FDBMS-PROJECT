drop database if exists Mess_system ;

create database if not exists Mess_system;

use Mess_system;

create table student(student_id int(5) primary key not null, 
student_name varchar(30) not null , 
program ENUM ('BDA','FM','IMG','FMG'), 
contact_no char(10) unique, 
term ENUM ('T1','T2','T3','T4','T5','T6'));

desc student;

insert into student values(10001,'Tapan','BDA',8439131050 ,'T1');
insert into student values(10002,'Rajesh','IMG',8439131051 ,'T2');
insert into student values(10003,'Arpit','FMG',8439136558,'T4');
insert into student values(10004,'Shreya','FMG',8476556456 ,'T4');
insert into student values(10005,'Sakar','FM',9876456576,'T6');

select * from student;

#####################################

create table Fee_Payment(student_id int(5) primary key not null,
fee_payment_status ENUM ('Yes','No'),
amount_paid char(6) not null default (3600) , 
foreign key ( student_id )references student (student_id));

desc Fee_Payment;

insert into Fee_Payment (student_id,fee_payment_status)values(10001,'Yes');
insert into Fee_Payment (student_id,fee_payment_status)values(10002,'Yes');
insert into Fee_Payment (student_id,fee_payment_status)values(10003,'Yes');
insert into Fee_Payment (student_id,fee_payment_status)values(10004,'Yes');
insert into Fee_Payment (student_id,fee_payment_status)values(10005,'Yes');


select * from Fee_Payment;

/*We are condidering that the fee for every person is 3600*/

#####################################

create table meals (meal_id int(5) primary key not null,
Date date not null , 
meal_type ENUM ('Breakfast','Lunch','Dinner'),
menu_item_1 varchar(30),
menu_item_2 varchar(30),
menu_item_3 varchar(30));

desc meals;

insert into meals values(30001,'2021-01-01','Breakfast','Poha','Idli','Dosa');
insert into meals values(30002,'2021-01-01','Lunch','rajma','rice','Papad') ;
insert into meals values(30003,'2021-01-01','Dinner','Chicken','Rumali','Salad');
insert into meals values(30004,'2021-01-02','Breakfast','Sandwich','Pancakes','Omlette');
insert into meals values(30005,'2021-01-02','Lunch','Chole','Chapati','Pickle') ;
insert into meals values(30006,'2021-01-02','Dinner','Butterchicken','Paobhaji','Naan');

select * from meals;

/*We are providing three different meals*/
/*the meals are different in lunch dinner and breakfast*/

#######################################

create table mess_employees (emp_id int(4) primary key not null,
employee_name varchar(30) not null , 
emp_salary int not null);

desc mess_employees;

insert into mess_employees values(2001,'Ram',30000);
insert into mess_employees values(2002,'Mohan',40000);
insert into mess_employees values(2003,'Tanmay',35000);

select * from mess_employees;

/*Here we have entered the name of employees and their salaries*/

######################################

create table mess (mess_id int(4) primary key not null,
capacity int(3) not null default (200),
operational_hrs int (3),
no_of_employees int(2) ,
Date date not null,
Incharge varchar(30) not null);

desc mess;

insert into mess(mess_id,capacity ,operational_hrs,no_of_employees,Date,Incharge)  values (1111,100,5,10,'2021-01-01','karan');
insert into mess(mess_id,operational_hrs,no_of_employees,Date,Incharge) values (1112,7,5,'2021-01-02','shubham');


select * from mess;

/*Various aspects such as operational hours,no of employees,capacity are considered in this table*/

######################################

create table eats (student_id int(5) not null,
meal_id int(5) not null,
Primary key(student_id, meal_id),
foreign key( student_id )references student (student_id),
foreign key( meal_id )references meals (meal_id));

desc eats;

insert into eats values (10001,30001);
insert into eats values (10002,30002);
insert into eats values (10003,30003);

select * from eats;

/*Meal id and student id are the key constituent of this table*/

######################################

create table serves( mess_id int(4) not null,
meal_id int(5) not null,
primary key (mess_id),
foreign key ( meal_id )references meals (meal_id),
foreign key ( mess_id )references mess (mess_id));

desc serves;

insert into serves values(1111,30001);
insert into serves values(1112,30002);

select * from serves;

/*Meal id and student id are the key constituent of this table*/

######################################

create table employees( mess_id int(4) not null,
emp_id int(4) not null,
primary key (emp_id),
foreign key ( emp_id )references mess_employees (emp_id),
foreign key ( mess_id )references mess (mess_id));

desc employees;

insert into employees values (1111,2001);
insert into employees values (1112,2002);


select * from employees;
######################################

create table PGP_Office(Registeration_id int(4) primary key not null,
Student_id int(4) not null,  Date date not null,
foreign key ( student_id )references student (student_id));

desc PGP_Office;

insert into PGP_Office values (2221,10001,'2021-01-01');
insert into PGP_Office values (2222,10002,'2021-01-05');
insert into PGP_Office values (2223,10003,'2021-01-23');

select * from PGP_Office;

/*Registertion id of students are linked to student id on a particular date*/

######################################

create table Wages(Wage_id int(4) primary key not null,
Date date not null,
Amount int(4) not null, 
Emp_id int(4) not null, 
foreign key ( emp_id )references mess_employees (emp_id));

desc Wages;

insert into Wages values(8001,'2021-04-01',20000,2001);
insert into Wages values(8002,'2021-04-01',30000,2002);

select * from Wages;


/*wages paid to a particular employee against a particular employee id*/

######################################

CREATE USER 'shreya'@'localhost' IDENTIFIED BY 'shreya' ;			
CREATE USER 'arpit'@'localhost' IDENTIFIED BY 'arpit' ;			
CREATE USER 'sakar'@'localhost' IDENTIFIED BY 'sakar' ;			
CREATE USER 'ajay'@'localhost' IDENTIFIED BY 'ajay' ;			
			
						
dba			
GRANT create,drop, select  ON *.*  TO 'shreya'@'localhost' with grant option ;			
PGP_Office			
GRANT select, insert, update, delete   ON Mess_system.*  TO 'arpit'@'localhost' ;			
Student			
GRANT select, update   ON Mess_System.student  TO 'sakar'@'localhost' ;			
GRANT select   ON Mess_System.mess  TO 'sakar'@'localhost' ;			
Mess			
GRANT select  ON Mess_System.mess_employees  TO 'ajay'@'localhost' with grant option ;			
GRANT select  ON Mess_System.wages  TO 'ajay'@'localhost' with grant option ;			
GRANT select  ON Mess_System.meals  TO 'ajay'@'localhost' with grant option ;			
GRANT select, insert  ON Mess_System.mess  TO 'ajay'@'localhost' with grant option ;

