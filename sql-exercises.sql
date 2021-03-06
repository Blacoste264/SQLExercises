/* Question 1 */
/* Return all category names with their descriptions from the Categories table. */

SELECT CategoryName, Description FROM Categories

/* Question 2 */
/*Return the contact name, customer id, and company name of all Customers in London*/

SELECT City, ContactName, CustomerID, CompanyName FROM Customers WHERE City = 'London'

/* Question 3 */
/* Return all available columns in the Suppliers tables for the marketing managers and sales representatives that have a FAX number */

SELECT * FROM Suppliers WHERE Fax IS NOT NULL

/* Question 4 */
/* Return a list of customer id's from the Orders table with required dates between Jan 1, 1997 and Jan 1, 1998 and with freight under 100 units. */

SELECT CustomerID FROM Orders WHERE Freight < 100 AND RequiredDate BETWEEN '1997-01-01' AND '1998-01-01'

/* Question 5 */
/* Return a list of company names and contact names of all the Owners from the Customer table from Mexico, Sweden and Germany. */

SELECT City, CompanyName, ContactName FROM Customers WHERE ContactTitle = 'Owner' AND Country IN ('Mexico', 'Sweden', 'Germany')

/* Question 6 */
/* Return a count of the number of discontinued products in the Products table. */

SELECT COUNT (Discontinued) FROM Products WHERE Discontinued = 1

/* Question 7 */
/* Return a list of category names and descriptions of all categories beginning with 'Co' from the Categories table. */

SELECT CategoryName, Description FROM Categories WHERE CategoryName LIKE '%co%'

/* Question 8 */
/* Return all the company names, city, country and postal code from the Suppliers table with the word 'rue' in their address. The list should ordered alphabetically by company name.*/

SELECT CompanyName, City, Country, PostalCode FROM Suppliers WHERE Address LIKE '%rue%' ORDER BY CompanyName ASC 

/* Question 9 */
/* Return the product id and the total quantities ordered for each product id in the Order Details table. */

SELECT ProductID, Quantity FROM [Order Details] 

/* Question 10 */
/* Return the customer name and customer address of all customers with orders that shipped using Speedy Express. */

SELECT c.CompanyName, c.Address FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID WHERE ShipVia = 1

/* Question 11 */
/* Return a list of Suppliers that have regions. The list should contain company name, contact name, contact title and region. */

SELECT CompanyName, ContactName, ContactTitle, Region FROM Suppliers WHERE Region IS NOT NULL

/* Question 12 */
/* Return all product names from the Products table that are condiments */

SELECT p.ProductName FROM Products p INNER JOIN Categories c ON c.CategoryID = p.CategoryID WHERE p.CategoryID = 2

/* Question 13 */
/* Return a list of customer names who have no orders in the Orders table. */

SELECT c.CompanyName, c.CustomerID FROM Customers c WHERE c.CustomerID NOT IN (SELECT o.CustomerID FROM Orders o)

/* Question 14 */
/* Add a shipper named 'Amazon' to the Shippers table using SQL. */

INSERT INTO Shippers (CompanyName) VALUES ('Amazon')

/* Question 15 */
/* Change the company name from 'Amazon' to 'Amazon Prime Shipping' in the Shippers table using SQL. */

UPDATE Shippers SET CompanyName = 'Amazon Prime Shipping' WHERE CompanyName = 'Amazon'

/* Question 16 */
/* Return a complete list of company names from the Shippers table. Include freight totals rounded to the nearest whole number for each shipper from the Orders table for those shippers with orders. */

SELECT CompanyName, AVG(Freight) as 'Average Freight Weight' FROM Shippers LEFT JOIN Orders ON Orders.ShipVia=Shippers.ShipperID group by CompanyName

/* Question 17 */
/* Return all employee first and last names from the Employees table by combining the 2 columns aliased as 'DisplayName'. The combined format should be 'LastName, FirstName'. */

SELECT LastName + ', ' + FirstName AS 'DisplayName' FROM Employees

/* Question 18 */
/* This one was hard! */
/* Add yourself to the Customers table with an order for 'Grandma's Boysenberry Spread'. */

INSERT INTO Customers (CustomerID, CompanyName, ContactName) 
VALUES ('92119', 'Brittany INC', 'Brittany LaCoste');
INSERT INTO [Orders] ([CustomerID])
VALUES ('92119');
INSERT INTO [Order Details](OrderID, ProductID)
VALUES(11078, 6);

/* Question 19 */
/* Remove yourself and your order from the database. */

DELETE FROM Customers WHERE CustomerID = '92119' 
DELETE FROM [Order Details] WHERE OrderID = '11078'
DELETE FROM Orders WHERE OrderID = '11078'

/* Question 19 */
/* Return a list of products from the Products table along with the total units in stock for each product. Include only products with TotalUnits greater than 100. */

SELECT ProductName, UnitsInStock FROM Products WHERE UnitsInStock > 100




























