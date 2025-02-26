drop table STUDENT;

create table UNIVERSITY (
  UNIV_ID number(4) not null,
  UNIV_NAME varchar2(50),
  RATING number(20),
  CITY varchar2(20),
  primary key (UNIV_ID)
);

create table SUBJECT (
  SUBJ_ID number(4) not null,
  SUBJ_NAME varchar2(50),
  HOUR number(3),
  SEMESTER number(1),
  primary key (SUBJ_ID)
);

create table STUDENT
(STUDENT_ID number(4) NOT NULL,
SURNAME varchar2(50),
NAME varchar2(50),
STIPEND number(5),
COURSE number(1),
CITY varchar2(50),
BIRTHDAY date,
UNIV_ID number(4) not null references UNIVERSITY(UNIV_ID),
primary key (STUDENT_ID));

create table LECTURER (
    LECTURER_ID number(4) not null,
    SURNAME varchar(50),
    NAME varchar2(50),
    CITY varchar2(50),
    UNIV_ID number(4) not null references UNIVERSITY(UNIV_ID),
    SUBJ_ID number(4) not null references SUBJECT(SUBJ_ID),
    primary key (LECTURER_ID)
);

create table EXAM_MARKS (
    EXAM_ID number(4) not null,
    STUDENT_ID number(4) not null references STUDENT (STUDENT_ID),
    SUBJ_ID number(4) not null references SUBJECT (SUBJ_ID),
    MARK number(3),
    EXAM_DATE date,
    primary key (EXAM_ID)
);


insert into UNIVERSITY values (1, 'НУ', 800, 'Астана');
insert into UNIVERSITY values (2, 'КазНУ', 800,'Алматы');
insert into UNIVERSITY values (3, 'ЕНУ', 800,'Астана');

insert into SUBJECT values (1, 'Информатика', 56, 1);
insert into SUBJECT values (2, 'Математика', 46, 2);
insert into SUBJECT values (3, 'Физика', 36, 3);

insert into LECTURER values (1, 'Арманулы', 'Кайрат', 'Шымкент', 1, 1);
insert into LECTURER values (2, 'Кусаинов', 'Абылай', 'Кокшетау', 2, 2);
insert into LECTURER values (3, 'Кайратулы', 'Нурхат', 'Павлодар', 3, 3);

INSERT INTO STUDENT VALUES (1, 'Плалов', 'Нурхат', 30000, 2, 'Шымкент', TO_DATE('21.01.1990', 'DD.MM.YYYY'), 1);
INSERT INTO STUDENT VALUES (2, 'Аскарова', 'Асем', 20000, 1, 'Астана', TO_DATE('12.02.1990', 'DD.MM.YYYY'), 2);
INSERT INTO STUDENT VALUES (3, 'Кульгинов', 'Аскар', 15000, 3, 'Орал', TO_DATE('05.03.1990', 'DD.MM.YYYY'), 3);
INSERT INTO STUDENT VALUES (4, 'Фархатов', 'Нурбол', 25000, 4, 'Семей', TO_DATE('15.04.1990', 'DD.MM.YYYY'), 1);
INSERT INTO STUDENT VALUES (5, 'Максутова', 'Марал', 18000, 2, 'Караганды', TO_DATE('07.05.1990', 'DD.MM.YYYY'), 2);
INSERT INTO STUDENT VALUES (6, 'Салимжанова', 'Мадина', 22000, 3, 'Актобе', TO_DATE('01.06.1990', 'DD.MM.YYYY'), 3);
INSERT INTO STUDENT VALUES (7, 'Рустамов', 'Медет', 5000, 1, 'Атырау', TO_DATE('30.07.1990', 'DD.MM.YYYY'), 1);
INSERT INTO STUDENT VALUES (8, 'Смагуллова', 'Альбина', 10000, 2, 'Тараз', TO_DATE('20.08.1990', 'DD.MM.YYYY'), 3);
INSERT INTO STUDENT VALUES (9, 'Кайратов', 'Самат', 12000, 3, 'Кызылорда', TO_DATE('08.09.1990', 'DD.MM.YYYY'), 2);
INSERT INTO STUDENT VALUES (10, 'Нарынкулов', 'Шынгыс', 25000, 4, 'Алматы', TO_DATE('25.10.1990', 'DD.MM.YYYY'), 3);


insert into EXAM_MARKS (EXAM_ID, STUDENT_ID, SUBJ_ID, MARK, EXAM_DATE) values (1,1,1,1,TO_DATE('25/07/2020', 'DD/MM/YYYY'));
insert into EXAM_MARKS (EXAM_ID, STUDENT_ID, SUBJ_ID, MARK, EXAM_DATE) values (2,2,1,2,TO_DATE('25/07/2020', 'DD/MM/YYYY'));
insert into EXAM_MARKS (EXAM_ID, STUDENT_ID, SUBJ_ID, MARK, EXAM_DATE) values (3,3,1,3,TO_DATE('25/07/2020', 'DD/MM/YYYY'));
insert into EXAM_MARKS (EXAM_ID, STUDENT_ID, SUBJ_ID, MARK, EXAM_DATE) values (4,4,1,4,TO_DATE('25/07/2020', 'DD/MM/YYYY'));
insert into EXAM_MARKS (EXAM_ID, STUDENT_ID, SUBJ_ID, MARK, EXAM_DATE) values (5,5,1,5,TO_DATE('25/07/2020', 'DD/MM/YYYY'));
insert into EXAM_MARKS (EXAM_ID, STUDENT_ID, SUBJ_ID, MARK, EXAM_DATE) values (6,6,1,1,TO_DATE('25/07/2020', 'DD/MM/YYYY'));
insert into EXAM_MARKS (EXAM_ID, STUDENT_ID, SUBJ_ID, MARK, EXAM_DATE) values (7,7,1,2,TO_DATE('25/07/2020', 'DD/MM/YYYY'));
insert into EXAM_MARKS (EXAM_ID, STUDENT_ID, SUBJ_ID, MARK, EXAM_DATE) values (8,8,1,3,TO_DATE('25/07/2020', 'DD/MM/YYYY'));
insert into EXAM_MARKS (EXAM_ID, STUDENT_ID, SUBJ_ID, MARK, EXAM_DATE) values (9,9,1,4,TO_DATE('25/07/2020', 'DD/MM/YYYY'));
insert into EXAM_MARKS (EXAM_ID, STUDENT_ID, SUBJ_ID, MARK, EXAM_DATE) values (10,10,1,5,TO_DATE('25/07/2020', 'DD/MM/YYYY'));

insert into EXAM_MARKS (EXAM_ID, STUDENT_ID, SUBJ_ID, MARK, EXAM_DATE) values (11,1,2,1,TO_DATE('22/07/2020', 'DD/MM/YYYY'));
insert into EXAM_MARKS (EXAM_ID, STUDENT_ID, SUBJ_ID, MARK, EXAM_DATE) values (12,2,2,2,TO_DATE('22/07/2020', 'DD/MM/YYYY'));
insert into EXAM_MARKS (EXAM_ID, STUDENT_ID, SUBJ_ID, MARK, EXAM_DATE) values (13,3,2,3,TO_DATE('22/07/2020', 'DD/MM/YYYY'));
insert into EXAM_MARKS (EXAM_ID, STUDENT_ID, SUBJ_ID, MARK, EXAM_DATE) values (14,4,2,4,TO_DATE('22/07/2020', 'DD/MM/YYYY'));
insert into EXAM_MARKS (EXAM_ID, STUDENT_ID, SUBJ_ID, MARK, EXAM_DATE) values (15,5,2,5,TO_DATE('22/07/2020', 'DD/MM/YYYY'));
insert into EXAM_MARKS (EXAM_ID, STUDENT_ID, SUBJ_ID, MARK, EXAM_DATE) values (16,6,2,1,TO_DATE('22/07/2020', 'DD/MM/YYYY'));
insert into EXAM_MARKS (EXAM_ID, STUDENT_ID, SUBJ_ID, MARK, EXAM_DATE) values (17,7,2,2,TO_DATE('22/07/2020', 'DD/MM/YYYY'));
insert into EXAM_MARKS (EXAM_ID, STUDENT_ID, SUBJ_ID, MARK, EXAM_DATE) values (18,8,2,3,TO_DATE('22/07/2020', 'DD/MM/YYYY'));
insert into EXAM_MARKS (EXAM_ID, STUDENT_ID, SUBJ_ID, MARK, EXAM_DATE) values (19,9,2,4,TO_DATE('22/07/2020', 'DD/MM/YYYY'));
insert into EXAM_MARKS (EXAM_ID, STUDENT_ID, SUBJ_ID, MARK, EXAM_DATE) values (20,10,2,5,TO_DATE('22/07/2020', 'DD/MM/YYYY'));

insert into EXAM_MARKS (EXAM_ID, STUDENT_ID, SUBJ_ID, MARK, EXAM_DATE) values (21,1,3,1,TO_DATE('24/07/2020', 'DD/MM/YYYY'));
insert into EXAM_MARKS (EXAM_ID, STUDENT_ID, SUBJ_ID, MARK, EXAM_DATE) values (22,2,3,2,TO_DATE('24/07/2020', 'DD/MM/YYYY'));
insert into EXAM_MARKS (EXAM_ID, STUDENT_ID, SUBJ_ID, MARK, EXAM_DATE) values (23,3,3,3,TO_DATE('24/07/2020', 'DD/MM/YYYY'));
insert into EXAM_MARKS (EXAM_ID, STUDENT_ID, SUBJ_ID, MARK, EXAM_DATE) values (24,4,3,4,TO_DATE('24/07/2020', 'DD/MM/YYYY'));
insert into EXAM_MARKS (EXAM_ID, STUDENT_ID, SUBJ_ID, MARK, EXAM_DATE) values (25,5,3,5,TO_DATE('24/07/2020', 'DD/MM/YYYY'));
insert into EXAM_MARKS (EXAM_ID, STUDENT_ID, SUBJ_ID, MARK, EXAM_DATE) values (26,6,3,1,TO_DATE('24/07/2020', 'DD/MM/YYYY'));
insert into EXAM_MARKS (EXAM_ID, STUDENT_ID, SUBJ_ID, MARK, EXAM_DATE) values (27,7,3,2,TO_DATE('24/07/2020', 'DD/MM/YYYY'));
insert into EXAM_MARKS (EXAM_ID, STUDENT_ID, SUBJ_ID, MARK, EXAM_DATE) values (28,8,3,3,TO_DATE('24/07/2020', 'DD/MM/YYYY'));
insert into EXAM_MARKS (EXAM_ID, STUDENT_ID, SUBJ_ID, MARK, EXAM_DATE) values (29,9,3,4,TO_DATE('24/07/2020', 'DD/MM/YYYY'));
insert into EXAM_MARKS (EXAM_ID, STUDENT_ID, SUBJ_ID, MARK, EXAM_DATE) values (30,10,3,5,TO_DATE('24/07/2020', 'DD/MM/YYYY'));


select * from EXAM_MARKS;

SELECT
    EM.EXAM_ID,
    S.NAME AS STUDENT_NAME,
    SU.SUBJ_NAME AS SUBJECT_NAME,
    EM.MARK,
    EM.EXAM_DATE
FROM
    EXAM_MARKS EM,
    STUDENT S,
    SUBJECT SU;

COMMIT;