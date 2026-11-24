-- Practice shop database with planted data defects.
-- Use https://sqliteonline.com (or DB Fiddle, SQLite) and click Run.
-- The data contains planted defects. Finding them is part of the exercise.

DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
  id         INTEGER PRIMARY KEY,
  name       TEXT NOT NULL,
  email      TEXT,
  country    TEXT,
  created_at TEXT
);

CREATE TABLE products (
  id       INTEGER PRIMARY KEY,
  name     TEXT NOT NULL,
  category TEXT,
  price    REAL,
  stock    INTEGER
);

CREATE TABLE orders (
  id          INTEGER PRIMARY KEY,
  customer_id INTEGER,
  order_date  TEXT,
  status      TEXT,
  total       REAL
);

CREATE TABLE order_items (
  id         INTEGER PRIMARY KEY,
  order_id   INTEGER,
  product_id INTEGER,
  quantity   INTEGER,
  unit_price REAL
);

INSERT INTO customers VALUES
 (1, 'Maya Haddad',   'maya@example.com',   'Lebanon', '2025-03-02'),
 (2, 'Omar Khalil',   'omar@example.com',   'Lebanon', '2025-04-11'),
 (3, 'Sara Nasser',   NULL,                 'France',  '2025-05-19'),
 (4, 'John Smith',    'john@example.com',   'USA',     '2025-06-01'),
 (5, 'Lina Saab',     'maya@example.com',   'Lebanon', '2025-06-20'),
 (6, 'Karim Fares',   'karim@example',      'Canada',  '2025-07-07'),
 (7, 'Emma Brown',    'emma@example.com',   'USA',     '2025-08-15'),
 (8, 'Rami Aoun',     'rami@example.com',   NULL,      '2025-09-30');

INSERT INTO products VALUES
 (1, 'Backpack',     'Bags',     29.99,  15),
 (2, 'Bike Light',   'Outdoor',   9.99,  40),
 (3, 'Bolt T-Shirt', 'Clothing', 15.99,   0),
 (4, 'Fleece Jacket','Clothing', 49.99,   8),
 (5, 'Onesie',       'Clothing',  7.99,  22),
 (6, 'Water Bottle', 'Outdoor',  -5.00,  30),
 (7, 'Travel Mug',   'Outdoor',  12.50,  -3),
 (8, 'Gift Card',    NULL,       25.00, 100);

INSERT INTO orders VALUES
 (101, 1, '2025-09-01', 'delivered', 45.98),
 (102, 2, '2025-09-03', 'shipped',   49.99),
 (103, 1, '2025-09-10', 'pending',   19.98),
 (104, 4, '2025-09-12', 'shiped',    29.99),
 (105, 9, '2025-09-15', 'delivered', 15.99),
 (106, 7, '2025-10-02', 'cancelled', 57.98),
 (107, 2, '2027-01-01', 'pending',    7.99),
 (108, 3, '2025-10-20', 'delivered', 99.00),
 (109, 4, '2025-10-25', 'pending',    0.00);

INSERT INTO order_items VALUES
 (1, 101, 1, 1, 29.99),
 (2, 101, 3, 1, 15.99),
 (3, 102, 4, 1, 49.99),
 (4, 103, 2, 2,  9.99),
 (5, 104, 1, 1, 29.99),
 (6, 105, 3, 1, 15.99),
 (7, 106, 4, 1, 49.99),
 (8, 106, 5, 1,  7.99),
 (9, 107, 5, 1,  7.99),
 (10,108, 1, 2, 29.99),
 (11,108, 99,1,  9.99),
 (12,103, 2, 0,  9.99);
