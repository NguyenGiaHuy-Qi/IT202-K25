USE dtb_ss02;

CREATE TABLE CUSTOMERS (
    customerID INT PRIMARY KEY,
    fullName VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20)
);

CREATE TABLE ORDERS (
    orderID INT PRIMARY KEY,
    orderCode VARCHAR(50) NOT NULL UNIQUE,
    orderDate DATETIME DEFAULT CURRENT_TIMESTAMP, 
    totalAmount DECIMAL(18, 2) DEFAULT 0.00, 
    
    customerID INT NOT NULL, 
    
    CONSTRAINT fk_customer 
        FOREIGN KEY (customerID) REFERENCES CUSTOMERS(customerID)
);