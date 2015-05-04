DROP TABLE IF EXISTS USERS;

Create Table USERS(
	userId		varchar(12)		NOT NULL,
	password	varchar(12)		NOT NULL,
	name		varchar(20)		NOT NULL,
	email		varchar(50),
	PRIMARY KEY (userId)
);


INSERT INTO USERS VALUES('giyatto', 'password', '기얏토', 'giyatto@nhnnext.org');