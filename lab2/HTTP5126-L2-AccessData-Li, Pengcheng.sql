--  LAB 2 ACCESSING DATA PART 1
--  Put your answers on the lines after each letter. E.g. your query for question 1A should go on line 6; your query for question 1B should go on line 8...

--  1 
-- A Write a query that returns all data from the employee table. (2 marks) 
SELECT * FROM employee;
-- B Write a query that returns all data from the stock_item table. (2 marks)
SELECT * FROM stock_item;

--  2
-- A The assistant manager needs a product list with prices. Write a query that selects only the item and price columns from stock_item. (2 marks)
SELECT item, price FROM stock_item;
-- B The manager wants a staff contact list. Write a query to return the first_name, last_name, role, and phone_number of all employees. (2 marks)
SELECT first_name,last_name,role,phone FROM employee

--  3
-- A For stock balance reporting, provide a list with custom headings:
item as "Product"
category as "Animal"(2 marks)

SELECT item AS "Product", category AS "Animal" FROM stock_item;

-- B For tax reporting, provide:
last_name as "Pet Store Staff"
employee_id as "Emp. ID"
SIN as "SIN" (2 marks)

SELECT last_name AS "Pet Store Staff", employee_id AS "Emp. ID", SIN AS "SIN" FROM employee;

--  4 
-- A The manager needs contact info for Sales staff. Write a query to return the first_name and phone_number of employees with the role “Sales”. (2 marks)
SELECT first_name, phone FROM employee
WHERE role = "Sales";

-- B Identify stock items that need to be reordered. Return the item, id, and current_inventory for all stock items with 12 or fewer in stock. (2 marks)
SELECT  item,inventory FROM stock_item
WHERE inventory <= "12";

--  5
-- A "What Kitty Cat items do you sell and how much are they?"
Return a list of item values with a heading "Kitty Cat" and include their prices. (2 marks)

SELECT item AS "Feline", price FROM stock_item
WHERE category = "Feline";

-- B "What Staff Member is ID #115?"
Output should be 1 row, 1 column, combining the first_name and last_name into a single result labeled "Staff Member". (2 marks)

SELECT CONCAT(first_name," ", last_name) AS "Staff Member" FROM employee
WHERE employee_id = "115";