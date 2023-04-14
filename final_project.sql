USE gold03_database;

DROP TABLE ConcessionOrders;
DROP TABLE ProductionCompany;
DROP TABLE Actor;
DROP TABLE Customers;
DROP TABLE Job;
DROP TABLE Employees;
DROP TABLE ScreenRoom;
DROP TABLE Movies;

CREATE TABLE Movies(
Title VARCHAR(25) NOT NULL,
ReleaseDate Date,
Director VARCHAR(20),
Length CHAR(3),
Genre VARCHAR(15),
Rating VARCHAR(5),
PRIMARY KEY (Title));

INSERT INTO Movies VALUES ('The Gentlemen', '2020-01-24', 'Guy Ritchie', '113', 'Comedy', 'R');
INSERT INTO Movies VALUES ('Bombshell', '2019-12-20', 'Jay Roach', '109', 'Drama', 'R');
INSERT INTO Movies VALUES ('Ma', '2019-05-31', 'Tate Taylor', '98', 'Thriller', 'R');
INSERT INTO Movies VALUES ('A Dogs Journey', '2019-05-16', 'Gail Mancuso', '108', 'Adventure', 'PG');
INSERT INTO Movies VALUES ('Long Shot', '2019-05-3', 'Jonathan Levine', '124', 'Romance', 'R');
INSERT INTO Movies VALUES ('Parasite', '2019-05-30', 'Cameron Lewis', '132', 'Thriller', 'R');
INSERT INTO Movies VALUES ('Good Boys', '2019-08-14', 'Gene Stupnitsky', '90', 'Adventure', 'R');
INSERT INTO Movies VALUES ('Escape Room', '2019-01-11', 'Adam Robitel', '109', 'Thriller', 'PG13');

CREATE TABLE ScreenRoom(
RoomNo VARCHAR(2) NOT NULL,
Capacity CHAR(3), 
ViewingType CHAR(2),
SeatType VARCHAR(10),
Title VARCHAR(25) NOT NULL,
PRIMARY KEY (RoomNo),
Foreign Key (Title) References Movies(Title));

INSERT INTO ScreenRoom VALUES ('1','150','2D','Recline','The Gentlemen');
INSERT INTO ScreenRoom VALUES ('2','150','2D','Recline','Ma');
INSERT INTO ScreenRoom VALUES ('3','150','2D','Recline','Bombshell');
INSERT INTO ScreenRoom VALUES ('4','100','3D','Recline','Good Boys');
INSERT INTO ScreenRoom VALUES ('5','100','3D','Recline','Ma');
INSERT INTO ScreenRoom VALUES ('6','100','3D','Recline','Bombshell');
INSERT INTO ScreenRoom VALUES ('7','200','2D','Upright','A Dogs Journey');
INSERT INTO ScreenRoom VALUES ('8','200','2D','Upright','Long Shot');
INSERT INTO ScreenRoom VALUES ('9','200','2D','Upright','Parasite');
INSERT INTO ScreenRoom VALUES ('10','200','2D','Upright','Escape Room');


CREATE TABLE Employees (
EmployeeNo CHAR(4) NOT NULL,
FirstName VARCHAR(10),
LastName VARCHAR(10),
DOB DATE,
Gender VARCHAR(6),
JobID VARCHAR(3),
RoomNo VARCHAR(2),
PRIMARY KEY (EmployeeNo),
FOREIGN KEY (RoomNo) REFERENCES ScreenRoom(RoomNo));

INSERT INTO Employees VALUES ('1','Alex','Ogea','1975-08-30','Male','10','7');
INSERT INTO Employees VALUES ('15','Nico','Andrews','1990-02-28','Male','9','6');
INSERT INTO Employees VALUES ('20','Mea','Ashby','1980-03-17','Female','8','3');
INSERT INTO Employees VALUES ('33','Ethan','Beene','1981-04-22','Male','7','2');
INSERT INTO Employees VALUES ('44','Jack','Burns','1991-01-18','Male','6','9');
INSERT INTO Employees VALUES ('47','Emily','Trahan','1984-10-30','Female','5','10');
INSERT INTO Employees VALUES ('52','Drake','Graham','1998-11-23','Male','4','8');
INSERT INTO Employees VALUES ('16','Sophie','Heath','1994-12-31','Female','3','1');
INSERT INTO Employees VALUES ('3','Lillian','Morris','1978-09-13','Female','2','4');
INSERT INTO Employees VALUES ('9','Henry','Lott','1972-06-18','Male','1','5');
INSERT INTO Employees VALUES ('39','Jake','Jackson','1995-05-02','Male','10','7');
INSERT INTO Employees VALUES ('22','Mary','Kate','1965-09-12','Female','9','6');
INSERT INTO Employees VALUES ('17','Graham','Knight','1978-07-19','Male','8','3');
INSERT INTO Employees VALUES ('19','Mary','Allen','1960-09-18','Female','7','2');


CREATE TABLE Job (
JobID VARCHAR (3) NOT NULL,
ShiftDescription VARCHAR(20),
ClockInTime VARCHAR(5),
ClockOutTime VARCHAR(5),
Wage VARCHAR(10),
EmployeeNo CHAR(4) NOT NULL,
PRIMARY KEY (JobID),
foreign key(EmployeeNo) references Employees(EmployeeNo));

INSERT INTO Job VALUES ('1','Waiter','900','1500','14.25','1');
INSERT INTO Job VALUES ('2','Waiter','1300','2000','7.25','15');
INSERT INTO Job VALUES ('3','Waiter','1700','2400','7.25','20');
INSERT INTO Job VALUES ('4','Kitchen','900','1700','20.00','33');
INSERT INTO Job VALUES ('5','Kitchen','900','1700','10.00','44');
INSERT INTO Job VALUES ('6','Kitchen','1500','2400','10.00','47');
INSERT INTO Job VALUES ('7','Kitchen','1500','2400','10.00','52');
INSERT INTO Job VALUES ('8','TicketOffice','900','1700','10.25','16');
INSERT INTO Job VALUES ('9','TicketOffice','1500','2400','7.25','3');
INSERT INTO Job VALUES ('10','Janitor','900','1700','12.00','9');
INSERT INTO Job VALUES ('11','Janitor','1500','2400','8.00','39');
INSERT INTO Job VALUES ('12','Concessions','900','1500','13.25','22');
INSERT INTO Job VALUES ('13','Concessions','1300','2000','8.25','17');
INSERT INTO Job VALUES ('14','Concessions','1700','2400','7.25','19');


CREATE TABLE Customers(
ReceiptNo CHAR(13) NOT NULL,
FirstName VARCHAR(15),
LastName VARCHAR (15),
DOB DATE,
Gender VARCHAR(6),
Title VARCHAR(25) NOT NULL,
RoomNo VARCHAR(2) NOT NULL,
PRIMARY KEY (ReceiptNo),
Foreign Key(Title) references Movies(Title),
Foreign Key(RoomNo) references ScreenRoom(RoomNo));

INSERT INTO Customers VALUES ('TMT1901012345','Charlie','Brown','1978-01-19','Male','The Gentlemen','1');
INSERT INTO Customers VALUES ('TMT1902013567','Mitchell','Ratcliff','1998-09-22','Male','Bombshell','3');
INSERT INTO Customers VALUES ('TMT1910515678','Rebecca','Mays','1998-08-23','Female','Ma','5');
INSERT INTO Customers VALUES ('TMT1913948923','Austin','Means','1964-08-02','Male','A Dogs Journey','7');
INSERT INTO Customers VALUES ('TMT1917890245','Stacey','Morgan','1977-03-14','Female','Long Shot','8');
INSERT INTO Customers VALUES ('TMT1919809543','Madeline','Thomas','1988-10-11','Female','Parasite','9');
INSERT INTO Customers VALUES ('TMT1923000056','Mignon','Huckaby','1990-11-08','Female','Good Boys','4');
INSERT INTO Customers VALUES ('TMT1928986000','Tony','Dorsey','1993-12-05','Male','Escape Room','10');
INSERT INTO Customers VALUES ('TMT1933486789','Tom','Hanks','1960-12-04','Male','Bombshell','6');
INSERT INTO Customers VALUES ('TMT1935598078','Jackson','Smith','1955-10-01','Male','Parasite','9');
INSERT INTO Customers VALUES ('TMT1922290786','Nick','Bryan','1969-03-09','Male','Long Shot','8');
INSERT INTO Customers VALUES ('TMT1923509678','Theresa','Rinderle','1964-05-03','Female','Ma','2');
INSERT INTO Customers VALUES ('TMT1900189445','Tim','Stansell','1978-05-04','Male','The Gentlemen','1');
INSERT INTO Customers VALUES ('TMT1900200005','ALexis','Pippin','1992-06-09','Female','Ma','5');
INSERT INTO Customers VALUES ('TMT1930011114','Martha','Town','1990-07-10','Female','Good Boys','4');

CREATE TABLE Actor(
ActorID VARCHAR(5) NOT NULL,
FirstName VARCHAR(15),
LastName VARCHAR(15),
Gender VARCHAR(6),
DOB Date,
Title VARCHAR(25) NOT NULL,
PRIMARY KEY (ActorID),
Foreign key(Title) references Movies(Title));

INSERT INTO Actor VALUES ('01','Matthew','McConaughey','Male','1969-11-4','The Gentlemen');
INSERT INTO Actor VALUES ('02','Michelle','Dockery','Female','1981-12-15','The Gentlemen');
INSERT INTO Actor VALUES ('03','Margot','Robbie','Female','1990-07-2','Bombshell');
INSERT INTO Actor VALUES ('04','John','Lithgow','Male','1945-10-19','Bombshell');
INSERT INTO Actor VALUES ('05','Octavia','Spencer','Male','1970-05-25','Ma');
INSERT INTO Actor VALUES ('06','Luke','Evans','Male','1979-04-15','Ma');
INSERT INTO Actor VALUES ('07','Jimmy','Lewis','Male','1988-08-12','A Dogs Journey');
INSERT INTO Actor VALUES ('08','Lauren','Smith','Female','1979-07-17','A Dogs Journey');
INSERT INTO Actor VALUES ('09','Margot','Robbie','Female','1990-07-2','Long Shot');
INSERT INTO Actor VALUES ('10','Seth','Rogen','Male','1976-08-12','Long Shot');
INSERT INTO Actor VALUES ('11','Matthew','McConaughey','Male','1969-11-4','Parasite');
INSERT INTO Actor VALUES ('12','Michelle','Dockery','Female','1981-12-15','Parasite');
INSERT INTO Actor VALUES ('13','Evan','Lawrence','Male','1966-08-15','Good Boys');
INSERT INTO Actor VALUES ('14','Sophia','Hamilton','Female','1980-01-26','Good Boys');
INSERT INTO Actor VALUES ('15','Steven','Adams','Male','1982-07-17','Escape Room');
INSERT INTO Actor VALUES ('16','Sarah','Williams','Female','1975-05-11','Escape Room');

CREATE TABLE ProductionCompany(
ProductionID VARCHAR (3) NOT NULL,
CompanyName VARCHAR(15),
YearsInBusiness VARCHAR(3),
CEO VARCHAR(20),
Title VARCHAR(25) NOT NULL,
PRIMARY KEY (ProductionID),
Foreign key(Title) references Movies(Title));

INSERT INTO ProductionCompany VALUES ('01','Miramax','41','Bill Block','The Gentlemen');
INSERT INTO ProductionCompany VALUES ('02','Lionsgate','23','Jon Feltheimer','Bombshell');
INSERT INTO ProductionCompany VALUES ('03','Blumhouse','20','Jason Blum','Ma');
INSERT INTO ProductionCompany VALUES ('04','Amblin','39','Steven Spielberg','A Dogs Journey');
INSERT INTO ProductionCompany VALUES ('05','Summit','29','Bob Heyward','Long Shot');
INSERT INTO ProductionCompany VALUES ('06','Barunson','15','Jim Smith','Parasite');
INSERT INTO ProductionCompany VALUES ('07','Lionsgate','23','Jon Feltheimer','Good Boys');
INSERT INTO ProductionCompany VALUES ('08','Columbia','96','Tom Berry','Escape Room');

CREATE TABLE ConcessionOrders(
OrderNo VARCHAR(5) NOT NULL,
DrinkType VARCHAR(10) NULL ,
FoodType VARCHAR(15) NULL ,
ReceiptNo CHAR(13) NOT NULL,
PRIMARY KEY(OrderNo),
foreign key(ReceiptNo) references Customers(ReceiptNo));

INSERT INTO ConcessionOrders VALUES ('12','Coke','Burger','TMT1901012345');
INSERT INTO ConcessionOrders VALUES ('78','Coke','Popcorn','TMT1902013567');
INSERT INTO ConcessionOrders VALUES ('63','Water',NULL,'TMT1910515678');
INSERT INTO ConcessionOrders VALUES ('45','DR. Pepper', 'Candy','TMT1913948923');
INSERT INTO ConcessionOrders VALUES ('1',NULL,NULL,'TMT1917890245');
INSERT INTO ConcessionOrders VALUES ('187','Water','Popcorn','TMT1919809543');
INSERT INTO ConcessionOrders VALUES ('210','Water','Burger','TMT1923000056');
INSERT INTO ConcessionOrders VALUES ('13','Milkshake',NULL,'TMT1928986000');
INSERT INTO ConcessionOrders VALUES ('152','DR. Pepper','French Fries','TMT1933486789');
INSERT INTO ConcessionOrders VALUES ('333','Milkshake','Cookie','TMT1935598078');
INSERT INTO ConcessionOrders VALUES ('197','Root Beer','Nachos','TMT1922290786');
INSERT INTO ConcessionOrders VALUES ('99','Water','Candy','TMT1923509678');
INSERT INTO ConcessionOrders VALUES ('278','Water','Candy','TMT1900189445');
INSERT INTO ConcessionOrders VALUES ('265','Water',NULL,'TMT1900200005');
INSERT INTO ConcessionOrders VALUES ('301','Coke','Candy','TMT1930011114');

COMMIT;

#1.How many drink types are there in concession?
SELECT count(distinct DrinkType) 
AS DrinkTypes
FROM concessionorders;

#2.How many customers are in each Screening Room?
SELECT RoomNo, count(ReceiptNo) 
AS TotalCustomers 
FROM customers
GROUP BY RoomNo;

#3. What are the names of the actor(s) that played in the movie Ma?
SELECT FirstName, LastName
FROM actor 
WHERE Title = 'Ma';

#4. What OrderNo from the concession included Popcorn?
SELECT OrderNo, FoodType
FROM concessionorders
WHERE FoodType = 'Popcorn';

#5. Who is the Ceo of Amblin?
SELECT CEO
FROM productioncompany
Where CompanyName = 'Amblin';

#6. How many Screen Rooms have recliners as the seat type?
SELECT count(SeatType)
AS NumberOfScreenRoomsWithRecliners
FROM screenroom
WHERE SeatType ='Recline';

#7. What is the shift times and shift description of jobs with wages higher than 7.25? 
SELECT ShiftDescription, ClockInTime, ClockOutTime, Wage
FROM job
WHERE Wage > 7.25;

#8. What was the release date for the movie Parasite?
SELECT ReleaseDate
FROM movies
WHERE Title = 'Parasite';

#9. What is the Date of birth of the oldest employee at Movie Tavern?
SELECT min(DOB) 
AS Dateofbirth
FROM employees;

#10. What employees first name start with M?
SELECT Firstname
FROM employees
WHERE Firstname 
LIKE 'M%';

#11. Which of the placed orders did not include a food item?  (IS NULL)
SELECT OrderNo
FROM ConcessionOrders
WHERE FoodType 
IS NULL;

#12 List the EmployeeNo's of any Waiter or Kitchen employee with a wage higher than the average of all employees. (Aggregate, Subquery,IN)
SELECT EmployeeNo 
FROM job
WHERE wage >(SELECT AVG(wage) FROM job)
AND ShiftDescription IN ('Waiter', 'Kitchen');

#13. What employees at Movie Tavern are male?
SELECT e.FirstName, e.LastName, c.Gender
FROM employees e, customers c
WHERE e.RoomNo = c.RoomNo
and c.gender = e.gender
and e.gender = 'Male'
order by e.FirstName;

