-- 1 вариант
select * from STAFF;

SELECT UPPER(fname) AS First_Name, UPPER(lname) AS Last_Name
FROM Staff
WHERE salary BETWEEN 200000 AND 300000;

SELECT s.lname AS Last_Name, s.tel_no AS Phone_Number
FROM Staff s
JOIN Branch b ON s.bno = b.bno
WHERE b.city IN ('Брест', 'Минск');


SELECT position AS Должность,
       SUM(salary) AS Суммарная,
       AVG(salary) AS Средняя
FROM Staff
GROUP BY position;

SELECT position AS Должность
FROM Staff
GROUP BY position
HAVING SUM(salary) > (SELECT AVG(salary) FROM Staff);

-- 2 вариант
SELECT street || ', ' || city || ', тел.: ' || tel_no AS Office_Info
FROM Branch
WHERE city IN ('Минск', 'Гродно');

select * from BRANCH;

INSERT INTO Branch (bno, street, city, tel_no) VALUES
(5, 'Победителей 10', 'Минск', '375291234567');
INSERT INTO Branch (bno, street, city, tel_no) VALUES
(6, 'Советская 25', 'Гродно', '375152345678');


SELECT Staff.*
FROM Staff
JOIN Property_for_rent ON Staff.sno = Property_for_rent.sno
WHERE Property_for_rent.rooms = 3 AND Property_for_rent.type = 'f';

SELECT sex AS Пол,
       SUM(salary) AS Суммарная,
       AVG(salary) AS Средняя
FROM Staff
GROUP BY sex;

SELECT Branch.bno, Branch.street, Branch.city, Branch.tel_no, Staff.female_count
FROM Branch
JOIN (
    SELECT bno,
           SUM(CASE WHEN sex = 'female' THEN 1 ELSE 0 END) AS female_count,
           SUM(CASE WHEN sex = 'male' THEN 1 ELSE 0 END) AS male_count
    FROM Staff
    GROUP BY bno
) Staff ON Branch.bno = Staff.bno
WHERE Staff.female_count > Staff.male_count;

-- Вариант

SELECT street || ', ' || city || ', стоимость: ' || rent AS Property_Info
FROM Property_for_rent
WHERE rooms = 3 AND type = 'f';


SELECT DISTINCT Renter.rno, Renter.fname, Renter.lname
FROM Renter
JOIN Viewing ON Renter.rno = Viewing.rno
WHERE EXTRACT(YEAR FROM Viewing.date_o) = 2025;

SELECT Branch.bno, Branch.city,
       MIN(Staff.salary) AS Минимальная,
       MAX(Staff.salary) AS Максимальная
FROM Staff
JOIN Branch ON Staff.bno = Branch.bno
GROUP BY Branch.bno, Branch.city;

SELECT Branch.bno, Branch.city, SUM(Staff.salary) AS Суммарная_зарплата
FROM Staff
JOIN Branch ON Staff.bno = Branch.bno
GROUP BY Branch.bno, Branch.city
HAVING SUM(Staff.salary) > (SELECT AVG(salary) FROM Staff);


-- 4 вариант

SELECT lname || ' - ' || tel_no AS "Фамилия - Телефон"
FROM Staff
WHERE position = 'Директор';


SELECT fname, lname, tel_no, Property_for_rent.rooms
FROM Owner
JOIN Property_for_rent ON Owner.ono = Property_for_rent.ono
WHERE Property_for_rent.rooms = 3;

select * from Branch;
select * from Staff;

SELECT Branch.bno, Branch.city, COUNT(Staff.sno) AS "Количество"
FROM Branch
LEFT JOIN Staff ON Branch.bno = Staff.bno
GROUP BY Branch.bno, Branch.city;

select * from Renter;

SELECT Branch.*,
       COUNT(DISTINCT Staff.sno) AS "Количество сотрудников",
       COUNT(DISTINCT Renter.rno) AS "Количество арендаторов"
FROM Branch
LEFT JOIN Staff ON Branch.bno = Staff.bno
LEFT JOIN Renter ON Branch.bno = Renter.bno
GROUP BY Branch.bno, Branch.street, Branch.city, Branch.tel_no
HAVING COUNT(DISTINCT Staff.sno) > 1 AND COUNT(DISTINCT Renter.rno) > 1;

-- 5 вариант

SELECT fname || ' ' || lname || ', ' || address AS ФИО_и_Адрес
FROM Staff
WHERE dob < TO_DATE('2002-07-22', 'YYYY-MM-DD');


select * from STAFF;

SELECT COUNT(Staff.sno) AS Количество
FROM Staff
JOIN Branch ON Staff.bno = Branch.bno
WHERE Branch.city = 'Брест';

SELECT Property_for_rent.rooms AS Количество_комнат, COUNT(DISTINCT Viewing.rno) AS Количество_арендаторов
FROM Viewing
JOIN Property_for_rent ON Viewing.pno = Property_for_rent.pno
WHERE Property_for_rent.rooms IN (3, 4)
GROUP BY Property_for_rent.rooms;

SELECT Owner.ono, Owner.fname, Owner.lname, COUNT(DISTINCT Property_for_rent.pno) AS Количество_объектов
FROM Owner
JOIN Property_for_rent ON Owner.ono = Property_for_rent.ono
GROUP BY Owner.ono, Owner.fname, Owner.lname
HAVING COUNT(DISTINCT Property_for_rent.bno) > 1 AND COUNT(DISTINCT Property_for_rent.pno) > 2;

select * from OWNER;

INSERT INTO Owner (ono, fname, lname, address, tel_no) VALUES
(6, 'Нурадулет', 'Ашимбеков', 'Астана, ул. Республика 333', '7171717171');

INSERT INTO Property_for_rent (pno, street, city, type, rooms, rent, ono, sno, bno) VALUES (6, 'Ленина 10', 'Минск', 'f', 3, 100000, 6, 10, 1);
INSERT INTO Property_for_rent (pno, street, city, type, rooms, rent, ono, sno, bno) VALUES (7, 'Пушкина 5', 'Минск', 'h', 4, 150000, 6, 15, 2);
INSERT INTO Property_for_rent (pno, street, city, type, rooms, rent, ono, sno, bno) VALUES (8, 'Гоголя 8', 'Минск', 'f', 2, 80000, 6, 20, 3);

-- 6 вариант

SELECT street || ', ' || city AS Адрес
FROM Property_for_rent
WHERE type = 'f' AND rent <= 300000; 

SELECT COUNT(Staff.sno) AS Количество
FROM Staff
JOIN Branch ON Staff.bno = Branch.bno
WHERE Branch.city = 'Минск' AND Staff.position = 'Менеджер';

SELECT type AS Тип, COUNT(pno) AS Количество
FROM Property_for_rent
GROUP BY type;

SELECT Staff.sno, Staff.fname, Staff.lname
FROM Staff
JOIN Property_for_rent ON Staff.sno = Property_for_rent.sno
GROUP BY Staff.sno, Staff.fname, Staff.lname
HAVING SUM(CASE WHEN Property_for_rent.type = 'h' THEN 1 ELSE 0 END) > 
       SUM(CASE WHEN Property_for_rent.type = 'f' THEN 1 ELSE 0 END);


-- 7 вариант
SELECT lname || ', тел.: ' || tel_no AS Арендатор_и_Телефон
FROM Renter
WHERE pref_type = 'h';

SELECT DISTINCT Owner.tel_no
FROM Owner
JOIN Property_for_rent ON Owner.ono = Property_for_rent.ono
JOIN Viewing ON Property_for_rent.pno = Viewing.pno
WHERE EXTRACT(YEAR FROM Viewing.date_o) = 2019 AND EXTRACT(MONTH FROM Viewing.date_o) = 9;

UPDATE Viewing
SET DATE_O = TO_DATE('2019-09-01', 'YYYY-MM-DD')
WHERE RNO = 1 AND PNO = 1;

SELECT Branch.city, 
       MIN(CASE WHEN Property_for_rent.type = 'f' THEN rent END) AS Дешевая_квартира,
       MIN(CASE WHEN Property_for_rent.type = 'h' THEN rent END) AS Дешевый_дом
FROM Property_for_rent
JOIN Branch ON Property_for_rent.bno = Branch.bno
GROUP BY Branch.city;

SELECT Branch.city, 
       AVG(Staff.salary) AS Средняя_зарплата,
       COUNT(Property_for_rent.pno) AS Количество_объектов
FROM Staff
JOIN Branch ON Staff.bno = Branch.bno
LEFT JOIN Property_for_rent ON Staff.sno = Property_for_rent.sno
GROUP BY Branch.city;


-- 8 вариант
SELECT UPPER(fname) || ' ' || UPPER(lname) AS Женщина_менеджер
FROM Staff
WHERE sex = 'female' AND position = 'Менеджер';

SELECT Staff.fname, Staff.lname, Staff.salary
FROM Staff
JOIN Branch ON Staff.bno = Branch.bno
WHERE Branch.city = 'Астана' AND Staff.salary = (
    SELECT MAX(salary)
    FROM Staff
    JOIN Branch ON Staff.bno = Branch.bno
    WHERE Branch.city = 'Астана'
);

SELECT TO_CHAR(Viewing.date_o, 'Day') AS День_недели, COUNT(*) AS Количество
FROM Viewing
GROUP BY TO_CHAR(Viewing.date_o, 'Day');

SELECT Branch.bno, Branch.city, AVG(Property_for_rent.rent) AS Средняя_стоимость
FROM Property_for_rent
JOIN Branch ON Property_for_rent.bno = Branch.bno
WHERE Property_for_rent.rooms = 2 AND Property_for_rent.type = 'f'
GROUP BY Branch.bno, Branch.city
ORDER BY Средняя_стоимость DESC
FETCH FIRST 1 ROW ONLY;


-- 9 вариант

SELECT COUNT(DISTINCT Viewing.rno) AS Количество_арендаторов,
       COUNT(DISTINCT Viewing.pno) AS Количество_объектов
FROM Viewing
WHERE Viewing.date_o >= ADD_MONTHS(SYSDATE, -12);

SELECT DISTINCT Staff.fname, Staff.lname
FROM Staff
JOIN Property_for_rent ON Staff.sno = Property_for_rent.sno
JOIN Branch ON Property_for_rent.bno = Branch.bno
WHERE Branch.city = 'Астана';

SELECT Branch.city, SUM(Property_for_rent.rent) AS Суммарная_стоимость
FROM Property_for_rent
JOIN Branch ON Property_for_rent.bno = Branch.bno
WHERE Branch.city IN ('Астана', 'Алматы')
GROUP BY Branch.city;


SELECT Owner.ono, Owner.fname, Owner.lname, COUNT(Property_for_rent.pno) AS Количество_квартир
FROM Owner
JOIN Property_for_rent ON Owner.ono = Property_for_rent.ono
JOIN Branch ON Property_for_rent.bno = Branch.bno
WHERE Branch.city != 'Астана' AND Property_for_rent.type = 'f'
GROUP BY Owner.ono, Owner.fname, Owner.lname
HAVING COUNT(Property_for_rent.pno) > (
    SELECT MAX(COUNT(pno))
    FROM Property_for_rent
    JOIN Branch ON Property_for_rent.bno = Branch.bno
    WHERE Branch.city = 'Астана' AND Property_for_rent.type = 'f'
    GROUP BY Property_for_rent.ono
);


-- 10 вариант
SELECT RPAD(lname, 20, '.') AS Фамилия, LPAD(tel_no, 15, '.') AS Телефон
FROM Renter
WHERE tel_no LIKE '%5%' OR tel_no LIKE '%7%';

SELECT COUNT(DISTINCT Property_for_rent.ono) AS Количество_собственников
FROM Property_for_rent
JOIN Viewing ON Property_for_rent.pno = Viewing.pno
WHERE Viewing.comment_o IS NOT NULL;

SELECT Branch.bno, Branch.city, COUNT(Staff.sno) AS Количество_сотрудников
FROM Branch
JOIN Staff ON Branch.bno = Staff.bno
GROUP BY Branch.bno, Branch.city
HAVING COUNT(Staff.sno) >= 3;


SELECT Staff.fname, Staff.lname, Branch.city
FROM Staff
JOIN Branch ON Staff.bno = Branch.bno
LEFT JOIN Property_for_rent ON Branch.bno = Property_for_rent.bno
WHERE Property_for_rent.pno IS NULL;


INSERT INTO Branch (bno, street, city, tel_no) VALUES
(7, 'Мирляндия', 'Астана', '717171717');

INSERT INTO Staff (sno, fname, lname, address, tel_no, position, sex, dob, salary, bno) VALUES
(40, 'Камиль', 'Айран', 'Астана, Малиновка 34', '400404040404', 'Агент', 'male', TO_DATE('1995-06-21', 'YYYY-MM-DD'), 300000, 7);


