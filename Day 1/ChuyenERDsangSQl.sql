use Mohinhquanhe;
create table Phieuxuat(
soPhieuXuat int not null auto_increment primary key,
ngayXuat date
);
create table VatTu(
maVatTu int auto_increment primary key,
tenVatTu varchar(60)
);
create table PhieuNhap(
soPhieuNhap int auto_increment primary key,
ngayNhap date
);
create table DonDatHang(
soDonHang int auto_increment primary key,
ngayNhapDonHang date,
maNhaCungCap int,
foreign key(maNhaCungCap) references NhaCungCap(maNhaCungCap)
);
create table NhaCungCap(
maNhaCungCap int auto_increment primary key,
tenNhaCungCap varchar(60),
diaChi varchar(100),
soDienThoai varchar(10)
);
create table ChiTietPhieuXuat(
soPhieuXuat int,
maVatTu int,
donGiaXuat float,
soLuongXuat int,
foreign key (soPhieuXuat) references PhieuXuat(soPhieuXuat),
foreign key (maVatTu) references VatTu(maVatTu)
);
create table ChiTietPhieuNhap(
maVatTu int,
soPhieuNhap int,
donGiaNhap float,
soLuongNhap int,
foreign key (maVatTu) references VatTu(maVatTu),
foreign key (soPhieuNhap) references PhieuNhap(soPhieuNhap)
);
create table ChiTietDonHang(
maVatTu int,
soDonHang int,
foreign key (maVatTu) references VatTu(maVatTu),
foreign key (soDonHang) references DonDatHang(soDonHang)
);