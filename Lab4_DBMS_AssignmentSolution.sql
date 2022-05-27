-- -----------------------------------------------------
-- 1) Create Schema ecommercedb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ecommercedb` ;
USE `ecommercedb` ;

-- -----------------------------------------------------
-- Table `ecommercedb`.`supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommercedb`.`supplier` (
  `SUPP_ID` INT NOT NULL  PRIMARY KEY,
  `SUPP_NAME` VARCHAR(50) NOT NULL,
  `SUPP_CITY` VARCHAR(50) NOT NULL,
  `SUPP_PHONE` VARCHAR(50) NOT NULL);


-- -----------------------------------------------------
-- Table `ecommercedb`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommercedb`.`customer` (
  `CUS_ID` INT NOT NULL PRIMARY KEY,
  `CUS_NAME` VARCHAR(20) NOT NULL,
  `CUS_PHONE` VARCHAR(10) NOT NULL,
  `CUS_CITY` VARCHAR(30) NOT NULL,
  `CUS_GENDER` CHAR );


-- -----------------------------------------------------
-- Table `ecommercedb`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommercedb`.`category` (
  `CAT_ID` INT NOT NULL PRIMARY KEY,
  `CAT_NAME` VARCHAR(20) NOT NULL);


-- -----------------------------------------------------
-- Table `ecommercedb`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommercedb`.`product` (
  `PRO_ID` INT NOT NULL PRIMARY KEY,
  `PRO_NAME` VARCHAR(20) NOT NULL DEFAULT 'Dummy',
  `PRO_DESC` VARCHAR(60) ,
  `CAT_ID` INT ,
	FOREIGN KEY (`CAT_ID`)
    REFERENCES `ecommercedb`.`category` (`CAT_ID`));


-- -----------------------------------------------------
-- Table `ecommercedb`.`supplier_pricing`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommercedb`.`supplier_pricing` (
  `PRICING_ID` INT NOT NULL PRIMARY KEY,
  `PRO_ID` INT ,
  `SUPP_ID` INT ,
  `SUPP_PRICE` INT DEFAULT 0,
	FOREIGN KEY (`PRO_ID`)
    REFERENCES `ecommercedb`.`product` (`PRO_ID`),
    FOREIGN KEY (`SUPP_ID`)
	REFERENCES `ecommercedb`.`supplier` (`SUPP_ID`));


-- -----------------------------------------------------
-- Table `ecommercedb`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommercedb`.`order` (
  `ORD_ID` INT NOT NULL  PRIMARY KEY ,
  `ORD_AMOUNT` INT NOT NULL,
  `ORD_DATE` DATE NOT NULL,
  `CUS_ID` INT ,
  `PRICING_ID` INT ,
	FOREIGN KEY (`CUS_ID`)
    REFERENCES `ecommercedb`.`customer` (`CUS_ID`),
    FOREIGN KEY (`PRICING_ID`)
    REFERENCES `ecommercedb`.`supplier_pricing` (`PRICING_ID`));


-- -----------------------------------------------------
-- Table `ecommercedb`.`rating`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommercedb`.`rating` (
  `RAT_ID` INT NOT NULL  PRIMARY KEY ,
  `ORD_ID` INT ,
  `RAT_RATSTARS` INT NOT NULL,
    FOREIGN KEY (`ORD_ID`)
    REFERENCES `ecommercedb`.`order` (`ORD_ID`));
    
-- -----------------------------------------------------
-- 2) Insert Data Into `ecommercedb`.`supplier` Table
-- -----------------------------------------------------
INSERT INTO `ecommercedb`.`supplier` 
(SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE)
VALUES 
(1,'Rajesh Retails','Delhi','1234567890'),
(2,'Appario Ltd.','Mumbai','2589631470'),
(3,'Knome products','Banglore','9785462315'),
(4,'Bansal Retails','Kochi','8975463285'),
(5,'Mittal Ltd.','Lucknow','7898456532');

-- -----------------------------------------------------
-- Insert Data Into `ecommercedb`.`customer` Table
-- -----------------------------------------------------
INSERT INTO `ecommercedb`.`customer` 
(CUS_ID,CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER)
VALUES 
(1,'AAKASH','9999999999','DELHI','M'),
(2,'AMAN','9785463215','NOIDA','M'),
(3,'NEHA','9999999999','MUMBAI','F'),
(4,'MEGHA','9994562399','KOLKATA','F'),
(5,'PULKIT','7895999999','LUCKNOW','M');

-- -----------------------------------------------------
-- Insert Data Into `ecommercedb`.`category` Table
-- -----------------------------------------------------
INSERT INTO `ecommercedb`.`category` 
(CAT_ID,CAT_NAME)
VALUES 
(1,'BOOKS'),
(2,'GAMES'),
(3,'GROCERIES'),
(4,'ELECTRONICS'),
(5,'CLOTHES');

-- -----------------------------------------------------
-- Insert Data Into `ecommercedb`.`product` Table
-- -----------------------------------------------------
INSERT INTO `ecommercedb`.`product` 
(PRO_ID,PRO_NAME,PRO_DESC,CAT_ID)
VALUES 
(1,'GTA V','Windows 7 and above with i5 processor and 8GB RAM',2),
(2,'TSHIRT','SIZE-L with Black, Blue and White variations',5),
(3,'ROG LAPTOP','Windows 10 with 15inch screen, i7 processor, 1TB SSD',4),
(4,'OATS','Highly Nutritious from Nestle',3),
(5,'HARRY POTTER','Best Collection of all time by J.K Rowling',1),
(6,'MILK','1L Toned MIlk',3),
(7,'Boat Earphones','1.5Meter long Dolby Atmos',4),
(8,'Jeans','Stretchable Denim Jeans with various sizes and color',5),
(9,'Project IGI','compatible with windows 7 and above',2),
(10,'Hoodie','Black GUCCI for 13 yrs and above',5),
(11,'Rich Dad Poor Dad','Written by RObert Kiyosaki',1),
(12,'Train Your Brain','By Shireen Stephen',1);

-- -----------------------------------------------------
-- Insert Data Into `ecommercedb`.`supplier_pricing` Table
-- -----------------------------------------------------
INSERT INTO `ecommercedb`.`supplier_pricing` 
(PRICING_ID,PRO_ID,SUPP_ID,SUPP_PRICE)
VALUES 
(1,1,2,1500),
(2,3,5,30000),
(3,5,1,3000),
(4,2,3,2500),
(5,4,1,1000),
(6,12,2,780),
(7,12,4,789),
(8,3,1,31000),
(9,1,5,1450),
(10,4,2,999),
(11,7,3,549),
(12,7,4,529),
(13,6,2,105),
(14,6,1,99),
(15,2,5,2999),
(16,5,2,2999);

-- -----------------------------------------------------
-- Insert Data Into `ecommercedb`.`order` Table
-- -----------------------------------------------------
INSERT INTO `ecommercedb`.`order` 
(ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID)
VALUES 
(101,1500,'2021-10-06',2,1),
(102,1000,'2021-10-12',3,5),
(103,30000,'2021-09-16',5,2),
(104,1500,'2021-10-05',1,1),
(105,3000,'2021-08-16',4,3),
(106,1450,'2021-08-18',1,9),
(107,789,'2021-09-01',3,7),
(108,780,'2021-09-07',5,6),
(109,3000,'2021-00-10',5,3),
(110,2500,'2021-09-10',2,4),
(111,1000,'2021-09-15',4,5),
(112,789,'2021-09-16',4,7),
(113,31000,'2021-09-16',1,8),
(114,1000,'2021-09-16',3,5),
(115,3000,'2021-09-16',5,3),
(116,99,'2021-09-17',2,14);

-- -----------------------------------------------------
-- Insert Data Into `ecommercedb`.`rating` Table
-- -----------------------------------------------------
INSERT INTO `ecommercedb`.`rating` 
(RAT_ID,ORD_ID,RAT_RATSTARS)
VALUES 
(1,101,4),
(2,102,3),
(3,103,1),
(4,104,2),
(5,105,4),
(6,106,3),
(7,107,4),
(8,108,4),
(9,109,3),
(10,110,5),
(11,111,3),
(12,112,4),
(13,113,2),
(14,114,1),
(15,115,1),
(16,116,0);

-- -----------------------------------------------------
-- Queries
-- -----------------------------------------------------

-- 3) Display the total number of customers based on gender who have placed orders of worth at least Rs.3000

SELECT count(CUS_ID) AS Total_No_Of_Customer,CUS_GENDER AS Customer_Gender  
FROM `ecommercedb`.`customer`
WHERE CUS_ID IN (SELECT CUS_ID FROM `ecommercedb`.`order` GROUP BY CUS_ID HAVING SUM(ORD_AMOUNT) >= 3000) 
GROUP BY CUS_GENDER;

-- 4) Display all the orders along with product name ordered by a customer having Customer_Id=2

SELECT ord.ORD_ID, ord.ORD_AMOUNT,ord.ORD_DATE,sp.PRICING_ID,product.PRO_NAME,ord.CUS_ID
FROM `ecommercedb`.`order` ord 
INNER JOIN `ecommercedb`.`supplier_pricing` sp
ON ord.PRICING_ID = sp.PRICING_ID
INNER JOIN `ecommercedb`.`product` product
ON sp.PRO_ID = product.PRO_ID
WHERE ord.CUS_ID=2;

-- 5) Display the Supplier details who can supply more than one product.

SELECT supplier.*
FROM `ecommercedb`.`supplier` supplier
WHERE supplier.SUPP_ID 
IN (
	SELECT sp.SUPP_ID 
    FROM `ecommercedb`.`supplier_pricing` sp
    GROUP BY sp.SUPP_ID
    HAVING COUNT(sp.PRO_ID) > 1
);

-- 6)
/*
Find the least expensive product from each category and print the table 
with category id, name, product name and price of the product
*/

SELECT category.CAT_ID,category.CAT_NAME,T2.PRO_NAME,min(T2.minimum_price) as Min_Price
FROM `ecommercedb`.`category` category
INNER JOIN (
	SELECT product.CAT_ID,product.PRO_NAME,T1.*
    FROM `ecommercedb`.`product` product
    INNER JOIN (
		SELECT sp.PRO_ID,MIN(sp.SUPP_PRICE) AS Minimum_Price 
        FROM `ecommercedb`.`supplier_pricing` sp
        group by sp.PRO_ID
    )
    AS T1 
    WHERE T1.PRO_ID = product.PRO_ID
)
AS T2 
WHERE T2.CAT_ID = category.CAT_ID 
GROUP BY T2.CAT_ID
ORDER BY T2.CAT_ID;

-- 7) Display the Id and Name of the Product ordered after “2021-10-05”.

SELECT product.PRO_ID,product.PRO_NAME
FROM `ecommercedb`.`order` ord
INNER JOIN `ecommercedb`.`supplier_pricing` sp
ON sp.PRICING_ID=ord.PRICING_ID
INNER JOIN `ecommercedb`.`product` product
ON product.PRO_ID=sp.PRO_ID
WHERE ord.ORD_DATE>"2021-10-05";

-- 8) Display customer name and gender whose names start or end with character 'A'.

SELECT customer.CUS_NAME,customer.CUS_GENDER 
FROM `ecommercedb`.`customer` customer 
WHERE customer.cus_name LIKE 'A%' OR customer.cus_name LIKE '%A';

-- ----------------------------------------------------------------------------------------------
-- 9) Create a stored procedure to display supplier id, name, rating and Type_of_Service. 
		
        /*	For Type_of_Service, 
					If rating =5, print serviceProcserviceProcserviceProc“Excellent Service”,
					If rating >4 print “Good Service”, 
					If rating >2 print “Average Service” 
					else print “Poor Service”.
		*/
-- ----------------------------------------------------------------------------------------------

-- This below is the Procedure PART 

/*

CREATE DEFINER=`root`@`localhost` PROCEDURE `serviceProc`()
BEGIN
	SELECT report.supp_id,report.supp_name,report.Average,
	CASE
		WHEN report.Average =5 THEN 'Excellent Service'
		WHEN report.Average >4 THEN 'Good Service'
		WHEN report.Average >2 THEN 'Average Service'
		ELSE 'Poor Service'
	END AS Type_of_Service 
    FROM
		(SELECT final.supp_id, supplier.supp_name, final.Average 
            FROM
				(SELECT test2.supp_id, sum(test2.rat_ratstars)/count(test2.rat_ratstars) AS Average 
					FROM
						(SELECT supplier_pricing.supp_id, test.ORD_ID, test.RAT_RATSTARS 
							FROM supplier_pricing 
                            INNER JOIN
								(SELECT `order`.pricing_id, rating.ORD_ID, rating.RAT_RATSTARS 
									FROM `order` 
                                    INNER JOIN rating 
                                    ON rating.`ord_id` = `order`.ord_id 
								 ) as test
							ON test.pricing_id = supplier_pricing.pricing_id
						)
						AS test2 
                        GROUP BY supplier_pricing.supp_id
					)
			AS final 
			INNER JOIN supplier 
			WHERE final.supp_id = supplier.supp_id
		) 
        AS report;
END

*/
-- Save/Create this above content of procedure call function
-- in your SCHEMAS -> `ecommercedb` -> Stored Procedures [in MySQL Workbench] then execute the below command

-- USE `ecommercedb` ;
call serviceProc();