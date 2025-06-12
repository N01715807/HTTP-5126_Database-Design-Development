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

-- B


--  3
-- A

-- B


--  4
-- A

-- B


--  5
-- A

-- B


--  6
-- A 
-- B
