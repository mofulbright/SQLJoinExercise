/* joins: select all the computers from the products table:
using the products table and the categories table, 
return the product name and the category name */
 
 SELECT products.Name as "Product Name",
		categories.Name as "Category Name" 
 FROM products								
 LEFT JOIN categories ON categories.CategoryID = products.CategoryID
 WHERE products.CategoryID = 1;
 
 
/* joins: find all product names, product prices, 
and products ratings that have a rating of 5 */
 
 SELECT products.Name, products.Price, reviews.Rating
 FROM products
 LEFT JOIN reviews ON products.ProductID = reviews.ProductID
 WHERE reviews.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  
use the sum() function and group by */

SELECT employees.FirstName, employees.LastName, SUM(sales.Quantity) AS 'Total Sales' FROM sales
INNER JOIN employees ON employees.EmployeeID = sales.EmployeeID
GROUP BY employees.FirstName, employees.LastName
ORDER BY SUM(sales.Quantity) DESC LIMIT 2;

/* joins: find the name of the department, and the name 
of the category for Appliances and Games */

SELECT categories.Name as Category, departments.Name as Department
FROM categories
INNER JOIN departments 
ON categories.DepartmentID = departments.DepartmentID
WHERE categories.CategoryID = 2 OR categories.CategoryID = 8;

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 
SELECT products.Name, SUM(sales.Quantity) AS TotalSold , (sales.PricePerUnit*
(SELECT SUM(sales.Quantity)
FROM sales
WHERE sales.ProductID = 97)) AS TotalPrice
FROM products
INNER JOIN sales ON products.ProductID = sales.ProductID
WHERE products.ProductID = 97;

/* joins: find Product name, reviewer name, rating, 
and comment on the Visio TV. (only return for the lowest rating!) */

SELECT products.Name, 
reviews.Reviewer, 
MIN(reviews.Rating), 
reviews.Comment
FROM products
INNER JOIN reviews ON products.ProductID = reviews.ProductID
WHERE reviews.ProductID = 857;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, 
the employee's first and last name, 
the name of each product, 
how many of that product they sold */

SELECT employees.EmployeeID, 
employees.FirstName, 
employees.LastName, 
products.Name,
sales.Quantity
FROM employees
LEFT JOIN sales ON sales.EmployeeID = employees.EmployeeID
LEFT JOIN products ON products.ProductID = sales.ProductID
ORDER BY EmployeeID;
