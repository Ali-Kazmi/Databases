/*  Assignment3.sql 
	Ali Kazmi
    CS 31A, FALL 2018 */
    
    /* Query 0 */
    SELECT user(), current_date(); 
    /* Query 1 */
    SELECT last_name, first_name, customer_id
    FROM customer
    WHERE (customer_id BETWEEN 22229 AND 66669);
    
    /* Query 2 */
    SELECT first_name,last_name,salary
    FROM employee
    WHERE Salary!=(3000) AND Salary!=3400 AND salary!=6000;
    
    /* Query 3 */
    SELECT order_id,order_date,ship_date
    FROM orders
    WHERE ship_date IS NULL;
    
    /* Query 4 */
    SELECT last_name,first_name
    FROM customer
    WHERE last_name LIKE '%in%'
    ORDER BY last_name, first_name;
    
    /* Query 5 */
    SELECT product_id,product_name,list_price
    FROM product
    WHERE(list_price>30.00 AND list_price<900.00);
    
    /* Query 6 method 1: range operator */
    SELECT order_id,order_date,ship_date
    FROM orders
    WHERE order_date BETWEEN '2015-03-01' AND '2015-04-01';
    
    /* query 6 method 2: logical operator */
        SELECT order_id,order_date,ship_date
    FROM orders
    WHERE (order_date >'2015-03-01') AND order_date<'2015-04-01';
    
    /* query 6 method 3: a search pattern operator */
    SELECT order_id,order_date,ship_date
    FROM orders
    WHERE (order_date LIKE '2015-03%')
    ORDER BY order_date;
    
    /* Query 7 */
    SELECT product_id,product_name,product_code
    FROM product
   WHERE (product_name LIKE '_e%')AND(product_name LIKE '___l%')
    ORDER BY product_code DESC;
    
    /* Query 8 */
    SELECT product_id,category_id,vendor_id, list_price
    FROM product
    WHERE ((category_id=11) OR (category_id=61))AND(vendor_id IN (2,3))AND(list_price>100);
  
  /* Query 9*/
  SELECT order_id,customer_id,order_date
  FROM orders
  WHERE (ship_date IS NOT null);
    
    /* Query 10*/
    INSERT INTO CATEGORY 
    VALUES ('71',"video game");
    UPDATE CATEGORY 
    SET category_name="Camera" where (category_id=71);
    /* Query 11 */
INSERT INTO product
VALUES ('17234',71,'Camera640','Canon','Canon EOS Rebel T5 DSLR Camera',755.99,0,'2015-04-30 13:14:15',2);
    /* Query 12 */
DELETE FROM product
WHERE category_id= 71;
DELETE FROM category
WHERE category_id=71;
    /* Query 13 */
    UPDATE orders
    SET card_type='American Express'
    WHERE order_id=9;
    
    /* Query 14 */
        UPDATE employee
    SET salary=6500
    WHERE salary=6000;
    /* Query 15*/
    INSERT INTO customer
    VALUES(customer_id=99999,email_address="rick@raven.com",password='',first_name="Rick", last_name="Raven",shipping_address_id=NULL,billing_address_id=NULL);

    /* Query 16*/
    ALTER TABLE administrators 
    RENAME TO ADMINISTRATORS_BACKUP;