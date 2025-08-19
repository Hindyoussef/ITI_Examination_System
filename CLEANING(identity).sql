SELECT 
    fk.name AS ForeignKeyName,
    OBJECT_NAME(fk.parent_object_id) AS TableName,
    COL_NAME(fkc.parent_object_id, fkc.parent_column_id) AS ColumnName,
    OBJECT_NAME(fk.referenced_object_id) AS ReferencedTable,
    COL_NAME(fkc.referenced_object_id, fkc.referenced_column_id) AS ReferencedColumn
FROM 
    sys.foreign_keys AS fk
INNER JOIN 
    sys.foreign_key_columns AS fkc 
    ON fk.object_id = fkc.constraint_object_id
WHERE 
    OBJECT_NAME(fk.parent_object_id) = 'instructor';  -- ? ⁄œ·Ì «”„ «·ÃœÊ· Â‰«

alter table instructor
drop constraint    FK__Instructo__Cours__7B5B524B

alter table branch_track
drop constraint   FK__Branch_Tr__Track__6D0D32F4

select count( question_id) from questions

ALTER TABLE exams
alter column date DATETIME null;
ALTER TABLE student_attendance
DROP CONSTRAINT PK_Student_Attendance composet ;

ALTER TABLE Student_Attendance
ADD CONSTRAINT PK_Student_Attendance PRIMARY KEY (student_id, attendance_date);


truncate table branch


declare @c varchar(20) 
select top 1 c = Status
from Student_Attendance
;
update Student_Attendance
set status='Absent'
where status='Absent,,,,,,,'

select count(*) from assign
select * 
alter table  Exam_identity
add  exam_id int  primary key identity(1,1)

----------------------------how to stop identity and return run----------------------
GO
set identity_insert instructor on
insert into instructor(Instrucor_Name,City,Phone,Gender,Faculty,instructor_Password,N_Year_In_Learning,Email,Course_ID,Instructor_ID)
select *
from ins_temp
set identity_insert instructor off

GO
select * from instructor
GO
drop table ins_temp

insert into instructor (Instrucor_Name)
values
('body')

select * 
from Instructor 
where Instrucor_name='body'
-----------------------------------------------------------------

EXEC sp_rename 'instructor.Instrucor_name', 'Instructor_name', 'COLUMN';
go
drop table Exams









from exams
where 1=0

SELECT
    tc.CONSTRAINT_NAME,
    tc.TABLE_NAME,
    kcu.COLUMN_NAME
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS tc
JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS kcu
    ON tc.CONSTRAINT_NAME = kcu.CONSTRAINT_NAME
WHERE tc.CONSTRAINT_TYPE = 'PRIMARY KEY'
  AND tc.TABLE_NAME = 'EXAMS';





  select *
  into ins_temp
  from instructor

alter table instructor
alter column n_year_in_learning int 





