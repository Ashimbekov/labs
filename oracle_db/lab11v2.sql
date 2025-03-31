CREATE OR REPLACE VIEW brest_branches AS
SELECT * FROM Branch
WHERE city = 'Брест';

select * from brest_branches;

CREATE OR REPLACE VIEW min_price_properties AS
SELECT * FROM Property_for_rent
WHERE rent = (SELECT MIN(rent) FROM Property_for_rent);

select * from min_price_properties;

CREATE OR REPLACE VIEW viewings_with_comments AS
SELECT p.pno, p.street, p.city, p.type, p.rooms, COUNT(v.comment_o) AS comments_count
FROM Property_for_rent p
JOIN Viewing v ON p.pno = v.pno
WHERE v.comment_o IS NOT NULL
GROUP BY p.pno, p.street, p.city, p.type, p.rooms;

select * from viewings_with_comments;



INSERT INTO Renter (rno, fname, lname, address, tel_no, pref_type, max_rent, bno) VALUES
(6, 'Алексей', 'Петров', 'Алматы, ул. Абая 15', '5551112222', 'f', 180000, 1);
INSERT INTO Renter (rno, fname, lname, address, tel_no, pref_type, max_rent, 
bno) VALUES (7, 'Мария', 'Сидорова', 'Астана, ул. Республика 20', '5553334444', 'f', 160000, 2);
INSERT INTO Property_for_rent (pno, street, city, type, rooms, rent, ono, sno, bno) VALUES (9, 'Абая 20', 'Алматы', 'f', 3, 150000, 1, 10, 
1);
INSERT INTO Property_for_rent (pno, street, city, type, rooms, 
rent, ono, sno, bno) VALUES (10, 'Республика 25', 'Астана', 'f', 3, 140000, 2, 15, 2);

CREATE OR REPLACE VIEW renters_local_3room AS
SELECT r.* 
FROM Renter r
JOIN Property_for_rent p 
    ON r.pref_type = p.type 
    AND r.max_rent >= p.rent
    AND p.rooms = 3 
    AND p.type = 'f'
    AND TRIM(SUBSTR(r.address, 1, INSTR(r.address, ',') - 1)) = p.city;

select * from renters_local_3room;


CREATE OR REPLACE VIEW branch_max_staff AS
SELECT b.* 
FROM Branch b
JOIN (
    SELECT bno, COUNT(*) AS staff_count
    FROM Staff
    GROUP BY bno
    ORDER BY staff_count DESC
    FETCH FIRST 1 ROW ONLY
) s ON b.bno = s.bno;

select * from branch_max_staff;


CREATE OR REPLACE VIEW staff_current_quarter_properties AS
SELECT s.sno, s.fname, s.lname, p.pno, p.street, p.city, p.type, p.rooms, p.rent
FROM Staff s
JOIN Property_for_rent p ON s.sno = p.sno
WHERE EXISTS (
    SELECT 1 FROM Viewing v
    WHERE v.pno = p.pno
    AND v.date_o BETWEEN TRUNC(SYSDATE, 'Q') AND ADD_MONTHS(TRUNC(SYSDATE, 'Q'), 3)
);

select * from staff_current_quarter_properties;


INSERT INTO Owner (ono, fname, lname, address, tel_no) VALUES
(7, 'Ирина', 'Ковалева', 'Караганда, ул. Гоголя 5', '77783889999');

INSERT INTO Property_for_rent (pno, street, city, type, rooms, rent, ono, sno, bno) VALUES (11, 'Гоголя 10', 'Караганда', 'h', 4, 200000, 7, 10, 1);
INSERT INTO Property_for_rent (pno, street, city, type, rooms, rent, ono, sno, bno) VALUES (12, 'Гоголя 15', 'Караганда', 'f', 2, 120000, 7, 15, 2);

INSERT INTO Viewing (rno, pno, date_o, comment_o) VALUES
(1, 11, TO_DATE('2023-01-10', 'YYYY-MM-DD'), 'Понравился дом');
INSERT INTO Viewing (rno, pno, date_o, comment_o) VALUES(2, 11, TO_DATE('2023-01-15', 'YYYY-MM-DD'), 'Хорошее состояние');
INSERT INTO Viewing (rno, pno, date_o, comment_o) VALUES(3, 11, TO_DATE('2023-01-20', 'YYYY-MM-DD'), 'Рассматриваем вариант');
INSERT INTO Viewing (rno, pno, date_o, comment_o) VALUES(1, 12, TO_DATE('2023-02-05', 'YYYY-MM-DD'), 'Маленькая кухня');
INSERT INTO Viewing (rno, pno, date_o, comment_o) VALUES(2, 12, TO_DATE('2023-02-10', 'YYYY-MM-DD'), 'Удобное расположение');
INSERT INTO Viewing (rno, pno, date_o, comment_o) VALUES(3, 12, TO_DATE('2023-02-15', 'YYYY-MM-DD'), 'Будем снимать');

CREATE OR REPLACE VIEW owners_multiple_viewings AS
SELECT o.*
FROM Owner o
JOIN Property_for_rent p ON o.ono = p.ono
JOIN Viewing v ON p.pno = v.pno
GROUP BY o.ono, o.fname, o.lname, o.address, o.tel_no
HAVING COUNT(*) > 2;


select * from owners_multiple_viewings;


INSERT INTO Owner (ono, fname, lname, address, tel_no) VALUES (8, 'Нурдаулет', 'Ашимбеков', 'Кызылорда, ул. Главная 13', '2108200234');
INSERT INTO Owner (ono, fname, lname, address, tel_no) VALUES (9, 'Нурдаулет', 'Ашимбеков', 'Астана, ул. Красивая 19', '220720023');

CREATE OR REPLACE VIEW owners_same_names AS
SELECT o1.*
FROM Owner o1
JOIN Owner o2 ON o1.fname = o2.fname AND o1.ono <> o2.ono
GROUP BY o1.ono, o1.fname, o1.lname, o1.address, o1.tel_no;

select * from owners_same_names;

CREATE OR REPLACE VIEW active_staff AS
SELECT * FROM Staff
WHERE position IN ('Менеджер', 'Агент')
WITH CHECK OPTION;

select * from active_staff;


CREATE OR REPLACE VIEW property_details AS
SELECT p.pno, p.street, p.city, p.type, p.rooms, p.rent,
       o.fname || ' ' || o.lname AS owner_name,
       b.city AS branch_city
FROM Property_for_rent p
JOIN Owner o ON p.ono = o.ono
JOIN Branch b ON p.bno = b.bno;


select * from property_details;

UPDATE active_staff
SET salary = salary * 1.1
WHERE position = 'Менеджер';


-- Эта инструкция вызовет ошибку, так как пытается изменить позицию на недопустимую
UPDATE active_staff
SET position = 'Директор'
WHERE sno = 10;



CREATE OR REPLACE VIEW working_hours_staff AS
SELECT * FROM Staff
WHERE 
    (TO_CHAR(SYSDATE, 'DY') NOT IN ('SAT', 'SUN') 
     AND TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) BETWEEN 8 AND 17)
WITH CHECK OPTION;


select * from working_hours_staff;


