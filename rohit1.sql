use app_store;

show databases;
create database app_store;
use app_store;

create table SalesPeople (
Snum INT PRIMARY KEY AUTO_INCREMENT,
	Sname  VARCHAR(100),
	city VARCHAR(100),
	comm int(10),
    constraint SalesPeople_unique unique(Sname)
);

CREATE TABLE Customers
(
	Cnum INT PRIMARY KEY AUTO_INCREMENT,
	Cname VARCHAR(50),
	City VARCHAR(50),
	Snum INT,
    FOREIGN KEY(Snum) REFERENCES SalesPeople(Snum)
);

CREATE TABLE Orders
(
	Onum INT PRIMARY KEY ,
	Amt  DECIMAL(8,2),
    Odate DATE ,
	Cnum INT,
    FOREIGN KEY(Cnum) REFERENCES Customers(Cnum),
    Snum INT,
    FOREIGN KEY(Snum) REFERENCES SalesPeople(Snum)
);

SELECT * FROM SalesPeople;
SELECT * FROM Customers;
SELECT * FROM Orders;

insert into SalesPeople (Snum ,Sname, City, Comm)
values (1001 ,"Peel","London", 12),
       (1002  ,"Serres", "Sanjose", 13),
       (1004 ,"Motika", "London", 11),
       (1007 ,"Rifkin", "Barcelona", 15),
       (1003 ,"Axelrod", "Newyork", 10);
       
insert into Customers (Cnum ,Cname ,City ,Snum)
values (2001 ,"Hoffman","London",1001),
        (2002 ,"Giovanni","Rome",1003),
        (2003 ,"Liu","Sanjose",1002),
        (2004 ,"Grass","Berlin",1002),
        (2006 ,"Clemens","London",1001),
        (2008 ,"Cisneros","Sanjose",1007),
         (2007,"Pereira","Rome",1004);   
         
insert into Orders (Onum,Amt,Odate,Cnum,Snum)         
values  (3001,18.69,"1990-10-03",2008,1007),
        (3003,767.19,"1990-10-03",2001,1001),
        (3002,1900.10,"1990-10-03",2007,1004),
        (3005,5160.45,"1990-10-03",2003,1002),
        (3006,1098.16,"1990-10-03",2008,1007),
        (3009,1713.23,"1990-10-04",2002,1003),
        (3007,75.75,"1990-10-04",2004,1002),
        (3008,4273.00,"1990-10-05",2006,1001),
        (3010,1309.95,"1990-10-06",2004,1002),
        (3011,9891.88,"1990-10-06",2006,1001);
	
SELECT * FROM SalesPeople;
SELECT * FROM Customers;
SELECT * FROM Orders;
    
    
    
    
    
 # Count the number of Salesperson whose name begin with ‘a’/’A’.
SELECT Sname, COUNT(*) 
FROM salespeople
WHERE Sname LIKE ('A%')
GROUP BY Sname;

 #Display all the Salesperson whose all orders worth is more than Rs. 2000.
SELECT orders.snum,orders.amt, salespeople.sname 
FROM orders INNER JOIN salespeople ON orders.snum=salespeople.snum 
WHERE orders.amt>2000;

       
# Count the number of Salesperson belonging to Newyork.
 
 SELECT sname, count(*)
FROM salespeople
WHERE city= "Newyork";

 #Display the number of Salespeople belonging to London and belonging to Paris

SELECT Sname, COUNT(*) 
FROM salespeople
WHERE city= ("London")
GROUP BY Sname;


SELECT sname 
FROM salespeople
WHERE city= ("London" and "Paris");



#Display the number of orders taken by each Salesperson and their date of orders 

       
SELECT  Sname,Odate,COUNT(*) 
FROM salespeople,orders
WHERE salespeople.Snum = orders.Snum 
GROUP BY Sname,Odate;




