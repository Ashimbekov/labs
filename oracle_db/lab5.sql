select * from STUDENT;

select * from UNIVERSITY;

select SURNAME, NAME, COURSE, UNIV_NAME from STUDENT inner join UNIVERSITY on STUDENT.UNIV_ID = UNIVERSITY.UNIV_ID;

select * from SUBJECT;

insert into SUBJECT values (4, 'История', 24, 1);
insert into SUBJECT values (5, 'Геометрия', 12, 2);

select SUBJECT.SUBJ_ID, SUBJ_NAME, HOUR, SEMESTER, SURNAME, NAME from SUBJECT
    left outer join LECTURER on SUBJECT.SUBJ_ID = LECTURER.SUBJ_ID;

select * from LECTURER;

insert into LECTURER values (4, 'Ашимбеков', 'Нурдаулет', 'Астана', 1, 1);
insert into LECTURER values (5, 'Мекебава', 'Альсина', 'Кызылорда', 2, 1);
insert into LECTURER values (6, 'Асанали', 'Асан', 'Астана', 3, 1);

select SURNAME, NAME, SUBJECT.SUBJ_NAME, SEMESTER from LECTURER
    inner join SUBJECT on LECTURER.SUBJ_ID = SUBJECT.SUBJ_ID
    where SUBJ_NAME='Информатика'
    order by SURNAME, NAME;

select SURNAME, NAME, BIRTHDAY, UNIV_NAME from STUDENT
    inner join  UNIVERSITY on STUDENT.UNIV_ID =UNIVERSITY.UNIV_ID
    where UNIV_NAME='НУ' order by  SURNAME, NAME;

