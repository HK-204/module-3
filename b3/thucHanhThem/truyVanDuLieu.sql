-- 1
SELECT title, length FROM sakila.film
WHERE length >= 120;

-- 2
SELECT title, length, rating FROM sakila.film
WHERE length BETWEEN 90 AND 120
	AND rating IN ('PG', 'G');

-- 3
SELECT title, length FROM sakila.film
ORDER BY length DESC
LIMIT 10;

-- 4
SELECT CS.first_name, CS.last_name, C.city FROM customer CS
JOIN address AD ON CS.address_id = AD.address_id
JOIN city C ON AD.city_id = C.city_id;

-- 5
SELECT CN.country FROM country CN
JOIN city C ON CN.country_id = C.country_id
JOIN address AD ON C.city_id = AD.city_id
JOIN customer CS ON AD.address_id = CS.address_id
GROUP BY CN.country
HAVING COUNT(*) > 10;

-- 6
SELECT C.name, COUNT(F.film_id) FROM category C
JOIN film_category FC ON C.category_id = FC.category_id
JOIN film F ON FC.film_id = F.film_id
GROUP BY C.name
ORDER BY COUNT(F.film_id) DESC;

-- 7
SELECT CS.first_name, CS.last_name, COUNT(RT.customer_id) AS lan_thue
FROM customer CS
JOIN rental RT ON CS.customer_id = RT.customer_id
GROUP BY CS.first_name, CS.last_name
HAVING COUNT(RT.customer_id) >= 30;

-- 8
SELECT F.title FROM film F
JOIN language LG ON F.language_id = LG.language_id
WHERE LG.name != 'English';

-- 9
SELECT C.city, SUM(PAY.amount) FROM city C
JOIN address AD ON C.city_id = AD.city_id
JOIN customer CS ON AD.address_id = CS.address_id
JOIN rental RT ON CS.customer_id = RT.customer_id
JOIN payment PAY ON RT.rental_id = PAY.rental_id
GROUP BY C.city
HAVING SUM(PAY.amount) > 500;

-- 10
SELECT F.title, COUNT(A.last_name) FROM film F
JOIN film_actor FA ON F.film_id = FA.film_id
JOIN actor A ON FA.actor_id = A.actor_id
GROUP BY F.title
ORDER BY COUNT(A.last_name) DESC
LIMIT 5;