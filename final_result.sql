UPDATE s
SET s.final_grade = 
    a1+
    S.Graduation_Grade * 0.3 +
    a2
FROM student s
LEFT JOIN (
    SELECT 
        student_id, 
        (SUM(SE.exam_grade) * 1.0 / COUNT(SE.exam_id)) * 0.6 as a1
    FROM student_exam se
    GROUP BY student_id

) e ON s.student_id = e.student_id
LEFT JOIN (
    SELECT student_id, CAST(ROUND(((SUM(SA.score * 1.0) / 900) * 100) * 0.1, 1) AS DECIMAL(6, 1)) as a2
    FROM student_attendance sa
    GROUP BY student_id
) a ON s.student_id = a.student_id;

select * from Student


