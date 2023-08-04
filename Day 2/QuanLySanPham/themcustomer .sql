SELECT * FROM QuanLyBanHang.Orders;
SELECT * FROM QuanLyBanHang.Customer;
use QuanLyBanHang;
insert into Customer(cName,cAge) values ("Minh Quan", 10);
insert into Customer(cName,cAge) values ("Ngoc Oanh", 20);
insert into Customer(cName,cAge) values ("Hong Ha", 50);
insert into Orders(cID,oDate,oTotalPrice) values (1,"2006/3/21", NULL);
insert into Orders(cID,oDate,oTotalPrice) values (2,"2006/3/23", NULL);
insert into Orders(cID,oDate,oTotalPrice) values (1,"2006/3/16", NULL);
