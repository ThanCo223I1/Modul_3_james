create database BT_SQL_Trigger;
use BT_SQL_Trigger;
create table KhachHang(
maKhachHang int primary key auto_increment,
hoTen varchar (60),
diaChi varchar(60),
soDienThoai varchar(10),
ngaySinh date,
doanhSo float,
ngayDangKi date
);
create table NhanVien(
maNhanVien int primary key auto_increment,
tenNhanVien varchar (60),
ngayVaoLam date,
soDienThoai varchar (10)
);
drop table NhanVien;

create table SanPham(
maSanPham int primary key auto_increment,
tenSanPham varchar(40),
donViTinh int,
nuocSanXuat varchar(30),
gia float
);
create table HoaDon (
soHoaDon int primary key auto_increment,
ngayHoaDon date,
maKhachHang int,
foreign key (maKhachHang) references KhachHang(maKhachHang),
maNhanVien int,
foreign key (maNhanVien) references NhanVien(maNhanVien),
triGiaHD float
);
drop table Hoadon;


create table ChiTietHoaDon(
soHoaDon int,
foreign key (soHoaDon) references HoaDon(soHoaDon),
maSanPham int,
foreign key (maSanPham) references SanPham (maSanPham),
soLuongSP int
);
drop table ChiTietHoaDon;


insert into SanPham value (1,"SanPham1",10,"Japan",100.000);
insert into SanPham (tenSanPham,donViTinh,nuocSanXuat,gia) value ("SanPham2",1,"TrungQuoc",100.000);
insert into SanPham (tenSanPham,donViTinh,nuocSanXuat,gia) value ("SanPham3",2,"VietNam",200.000);
insert into SanPham (tenSanPham,donViTinh,nuocSanXuat,gia) value ("SanPham4",3,"ThaiLand",500.000);
insert into SanPham (tenSanPham,donViTinh,nuocSanXuat,gia) value ("SanPham5",2,"TrungQuoc",600.000);
insert into SanPham (tenSanPham,donViTinh,nuocSanXuat,gia) value ("SanPham6",10,"TrungQuoc",700.000);
insert into SanPham (tenSanPham,donViTinh,nuocSanXuat,gia) value ("SanPham7",3,"TrungQuoc",800.000);

insert into NhanVien value (1,"NhanVien1","2006/2/2","0902222333");
insert into NhanVien (tenNhanVien,ngayVaoLam,soDienThoai) value ("NhanVien2","2006/2/3","0902222333");
insert into NhanVien (tenNhanVien,ngayVaoLam,soDienThoai) value ("NhanVien3","2006/2/4","0902222333");

insert into KhachHang value (1,"Nguyễn Văn A", "Hà Nội", "0900111111","1998/2/3",100.000,"2006/1/1");
insert into KhachHang(hoTen,diaChi,soDienThoai,ngaySinh,doanhSo,ngayDangKi) value ("Nguyễn Văn B", "Hà Nội", "0900111111","1989/12/3",200.000,"2006/2/1");
insert into KhachHang(hoTen,diaChi,soDienThoai,ngaySinh,doanhSo,ngayDangKi) value ("Nguyễn Văn C", "Hà Nội", "0900111111","1990/3/3",200.000,"2006/2/3");
insert into KhachHang(hoTen,diaChi,soDienThoai,ngaySinh,doanhSo,ngayDangKi) value ("Nguyễn Văn D", "Hà Nội", "0900111111","1990/3/4",400.000,"2006/2/4");

insert into HoaDon value (1,"2006/2/2",1,1,200.000);
insert into HoaDon(ngayHoaDon,maKhachHang,maNhanVien,triGiaHD) value ("2006/2/3",2,2,300.000);
insert into HoaDon(ngayHoaDon,maKhachHang,maNhanVien,triGiaHD) value ("2006/2/4",2,2,800.000);
insert into HoaDon(ngayHoaDon,maKhachHang,maNhanVien,triGiaHD) value ("2006/10/4",1,2,600.000);
insert into HoaDon(ngayHoaDon,maKhachHang,maNhanVien,triGiaHD) value ("2006/10/5",1,2,700.000);

insert into ChiTietHoaDon values (4,5,5);
insert into ChiTietHoaDon values (5,4,2);
insert into ChiTietHoaDon values (4,5,1);
insert into ChiTietHoaDon values (4,3,3);
insert into ChiTietHoaDon values (4,4,3);
insert into ChiTietHoaDon values (4,2,3);
insert into ChiTietHoaDon values (4,1,3);


-- Bắt Đầu:
-- Câu 1: Có bao nhiêu sản phẩm khác nhau được bán ra trong năm 2006.
SELECT COUNT(Sanpham.maSanPham) AS soLuongSanPham
FROM SanPham
JOIN ChiTietHoaDon ON SanPham.maSanPham = ChiTietHoaDon.maSanPham
JOIN HoaDon ON ChiTietHoaDon.soHoaDon = HoaDon.soHoaDon
WHERE YEAR(HoaDon.ngayHoaDon) = 2006;


-- Câu 2: Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu ?
SELECT MAX(triGiaHD) AS triGiaCaoNhat, MIN(triGiaHD) AS triGiaThapNhat
FROM HoaDon;

-- Câu 3: Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?
select avg (HoaDon.triGiaHD) as Giá_Trị_TB from HoaDon
WHERE YEAR(HoaDon.ngayHoaDon) = 2006;

-- Câu 4: Tính doanh thu bán hàng trong năm 2006.
select Sum(HoaDon.triGiaHD) as Tổng_DoanhThu from HoaDon
WHERE YEAR(HoaDon.ngayHoaDon) = 2006;

-- Câu 5: Tìm số hóa đơn có trị giá cao nhất trong năm 2006.
SELECT MAX(triGiaHD) AS triGiaCaoNhat
FROM HoaDon
WHERE YEAR(HoaDon.ngayHoaDon) = 2006;
 
-- Câu 6: Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006.
select KhachHang.hoTen
from KhachHang 
join Hoadon on KhachHang.maKhachHang = HoaDon.maKhachHang
WHERE HoaDon.triGiaHD = (
    SELECT MAX(triGiaHD)
    FROM HoaDon
    WHERE YEAR(ngayHoaDon) = 2006
);

-- câu 7: In ra danh sách 3 khách hàng (Mã_KH, HOTEN) có doanh số cao nhất.
select KhachHang.maKhachHang as Mã_KH , KhachHang.hoTen as Họ_Tên
from KhachHang
ORDER BY KhachHang.doanhSo DESC
LIMIT 3;

-- câu 8: In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức giá cao nhất.
select SanPham.maSanPham as Mã_SP, SanPham.tenSanPham as Tên_SP
from SanPham
where gia in ((select max(gia) from sanpham), -- max 1
			 (select max(gia) from sanpham where gia < (select max(gia) from sanpham)), -- max 2
			 (select max(gia) from sanpham where gia < (select max(gia) from sanpham where gia < (select max(gia) from sanpham)))); -- max 3
             
-- Câu 9: In ra danh sách các sản phẩm (MASP, TENSP) 
-- do “Thai Lan” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của tất cả các sản phẩm).             
select SanPham.maSanPham as Mã_SP, SanPham.tenSanPham as Tên_SP
from SanPham 
where nuocSanXuat = "Thailand" and gia in ((select max(gia) from sanpham), -- max 1
			 (select max(gia) from sanpham where gia < (select max(gia) from sanpham)), -- max 2
			 (select max(gia) from sanpham where gia < (select max(gia) from sanpham where gia < (select max(gia) from sanpham)))); -- max 3
             
             
-- Câu 10: In ra danh sách các sản phẩm (MASP, TENSP) 
-- do “Trung Quoc” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của sản phẩm do “Trung Quoc” sản xuất).  
        
select SanPham.maSanPham as Mã_SP, SanPham.tenSanPham as Tên_SP
from SanPham 
where nuocSanXuat = 'TrungQuoc' and gia in ((select max(gia) from sanpham WHERE nuocSanXuat = 'TrungQuoc'), -- max 1
			 (select max(gia) from sanpham where nuocSanXuat = 'TrungQuoc' and gia < (select max(gia) from sanpham WHERE nuocSanXuat = 'TrungQuoc')), -- max 2
			 (select max(gia) from sanpham where nuocSanXuat = 'TrungQuoc' and gia < (select max(gia) from sanpham where nuocSanXuat = 'TrungQuoc' and gia < (select max(gia) from sanpham WHERE nuocSanXuat = 'TrungQuoc')))); -- max 3             
             
             
-- Câu 11: * In ra danh sách 3 khách hàng có doanh số cao nhất (sắp xếp theo kiểu xếp hạng).
SELECT subquery.MAKH, subquery.HOTEN, subquery.doanhSo
FROM (
    SELECT maKhachHang AS MAKH, hoTen AS HOTEN, doanhSo
    FROM KhachHang
    ORDER BY doanhSo DESC
    LIMIT 3
) AS subquery
ORDER BY subquery.doanhSo ASC;


-- Câu 12: Tính tổng số sản phẩm do “Trung Quoc” sản xuất.
select Count(*) as Tổng_SảnPhẩm 
from SanPham
where nuocSanXuat = 'TrungQuoc'
group by nuocSanXuat;

-- Câu 13: Tính tổng số sản phẩm của từng nước sản xuất.
select nuocSanXuat, Count(maSanPham) as Tổng_SảnPhẩm 
from SanPham
group by nuocSanXuat;


-- Câu 14: Với từng nước sản xuất, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm.
select nuocSanXuat , Max(gia) as Giá_CaoNhất, Min(gia) as Giá_ThấpNhất, Avg(gia) as Giá_TrungBình
from SanPham
group by nuocSanXuat;


-- Câu 15: Tính doanh thu bán hàng mỗi ngày.
select ngayHoaDon , Sum(triGiaHD)as Doanh_Thu
from HoaDon
group by ngayhoadon;


-- Câu 16: Tính tổng số lượng của từng sản phẩm bán ra trong tháng 10/2006.
select SanPham.maSanPham as Mã_SP, SanPham.tenSanPham as Tên_SP, Sum(ChiTietHoaDon.soLuongSP) as Tổng_SL, HoaDon.ngayHoaDon as Ngày_Bán
from SanPham
join ChiTietHoaDon on ChiTietHoaDon.maSanpham = sanpham.maSanpham
join Hoadon on HoaDon.soHoaDon = ChiTietHoaDon.soHoaDon
WHERE MONTH(HoaDon.ngayHoaDon) = 10 AND YEAR(HoaDon.ngayHoaDon) = 2006
GROUP BY SanPham.tenSanPham;


-- Câu 17: Tính doanh thu bán hàng của từng tháng trong năm 2006.
select month(ngayHoaDon) as Thang, Sum(triGiaHD) as DoanhThu
from HoaDon
where year(ngayHoaDon) = 2006
group by month(ngayHoaDon);


-- Câu 18: Tìm hóa đơn có mua ít nhất 4 sản phẩm khác nhau.
select hoadon.* from hoadon
join chitiethoadon on chitiethoadon.sohoadon = hoadon.sohoadon
join sanpham on chitiethoadon.masanpham = sanpham.masanpham
group by hoadon.sohoadon
having count(distinct sanpham.maSanPham) >= 4;


-- Câu 19: Tìm hóa đơn có mua 3 sản phẩm do “Viet Nam” sản xuất (3 sản phẩm khác nhau).
select hoadon.* from hoadon
join chitiethoadon on chitiethoadon.sohoadon = hoadon.sohoadon
join sanpham on chitiethoadon.masanpham = sanpham.masanpham
where nuocSanXuat = 'Thailand'
group by hoadon.sohoadon
having count(distinct sanpham.maSanPham) =3;

-- Câu 20: Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất.
select KhachHang.maKhachHang as Mã_KháchHàng, KhachHang.hoTen as Tên_KháchHàng
from KhachHang
join HoaDon on KhachHang.maKhachHang = HoaDon.maKhachHang
group by KhachHang.maKhachHang, KhachHang.hoTen
having COUNT(HoaDon.soHoaDon) = (select COUNT(soHoaDon) from HoaDon group by maKhachHang
order by COUNT(soHoaDon) desc
LIMIT 1
);
-- Câu 21: Tháng mấy trong năm 2006, doanh số bán hàng cao nhất ?
select month(ngayHoaDon) as Thang, Sum(triGiaHD) as Doanh_Thu
from HoaDon
where year(ngayHoaDon) = 2006
group by month (ngayHoaDon)
order by Sum(triGiaHD) desc
limit 1;


-- Câu 22: Tìm sản phẩm (MASP, TENSP) có tổng số lượng bán ra thấp nhất trong năm 2006.
select SanPham.masanpham as Mã_SP, SanPham.tenSanPham as Tên_SP, Sum(chitiethoadon.soLuongSP) as TổngSốLượngBán
from SanPham
join chitiethoadon on chitiethoadon.maSanpham = sanpham.maSanpham
join HoaDon on HoaDon.soHoaDon = chitiethoadon.sohoadon
where year (HoaDon.ngayHoaDon) = 2006
group by Sanpham.maSanpham
order by Sum(chitiethoadon.soLuongSP)
limit 1;


-- Câu 23: *Mỗi nước sản xuất, tìm sản phẩm (MASP,TENSP) có giá bán cao nhất.
SELECT SanPham.maSanPham AS MASP, SanPham.tenSanPham AS TENSP,
SanPham.gia AS GiaBan, SanPham.nuocSanXuat AS NuocSanXuat
from SanPham
join (
 SELECT SanPham.nuocSanXuat, Max(gia) as Giá_SP 
from SanPham 
group by SanPham.nuocSanXuat) as Max_Gia on SanPham.nuocSanXuat = Max_Gia.nuocSanXuat
AND SanPham.gia = Max_Gia.Giá_SP;



-- Câu 24: Tìm nước sản xuất sản xuất ít nhất 3 sản phẩm có giá bán khác nhau.
SELECT SanPham.nuocSanXuat
FROM SanPham
GROUP BY SanPham.nuocSanXuat
HAVING COUNT(DISTINCT SanPham.gia) >= 3;


-- Câu 25: *Trong 10 khách hàng có doanh số cao nhất, tìm khách hàng có số lần mua hàng nhiều nhất.   
select KhachHang.maKhachHang as Mã_KH, KhachHang.hoTen as Họ_TênKH, Count(HoaDon.soHoaDon) as SoLanMuaHang
from KhachHang
join HoaDon on KhachHang.maKhachHang = HoaDon.maKhachHang
where KhachHang.maKhachHang in (select KhachHang.maKhachHang 
								From HoaDon
                                group by maKhachHang
                                order by Sum(triGiaHD) desc
                                limit 10) 
group by KhachHang.maKhachHang , KhachHang.hoTen 
order by count(HoaDon.soHoaDon) desc
limit 1;                           


                         