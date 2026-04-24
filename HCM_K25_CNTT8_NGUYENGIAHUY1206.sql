CREATE DATABASE Shop_manager;
USE Shop_manager;

CREATE TABLE Categories(
category_id INT auto_increment primary key,
category_name varchar(255) unique not null
);
CREATE TABLE Products(
product_id INT auto_increment primary key,
product_name varchar(255) not null,
price decimal(10,2) not null,
stock int default 0,
category_id INT,
constraint foreign key(category_id) references Categories(category_id) 
);
INSERT INTO Categories(category_name)
values('Điện Tử'),
('Thời Trang');
INSERT INTO Products(product_name,price,stock,category_id)
VALUES ('IPHONE 15',25000000,10,1),
('Samsung S23',20000000,5,1),
('Áo sơ mi nam',500000,50,2),
('Giày thể thao',1200000,20,2);

UPDATE Products
SET price = 26000000
WHERE product_name = 'IPHONE 15';

UPDATE Products 
SET stock = stock + 10
WHERE category_id = 1;

DELETE FROM Products
WHERE product_id = 4;

SELECT * FROM Products;
SELECT * from Products
where Stock > 15;
