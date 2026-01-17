create database student_result_management_system;
create table students_result(
student_id int primary key ,
name varchar(50),
department varchar(50)
);
create table subjects(
subject_id int primary key ,
subject_name varchar(50)
);
create table marks(
student_id int,
subject_id int, 
marks int ,
foreign key (student_id) references students_result(student_id),
foreign key (subject_id) references subjects(subject_id)
);

insert into students_result values 
(1,'Rahul','Computer science'),
(2,'Amit','Mechanical'),
(3,'Neha','Computer Science');

insert into subjects values
(101,'Maths'),
(102,'Database'),
(103,'Physics');

insert into marks values
(1,101,85),
(1, 102, 90),
(1, 103, 78),
(2, 101, 60),
(2, 103, 55),
(3, 101, 95),
(3, 102, 92);

-- 1. Show all students with their subjects and marks
select
       s.name,
       sub.subject_name,
       m.marks
from marks m 
join students_result s 
on m.student_id = s.student_id 
join subjects sub 
on m.subject_id = sub.subject_id 

-- 2. Average marks of each student
select
      s.name,
      avg(m.marks) as average_marks
from marks m 
join students_result s 
on m.student_id = s.student_id 
group by s.name;

-- 3. Students (marks < 60)
select distinct s.name
from marks m 
join students_result s 
on m.student_id = s.student_id 
where m.marks < 60;

-- 4. Top scorer (highest average)
select 
     s.name, 
     avg(m.marks) as average_marks
from marks m 
join students_result s
on m.student_id = s.student_id 
group by s.name
order by average_marks desc 
limit 1;


