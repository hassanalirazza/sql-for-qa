-- Data Integrity Queries for QA
-- These queries catch backend defects that UI testing alone may miss
-- Database: ShopEase

-- 1. Find duplicate email addresses (should never exist — email is unique)
SELECT email, COUNT(*) AS occurrences
FROM users
GROUP BY email
HAVING COUNT(*) > 1;

-- 2. Find orphaned orders (orders linked to a non-existent user)
SELECT o.order_id, o.user_id
FROM orders o
LEFT JOIN users u ON o.user_id = u.user_id
WHERE u.user_id IS NULL;

-- 3. Find orders referencing a non-existent product
SELECT o.order_id, o.product_id
FROM orders o
LEFT JOIN products p ON o.product_id = p.product_id
WHERE p.product_id IS NULL;

-- 4. Find users with a missing (NULL) country value
SELECT user_id, full_name, email
FROM users
WHERE country IS NULL;

-- 5. Detect mismatched order totals (stored total != calculated total)
-- A non-empty result indicates a calculation bug
SELECT o.order_id,
       o.total_price AS stored_total,
       (o.quantity * p.price) AS calculated_total
FROM orders o
JOIN products p ON o.product_id = p.product_id
WHERE o.total_price <> (o.quantity * p.price);

-- 6. Find negative or zero quantities (invalid order data)
SELECT order_id, quantity
FROM orders
WHERE quantity <= 0;

-- 7. Find products with a negative price (invalid data)
SELECT product_id, name, price
FROM products
WHERE price < 0;

-- 8. Find products with negative stock (data corruption check)
SELECT product_id, name, stock
FROM products
WHERE stock < 0;

-- 9. Check for orders with an invalid status value
-- Valid statuses: pending, completed, cancelled
SELECT order_id, status
FROM orders
WHERE status NOT IN ('pending', 'completed', 'cancelled');

-- 10. Verify no user has an empty or blank name
SELECT user_id, full_name
FROM users
WHERE full_name IS NULL OR TRIM(full_name) = '';
