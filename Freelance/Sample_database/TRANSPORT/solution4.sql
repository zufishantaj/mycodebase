/* DPIT115	  		: Data Management and Security
   SESSION	  		: Spring Session 2020

   TASK		  		: Assignment 3 - Task 4
   FILE		  		: Solution 4

   STUDENT NAMES  	: <your full name>
   STUDENT NUMBER 	: <your student number>
   STUDENT EMAIL	: <your email address>
   DATE		  		: <today's date dd/mm/yyyy>						  									*/

/* (1)	First, the script makes a relational table that contains a general log empty.					*/

        CREATE TABLE xyz001.audit_general_log (
                table_name varchar(50),
                modified_date date) ;

/* (2)  Next, the script sets the appropriate values of the variables to save a general log in 
        a relational table and to start recording a general log from now. 		                		*/
		
CREATE TRIGGER `xyz001`.`admin_AFTER_INSERT` 
AFTER 
  INSERT ON `admin` FOR EACH ROW INSERT INTO xyz001.audit_general_log(table_name, modified_date) 
values 
  (
    'Admin', 
    curdate()
  );
CREATE TRIGGER `xyz001`.`admin_AFTER_UPDATE` 
AFTER 
UPDATE 
  ON `admin` FOR EACH ROW INSERT INTO xyz001.audit_general_log(table_name, modified_date) 
values 
  (
    'Admin', 
    curdate()
  );
CREATE TRIGGER `xyz001`.`admin_AFTER_DELETE` 
AFTER 
  DELETE ON `admin` FOR EACH ROW INSERT INTO xyz001.audit_general_log(table_name, modified_date) 
values 
  (
    'Admin', 
    curdate()
  );
CREATE TRIGGER `xyz001`.`driver_AFTER_INSERT` 
AFTER 
  INSERT ON `driver` FOR EACH ROW INSERT INTO xyz001.audit_general_log(table_name, modified_date) 
values 
  (
    'Driver', 
    curdate()
  );
CREATE TRIGGER `xyz001`.`driver_AFTER_UPDATE` 
AFTER 
UPDATE 
  ON `driver` FOR EACH ROW INSERT INTO xyz001.audit_general_log(table_name, modified_date) 
values 
  (
    'Driver', 
    curdate()
  );
CREATE TRIGGER `xyz001`.`driver_AFTER_DELETE` 
AFTER 
  DELETE ON `driver` FOR EACH ROW INSERT INTO xyz001.audit_general_log(table_name, modified_date) 
values 
  (
    'Driver', 
    curdate()
  );
CREATE TRIGGER `xyz001`.`employee_AFTER_INSERT` 
AFTER 
  INSERT ON `employee` FOR EACH ROW INSERT INTO xyz001.audit_general_log(table_name, modified_date) 
values 
  (
    'Employee', 
    curdate()
  );
CREATE TRIGGER `xyz001`.`employee_AFTER_UPDATE` 
AFTER 
UPDATE 
  ON `employee` FOR EACH ROW INSERT INTO xyz001.audit_general_log(table_name, modified_date) 
values 
  (
    'Employee', 
    curdate()
  );
CREATE TRIGGER `xyz001`.`employee_AFTER_DELETE` 
AFTER 
  DELETE ON `employee` FOR EACH ROW INSERT INTO xyz001.audit_general_log(table_name, modified_date) 
values 
  (
    'Employee', 
    curdate()
  );
CREATE TRIGGER `xyz001`.`trip_AFTER_INSERT` 
AFTER 
  INSERT ON `trip` FOR EACH ROW INSERT INTO xyz001.audit_general_log(table_name, modified_date) 
values 
  (
    'Trip', 
    curdate()
  );
CREATE TRIGGER `xyz001`.`trip_AFTER_UPDATE` 
AFTER 
UPDATE 
  ON `trip` FOR EACH ROW INSERT INTO xyz001.audit_general_log(table_name, modified_date) 
values 
  (
    'Trip', 
    curdate()
  );
CREATE TRIGGER `xyz001`.`trip_AFTER_DELETE` 
AFTER 
  DELETE ON `trip` FOR EACH ROW INSERT INTO xyz001.audit_general_log(table_name, modified_date) 
values 
  (
    'Trip', 
    curdate()
  );
CREATE TRIGGER `xyz001`.`tripleg_AFTER_INSERT` 
AFTER 
  INSERT ON `tripleg` FOR EACH ROW INSERT INTO xyz001.audit_general_log(table_name, modified_date) 
values 
  (
    'Trip_leg', 
    curdate()
  );
CREATE TRIGGER `xyz001`.`tripleg_AFTER_UPDATE` 
AFTER 
UPDATE 
  ON `tripleg` FOR EACH ROW INSERT INTO xyz001.audit_general_log(table_name, modified_date) 
values 
  (
    'Trip_leg', 
    curdate()
  );
CREATE TRIGGER `xyz001`.`tripleg_AFTER_DELETE` 
AFTER 
  DELETE ON `tripleg` FOR EACH ROW INSERT INTO xyz001.audit_general_log(table_name, modified_date) 
values 
  (
    'Trip_leg', 
    curdate()
  );
CREATE TRIGGER `xyz001`.`truck_AFTER_INSERT` 
AFTER 
  INSERT ON `truck` FOR EACH ROW INSERT INTO xyz001.audit_general_log(table_name, modified_date) 
values 
  (
    'Truck', 
    curdate()
  );
CREATE TRIGGER `xyz001`.`truck_AFTER_UPDATE` 
AFTER 
UPDATE 
  ON `truck` FOR EACH ROW INSERT INTO xyz001.audit_general_log(table_name, modified_date) 
values 
  (
    'Truck', 
    curdate()
  );
CREATE TRIGGER `xyz001`.`truck_AFTER_DELETE` 
AFTER 
  DELETE ON `truck` FOR EACH ROW INSERT INTO xyz001.audit_general_log(table_name, modified_date) 
values 
  (
    'Truck', 
    curdate()
  );

	



/* (3) Next, the script makes a database csit115 a default database, it stops recording a report, 
       it executes a script file workload.sql, and it resumes recording a report into a file 
       solution3.rpt. 	   */

       CREATE DATABASE csit115;
	   
	   /*Executed script file workload.sql*/

/* (4)	Next, the script sets the appropriate values of all variables to stop recording a general log 
        from now.																						*/

DROP TRIGGER IF EXISTS `xyz001`.`admin_AFTER_INSERT`;
DROP TRIGGER IF EXISTS `xyz001`.`admin_AFTER_UPDATE`;
DROP TRIGGER IF EXISTS `xyz001`.`admin_AFTER_DELETE`;
DROP TRIGGER IF EXISTS `xyz001`.`driver_AFTER_INSERT`;
DROP TRIGGER IF EXISTS `xyz001`.`driver_AFTER_UPDATE`;
DROP TRIGGER IF EXISTS `xyz001`.`driver_AFTER_DELETE`;
DROP TRIGGER IF EXISTS `xyz001`.`employee_AFTER_INSERT`;
DROP TRIGGER IF EXISTS `xyz001`.`employee_AFTER_UPDATE`;
DROP TRIGGER IF EXISTS `xyz001`.`employee_AFTER_DELETE`;
DROP TRIGGER IF EXISTS `xyz001`.`trip_AFTER_INSERT`;
DROP TRIGGER IF EXISTS `xyz001`.`trip_AFTER_UPDATE`;
DROP TRIGGER IF EXISTS `xyz001`.`trip_AFTER_DELETE`;
DROP TRIGGER IF EXISTS `xyz001`.`tripleg_AFTER_INSERT`;
DROP TRIGGER IF EXISTS `xyz001`.`tripleg_AFTER_UPDATE`;
DROP TRIGGER IF EXISTS `xyz001`.`tripleg_AFTER_DELETE`;
DROP TRIGGER IF EXISTS `xyz001`.`truck_AFTER_INSERT`;
DROP TRIGGER IF EXISTS `xyz001`.`truck_AFTER_UPDATE`;
DROP TRIGGER IF EXISTS `xyz001`.`truck_AFTER_DELETE`;

/* (5)	Finally, the script finds and lists how many times each one of the relational tables included 
        in a sample database have been used by the successfully processed SQL statements included in 
        SQL script workload.sql. You have to consider the relational tables with the following names 
        EMPLOYEE, DRIVER, ADMIN, TRUCK, TRIP, and TRIPLEG and no other relational tables. The script 
        must list the names of relational tables together with the total number of times each table 
        has been used. Please, find a fragment of a sample output listed below.

        +------------+-------+
        | TABLE_NAME | TOTAL |
        +------------+-------+
        | EMPLOYEE   |     5 |
        | TRIP       |     3 |
          ...             ...
        +------------+-------+
        6 rows in set (0.01 sec)

        To simplify this task, assume that a relational table is used at most one time in SQL 
        statement. 

        The results must be listed in the descing order of the total number of times each one 
        of the relational tables has been used by the successfully processed SQL statements included 
        in a script workload.sql. Note, that some of SQL statements included in a script workload.sql 
        cannot be successfully processed and because of that counting the total number of names of 
        relational tables in the script does not provide the correct results. To find the correct 
        results you must access an earlier recorded general log.      	                                */

        select table_name, count(*) total
          from xyz001.audit_general_log
        group by table_name;
