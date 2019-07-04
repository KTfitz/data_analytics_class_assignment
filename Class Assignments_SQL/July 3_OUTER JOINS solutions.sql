SELECT *
FROM da_sales.customers
LIMIT 100;

SELECT *
FROM da_sales.purchases
LIMIT 100; 

SELECT *
FROM da_sales.products
LIMIT 100;

SELECT count(distinct id) FROM da_sales.customers;

SELECT count(distinct c.id) 
FROM da_sales.customers c
	JOIN da_sales.purchases p 
	ON p.custid = c.id;
	
SELECT count(distinct c.id) 
FROM da_sales.customers c
	LEFT JOIN da_sales.purchases p 
	ON p.custid = c.id;
	
SELECT count(distinct c.id) 
FROM da_sales.customers c
	RIGHT JOIN da_sales.purchases p 
	ON p.custid = c.id;

--The JOIN and LEFT JOIN produced the most unique customer IDs: 7
	
SELECT c.name, pr.name 
FROM da_sales.customers c
	LEFT JOIN da_sales.purchases pu ON c.id = pu.custid
	LEFT JOIN da_sales.products pr ON pu.prodid = pr.id;
	
SELECT c.name, pr.name 
FROM da_sales.customers c
	LEFT JOIN da_sales.purchases pu ON c.id = pu.custid
	LEFT JOIN da_sales.products pr ON pu.prodid = pr.id
ORDER BY c.name, pr.name;

SELECT *
FROM da_readychef.meals
LIMIT 100;

SELECT *
FROM da_readychef.events
LIMIT 100;

SELECT e.event, count(e.event), m.meal_id, m.type
FROM da_readychef.events e
	JOIN da_readychef.meals m ON e. meal_id = m.meal_id
GROUP BY e.event, m.meal_id, m.type;

SELECT *
FROM da_readychef.referrals
LIMIT 10

SELECT e.event, count(e.event), m.meal_id, m.type, e.userid
FROM da_readychef.events e
	JOIN da_readychef.meals m ON e. meal_id = m.meal_id
	LEFT JOIN da_readychef.referrals r on e.userid = r.referred
	WHERE r.referred is NULL 
GROUP BY e.event, m.meal_id, m.type, e.userid
LIMIT 100;

SELECT e.event, m.meal_id
FROM da_readychef.events e
	LEFT JOIN da_readychef.meals m ON e.meal_id = m.meal_id
	WHERE e.meal_id is NULL 
LIMIT 100;

SELECT e.event, m.meal_id
FROM da_readychef.events e
	FULL JOIN da_readychef.meals m ON e.meal_id = m.meal_id
	WHERE e.meal_id is NULL 
LIMIT 100;
	