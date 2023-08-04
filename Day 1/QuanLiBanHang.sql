
use QuanLyBanHang;
create table Customer(
cID int primary key auto_increment not null,
cName  varchar(25),
cAge tinyint
);
create table Orders(
oID int auto_increment primary key,
cID int,
oDate date,
oTotalPrice float,
foreign key(cID) references Customer(cID)
);
create table Product(
pID int not null auto_increment primary key,
pName varchar(60),
pPrice float
);
create table OrderDeteil(
oID int,
pID int,
odQty int,
foreign key(oID) references Orders(oID),
foreign key(pID) references Product(pID)
);