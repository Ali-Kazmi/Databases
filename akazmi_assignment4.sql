/* Assignment4.sql
	Ali Kazmi 
	CS31A, Fall 2018 */

USE library;

/* query 1 */
Drop table if exists branch_staff;
Drop table if exists computer_staff; 
Drop table if exists staff;
Drop table if exists computer;

CREATE TABLE staff (
    staff_id VARCHAR(50) NOT NULL,
    fname  VARCHAR(50),
    lname VARCHAR(50),
    phone VARCHAR(50),
    email VARCHAR(50)
);

CREATE TABLE computer_staff (
	serial_number VARCHAR(50),
    staff_id VARCHAR(50),
    date_assigned DATE
);

CREATE TABLE branch_staff (
    branch_ID VARCHAR(50),
    contact VARCHAR(50),
    staff_id VARCHAR(50)
);

CREATE TABLE computer(
    serial_number VARCHAR(50),
    make VARCHAR(25),
    model VARCHAR(25),
    processor_type VARCHAR(25),
    speed VARCHAR(50),
    main_memory VARCHAR(25),
    disk_size VARCHAR(50)
); 

/* for query 2 used a different script to insert the data then copied and pasted that into the txt file */ 

/* query 3 */
SELECT serial_number, model 
FROM computer;

/* query 4 */ 
ALTER TABLE books
ADD COLUMN date_added DATE;
DESCRIBE books; 

/* query 5 */ 
ALTER TABLE staff 
MODIFY COLUMN lname VARCHAR(25) NOT NULL;

/* query 6*/ 
ALTER TABLE staff
ADD COLUMN salary DECIMAL(7,2);

/* query 7 */ 
SELECT serial_number, staff_id, date_assigned
FROM computer_staff;

/* query 8 */
ALTER TABLE books
DROP COLUMN date_added;
 
/* query 9 */ 
CREATE TABLE books_archive(
 isbn VARCHAR(10),
 pub_date DATE,
 title varchar(130),
 Pub_id int(11),
 list_price decimal(5,2),
 category_id int(10)
);
DESCRIBE books_archive; 

/* query 10 */ 
DROP TABLE books_archive; 
SHOW TABLES;
