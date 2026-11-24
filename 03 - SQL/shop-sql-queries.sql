

-- Task 1: All customers from Lebanon, sorted by name A to Z.
SELECT * FROM customers WHERE country='Lebanon' Order BY name ASC;
-- Result: 3 rows (Lina Saab, Maya Haddad, Omar Khalil)

-- Task 2: Products that cost less than 20, cheapest first.
SELECT * FROM products WHERE price < 20 Order BY price ASC;
-- Result: 5 rows (Water Bottle -5.00, Onesie 7.99, Bike Light 9.99, Travel Mug 12.50, Bolt T-Shirt 15.99)

-- Task 3: The number of orders for each status.
SELECT Count(*) AS "Nb_of_Orders", status FROM orders GROUP BY status;
-- Result: 5 statuses: cancelled 1, delivered 3, pending 3, shiped 1, shipped 1 (typo "shiped" shows up as its own status, see task 13)

-- Task 4: Every order with the customer's name next to it (order id, name, total).
SELECT o.id, c.name, o.total FROM customers c JOIN orders o ON c.id = o.customer_id;
-- Result: 8 rows. Order 105 is missing because its customer_id 9 doesn't exist (INNER JOIN drops it, see task 12)

-- Task 5: Total revenue from delivered orders only.
SELECT SUM(total) AS total_revenue FROM orders o WHERE o.status='delivered';
-- Result: 160.97 (orders 101, 105, 108)

-- Task 6: The best-selling product by total quantity. Show only the top one.
SELECT oi.product_id, p.name, SUM(quantity) AS total_quantity FROM order_items oi JOIN products p ON p.id = oi.product_id GROUP BY oi.product_id ORDER BY (SUM(quantity)) DESC LIMIT 1;
-- Result: Backpack (product_id 1), total quantity 4

-- Task 7: Customers who have never placed an order.
SELECT * FROM customers WHERE customers.id NOT IN (SELECT DISTINCT c.id FROM customers c JOIN orders o ON o.customer_id = c.id);
-- Result: 3 rows (Lina Saab, Karim Fares, Rami Aoun)

-- Task 8: Customers with no email.
SELECT * FROM customers WHERE customers.email IS NULL;
-- Result: 1 row (Sara Nasser)

-- Task 9: Emails used by more than one customer.
SELECT COUNT(*) AS emails_used, email FROM customers GROUP BY email HAVING emails_used > 1;
-- Result: 1 row (maya@example.com, used by 2 customers: Maya Haddad and Lina Saab)

-- Task 10: Emails that don't look valid (they have no dot after the @).
SELECT * FROM customers WHERE email NOT LIKE '%@%.%'; 
-- Result: 1 row (Karim Fares, karim@example)

-- Task 11: Products with a negative price or negative stock.
SELECT * FROM products WHERE price<0 OR stock<0; 
-- Result: 2 rows (Water Bottle price -5.00, Travel Mug stock -3)

-- Task 12: Orders whose customer_id doesn't exist in customers.
SELECT * FROM orders o WHERE o.customer_id NOT IN (SELECT id FROM customers); 
-- Result: 1 row (order 105, customer_id 9)

-- Task 13: Orders whose status is not one of: pending, shipped, delivered, cancelled.
SELECT * FROM orders WHERE status <> 'pending' AND status <> 'shipped' AND status <> 'delivered' AND status <> 'cancelled'; 
-- Result: 1 row (order 104, status "shiped")

-- Task 14: Orders dated in the future.
SELECT * FROM orders WHERE order_date > CURRENT_DATE;
-- Result: 1 row (order 107, dated 2027-01-01; run on 2026-11-23)

-- Task 15: Orders whose total doesn't equal the sum of quantity * unit_price of their items.
SELECT o.id, Round((SUM(oi.quantity*oi.unit_price)),2) AS total_price FROM orders o LEFT JOIN order_items oi ON oi.order_id=o.id GROUP BY o.id HAVING o.total <> total_price OR total_price IS NULL;
-- Result: 2 rows (order 108: total 99.00 but items sum to 69.97; order 109: total 0.00 with no items)
