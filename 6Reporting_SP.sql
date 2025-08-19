create view students_according_track_view
as (

 SELECT 
	
		e.student_sk,
        s.Student_name,
        s.Faculty,
        s.Graduation_Grade,
		s.Gender,
		s.Job,
		s.Phone,
        t.track_name,
        e.project_grade,
        e.[final grade]
    FROM 
        Exam_fact e
    INNER JOIN 
        dim_student s ON e.student_sk = s.student_sk
    INNER JOIN 
        dim_track t ON e.track_sk = t.track_sk)

go

alter PROCEDURE students_according_track
AS
BEGIN
    SET NOCOUNT ON;
	select * from students_according_track_view

   
END

exec students_according_track
go
--------------------------------------------2------------------------------------------
alter procedure grade_in_cource @st_id int
as
begin
select f.student_sk,student_name,c.course_name,max(f.exam_grade) as [Exam Grade]
from Exam_fact f join dim_student s
on f.student_sk=s.student_sk
join dim_course c
on f.cource_sk=c.course_bk
where f.student_sk=@st_id
group by f.student_sk,student_name,f.cource_sk,c.course_name
end

exec grade_in_cource 5
go
----------------------------------------------------------3-------------------------------------------
CREATE VIEW vw_Instructor_Courses AS
SELECT 
    f.instractur_sk,
    i.Instructor_name,
    c.course_name,
    b.bransh_name,
    f.student_sk,
    dt.track_name,
    dt.Manager_ID
FROM Exam_fact f
JOIN dim_instracture i ON f.instractur_sk = i.Instructor_sk
JOIN dim_course c ON f.cource_sk = c.course_bk
JOIN dim_branch b ON b.branch_bk = f.branch_sk
JOIN dim_track dt ON f.track_sk = dt.track_sk;
go 
ALTER PROCEDURE courses_instructor @ins_id INT
AS
BEGIN
    SELECT 
        v.instractur_sk,
        v.Instructor_name,
        v.course_name,
        v.bransh_name,
        COUNT(DISTINCT v.student_sk) AS [Number of students],
        CASE 
            WHEN @ins_id = v.Manager_ID THEN 'manager'
            ELSE 'not manager'
        END AS position,
        v.track_name
    FROM vw_Instructor_Courses v
    WHERE v.instractur_sk = @ins_id
    GROUP BY v.instractur_sk, v.Instructor_name, v.course_name, v.bransh_name, v.Manager_ID, v.track_name;
END;
exec courses_instructor 13
go
----------------------------------------4---------------------------------------------------------------------
create procedure topic_course @course_id int
as
begin
	select distinct cource_sk,t.topic_name
	from Exam_fact f 
	left join course_topics_k k on f.cource_sk=k.course_id 
	left join topics t on k.topic_id=t.topic_id
	where f.cource_sk=@course_id


end

exec topic_course 1
go
----------------------------------------5--------------------------------------------------------
CREATE PROCEDURE GetExamQuestionsReport
    @ExamID INT
AS
BEGIN
    -- «·√”∆·… „⁄ ŒÌ«—« Â«
    SELECT 
		DISTINCT
        Q.Question_ID,
        q.Type,
        q.Question,
        q.A AS Choice1,
		q.B AS Choice2,
		q.C AS Choice3,
		q.D AS Choice4
     from Exam_fact f left join DIM_QUESTIONS q
		on f.question_sk=q.question_id
	WHERE F.exam_sk=@ExamID
	

END;

EXEC GetExamQuestionsReport 1;

GO
------------------------------------------------------6-----------------------------------------------
alter procedure student_answer_inexam @exam_id int, @student_id int
as
begin
SELECT 
		DISTINCT
        Q.Question_ID,
        q.Type,
        q.Question,
        q.A AS Choice1,
		q.B AS Choice2,
		q.C AS Choice3,
		q.D AS Choice4,
		f.student_answer,
		f.exam_grade

     from Exam_fact f 
	 left join DIM_QUESTIONS q on f.question_sk=q.question_id
	WHERE F.exam_sk=@exam_id and f.student_sk=@student_id
end






