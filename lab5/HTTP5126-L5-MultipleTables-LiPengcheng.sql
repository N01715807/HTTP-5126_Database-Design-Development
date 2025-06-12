--  LAB 5 MULTIPLE TABLES

--  Put your answers on the lines after each letter. E.g. your query for question 1A should go on line 5; your query for question 1B should go on line 7...
--  1 
-- A 
SELECT * FROM sale WHERE stock_item_id = 1014;

sale_id	date	stock_item_id	employee_id	
21013	2025-01-12	1014	112	
21020	2025-01-15	1014	111	
21026	2025-01-16	1014	114	
21031	2025-01-17	1014	112	
21035	2025-01-19	1014	112	


-- B 
SELECT sale.date, stock_item.name
FROM sale
JOIN stock_item ON sale.stock_item_id = stock_item.stock_item_id
WHERE stock_item.stock_item_id = 1014;

date	name	
2025-01-12	Small chew toy	
2025-01-15	Small chew toy	
2025-01-16	Small chew toy	
2025-01-17	Small chew toy	
2025-01-19	Small chew toy	


--  2
-- A 
SELECT * FROM sale
WHERE employee_id = 111;

sale_id	date	stock_item_id	employee_id	
21000	2025-01-09	1002	111	
21001	2025-01-09	1003	111	
21002	2025-01-09	1004	111	
21005	2025-01-11	1012	111	
21006	2025-01-11	1002	111	
21010	2025-01-12	1005	111	
21016	2025-01-13	1002	111	
21020	2025-01-15	1014	111	
21024	2025-01-16	1019	111	
21025	2025-01-16	1018	111	
21027	2025-01-16	1010	111	
21033	2025-01-18	1004	111	
21037	2025-01-19	1020	111	
21041	2025-01-20	1008	111	


-- B
SELECT sale.date, employee.first_name, employee.last_name, sale.stock_item_id
FROM sale
JOIN employee ON sale.employee_id = employee.employee_id
WHERE sale.employee_id = 111;

date	first_name	last_name	stock_item_id	
2025-01-09	Henry	Marquis	1002	
2025-01-09	Henry	Marquis	1003	
2025-01-09	Henry	Marquis	1004	
2025-01-11	Henry	Marquis	1012	
2025-01-11	Henry	Marquis	1002	
2025-01-12	Henry	Marquis	1005	
2025-01-13	Henry	Marquis	1002	
2025-01-15	Henry	Marquis	1014	
2025-01-16	Henry	Marquis	1019	
2025-01-16	Henry	Marquis	1018	
2025-01-16	Henry	Marquis	1010	
2025-01-18	Henry	Marquis	1004	
2025-01-19	Henry	Marquis	1020	
2025-01-20	Henry	Marquis	1008	



--  3
-- A
SELECT sale.date, stock_item.name
FROM sale
JOIN stock_item ON sale.stock_item_id = stock_item.stock_item_id
ORDER BY sale.date DESC
LIMIT 5;

date   	name	
2025-01-20	Terrarium	
2025-01-20	Leash	
2025-01-20	Deluxe Aquarium	
2025-01-19	Leash	
2025-01-19	Water dish	


-- B
SELECT employee.first_name, employee.last_name, sale.date,stock_item.name,stock_item.price
FROM sale
JOIN employee ON sale.employee_id = employee.employee_id
JOIN stock_item ON sale.stock_item_id = stock_item.stock_item_id
ORDER BY sale.date DESC
LIMIT 5;

first_name	last_name	date   	name	price	
Henry	Marquis	2025-01-20	Terrarium	231	
Jas	Kaur	2025-01-20	Leash	18	
Farud	Said	2025-01-20	Deluxe Aquarium	12	
Henry	Marquis	2025-01-19	Leash	18	
Jas	Kaur	2025-01-19	Water dish	10	


--  4
-- A
SELECT sale.date, stock_item.name, employee.first_name
FROM sale
JOIN stock_item ON sale.stock_item_id = stock_item.stock_item_id
JOIN employee ON sale.employee_id = employee.employee_id
WHERE sale.date BETWEEN '2025-01-12' AND '2025-01-18'
ORDER BY sale.date ASC;

date   	name	first_name	
2025-01-12	Premium Terrarium	Ann	
2025-01-12	Cat stand	Farud	
2025-01-12	Luxury cat bed	Henry	
2025-01-12	Hamster tubes	Farud	
2025-01-12	Small chew toy	Jas	
2025-01-12	Premium Terrarium	Farud	
2025-01-13	Fish bowl starter kit	Jas	
2025-01-13	Luxury cat bed	Jas	
2025-01-13	Super size chew toy	Henry	
2025-01-14	Large cage	Farud	
2025-01-14	Leash	Jas	
2025-01-14	Leash	Ann	
2025-01-15	Water dish	Farud	
2025-01-15	Cat stand	Jas	
2025-01-15	Fish bowl starter kit	Farud	
2025-01-15	Small chew toy	Henry	
2025-01-16	Large cage	Henry	
2025-01-16	Hamster tubes	Henry	
2025-01-16	Small chew toy	Farud	
2025-01-16	Premium Terrarium	Henry	
2025-01-17	Water dish	Farud	
2025-01-17	Collar	Scout	
2025-01-17	Luxury cat bed	Farud	
2025-01-17	Small chew toy	Jas	
2025-01-18	Leash	Farud	

-- B
SELECT COUNT(*) AS total_sales, employee.first_name,employee.last_name
FROM sale
JOIN stock_item ON sale.stock_item_id = stock_item.stock_item_id
JOIN employee ON sale.employee_id = employee.employee_id
GROUP BY employee.first_name, employee.last_name
ORDER BY total_sales DESC;


total_sales   	first_name	last_name	
14	Henry	Marquis	
13	Farud	Said	
10	Jas	Kaur	
2	Ann	Chovey	
1	Scout	Legge	


--  5
-- A
SELECT sale.date, stock_item.name, stock_item.price, stock_item.category, employee.first_name
FROM sale
JOIN stock_item ON sale.stock_item_id = stock_item.stock_item_id
JOIN employee ON sale.employee_id = employee.employee_id
WHERE sale.employee_id = (
    SELECT employee_id
    FROM sale
    GROUP BY employee_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

date	name	price	category	first_name	
2025-01-10	Water dish	10	Canine	Farud	
2025-01-12	Premium Terrarium	524	Murine	Farud	
2025-01-12	Cat stand	55	Feline	Farud	
2025-01-12	Hamster tubes	65	Murine	Farud	
2025-01-14	Large cage	30	Murine	Farud	
2025-01-15	Water dish	10	Canine	Farud	
2025-01-15	Fish bowl starter kit	46	Piscine	Farud	
2025-01-16	Small chew toy	6	Canine	Farud	
2025-01-17	Water dish	87	Feline	Farud	
2025-01-17	Luxury cat bed	89	Feline	Farud	
2025-01-18	Leash	18	Canine	Farud	
2025-01-18	Just as good dog bed	74	Canine	Farud	
2025-01-20	Deluxe Aquarium	12	Piscine	Farud	

-- B
SELECT sale.stock_item_id, stock_item.name, stock_item.price, stock_item.category,COUNT(sale.sale_id) AS times_sold
FROM sale
JOIN stock_item ON sale.stock_item_id = stock_item.stock_item_id
GROUP BY stock_item_id, stock_item.name, stock_item.price, stock_item.category
ORDER BY sale.stock_item_id;

stock_item_id   	name	price	category	times_sold	
1002	Super size chew toy	15	Canine	3	
1003	Water dish	87	Feline	2	
1004	Fish bowl starter kit	46	Piscine	4	
1005	Luxury cat bed	89	Feline	4	
1006	Just as good dog bed	74	Canine	1	
1007	Deluxe Aquarium	12	Piscine	1	
1008	Terrarium	231	Murine	1	
1009	Cat stand	55	Feline	2	
1010	Premium Terrarium	524	Murine	3	
1011	Water dish	10	Canine	3	
1012	Giant clam aerator	15	Piscine	1	
1014	Small chew toy	6	Canine	5	
1015	Collar	12	Feline	1	
1018	Hamster tubes	65	Murine	2	
1019	Large cage	30	Murine	2	
1020	Leash	18	Canine	5	


--  6
-- A 
-- <Who is the top-selling employee?>

-- B
SELECT employee.first_name, employee.last_name, COUNT(sale.sale_id) AS total_sales
FROM sale
JOIN employee ON sale.employee_id = employee.employee_id
GROUP BY employee.employee_id, employee.first_name, employee.last_name
ORDER BY total_sales DESC
LIMIT 1;

Farud	Said	15	

