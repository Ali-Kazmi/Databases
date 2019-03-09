
/* Assignment 2.sql */
/* Ali Kazmi */
/* CS 31A, Fall 2018 */
/* company */

/* Query 0 */SELECT user(), current_date();

/* Query 1 */
SELECT customer_id,first_name,last_name
FROM CUSTOMER
WHERE (customer_id!=77779); 

/* Query 2 */
SELECT product_name,description
FROM PRODUCT
WHERE (category_id>21);

/* Query 3 */
SELECT last_name, first_name, customer_id, email_address
FROM customer
WHERE (customer_id=11119);
/* Query 4 */
SELECT item_id
	,item_price
	,discount_amount 
	,Quantity
	,item_price*Quantity AS "price_total"
	,discount_amount*Quantity AS "discount_total" 
	,(item_price-discount_amount)*Quantity AS "item_total"
FROM orderitems
WHERE ((item_price-discount_amount)*Quantity>900) 
ORDER BY item_total  DESC;
/* Query 5 */
SELECT store_id,region_id,region_name
FROM STORE;

/* Query 6 */
SELECT customer_id, email_address
FROM customer;

/* Query 7 */
SELECT DISTINCT customer_id
FROM orders;

/* Query 8 */
SELECT customer_id
	,line1
	,line2
	,CONCAT(city, ' ',state) AS "city state"
	,zip_code
FROM address;

/* Query 9 */
SELECT product_name
	,list_price
    ,discount_percent
    ,list_price-(list_price*((100-discount_percent)/100)) AS discount_amount
    ,list_price*((100-discount_percent)/100) AS discount_price
FROM product
ORDER BY discount_price DESC
LIMIT 5;

/*  Query 10 */
SELECT CONCAT(last_name,', ', first_name) AS full_name
FROM customer;

/* Query 11 */
SELECT product_name, category_id
FROM product;

/* Query 12 */ 
SELECT product_name
,list_price
,(list_price*1.2) AS "new list price"
FROM product;
