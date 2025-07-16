START TRANSACTION;

DROP TABLE IF EXISTS user_accounts;

CREATE TABLE user_accounts (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    firstName VARCHAR(31) NOT NULL,
    lastName VARCHAR(31) NOT NULL,
    email VARCHAR(50) NOT NULL,
    username VARCHAR(31) NOT NULL,
	password VARCHAR(31) NOT NULL,
    recentActivity VARCHAR(50) NOT NULL
    );
    
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
    
    
    
    
