CREATE TABLE Branch (
    bno NUMBER PRIMARY KEY,
    street VARCHAR2(100) NOT NULL,
    city VARCHAR2(50) NOT NULL,
    tel_no VARCHAR2(15) UNIQUE NOT NULL
);

CREATE TABLE Staff (
    sno NUMBER PRIMARY KEY,
    fname VARCHAR2(50) NOT NULL,
    lname VARCHAR2(50) NOT NULL,
    address VARCHAR2(150) NOT NULL,
    tel_no VARCHAR2(15) UNIQUE NOT NULL,
    position VARCHAR2(50) NOT NULL,
    sex VARCHAR2(6) CHECK (sex IN ('male', 'female')) NOT NULL,
    dob DATE NOT NULL,
    salary NUMBER,
    bno NUMBER,
    CONSTRAINT fk_staff_branch FOREIGN KEY (bno) REFERENCES Branch(bno)
);


CREATE TABLE Owner (
    ono NUMBER PRIMARY KEY,
    fname VARCHAR2(50) NOT NULL,
    lname VARCHAR2(50) NOT NULL,
    address VARCHAR2(150) NOT NULL,
    tel_no VARCHAR2(15) UNIQUE NOT NULL
);

CREATE TABLE Property_for_rent (
    pno NUMBER PRIMARY KEY,
    street VARCHAR2(100) NOT NULL,
    city VARCHAR2(50) NOT NULL,
    type CHAR(1) CHECK (type IN ('h', 'f')) NOT NULL,
    rooms NUMBER CHECK (rooms > 0) NOT NULL,
    rent NUMBER CHECK (rent > 0) NOT NULL,
    ono NUMBER,
    sno NUMBER,
    bno NUMBER,
    CONSTRAINT fk_property_owner FOREIGN KEY (ono) REFERENCES Owner(ono),
    CONSTRAINT fk_property_staff FOREIGN KEY (sno) REFERENCES Staff(sno),
    CONSTRAINT fk_property_branch FOREIGN KEY (bno) REFERENCES Branch(bno)
);


CREATE TABLE Renter (
    rno NUMBER PRIMARY KEY,
    fname VARCHAR2(50) NOT NULL,
    lname VARCHAR2(50) NOT NULL,
    address VARCHAR2(150) NOT NULL,
    tel_no VARCHAR2(15) UNIQUE NOT NULL,
    pref_type CHAR(1) CHECK (pref_type IN ('h', 'f')) NOT NULL,
    max_rent NUMBER CHECK (max_rent > 0) NOT NULL,
    bno NUMBER,
    CONSTRAINT fk_renter_branch FOREIGN KEY (bno) REFERENCES Branch(bno)
);


CREATE TABLE Viewing (
    rno NUMBER,
    pno NUMBER,
    date_o DATE NOT NULL,
    comment_o VARCHAR2(255),
    PRIMARY KEY (rno, pno),
    CONSTRAINT fk_viewing_renter FOREIGN KEY (rno) REFERENCES Renter(rno),
    CONSTRAINT fk_viewing_property FOREIGN KEY (pno) REFERENCES Property_for_rent(pno)
);

CREATE SEQUENCE Staff_seq START WITH 10 INCREMENT BY 5;


INSERT INTO Branch VALUES (1, 'Абая 10', 'Алматы', '1234567890');
INSERT INTO Branch VALUES (2, 'Тауелсиздик 15', 'Астана', '0987654321');


INSERT INTO Staff VALUES (10, 'Ержан', 'Алибеков', 'Алматы, Самал 1', '1112223333', 'Менеджер', 'male', TO_DATE('1985-03-20', 'YYYY-MM-DD'), 500000, 1);
INSERT INTO Staff VALUES (15, 'Айгерим', 'Султанова', 'Астана, Нурлы жол 5', '4445556666', 'Агент', 'female', TO_DATE('1990-07-15', 'YYYY-MM-DD'), 400000, 2);
INSERT INTO Staff VALUES (20, 'Нурдаулет', 'Ашимбеков', 'Астана, Победа 11', '7777777777', 'Директор', 'male', TO_DATE('2002-07-22', 'YYYY-MM-DD'), 400000, 2);
INSERT INTO Staff VALUES (25, 'Асель', 'Бекенова', 'Астана, Керей 6', '9998887777', 'Агент', 'female', TO_DATE('1995-08-12', 'YYYY-MM-DD'), 350000, 2);


INSERT INTO Owner VALUES (1, 'Марат', 'Кенжебеков', 'Шымкент, Абай 3', '7778889999');
INSERT INTO Owner VALUES (2, 'Динара', 'Тлегенова', 'Караганда, Кенесары 7', '1231231234');

INSERT INTO Property_for_rent VALUES (1, 'Жандосова 45', 'Алматы', 'h', 4, 150000, 1, 10, 1);
INSERT INTO Property_for_rent VALUES (2, 'Кабанбай батыра 30', 'Астана', 'f', 3, 120000, 2, 15, 2);

INSERT INTO Renter VALUES (1, 'Асхат', 'Турсынов', 'Алматы, Орбита 2', '5556667777', 'h', 180000, 1);
INSERT INTO Renter VALUES (2, 'Жанель', 'Есенова', 'Астана, Сарыарка 10', '8889990000', 'f', 140000, 2);
INSERT INTO Renter VALUES (3, 'Руслан', 'Мухамедьяров', 'Астана, Байтурсынова 8', '3334445555', 'f', 160000, 2);

INSERT INTO Viewing VALUES (1, 1, TO_DATE('2025-03-01', 'YYYY-MM-DD'), 'Очень просторный дом');
INSERT INTO Viewing VALUES (2, 2, TO_DATE('2025-03-02', 'YYYY-MM-DD'), 'Хорошее расположение');


CREATE INDEX idx_staff_position ON Staff(position);
CREATE INDEX idx_property_rent ON Property_for_rent(rent);
CREATE INDEX idx_renter_max_rent ON Renter(max_rent);


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

commit;
