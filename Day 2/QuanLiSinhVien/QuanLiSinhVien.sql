create database QuanLiSinhVien;
use QuanLiSinhVien;
create table Class(
ClassID Int Primary key auto_increment,
ClassName varchar(60) Not Null,
StartDate Datetime Not null,
Statuss Bit
);
create table Student(
StudentID Int Primary key auto_increment,
StudentName varchar (60) Not Null,
Address varchar (50),
Phone varchar (20),
Statuss Bit,
ClassID Int Not null,
FOREIGN KEY (ClassId) REFERENCES Class (ClassID)
);
create table Subject(
SubID Int Primary key auto_increment,
SubName varchar (30) Not Null,
Credit Tinyint Not null Default 1 Check (Credit >=1),
Statuss Bit Default 1
);
create table Mark(
MarkID Int Primary key auto_increment,
SubID Int Not Null,
StudentID Int Not null,
Mark Float Default 0 Check (Mark between 0 AND 100),
ExamTimes Tinyint Default 1,
UNIQUE (SubId, StudentId),
FOREIGN KEY (SubId) REFERENCES Subject (SubId),
FOREIGN KEY (StudentId) REFERENCES Student (StudentId)
);
