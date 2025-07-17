SELECT * FROM student;

SELECT * FROM student
WHERE status = true;

SELECT * FROM subject
WHERE Credit < 10;

SELECT S.StudentID, S.StudentName FROM student S
JOIN class C ON S.ClassID = C.ClassID
WHERE ClassName = 'A1';

SELECT S.StudentName FROM subject SJ
JOIN mark M ON SJ.SubID = M.SubId
JOIN student S ON M.StudentId = S.StudentID
WHERE SubName = 'CF';