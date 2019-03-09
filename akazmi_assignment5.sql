/* Assignment5.sql
	Ali Kazmi 
	CS31A, Fall 2018 */
    
    USE bookstore; 
    /* Query 1 */ 
    SELECT category_name,product_name, list_price
    FROM category JOIN product ON category.category_id=product.category_id
    ORDER BY category_name, product_name ASC; 
    
    /* Query 2 */
    SELECT first_name, last_name, line1, city, state, zip_code
    FROM customer JOIN address ON address.customer_id=customer.customer_id
    WHERE email_address LIKE 'allan.sherwood@yahoo.com';
    
    /* Query 3 */ 
    SELECT first_name, last_name, line1, city, state, zip_code
    FROM customer JOIN address ON customer.customer_id=address.customer_id
    WHERE (!(address.customer_id IS NULL)); 
    
    /* query 4 */ 
    SELECT last_name, first_name, order_date, product_name, item_price, quantity
    FROM customer c 
    JOIN orders ord ON ord.customer_id=c.customer_id
    JOIN orderitems o ON o.order_id=ord.order_id
    JOIN product p ON o.product_id=p.product_id
    ORDER BY last_name,order_date,item_price;
    
    /* query 5 */ 
    SELECT A.product_name AS product1, A.list_price, B.product_name AS product2, B.list_price
    FROM product A, product B  
    WHERE A.list_price=B.list_price AND A.product_name!=B.product_name 
    ORDER BY A.product_name;
    
    /* query 6 */ 
    SELECT product_id,product_name,list_price,company_name AS vendor_name ,category_name
    FROM product
    JOIN vendor ON product.vendor_id=vendor.vendor_id
    JOIN category ON product.category_id=category.category_id
    ORDER BY product_id;
    
    /* query 7 */
	SELECT product_id,product_name,list_price
    FROM product
    JOIN category ON product.category_id=category.category_id
    WHERE category_name='Computer'
    ORDER BY product_id;
    
    /* query 8 */
    SELECT orders.order_id, order_date, product_name, quantity, (quantity*item_price) AS amount
    FROM orders
    JOIN orderitems o ON o.order_id=orders.order_id
    JOIN product p ON p.product_id=o.product_id; 
    
    
    /* query 9 */ 
    SELECT first_name,last_name, order_id, order_date, ship_date
    FROM orders
    JOIN customer c ON c.customer_id=orders.customer_id
    WHERE ship_date IS NULL; 
    
    /* query 10 */
    SELECT first_name, last_name
    FROM orderitems ord
    JOIN orders o on o.order_id=ord.order_id
    JOIN customer c on c.customer_id=o.customer_id
    WHERE (item_price>1500);
    
    /* query 11 */
    SELECT product_name
    FROM orderitems o
    JOIN product p ON o.product_id=p.product_id
    JOIN orders ord ON o.order_id=ord.order_id
    JOIN customer c ON c.customer_id=ord.customer_id
    WHERE first_name='Christine' AND last_name='Brown';  
    

    