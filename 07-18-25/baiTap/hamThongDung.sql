select SubID, SubName, Status, max(Credit) as max_credit from subject
group by SubID, SubName, Status
having max(Credit) >= all (select Credit from subject);

select sj.SubId, sj.SubName, sj.Status, sj.Credit from mark m
join subject sj on m.SubId = sj.SubID
where Mark = (select max(Mark) from mark);

select s.*, avg(m.Mark) from student s
left join mark m on s.StudentID = m.StudentId
group by s.StudentID
order by avg(m.Mark) desc;