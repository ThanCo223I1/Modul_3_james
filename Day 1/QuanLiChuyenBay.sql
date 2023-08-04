
use DatVeMayBay;
create table ChuyenBay(
maChuyenBay int auto_increment primary key,
ngayBay date,
diemKhoiHanh varchar(60),
diemDen varchar(60),
gioKhoiHanh time,
gioDen time
);
create table KhachHang(
maKhachHang int auto_increment primary key,
tenKhachHang varchar (60),
soCCCD varchar(60),
soDienThoai varchar(10)
);


create table DatVe(
maVe int auto_increment primary key,
maChuyenBay int,
maHanhKhach varchar (60),
maChuyenBay int,
maKhachHang int,
foreign key(maChuyenBay) references ChuyenBay(maChuyenBay),
foreign key(maKhachHang) references KhachHang(maKhachHang)
);
