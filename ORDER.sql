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
SELECT * FROM order_items;

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
