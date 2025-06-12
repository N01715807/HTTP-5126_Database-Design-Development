-- LAB 4 AGGREGATE FUNCTIONS
-- Put your answers on the lines after each letter. E.g. your query for question 1A should go on line 6; your query for question 1B should go on line 8...

--  1 
-- A 
SELECT MIN(price) AS lowest_price FROM stock_item;
6	

-- B
SELECT MAX(inventory) AS highest_quantity FROM stock_item;
123	

-- C
SELECT AVG(price) AS average_price FROM stock_item;
71.8500	

-- D
SELECT SUM(inventory) AS total_inventory FROM stock_item;
684	

--  2
-- A
SELECT `role`, COUNT(*) AS employee_count
FROM employee
GROUP BY role;

role	employee_count	
Assistant	1	
Manager	1	
Sales	5	
Stock	3	

-- B
SELECT category AS 'Mammals', COUNT(*) AS item_count
FROM stock_item
WHERE category <> 'piscine'
GROUP BY category;

Mammals	item_count	
Canine	7	
Feline	4	
Murine	5	

-- C
SELECT category, AVG(price) AS average_price FROM stock_item
WHERE inventory > 0
GROUP BY category;

category	average_price	
Canine	33.2857	
Feline	51.3333	
Murine	174.0000	
Piscine	22.7500	

--  3
-- A
SELECT category AS 'Species', SUM(inventory) AS 'In Stock'
FROM stock_item
GROUP BY category
ORDER BY `In Stock` ASC;

Species	In Stock   	
Murine	75	
Piscine	80	
Feline	82	
Canine	447	

-- B
SELECT category, SUM(inventory) AS total_stock, AVG(price) AS avg_price
FROM stock_item
GROUP BY category
HAVING SUM(inventory) < 100 AND AVG(price) < 100;

category	total_stock	avg_price	
Feline	82	60.7500	
Piscine	80	22.7500	


--  4
-- A
SELECT 
  CONCAT(price * inventory, "$") AS 'Potential Earnings',
  item AS 'Product',
  price AS 'Price',
  inventory AS 'Stock Remaining',
  category AS 'Species'
FROM stock_item
ORDER BY (price * inventory) DESC
LIMIT 20;


Potential Earnings	Product	Price	Stock Remaining	Species	
5544$	Terrarium	231	24	Murine	
1584$	Leash	18	88	Canine	
1305$	Collar	15	87	Canine	
1048$	Premium Terrarium	524	2	Murine	
1036$	Just as good dog bed	74	14	Canine	
1012$	Fish bowl starter kit	46	22	Piscine	
957$	Water dish	87	11	Feline	
880$	Water dish	10	88	Canine	
780$	Collar	12	65	Feline	
780$	Hamster tubes	65	12	Murine	
738$	Small chew toy	6	123	Canine	
675$	Super size chew toy	15	45	Canine	
648$	Air pump	18	36	Piscine	
520$	Small cage	20	26	Murine	
330$	Large cage	30	11	Murine	
330$	Cat stand	55	6	Feline	
190$	Luxury dog bed	95	2	Canine	
180$	Giant clam aerator	15	12	Piscine	
120$	Deluxe Aquarium	12	10	Piscine	
0$	Luxury cat bed	89	0	Feline	
