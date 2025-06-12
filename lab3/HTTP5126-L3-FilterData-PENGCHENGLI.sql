-- LAB 3 FILTER DATA
-- Put your answers on the lines after each letter. E.g. your query for question 1A should go on line 6; your query for question 1B should go on line 8...

--  1 
-- A 127.0.0.1/pet_store/employee/		http://localhost/phpmyadmin/index.php?route=/database/sql&db=pet_store

   Showing rows 0 -  0 (1 total, Query took 0.0005 seconds.)

SELECT * FROM employee
WHERE role = 'Manager' OR role = 'Assistant Manager';

110	Maracle	James	123456789	4165551234	Manager	


-- B 127.0.0.1/pet_store/stock_item/		http://localhost/phpmyadmin/index.php?route=/database/sql&db=pet_store

   Showing rows 0 -  2 (3 total, Query took 0.0014 seconds.)

SELECT * FROM stock_item
WHERE category = 'Piscine' AND inventory < 24;

stock_item_id	item	price	inventory	category	
1004	Fish bowl starter kit	46	22	Piscine	
1007	Deluxe Aquarium	12	10	Piscine	
1012	Giant clam aerator	15	12	Piscine	


--  2
-- A 127.0.0.1/pet_store/stock_item/		http://localhost/phpmyadmin/index.php?route=/database/sql&db=pet_store

   Showing rows 0 -  1 (2 total, Query took 0.0022 seconds.)

SELECT item, price FROM stock_item
WHERE item LIKE '%cage';

item	price	
Small cage	20	
Large cage	30	


-- B 127.0.0.1/pet_store/employee/		http://localhost/phpmyadmin/index.php?route=/database/sql&db=pet_store

   Showing rows 0 -  0 (1 total, Query took 0.0003 seconds.)

SELECT last_name FROM employee
WHERE last_name LIKE 'F%';

Fitzpatrick	


--  3
-- A 127.0.0.1/pet_store/stock_item/		http://localhost/phpmyadmin/index.php?route=/database/sql&db=pet_store

   Showing rows 0 -  5 (6 total, Query took 0.0029 seconds.)

SELECT * FROM stock_item
WHERE stock_item_id BETWEEN '1010'AND '1015';

stock_item_id	item	price	inventory	category	
1010	Premium Terrarium	524	2	Murine	
1011	Water dish	10	88	Canine	
1012	Giant clam aerator	15	12	Piscine	
1013	Small cage	20	26	Murine	
1014	Small chew toy	6	123	Canine	
1015	Collar	12	65	Feline	


-- B 127.0.0.1/pet_store/stock_item/		http://localhost/phpmyadmin/index.php?route=/database/sql&db=pet_store

   Showing rows 0 -  3 (4 total, Query took 0.0004 seconds.)

SELECT * FROM stock_item
WHERE category= 'Canine' AND price BETWEEN '10'AND '20';

stock_item_id	item	price	inventory	category	
1002	Super size chew toy	15	45	Canine	
1011	Water dish	10	88	Canine	
1016	Collar	15	87	Canine	
1020	Leash	18	88	Canine	


--  4
-- A 127.0.0.1/pet_store/employee/		http://localhost/phpmyadmin/index.php?route=/database/sql&db=pet_store

   Showing rows 0 -  8 (9 total, Query took 0.0003 seconds.)

SELECT first_name, last_name, phone FROM employee
WHERE role NOT IN ('Manager', 'Assistant Manager');

first_name	last_name	phone	
Henry	Marquis	4165551235	
Jas	Kaur	4165551236	
Hank	Neema	4165551237	
Farud	Said	4165551238	
Henry	Fitzpatrick	4165551239	
Ann	Chovey	2895551230	
Aida	Bugg	4169998888	
Scout	Legge	4168082034	
Ray	Shin	4165232456	


-- B 127.0.0.1/pet_store/stock_item/		http://localhost/phpmyadmin/index.php?route=/database/sql&db=pet_store

   Showing rows 0 -  4 (5 total, Query took 0.0004 seconds.)

SELECT item, price, inventory FROM stock_item
WHERE category NOT IN ('Canine', 'Feline') AND inventory <= 20;

item	price	inventory	
Deluxe Aquarium	12	10	
Premium Terrarium	524	2	
Giant clam aerator	15	12	
Hamster tubes	65	12	
Large cage	30	11	


--  5
-- A 127.0.0.1/pet_store/employee/		http://localhost/phpmyadmin/index.php?route=/database/sql&db=pet_store

   Showing rows 0 -  9 (10 total, Query took 0.0028 seconds.) [last_name: BUGG... - SHIN...]

SELECT first_name, last_name, role, phone FROM employee
ORDER BY last_name ASC;

first_name	last_name   	role	phone	
Aida	Bugg	Stock	4169998888	
Ann	Chovey	Sales	2895551230	
Henry	Fitzpatrick	Stock	4165551239	
Jas	Kaur	Sales	4165551236	
Scout	Legge	Sales	4168082034	
James	Maracle	Manager	4165551234	
Henry	Marquis	Sales	4165551235	
Hank	Neema	Assistant	4165551237	
Farud	Said	Sales	4165551238	
Ray	Shin	Stock	4165232456	


-- B 127.0.0.1/pet_store/stock_item/		http://localhost/phpmyadmin/index.php?route=/database/sql&db=pet_store

   Showing rows 0 -  1 (2 total, Query took 0.0002 seconds.) [price: 231... - 20...]

SELECT stock_item_id, item, price, inventory FROM stock_item
WHERE category = "Murine" AND inventory > 20
ORDER BY price DESC;

stock_item_id	item	price   	inventory	
1008	Terrarium	231	24	
1013	Small cage	20	26	

