create database QuanLiSanPham;
create table SanPham(
maSP int auto_increment primary key,
tenSP varchar (60),
giaSP varchar(60),
soLuongSP int
);
create table DonHang(
maDonHang int auto_increment primary key,
ngayDatHang date,
giaTriDonHang float
);
create table KhachHang(
maKhachHang int auto_increment primary key,
tenKhachHang varchar (60),
diaChiKhachHang varchar(60),
soDienThoai varchar(60)
);