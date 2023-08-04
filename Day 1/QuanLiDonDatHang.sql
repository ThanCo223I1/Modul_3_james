create database QuanLiDonDatHang;
use QuanLiDonDatHang;
create table Hang(
maHang int auto_increment primary key,
tenHang varchar (60),
donViTinh varchar (10),
moTaHang varchar (200)
);
create table NguoiDat(
maSoNguoidat int auto_increment primary key,
tenNguoiDat varchar(60)
);
create table DonViKhach(
maDonVi int auto_increment primary key,
tenDonVi varchar (100),
diaChi varchar (100),
soDienThoai varchar (10),
maSoNguoiDat int,
maSoNguoiNhan int,
foreign key (maSoNguoiDat) references NguoiDat(maSoNguoiDat),
foreign key (maSoNguoiNhan) references NguoiNhan(maSoNguoiNhan)
);
create table NguoiGiao(
maSoNguoiGiao int primary key auto_increment,
hoTenNguoiGiao varchar (100),
soPhieuGiao int,
foreign key (soPhieuGiao) references GiaoHang(soPhieuGiao)
);
create table NguoiNhan(
maSoNguoiNhan int auto_increment primary key,
tenNguoiNhan varchar (100),
soPhieuGiao int,
foreign key (soPhieuGiao) references GiaoHang(soPhieuGiao)
);
create table NoiGiao(
tenDonGiao varchar (100),
maSoDonDangGiao int,
foreign key (soPhieuGiao) references GiaoHang(soPhieuGiao)
);



create table DatHang(
maHang int,
maSoNguoiDat int,
soDonHang int,
ngayDatHang date,
soLuong int,
foreign key (maHang) references Hang (maHang),
foreign key (maSoNguoiDat) references NguoiDat(maSoNguoiDat)
);
create table GiaoHang(
soPhieuGiao int,
soLuong int,
donGia varchar(10), 
ngayGiao date
);
