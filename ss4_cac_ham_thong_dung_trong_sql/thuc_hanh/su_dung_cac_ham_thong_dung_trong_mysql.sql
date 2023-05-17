use quan_ly_sinh_vien;

-- Hiển thị số lượng sinh viên ở từng nơi
select address, count(address) as "quantity_student"
from student
group by address;

-- Tính điểm trung bình các môn học của mỗi học viên
select sb.subname, avg(m.mark) as "avg_subject"
from subject sb 
join mark m on sb.SubID = m.SubID
group by sb.subname;

-- Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 15
select s.studentid, s.studentname, avg(mark) as "avg_mark"
from student s
join mark m on s.StudentID = m.StudentID
group by s.StudentID,s.StudentName
having "avg_mark" >15;

-- Hiển thị thông tin các học viên có điểm trung bình lớn nhất.
select s.StudentID, s.StudentName, avg(mark)
from student s
join mark m on s.StudentID = m.StudentID
group by s.StudentID
having avg(mark) >= 
all (select avg(mark) 
from mark
group by mark.StudentID);  

