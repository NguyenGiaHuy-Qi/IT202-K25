CREATE DATABASE fashion_shop;
USE fashion_shop;

CREATE TABLE PRODUCTS (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    Price DECIMAL(10,2) NOT NULL CHECK (Price > 0),
    Stock INT NOT NULL DEFAULT 0 CHECK (Stock >= 0),
    Status VARCHAR(20) DEFAULT 'Available'
);

INSERT INTO PRODUCTS (ProductName, Category, Price, Stock) VALUES
('Áo thun basic', 'Áo', 150000, 50),
('Quần jean slimfit', 'Quần', 350000, 30),
('Áo khoác hoodie', 'Áo', 500000, 20),
('Váy hoa', 'Váy', 400000, 15);

UPDATE PRODUCTS
SET Price = 300000
WHERE ProductName = 'Quần jean slimfit';

UPDATE PRODUCTS
SET Stock = Stock - 2
WHERE ProductID = 1
  AND Stock >= 2;

DELETE FROM PRODUCTS
WHERE ProductID = 4;

SELECT * FROM PRODUCTS;

SELECT ProductName, Price, Stock
FROM PRODUCTS
WHERE Stock > 0;

SELECT ProductName, Price
FROM PRODUCTS
ORDER BY Price DESC;