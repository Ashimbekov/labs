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