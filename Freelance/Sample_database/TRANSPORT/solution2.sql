/* DPIT115	  		: Data Management and Security
   SESSION	  		: Spring Session 2020

   TASK		  		: Assignment 3 - Task 2
   FILE		  		: Solution 2

   STUDENT NAMES  	: <your full name>
   STUDENT NUMBER 	: <your student number>
   STUDENT EMAIL	: <your email address>
   DATE		  		: <today's date dd/mm/yyyy>						  											*/

/* (1)  First, the script inserts into a sample database information about a new trip that consist of two legs. 
        A trip must be performed by a driver who has already performed a trip on the same day. You are allowed 
        to examine the contents of a sample database to find out which driver performed at least one trip and 
        later on apply INSERT statements to insert information about the same driver who performed another trip 
        on the same day. Next, insert information about two legs that belong to the already inserted trip. 
        All other information about a new trip and its legs is up to you.                                       */
		
		INSERT INTO TRIP VALUES( 36, 10001, 'PKR768', '2020-09-22' );
		
		INSERT INTO TRIPLEG VALUES( 36, 1, 'Sydney', 'Newcastle');
        INSERT INTO TRIPLEG VALUES( 36, 2, 'Newcastle', 'Sydney');
		
		/*While inserting another trip for the same driver on same day, it shows an error below:
		
		0	240	02:01:10	INSERT INTO TRIP VALUES( 37, 10001, 'PKR768', '2020-09-22' )	
		Error Code: 1062. Duplicate entry '10001-PKR768-2020-09-22' for key 'TRIP_CKEY'	0.031 sec
		
		The error is coming because unique constraint is applied on table TRIP as there can be only a single record for one driver taking only one trip in a given date.
		
		 CONSTRAINT TRIP_CKEY UNIQUE (LNUM, REGNUM, TDATE)*/



/* (2) Next, the script creates a single column relational table MESSAGE to store variable size strings no 
       longer than 500 characters.  	   */
	   
	   CREATE TABLE MESSAGE(
         message VARCHAR(500));



/* (3)  Next, the script inserts into a relational table MESSAGE information about the contents of a sample 
        database that violate the consistency constraint.											
	
        "A driver is not allowed to perform more than 1 trip per day"

        The script must list the outcomes of verification of the consistency constraint as a single column 
        table with the following messages as the rows in the table.

        A driver <insert driving licence number here> performed more than one trip <insert trip number here>

        For example, if a driving licence number of a driver who performed more than one trip on 1 May 2019 
        is equal to 7 then verification of the consistency constraint must return the following message.

        A driver 7 performed more than one trip on 1 May 2019
	      	   	       		      	  	       	       
        Use a function CONCAT to create the messages like the one listed above.  

		*/
		
		select CONCAT("A driver ",b.enum ," performed more than one trip on ", a.tdate )
             from trip a,
	              driver b
            where a.lnum=b.lnum
         group by b.enum,a.tdate
         having count(a.tnum)>1;


/* (4)  Finally, the script makes the contents of a relational table MESSAGE permanent and lists the contents 
        of the table.    		*/
		
		INSERT INTO MESSAGE (message)
		   select CONCAT("A driver ",b.enum ," performed more than one trip on ", a.tdate )
             from trip a,
	              driver b
            where a.lnum=b.lnum
         group by b.enum,a.tdate
         having count(a.tnum)>1;
		
		select message from MESSAGE;
	
