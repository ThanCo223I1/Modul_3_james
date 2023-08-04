create database managerStaff;
use managerStaff;
create table Staff(
staff_id int primary key auto_increment not null,
staff_name varchar(60) not null,
staff_email varchar(60)not null,
staff_address varchar(60),
staff_salary float not null,
department_id int,
foreign key(department_id) references Department(department_id)
);
create table Department(
department_id int primary key not null auto_increment,
department_name varchar(60)
);