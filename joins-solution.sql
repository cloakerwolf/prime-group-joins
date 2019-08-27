--1. Get all customers and their addresses.
SELECT *
FROM "customers"
JOIN "addresses" ON "addresses".customer_id = "customers".id;


--2. Get all orders and their line items (orders, quantity and product).
SELECT *
FROM "line_items"
JOIN "orders" ON "orders".id = "line_items".order_id
JOIN "products" ON "products".id = "line_items".product_id;



--3. Which warehouses have cheetos?
SELECT *
FROM "warehouse_product"
JOIN "products" ON "products".id = "warehouse_product".product_id
JOIN "warehouse" ON "warehouse".id = "warehouse_product".warehouse_id
WHERE "products".description = 'cheetos';


--4. Which warehouses have diet pepsi?
SELECT *
FROM "warehouse_product"
JOIN "products" ON "products".id = "warehouse_product".product_id
JOIN "warehouse" ON "warehouse".id = "warehouse_product".warehouse_id
WHERE "products".description = 'diet pepsi';

--5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "customers".first_name, "customers".last_name, COUNT("orders".address_id)
FROM "customers"
JOIN "addresses" ON "customers".id = "addresses".customer_id
JOIN "orders" ON "addresses".id = "orders".address_id
GROUP BY "customers".first_name, "customers".last_name;



--6. How many customers do we have?
SELECT COUNT("customers".id) AS "total_customers"
FROM "customers";

--7. How many products do we carry?
SELECT COUNT("products".id) AS "total_products"
FROM "products";

--8. What is the total available on-hand quantity of diet pepsi?
SELECT SUM("warehouse_product".on_hand), "products".description
FROM "warehouse_product"
JOIN "products" ON "products".id = "warehouse_product".product_id
WHERE "products".description = 'diet pepsi'
GROUP BY "products".id;
 