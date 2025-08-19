select * from  iti_system.dbo.student

alter table student 
add age int 

update student 
set age=s1.age
from student s join students_ages$ s1
on s.student_id=s1.st_id

select * from student

alter table dwh.dbo.dim_student
add age int 

update dwh.dbo.dim_student
set age=s2.age
from dwh.dbo.dim_student s1 join student s2
on s1.student_sk=s2.student_id

select * from dwh.dbo.dim_student

drop table students_ages$
-----------------------------age instractor-------------------------------------
alter table instructor 
add age int 

update instructor 
set age=s1.age
from instructor s join sheet1$ s1
on s.instructor_id=s1.ins_id

select * from instructor

alter table dwh.dbo.dim_instracture
add age int 

update dwh.dbo.dim_instracture
set age=s2.age
from dwh.dbo.dim_instracture s1 join instructor s2
on s1.instructor_sk=s2.instructor_id

select * from dwh.dbo.dim_instracture

drop table sheet1$