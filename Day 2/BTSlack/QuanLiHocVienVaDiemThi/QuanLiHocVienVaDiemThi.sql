create database QuanLiHocVienVaDiemThi;
create table Test(
testID int primary key auto_increment,
testName varchar(20)
);
create table  StudentTest(
RN int,
foreign key (RN) references Student(RN),
testID int,
foreign key (testID) references Test(testID),
Date dateTime,
Mark float
);
create table Student(
RN int primary key auto_increment,
Name varchar(20),
Age tinyint
);
