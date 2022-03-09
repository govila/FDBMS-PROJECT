drop database if exists Hospital_Management ;

create database if not exists Hospital_Management;

use Hospital_Management;

create table orders (order_id int(4) primary key not null,
date date not null);

desc order;

insert into orders values (1001, '2021-03-21');
insert into orders values (1002, '2021-10-4');
insert into orders values (1003, '2021-02-23');

select * from orders;
==========================================================

create table patient(patient_id int(3) primary key not null,
patient_name varchar(30) not null,
patient_address varchar(30) not null,
patient_city varchar(20) not null,
patient_state varchar(20));


desc Patient;

insert into patient values (506,'Sudhir','Rajouri_Delhi','Delhi','Delhi');
insert into patient values (507,'Devender','CP_Delhi','Delhi','Delhi');
insert into patient values (516,'Rita','Shalimar_Gaziabad','UP','UP');

select * from patient;
======================================================

create table  Medicine (medicine_id char(5) primary key not null,
medicine_description varchar(30) not null,
medicine_price int(4) not null);

desc Medicine;

insert into Medicine values ('A1016','Head Injury',1500);
insert into Medicine values ('A1002','Cardiology',1500);
insert into Medicine values ('C9822','Vascular',1500);
insert into Medicine values ('J1001','Ortho',1800);
insert into Medicine values ('G1009','Neurology',1200);
insert into Medicine values ('A2586','Dentist',700);
insert into Medicine values ('A5869','Eye Surgeon',2100);
insert into Medicine values ('G3338','Pysiotheraphy',300);
insert into Medicine values ('E8234','Dressing',200);

select * from Medicine;

======================================================

create table rel_ord_patient (order_id  int(4) not null,
patient_id int(3) not null,
foreign key (order_id) references orders (order_id),
foreign key (patient_id) references patient (patient_id),
primary key (order_id, patient_id));

desc rel_ord_patient;

insert into rel_ord_patient values (1001,506);
insert into rel_ord_patient values (1002,507);
insert into rel_ord_patient values (1003,516);

select * from rel_ord_patient;

===========================================================

create table rel_patient_medicine(medicine_id char(5) not null,
patient_id int(3) not null,
primary key (medicine_id,patient_id),
foreign key (medicine_id) references Medicine(medicine_id),
foreign key (patient_id) references patient (patient_id));

desc rel_patient_medicine;

insert into rel_patient_medicine values ('A1016',506);
insert into rel_patient_medicine values ('A1002',507);
insert into rel_patient_medicine values ('C9822',516);

select * from rel_patient_medicine;
===========================================================

create table rel_ord_medicine(medicine_id char(5) not null,
order_id int(4) not null,
primary key (medicine_id,order_id),
foreign key (medicine_id) references Medicine(medicine_id),
foreign key (order_id) references orders(order_id));

desc table rel_ord_medicine;

insert into rel_ord_medicine values ('A1016',1001);
insert into rel_ord_medicine values ('A1002',1002);
insert into rel_ord_medicine values ('C9822',1003);

select * from rel_ord_medicine;

=================================================================
