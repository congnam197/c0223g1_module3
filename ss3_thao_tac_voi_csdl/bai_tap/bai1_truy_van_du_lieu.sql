use quan_ly_sinh_vien;
select * 
from student;
-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select * 
from student
where studentname like 'h%';
-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select *
from class
where startdate 
between '2008-12-01 00:00:00' and '2008-12-31 00:00:00';
-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select *
from subject
where credit 
between 3 and 5;
-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
update student
set classid=2
where studentid =1;
-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select 	s.studentname, sb.subname, m.mark
from student s 
join mark m on s.studentid = m.studentid 
join subject sb on sb.subid = m.subid
order by m.mark desc, s.studentname;