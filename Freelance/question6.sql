1.The user ‘root’ nominates a database transport as a default database, and then the user creates
two roles ‘driver’ and ‘admin’. 

CREATE ROLE 'driver', 'admin';

2.The user ‘root’ grants read access rights to the relational tables EMPLOYEE and DRIVER to the
role ‘admin’. The read access rights cannot be propagated to other roles or users. 

GRANT SELECT ON transport.EMPLOYEE TO 'admin';
GRANT SELECT ON transport.DRIVER TO 'admin';

3.The user ‘root’ grants the rights to insert the rows into a relational tables TRIP and TRIPLEG to the
role ‘driver’. The access rights can be propagated to other roles or users. 

GRANT INSERT ON transport.TRIP TO 'driver' WITH GRANT OPTION;
GRANT INSERT ON transport.TRIPLEG TO 'driver' WITH GRANT OPTION;

4.The user ‘root’ grants the update privilege on all relational tables in the transport database to the
role ‘admin’. The privilege cannot be propagated to other roles or users. 

GRANT UPDATE ON transport.* TO 'admin';

5.The user ‘root’ grant the read access rights to information about the total number of trips
performed by each driver to a role ‘driver’. 

GRANT SELECT ON transport.DRIVER TO 'driver';
GRANT SELECT ON transport.TRIP TO 'driver';

6.The user ‘root’ creates ten (10) new users and grants the role ‘driver’ to three (3) of the users, and
the role ‘admin’ to the other users. The names and passwords of the new user accounts are up to
you.

create user 'peter' identified by 'password1';
create user 'alex' identified by 'password2';
create user 'julie' identified by 'password3';
create user 'bob' identified by 'password4';
create user 'dexter' identified by 'password5';
create user 'popeye' identified by 'password6';
create user 'kane' identified by 'password7';
create user 'harry' identified by 'password8';
create user 'elsa' identified by 'password9';
create user 'jupiter' identified by 'password10';

GRANT driver TO 'peter';
GRANT driver TO 'alex';
GRANT driver TO 'julie';

GRANT admin TO 'bob';
GRANT admin TO 'dexter';
GRANT admin TO 'popeye';
GRANT admin TO 'kane';
GRANT admin TO 'harry';
GRANT admin TO 'elsa';
GRANT admin TO 'jupiter';

7.The user ‘root’ sets the resource limits for the users created in the previous step allowing nine (9)
maximum concurrent connections. Finally, the user ‘root’ locks all the user accounts created in the
previous step. 

ALTER USER 'peter' WITH MAX_USER_CONNECTIONS 9;
ALTER USER 'alex' WITH MAX_USER_CONNECTIONS 9;
ALTER USER 'julie' WITH MAX_USER_CONNECTIONS 9;
ALTER USER 'bob' WITH MAX_USER_CONNECTIONS 9;
ALTER USER 'dexter' WITH MAX_USER_CONNECTIONS 9;
ALTER USER 'popeye' WITH MAX_USER_CONNECTIONS 9;
ALTER USER 'kane' WITH MAX_USER_CONNECTIONS 9;
ALTER USER 'harry' WITH MAX_USER_CONNECTIONS 9;
ALTER USER 'elsa' WITH MAX_USER_CONNECTIONS 9;
ALTER USER 'jupiter' WITH MAX_USER_CONNECTIONS 9;


ALTER USER 'peter' ACCOUNT LOCK;
ALTER USER 'alex' ACCOUNT LOCK;
ALTER USER 'julie' ACCOUNT LOCK;
ALTER USER 'bob' ACCOUNT LOCK;
ALTER USER 'dexter' ACCOUNT LOCK;
ALTER USER 'popeye' ACCOUNT LOCK;
ALTER USER 'kane' ACCOUNT LOCK;
ALTER USER 'harry' ACCOUNT LOCK;
ALTER USER 'elsa' ACCOUNT LOCK;
ALTER USER 'jupiter' ACCOUNT LOCK;





