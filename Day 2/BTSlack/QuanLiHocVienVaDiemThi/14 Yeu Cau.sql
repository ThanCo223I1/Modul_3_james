SELECT * FROM QuanLiHocVienVaDiemThi.Test;
insert into Test value (1, "EPC");
insert into Test(testName) value ("DWMX");
insert into Test(testName) value ("SQL1");
insert into Test(testName) value ("SQL2");
DELETE FROM Test WHERE testID = 7;
SELECT * FROM QuanLiHocVienVaDiemThi.Student;
insert into Student value (1,"Nguyen Hong Ha", 20);
insert into Student(Name,Age) value ("Truong Ngoc Anh",30);
insert into Student(Name,Age) value ("Tuan Minh",25);
insert into Student(Name,Age) value ("Dan Truong",22);
SELECT * FROM QuanLiHocVienVaDiemThi.StudentTest;
insert into StudentTest value (1,1,"2006-7-17",8);
insert into StudentTest value (1,2,"2006-7-18",5);
insert into StudentTest value (1,3,"2006-7-19",7);
insert into StudentTest value (2,1,"2006-7-20",7);
insert into StudentTest value (2,2,"2006-7-21",4);
insert into StudentTest value (2,3,"2006-7-22",2);
insert into StudentTest value (3,1,"2006-7-23",10);
insert into StudentTest value (3,3,"2006-7-24",1);


-- Cau 2: Hiển thị danh sách các học viên đã tham gia thi, các môn thi được thi bởi các học viên đó, điểm thi và ngày thi
select student.rn, Student.Name, Test.testName,StudentTest.mark,StudentTest.Date
from Student
join StudentTest on StudentTest.RN = student.RN
join test on Test.testID = StudentTest.testID
order by student.rn;
-- Cau3: Hiển thị danh sách các bạn học viên chưa thi môn nào
create view view_hocvienchuathi as
select student.RN, Student.Name, student.Age
from Student
left JOIN StudentTest on StudentTest.RN = student.RN
left join test on Test.testID = StudentTest.testID
where  StudentTest.RN is null
order by student.rn;
select * from view_hocvienchuathi;
-- Cau 4: Hiển thị danh sách học viên phải thi lại, tên môn học phải thi lại và điểm 
alter view view_Hocvienthilai as 
select Student.Name, test.testName,StudentTest.Mark,studenttest.date
from Student 
join StudentTest on StudentTest.Rn = Student.Rn
join Test on Test.testID = studentTest.testID
where StudentTest.Mark <5;
select * from view_Hocvienthilai;
describe view_Hocvienthilai;


-- Cau 5: Hiển thị danh sách học viên và điểm trung bình(Average) của các môn đã thi. 
-- Danh sách phải sắp xếp theo thứ tự điểm trung bình giảm dần(nếu không sắp xếp thì chỉ được ½ số điểm).
create view view_TinhDiemTrungBinh As
select Student.* , AVG (StudentTest.Mark) As Average
from Student 
join StudentTest on student.RN = studentTest.RN
group by Student.RN
order by AVG (StudentTest.Mark) desc;
select * from view_TinhDiemTrungBinh ;


-- Cau 6: Hiển thị tên và điểm trung bình của học viên có điểm trung bình lớn nhất.
create view view_DiemTrungBinhMax as 
select Student.Name as Name,  AVG (StudentTest.Mark) As Average
from student 
join StudentTest on Student.RN = studentTest.RN
group by Student.Name
Having Average <= All (select AVG (StudentTest.Mark) from StudentTest group by StudentTest.RN);
select * from view_DiemTrungBinhMax;
drop view  view_DiemTrungBinhMax;


-- Cau 7: Hiển thị điểm thi cao nhất của từng môn học. Danh sách phải được sắp xếp theo tên môn học.
create view view_DiemThiMax as 
select Test.testName as TestName , max(StudentTest.Mark) as MaxMark
from Test 
join StudentTest on Test.testID = studentTest.testID
group by Test.TestName
order by Test.TestName desc;
select * from view_DiemThiMax;


-- Cau 8: Hiển thị danh sách tất cả các học viên và 
-- môn học mà các học viên đó đã thi nếu học viên chưa thi môn nào thì phần tên môn học để Null 
create view view_DanhSachHocVien as
select Student.Name, Test.testName as NameSubject
from Student 
left join StudentTest on studentTest.RN = student.RN
left join Test on test.testID = studenttest.testID;
select * from view_DanhSachHocVien;
 
 
-- Cau 9: Sửa (Update) tuổi của tất cả các học viên mỗi người lên một tuổi.
use QuanLiHocVienVaDiemThi;
select Student.* from Student;
update Student Set Student.age = student.age +1;


-- Cau 10: Thêm trường tên là Status có kiểu Varchar(10) vào bảng Student.
select Student .* from Student;
Alter table Student 
Add Status varchar(10) not null
After Age; -- them cot sau truong Age 
-- xoa cot 
ALTER TABLE Student
  DROP COLUMN Status;
  
  
-- Cau 11: Cập nhật(Update) trường Status 
-- sao cho những học viên nhỏ hơn 30 tuổi sẽ nhận giá trị ‘Young’, 
-- trường hợp còn lại nhận giá trị ‘Old’ 
-- sau đó hiển thị toàn bộ nội dung bảng Student lên.


create view view_UpdateStatus as 
select Student .* from Student;
UPDATE Student
SET Status = CASE
WHEN Age < 30 THEN 'Young'
    ELSE 'Old'
END;
select * from view_UpdateStatus;


-- Cau 12: Tạo view tên là vwStudentTestList hiển thị danh sách học viên và điểm thi,
-- dánh sách phải sắp xếp tăng dần theo ngày thi 
create view vwStudentList as 
select Student.* , StudentTest.Mark, StudentTest.Date
from Student
join Studenttest on studentTest.RN = student.RN
join Test on test.testID = studentTest.testID
order by date desc;
select * from vwStudentList;


-- Cau 13: 	Tạo một trigger tên là tgSetStatus 
-- sao cho khi sửa tuổi của học viên thi trigger này sẽ tự động cập nhật status.
-- Nếu tuổi nhỏ hơn 30 thì Status=’Young’
-- Nếu tuổi lớn hơn hoặc bằng 30 thì Status=’Old’
DELIMITER $$
create trigger trigger_SetStatus 
before update on Student 
for each row
begin 
if new.age < 30 then set new.Status = "Young";
else set new.Status = "Old";
End if;
end$$


-- Câu 14: Tạo một stored procedure tên là spViewStatus, stored procedure này nhận vào 2 tham số: 
-- Tham số thứ nhất là tên học viên					
-- Tham số thứ 2 là tên môn học
-- Nếu tên học viên hoặc tên môn học không tìm thây trong cơ sở dữ liệu thì hiện ra màn hình thông báo: ‘Khong tim thay’
-- Trường hợp còn lại thi hiển thị trạng thái của học viên đó với môn học đó theo quy tắc sau:
-- Hiển thị ‘Chua thi’ nếu học viên đó chưa thi môn đó
-- Hiển thị ‘Do’ nếu đã thi rồi và điểm lơn hơn hoặc bằng 5
-- Hiển thị ‘Trượt’ nếu đã thi rồi và điểm thi nhỏ hơn 5
use QuanLiHocVienVaDiemThi;
select Student * from student;
DELIMITER $$ 
create procedure spViewStatus (NameHV varchar (60), NameMH varchar (60))
begin 
select Student.name, test.testName, (case when mark >=5 then "Qua Môn" when mark < 5 then "Trượt" else "Chưa Thi" end) as "Học Lực"
from StudentTest
join test on StudentTest.testID = test.TestID
right join stundent on StudentTest.RN = student. RN
where (student.name = nameHV and test.testName = NameMH) or student.name = nameHV;
End$$
call spViewStatus("Nguyen Ngoc Ha", "SQL1");
call spViewStatus("Truong Ngoc Anh", "SQL2");
call spViewStatus("Tuan Minh", "SQL2");

