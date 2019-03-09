/* Assignment8.sql
	Ali Kazmi 
	CS31A, Fall 2018 */

USE bookstore; 

/* query 1 */ 
CREATE OR REPLACE VIEW customer_address AS
SELECT c.customer_id,email_address,last_name,first_name, line1,line2,city
,state, zip_code
FROM customer c
JOIN address a ON a.customer_id=c.customer_id;

SELECT customer_id,email_address,last_name,first_name, line1,line2,city
,state, zip_code
FROM customer_address;

/* query 2 */ 
UPDATE customer_address 
SET line1='1990 Westwood Vldv'
WHERE customer_id=11119;

/* query 3 */ 
CREATE OR REPLACE VIEW product_summary AS
SELECT p.product_id, COUNT(order_id) AS 'order_count',  SUM((list_price-discount_amount)*quantity)AS 'order_total'
FROM product p
JOIN orderitems o ON o.product_id=p.product_id
GROUP BY product_id;

SELECT product_id, order_count, order_total
FROM product_summary; 

/* query 4 */ 
CREATE OR REPLACE VIEW cheap_products AS
SELECT * 
FROM product
WHERE list_price<50
WITH LOCAL CHECK OPTION;

SELECT * 
FROM cheap_products; 

/* query 5 */ 
INSERT INTO cheap_products
VALUES(17888,41,'book db', 'fundamentals of database systems', 
'fundamental of database systems elmsari',45.99, 20.00, '2015-06-01 11:12:59', 2);

/* query 6 */
CREATE OR REPLACE VIEW contact AS
SELECT contact_fname, phone
FROM vendor;

ALTER VIEW contact AS 
SELECT contact_fname, phone
FROM vendor
WITH CASCADED CHECK OPTION;

SELECT * 
FROM contact; 


/* query 7 */
CREATE OR REPLACE VIEW order_items AS
SELECT ord.order_id,ord.order_date,ord.tax_amount,ord.ship_date, 
o.item_price,o.discount_amount,(item_price-discount_amount) AS 'final_price', 
quantity, SUM(item_price)AS 'item_total' , p.product_name
FROM orders ord 
JOIN orderitems o ON o.order_id=ord.order_id
JOIN product p ON p.product_id=o.product_id
GROUP BY order_id,item_price,discount_amount,quantity,product_name; 

SELECT * 
FROM order_items; 

/* query 8 */
CREATE OR REPLACE VIEW reorder_info AS
SELECT product_id,product_name, contact_fname, phone
FROM product p
JOIN vendor v ON v.VENDOR_id=p.VENDOR_id;

SELECT *
FROM reorder_info; 