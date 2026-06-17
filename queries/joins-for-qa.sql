-- JOIN Queries for QA
-- Validating data across related tables
-- Database: ShopEase

-- 1. List every order with the customer's name and product name
-- (Verifies relationships display correctly end-to-end)
SELECT o.order_id,
       u.full_name AS customer,
       p.name      AS product,
       o.quantity,
       o.total_price,
       o.status
FROM orders o
INNER JOIN users u    ON o.user_id    = u.user_id
INNER JOIN products p ON o.product_id = p.product_id;

-- 2. Show all users and their order count, including users with no orders
-- (LEFT JOIN reveals customers who never purchased)
SELECT u.full_name,
       COUNT(o.order_id) AS total_orders
FROM users u
LEFT JOIN orders o ON u.user_id = o.user_id
GROUP BY u.user_id, u.full_name;

-- 3. Total amount spent by each customer (completed orders only)
SELECT u.full_name,
       SUM(o.total_price) AS total_spent
FROM users u
JOIN orders o ON u.user_id = o.user_id
WHERE o.status = 'completed'
GROUP BY u.user_id, u.full_name
ORDER BY total_spent DESC;

-- 4. Products that have never been ordered
-- (LEFT JOIN + NULL check finds unsold inventory)
SELECT p.product_id, p.name
FROM products p
LEFT JOIN orders o ON p.product_id = o.product_id
WHERE o.order_id IS NULL;

-- 5. Revenue per product category
SELECT p.category,
       SUM(o.total_price) AS category_revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id
WHERE o.status = 'completed'
GROUP BY p.category;

-- 6. Customers who ordered a specific product (e.g., Wireless Mouse)
SELECT DISTINCT u.full_name, u.email
FROM users u
JOIN orders o   ON u.user_id    = o.user_id
JOIN products p ON o.product_id = p.product_id
WHERE p.name = 'Wireless Mouse';
