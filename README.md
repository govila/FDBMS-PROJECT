# FDBMS-PROJECT

**Project 1**

**Case-Study** : This Project captures key entities (stakeholders) in daily operations of an MBA College Mess, 
their relationship with each other. 
This Project will help us in clear understanding of the data structure and help us in minimizing 
redundancy problems.

**Tools Used** : Oracle VM VirtualBox, Ubuntu, MySQL, MS Excel and WorkBench

**Key stakeholders involved in this project are as follows :**
1) Student – Captures Personal details, Contact Number, Program and term details, Mess 
Fee Payment Status.
2) Mess Employee – Captures Personal Details, designation, Department, salary and 
employment type
3) PGP Office – Captures registration details of students enrolled in the program. It is like 
a central repository for background check of students, faculty or other employees in 
college having a meal in mess.


**Different tables that will be created are as follows :**

1) Wages – Captures details of amount paid, date of payment ,wage id  
Captures foreign key from both Mess and Mess Committee Member entities
2) Employees – Captures the relationship of Mess Employee members. Captures foreign key from both Mess Employee and Mess 
entities
3) Eats - Captures the relationship of Student and Meal. Captures foreign key from both 
Student and Meal entities
4) Serves - Captures the relationship of Mess and Meal. Captures foreign key from both 
Mess and Meal entities
5) Meal – Captures the details of meal like Menu, Date of meal, Type of Meal etc.
6) Fee Payment- Captures various ids including student id, fee payment status and amount paid by the students etc.
7)Mess-Captures mess id, sitting capacity, operational hours, date, incharge of mess on a particular day and the number of employees.

**About Files**
1.MESS Management System.sql : This file contains detailed sql codes of the project
including all the assumptions.
2.Mess management.xlsx : This file contains the rough plan which we made before starting the project 1.This file also contains our final output that is the 
ERD we made using workbench.

![ERR Diagram (1)](https://user-images.githubusercontent.com/93238344/157742628-a4618306-80f2-4a13-beaf-b052d236ec95.png)






**Project 2**


Case-Study : The main objective of this project is to normalize the extracted pieces of information from a membership
cancellation form into a table upto 3NF.

**Tools Used** : Oracle VM VirtualBox, Ubuntu, MySQL, MS Excel and WorkBench

**About Files**

1.Hospital Management.sql : This file contains detailed sql codes of the project including all the assumptions.
2.Hospital management project.xlsx : This file contains the original table which we extracted from the hospital management form and we normalized that table upto 3NF. This file also contains our final output that is the ERD we made using workbench.

![ERR Hospital Management (1)](https://user-images.githubusercontent.com/93238344/157742428-c5bf5ae1-4c5b-4afd-a2df-34d7ac8e62dc.png)

 
