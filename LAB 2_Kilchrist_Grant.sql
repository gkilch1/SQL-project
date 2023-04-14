use classicmodels;
select * from customers;
/* 1.	Report the sales representative number for each customer name.*/
select salesRepEmployeeNumber from customers;
/* 2.	Show the customer’s name and credit limit for those credit limit is greater than 20000. */
select customerName, creditlimit from customers where creditLimit > 2000;
/* 3.	Report the customer’s name, phone number and address who lives in San Francisco. */
select customerName, Phone, AddressLine1 from customers where city ='San Francisco';
/* 4.	Report the order numbers that have not been shipped (hint, <> is the operation for “not equal to.”). */
select orderNumber, status from orders where status <> 'Shipped';
/* 5.	What is the total amount paid by all customers, in total? */
select sum(amount) from payments;
/* 6.	How many orders have been placed by customer number 131? */ 
select count(*) from payments where customerNumber = '131';
/* 7.	Report those payments greater than $100,000 or less than $2,000, ordered by amount from highest to lowest. */
select customerNumber, amount from payments where amount > 100000 or amount < 2000 order by amount desc;
/* 8.	Report those payments greater than $100,000, ordered by customer number. */
select customerNumber, amount from payments where amount > 100000 order by customerNumber;
/* 9.	List all customers containing ‘Network’ in their name. */
select customerName from customers where customerName like '%Network';
/* 10.	List all customers whose data of state is missing. */
select customerName, state from customers where state is NULL;
/* 11.	List the total dollar amount of payments made by each customer number (hint, use “group by”). */
select customerNumber, SUM(amount) from payments group by customerNumber;
/* 12.	Report the number of payments made by each customer (number) (hint: use “group by”). */
select customerNumber, count(amount) as paymentsMade from payments group by customerNumber;




