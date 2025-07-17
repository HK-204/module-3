select address, count(StudentID) from student
group by address;

select s.StudentId, s.StudentName, avg(m.mark) as diemTB from student s
join mark m on s.StudentID = m.StudentId
group by s.StudentId, s.StudentName;

select s.StudentId, s.StudentName, avg(m.mark) as diemTB from student s
join mark m on s.StudentID = m.StudentId
group by s.StudentId, s.StudentName
having avg(m.mark) > 15;

select s.StudentId, s.StudentName, avg(m.mark) as diemTB from student s
join mark m on s.StudentID = m.StudentId
group by s.StudentId, s.StudentName
having avg(m.mark) >= all (select avg(Mark) from mark group by mark.StudentID);