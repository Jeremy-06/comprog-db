CREATE DATABASE walkwalkSlippers;

USE walkwalkSlippers;

CREATE TABLE products (
    product_id INT PRIMARY KEY IDENTITY(1,1),
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    description VARCHAR(255)
);

CREATE TABLE sizes (
    size_id INT PRIMARY KEY IDENTITY(1,1),
    size_label VARCHAR(20) NOT NULL
);

CREATE TABLE color (
    color_id INT PRIMARY KEY IDENTITY(1,1),
    color_name VARCHAR(50) NOT NULL
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address VARCHAR(255) NOT NULL
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY IDENTITY(1,1),
    customer_id INT NOT NULL,
    order_date DATETIME DEFAULT GETDATE(),
    total_amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY IDENTITY(1,1),
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    size_id INT NOT NULL,
    color_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (size_id) REFERENCES sizes(size_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id)
);

SELECT * FROM products;
SELECT * FROM sizes;
SELECT * FROM color;
SELECT * FROM customers;
SELECT * FROM orders;
--SELECT * FROM order_items;
SELECT * FROM cart;
SELECT * FROM users;

-- INSERTING PRODUCTS

Sandugo BCHS20 Outdoor Flipflops - 349
Sandugo Denali Outdoor Flipflops - 396
Sandugo Romelo Flipflops - 385
Sandugo Tapulao V2 Adventure Flipflops - 625
Sandugo Tapulao V3 Adventure Flipflops - 649
Sandugo Daraitan Flipflops - 399
Sandugo Kanlaon Adventure Flipflops - 625
Sandugo Mayon Adventure Flipflops - 549
Sandugo Sagada Flipflops - 659
Sandugo Sinai Adventure Sandals - 795
Sandugo SD1201 Sandals - 795
Sandugo Casili Sandals - 799

INSERT INTO products (product_name, price, description) VALUES
('Sandugo BCHS20 Outdoor Flipflops', 349, NULL),
('Sandugo Denali Outdoor Flipflops', 396, NULL),
('Sandugo Romelo Flipflops', 385, NULL),
('Sandugo Tapulao V2 Adventure Flipflops', 625, NULL),
('Sandugo Tapulao V3 Adventure Flipflops', 649, NULL),
('Sandugo Daraitan Flipflops', 399, NULL),
('Sandugo Kanlaon Adventure Flipflops', 625, NULL),
('Sandugo Mayon Adventure Flipflops', 549, NULL),
('Sandugo Sagada Flipflops', 659, NULL),
('Sandugo Sinai Adventure Sandals', 795, NULL),
('Sandugo SD1201 Sandals', 795, NULL),
('Sandugo Casili Sandals', 799, NULL);

-- COLORS

Black
Blue
Brown
Gray
Green
Khaki
Maroon
Rasta
Red
Teal
Black-White
Black/Gray
Black Yellow
Blue/Gray
Blue Yellow
Maroon Gray
Red Yellow

INSERT INTO color (color_name) VALUES
('Black'),
('Blue'),
('Brown'),
('Gray'),
('Green'),
('Khaki'),
('Maroon'),
('Rasta'),
('Red'),
('Teal'),
('Black-White'),
('Black/Gray'),
('Black Yellow'),
('Blue/Gray'),
('Blue Yellow'),
('Maroon Gray'),
('Red Yellow');

INSERT INTO sizes (size_label) VALUES
('5'),
('6'),
('7'),
('8'),
('9'),
('10'),
('11'),
('12');

CREATE TABLE cart (
    cart_id INT PRIMARY KEY IDENTITY(1,1),
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    size_id INT NOT NULL,
    color_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (size_id) REFERENCES sizes(size_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

SELECT 
    p.product_name AS ITEMS,
    s.size_label AS SIZES,
    co.color_name AS COLORS,
    c.quantity AS QUANTITY,
    c.price AS PRICE
FROM cart c
JOIN products p ON c.product_id = p.product_id
JOIN sizes s ON c.size_id = s.size_id
JOIN color co ON c.color_id = co.color_id;

-- Insert customers before inserting into cart to satisfy foreign key constraints
INSERT INTO customers (first_name, last_name, email, phone, address) VALUES
('John', 'Doe', 'john.doe@example.com', '1234567890', '123 Main St'),
('Jane', 'Smith', 'jane.smith@example.com', '0987654321', '456 Oak Ave'),
('Alice', 'Johnson', 'alice.johnson@example.com', '5551234567', '789 Pine Rd');

INSERT INTO cart (customer_id, product_id, size_id, color_id, quantity, price) VALUES
(1, 1, 1, 1, 2, 349.00),
(1, 2, 2, 2, 1, 396.00),
(1, 3, 3, 3, 3, 385.00),
(2, 4, 4, 4, 1, 625.00),
(2, 5, 5, 5, 2, 649.00),
(3, 6, 6, 6, 1, 399.00);


CREATE TABLE users (
    user_id INT PRIMARY KEY IDENTITY(1,1),
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL CHECK (role IN ('admin', 'customer'))
);

INSERT INTO users (username, password, role) VALUES
('admin', 'admin123', 'admin'),
('customer1', 'customer123', 'customer'),
('customer2', 'customer456', 'customer');

DELETE FROM cart;
DELETE FROM sizes;

-- Reseed the identity value for sizes table to start at 5
DBCC CHECKIDENT ('sizes', RESEED, 4);

ALTER TABLE users
ADD customer_id INT NULL
    CONSTRAINT FK_users_customers FOREIGN KEY (customer_id) REFERENCES customers(customer_id);