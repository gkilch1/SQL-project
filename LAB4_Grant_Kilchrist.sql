USE text;    #Use database text.
SELECT * FROM person;   /*pay close attention to the format of the column names! How do these differ from what we’ve used so far in our queries?*/ 
SELECT * FROM car;

# 1.	(1pt) How many different types of cars are in the car table?
Select count(distinct cartype)
From car;
# 2.	(1pt) What is the average cost of each type of car in the table? 
select distinct cartype, avg(carcost)
from car
group by cartype;
# 3.	(1pt) What is the highest sale price of each type of car in the table?
Select cartype, max(carsell)
from car
group by cartype;
# 4.	(1pt) What is the total gross profit of each type of car in the table? (HINT: gross profit = sell – cost)
Select cartype, sum(carsell -carcost) as grossProfit
from car
group by cartype;
# 5.	(1pt) List the cost and carid of all cars that cost LESS THAN the average cost of all cars. (HINT: use a nested query). 
select carid, carcost
from car
where carcost < (select avg(carcost)
from car);
# 6.	(1pt) List all details of car sales, including salesperson’s name and the gross profit (selling price minus cost price). (Hint: What special consideration do you have to deal with in this example? Specifically, how to handle column name with space?).
select *, p.`person first`, p.`person last`, (c.carsell - c.carcost) as grossProfit
from car c, person p
where c.personid = p.personid;
# 7.	(1pt) How many cars were sold by Sheila O'Hara? (Hint: how do you handle a column name with space?)
select count(carid), p.`person first`, p.`person last`
from car c, person p
where p.`person first` = "Sheila"
and p.`person last` = "O\'Harra";
# 8.	(1pt) List details of the sales made by Bruce Bush.
select *
from car c, person p
where c.personid = p.personid
and p.`person first` = "Bruce"
and p.`person last` = "Bush";
# 9.	(1pt) What is the average selling price of cars and number of cars sold by Sue Lim?
select avg(carsell), count(*)
from car c, person p
where c.personid = p.personid
and `person first` = "Sue"
and `person last` = "Lim";
# 10.	(1pt) Report the gross profit made, number of cars sold, first name and last name by each salesperson.
select count(*), sum(c.carsell - c.carcost) as grossProfit, p.`person first`, p.`person last`
from car c, person p
where c.personid = p.personid
group by p.`person first`;
# 11.	(2pts) Write data definition (SQL) for the following ER model.
use gkilch1_database;
create table department (
	DepNO integer(10) NOT NULL,
    DepName VARCHAR(25),
    Address VARCHAR(30),
    City VARCHAR(20),
    Zipcode integer(6),
    primary key (DepNO));
    
Create table projects (
	ProjNO integer(10) NOT NULL,
    startDate VARCHAR(10),
    endDate VARCHAR(10),
    _Desc VARCHAR(30),
    PRIMARY KEY (ProjNO),
    FOREIGN KEY (DepNO)
    References department(DepNO));
    
    
    