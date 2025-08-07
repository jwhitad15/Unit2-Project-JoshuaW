START TRANSACTION;

DROP TABLE IF EXISTS user_accounts;

CREATE TABLE user_accounts (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    firstName VARCHAR(31) NOT NULL,
    lastName VARCHAR(31) NOT NULL,
    email VARCHAR(50) NOT NULL,
    username VARCHAR(31) NOT NULL,
	password VARCHAR(31) NOT NULL
    );
    
INSERT INTO user_accounts (firstName, lastName, email, username, password) VALUES 
	('Joshua', 'White', 'jwhite@gmail.com', 'jwhitad15', 'Kcjlw157!'),
    ('Justin', 'White', 'jawhite@gmail.com', 'jaw.112', 'Jaw98!'),
    ('Joshua', 'White', 'lmwhite@gmail.com', 'agentL', 'Lmw1224!');
    
CREATE TABLE login_activity (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    timestamp VARCHAR(50) NOT NULL,
    type VARCHAR(31) NOT NULL,
	description VARCHAR(100)
    );
    
CREATE TABLE scope_activity (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    timestamp VARCHAR(50) NOT NULL,
    type VARCHAR(31) NOT NULL,
    userInput VARCHAR(100),
	description VARCHAR(100)
    );
    
CREATE TABLE game_activity (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    game VARCHAR(31) NOT NULL,
    mode VARCHAR(31) NOT NULL,
    score INT NOT NULL,
    completion BOOLEAN NOT NULL,
    timestamp VARCHAR(50) NOT NULL,
	description VARCHAR(100)
    );
    
UPDATE user_accounts SET email = 'jwhite@gmail.com' WHERE firstName = 'Joshua';
UPDATE user_accounts SET email = 'jawhite@gmail.com' WHERE firstName = 'Justin';
UPDATE user_accounts SET email = 'lmwhite@gmail.com' WHERE firstName = 'Lauren';

SELECT * FROM user_accounts;

INSERT INTO user_accounts (firstName, lastName, email, username, password) VALUES 
	('Lisa', 'White', 'lwhite@gmail.com', 'childofGod', '123!'),
    ('Anthony', 'White', 'twhite@gmail.com', 'tbird', '123!'),
    ('Charles', 'Thomas', 'cthomas@gmail.com', 'teflonChuck', '123!'),
	('Sinai', 'Thomas', 'stthomas@gmail.com', 'st.thomas', '123!'),
    ('Alysia', 'White', 'awhite@gmail.com', 'bigLeesh', '123!'),
    ('Cameron', 'White', 'cwhite@gmail.com', 'cdub97', '123!'),
    ('Frankie', 'White', 'franklinmilo@gmail.com', 'frankfurt', '123!'),
    ('Deuce', 'Thomas', 'deuceydeu@gmail.com', 'deucedeuce', '123!!'),
    ('Eddie', 'Kane', 'eddieK@gmail.com', 'eddieKane', '123!');

SELECT * FROM user_accounts;

UPDATE user_accounts SET firstName = 'Lauren', lastName = 'Thomas'  WHERE username = 'agentL';

CREATE TABLE generic_activity (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    type VARCHAR(50) NOT NULL,
    timestamp VARCHAR(50) NOT NULL
    );
    
    CREATE TABLE fruit_category (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    fruit VARCHAR(50) NOT NULL
    );
    
INSERT INTO fruit_category (fruit) VALUES 
	('Faith'), ('Love'), ('Joy'), ('Peace'), ('Temperance'), ('Goodness'), ('Gentleness'), ('Meekness'), ('Longsuffering');

ALTER TABLE game_activity ADD UserID VARCHAR(31);    
ALTER TABLE game_activity ADD ActivityID VARCHAR(31); 
ALTER TABLE scope_activity ADD UserID VARCHAR(31);    
ALTER TABLE scope_activity ADD ActivityID VARCHAR(31); 
ALTER TABLE login_activity ADD UserID VARCHAR(31);    
ALTER TABLE login_activity ADD ActivityID VARCHAR(31); 

INSERT INTO user_accounts (firstName, lastName, email, username, password) VALUES 
	('Joshua', 'White', 'jwhite@gmail.com', 'admin_joshua', 'Admin:joshua!'),
<<<<<<< Updated upstream
    ('Lauren', 'Thomas', 'lwhite@gmail.com', 'admin_l', 'Admin:l')
=======
    ('Lauren', 'Thomas', 'lwhite@gmail.com', 'admin_l', 'Admin:l');
>>>>>>> Stashed changes
