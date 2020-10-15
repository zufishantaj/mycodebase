/* DPIT115	  		: Data Management and Security
   SESSION	  		: Spring Session 2020

   TASK		  		: Assignment 3 - Task 3
   FILE		  		: Solution 3

   STUDENT NAMES  	: <your full name>
   STUDENT NUMBER 	: <your student number>
   STUDENT EMAIL	: <your email address>
   DATE		  		: <today's date dd/mm/yyyy>						  											*/

/* (1)  Create a relational table OLD_DRIVER that has the same columns as a relational table DRIVER. Enforce 
        appropriate consistency constraints for a relational table OLD_DRIVER.                               	*/

        CREATE TABLE OLD_DRIVER LIKE xyz001.driver;

/* (2)  Use a backup file old_driver.bak to load the old pre 31 May 2015 contents of a relational table 
        DRIVER into a relational table OLD_DRIVER.                                                           	*/
		
	/*
	Restoring the old_driver data to new database from .bak file	
	We can use the following command
	mysql -u root xyz001 < ../old_driver.bak
	/*

/* (3)  Use SELECT statements to list the employee numbers and driving license numbers of drivers and who 
        left the transportation company after 31 May 2015. 		*/
		
		select a.enum, b.lnum
          from employee a,
	           driver b
         where a.enum=b.enum
           and (select max(tdate) from trip where lnum=b.lnum)<'2015-05-31';



/* (4)  Use SELECT statements to list the employee numbers, driving license numbers, first name and last 
        name of drivers and joined the transportation company after 31 May 2015.                             	*/
	
          select   a.enum, b.lnum, a.fname, a.lname
            from employee a,
	             driver b
           where a.enum=b.enum
             and (select min(tdate) from trip where lnum=b.lnum)>'2015-05-31';