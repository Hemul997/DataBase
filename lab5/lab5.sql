--1.1 Выбрать первые два значения из таблицы periodical, поля name_of_periodical
SELECT TOP 2 name_of_periodical FROM periodical;

--2.1 Выбрать из таблицы periodical значения полей id_periodical, у которых поле name_of_periodical равно NULL
SELECT id_periodical FROM periodical WHERE name_of_periodical IS NULL;

--2.2 Выбрать из таблицы subscriber значения поля fio_subscriber, не равные NULL
SELECT id_subscriber FROM subscriber WHERE fio_subscriber IS NOT NULL;

--2.3 Выбрать из таблицы publisher поле id_publisher, значение которого от 1 до 3
SELECT id_publisher FROM publisher WHERE id_publisher BETWEEN 1 AND 3;

--2.4 Выбрать из таблицы periodical значения, у которых id равен 1, 2 или 3
SELECT * FROM periodical WHERE id_periodical In (1,2,3);

--2.5 Выбрать поле fio_courier из таблицы courier, где id_courier равен 2
SELECT fio_courier FROM courier WHERE id_courier = 2;

--2.6 Выбрать поле name_of_periodical из таблицы periodical, где название журнала не "Forbes"
SELECT name_of_periodical FROM periodical WHERE name_of_periodical <> "Forbes";


--3.1 Выбрать значения из таблицы delivery и отсортировать по id курьера в порядке возрастания
SELECT * FROM delivery ORDER BY id_courier ASC;

--3.2 То же самое, что в 3.1, но в порядке убывания
SELECT * FROM delivery ORDER BY id_courier DESC;

--3.3 Выбрать id издания из таблицы periodical и отсортировать в порядке убывания по полям id_periodical и id_publisher
SELECT id_periodical FROM periodical ORDER BY id_periodical DESC ,id_publisher DESC;

--3.4 Выбрать id и ФИО курьера из таблицы courier, отсортировать по id_courier в порядке убывания
SELECT id_courier, fio_courier FROM courier ORDER BY 1 DESC;


--4.1 Выбрать из таблицы periodical минимальную стоимость издания
SELECT MIN(price) FROM periodical;

--4.2 Выбрать из таблицы periodical максимальную стоимость издания
SELECT MAX(price) FROM periodical;

--4.3 Выбрать среднюю цену изданий
SELECT AVG(price) FROM periodical;

--4.4 Выбрать значение суммы всех изданий из таблицы periodical
SELECT SUM(price) FROM periodical;


--5.1 Выбрать все уникальные значения имён издателей из таблицы publisher
SELECT DISTINCT (name_of_publisher) FROM publisher;

--5.2 Подсчитать кол-во полей с уникальными значениями
SELECT Count(*) FROM (SELECT DISTINCT (name_of_publisher) FROM publisher)


--6.1 Выбрать из таблицы периодических изданий название издания и его суммарную стоимость. 
SELECT name_of_periodical, Sum(price) FROM periodical GROUP BY name_of_periodical;

--6.2 Выбрать из таблицы периодических изданий название издания и его суммарную стоимость, при условии что стоимость одного журнала больше 0 рублей
SELECT name_of_periodical, Sum(price) FROM periodical WHERE (price > 0) GROUP BY name_of_periodical;

--6.3 Выбрать из таблицы периодических изданий поля имя издания и его суммарную стоимость, при условии что суммарная стоимость больше 100 рублей
SELECT name_of_periodical, Sum(price) FROM periodical GROUP BY name_of_periodical HAVING (Sum(price) > 50);