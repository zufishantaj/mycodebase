 1.A new trip has been completed today. The trip was from Sydney to Wollongong. The trip has been
performed by the driver with the licence number 432908 (column LICENSENUM in a relational table
TRIP) who used the truck with registration number AB08CD. Insert the appropriate information into
the sample database assuming the next trip number is 1201. 

 
 INSERT INTO EMPLOYEE VALUES( 11, 'Lars', 'Peterson', NULL);
 INSERT INTO DRIVER VALUES( 11, 432908, 'AVAILABLE' );
 INSERT INTO TRUCK VALUES( 'AB08CD', 50000, 5000, 'AVAILABLE' );
 INSERT INTO TRIP VALUES( 1201, 432908, 'AB08CD', '2020-10-12' );
 INSERT INTO TRIPLEG VALUES( 1201, 1, 'Sydney', 'Wollongong');
 
 2.Delete the information from the database about trip number 60. Remember, that the foreign keys in
all CREATE TABLE statements have no ON DELETE CASCADE clause. 

 
 DELETE FROM TRIPLEG WHERE TRIPNUM=60;
 DELETE FROM TRIP WHERE TRIPNUM=60;
 
 3.Change the status of all the drivers who have performed more than 110 trips to be ON LEAVE. 
 
UPDATE DRIVER, (select LICENSENUM, count(*) from TRIP group by LICENSENUM having count(*)>110) as t2
SET    DRIVER.STATUS='ON LEAVE'
WHERE  DRIVER.LICENSENUM = t2.LICENSENUM;

4.Copy information about all employees born before the year 2000 to a new table E20CENT.
There is no need to enforce any consistency constraints on the new table. 


CREATE TABLE IF NOT EXISTS E20CENT LIKE EMPLOYEE;

INSERT INTO E20CENT
SELECT * FROM EMPLOYEE WHERE DATE_FORMAT(DOB, "%Y")<2000;

