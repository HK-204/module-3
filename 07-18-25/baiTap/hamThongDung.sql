select SubID, SubName, Status, max(Credit) as max_credit from subject
group by SubID, SubName, Status
having max(Credit) >= all (select Credit from subject);

select sj.SubId, sj.SubName, sj.Status, sj.Credit from mark m
join subject sj on m.SubId = sj.SubID
where Mark = (select max(Mark) from mark);

select s.*, MarkAvg.avg_mark from student s
left join 
(select StudentId, avg(mark.Mark) as avg_mark from mark
group by StudentId) MarkAvg on s.StudentId = MarkAvg.StudentId
order by MarkAvg.avg_mark desc;