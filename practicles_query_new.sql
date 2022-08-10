/*practicle 2*/
show databases;

create database Dhiraj;

drop database Dhiraj;

use Dhiraj;

CREATE TABLE potluck
(
id int not null primary key auto_increment ,
name_ varchar(20),
food varchar(30) ,
confirmed char(1),
signup_date date
);

describe potluck;

/* practicle 3 */
insert into potluck  (id,name_,food,confirmed,signup_date) VALUES (2, 
"Sandy", "Key line Tarts","N", '2012-04-14');

insert into potluck  (id,name_,food,confirmed,signup_date) VALUES (3, 
"Tom", "BBQ","Y", '2012-04-18');

insert into potluck  (id,name_,food,confirmed,signup_date) VALUES (4, 
"Tina", "Salad","Y", '2012-04-10');

select *from potluck;

update potluck set confirmed ='Y' where potluck.name_ ="Sandy";

delete from potluck where name_='Sandy';


/* practicle 4*/
show databases;
use dhiraj;

Create table demo_people (
name_ varchar(20)  ,
phone float ,
pid int not null,
primary key(pid)
);

insert into demo_people(name_,phone,pid) VALUES ("Mr Brown", 01225708225,1);
insert into demo_people(name_,phone,pid) VALUES ("Miss Smith",01225899360,2);
insert into demo_people(name_,phone,pid) VALUES ("Mr Pullen",01380724040,3);

Create table demo_property (
pid int ,
spid int not null ,
Selling varchar(20),
primary key(Spid)
);

insert into demo_property(pid,Spid,Selling) VALUES (1,1,"House Farm");
insert into demo_property(pid,Spid,Selling) VALUES (3,2,"The Willows");
insert into demo_property(pid,Spid,Selling) VALUES (3,3,"Tall Trees");
insert into demo_property(pid,Spid,Selling) VALUES (3,4,"The Melksham Florist");
insert into demo_property(pid,Spid,Selling) VALUES ( 4,5,"Dun Roamin");

select name_, phone, selling from demo_people join demo_property on
demo_people.pid = demo_property.pid;

select name_, phone, selling from demo_people left join demo_property
on demo_people.pid = demo_property.pid;

select name_, phone, selling from demo_people right join demo_property
on demo_people.pid = demo_property.pid;

SELECT name_,phone,pid FROM demo_people WHERE 
phone= (SELECT MAX(phone) FROM demo_people);

create view X as select *from demo_people
Where demo_people.pid=demo_people.pid;

select *from X;


/*practicle 5 */

CREATE TABLE student
(stud_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT , 
m1 INT,
m2 int,
m3 int);
show tables ;

insert into student (m1,m2,m3)values
(40,40,40),
(50,50,50),
(60,60,60);

Select *from student ;
/* DROP PROCEDURE IF EXISTS cal_grade; Use this command if want to drop procedure */ 
DELIMITER $$
Create procedure cal_grade()
Begin
DECLARE pid,pm1,pm2,pm3,pm INT;

/*declare a local variable for a subsequent handler*/

DECLARE fetched INT DEFAULT 0;
DECLARE student_cursor CURSOR FOR
Select *FROM student;

/* start tranction context.*/
START TRANSACTION;
/*set save point.*/
SAVEPOINT all_or_none;
/* open a student cursor.*/
OPEN student_cursor;
Cursor_stud:LOOP
/*Fetch a row at a time.*/
FETCH student_cursor
INTO pid,pm1,pm2,pm3;
/* PLACE THE CATCH HANDLER FOR NO MORE ROW FOUND
IMMEDIATELY AFTER THE FETCHOPERATION*/
IF fetched =1 THEN LEAVE cursor_stud;
END IF;
Set pm =(pm1+pm2+pm3)/3;
If pm>=70 then
Select concat(‘distinction’,pm)as “rows”;
End if;
If pm>=60 then
Select concat(‘First’,pm)as “rows”;
End if;
If pm>=50 then
Select concat(‘second’,pm)as “rows”;
End if;
If pm<50 then
Select concat(‘Fail’,pm)as “rows”;
End if;
END LOOP;
CLOSE student_cursor;
END;
$$
delimiter ;
SELECT 'CAL_debug_loop AS' statement;
CALL CAL_debug_loop();

/* practicle 6 */
use Dhiraj;
create table customers(
ID int not null,
NAME_ varchar(20),
AGE int not null,
ADDRESS varchar(80),
SALARY float
);

insert into customers (ID,NAME_,AGE,ADDRESS,SALARY) VAlues (1,"Ramesh",32,"Ahmedabad",3500.00);
insert into customers (ID,NAME_,AGE,ADDRESS,SALARY) VAlues (2,"Khilan",25,"Delhi",3000.00 );
insert into customers (ID,NAME_,AGE,ADDRESS,SALARY) VAlues (3,"kaushik",23,"Kota",3500.00);
insert into customers (ID,NAME_,AGE,ADDRESS,SALARY) VAlues (4,"Chaitali",25,"Mumbai",8000.00);
insert into customers (ID,NAME_,AGE,ADDRESS,SALARY) VAlues (5,"Hardik",27,"Bhopal",10000.00);
insert into customers (ID,NAME_,AGE,ADDRESS,SALARY) VAlues (6,"Komal",22,"MP",6000.00);

select *from customers;

/*DROP PROCEDURE IF EXISTS CUR3*/
delimiter $$ 
CREATE PROCEDURE CUR3() 
BEGIN 
DECLARE total_rows INT; 
UPDATE CUSTOMERS SET SALARY = SALARY + 500; 
END; 
$$ 

call CUR3(); 
$$ 

select * from CUSTOMERS; 
$$ 

/* Explicit cursor */
create table employees(
ID int not null,
Name_ varchar(30),
email_list varchar(30)
);

drop table employees;

insert into employees (ID,Name_,email_list) Values(1,"Gaurav","gaurav@gmail.com");
insert into employees (ID,Name_,email_list) Values(2,"Hitesh","hitesh@gmail.com");
insert into employees (ID,Name_,email_list) Values(3,"Dhiraj","dhiraj@gmail.com");
insert into employees (ID,Name_,email_list) Values(4,"Girish","girish@gmail.com");
insert into employees (ID,Name_,email_list) Values(5,"Nitin","nitin@gmail.com");
insert into employees (ID,Name_,email_list) Values(6,"Rupesh","rupesh@gmail.com");

select *from employees;

alter table employees add v_email varchar(100);
alter table employees add v_finished integer;
alter table employees drop column v_finished

update employees set v_email="company1@cmail.com" where ID=1;
update employees set v_email="company1@cmail.com" where ID=2;
update employees set v_email="company1@cmail.com" where ID=3;
update employees set v_email="company1@cmail.com" where ID=4;
update employees set v_email="company1@cmail.com" where ID=5;
update employees set v_email="company1@cmail.com" where ID=6;

update employees set v_finished="1" where ID=1;
update employees set v_finished="2" where ID=2;
update employees set v_finished="3" where ID=3;
update employees set v_finished="4" where ID=4;
update employees set v_finished="5" where ID=5;
update employees set v_finished="6" where ID=6;

/* practicle 7 */
/* in parameter*/
delimiter $$ 
create procedure GetAddress(IN custaddress varchar(100)) 
begin 
select * from CUSTOMERS 
where ADDRESS=custaddress; 
end; 
$$ 

call GetAddress('Mumbai'); 

/* out prameter */

DELIMITER $$ 
CREATE PROCEDURE c(IN custadd char(25), 
OUT total INT) 
BEGIN 
SELECT count(ID) 
INTO total 
FROM CUSTOMERS 
WHERE address=custadd; 
END$$

CALL c('nashik',@total); SELECT @total;

/* in out parameter */
DELIMITER $$ 
CREATE PROCEDURE set_counter(INOUT count INT(4),IN inc INT(4)) 
BEGIN 
SET count = count + inc; 
END$$ 
SET @counter=1;

select @counter; 

call set_counter(@counter,1);

select @counter; 

/*stored function */
delimiter $$
CREATE FUNCTION CustomerLevel(cust_salary decimal) RETURNS VARCHAR(10) 
DETERMINISTIC 
BEGIN 
DECLARE lvl varchar(10); 
IF cust_salary > 10000 THEN 
SET lvl = 'PLATINUM'; 
ELSEIF (cust_salary <= 10000 AND cust_salary >= 5000) THEN 
SET lvl = 'GOLD'; 
ELSEIF cust_salary < 5000 THEN 
SET lvl = 'SILVER'; 
END IF; 
RETURN (lvl); 
END $$

SELECT NAME_,CustomerLevel(SALARY) FROM CUSTOMERS ORDER BY NAME_;
$$


/* ex 8 */

create table employees8 (
id int not null,
employee_no int not null ,
lastname varchar(20),
primary key(id)
);

insert into employees8 (id,employee_no,lastname) values(101,1,"patil");
insert into employees8 (id,employee_no,lastname) values(102,2,"chavan");
insert into employees8 (id,employee_no,lastname) values(103,4,"Pawar");

select *from employees8

/*creating triggers*/

create table employees_audit(
id int not null,
employee_no int not null,
lastname varchar(30),
primary key(id)
);

delimiter $$
CREATE TRIGGER before_employee_update BEFORE UPDATE ON employees8 
FOR EACH ROW 
BEGIN INSERT INTO employees_audit 
SET action = 'update', 
employee_no = OLD.employee_no, lastname = OLD.lastname, changedat = NOW(); 
END;

drop trigger before_employee_update

delimiter ;

show triggers; 

show tables;
/*Update employee table*/
create table empfake (
id int not null,
employee_no int not null,
lastname varchar(20),
changedat date,
action varchar(20)
);
select *from empfake;

insert into empfake values(1,4,"Khan","2022-05-26","update");

UPDATE employees8 SET lastname = "Khan" WHERE lastname ="Pawar";

select *from employees_audit;

/* ex 9 */
