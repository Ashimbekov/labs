select
    STUDENT.SURNAME AS STUDENT_SURNAME,
    STUDENT.NAME AS STUDENT_NAME,
    EXAM_MARKS.MARK,
    SUBJECT.SUBJ_NAME AS SUBJECT_NAME,
    LECTURER.SURNAME AS LECTURER_SURNAME,
    LECTURER.NAME AS LECTURER_NAME
from EXAM_MARKS
inner join STUDENT ON EXAM_MARKS.STUDENT_ID = STUDENT.STUDENT_ID
inner join SUBJECT ON EXAM_MARKS.SUBJ_ID = SUBJECT.SUBJ_ID
inner join LECTURER ON SUBJECT.SUBJ_ID = LECTURER.SUBJ_ID
where SUBJECT.SUBJ_NAME = 'Физика' AND EXAM_MARKS.MARK <= 2;


select
    STUDENT.SURNAME AS STUDENT_SURNAME,
    STUDENT.NAME AS STUDENT_NAME,
    UNIVERSITY.UNIV_NAME AS UNIVERSITY_NAME,
    LECTURER.SURNAME AS LECTURER_SURNAME,
    LECTURER.NAME AS LECTURER_NAME
from STUDENT
inner join UNIVERSITY ON STUDENT.UNIV_ID = UNIVERSITY.UNIV_ID
inner join  LECTURER ON UNIVERSITY.UNIV_ID = LECTURER.UNIV_ID
where
    UNIVERSITY.UNIV_NAME = 'КазНУ';


select
    SURNAME AS STUDENT_SURNAME,
    NAME AS STUDENT_NAME,
    COURSE,
    STIPEND
from STUDENT
where STIPEND > (SELECT AVG(STIPEND) FROM STUDENT);


select STIPEND from STUDENT;


select upper(SURNAME), upper(NAME) from STUDENT;

select concat(concat(SURNAME, ' '), NAME) as FULL_NAME from LECTURER;

