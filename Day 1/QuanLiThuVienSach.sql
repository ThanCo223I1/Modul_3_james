use QuanLiThuVien;
create table Sach(
maSach int auto_increment primary key,
tenSach varchar (60),
tacGia varchar(60),
theLoai varchar (60)
);
create table TacGia(
maTacGia int auto_increment primary key,
tenTacGia varchar(60),
quocTich varchar (60),
maSach int,
foreign key (maSach) references Sach(maSach)
);
create table DocGia(
maDocGia int auto_increment primary key,
tenDocGia varchar (60),
diaChi varchar (60),
soDienThoai varchar(06),
maSach int,
foreign key (maSach) references Sach(maSach)
);