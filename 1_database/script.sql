-- Write your SQL code here

--Creating the database
CREATE DATABASE british_american_tobacco;

--Creating the table Product
CREATE TABLE product(
    productID int(8) NOT NULL,
    productName VARCHAR(18) NOT NULL,
    productPrice DECIMAL(10,2) NOT NULL,
    productCategory VARCHAR(11) NOT NULL,
    productQuantity TINYINT(1) DEFAULT 0,
    PRIMARY KEY(productID)
    );
    