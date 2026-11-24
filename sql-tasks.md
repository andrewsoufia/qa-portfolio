# SQL Tasks: 15 SQL queries

## Setup

1. Open https://sqliteonline.com (choose **SQLite** on the left).
2. Paste all of `shop-practice-db.sql` into the editor and click **Run**. You now have 4 tables: `customers`, `products`, `orders`, `order_items`.
3. Clear the editor and write your queries one at a time.

The data has **planted defects**, the same way a real database does. Part A practises the SQL you know. Part B is real QA work: data validation.

## Part A: queries you already know (1 to 7)

1. All customers from Lebanon, sorted by name A to Z.
2. Products that cost less than 20, cheapest first.
3. The number of orders for each status.
4. Every order with the customer's **name** next to it (order id, name, total).
5. Total revenue from **delivered** orders only.
6. The best-selling product by total quantity. Show only the top one.
7. Customers who have **never** placed an order.

## Part B: data validation (8 to 15)

Each query should return the bad rows, so an empty result means "no defect".

8. Customers with no email.
9. Emails used by more than one customer.
10. Emails that don't look valid (they have no dot after the @).
11. Products with a negative price **or** negative stock.
12. Orders whose `customer_id` doesn't exist in `customers`.
13. Orders whose status is not one of: pending, shipped, delivered, cancelled.
14. Orders dated in the future.
15. Orders whose `total` doesn't equal the sum of `quantity * unit_price` of their items.
