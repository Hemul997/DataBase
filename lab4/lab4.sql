--1.1
INSERT INTO manufacturer 
VALUES (NULL, "LG", "South Korea");
--1.2
INSERT INTO organization (name_of_organization, address, phone_number)
VALUES ("DNS", "Yoshkar-Ola", "38-33-20");
--1.3
INSERT INTO good_in_invoice (id_good)
SELECT (id_good)
FROM good;
--2.1
DELETE *
FROM invoice;
--2.2
DELETE *
FROM manufacturer
WHERE name_of_manufacturer = "Samsung";
--2.3
TRUNCATE TABLE good_in_invoice;
--3.1
UPDATE good SET name_of_good = "monitor";
--3.2
UPDATE good SET price = "19000.00р"
WHERE name_of_good = "notebook";
--3.3
UPDATE goods_in_invoice SET id_invoice = 3, id_good = 5 WHERE record_number = 1;
--4.1
SELECT name_of_organization, address
FROM organization;
--4.2
SELECT *
FROM organization;
--4.3
SELECT * FROM good WHERE name_of_good = "phone";