SELECT * FROM student
WHERE StudentName LIKE 'h%';

SELECT * FROM class
WHERE MONTH(StartDate) = 12;

SELECT * FROM subject
WHERE Credit BETWEEN 3 AND 5;

SET SQL_SAFE_UPDATES = 0;
UPDATE student
SET ClassID = 2
WHERE StudentName = 'Hung';
SET SQL_SAFE_UPDATES = 1;

SELECT S.StudentName, SJ.SubName, M.Mark FROM student S
JOIN mark M ON S.StudentID = M.StudentId
JOIN subject SJ ON M.SubId = SJ.SubID
ORDER BY M.Mark DESC, S.StudentName ASC;