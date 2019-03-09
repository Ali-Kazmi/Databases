/* Ali Kazmi 
	akazmi final project part 2 
	CS 31A Fall 2018 */
    USE university;
    
    /* query 1 */ 
    SELECT c.course_id,section_id, t.term_id
    FROM course c
    JOIN section s ON s.course_id=c.course_id
    JOIN term t ON s.term_id=t.term_id
    WHERE s.term_id='FL17'; 
    
    /* query 2 */ 
    UPDATE  course SET title='Introduction to Relational Databases' WHERE course_id='CIS253'; 
    
    /* query 3 */ 
    SELECT r. section_id, course_id, COUNT(student_id) AS 'number of enrollments'
    FROM registration r
    JOIN section s ON r.section_id=s.section_id
    WHERE r.section_id=1205 AND course_id='AC265' 
    GROUP BY course_id; 
    
    /* query 4 */ 
    SELECT course_id,r.section_id,CONCAT(last_name, ", ", first_name) AS stName
    FROM registration r
    JOIN student s ON s.student_id=r.student_id
    JOIN section se ON r.section_id=se.section_id
    JOIN faculty f ON se.faculty_id=f.faculty_id
    WHERE faculty_name='Mobley'
    ORDER BY section_id;
    
    /* query 5 */
    SELECT dept_name, COUNT(faculty_id) AS 'Total instructors' 
    FROM department d
    JOIN faculty f ON d.dept_id=f.dept_id
    GROUP BY dept_name;
    
    /* query 6 */ 
    SELECT faculty_id, faculty_name, dept_id
    FROM faculty
    WHERE dept_id=1 OR dept_id=3; 
    
    /* query 7 */
    SELECT course_id, section_id, faculty_name 
    FROM term t
    JOIN section s ON s.term_id=t.term_id
    JOIN faculty f ON s.faculty_id=f.faculty_id
    WHERE term_desc='Winter 2017';
    
    /* query 8 */ 
    SELECT first_name,last_name
    FROM registration r
    JOIN student s ON r.student_id=s.student_id 
    JOIN section sec ON sec.section_id=r.section_id
    WHERE term_id='SP17' AND final_grade='A';
    
    /* query 9 */ 
	SELECT COUNT(student_id) AS 'total enrolled'
    FROM registration r
    JOIN section s ON r.section_id=s.section_id
    WHERE course_id='AC265' 
    GROUP BY course_id; 
    
    /* query 10 */ 
    SELECT title, SUM(l.capacity) AS 'Total Capacity', COUNT(section_id) AS numsections
    FROM course c
    JOIN section s ON c.course_id=s.course_id
	JOIN location l ON l.room_id=s.room_id
    GROUP BY title
    HAVING numsections>1; 

	/* query 11 */   
    CREATE OR REPLACE VIEW accounting_courses AS 
		SELECT section_id
        FROM section s
        JOIN course c ON c.course_id=s.course_id 
        JOIN department d ON c.dept_id=d.dept_id 
        JOIN term t ON s.term_id=t.term_id
        WHERE dept_name='Accounting' AND s.term_id='WN17';
    
    /* query 12 */ 
    SELECT course_id,r.section_id,COUNT(student_id) AS total_enrolled
    FROM registration r
    JOIN section s ON r.section_id=s.section_id
    GROUP BY course_id,section_id
    HAVING total_enrolled>2;
    
    /* query 13 */ 
    SELECT s.section_id,c.course_id,title
    FROM course c
    JOIN section s ON s.course_id=c.course_id;
    
    /* query 14 */
    SELECT DISTINCT section_id 
    FROM section s
    JOIN term t ON s.term_id=t.term_id
    WHERE s.term_id='SP17';
    
    /* query 15 */ 
    SELECT first_name,last_name,major_name
    FROM student s
    JOIN major m ON s.major_id=m.major_id; 
