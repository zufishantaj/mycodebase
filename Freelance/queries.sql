--Question 2: Based on the ER diagram, design a well normalised (3NF) relational database to store the information. Make sure that the translation captures key constraints (primary keys, foreign keys, etc).  You must provide the relational schema for this database and then implement it in a DBMS such as MySQL.
--Answer 2: Creating normalised tables using MySQL.
--1.AUTHOR
CREATE TABLE AUTHOR( 
                 AUTHOR_ID   INT(6)  NOT NULL AUTO_INCREMENT,  /* Author ID  */ 
                 AUTHOR_NAME  VARCHAR(50)  NOT NULL,  /* Author Name  */
                 PRIMARY KEY(AUTHOR_ID)
              );
--Enter sample data in  table (minimum THREE (3) rows per table).

INSERT INTO AUTHOR VALUES(1, 'Jane Austin');   
INSERT INTO AUTHOR VALUES(2, 'J .K. Rowling'); 
INSERT INTO AUTHOR VALUES(3, 'APJ Abdul Kalam'); 
INSERT INTO AUTHOR VALUES(4, 'Stephen King'); 

--2.GENRES
CREATE TABLE GENRES( 
                 GENRE_ID   INT(6)  NOT NULL AUTO_INCREMENT,  /* Genre ID  */ 
                 GENRES  VARCHAR(50)  NOT NULL,  /* Genre  */
                 PRIMARY KEY(GENRE_ID)
              );

--Enter sample data in table (minimum THREE (3) rows per table).
INSERT INTO GENRES VALUES(1, 'Fiction');   
INSERT INTO GENRES VALUES(2,'Novel'); 
INSERT INTO GENRES  VALUES(3, 'Autobiography'); 
INSERT INTO GENRES VALUES(4,'Thriller');  

--3.PUBLISHER
CREATE TABLE PUBLISHER( 
                 PUBLISHER_ID   INT(6)  NOT NULL AUTO_INCREMENT,  /* Publisher ID  */ 
                 PUBLISHER_NAME VARCHAR(50)  NOT NULL,  /* Publisher Name  */
                 PRIMARY KEY(PUBLISHER_ID)
              );

--Enter sample data in table (minimum THREE (3) rows per table).
INSERT INTO PUBLISHER VALUES(1, 'T. Egerton');   
INSERT INTO PUBLISHER VALUES(2,'Universities Press'); 
INSERT INTO PUBLISHER  VALUES(3,'John Murray'); 
INSERT INTO PUBLISHER VALUES(4,'Bloomsbury');

--4.BOOK
CREATE TABLE BOOK( 
                 BOOK_ID   INT(6)  NOT NULL AUTO_INCREMENT,  /*Book ID  */ 
                 BOOK_NAME  VARCHAR(50)  NOT NULL,  /*Book Name  */
                 AUTHOR_ID INT(6) NOT NULL, /* Book Author */
                 GENRE_ID INT(6) NOT NULL, /* Genre ID */
                  PUBLISHER_ID INT(6) NOT NULL, /* Publisher ID */ 
                 YEAR INT(4) NOT NULL, /* Year */
                 PRIMARY KEY(BOOK_ID),
                 FOREIGN KEY (AUTHOR_ID)
                 REFERENCES AUTHOR(AUTHOR_ID),
                 FOREIGN KEY (GENRE_ID)
                 REFERENCES GENRES(GENRE_ID),
                 FOREIGN KEY (PUBLISHER_ID)
                 REFERENCES PUBLISHER(PUBLISHER_ID)
  );
--Enter sample data in table (minimum THREE (3) rows per table).
INSERT INTO BOOK VALUES(1,'Pride and Prejudice', 1, 2, 1,2018);
INSERT INTO BOOK VALUES(2, 'Sense and Sensibility',1,2, 1,2019);
INSERT INTO BOOK VALUES(3, 'Harry Potter and the Philosophers Stone',2,1, 4,2018);
INSERT INTO BOOK VALUES(4, 'Harry Potter and the Goblet of Fire',2,1, 4,2018);
INSERT INTO BOOK VALUES(5, 'Wings of Fire',3,3,2, 2018);
INSERT INTO BOOK VALUES(6, 'Misery',4, 4, 1,2019);
INSERT INTO BOOK VALUES(7, 'The Outsider',4 ,4, 3,2018);
INSERT INTO BOOK VALUES(8, 'Mr Mercedes',4 ,4,3, 2018);
INSERT INTO BOOK VALUES(9, 'Mystery without Murder',1, 4,2, 2018);
INSERT INTO BOOK VALUES(10, 'Emma',1,1,3, 2018);

--5.READER
CREATE TABLE READER( 
                 READER_ID   INT(6)  NOT NULL AUTO_INCREMENT,  /*Reader ID  */ 
                 READER_NAME  VARCHAR(50)  NOT NULL,  /*Reader Name  */
                 AGE INT(10) NOT NULL, /* Age*/
                 ADDRESS VARCHAR(50), /* Reader Address */
                PRIMARY KEY(READER_ID)
              );

--Enter sample data in table (minimum THREE (3) rows per table).
INSERT INTO READER VALUES(1, 'Ajay', 25, 'xyz apartment');
INSERT INTO READER VALUES(2, 'Geeta', 28,'qbz road');
INSERT INTO READER VALUES(3, 'Prakash', 32,'mg marg');

--6.RATING
CREATE TABLE RATING( 
                 RATING_ID   INT(6)  NOT NULL AUTO_INCREMENT,  /*Rating ID  */ 
                 RATING  INT(2)  NOT NULL,  /* Rating */
                 COMMENT VARCHAR(50), /* Review */
                 READER_ID INT(6) NOT NULL, /* Reader ID */
                 BOOK_ID INT(6) NOT NULL, /* Book ID */
                 RATING_DATE DATE NOT NULL, /* Date*/
                 PRIMARY KEY(RATING_ID),
                 FOREIGN KEY (READER_ID)
                 REFERENCES READER(READER_ID),
                 FOREIGN KEY (BOOK_ID)
                 REFERENCES BOOK(BOOK_ID),
       CHECK (0<RATING<=10)
              );

--Enter sample data in table (minimum THREE (3) rows per table).
INSERT INTO RATING VALUES(1, 9, 'must read', 1,5,now());
INSERT INTO RATING VALUES(2, 10, 'excellent', 2,4,now()); 
INSERT INTO RATING VALUES(3, 5, 'nice', 3,2,now());




--Question 3: Find the number of books by genre.
--Answer 3:
SELECT g.genre_id, g.genres, count(b.book_id) no_of_books
FROM GENRES AS g
INNER JOIN BOOK AS b on b.genre_id = g.genre_id
GROUP BY g.genre_id, g.genres;

--Question 4: Find the top-rated books. Top rated books are defined as the ones with the highest average rating.
--Answer 4:
SELECT a.book_id,  a.book_name, round(avg(b.rating),2) avg_rating
FROM BOOK AS a
LEFT JOIN RATING AS b on b.book_id = a.book_id
GROUP BY a.book_id, a.book_name
ORDER BY avg_rating DESC LIMIT 1;

--Question 5: List details of each reader, along with the number of reviews that customer has submitted.
--Answer 5:
SELECT a.reader_id, a.reader_name, a.age, a.address, count(b.reader_id) no_of_reviews
FROM READER AS a
INNER JOIN RATING AS b on b.reader_id = a.reader_id
GROUP BY a.reader_id, a.reader_name, a.age, a.address;

--Question 6: For each book, list its name, author, publisher, year, along with details of each review. Review details should include: the name of the customer who submitted the review, the date of the review, and the rating given.
--Answer 6:
SELECT a.book_id, a.book_name, d.author_name, e.publisher_name, a.year, c.reader_name,b.rating, b.rating_date
FROM BOOK a,
            RATING b,
            READER c,
            AUTHOR d,
            PUBLISHER e
WHERE a.book_id=b.book_id
AND b.reader_id=c.reader_id
AND a.author_id=d.author_id
AND a.publisher_id=e.publisher_id;

--Question 7: List the top ten books by genre that have a rating of 8 or more, published between 2018 and 2019, with at least 10 reviews.
--Answer 7:
SELECT c.genres, a.book_name, count(b.BOOK_ID) 
FROM BOOK a, 
            RATING b, 
            GENRES c 
WHERE a.book_id=b.book_id 
AND a.genre_id=c.genre_id 
AND b.rating >=8 
AND a.year between 2018 and 2019 
having count(b.BOOK_ID)>=10;


