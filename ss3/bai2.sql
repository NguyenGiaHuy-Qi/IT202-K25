CREATE DATABASE dtb_ss03_02;
USE dtb_ss03_02;

CREATE TABLE SHIPPERS (
    ShipperID INT PRIMARY KEY AUTO_INCREMENT,
    ShipperName VARCHAR(255),
    Phone VARCHAR(20)
);


-- LỖI 1: Syntax Error do thiếu dấu nháy cho chuỗi
INSERT INTO SHIPPERS (ShipperName, Phone)
VALUES ( Giao Hàng Nhanh, '0901234567' );
--  "Giao Hàng Nhanh" không có dấu ' ' → SQL không hiểu là chuỗi

-- LỖI 2: Thiếu dữ liệu → Phone bị NULL
INSERT INTO SHIPPERS
VALUES ('Viettel Post');
--  Bảng có 3 cột (ShipperID tự tăng, ShipperName, Phone)
--  Nhưng chỉ truyền 1 giá trị → Phone = NULL

-- Thêm Giao Hàng Nhanh (đúng)
INSERT INTO SHIPPERS (ShipperName, Phone)
VALUES ('Giao Hàng Nhanh', '0901234567');

-- Thêm Viettel Post (đúng)
INSERT INTO SHIPPERS (ShipperName, Phone)
VALUES ('Viettel Post', '0987654321');

SELECT * FROM SHIPPERS;