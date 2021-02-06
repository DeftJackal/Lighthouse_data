-- Q1. Write a query to get Product name and quantity/unit.
SELECT productname, quantityperunit FROM Products;

-- Q2. Write a query to get most expense and least expensive Product list (name and unit price)
SELECT productname, unitprice FROM (SELECT * FROM Products ORDER BY unitprice ASC LIMIT 1) a
UNION
SELECT productname, unitprice FROM (SELECT * FROM Products ORDER BY unitprice DESC LIMIT 1) b

-- Q3. Write a query to count current and discontinued products.
SELECT COUNT(Discontinued) as Discontinued, (SELECT COUNT(Discontinued) as Carried FROM Products WHERE Discontinued = 0) FROM Products WHERE Discontinued = 1

-- Q4. Select all product names and their category names (77 rows)
SELECT products.productname, categories.categoryname FROM products
JOIN categories ON products.categoryid = categories.categoryid

-- Q5. Select all product names, unit price and the supplier region that don't have suppliers from USA region. (26 rows)
SELECT products.productname, products.unitprice, suppliers.region FROM products
JOIN suppliers ON products.SupplierID = suppliers.supplierid
where country != 'USA'


-- Q6. Get the total quantity of orders sold.( 51317)
SELECT SUM(quantity) as Quanity_sold from order_details.

-- Q7. Get the total quantity of orders sold for each order.(830 rows)
SELECT COUNT(orderID) as Number_of_Orders from order_details

Q6 and Q 7 are ambiguous.

-- Q8. Get the number of employees who have been working more than 5 year in the company. (9 rows)
SELECT lastname from employees where hiredate < '2015-01-01'
