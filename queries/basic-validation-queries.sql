-- Basic Data Validation Queries for QA
-- Database: ShopEase

-- 1. Verify a specific user was created after a signup test
SELECT * FROM users
WHERE email = 'alice@shopease.com';

-- 2. Count total registered users (verify against expected count)
SELECT COUNT(*) AS total_users FROM users;

-- 3. Check that a newly placed order exists with correct values
SELECT order_id, user_id, product_id, quantity, total_price, status
FROM orders
WHERE user_id = 1
ORDER BY order_date DESC;

-- 4. Verify product price matches what is shown on the UI
SELECT name, price FROM products
WHERE name = 'Mechanical Keyboard';

-- 5. Find all completed orders (validate order status flow)
SELECT order_id, user_id, total_price
FROM orders
WHERE status = 'completed';

-- 6. Verify stock count for an out-of-stock product
SELECT name, stock FROM products
WHERE stock = 0;

-- 7. Check users from a specific country (data filtering validation)
SELECT full_name, email FROM users
WHERE country = 'Pakistan';

-- 8. Validate total price calculation (quantity * unit price)
-- Confirms the stored total_price matches the expected calculation
SELECT o.order_id,
       o.quantity,
       p.price AS unit_price,
       (o.quantity * p.price) AS expected_total,
       o.total_price AS stored_total
FROM orders o
JOIN products p ON o.product_id = p.product_id;

-- 9. Find the most recent order (validate timestamp ordering)
SELECT * FROM orders
ORDER BY order_date DESC
LIMIT 1;

-- 10. Count orders grouped by status (verify status distribution)
SELECT status, COUNT(*) AS order_count
FROM orders
GROUP BY status;
