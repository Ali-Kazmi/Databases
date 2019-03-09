/* Assignment6.sql
	Ali Kazmi 
	CS31A, Fall 2018 */
    
    USE bookstore; 
    
    /* query 1 */ 
	SELECT COUNT('order_id'), SUM('tax_amount') 
    FROM orders; 
    
    /* query 2 */ 
    SELECT product.product_id, count('quantity') AS NumOrders
    FROM product 
    JOIN orderitems o on o.product_id=product.product_id
    GROUP BY product.product_id
    ORDER BY NumOrders DESC; 
    
	/* query 3 */ 
    SELECT category.category_name, COUNT(p.product_id) AS product_count, MAX(list_price) AS most_expensive_product
    FROM category
    JOIN product p ON p.category_id=category.category_id
    GROUP BY category_name
    ORDER BY product_count DESC; 

    /* query 4 */ 
  SELECT email_address, (SUM(ord.item_price*ord.quantity)) AS item_price_total,SUM(ord.discount_amount*ord.quantity) AS discount_amount_total
  FROM customer
  JOIN orders o ON o.customer_id=customer.customer_id
  JOIN orderitems ord ON ord.order_id=o.order_id
  GROUP BY email_address
  ORDER BY item_price_total DESC;  
	
    /* query 5 */ 
    SELECT email_address,COUNT(o.order_id) AS order_count,SUM(quantity*(item_price-discount_amount)) AS order_total
    FROM customer
    JOIN orders o ON o.customer_id=customer.customer_id
    JOIN orderitems ord ON o.order_id=ord.order_id
	GROUP BY email_address
    HAVING (COUNT(o.order_id)>1)
   ORDER BY order_total DESC;
  
    
    /* query 6 */ 
	SELECT email_address,COUNT(o.order_id) AS order_count,SUM(quantity*(item_price-discount_amount)) AS order_total
    FROM customer
    JOIN orders o ON o.customer_id=customer.customer_id
    JOIN orderitems ord ON o.order_id=ord.order_id
    WHERE item_price>400
   GROUP BY email_address
    HAVING (COUNT(o.order_id)>1)
   ORDER BY order_total DESC;
    
	/* query 7 */ 
    SELECT email_address,COUNT(product_id)
    FROM customer c
    JOIN orders o ON c.customer_id=o.customer_id
    JOIN orderitems ord ON o.order_id=ord.order_id
    GROUP BY email_address
    HAVING (COUNT(product_id)>1);
    
    /* query 8 */ 
    SELECT vendor.vendor_id, COUNT(*)
    FROM vendor
    JOIN product p on p.vendor_id=vendor.vendor_id
    WHERE list_price>100
    GROUP BY vendor_id;
    
	/* query 9 */ 
    SELECT vendor_id,category_id,COUNT(product_id),AVG(list_price)
    FROM product
    GROUP BY vendor_id,category_id 
    HAVING COUNT(product_id)>1;
    
    /* query 10 */ 
    SELECT COUNT(product_id)
    FROM product
    JOIN category ON product.category_id=category.category_id
    WHERE category_name='printer';
    
	/* query 11 */ 
    SELECT (item_price*quantity) AS totalProfit
    FROM orders
    JOIN orderitems o on o.order_id=orders.order_id 
    WHERE customer_id=77779;
    
    /* query 12*/ 
    SELECT card_number, 
		LENGTH(card_number) AS card_number_length, 
		SUBSTR(card_number,-4) AS last_four_digits,
        CONCAT('XXXX-XXXX-XXXX-',SUBSTR(card_number,-4)) AS formatted_number
    FROM orders
    GROUP BY card_number;
