CREATE TABLE EXAM_LIST1(
    Student_Name varchar2(50),
    Exam_Name varchar2(50),
    Exam_Date date,
    Exam_Points number(4)
);

select * from STUDENT;

select * from EXAM_LIST1;


create view STUDENT_LECTURER_KAZNU as
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


SELECT * FROM STUDENT_LECTURER_KAZNU;



CREATE TABLE HeartAttackRisk (
    Patient_ID NUMBER PRIMARY KEY,
    State_Name VARCHAR2(50),
    Age NUMBER,
    Gender VARCHAR2(10),
    Diabetes NUMBER(1),
    Hypertension NUMBER(1),
    Obesity NUMBER(1),
    Smoking NUMBER(1),
    Alcohol_Consumption NUMBER(1),
    Physical_Activity NUMBER(1),
    Diet_Score NUMBER,
    Cholesterol_Level NUMBER,
    Triglyceride_Level NUMBER,
    LDL_Level NUMBER,
    HDL_Level NUMBER,
    Systolic_BP NUMBER,
    Diastolic_BP NUMBER,
    Air_Pollution_Exposure NUMBER(1),
    Family_History NUMBER(1),
    Stress_Level NUMBER,
    Healthcare_Access NUMBER(1),
    Heart_Attack_History NUMBER(1),
    Emergency_Response_Time NUMBER,
    Annual_Income NUMBER,
    Health_Insurance NUMBER(1),
    Heart_Attack_Risk NUMBER(1)
);

select * from HEARTATTACKRISK;

SELECT * FROM HeartAttackRisk
ORDER BY Heart_Attack_Risk DESC
FETCH FIRST 5 ROWS ONLY;

SELECT COUNT(*) AS Diabetes_Patients
FROM HeartAttackRisk
WHERE Diabetes = 1;


SELECT Gender, AVG(Stress_Level) AS Avg_Stress
FROM HeartAttackRisk
GROUP BY Gender;


SELECT Age, AVG(Cholesterol_Level)
    FROM HeartAttackRisk
    GROUP BY Age;

CREATE INDEX idx_age ON HeartAttackRisk(Age);
CREATE INDEX idx_cholesterol ON HeartAttackRisk(Cholesterol_Level);
CREATE INDEX idx_bp ON HeartAttackRisk(Systolic_BP, Diastolic_BP);

SELECT Age, AVG(Cholesterol_Level)
    FROM HeartAttackRisk
    GROUP BY Age



