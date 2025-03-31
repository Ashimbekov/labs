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

INSERT INTO Branch VALUES (3, 'ул. Ленина 5', 'Брест', '1231231234');
INSERT INTO Branch VALUES (4, 'ул. Пушкина 10', 'Москва', '321231231231');

INSERT INTO Branch (bno, street, city, tel_no) VALUES (5, 'Победителей 10', 'Минск', '375291234567');
INSERT INTO Branch (bno, street, city, tel_no) VALUES (6, 'Советская 25', 'Гродно', '375152345678');
INSERT INTO Branch (bno, street, city, tel_no) VALUES (7, 'Мирляндия', 'Астана', '717171717');

INSERT INTO Staff VALUES (10, 'Ержан', 'Алибеков', 'Алматы, Самал 1', '1112223333', 'Менеджер', 'male', TO_DATE('1985-03-20', 'YYYY-MM-DD'), 500000, 1);
INSERT INTO Staff VALUES (15, 'Айгерим', 'Султанова', 'Астана, Нурлы жол 5', '4445556666', 'Агент', 'female', TO_DATE('1990-07-15', 'YYYY-MM-DD'), 400000, 2);
INSERT INTO Staff VALUES (20, 'Нурдаулет', 'Ашимбеков', 'Астана, Победа 11', '7777777777', 'Директор', 'male', TO_DATE('2002-07-22', 'YYYY-MM-DD'), 400000, 2);
INSERT INTO Staff VALUES (25, 'Асель', 'Бекенова', 'Астана, Керей 6', '9998887777', 'Агент', 'female', TO_DATE('1995-08-12', 'YYYY-MM-DD'), 350000, 2);
INSERT INTO Staff VALUES (30, 'Алексей', 'Иванов', 'Москва, ул. Пушкина 10', '343434343434', 'Агент', 'male', TO_DATE('1980-05-25', 'YYYY-MM-DD'), 300000, 4);
INSERT INTO Staff VALUES (35, 'Мария', 'Петрова', 'Брест, ул. Ленина 5', '353535353535', 'Менеджер', 'female', TO_DATE('1992-12-12', 'YYYY-MM-DD'), 450000, 3);
INSERT INTO Staff (sno, fname, lname, address, tel_no, position, sex, dob, salary, bno) VALUES
(40, 'Камиль', 'Айран', 'Астана, Малиновка 34', '400404040404', 'Агент', 'male', TO_DATE('1995-06-21', 'YYYY-MM-DD'), 300000, 7);




INSERT INTO Owner VALUES (1, 'Марат', 'Кенжебеков', 'Шымкент, Абай 3', '7778889999');
INSERT INTO Owner VALUES (2, 'Динара', 'Тлегенова', 'Караганда, Кенесары 7', '1231231234');
INSERT INTO Owner VALUES (3, 'Александр', 'Смирнов', 'Москва, ул. Тверская 15', '3333333333');
INSERT INTO Owner VALUES (4, 'Елена', 'Ковалева', 'Брест, ул. Советская 20', '4444444444');
INSERT INTO Owner VALUES (5, 'Алишер', 'Усманов', 'Москва, ул. Тверская 25', '888888888');
INSERT INTO Owner (ono, fname, lname, address, tel_no) VALUES (6, 'Нурадулет', 'Ашимбеков', 'Астана, ул. Республика 333', '7171717171');
INSERT INTO Owner (ono, fname, lname, address, tel_no) VALUES
(7, 'Ирина', 'Ковалева', 'Караганда, ул. Гоголя 5', '77783889999');

INSERT INTO Owner (ono, fname, lname, address, tel_no) VALUES (8, 'Нурдаулет', 'Ашимбеков', 'Кызылорда, ул. Главная 13', '2108200234');
INSERT INTO Owner (ono, fname, lname, address, tel_no) VALUES (9, 'Нурдаулет', 'Ашимбеков', 'Астана, ул. Красивая 19', '220720023');


INSERT INTO Property_for_rent VALUES (1, 'Жандосова 45', 'Алматы', 'h', 4, 150000, 1, 10, 1);
INSERT INTO Property_for_rent VALUES (2, 'Кабанбай батыра 30', 'Астана', 'f', 3, 120000, 2, 15, 2);
INSERT INTO Property_for_rent VALUES (3, 'ул. Ленина 5', 'Брест', 'f', 3, 100000, 3, 35, 3);
INSERT INTO Property_for_rent VALUES (4, 'ул. Пушкина 10', 'Москва', 'h', 5, 200000, 4, 30, 4);
INSERT INTO Property_for_rent VALUES (5, 'ул. Тверская 25', 'Москва', 'h', 6, 300000, 5, 30, 4);
INSERT INTO Property_for_rent VALUES (6, 'ул. Сарыарка 10', 'Астана', 'f', 3, 120000, 2, 15, 2);
INSERT INTO Property_for_rent VALUES (7, 'ул. Кенесары 30', 'Астана', 'f', 3, 130000, 2, 15, 2);
INSERT INTO Property_for_rent VALUES (8, 'ул. Советская 20', 'Брест', 'f', 3, 100000, 3, 35, 3);

INSERT INTO Property_for_rent VALUES (9, 'Абая 20', 'Алматы', 'f', 3, 150000, 1, 10, 1);
INSERT INTO Property_for_rent VALUES (10, 'Республика 25', 'Астана', 'f', 3, 140000, 2, 15, 2);

INSERT INTO Property_for_rent (pno, street, city, type, rooms, rent, ono, sno, bno) VALUES (11, 'Гоголя 10', 'Караганда', 'h', 4, 200000, 7, 10, 1);
INSERT INTO Property_for_rent (pno, street, city, type, rooms, rent, ono, sno, bno) VALUES (12, 'Гоголя 15', 'Караганда', 'f', 2, 120000, 7, 15, 2);



INSERT INTO Renter VALUES (1, 'Асхат', 'Турсынов', 'Алматы, Орбита 2', '5556667777', 'h', 180000, 1);
INSERT INTO Renter VALUES (2, 'Жанель', 'Есенова', 'Астана, Сарыарка 10', '8889990000', 'f', 140000, 2);
INSERT INTO Renter VALUES (3, 'Руслан', 'Мухамедьяров', 'Астана, Байтурсынова 8', '3334445555', 'f', 160000, 2);
INSERT INTO Renter VALUES (4, 'Иван', 'Сидоров', 'Москва, ул. Тверская 15', '6666666666', 'h', 250000, 4);
INSERT INTO Renter VALUES (5, 'Ольга', 'Козлова', 'Брест, ул. Советская 20', '7777777777', 'f', 90000, 3);
INSERT INTO Renter VALUES (6, 'Сергей', 'Сидоров', 'Астана, ул. Кенесары 30', '9999999999', 'f', 160000, 2);

INSERT INTO Viewing VALUES (1, 1, TO_DATE('2019-09-01', 'YYYY-MM-DD'), 'Очень просторный дом');
INSERT INTO Viewing VALUES (2, 2, TO_DATE('2025-03-02', 'YYYY-MM-DD'), 'Хорошее расположение');

INSERT INTO Viewing (rno, pno, date_o, comment_o) VALUES
(1, 11, TO_DATE('2023-01-10', 'YYYY-MM-DD'), 'Понравился дом');
INSERT INTO Viewing (rno, pno, date_o, comment_o) VALUES(2, 11, TO_DATE('2023-01-15', 'YYYY-MM-DD'), 'Хорошее состояние');
INSERT INTO Viewing (rno, pno, date_o, comment_o) VALUES(3, 11, TO_DATE('2023-01-20', 'YYYY-MM-DD'), 'Рассматриваем вариант');
INSERT INTO Viewing (rno, pno, date_o, comment_o) VALUES(1, 12, TO_DATE('2023-02-05', 'YYYY-MM-DD'), 'Маленькая кухня');
INSERT INTO Viewing (rno, pno, date_o, comment_o) VALUES(2, 12, TO_DATE('2023-02-10', 'YYYY-MM-DD'), 'Удобное расположение');
INSERT INTO Viewing (rno, pno, date_o, comment_o) VALUES(3, 12, TO_DATE('2023-02-15', 'YYYY-MM-DD'), 'Будем снимать');


UPDATE Viewing
SET DATE_O = TO_DATE('2019-09-01', 'YYYY-MM-DD')
WHERE RNO = 1 AND PNO = 1;



CREATE INDEX idx_staff_position ON Staff(position);
CREATE INDEX idx_property_rent ON Property_for_rent(rent);
CREATE INDEX idx_renter_max_rent ON Renter(max_rent);





commit;
