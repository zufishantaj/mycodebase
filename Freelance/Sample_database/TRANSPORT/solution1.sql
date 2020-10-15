/* DPIT115	  		: Data Management and Security
   SESSION	  		: Spring Session 2020

   TASK		  		: Assignment 3 - Task 1
   FILE		  		: Solution 1

   STUDENT NAMES  	: <your full name>
   STUDENT NUMBER 	: <your student number>
   STUDENT EMAIL	: <your email address>
   DATE		  		: <today's date dd/mm/yyyy>						  								*/

/* (1)	Create a database with the same name as a prefix of your University email account. 
        For example, if your University email account is xyz007@uow.edu.au then a name of 
        a database should be xyz007. 													0.1 mark	*/

        CREATE DATABASE xyz001;
        use xyz001;


/* (2)	Create two new user accounts. The names of user accounts and the passwords are up to you. 
																						0.1 mark	*/
        create user 'peter' identified by 'password1';
        CREATE USER 'alex' IDENTIFIED BY 'password2';


/* (3)	While connected as a user root, process the scripts dbcreate.sql and dbload.sql to create 
        and to load data into the relational tables later on used in this laboratory class. 
        All relational tables must be located in a database created in step (1). A listing of SQL 
        statements processed by the scripts must NOT be included in a report from processing of 
        a script solution1.sql. It means that before processing of the script you must process 
        notee statement to turn the spooling off and after processing of the scripts you must 
        process a statement tee solution1.rpt to turn the spooling on into a report file. 						
																						0.1 mark	*/
																							
		/*
		
		mysql> notee
		Outfile disabled.
		
		
		mysql> tee solution1.rpt
		Logging to file 'solution1.rpt'
		*/
		


/* (4)	Next, create two new roles: driver and admin and grant to a role admin the read 
        privileges on the entire database. The privileges must be granted such that any owner 
        of a role admin cannot grant the same privileges to another role 
        user. 			0.2 mark	*/

        CREATE ROLE 'driver', 'admin';
        GRANT SELECT ON xyz001.* TO 'admin';

/* (5)	Next, grant to a role driver a read privilege on a relational table DRIVER located 
        in the database. A privilege must be granted such that any owner of a role driver 
        can grant the same privileges to another role or user.	       					0.2 mark	*/                      

        GRANT SELECT ON xyz001.driver TO 'driver' WITH GRANT OPTION;

/* (6)	Next, grant to a role driver the read and write privileges on the relational table 
        TRIPLEG located in the database. The privileges must be granted such that any owner 
        of a role driver cannot grant the same privileges to another role or user.		0.2 mark	*/

        GRANT SELECT ON xyz001.tripleg TO 'driver';
        GRANT INSERT, UPDATE, DELETE ON xyz001.tripleg TO 'driver';

/* (7)	Next, grant to a role driver a read privilege on the columns FNAME, INITIALS, LNAME 
        in a relational table EMPLOYEE. A privilege must be granted such that any owner of 
        a role driver cannot grant the same privilege to another role or user.			0.2 mark	*/

CREATE VIEW driver_EMPLOYEE AS
    SELECT 
        FNAME, INITIALS, LNAME
    FROM
        EMPLOYEE;
   
        GRANT SELECT ON driver_EMPLOYEE TO 'driver';


/* (8)	Next, grant to a role admin an insert privilege on a relational table EMPLOYEE. 
        A privilege must be granted such that any owner of a role admin can propagate 
        the same privilege to another role or user.                    					0.2 mark	*/

        GRANT INSERT ON EMPLOYEE TO 'admin';

/* (9)	Next, grant to a role admin a privilege to create relational tables located in 
        the database. The privileges must be granted such that any owner of a role admin 
        cannot grant the same privileges to another role or user.      					0.2 mark    */

        GRANT CREATE ON xyz001.* TO 'admin';

/* (10)	Next, grant to a role admin a privilege to create relational views located in 
        the database. The privileges must be granted such that any owner of a role admin 
        cannot grant the same privileges to another role or user.      					0.2 mark	*/

        GRANT CREATE VIEW ON xyz001.* TO 'admin';

/* (12)	Next, grant to a role admin a read privilege on information about the trips completed 
        in 2018. A hint is on create a relational view and grant a read privilege on the view. 
        A privilege must be granted such that any owner of a role admin cannot grant the same 
        privilege to another role or user.		               							0.3 mark	*/
        
		CREATE VIEW trip_in_2018 AS
    SELECT 
        *
    FROM
        xyz001.trip
    WHERE
        EXTRACT(YEAR FROM TDATE) = '2018';
   
        GRANT SELECT ON trip_in_2018 TO 'admin';


/* (13)	Next, grant a role driver to a role admin and then grant a role admin to one of 
        the users created in step (2) and a role driver to another user.	
																						0.1 mark	*/

        GRANT driver to admin;

        GRANT admin TO 'peter';
        GRANT driver TO 'alex';

/* (14)	Next, set a resource limit on maximum total number of concurrent connections available 
        to both users created in step (2). The maximum number of concurrent connections is up 
        to you. 						       											0.2 mark	*/                               


        ALTER USER 'peter' WITH MAX_USER_CONNECTIONS 10;
        ALTER USER 'alex' WITH MAX_USER_CONNECTIONS 50;


/* (15)	Finally, lock the accounts of the new users.		       						0.1 mark	*/

       CREATE USER 'jeff' IDENTIFIED BY 'password3'
       ACCOUNT LOCK;

