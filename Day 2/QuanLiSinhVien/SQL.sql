use quanlisinhvien;
select subject.*
from subject
where credit = (select Max(credit) from Subject);

select subject.*, Mark.mark
from subject
join mark on subject.subid = mark.subid
where mark.mark = (select max(mark.mark) from mark);

select Student.* , avg(mark.mark)
from Student 
join mark on Student.StudentID = mark.StudentID
group by student.studentid
order by avg(mark.mark) desc;

