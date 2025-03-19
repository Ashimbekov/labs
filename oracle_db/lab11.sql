CREATE VIEW Brest_Branches AS
SELECT * FROM Branch
WHERE city = 'Брест';

select * from Brest_Branches;
INSERT INTO Branch VALUES (3, 'ул. Ленина 5', 'Брест', '1231231234');
INSERT INTO Branch VALUES (4, 'ул. Пушкина 10', 'Москва', '321231231231');

CREATE VIEW Min_Rent_Properties AS
SELECT * FROM Property_for_rent
WHERE rent = (SELECT MIN(rent) FROM Property_for_rent);

select * from Min_Rent_Properties;


CREATE VIEW Viewings_With_Comments AS
SELECT Property_for_rent.pno, Property_for_rent.street, Property_for_rent.city,
       COUNT(Viewing.rno) AS view_count, Viewing.comment_o
FROM Property_for_rent
JOIN Viewing ON Property_for_rent.pno = Viewing.pno
GROUP BY Property_for_rent.pno, Property_for_rent.street, Property_for_rent.city, Viewing.comment_o;

select * from Viewings_With_Comments;


CREATE VIEW Renters_3Bedroom_SameCity AS
SELECT Renter.*
FROM Renter
JOIN Property_for_rent ON Renter.bno = Property_for_rent.bno
WHERE Property_for_rent.rooms = 3
  AND Property_for_rent.type = 'f'
  AND TRIM(SUBSTR(Renter.address, INSTR(Renter.address, ',') + 1)) = Property_for_rent.city;


select * from renter;
select * from PROPERTY_FOR_RENT;
select * from BRANCH;
select * from STAFF;
select * from OWNER;

select * from Renters_3Bedroom_SameCity;

INSERT INTO Staff VALUES (30, 'Алексей', 'Иванов', 'Москва, ул. Пушкина 10', '343434343434', 'Агент', 'male', TO_DATE('1980-05-25', 'YYYY-MM-DD'), 300000, 4);
INSERT INTO Staff VALUES (35, 'Мария', 'Петрова', 'Брест, ул. Ленина 5', '353535353535', 'Менеджер', 'female', TO_DATE('1992-12-12', 'YYYY-MM-DD'), 450000, 3);

INSERT INTO Owner VALUES (3, 'Александр', 'Смирнов', 'Москва, ул. Тверская 15', '3333333333');
INSERT INTO Owner VALUES (4, 'Елена', 'Ковалева', 'Брест, ул. Советская 20', '4444444444');

INSERT INTO Property_for_rent VALUES (3, 'ул. Ленина 5', 'Брест', 'f', 3, 100000, 3, 35, 3);
INSERT INTO Property_for_rent VALUES (4, 'ул. Пушкина 10', 'Москва', 'h', 5, 200000, 4, 30, 4);

INSERT INTO Renter VALUES (4, 'Иван', 'Сидоров', 'Москва, ул. Тверская 15', '6666666666', 'h', 250000, 4);
INSERT INTO Renter VALUES (5, 'Ольга', 'Козлова', 'Брест, ул. Советская 20', '7777777777', 'f', 90000, 3);
INSERT INTO Renter VALUES (6, 'Сергей', 'Сидоров', 'Астана, ул. Кенесары 30', '9999999999', 'f', 160000, 2);

INSERT INTO Property_for_rent VALUES (6, 'ул. Сарыарка 10', 'Астана', 'f', 3, 120000, 2, 15, 2);
INSERT INTO Property_for_rent VALUES (7, 'ул. Кенесары 30', 'Астана', 'f', 3, 130000, 2, 15, 2);
INSERT INTO Property_for_rent VALUES (8, 'ул. Советская 20', 'Брест', 'f', 3, 100000, 3, 35, 3);

select * from RENTERS_3BEDROOM_SAMECITY;

SELECT Renter.*
FROM Renter
JOIN Property_for_rent ON Renter.bno = Property_for_rent.bno
WHERE Property_for_rent.rooms = 3
  AND Property_for_rent.type = 'f'
  AND TRIM(SUBSTR(address, 1, INSTR(address, ',') - 1)) = Property_for_rent.city;

CREATE VIEW Renters_3Bedroom_SameCity2 AS
SELECT DISTINCT Renter.*
FROM Renter
JOIN Property_for_rent ON Renter.bno = Property_for_rent.bno
WHERE Property_for_rent.rooms = 3
  AND Property_for_rent.type = 'f'
  AND TRIM(SUBSTR(Renter.address, 1, INSTR(Renter.address, ',') - 1)) = Property_for_rent.city;

select * from RENTERS_3BEDROOM_SAMECITY2;

select * from Property_for_rent;

SELECT DISTINCT city FROM Property_for_rent;
SELECT DISTINCT TRIM(SUBSTR(address, INSTR(address, ',') + 1)) AS renter_city FROM Renter;

SELECT address, TRIM(SUBSTR(address, INSTR(address, ',') + 1)) AS city_extracted FROM Renter;

SELECT DISTINCT TRIM(SUBSTR(address, 1, INSTR(address, ',') - 1)) AS renter_city
FROM Renter;

SELECT * FROM Property_for_rent WHERE rooms = 3 AND type = 'f';

SELECT DISTINCT bno FROM Renter;
SELECT DISTINCT bno FROM Property_for_rent;



CREATE VIEW Branch_Max_Staff AS
SELECT Branch.bno, Branch.street, Branch.city, Branch.tel_no
FROM Branch
JOIN Staff ON Branch.bno = Staff.bno
GROUP BY Branch.bno, Branch.street, Branch.city, Branch.tel_no
HAVING COUNT(Staff.sno) = (
    SELECT MAX(staff_count)
    FROM (
        SELECT COUNT(Staff.sno) AS staff_count
        FROM Staff
        GROUP BY Staff.bno
    )
);

select * from BRANCH_MAX_STAFF;

CREATE VIEW Staff_Properties_Current_Quarter AS
SELECT Staff.sno, Staff.fname, Staff.lname,
       Property_for_rent.pno, Property_for_rent.street, Property_for_rent.city,
       Property_for_rent.type, Property_for_rent.rooms, Property_for_rent.rent
FROM Staff
JOIN Property_for_rent ON Staff.sno = Property_for_rent.sno
WHERE TO_CHAR(SYSDATE, 'Q') = TO_CHAR(SYSDATE, 'Q');

select * from STAFF_PROPERTIES_CURRENT_QUARTER;

CREATE VIEW Owners_Multiple_Viewings AS
SELECT Owner.*
FROM Owner
JOIN Property_for_rent ON Owner.ono = Property_for_rent.ono
JOIN Viewing ON Property_for_rent.pno = Viewing.pno
GROUP BY Owner.ono, Owner.fname, Owner.lname, Owner.address, Owner.tel_no
HAVING COUNT(Viewing.rno) > 2;

select * from OWNERS_MULTIPLE_VIEWINGS;

CREATE VIEW Owners_Same_Names AS
SELECT Owner1.*
FROM Owner Owner1
JOIN Owner Owner2 ON Owner1.fname = Owner2.fname AND Owner1.ono <> Owner2.ono;

CREATE VIEW Updatable_Staff AS
SELECT * FROM Staff
WHERE position = 'Менеджер'
WITH CHECK OPTION;


CREATE VIEW Non_Updatable_Property_Details AS
SELECT Property_for_rent.pno, Property_for_rent.street, Property_for_rent.city,
       Property_for_rent.type, Property_for_rent.rooms, Property_for_rent.rent,
       Owner.fname AS owner_fname, Owner.lname AS owner_lname
FROM Property_for_rent
JOIN Owner ON Property_for_rent.ono = Owner.ono;



UPDATE Updatable_Staff
SET salary = 550000
WHERE sno = 10;


UPDATE Updatable_Staff
SET position = 'Агент'
WHERE sno = 10;




CREATE OR REPLACE VIEW Working_Hours_Staff AS
SELECT * FROM Staff
WHERE TO_CHAR(SYSDATE, 'DY') NOT IN ('SAT', 'SUN')
  AND TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) BETWEEN 9 AND 17
WITH CHECK OPTION;


