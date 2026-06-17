-- ShopEase Sample Database Schema
-- Used for all SQL examples in this repository
-- Fictional data only — safe for public use

-- Users table
CREATE TABLE users (
    user_id      INT PRIMARY KEY AUTO_INCREMENT,
    full_name    VARCHAR(100) NOT NULL,
    email        VARCHAR(150) NOT NULL UNIQUE,
    country      VARCHAR(50),
    created_at   DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Products table
CREATE TABLE products (
    product_id   INT PRIMARY KEY AUTO_INCREMENT,
    name         VARCHAR(150) NOT NULL,
    category     VARCHAR(50),
    price        DECIMAL(10,2) NOT NULL,
    stock        INT DEFAULT 0
);

-- Orders table
CREATE TABLE orders (
    order_id     INT PRIMARY KEY AUTO_INCREMENT,
    user_id      INT,
    product_id   INT,
    quantity     INT NOT NULL,
    total_price  DECIMAL(10,2) NOT NULL,
    status       VARCHAR(20) DEFAULT 'pending',
    order_date   DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id)    REFERENCES users(user_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Sample data
INSERT INTO users (full_name, email, country) VALUES
('Alice Khan',   'alice@shopease.com', 'Pakistan'),
('Bob Martin',   'bob@shopease.com',   'USA'),
('Carla Diaz',   'carla@shopease.com', 'Spain'),
('Daniel Lee',   'daniel@shopease.com','Canada');

INSERT INTO products (name, category, price, stock) VALUES
('Wireless Mouse',   'Electronics', 25.00, 100),
('Mechanical Keyboard','Electronics', 75.50, 40),
('Coffee Mug',       'Home',        12.00, 200),
('Desk Lamp',        'Home',        30.00, 0);

INSERT INTO orders (user_id, product_id, quantity, total_price, status) VALUES
(1, 1, 2, 50.00,  'completed'),
(2, 2, 1, 75.50,  'completed'),
(1, 3, 3, 36.00,  'pending'),
(3, 1, 1, 25.00,  'cancelled');
