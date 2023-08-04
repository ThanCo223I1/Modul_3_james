select * from DongXe
where soChoNgoi like 5;

-- cau 4:
select NhaCungCap.*, dongxe.hangxe, Mucphi.donGia
from NhaCungCap 
join DangKiCungCap on DangKiCungCap.maNhaCC = NhaCungCap.maNhaCC
join dongxe on dongxe.dongxe = DangKiCungCap.dongxe
join mucphi on mucphi.maMucPhi = DangKiCungCap.maMucPhi
where (dongxe.hangxe = 'Mercedez' and mucphi.dongia = 20) or (dongxe.hangxe = 'kia' and mucphi.dongia = 15);

-- Câu 5: Liệt kê thông tin toàn bộ nhà cung cấp được sắp xếp tăng dần theo tên nhà cung cấp và giảm dần theo mã số thuế
select *
from NhaCungCap
order by tennhacc asc, masothue desc;

-- Câu 6: Đếm số lần đăng ký cung cấp phương tiện tương ứng cho từng nhà cung cấp với
-- yêu cầu chỉ đếm cho những nhà cung cấp thực hiện đăng ký cung cấp có ngày bắt đầu
-- cung cấp là “20/11/2015”
SELECT nc.tenNhaCC, COUNT(dk.maNhaCC) AS SoLanDangKy
FROM NhaCungCap nc
JOIN DangKiCungCap dk ON nc.maNhaCC = dk.maNhaCC
WHERE dk.ngayBatDauCungCap = '2015-11-20'
GROUP BY nc.tenNhaCC;
-- Câu 7: Liệt kê tên của toàn bộ các hãng xe có trong cơ sở dữ liệu với yêu cầu mỗi hãng xe chỉ được liệt kê một lần.

SELECT DISTINCT hangXe
FROM DongXe;
-- Câu 8: Hiển thị tất cả thông tin theo NhaCC của tất cả các lần đăng ký cung cấp phương tiện với yêu cầu những nhà cung cấp nào chưa từng thực hiện đăng ký cung cấp phương tiện thì cũng liệt kê thông tin những nhà cung cấp đó ra.

SELECT nc.*
FROM NhaCungCap nc
LEFT JOIN DangKiCungCap dk ON nc.maNhaCC = dk.maNhaCC
WHERE dk.maNhaCC IS NULL;
-- Câu 9: Liệt kê thông tin của các nhà cung cấp đã từng đăng ký cung cấp phương tiện thuộc dòng xe “Hiace” hoặc từng đăng ký cung cấp phương tiện thuộc dòng xe “Cerato”.

SELECT DISTINCT nc.*
FROM NhaCungCap nc
JOIN DangKiCungCap dk ON nc.maNhaCC = dk.maNhaCC
JOIN DongXe dx ON dk.dongXe = dx.dongXe
WHERE dx.dongXe IN ('Hiace', 'Cerato');
-- Câu 10: Liệt kê thông tin của các nhà cung cấp chưa từng thực hiện đăng ký cung cấp phương tiện lần nào cả.

SELECT nc.*
FROM NhaCungCap nc
LEFT JOIN DangKiCungCap dk ON nc.maNhaCC = dk.maNhaCC
WHERE dk.maNhaCC IS NULL;