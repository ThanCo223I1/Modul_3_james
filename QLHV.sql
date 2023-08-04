create database Quanlyhocvien;
use Quanlyhocvien;
create table Student(
id int primary key auto_increment not null,
name varchar(60) not null,
email varchar(60) not null,
dateOfBirth date,
address varchar(60),
phoneNumber varchar(60),
class_id int ,
foreign key (class_id) references ClassRoom (class_id)
);
drop table Student;
create table ClassRoom(
class_id int primary key auto_increment not null ,
className varchar(60)
);
