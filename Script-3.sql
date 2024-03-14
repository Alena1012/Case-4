--ЗАДАНИЕ №1
--Выведите уникальные названия городов из таблицы городов.

select distinct city
from city

--ЗАДАНИЕ №2
--Доработайте запрос из предыдущего задания, чтобы запрос выводил только те города,
--названия которых начинаются на “L” и заканчиваются на “a”, и названия не содержат пробелов.

select distinct city
from city
where (city like 'L%a') and (city not like '% %')

--ЗАДАНИЕ №3
--Получите из таблицы платежей за прокат фильмов информацию по платежам, которые выполнялись 
--в промежуток с 17 июня 2005 года по 19 июня 2005 года включительно, 
--и стоимость которых превышает 1.00.
--Платежи нужно отсортировать по дате платежа.

select *
from payment
where (payment_date between '2005-06-17 00:00:00' and '2005-06-19') and (amount>1)
order by payment_date

--ЗАДАНИЕ №4
--Выведите информацию о 10-ти последних платежах за прокат фильмов.

select *
from payment
order by payment_date desc 
limit 10

--ЗАДАНИЕ №5
--Выведите следующую информацию по покупателям:
--1. Фамилия и имя (в одной колонке через пробел)
--2. Электронная почта
--3. Длину значения поля email
--4. Дату последнего обновления записи о покупателе (без времени)
--Каждой колонке задайте наименование на русском языке.

select last_name || ' ' || first_name as "Фамилия Имя", email, LENGTH (email) as "Длина email", cast (last_update as date) as "Дата"
from customer

--ЗАДАНИЕ №6
--Выведите одним запросом только активных покупателей, имена которых KELLY или WILLIE.
--Все буквы в фамилии и имени из верхнего регистра должны быть переведены в нижний регистр.

select lower (last_name) as last_name,  lower(first_name) as first_name, active
from customer
where (first_name like 'KELLY') or (first_name like 'WILLIE') and active = 1

--Задание №7.
--Выведите информацию о фильмах, у которых рейтинг “R” и стоимость аренды указана от 0.00 до 3.00 включительно, 
--а также фильмы c рейтингом “PG-13” и стоимостью аренды больше или равной 4.00.

select film_id, title, description, rating, rental_rate 
from film 
where ((rating = 'R') and (rental_rate between 0. and 3.)) or ((rating = 'PG-13') and (rental_rate >= 4.00))

--Задание №8. 
--Получите информацию о трёх фильмах с самым длинным описанием фильма.

select film_id, title, description, character_length(description)
from film 
order by 4 desc
limit 3


--Задание №9. 
--Выведите Email каждого покупателя, разделив значение Email на 2 отдельных колонки:
--в первой колонке должно быть значение, указанное до @,
--во второй колонке должно быть значение, указанное после @.

select customer_id, email,  SPLIT_PART(email, '@', 1) as "email before @", SPLIT_PART(email, '@', 2) as "email after @"
from customer 

--Задание №10. 
--Доработайте запрос из предыдущего задания, скорректируйте значения в новых колонках: 
--первая буква строки должна быть заглавной, остальные строчными.

select customer_id, UPPER(SUBSTRING(email, 1, 1)) || LOWER(SUBSTRING(email, 2))as email, 
UPPER(SUBSTRING((SPLIT_PART(email, '@', 1)), 1, 1)) || LOWER(SUBSTRING((SPLIT_PART(email, '@', 1)), 2)) as "email before @", 
UPPER(SUBSTRING((SPLIT_PART(email, '@', 2)), 1, 1)) || LOWER(SUBSTRING((SPLIT_PART(email, '@', 2)), 2)) as "email after @"
from customer

