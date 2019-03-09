/* Assignment7.sql
	Ali Kazmi 
	CS31A, Fall 2018 */

USE bookstore; 

/* query 1 */ 
SELECT category_name
FROM category
WHERE  category_id  IN(SELECT category_id FROM product);

/* query 2 */ 
SELECT product_name, list_price 
FROM product 
WHERE (list_price>(SELECT AVG(list_price) FROM product))
ORDER BY list_price DESC; 

/* query 3 */ 
SELECT category_name
FROM category 
WHERE EXISTS (SELECT category_id FROM product);

/* query 4 */
SELECT email_address, ord.order_id,  SUM((item_price-discount_amount)*quantity) AS 'order_total'
FROM customer
JOIN orders o ON o.customer_id=customer.customer_id
JOIN orderitems ord ON ord.order_id=o.order_id
/*WHERE order_id IN(SELECT order_id FROM orders WHERE order_id IN(SELECT order_id from orderitems))*/
GROUP BY email_address,order_id;


/* query 5 */
SELECT  email_address, order_id, order_date
FROM customer
JOIN orders o on o.customer_id=customer.customer_id 
WHERE order_date= (SELECT MIN(order_date) FROM orders WHERE  customer_id=o.customer_id GROUP BY customer_id )
GROUP BY email_address, order_id;

/* query 6 */ 
SELECT product_id, product_name, list_price
FROM product
WHERE EXISTS(SELECT product_id FROM orderitems WHERE quantity>1); 

/* query 7 */
SELECT last_name, first_name 
FROM customer c
JOIN orders ord ON c.customer_id=ord.customer_id
JOIN orderitems o ON o.order_id=ord.order_id
WHERE item_price=(SELECT MAX(item_price) FROM orders GROUP BY customer_id)>300; 

/* query 8 */
SELECT last_name, first_name, email_address
FROM customer
WHERE customer_id IN(SELECT customer_id FROM orders WHERE order_id IN(1,2,3));

/* query 9 */
SELECT last_name, first_name, email_address
FROM customer 
WHERE customer_id IN(SELECT customer_id FROM orders WHERE order_id IN(
SELECT order_id FROM orderitems WHERE product_id IN(SELECT product_id FROM product WHERE vendor_id IN(
SELECT vendor_id FROM vendor WHERE company_name LIKE 'H%')))
); 

/* query 10 */
SELECT product_id, product_name, list_price 
FROM product 
WHERE (SELECT SUM(quantity) FROM orderitems WHERE orderitems.product_id=product.product_id)>2; 

/* query 11 */ 
SELECT order_id
FROM orderitems 
WHERE ((item_price-discount_amount)*quantity) =(SELECT (MAX(item_price-discount_amount)*quantity)) 
GROUP BY order_id;

/* query 12 */
SELECT order_id, order_date, ship_date
FROM orders 
WHERE ship_date-order_date=(SELECT MAX(ship_date-order_date) FROM orders);

/* note to self: missed query 7, maybe 3, and others likely :/ lost some points here( 