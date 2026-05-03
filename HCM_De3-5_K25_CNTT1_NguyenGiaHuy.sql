CREATE DATABASE CINE_MAGIC;
USE CINE_MAGIC;

CREATE TABLE Movies(
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_name VARCHAR(255) NOT NULL,
    duration INT NOT NULL, -- phút
    age_limit INT DEFAULT 0
);
CREATE TABLE Customers(
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL
);
CREATE TABLE Showtimes(
    showtime_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT,
    show_date DATE,
    ticket_price DECIMAL(10,2),
    FOREIGN KEY(movie_id) REFERENCES Movies(movie_id)
);
CREATE TABLE Tickets(
    ticket_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    showtime_id INT,
    booking_date DATETIME,
    FOREIGN KEY(customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY(showtime_id) REFERENCES Showtimes(showtime_id)
);

INSERT INTO Movies(movie_name, duration, age_limit) VALUES
('Avengers', 120, 13),
('Deadpool', 110, 18),
('Fast & Furious', 130, 16),
('The Nun', 95, 18),
('Avatar 2', 160, 13);

INSERT INTO Customers(customer_name) VALUES
('Nguyen Van A'),
('Tran Thi B'),
('Le Van C');

INSERT INTO Showtimes(movie_id, show_date, ticket_price) VALUES
(1, CURDATE(), 90000),
(2, CURDATE(), 120000),
(3, DATE_SUB(CURDATE(), INTERVAL 1 MONTH), 150000),
(4, CURDATE(), 110000),
(5, CURDATE(), 200000);

INSERT INTO Tickets(customer_id, showtime_id, booking_date) VALUES
(1, 2, NOW()),
(2, 2, DATE_SUB(NOW(), INTERVAL 1 DAY)),
(3, 1, NOW()),
(1, 4, NOW());

SELECT *
FROM Movies
WHERE duration BETWEEN 90 AND 120;

SELECT t.ticket_id, c.customer_name, t.booking_date
FROM Tickets t
JOIN Customers c ON t.customer_id = c.customer_id
WHERE t.showtime_id = 2
ORDER BY t.booking_date DESC;

SELECT *
FROM Movies
WHERE age_limit = 18
   OR duration > 150;

SELECT *
FROM Showtimes
WHERE ticket_price > 100000
  AND MONTH(show_date) = MONTH(CURDATE())
  AND YEAR(show_date) = YEAR(CURDATE());