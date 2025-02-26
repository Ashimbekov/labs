select SURNAME, NAME, COURSE from STUDENT where COURSE = 1;

select SURNAME, NAME, COURSE, STIPEND from STUDENT where STIPEND between 10000 and 20000;

select SURNAME, NAME, COURSE, STIPEND from STUDENT where STIPEND >= 10000 and STIPEND <= 20000;

select * from STUDENT where CITY in ('Алматы', 'Актобе', 'Семей');

select * from STUDENT where SURNAME like 'Сал%';

select * from STUDENT where SURNAME like '%ар%';

select COURSE, count(NAME) as COUNT from STUDENT group by COURSE;


select MARK, COUNT(STUDENT_ID) as STUDENT_COUNT
from EXAM_MARKS
group by MARK
order by MARK;


select SUBJ_NAME, HOUR
from SUBJECT
where HOUR = (select MAX(HOUR) from SUBJECT);


select RATING from UNIVERSITY;

select * from UNIVERSITY;

update UNIVERSITY
set RATING = 850
where UNIV_ID = 1;

select AVG(RATING) as AVG_RATING from UNIVERSITY;


select * from STUDENT where SURNAME like 'С%';

select SURNAME from STUDENT;



