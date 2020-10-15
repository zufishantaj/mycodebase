Fisrstly I have created a table named as 'TSERVICE' having fields - service number which is the primary key of table 
along with the departure city and destination city id and departure and arrival time.

TABLE TSERVICE(TSERVICENUM, DEPARTURE_CITY, DESTINATION_CITY, DEPARTURE_TIME, ARRIVAL_TIME)
PRIMARY KEY = (TSERVICENUM) 
 
 /* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
 
 Then service table is further normalized ino longer trip service and shorter trip services and which stores the total days in longer services while total hours in shorter services
 respectively. Both the tables has primary key of TSERVICE table as foreign key for reference.
 
TABLE LONGER_TSERVICE(TLONGER_SERVICENUM, TSERVICENUM, TOTAL_DAYS)
PRIMARY KEY = (TLONGER_SERVICENUM)
FOREIGN KEY = (TSERVICENUM) REFERENCES TSERVICE(TSERVICENUM) 
 
 /* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
 
TABLE SHORTER_TSERVICE(TSHORTER_SERVICENUM, TSERVICENUM, TOTAL_HOURS)
PRIMARY KEY = (TSHORTER_SERVICENUM)
FOREIGN KEY = (TSERVICENUM) REFERENCES TSERVICE(TSERVICENUM)
 
 /* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
 
 Further, each trip is carried out by a driver so we are maintaining individual DRIVER table in order to record the basic information about the driver.
 
TABLE DRIVER(DRI_LIC_NUMBER, ENUMBER, DRI_LIC_RENEW_DATE, FIRSTNAME, LASTNAME, PHONE, HOME_CITY)
PRIMARY KEY = (ENUMBER)
UNIQUE = (DRI_LIC_NUMBER)
 
 /* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
 
 Along with the driver, buses information are also stored in separate table.
 
TABLE BUS(REGO_NO, MAKE, SEAT_CAPACITY, FUEL_TYPE, DATE_MADE)
PRIMARY KEY = (REGO_NO)
 
 /* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
 
 I have also created a separate STOP table as mentioned in the conceptual schema for storing stoppage related information  of the trips.
 
TABLE STOP(STOP_ID, STOP_CITY, DEPARTURE_TIME, ARRIVAL_TIME, DURATION)
PRIMARY KEY = (STOP_ID)
 
 /* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */