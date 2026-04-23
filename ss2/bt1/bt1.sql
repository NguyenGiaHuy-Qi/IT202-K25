USE dtb_ss02;

CREATE TABLE PRODUCTS (
    ID INT PRIMARY KEY, 
    ProductName VARCHAR(255) NOT NULL, 
    Price DECIMAL(10, 2),
    Description TEXT
);