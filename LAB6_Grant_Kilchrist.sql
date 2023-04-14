use classicmodels;

/*1.	List names of products sold by order date, earliest first.*/
SELECT p.productName, o.orderDate 
FROM Products p, Orders o, OrderDetails d 
WHERE p.productCode = d.productCode
AND o.orderNumber = d.orderNumber
ORDER BY o.orderDate ASC;

/*2.	List all the order dates in descending order for orders for the ‘1940 Ford Pickup Truck’.*/
SELECT o.orderDate
FROM Products p, Orders o, OrderDetails d
WHERE p.ProductCode = d.ProductCode AND o.orderNumber= d.orderNumber
AND p.productName = '1940 Ford Pickup Truck'
ORDER BY o.orderDate DESC;

/*3.	Which shipped orders have a value greater than $5,000?*/
SELECT d.orderNumber, SUM(d.quantityOrdered * d.priceEach) AS Total
FROM orders o, OrderDetails d
WHERE d.orderNumber = o.orderNumber AND o.status = 'Shipped'
GROUP BY d.orderNumber
HAVING Total > 5000;

/*4.	List the names of products sold at less than 85% of the MSRP (MSRP*0.85) for shipped orders.*/
SELECT p.productName, d.priceEach, p.MSRP
FROM products p, orders o, OrderDetails d
WHERE d.productCode = p.productCode AND o.orderNumber = d.orderNumber AND o.status = 'Shipped'
AND d.priceEach < (.85 * p.MSRP);

/*5.	Report products and their buy prices that have been sold with a markup of 100% or more (i.e., where the priceEach is at least twice the buyPrice)*/
SELECT p.productName, p.buyPrice, d.priceEach
FROM Products p, OrderDetails d
WHERE p.productCode = d.productCode
AND d.priceEach >= (p.buyPrice * 2);

/*6. Create tables and insert data for DreamHome Property Agency Company with script create_dreamhomerental_db.sql in Workbench. Please create a view to list property owners who have a house for rent. */
/*CREATE VIEW houseOwner AS
SELECT fname, lname
FROM PrivateOwner p, PropertyForRent r
WHERE p.ownerNo = r.ownerNo
AND r.type = 'House'; */

