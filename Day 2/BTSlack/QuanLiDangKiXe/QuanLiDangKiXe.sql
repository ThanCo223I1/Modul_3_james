create database QuanLiDangKyXe;
use QuanLiDangKyXe;
create table NhaCungCap(
maNhaCC int primary key auto_increment,
tenNhaCC varchar(60),
diaChi varchar(60),
soDienThoai varchar(10),
maSoThue varchar(60)
);
create table DangKiCungCap(
maDangKyCC int auto_increment primary key,
maNhaCC int ,
foreign key (maNhaCC) references  NhaCungCap(maNhaCC),
maLoaiDichVu int,
foreign key (maLoaiDichVu) references LoaiDichVu(maLoaiDichVu),
dongXe varchar(20),
foreign key (dongXe) references DongXe(dongXe),
maMucPhi int,
foreign key(maMucPhi) references MucPhi(maMucPhi),
ngayBatDauCungCap datetime,
ngayKetThucCungCap datetime,
soLuongXeDangKy int
);
create table LoaiDichVu(
maLoaiDichVu int primary key auto_increment,
tenLoaiDichVu varchar (60)
);
create table MucPhi(
maMucPhi int auto_increment primary key,
donGia float,
moTa varchar (60)
);
create table DongXe(
dongXe varchar(20) primary key,
hangXe varchar(30),
soChoNgoi int
);