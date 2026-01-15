SET FOREIGN_KEY_CHECKS=0;

/*
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(520) NOT NULL,
  `first_name` varchar(310) NOT NULL,
  `last_name` varchar(310) NOT NULL,
  `password` varchar(310) NOT NULL,
  `username` varchar(310) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `account_expiry_date` date DEFAULT NULL,
  `account_non_expired` bit(1) NOT NULL,
  `account_non_locked` bit(1) NOT NULL,
  `create_date` datetime(6) DEFAULT NULL,
  `credentials_expiry_date` date DEFAULT NULL,
  `credentials_non_expired` bit(1) NOT NULL,
  `is_two_factor_enabled` bit(1) NOT NULL,
  `sign_up_method` varchar(255) DEFAULT NULL,
  `two_factor_secret` varchar(255) DEFAULT NULL,
  `updated_date` datetime(6) DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKsb8bbouer5wak8vyiiy4pf2bx` (`username`),
  UNIQUE KEY `UKob8kqyqqgmefl0aco34akdtpe` (`email`),
  KEY `FK60qlg9oata44io3a80yh31536` (`role_id`),
  CONSTRAINT `FK60qlg9oata44io3a80yh31536` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `scripture` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(255) DEFAULT NULL,
  `fruit` varchar(255) DEFAULT NULL,
  `lod` varchar(255) DEFAULT NULL,
  `scripture` varchar(255) DEFAULT NULL,
  `translation` varchar(255) DEFAULT NULL,
  `verse` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `question` (
  `id` int NOT NULL AUTO_INCREMENT,
  `questions` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `lod` varchar(255) DEFAULT NULL,
  `translation` varchar(255) DEFAULT NULL,
  `fruit` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `roles` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` enum('ROLES_ADMIN','ROLES_USER') DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `login_activity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `timestamp` varchar(50) NOT NULL,
  `type` varchar(31) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `UserID` varchar(31) DEFAULT NULL,
  `ActivityID` varchar(31) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `activity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `timestamp` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `faith_multichoice` (
  `QUESTIONS` text,
  `ANSWER` text,
  `LOD` text,
  `TRANSLATION` text,
  `FRUIT` text,
  `CATEGORY` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `faith_scripture` (
  `VERSE` text,
  `SCRIPTURE` text,
  `LOD` text,
  `TRANSLATION` text,
  `FRUIT` text,
  `CATEGORY` text,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `fruit_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fruit` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `game_activity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `game` varchar(31) NOT NULL,
  `mode` varchar(31) NOT NULL,
  `score` int NOT NULL,
  `completion` tinyint(1) NOT NULL,
  `timestamp` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `UserID` varchar(31) DEFAULT NULL,
  `ActivityID` varchar(31) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `gentleness_multichoice` (
  `QUESTIONS` text,
  `ANSWER` text,
  `LOD` text,
  `TRANSLATION` text,
  `FRUIT` text,
  `CATEGORY` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `gentleness_scripture` (
  `VERSE` text,
  `SCRIPTURE` text,
  `LOD` text,
  `TRANSLATION` text,
  `FRUIT` text,
  `CATEGORY` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `goodness_multichoice` (
  `QUESTIONS` text,
  `ANSWER` text,
  `LOD` text,
  `TRANSLATION` text,
  `FRUIT` text,
  `CATEGORY` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `goodness_scripture` (
  `VERSE` text,
  `SCRIPTURE` text,
  `LOD` text,
  `TRANSLATION` text,
  `FRUIT` text,
  `CATEGORY` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `joy_multichoice` (
  `QUESTIONS` text,
  `ANSWER` text,
  `LOD` text,
  `TRANSLATION` text,
  `FRUIT` text,
  `CATEGORY` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `joy_scripture` (
  `VERSE` text,
  `SCRIPTURE` text,
  `LOD` text,
  `TRANSLATION` text,
  `FRUIT` text,
  `CATEGORY` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `longsuffering_multichoice` (
  `QUESTIONS` text,
  `ANSWER` text,
  `LOD` text,
  `TRANSLATION` text,
  `FRUIT` text,
  `CATEGORY` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `longsuffering_scripture` (
  `VERSE` text,
  `SCRIPTURE` text,
  `LOD` text,
  `TRANSLATION` text,
  `FRUIT` text,
  `CATEGORY` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `love_multichoice` (
  `QUESTIONS` text,
  `ANSWER` text,
  `LOD` text,
  `TRANSLATION` text,
  `FRUIT` text,
  `CATEGORY` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `love_scripture` (
  `VERSE` text,
  `SCRIPTURE` text,
  `LOD` text,
  `TRANSLATION` text,
  `FRUIT` text,
  `CATEGORY` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `meekness_multichoice` (
  `QUESTIONS` text,
  `ANSWER` text,
  `LOD` text,
  `TRANSLATION` text,
  `FRUIT` text,
  `CATEGORY` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `meekness_scripture` (
  `VERSE` text,
  `SCRIPTURE` text,
  `LOD` text,
  `TRANSLATION` text,
  `FRUIT` text,
  `CATEGORY` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `peace_multichoice` (
  `QUESTIONS` text,
  `ANSWER` text,
  `LOD` text,
  `TRANSLATION` text,
  `FRUIT` text,
  `CATEGORY` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `peace_scripture` (
  `VERSE` text,
  `SCRIPTURE` text,
  `LOD` text,
  `TRANSLATION` text,
  `FRUIT` text,
  `CATEGORY` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `scope_activity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `timestamp` varchar(50) NOT NULL,
  `type` varchar(31) NOT NULL,
  `userInput` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `UserID` varchar(31) DEFAULT NULL,
  `ActivityID` varchar(31) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `temperance_multichoice` (
  `QUESTIONS` text,
  `ANSWER` text,
  `LOD` text,
  `TRANSLATION` text,
  `FRUIT` text,
  `CATEGORY` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `temperance_scripture` (
  `VERSE` text,
  `SCRIPTURE` text,
  `LOD` text,
  `TRANSLATION` text,
  `FRUIT` text,
  `CATEGORY` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `user_activity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `timestamp` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `user_profile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKtcks72p02h4dp13cbhxne17ad` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
*/

TRUNCATE TABLE roles;
TRUNCATE TABLE user;
TRUNCATE TABLE fruit_category;
TRUNCATE TABLE scripture;
TRUNCATE TABLE question;
TRUNCATE TABLE faith_scripture;
TRUNCATE TABLE gentleness_scripture;
TRUNCATE TABLE goodness_scripture;
TRUNCATE TABLE joy_scripture;
TRUNCATE TABLE love_scripture;
TRUNCATE TABLE meekness_scripture;
TRUNCATE TABLE peace_scripture;
TRUNCATE TABLE temperance_scripture;
TRUNCATE TABLE longsuffering_scripture;
TRUNCATE TABLE faith_multichoice;
TRUNCATE TABLE gentleness_multichoice;
TRUNCATE TABLE goodness_multichoice;
TRUNCATE TABLE longsuffering_multichoice;
TRUNCATE TABLE joy_multichoice;
TRUNCATE TABLE meekness_multichoice;
TRUNCATE TABLE peace_multichoice;
TRUNCATE TABLE temperance_multichoice;
TRUNCATE TABLE love_multichoice;

INSERT INTO `roles` (`role_id`,`role_name`) VALUES (1,'ROLES_USER');
INSERT INTO `roles` (`role_id`,`role_name`) VALUES (2,'ROLES_ADMIN');

INSERT INTO `user` (`id`,`email`,`first_name`,`last_name`,`password`,`username`,`enabled`,`account_expiry_date`,`account_non_expired`,`account_non_locked`,`create_date`,`credentials_expiry_date`,`credentials_non_expired`,`is_two_factor_enabled`,`sign_up_method`,`two_factor_secret`,`updated_date`,`role_id`) VALUES (2,'jwhite@gmail.com','Joshua','White','$2a$10$0b8kfYtfUWncFZ.opkXDquSEF8MVLqKDXoeo/iFQEtL2aRtiHPESS','admin_joshua',1,NULL,0,0,NULL,NULL,0,0,NULL,NULL,'2025-12-09 04:36:12.667004',NULL);
INSERT INTO `user` (`id`,`email`,`first_name`,`last_name`,`password`,`username`,`enabled`,`account_expiry_date`,`account_non_expired`,`account_non_locked`,`create_date`,`credentials_expiry_date`,`credentials_non_expired`,`is_two_factor_enabled`,`sign_up_method`,`two_factor_secret`,`updated_date`,`role_id`) VALUES (3,'jawhite@gmail.com','Justin','White','$2a$10$B2K4Jl3ZmEhiaDTyAgjv4OvKbXY/yK4/cmysJ4fKI5sr4k/QeoGk.','admin_jaw',1,NULL,0,0,NULL,NULL,0,0,NULL,NULL,'2025-12-09 04:36:12.735742',NULL);
INSERT INTO `user` (`id`,`email`,`first_name`,`last_name`,`password`,`username`,`enabled`,`account_expiry_date`,`account_non_expired`,`account_non_locked`,`create_date`,`credentials_expiry_date`,`credentials_non_expired`,`is_two_factor_enabled`,`sign_up_method`,`two_factor_secret`,`updated_date`,`role_id`) VALUES (4,'lmwhite@gmail.com','Lauren','Thomas','$2a$10$grdaMUGu4qAUIoGB4ZlMSOqhbb91QXEj2bFttj1aEMXy1vJKhiD.q','admin_l',1,NULL,0,0,NULL,NULL,0,0,NULL,NULL,'2025-12-09 04:36:12.792482',NULL);
INSERT INTO `user` (`id`,`email`,`first_name`,`last_name`,`password`,`username`,`enabled`,`account_expiry_date`,`account_non_expired`,`account_non_locked`,`create_date`,`credentials_expiry_date`,`credentials_non_expired`,`is_two_factor_enabled`,`sign_up_method`,`two_factor_secret`,`updated_date`,`role_id`) VALUES (5,'cthomas@gmail.com','Charles','Thomas','$2a$10$/XU4XZdVHvQN.QZ6ixvnCe9SIcqYIF9zwBQqwDE6ug7Y3dsYDTK0G','teflonChuck',1,NULL,0,0,NULL,NULL,0,0,NULL,NULL,'2025-12-09 04:36:12.850031',NULL);
INSERT INTO `user` (`id`,`email`,`first_name`,`last_name`,`password`,`username`,`enabled`,`account_expiry_date`,`account_non_expired`,`account_non_locked`,`create_date`,`credentials_expiry_date`,`credentials_non_expired`,`is_two_factor_enabled`,`sign_up_method`,`two_factor_secret`,`updated_date`,`role_id`) VALUES (6,'stthomas@gmail.com','Sinai','Thomas','$2a$10$V0dKVX/JtWZrGW.X9xxw0ehP7OWkChHqScXbeGcD2.LS4zbzea5X2','saint.thomas',1,NULL,0,0,NULL,NULL,0,0,NULL,NULL,'2025-12-09 04:36:12.907282',NULL);
INSERT INTO `user` (`id`,`email`,`first_name`,`last_name`,`password`,`username`,`enabled`,`account_expiry_date`,`account_non_expired`,`account_non_locked`,`create_date`,`credentials_expiry_date`,`credentials_non_expired`,`is_two_factor_enabled`,`sign_up_method`,`two_factor_secret`,`updated_date`,`role_id`) VALUES (7,'lwhite@gmail.com','Lisa','White','$2a$10$V.ESg60X7othlGblaunZvONMISWlsQN9Lw0zS./qzo09cAJrm06Na','admin_lisa',1,NULL,0,0,NULL,NULL,0,0,NULL,NULL,'2025-12-09 04:36:12.964955',NULL);
INSERT INTO `user` (`id`,`email`,`first_name`,`last_name`,`password`,`username`,`enabled`,`account_expiry_date`,`account_non_expired`,`account_non_locked`,`create_date`,`credentials_expiry_date`,`credentials_non_expired`,`is_two_factor_enabled`,`sign_up_method`,`two_factor_secret`,`updated_date`,`role_id`) VALUES (8,'twhite@gmail.com','Anthony','White','$2a$10$oNumm5DzD8KyzXCdvK4xweiFynQMSwFr06tWdI4xW2uV48lrBoCz6','tbird3207',1,NULL,0,0,NULL,NULL,0,0,NULL,NULL,'2025-12-09 04:36:13.022025',NULL);
INSERT INTO `user` (`id`,`email`,`first_name`,`last_name`,`password`,`username`,`enabled`,`account_expiry_date`,`account_non_expired`,`account_non_locked`,`create_date`,`credentials_expiry_date`,`credentials_non_expired`,`is_two_factor_enabled`,`sign_up_method`,`two_factor_secret`,`updated_date`,`role_id`) VALUES (9,'awhite@gmail.com','Alysia','White','$2a$10$psTwsRBmpz6NU/UWPhnQ0O/XzYpPRZlC69XehW3j2imidtvTuFAvC','bigLeesh',1,NULL,0,0,NULL,NULL,0,0,NULL,NULL,'2025-12-09 04:36:13.151305',NULL);
INSERT INTO `user` (`id`,`email`,`first_name`,`last_name`,`password`,`username`,`enabled`,`account_expiry_date`,`account_non_expired`,`account_non_locked`,`create_date`,`credentials_expiry_date`,`credentials_non_expired`,`is_two_factor_enabled`,`sign_up_method`,`two_factor_secret`,`updated_date`,`role_id`) VALUES (10,'cwhite@gmail.com','Cameron','White','$2a$10$TEmcq00bysPFg0qWCzdz0elDuzAG6wkAWVLNdEqZFKRELuHp7o4N2','cdub97',1,NULL,0,0,NULL,NULL,0,0,NULL,NULL,'2025-12-09 04:36:13.224289',NULL);
INSERT INTO `user` (`id`,`email`,`first_name`,`last_name`,`password`,`username`,`enabled`,`account_expiry_date`,`account_non_expired`,`account_non_locked`,`create_date`,`credentials_expiry_date`,`credentials_non_expired`,`is_two_factor_enabled`,`sign_up_method`,`two_factor_secret`,`updated_date`,`role_id`) VALUES (11,'franklinmilo@gmail.com','Frankie','White','$2a$10$Kgn40uw4rqx51dtHzTUNaeW0zxPnviQUsTi9yStg8pkyJFMz0Rl0u','lilMilo',1,NULL,0,0,NULL,NULL,0,0,NULL,NULL,'2025-12-09 04:36:13.282118',NULL);
INSERT INTO `user` (`id`,`email`,`first_name`,`last_name`,`password`,`username`,`enabled`,`account_expiry_date`,`account_non_expired`,`account_non_locked`,`create_date`,`credentials_expiry_date`,`credentials_non_expired`,`is_two_factor_enabled`,`sign_up_method`,`two_factor_secret`,`updated_date`,`role_id`) VALUES (12,'deuceydeu@gmail.com','Deuce','Thomas','$2a$10$2gqEUvhs.nfKwCCB1MNxDuX5Az5lbo5zu187ohQwxVbXSG/Juk6sK','deuceDeuce',1,NULL,0,0,NULL,NULL,0,0,NULL,NULL,'2025-12-09 04:36:13.339308',NULL);
INSERT INTO `user` (`id`,`email`,`first_name`,`last_name`,`password`,`username`,`enabled`,`account_expiry_date`,`account_non_expired`,`account_non_locked`,`create_date`,`credentials_expiry_date`,`credentials_non_expired`,`is_two_factor_enabled`,`sign_up_method`,`two_factor_secret`,`updated_date`,`role_id`) VALUES (13,'eddieK@gmail.com','Eddie','Kane','$2a$10$3FrFiUlJGwppaWv0hcZWfeYHnx69avNlwOdayDbsSca37e2alq1Bu','eddieKane',1,NULL,0,0,NULL,NULL,0,0,NULL,NULL,'2025-12-09 04:36:13.398170',NULL);
INSERT INTO `user` (`id`,`email`,`first_name`,`last_name`,`password`,`username`,`enabled`,`account_expiry_date`,`account_non_expired`,`account_non_locked`,`create_date`,`credentials_expiry_date`,`credentials_non_expired`,`is_two_factor_enabled`,`sign_up_method`,`two_factor_secret`,`updated_date`,`role_id`) VALUES (29,'kabg@gmail.com','Kara','Gruenewald','$2a$10$FUQf220OgPr2hCryxfOZ2uMpU2mRpKGmdkKSTTIqpvB6X/dgFClCG','karaG',1,NULL,0,0,NULL,NULL,0,0,NULL,NULL,'2025-12-09 04:36:13.455403',NULL);
INSERT INTO `user` (`id`,`email`,`first_name`,`last_name`,`password`,`username`,`enabled`,`account_expiry_date`,`account_non_expired`,`account_non_locked`,`create_date`,`credentials_expiry_date`,`credentials_non_expired`,`is_two_factor_enabled`,`sign_up_method`,`two_factor_secret`,`updated_date`,`role_id`) VALUES (33,'nwatkins@gmail.','Nyla','Watkins','$2a$10$xEiLKQDu7Ik1ZyxiEVvfyOCne/4ZqWaEpQUivwuZR7SOUX40rPO16','NighLuh',1,NULL,0,0,NULL,NULL,0,0,NULL,NULL,'2025-12-09 04:36:13.518325',NULL);
INSERT INTO `user` (`id`,`email`,`first_name`,`last_name`,`password`,`username`,`enabled`,`account_expiry_date`,`account_non_expired`,`account_non_locked`,`create_date`,`credentials_expiry_date`,`credentials_non_expired`,`is_two_factor_enabled`,`sign_up_method`,`two_factor_secret`,`updated_date`,`role_id`) VALUES (44,'user44@example.com','Unknown','Unknown','$2a$10$8O/J.a1NCTQ.9PLVI1Wyp.GKrdaoN4z7Un6exA1TM5jR1z.uVAHIi','user',1,NULL,0,0,NULL,NULL,0,0,NULL,NULL,NULL,NULL);
INSERT INTO `user` (`id`,`email`,`first_name`,`last_name`,`password`,`username`,`enabled`,`account_expiry_date`,`account_non_expired`,`account_non_locked`,`create_date`,`credentials_expiry_date`,`credentials_non_expired`,`is_two_factor_enabled`,`sign_up_method`,`two_factor_secret`,`updated_date`,`role_id`) VALUES (45,'user45@example.com','Unknown','Unknown','$2a$10$mXMlbY.8lQAc.QUmOsvxbu/31sJvNCKMlmuPkILCZks3ZkDC4pT7a','admin',1,NULL,0,0,NULL,NULL,0,0,NULL,NULL,NULL,NULL);
INSERT INTO `user` (`id`,`email`,`first_name`,`last_name`,`password`,`username`,`enabled`,`account_expiry_date`,`account_non_expired`,`account_non_locked`,`create_date`,`credentials_expiry_date`,`credentials_non_expired`,`is_two_factor_enabled`,`sign_up_method`,`two_factor_secret`,`updated_date`,`role_id`) VALUES (46,'user1@example.com','User','One','$2a$10$I.N8GC7fDx/1vzvG7cjQcOF2vG2CslehrCIQQoSN.yvjUm9j.fJC6','user1',1,'2026-12-03',1,0,'2025-12-04 01:41:51.852523','2026-12-03',1,0,NULL,NULL,'2025-12-04 01:41:51.852589',1);
INSERT INTO `user` (`id`,`email`,`first_name`,`last_name`,`password`,`username`,`enabled`,`account_expiry_date`,`account_non_expired`,`account_non_locked`,`create_date`,`credentials_expiry_date`,`credentials_non_expired`,`is_two_factor_enabled`,`sign_up_method`,`two_factor_secret`,`updated_date`,`role_id`) VALUES (47,'admin1@example.com','Admin','One','$2a$10$34VgeiDWYK7DSuTY6m0a6OU5V89KD2.2ujS0thVuwx98tut6RN5KG','admin1',1,'2026-12-03',1,1,'2025-12-04 01:41:51.937909','2026-12-03',1,0,NULL,NULL,'2025-12-04 01:41:51.937927',2);

INSERT INTO `fruit_category` (`id`,`fruit`) VALUES (1,'Faith');
INSERT INTO `fruit_category` (`id`,`fruit`) VALUES (2,'Love');
INSERT INTO `fruit_category` (`id`,`fruit`) VALUES (3,'Joy');
INSERT INTO `fruit_category` (`id`,`fruit`) VALUES (4,'Peace');
INSERT INTO `fruit_category` (`id`,`fruit`) VALUES (5,'Temperance');
INSERT INTO `fruit_category` (`id`,`fruit`) VALUES (6,'Goodness');
INSERT INTO `fruit_category` (`id`,`fruit`) VALUES (7,'Gentleness');
INSERT INTO `fruit_category` (`id`,`fruit`) VALUES (8,'Meekness');
INSERT INTO `fruit_category` (`id`,`fruit`) VALUES (9,'Longsuffering');

INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (1,'','Faith','Difficult','But without faith it is impossible to please him: for he that cometh to God must believe that he is, and that he is a rewarder of them that diligently seek him.','KJV','Hebrews 11:6');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (2,'','Faith','Difficult','Through faith also Sara herself received strength to conceive seed, and was delivered of a child when she was past age, because she judged him faithful who had promised.','KJV','Hebrews 11:11');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (3,'','Faith','Easy','For we walk by faith, not by sight.','KJV','2 Corinthians 5:7');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (4,'','Faith','Easy','So then faith cometh by hearing, and hearing by the word of God.','KJV','Romans 10:17');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (5,'','Faith','Easy','Jesus said unto him, \'If thou canst believe, all things are possible to him that believeth.\'','KJV','Mark 9:23');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (6,'','Faith','Easy','And all things, whatsoever ye shall ask in prayer, believing, ye shall receive.','KJV','Matthew 21:22');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (7,'','Faith','Easy','Even so faith, if it hath not works, is dead, being alone.','KJV','James 2:17');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (8,'','Faith','Easy','Behold, his soul which is lifted up is not upright in him: but the just shall live by his faith.','KJV','Habakkuk 2:4');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (9,'','Faith','Easy','If we believe not, yet he abideth faithful: he cannot deny himself.','KJV','2 Timothy 2:13');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (10,'','Faith','Intermediate','For whatsoever is born of God overcometh the world: and this is the victory that overcometh the world, even our faith.','KJV','1 John 5:4');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (11,'','Faith','Intermediate','For by grace are ye saved through faith, and that not of yourselves. It is the gift of God - not of works, lest any man should boast.','KJV','Ephesians 2:8-9');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (12,'','Faith','Intermediate','Knowing this, that the trying of your faith works patience...But let him ask in faith, nothing wavering. For he that wavers is like a wave of the sea driven with the wind and tossed.','KJV','James 1:3, 6');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (13,'','Gentleness','Easy','A soft answer turneth away wrath: but grievous words stir up anger.','KJV','Proverbs 15:1');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (14,'','Gentleness','Easy','Pleasant words are as an honeycomb, sweet to the soul, and health to the bones.','KJV','Proverbs 16:25');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (15,'','Gentleness','Intermediate',' But sanctify the Lord God in your hearts: and be ready always to give an answer to every man that asketh you a reason of the hope that is in you with meekness and fear:','KJV','1 Peter 3:15');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (16,'','Gentleness','Intermediate','Put on therefore, as the elect of God, holy and beloved, bowels of mercies, kindness, humbleness of mind, meekness, longsuffering.','KJV','Colossians 3:12');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (17,'','Gentleness','Easy','To speak evil of no man, to be no brawlers, but gentle, shewing all meekness unto all men.','KJV','Titus 3:2');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (18,'','Gentleness','Intermediate','With all lowliness and meekness, with longsuffering, forbearing one another in love.','KJV','Ephesians 4:2');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (19,'','Gentleness','Easy','But thou, O man of God, flee these things; and follow after righteousness, godliness, faith, love, patience, meekness.','KJV','1 Timothy 6:11');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (20,'','Gentleness','Difficult','But let it be the hidden man of the heart, in that which is not corruptible, even the ornament of a meek and quiet spirit, which is in the sight of God of great price.','KJV','1 Peter 3:4');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (21,'','Gentleness','Intermediate','Take my yoke upon you, and learn of me; for I am meek and lowly in heart: and ye shall find rest unto your souls. For my yoke is easy, and my burden is light.','KJV','Matthew 11:29-30');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (22,'','Gentleness','Difficult','By long forbearing is a prince persuaded, and a soft tongue breaketh the bone.','KJV','Proverbs 25:15');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (23,'','Gentleness','Intermediate','And after the earthquake a fire; but the Lord was not in the fire: and after the fire a still small voice.','KJV','1 Kings 19:12');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (24,'','Gentleness','Intermediate','Brethren, if a man be overtaken in a fault, ye which are spiritual, restore such an one in the spirit of meekness; considering thyself, lest thou also be tempted.','KJV','Galatians 6:1');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (25,'','Gentleness','Difficult','And the servant of the Lord must not strive; but be gentle unto all men, apt to teach, patient, in meekness instructing those that oppose themselves; if God peradventure will give them repentance to the acknowledging of the truth.','KJV','2 Timothy 2:24-25');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (26,'','Goodness','Intermediate','I had fainted, unless I had believed to see the goodness of the Lord in the land of the living. Wait on the Lord: be of good courage, and he shall strengthen thine heart: wait, I say, on the Lord.','KJV','Psalm 27:13-14');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (27,'','Goodness','Easy','Surely goodness and mercy shall follow me all the days of my life: and I will dwell in the house of the Lord for ever.','KJV','Psalm 23:6');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (28,'','Goodness','Easy','The Lord is good to all: and his tender mercies are over all his works.','KJV','Psalm 145:9');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (29,'','Goodness','Easy','And Jesus said unto him, Why callest thou me good? there is none good but one, that is, God.','KJV','Mark 10:18');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (30,'','Goodness','Intermediate','Every good gift and every perfect gift is from above, and cometh down from the Father of lights, with whom is no variableness, neither shadow of turning.','KJV','James 1:17');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (31,'','Goodness','Intermediate','If ye then, being evil, know how to give good gifts unto your children, how much more shall your Father which is in heaven give good things to them that ask him?','KJV','Matthew 7:11');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (32,'','Goodness','Easy','He loveth righteousness and judgment: the earth is full of the goodness of the Lord.','KJV','Psalm 33:5');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (33,'','Goodness','Intermediate','Oh that men would praise the Lord for his goodness, and for his wonderful works to the children of men! For he satisfieth the longing soul, and filleth the hungry soul with goodness.','KJV','Psalm 107:8-9');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (34,'','Goodness','Intermediate','Thou gavest also thy good spirit to instruct them, and withheldest not thy manna from their mouth, and gavest them water for their thirst.','KJV','Nehemiah 9:20');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (35,'','Goodness','Easy','The Lord is good, a strong hold in the day of trouble; and he knoweth them that trust in him.','KJV','Nahum 1:7');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (36,'','Goodness','Difficult','O my soul, thou hast said unto the Lord, Thou art my Lord: my goodness extendeth not to thee;','KJV','Psalm 16:2');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (37,'','Goodness','Easy','O taste and see that the Lord is good: blessed is the man that trusteth in him.','KJV','Psalm 34:8');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (38,'','Goodness','Intermediate','For the Lord God is a sun and shield: the Lord will give grace and glory: no good thing will he withhold from them that walk uprightly.','KJV','Psalm 84:11');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (39,'','Goodness','Easy','For thou, Lord, art good, and ready to forgive; and plenteous in mercy unto all them that call upon thee.','KJV','Psalm 86:5');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (40,'','Goodness','Difficult','But love ye your enemies, and do good, and lend, hoping for nothing again; and your reward shall be great, and ye shall be the children of the Highest: for he is kind unto the unthankful and to the evil.','KJV','Luke 6:35');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (41,'','Goodness','Intermediate','Nevertheless he left not himself without witness, in that he did good, and gave us rain from heaven, and fruitful seasons, filling our hearts with food and gladness.','KJV','Acts 14:17');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (42,'','Goodness','Easy','And we know that all things work together for good to them that love God, to them who are the called according to his purpose.','KJV','Romans 8:28');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (43,'','Goodness','Intermediate','But I say unto you which hear, Love your enemies, do good to them which hate you, Bless them that curse you, and pray for them which despitefully use you.','KJV','Luke 6:27-28');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (44,'','Joy','Easy','My brethren, count it all joy when ye fall into divers temptations; Knowing this, that the trying of your faith worketh patience.','KJV','James 1:2-3');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (45,'','Joy','Easy','Hitherto have ye asked nothing in my name: ask, and ye shall receive, that your joy may be full.','KJV','John 16:24');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (46,'','Joy','Intermediate','Then he said unto them, Go your way, eat the fat, and drink the sweet, and send portions unto them for whom nothing is prepared: for this day is holy unto our Lord: neither be ye sorry; for the joy of the Lord is your strength.','KJV','Nehemiah 8 :10');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (47,'','Joy','Intermediate','And the ransomed of the Lord shall return, and come to Zion with songs and everlasting joy upon their heads: they shall obtain joy and gladness, and sorrow and sighing shall flee away.','KJV','Isaiah 35:10');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (48,'','Joy','Easy','For his anger endureth but a moment; in his favour is life: weeping may endure for a night, but joy cometh in the morning.','KJV','Psalm 30:5');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (49,'','Joy','Easy','Rejoice in the lord alway; and again, I say rejoice.','KJV','Philippians 4:4');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (50,'','Joy','Easy','For the kingdom of God is not meat and drink; but righteousness, and peace, and joy in the Holy Ghost.','KJV','Romans 14:17');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (51,'','Joy','Intermediate','And ye now therefore have sorrow: but I will see you again, and your heart shall rejoice, and your joy no man taketh from you.','KJV','John 16:22');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (52,'','Joy','Intermediate','Thou wilt shew me the path of life: in thy presence is fulness of joy; at thy right hand there are pleasures for evermore.','KJV','Psalm 16:11');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (53,'','Joy','Easy','Rejoicing in hope; patient in tribulation; continuing instant in prayer;','KJV','Romans 12:12');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (54,'','Joy','Easy','These things have I spoken unto you, that my joy might remain in you, and that your joy might be full.','KJV','John 15:11');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (55,'','Joy','Easy','This is the day which the Lord hath made; we will rejoice and be glad in it.','KJV','Psalm 118:24');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (56,'','Joy','Intermediate','The hope of the righteous shall be gladness: but the expectation of the wicked shall perish.','KJV','Proverbs 10:28');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (57,'','Joy','Easy','My lips shall greatly rejoice when I sing unto thee; and my soul, which thou hast redeemed.','KJV','Psalm 71:23');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (58,'','Joy','Intermediate','The Lord thy God in the midst of thee is mighty; he will save, he will rejoice over thee with joy; he will rest in his love, he will joy over thee with singing.','KJV','Zephaniah 3:17');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (59,'','Joy','Intermediate','Looking unto Jesus the author and finisher of our faith; who for the joy that was set before him endured the cross, despising the shame, and is set down at the right hand of the throne of God.','KJV','Hebrews 12:2');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (60,'','Joy','Easy','Rejoice evermore. Pray without ceasing. In every thing give thanks: for this is the will of God in Christ Jesus concerning you.','KJV','1 Thessalonians 5:16-18');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (61,'','Joy','Easy','Glory and honour are in his presence; strength and gladness are in his place.','KJV','1 Chronicles 16:27');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (62,'','Joy','Easy','Be glad in the Lord, and rejoice, ye righteous: and shout for joy, all ye that are upright in heart.','KJV','Psalm 32:11');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (63,'','Joy','Intermediate','For ye shall go out with joy, and be led forth with peace: the mountains and the hills shall break forth before you into singing, and all the trees of the field shall clap their hands.','KJV','Isaiah 55:12');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (64,'','Joy','Easy','They that sow in tears shall reap in joy.','KJV','Psalm 126:5');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (65,'','Joy','Easy','Make a joyful noise unto the Lord, all ye lands.','KJV','Psalm 100:1');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (66,'','Joy','Intermediate','Thy words were found, and I did eat them; and thy word was unto me the joy and rejoicing of mine heart: for I am called by thy name, O Lord God of hosts.','KJV','Jeremiah 15:16');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (67,'','Joy','Intermediate','Deceit is in the heart of them that imagine evil: but to the counsellors of peace is joy.','KJV','Proverbs 12:20');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (68,'','Longsuffering','Easy','Wherefore seeing we also are compassed about with so great a cloud of witnesses, let us lay aside every weight, and the sin which doth so easily beset us, and let us run with patience the race that is set before us.','KJV','Hebrews 12:1');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (69,'','Longsuffering','Intermediate','The Lord is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.','KJV','2 Peter 3:9');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (70,'','Longsuffering','Easy','Rejoicing in hope; patient in tribulation; continuing instant in prayer.','KJV','Romans 12:12');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (71,'','Longsuffering','Intermediate','Rest in the Lord, and wait patiently for him: fret not thyself because of him who prospereth in his way, because of the man who bringeth wicked devices to pass. Cease from anger, and forsake wrath: fret not thyself in any wise to do evil.','KJV','Psalm 37:7-8');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (72,'','Longsuffering','Easy','A wrathful man stirreth up strife: but he that is slow to anger appeaseth strife.','KJV','Proverbs 15:18');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (73,'','Longsuffering','Easy','Charity suffereth long, and is kind; charity envieth not; charity vaunteth not itself, is not puffed up.','KJV','1 Corinthians 13:4');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (74,'','Longsuffering','Easy','And Jacob served seven years for Rachel; and they seemed unto him but a few days, for the love he had to her.','KJV','Genesis 29:20A');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (75,'','Longsuffering','Intermediate','For the vision is yet for an appointed time, but at the end it shall speak, and not lie: though it tarry, wait for it; because it will surely come, it will not tarry.','KJV','Habakkuk 2:3');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (76,'','Longsuffering','Intermediate','Wait on the Lord: be of good courage, and he shall strengthen thine heart: wait, I say, on the Lord.','KJV','Psalm 27:14');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (77,'','Longsuffering','Intermediate','And let us not be weary in well doing: for in due season we shall reap, if we faint not.','KJV','Galatians 6:9');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (78,'','Longsuffering','Difficult','The Lord is longsuffering, and of great mercy, forgiving iniquity and transgression, and by no means clearing the guilty, visiting the iniquity of the fathers upon the children unto the third and fourth generation.','KJV','Numbers 14:18');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (79,'','Longsuffering','Easy','The Lord is merciful and gracious, slow to anger, and plenteous in mercy.','KJV','Psalm 103:8');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (80,'','Longsuffering','Difficult','Howbeit for this cause I obtained mercy, that in me first Jesus Christ might shew forth all longsuffering, for a pattern to them which should hereafter believe on him to life everlasting.','KJV','1 Timothy 1:16');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (81,'','Longsuffering','Easy','Better is the end of a thing than the beginning thereof: and the patient in spirit is better than the proud in spirit.','KJV','Ecclesiastes 7:8');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (82,'','Longsuffering','Easy','For ye have need of patience, that, after ye have done the will of God, ye might receive the promise.','KJV','Hebrews 10:36');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (83,'','Longsuffering','Intermediate','And the Lord passed by before him, and proclaimed, The Lord, The Lord God, merciful and gracious, longsuffering, and abundant in goodness and truth.','KJV','Exodus 34:6');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (84,'','Love','Easy','For God so loved the world that he gave his only begotten son, that whosoever believes in him shall not perish, but have everlasting life.','KJV','John 3:16');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (85,'','Love','Easy','Greater love hath no man than this, that a man lay down his life for his friends.','KJV','John 15:13');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (86,'','Love','Easy','Owe no man any thing, but to love one another: for he that loveth another hath fulfilled the law.','KJV','Romans 13:8');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (87,'','Love','Easy','Hatred stirreth up strifes: but love covereth all sins.','KJV','Proverbs 10:12');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (88,'','Love','Easy','And above all these things put on charity, which is the bond of perfectness.','KJV','Colossian 3:14');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (89,'','Love','Easy','A friend loveth at all times, and a brother is born for adversity.','KJV','Proverbs 17:17');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (90,'','Love','Easy','Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am the Lord.','KJV','Leviticus 19:18');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (91,'','Love','Easy','But I say unto you, Love your enemies, bless them that curse you, do good to them that hate you, and pray for them which despitefully use you, and persecute you;','KJV','Matthew 5:44');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (92,'','Love','Easy','There is no fear in love; but perfect love casteth out fear: because fear hath torment. He that feareth is not made perfect in love.','KJV','1 John 4:18');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (93,'','Love','Easy','And now abideth faith, hope, charity, these three; but the greatest of these is charity.','KJV','1 Corinthians 13:13');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (94,'','Love','Easy','And we have known and believed the love that God hath to us. God is love; and he that dwelleth in love dwelleth in God, and God in him.','KJV','1 John 4:16');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (95,'','Love','Easy','No man hath seen God at any time. If we love one another, God dwelleth in us, and his love is perfected in us.','KJV','1 John 4:12');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (96,'','Love','Intermediate','And above all things have fervent charity among yourselves: for charity shall cover the multitude of sins.','KJV','1 Peter 4:8');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (97,'','Love','Intermediate','A new commandment I give unto you, That ye love one another; as I have loved you, that ye also love one another.','KJV','John 13:34');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (98,'','Love','Intermediate','Let love be without dissimulation. Abhor that which is evil; cleave to that which is good.','KJV','Romans 12:9');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (99,'','Love','Intermediate','And though I have the gift of prophecy, and understand all mysteries, and all knowledge; and though I have all faith, so that I could remove mountains, and have not charity, I am nothing.','KJV','1 Corinthians 13:2');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (100,'','Love','Intermediate','Set me as a seal upon thine heart, as a seal upon thine arm: for love is strong as death; jealousy is cruel as the grave: the coals thereof are coals of fire, which hath a most vehement flame.','KJV','Song of Solomon 8:6');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (101,'','Meekness','Easy','Blessed are the meek: for they shall inherit the earth.','KJV','Psalm 37:11');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (102,'','Meekness','Easy','But the meek shall inherit the earth; and shall delight themselves in the abundance of peace.','KJV','James 3:13');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (103,'','Meekness','Intermediate','Who is a wise man and endued with knowledge among you? let him shew out of a good conversation his works with meekness of wisdom.','KJV','Matthew 11:29');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (104,'','Meekness','Easy','Take my yoke upon you, and learn of me; for I am meek and lowly in heart: and ye shall find rest unto your souls.','KJV','Psalm 25:9');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (105,'','Meekness','Easy','The meek will he guide in judgment: and the meek will he teach his way.','KJV','Numbers 12:3');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (106,'','Meekness','Easy','Now the man Moses was very meek, above all the men which were upon the face of the earth.','KJV','James 1:21');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (107,'','Meekness','Difficult','Wherefore lay apart all filthiness and superfluity of naughtiness, and receive with meekness the engrafted word, which is able to save your souls.','KJV','Psalm 147:6');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (108,'','Meekness','Easy','The Lord lifteth up the meek: he casteth the wicked down to the ground.','KJV','1 John 5:4');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (109,'','Meekness','Intermediate','The meek also shall increase their joy in the Lord, and the poor among men shall rejoice in the Holy One of Israel.','KJV','Isaiah 29:19');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (110,'','Meekness','Intermediate','If the spirit of the ruler rise up against thee, leave not thy place; for yielding pacifieth great offences.','KJV','Ecclesiastes 10:4');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (111,'','Meekness','Easy','But he that is greatest among you shall be your servant.','KJV','Matthew 23:11');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (112,'','Meekness','Difficult','For all those things hath mine hand made, and all those things have been, saith the Lord: but to this man will I look, even to him that is poor and of a contrite spirit, and trembleth at my word.','KJV','Isaiah 66:2');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (113,'','Meekness','Intermediate','But he giveth more grace. Wherefore he saith, God resisteth the proud, but giveth grace unto the humble.','KJV','James 4:6');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (114,'','Meekness','Difficult','Put them in mind to be subject to principalities and powers, to obey magistrates, to be ready to every good work, To speak evil of no man, to be no brawlers, but gentle, shewing all meekness unto all men.','KJV','Titus 3:1-2');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (115,'','Meekness','Intermediate','He was oppressed, and he was afflicted, yet he opened not his mouth: he is brought as a lamb to the slaughter, and as a sheep before her shearers is dumb, so he openeth not his mouth.','KJV','Isaiah 53&');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (116,'','Peace','Intermediate','Be careful for nothing. but in everything by prayer & supplication, with thanksgiving, let your requests be made known unto god. ANd the peace of god which surpasses all understanding shall keep your hearts & minds through christ jesus.','KJV','Phillippians 4:6-7');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (117,'','Peace','Easy','Peace I leave with you, my peace I give unto you: not as the world giveth, give I unto you. Let not your heart be troubled, neither let it be afraid.','KJV','John 14:27');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (118,'','Peace','Easy','Thou wilt keep him in perfect peace, whose mind is stayed on thee: because he trusteth in thee.','KJV','Isaiah 26:3');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (119,'','Peace','Easy','Now the Lord of peace himself give you peace always by all means. The Lord be with you all.','KJV','2 Thessalonians 3:16');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (120,'','Peace','Easy','I will both lay me down in peace, and sleep: for thou, Lord, only makest me dwell in safety.','KJV','Psalm 4:8');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (121,'','Peace','Intermediate','Therefore being justified by faith, we have peace with God through our Lord Jesus Christ.','KJV','Romans 5:1');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (122,'','Peace','Intermediate','And let the peace of God rule in your hearts, to the which also ye are called in one body; and be ye thankful.','KJV','Colossians 3:15');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (123,'','Peace','Easy','Depart from evil, and do good. seek peace, and pursue it.','KJV','Psalm 34:14');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (124,'','Peace','Intermediate','When a man\'s ways please the Lord, he maketh even his enemies to be at peace with him.','KJV','Proverbs 16:7');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (125,'','Peace','Intermediate','Then said Jesus to them again, Peace be unto you: as my Father hath sent me, even so send I you.','KJV','John 20:21');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (126,'','Peace','Difficult','And he arose, and rebuked the wind, and said unto the sea, Peace, be still. And the wind ceased, and there was a great calm.','KJV','Mark 4:39');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (127,'','Peace','Easy','Blessed are the peacemakers: for they shall be called the children of God.','KJV','Matthew 5:9');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (128,'','Peace','Intermediate','Follow peace with all men, and holiness, without which no man shall see the Lord.','KJV','Hebrews 12:14');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (129,'','Peace','Intermediate','For God is not the author of confusion, but of peace, as in all churches of the saints.','KJV','1 Corinthians 14:33');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (130,'','Peace','Difficult','But the wisdom that is from above is first pure, then peaceable, gentle, and easy to be intreated, full of mercy and good fruits, without partiality, and without hypocrisy.','KJV','James 3:17');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (131,'','Peace','Easy','For to be carnally minded is death; but to be spiritually minded is life and peace.','KJV','Romans 8:6');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (132,'','Peace','Easy','The Lord will give strength unto his people; the Lord will bless his people with peace.','KJV','Psalm 29:11');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (133,'','Peace','Easy','If it be possible, as much as lieth in you, live peaceably with all men.','KJV','Romans 12:18');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (134,'','Temperance','Easy','He that is slow to anger is better than the mighty; and he that ruleth his spirit than he that taketh a city.','KJV','Proverbs 16:32');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (135,'','Temperance','Easy','For if ye live after the flesh, ye shall die: but if ye through the Spirit do mortify the deeds of the body, ye shall live.','KJV','Romans 8:13');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (136,'','Temperance','Easy','He that hath no rule over his own spirit is like a city that is broken down, and without walls.','KJV','Proverbs 25:28');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (137,'','Temperance','Easy','For to be carnally minded is death; but to be spiritually minded is life and peace.','KJV','Romans 8:6');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (138,'','Temperance','Easy','But as he which hath called you is holy, so be ye holy in all manner of conversation.','KJV','1 Peter 1:15');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (139,'','Temperance','Easy','For God hath not given us the spirit of fear; but of power, and of love, and of a sound mind.','KJV','2 Timothy 1:7');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (140,'','Temperance','Intermediate','Mortify therefore your members which are upon the earth; fornication, uncleanness, inordinate affection, evil concupiscence, and covetousness, which is idolatry:','KJV','Colossians 3:5');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (141,'','Temperance','Difficult','It is good neither to eat flesh, nor to drink wine, nor any thing whereby thy brother stumbleth, or is offended, or is made weak.','KJV','Romans 14:21');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (142,'','Temperance','Easy','Meekness, temperance: against such there is no law.','KJV','Galatians 5:23');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (143,'','Temperance','Difficult','When thou sittest to eat with a ruler, consider diligently what is before thee: And put a knife to thy throat, if thou be a man given to appetite. Be not desirous of his dainties: for they are deceitful meat.','KJV','Proverbs 23:1-3');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (144,'','Temperance','Easy','This I say then, Walk in the Spirit, and ye shall not fulfil the lust of the flesh.','KJV','Galatians 5:16');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (145,'','Temperance','Difficult','And beside this, giving all diligence, add to your faith virtue; and to virtue knowledge; And to knowledge temperance; and to temperance patience; and to patience godliness;','KJV','2 Peter 1:5-6');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (146,'','Temperance','Intermediate','Teaching us that, denying unGodliness and worldly lusts, we should live soberly, righteously, and godly, in this present world.','KJV','Titus 2:12');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (147,'','Temperance','Intermediate','But put ye on the Lord Jesus Christ, and make not provision for the flesh, to fulfil the lusts thereof.','KJV','Romans 13:14');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (148,'','Temperance','Intermediate','Let your moderation be known unto all men. The Lord is at hand.','KJV','Philippians 4:5');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (149,'','Temperance','Difficult','Hast thou found honey? eat so much as is sufficient for thee, lest thou be filled therewith, and vomit it.','KJV','Proverbs 25:16');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (150,'','Temperance','Easy','Be not hasty in thy spirit to be angry: for anger resteth in the bosom of fools.','KJV','Ecclesiastes 7:9');
INSERT INTO `scripture` (`id`,`category`,`fruit`,`lod`,`scripture`,`translation`,`verse`) VALUES (151,'','Temperance','Intermediate','That the aged men be sober, grave, temperate, sound in faith, in charity, in patience.','KJV','Titus 2:2');

INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (1,'For we walk by faith, not by sight.','2 Corinthians 5:7','Easy','KJV','Faith','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (2,'So then faith cometh by hearing, and hearing by the word of God.','Romans 10:17','Easy','KJV','Faith','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (3,'Jesus said unto him, \'If thou canst believe, all things are possible to him that believeth.\'','Mark 9:23','Easy','KJV','Faith','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (4,'And all things, whatsoever ye shall ask in prayer, believing, ye shall receive.','Matthew 21:22','Easy','KJV','Faith','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (5,'Even so faith, if it hath not works, is dead, being alone.','James 2:17','Easy','KJV','Faith','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (6,'Behold, his soul which is lifted up is not upright in him: but the just shall live by his faith.','Habakkuk 2:4','Easy','KJV','Faith','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (7,'If we believe not, yet he abideth faithful: he cannot deny himself.','2 Timothy 2:13','Easy','KJV','Faith','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (8,'For whatsoever is born of God overcometh the world: and this is the victory that overcometh the world, even our faith.','1 John 5:4','Intermediate','KJV','Faith','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (9,'For by grace are ye saved through faith, and that not of yourselves. It is the gift of God - not of works, lest any man should boast.','Ephesians 2:8-9','Intermediate','KJV','Faith','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (10,'Knowing this, that the trying of your faith works patience...But let him ask in faith, nothing wavering. For he that wavers is like a wave of the sea driven with the wind and tossed.','James 1:3, 6','Intermediate','KJV','Faith','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (11,'But without faith it is impossible to please him: for he that cometh to God must believe that he is, and that he is a rewarder of them that diligently seek him.','Hebrews 11:6','Difficult','KJV','Faith','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (12,'Through faith also Sara herself received strength to conceive seed, and was delivered of a child when she was past age, because she judged him faithful who had promised.','Hebrews 11:11','Difficult','KJV','Faith','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (13,'For God so loved the world that he gave his only begotten son, that whosoever believes in him shall not perish, but have everlasting life.','John 3:16','Easy','KJV','Love','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (14,'Greater love hath no man than this, that a man lay down his life for his friends.','John 15:13','Easy','KJV','Love','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (15,'Owe no man any thing, but to love one another: for he that loveth another hath fulfilled the law.','Romans 13:8','Easy','KJV','Love','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (16,'Hatred stirreth up strifes: but love covereth all sins.','Proverbs 10:12','Easy','KJV','Love','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (17,'And above all things have fervent charity among yourselves: for charity shall cover the multitude of sins.','1 Peter 4:8','Intermediate','KJV','Love','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (18,'And above all these things put on charity, which is the bond of perfectness.','Colossian 3:14','Easy','KJV','Love','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (19,'A new commandment I give unto you, That ye love one another; as I have loved you, that ye also love one another.','John 13:34','Intermediate','KJV','Love','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (20,'A friend loveth at all times, and a brother is born for adversity.','Proverbs 17:17','Easy','KJV','Love','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (21,'Let love be without dissimulation. Abhor that which is evil; cleave to that which is good.','Romans 12:9','Intermediate','KJV','Love','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (22,'Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am the Lord.','Leviticus 19:18','Easy','KJV','Love','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (23,'And though I have the gift of prophecy, and understand all mysteries, and all knowledge; and though I have all faith, so that I could remove mountains, and have not charity, I am nothing.','1 Corinthians 13:2','Intermediate','KJV','Love','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (24,'But I say unto you, Love your enemies, bless them that curse you, do good to them that hate you, and pray for them which despitefully use you, and persecute you;','Matthew 5:44','Easy','KJV','Love','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (25,'There is no fear in love; but perfect love casteth out fear: because fear hath torment. He that feareth is not made perfect in love.','1 John 4:18','Easy','KJV','Love','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (26,'And now abideth faith, hope, charity, these three; but the greatest of these is charity.','1 Corinthians 13:13','Easy','KJV','Love','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (27,'Set me as a seal upon thine heart, as a seal upon thine arm: for love is strong as death; jealousy is cruel as the grave: the coals thereof are coals of fire, which hath a most vehement flame.','Song of Solomon 8:6','Intermediate','KJV','Love','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (28,'And we have known and believed the love that God hath to us. God is love; and he that dwelleth in love dwelleth in God, and God in him.','1 John 4:16','Easy','KJV','Love','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (29,'No man hath seen God at any time. If we love one another, God dwelleth in us, and his love is perfected in us.','1 John 4:12','Easy','KJV','Love','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (30,'My brethren, count it all joy when ye fall into divers temptations; Knowing this, that the trying of your faith worketh patience.','James 1:2-3','Easy','KJV','Joy','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (31,'Hitherto have ye asked nothing in my name: ask, and ye shall receive, that your joy may be full.','John 16:24','Easy','KJV','Joy','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (32,'Then he said unto them, Go your way, eat the fat, and drink the sweet, and send portions unto them for whom nothing is prepared: for this day is holy unto our Lord: neither be ye sorry; for the joy of the Lord is your strength.','Nehemiah 8 :10','Intermediate','KJV','Joy','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (33,'And the ransomed of the Lord shall return, and come to Zion with songs and everlasting joy upon their heads: they shall obtain joy and gladness, and sorrow and sighing shall flee away.','Isaiah 35:10','Intermediate','KJV','Joy','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (34,'For his anger endureth but a moment; in his favour is life: weeping may endure for a night, but joy cometh in the morning.','Psalm 30:5','Easy','KJV','Joy','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (35,'Rejoice in the lord alway; and again, I say rejoice.','Philippians 4:4','Easy','KJV','Joy','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (36,'For the kingdom of God is not meat and drink; but righteousness, and peace, and joy in the Holy Ghost.','Romans 14:17','Easy','KJV','Joy','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (37,'And ye now therefore have sorrow: but I will see you again, and your heart shall rejoice, and your joy no man taketh from you.','John 16:22','Intermediate','KJV','Joy','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (38,'Thou wilt shew me the path of life: in thy presence is fulness of joy; at thy right hand there are pleasures for evermore.','Psalm 16:11','Intermediate','KJV','Joy','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (39,'Rejoicing in hope; patient in tribulation; continuing instant in prayer;','Romans 12:12','Easy','KJV','Joy','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (40,'These things have I spoken unto you, that my joy might remain in you, and that your joy might be full.','John 15:11','Easy','KJV','Joy','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (41,'This is the day which the Lord hath made; we will rejoice and be glad in it.','Psalm 118:24','Easy','KJV','Joy','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (42,'The hope of the righteous shall be gladness: but the expectation of the wicked shall perish.','Proverbs 10:28','Intermediate','KJV','Joy','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (43,'My lips shall greatly rejoice when I sing unto thee; and my soul, which thou hast redeemed.','Psalm 71:23','Easy','KJV','Joy','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (44,'The Lord thy God in the midst of thee is mighty; he will save, he will rejoice over thee with joy; he will rest in his love, he will joy over thee with singing.','Zephaniah 3:17','Intermediate','KJV','Joy','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (45,'Looking unto Jesus the author and finisher of our faith; who for the joy that was set before him endured the cross, despising the shame, and is set down at the right hand of the throne of God.','Hebrews 12:2','Intermediate','KJV','Joy','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (46,'Rejoice evermore. Pray without ceasing. In every thing give thanks: for this is the will of God in Christ Jesus concerning you.','1 Thessalonians 5:16-18','Easy','KJV','Joy','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (47,'Glory and honour are in his presence; strength and gladness are in his place.','1 Chronicles 16:27','Easy','KJV','Joy','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (48,'Be glad in the Lord, and rejoice, ye righteous: and shout for joy, all ye that are upright in heart.','Psalm 32:11','Easy','KJV','Joy','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (49,'For ye shall go out with joy, and be led forth with peace: the mountains and the hills shall break forth before you into singing, and all the trees of the field shall clap their hands.','Isaiah 55:12','Intermediate','KJV','Joy','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (50,'They that sow in tears shall reap in joy.','Psalm 126:5','Easy','KJV','Joy','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (51,'Make a joyful noise unto the Lord, all ye lands.','Psalm 100:1','Easy','KJV','Joy','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (52,'Thy words were found, and I did eat them; and thy word was unto me the joy and rejoicing of mine heart: for I am called by thy name, O Lord God of hosts.','Jeremiah 15:16','Intermediate','KJV','Joy','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (53,'Deceit is in the heart of them that imagine evil: but to the counsellors of peace is joy.','Proverbs 12:20','Intermediate','KJV','Joy','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (54,'Be careful for nothing. but in everything by prayer & supplication, with thanksgiving, let your requests be made known unto god. ANd the peace of god which surpasses all understanding shall keep your hearts & minds through christ jesus.','Phillippians 4:6-7','Intermediate','KJV','Peace','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (55,'Peace I leave with you, my peace I give unto you: not as the world giveth, give I unto you. Let not your heart be troubled, neither let it be afraid.','John 14:27','Easy','KJV','Peace','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (56,'Thou wilt keep him in perfect peace, whose mind is stayed on thee: because he trusteth in thee.','Isaiah 26:3','Easy','KJV','Peace','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (57,'Now the Lord of peace himself give you peace always by all means. The Lord be with you all.','2 Thessalonians 3:16','Easy','KJV','Peace','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (58,'I will both lay me down in peace, and sleep: for thou, Lord, only makest me dwell in safety.','Psalm 4:8','Easy','KJV','Peace','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (59,'Therefore being justified by faith, we have peace with God through our Lord Jesus Christ.','Romans 5:1','Intermediate','KJV','Peace','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (60,'And let the peace of God rule in your hearts, to the which also ye are called in one body; and be ye thankful.','Colossians 3:15','Intermediate','KJV','Peace','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (61,'Depart from evil, and do good. seek peace, and pursue it.','Psalm 34:14','Easy','KJV','Peace','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (62,'When a man\'s ways please the Lord, he maketh even his enemies to be at peace with him.','Proverbs 16:7','Intermediate','KJV','Peace','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (63,'Then said Jesus to them again, Peace be unto you: as my Father hath sent me, even so send I you.','John 20:21','Intermediate','KJV','Peace','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (64,'And he arose, and rebuked the wind, and said unto the sea, Peace, be still. And the wind ceased, and there was a great calm.','Mark 4:39','Difficult','KJV','Peace','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (65,'Blessed are the peacemakers: for they shall be called the children of God.','Matthew 5:9','Easy','KJV','Peace','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (66,'Follow peace with all men, and holiness, without which no man shall see the Lord.','Hebrews 12:14','Intermediate','KJV','Peace','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (67,'For God is not the author of confusion, but of peace, as in all churches of the saints.','1 Corinthians 14:33','Intermediate','KJV','Peace','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (68,'But the wisdom that is from above is first pure, then peaceable, gentle, and easy to be intreated, full of mercy and good fruits, without partiality, and without hypocrisy.','James 3:17','Difficult','KJV','Peace','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (69,'For to be carnally minded is death; but to be spiritually minded is life and peace.','Romans 8:6','Easy','KJV','Peace','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (70,'The Lord will give strength unto his people; the Lord will bless his people with peace.','Psalm 29:11','Easy','KJV','Peace','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (71,'If it be possible, as much as lieth in you, live peaceably with all men.','Romans 12:18','Easy','KJV','Peace','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (72,'He that is slow to anger is better than the mighty; and he that ruleth his spirit than he that taketh a city.','Proverbs 16:32','Easy','KJV','Temperance','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (73,'For if ye live after the flesh, ye shall die: but if ye through the Spirit do mortify the deeds of the body, ye shall live.','Romans 8:13','Easy','KJV','Temperance','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (74,'He that hath no rule over his own spirit is like a city that is broken down, and without walls.','Proverbs 25:28','Easy','KJV','Temperance','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (75,'For to be carnally minded is death; but to be spiritually minded is life and peace.','Romans 8:6','Easy','KJV','Temperance','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (76,'But as he which hath called you is holy, so be ye holy in all manner of conversation.','1 Peter 1:15','Easy','KJV','Temperance','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (77,'For God hath not given us the spirit of fear; but of power, and of love, and of a sound mind.','2 Timothy 1:7','Easy','KJV','Temperance','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (78,'Mortify therefore your members which are upon the earth; fornication, uncleanness, inordinate affection, evil concupiscence, and covetousness, which is idolatry:','Colossians 3:5','Intermediate','KJV','Temperance','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (79,'It is good neither to eat flesh, nor to drink wine, nor any thing whereby thy brother stumbleth, or is offended, or is made weak.','Romans 14:21','Difficult','KJV','Temperance','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (80,'Meekness, temperance: against such there is no law.','Galatians 5:23','Easy','KJV','Temperance','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (81,'When thou sittest to eat with a ruler, consider diligently what is before thee: And put a knife to thy throat, if thou be a man given to appetite. Be not desirous of his dainties: for they are deceitful meat.','Proverbs 23:1-3','Difficult','KJV','Temperance','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (82,'This I say then, Walk in the Spirit, and ye shall not fulfil the lust of the flesh.','Galatians 5:16','Easy','KJV','Temperance','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (83,'And beside this, giving all diligence, add to your faith virtue; and to virtue knowledge; And to knowledge temperance; and to temperance patience; and to patience godliness;','2 Peter 1:5-6','Difficult','KJV','Temperance','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (84,'Teaching us that, denying unGodliness and worldly lusts, we should live soberly, righteously, and godly, in this present world.','Titus 2:12','Intermediate','KJV','Temperance','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (85,'But put ye on the Lord Jesus Christ, and make not provision for the flesh, to fulfil the lusts thereof.','Romans 13:14','Intermediate','KJV','Temperance','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (86,'Let your moderation be known unto all men. The Lord is at hand.','Philippians 4:5','Intermediate','KJV','Temperance','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (87,'Hast thou found honey? eat so much as is sufficient for thee, lest thou be filled therewith, and vomit it.','Proverbs 25:16','Difficult','KJV','Temperance','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (88,'Be not hasty in thy spirit to be angry: for anger resteth in the bosom of fools.','Ecclesiastes 7:9','Easy','KJV','Temperance','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (89,'That the aged men be sober, grave, temperate, sound in faith, in charity, in patience.','Titus 2:2','Intermediate','KJV','Temperance','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (90,'I had fainted, unless I had believed to see the goodness of the Lord in the land of the living. Wait on the Lord: be of good courage, and he shall strengthen thine heart: wait, I say, on the Lord.','Psalm 27:13-14','Intermediate','KJV','Goodness','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (91,'Surely goodness and mercy shall follow me all the days of my life: and I will dwell in the house of the Lord for ever.','Psalm 23:6','Easy','KJV','Goodness','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (92,'The Lord is good to all: and his tender mercies are over all his works.','Psalm 145:9','Easy','KJV','Goodness','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (93,'And Jesus said unto him, Why callest thou me good? there is none good but one, that is, God.','Mark 10:18','Easy','KJV','Goodness','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (94,'Every good gift and every perfect gift is from above, and cometh down from the Father of lights, with whom is no variableness, neither shadow of turning.','James 1:17','Intermediate','KJV','Goodness','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (95,'If ye then, being evil, know how to give good gifts unto your children, how much more shall your Father which is in heaven give good things to them that ask him?','Matthew 7:11','Intermediate','KJV','Goodness','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (96,'He loveth righteousness and judgment: the earth is full of the goodness of the Lord.','Psalm 33:5','Easy','KJV','Goodness','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (97,'Oh that men would praise the Lord for his goodness, and for his wonderful works to the children of men! For he satisfieth the longing soul, and filleth the hungry soul with goodness.','Psalm 107:8-9','Intermediate','KJV','Goodness','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (98,'Thou gavest also thy good spirit to instruct them, and withheldest not thy manna from their mouth, and gavest them water for their thirst.','Nehemiah 9:20','Intermediate','KJV','Goodness','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (99,'The Lord is good, a strong hold in the day of trouble; and he knoweth them that trust in him.','Nahum 1:7','Easy','KJV','Goodness','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (100,'O my soul, thou hast said unto the Lord, Thou art my Lord: my goodness extendeth not to thee;','Psalm 16:2','Difficult','KJV','Goodness','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (101,'O taste and see that the Lord is good: blessed is the man that trusteth in him.','Psalm 34:8','Easy','KJV','Goodness','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (102,'For the Lord God is a sun and shield: the Lord will give grace and glory: no good thing will he withhold from them that walk uprightly.','Psalm 84:11','Intermediate','KJV','Goodness','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (103,'For thou, Lord, art good, and ready to forgive; and plenteous in mercy unto all them that call upon thee.','Psalm 86:5','Easy','KJV','Goodness','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (104,'But love ye your enemies, and do good, and lend, hoping for nothing again; and your reward shall be great, and ye shall be the children of the Highest: for he is kind unto the unthankful and to the evil.','Luke 6:35','Difficult','KJV','Goodness','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (105,'Nevertheless he left not himself without witness, in that he did good, and gave us rain from heaven, and fruitful seasons, filling our hearts with food and gladness.','Acts 14:17','Intermediate','KJV','Goodness','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (106,'And we know that all things work together for good to them that love God, to them who are the called according to his purpose.','Romans 8:28','Easy','KJV','Goodness','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (107,'But I say unto you which hear, Love your enemies, do good to them which hate you, Bless them that curse you, and pray for them which despitefully use you.','Luke 6:27-28','Intermediate','KJV','Goodness','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (108,'A soft answer turneth away wrath: but grievous words stir up anger.','Proverbs 15:1','Easy','KJV','Gentleness','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (109,'Pleasant words are as an honeycomb, sweet to the soul, and health to the bones.','Proverbs 16:25','Easy','KJV','Gentleness','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (110,' But sanctify the Lord God in your hearts: and be ready always to give an answer to every man that asketh you a reason of the hope that is in you with meekness and fear:','1 Peter 3:15','Intermediate','KJV','Gentleness','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (111,'Put on therefore, as the elect of God, holy and beloved, bowels of mercies, kindness, humbleness of mind, meekness, longsuffering.','Colossians 3:12','Intermediate','KJV','Gentleness','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (112,'To speak evil of no man, to be no brawlers, but gentle, shewing all meekness unto all men.','Titus 3:2','Easy','KJV','Gentleness','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (113,'With all lowliness and meekness, with longsuffering, forbearing one another in love.','Ephesians 4:2','Intermediate','KJV','Gentleness','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (114,'But thou, O man of God, flee these things; and follow after righteousness, godliness, faith, love, patience, meekness.','1 Timothy 6:11','Easy','KJV','Gentleness','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (115,'But let it be the hidden man of the heart, in that which is not corruptible, even the ornament of a meek and quiet spirit, which is in the sight of God of great price.','1 Peter 3:4','Difficult','KJV','Gentleness','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (116,'Take my yoke upon you, and learn of me; for I am meek and lowly in heart: and ye shall find rest unto your souls. For my yoke is easy, and my burden is light.','Matthew 11:29-30','Intermediate','KJV','Gentleness','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (117,'By long forbearing is a prince persuaded, and a soft tongue breaketh the bone.','Proverbs 25:15','Difficult','KJV','Gentleness','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (118,'And after the earthquake a fire; but the Lord was not in the fire: and after the fire a still small voice.','1 Kings 19:12','Intermediate','KJV','Gentleness','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (119,'Brethren, if a man be overtaken in a fault, ye which are spiritual, restore such an one in the spirit of meekness; considering thyself, lest thou also be tempted.','Galatians 6:1','Intermediate','KJV','Gentleness','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (120,'And the servant of the Lord must not strive; but be gentle unto all men, apt to teach, patient, in meekness instructing those that oppose themselves; if God peradventure will give them repentance to the acknowledging of the truth.','2 Timothy 2:24-25','Difficult','KJV','Gentleness','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (121,'Wherefore seeing we also are compassed about with so great a cloud of witnesses, let us lay aside every weight, and the sin which doth so easily beset us, and let us run with patience the race that is set before us.','Hebrews 12:1','Easy','KJV','Longsuffering','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (122,'The Lord is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.','2 Peter 3:9','Intermediate','KJV','Longsuffering','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (123,'Rejoicing in hope; patient in tribulation; continuing instant in prayer.','Romans 12:12','Easy','KJV','Longsuffering','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (124,'Rest in the Lord, and wait patiently for him: fret not thyself because of him who prospereth in his way, because of the man who bringeth wicked devices to pass. Cease from anger, and forsake wrath: fret not thyself in any wise to do evil.','Psalm 37:7-8','Intermediate','KJV','Longsuffering','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (125,'A wrathful man stirreth up strife: but he that is slow to anger appeaseth strife.','Proverbs 15:18','Easy','KJV','Longsuffering','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (126,'Charity suffereth long, and is kind; charity envieth not; charity vaunteth not itself, is not puffed up.','1 Corinthians 13:4','Easy','KJV','Longsuffering','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (127,'And Jacob served seven years for Rachel; and they seemed unto him but a few days, for the love he had to her.','Genesis 29:20A','Easy','KJV','Longsuffering','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (128,'For the vision is yet for an appointed time, but at the end it shall speak, and not lie: though it tarry, wait for it; because it will surely come, it will not tarry.','Habakkuk 2:3','Intermediate','KJV','Longsuffering','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (129,'Wait on the Lord: be of good courage, and he shall strengthen thine heart: wait, I say, on the Lord.','Psalm 27:14','Intermediate','KJV','Longsuffering','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (130,'And let us not be weary in well doing: for in due season we shall reap, if we faint not.','Galatians 6:9','Intermediate','KJV','Longsuffering','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (131,'The Lord is longsuffering, and of great mercy, forgiving iniquity and transgression, and by no means clearing the guilty, visiting the iniquity of the fathers upon the children unto the third and fourth generation.','Numbers 14:18','Difficult','KJV','Longsuffering','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (132,'The Lord is merciful and gracious, slow to anger, and plenteous in mercy.','Psalm 103:8','Easy','KJV','Longsuffering','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (133,'Howbeit for this cause I obtained mercy, that in me first Jesus Christ might shew forth all longsuffering, for a pattern to them which should hereafter believe on him to life everlasting.','1 Timothy 1:16','Difficult','KJV','Longsuffering','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (134,'Better is the end of a thing than the beginning thereof: and the patient in spirit is better than the proud in spirit.','Ecclesiastes 7:8','Easy','KJV','Longsuffering','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (135,'For ye have need of patience, that, after ye have done the will of God, ye might receive the promise.','Hebrews 10:36','Easy','KJV','Longsuffering','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (136,'And the Lord passed by before him, and proclaimed, The Lord, The Lord God, merciful and gracious, longsuffering, and abundant in goodness and truth.','Exodus 34:6','Intermediate','KJV','Longsuffering','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (137,'Blessed are the meek: for they shall inherit the earth.','Psalm 37:11','Easy','KJV','Meekness','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (138,'But the meek shall inherit the earth; and shall delight themselves in the abundance of peace.','James 3:13','Easy','KJV','Meekness','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (139,'Who is a wise man and endued with knowledge among you? let him shew out of a good conversation his works with meekness of wisdom.','Matthew 11:29','Intermediate','KJV','Meekness','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (140,'Take my yoke upon you, and learn of me; for I am meek and lowly in heart: and ye shall find rest unto your souls.','Psalm 25:9','Easy','KJV','Meekness','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (141,'The meek will he guide in judgment: and the meek will he teach his way.','Numbers 12:3','Easy','KJV','Meekness','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (142,'Now the man Moses was very meek, above all the men which were upon the face of the earth.','James 1:21','Easy','KJV','Meekness','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (143,'Wherefore lay apart all filthiness and superfluity of naughtiness, and receive with meekness the engrafted word, which is able to save your souls.','Psalm 147:6','Difficult','KJV','Meekness','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (144,'The Lord lifteth up the meek: he casteth the wicked down to the ground.','1 John 5:4','Easy','KJV','Meekness','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (145,'The meek also shall increase their joy in the Lord, and the poor among men shall rejoice in the Holy One of Israel.','Isaiah 29:19','Intermediate','KJV','Meekness','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (146,'If the spirit of the ruler rise up against thee, leave not thy place; for yielding pacifieth great offences.','Ecclesiastes 10:4','Intermediate','KJV','Meekness','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (147,'But he that is greatest among you shall be your servant.','Matthew 23:11','Easy','KJV','Meekness','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (148,'For all those things hath mine hand made, and all those things have been, saith the Lord: but to this man will I look, even to him that is poor and of a contrite spirit, and trembleth at my word.','Isaiah 66:2','Difficult','KJV','Meekness','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (149,'But he giveth more grace. Wherefore he saith, God resisteth the proud, but giveth grace unto the humble.','James 4:6','Intermediate','KJV','Meekness','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (150,'Put them in mind to be subject to principalities and powers, to obey magistrates, to be ready to every good work, To speak evil of no man, to be no brawlers, but gentle, shewing all meekness unto all men.','Titus 3:1-2','Difficult','KJV','Meekness','');
INSERT INTO `question` (`id`,`questions`,`answer`,`lod`,`translation`,`fruit`,`category`) VALUES (151,'He was oppressed, and he was afflicted, yet he opened not his mouth: he is brought as a lamb to the slaughter, and as a sheep before her shearers is dumb, so he openeth not his mouth.','Isaiah 53:7','Intermediate','KJV','Meekness','');

INSERT INTO `faith_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`,`id`) VALUES ('2 Corinthians 5:7','For we walk by faith, not by sight.','Easy','KJV','Faith','',1);
INSERT INTO `faith_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`,`id`) VALUES ('Romans 10:17','So then faith cometh by hearing, and hearing by the word of God.','Easy','KJV','Faith','',2);
INSERT INTO `faith_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`,`id`) VALUES ('Mark 9:23','Jesus said unto him, \'If thou canst believe, all things are possible to him that believeth.\'','Easy','KJV','Faith','',3);
INSERT INTO `faith_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`,`id`) VALUES ('Matthew 21:22','And all things, whatsoever ye shall ask in prayer, believing, ye shall receive.','Easy','KJV','Faith','',4);
INSERT INTO `faith_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`,`id`) VALUES ('James 2:17','Even so faith, if it hath not works, is dead, being alone.','Easy','KJV','Faith','',5);
INSERT INTO `faith_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`,`id`) VALUES ('Habakkuk 2:4','Behold, his soul which is lifted up is not upright in him: but the just shall live by his faith.','Easy','KJV','Faith','',6);
INSERT INTO `faith_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`,`id`) VALUES ('2 Timothy 2:13','If we believe not, yet he abideth faithful: he cannot deny himself.','Easy','KJV','Faith','',7);
INSERT INTO `faith_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`,`id`) VALUES ('1 John 5:4','For whatsoever is born of God overcometh the world: and this is the victory that overcometh the world, even our faith.','Intermediate','KJV','Faith','',8);
INSERT INTO `faith_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`,`id`) VALUES ('Ephesians 2:8-9','For by grace are ye saved through faith, and that not of yourselves. It is the gift of God - not of works, lest any man should boast.','Intermediate','KJV','Faith','',9);
INSERT INTO `faith_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`,`id`) VALUES ('James 1:3, 6','Knowing this, that the trying of your faith works patience...But let him ask in faith, nothing wavering. For he that wavers is like a wave of the sea driven with the wind and tossed.','Intermediate','KJV','Faith','',10);
INSERT INTO `faith_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`,`id`) VALUES ('Matthew 17:20-21','And Jesus said unto them, Because of your unbelief: for verily I say unto you, If ye have faith as a grain of mustard seed, ye shall say unto this mountain, Remove hence to yonder place; and it shall remove; and nothing shall be impossible unto you. Howbeit this kind goeth not out but by prayer and fasting.','Difficult','KJV','Faith','',11);
INSERT INTO `faith_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`,`id`) VALUES ('Hebrews 11:1-3','Now faith is the substance of things hoped for, the evidence of things not seen. For by it the elders obtained a good report. Through faith we understand that the worlds were framed by the word of God, so that things which are seen were not made of things which do appear.','Difficult','KJV','Faith','',12);
INSERT INTO `faith_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`,`id`) VALUES ('Hebrews 11:6','But without faith it is impossible to please him: for he that cometh to God must believe that he is, and that he is a rewarder of them that diligently seek him.','Difficult','KJV','Faith','',13);
INSERT INTO `faith_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`,`id`) VALUES ('Hebrews 11:11','Through faith also Sara herself received strength to conceive seed, and was delivered of a child when she was past age, because she judged him faithful who had promised.','Difficult','KJV','Faith','',14);

INSERT INTO `gentleness_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Proverbs 15:1','A soft answer turneth away wrath: but grievous words stir up anger.','Easy','KJV','Gentleness','');
INSERT INTO `gentleness_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Proverbs 16:25','Pleasant words are as an honeycomb, sweet to the soul, and health to the bones.','Easy','KJV','Gentleness','');
INSERT INTO `gentleness_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('1 Peter 3:15',' But sanctify the Lord God in your hearts: and be ready always to give an answer to every man that asketh you a reason of the hope that is in you with meekness and fear:','Intermediate','KJV','Gentleness','');
INSERT INTO `gentleness_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Colossians 3:12','Put on therefore, as the elect of God, holy and beloved, bowels of mercies, kindness, humbleness of mind, meekness, longsuffering.','Intermediate','KJV','Gentleness','');
INSERT INTO `gentleness_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Titus 3:2','To speak evil of no man, to be no brawlers, but gentle, shewing all meekness unto all men.','Easy','KJV','Gentleness','');
INSERT INTO `gentleness_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Ephesians 4:2','With all lowliness and meekness, with longsuffering, forbearing one another in love.','Intermediate','KJV','Gentleness','');
INSERT INTO `gentleness_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('1 Timothy 6:11','But thou, O man of God, flee these things; and follow after righteousness, godliness, faith, love, patience, meekness.','Easy','KJV','Gentleness','');
INSERT INTO `gentleness_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('1 Peter 3:4','But let it be the hidden man of the heart, in that which is not corruptible, even the ornament of a meek and quiet spirit, which is in the sight of God of great price.','Difficult','KJV','Gentleness','');
INSERT INTO `gentleness_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Matthew 11:29-30','Take my yoke upon you, and learn of me; for I am meek and lowly in heart: and ye shall find rest unto your souls. For my yoke is easy, and my burden is light.','Intermediate','KJV','Gentleness','');
INSERT INTO `gentleness_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Proverbs 25:15','By long forbearing is a prince persuaded, and a soft tongue breaketh the bone.','Difficult','KJV','Gentleness','');
INSERT INTO `gentleness_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('1 Kings 19:12','And after the earthquake a fire; but the Lord was not in the fire: and after the fire a still small voice.','Intermediate','KJV','Gentleness','');
INSERT INTO `gentleness_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Galatians 6:1','Brethren, if a man be overtaken in a fault, ye which are spiritual, restore such an one in the spirit of meekness; considering thyself, lest thou also be tempted.','Intermediate','KJV','Gentleness','');
INSERT INTO `gentleness_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('2 Timothy 2:24-25','And the servant of the Lord must not strive; but be gentle unto all men, apt to teach, patient, in meekness instructing those that oppose themselves; if God peradventure will give them repentance to the acknowledging of the truth.','Difficult','KJV','Gentleness','');

INSERT INTO `goodness_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Psalm 27:13-14','I had fainted, unless I had believed to see the goodness of the Lord in the land of the living. Wait on the Lord: be of good courage, and he shall strengthen thine heart: wait, I say, on the Lord.','Intermediate','KJV','Goodness','');
INSERT INTO `goodness_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Psalm 23:6','Surely goodness and mercy shall follow me all the days of my life: and I will dwell in the house of the Lord for ever.','Easy','KJV','Goodness','');
INSERT INTO `goodness_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Psalm 145:9','The Lord is good to all: and his tender mercies are over all his works.','Easy','KJV','Goodness','');
INSERT INTO `goodness_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Mark 10:18','And Jesus said unto him, Why callest thou me good? there is none good but one, that is, God.','Easy','KJV','Goodness','');
INSERT INTO `goodness_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('James 1:17','Every good gift and every perfect gift is from above, and cometh down from the Father of lights, with whom is no variableness, neither shadow of turning.','Intermediate','KJV','Goodness','');
INSERT INTO `goodness_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Matthew 7:11','If ye then, being evil, know how to give good gifts unto your children, how much more shall your Father which is in heaven give good things to them that ask him?','Intermediate','KJV','Goodness','');
INSERT INTO `goodness_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Psalm 33:5','He loveth righteousness and judgment: the earth is full of the goodness of the Lord.','Easy','KJV','Goodness','');
INSERT INTO `goodness_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Psalm 107:8-9','Oh that men would praise the Lord for his goodness, and for his wonderful works to the children of men! For he satisfieth the longing soul, and filleth the hungry soul with goodness.','Intermediate','KJV','Goodness','');
INSERT INTO `goodness_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Nehemiah 9:20','Thou gavest also thy good spirit to instruct them, and withheldest not thy manna from their mouth, and gavest them water for their thirst.','Intermediate','KJV','Goodness','');
INSERT INTO `goodness_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Nahum 1:7','The Lord is good, a strong hold in the day of trouble; and he knoweth them that trust in him.','Easy','KJV','Goodness','');
INSERT INTO `goodness_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Psalm 31:19-20','Oh how great is thy goodness, which thou hast laid up for them that fear thee; which thou hast wrought for them that trust in thee before the sons of men! Thou shalt hide them in the secret of thy presence from the pride of man: thou shalt keep them secretly in a pavilion from the strife of tongues.','Difficult','KJV','Goodness','');
INSERT INTO `goodness_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Psalm 16:2','O my soul, thou hast said unto the Lord, Thou art my Lord: my goodness extendeth not to thee;','Difficult','KJV','Goodness','');
INSERT INTO `goodness_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Psalm 34:8','O taste and see that the Lord is good: blessed is the man that trusteth in him.','Easy','KJV','Goodness','');
INSERT INTO `goodness_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Psalm 84:11','For the Lord God is a sun and shield: the Lord will give grace and glory: no good thing will he withhold from them that walk uprightly.','Intermediate','KJV','Goodness','');
INSERT INTO `goodness_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Psalm 86:5','For thou, Lord, art good, and ready to forgive; and plenteous in mercy unto all them that call upon thee.','Easy','KJV','Goodness','');
INSERT INTO `goodness_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Luke 6:35','But love ye your enemies, and do good, and lend, hoping for nothing again; and your reward shall be great, and ye shall be the children of the Highest: for he is kind unto the unthankful and to the evil.','Difficult','KJV','Goodness','');
INSERT INTO `goodness_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Acts 14:17','Nevertheless he left not himself without witness, in that he did good, and gave us rain from heaven, and fruitful seasons, filling our hearts with food and gladness.','Intermediate','KJV','Goodness','');
INSERT INTO `goodness_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Romans 8:28','And we know that all things work together for good to them that love God, to them who are the called according to his purpose.','Easy','KJV','Goodness','');
INSERT INTO `goodness_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Luke 6:27-28','But I say unto you which hear, Love your enemies, do good to them which hate you, Bless them that curse you, and pray for them which despitefully use you.','Intermediate','KJV','Goodness','');

INSERT INTO `joy_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('James 1:2-3','My brethren, count it all joy when ye fall into divers temptations; Knowing this, that the trying of your faith worketh patience.','Easy','KJV','Joy','');
INSERT INTO `joy_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('John 16:24','Hitherto have ye asked nothing in my name: ask, and ye shall receive, that your joy may be full.','Easy','KJV','Joy','');
INSERT INTO `joy_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Nehemiah 8 :10','Then he said unto them, Go your way, eat the fat, and drink the sweet, and send portions unto them for whom nothing is prepared: for this day is holy unto our Lord: neither be ye sorry; for the joy of the Lord is your strength.','Intermediate','KJV','Joy','');
INSERT INTO `joy_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Isaiah 35:10','And the ransomed of the Lord shall return, and come to Zion with songs and everlasting joy upon their heads: they shall obtain joy and gladness, and sorrow and sighing shall flee away.','Intermediate','KJV','Joy','');
INSERT INTO `joy_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Psalm 30:5','For his anger endureth but a moment; in his favour is life: weeping may endure for a night, but joy cometh in the morning.','Easy','KJV','Joy','');
INSERT INTO `joy_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Philippians 4:4','Rejoice in the lord alway; and again, I say rejoice.','Easy','KJV','Joy','');
INSERT INTO `joy_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Romans 14:17','For the kingdom of God is not meat and drink; but righteousness, and peace, and joy in the Holy Ghost.','Easy','KJV','Joy','');
INSERT INTO `joy_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('John 16:22','And ye now therefore have sorrow: but I will see you again, and your heart shall rejoice, and your joy no man taketh from you.','Intermediate','KJV','Joy','');
INSERT INTO `joy_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Romans 5:3-5','And not only so, but we glory in tribulations also: knowing that tribulation worketh patience; And patience, experience; and experience, hope: And hope maketh not ashamed; because the love of God is shed abroad in our hearts by the Holy Ghost which is given unto us.','Intermediate','KJV','Joy','');
INSERT INTO `joy_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Psalm 16:11','Thou wilt shew me the path of life: in thy presence is fulness of joy; at thy right hand there are pleasures for evermore.','Intermediate','KJV','Joy','');
INSERT INTO `joy_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Luke 15:6-7','And when he cometh home, he calleth together his friends and neighbours, saying unto them, Rejoice with me; for I have found my sheep which was lost. I say unto you, that likewise joy shall be in heaven over one sinner that repenteth, more than over ninety and nine just persons, which need no repentance.','Difficult','KJV','Joy','');
INSERT INTO `joy_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Romans 12:12','Rejoicing in hope; patient in tribulation; continuing instant in prayer;','Easy','KJV','Joy','');
INSERT INTO `joy_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('John 15:11','These things have I spoken unto you, that my joy might remain in you, and that your joy might be full.','Easy','KJV','Joy','');
INSERT INTO `joy_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Psalm 118:24','This is the day which the Lord hath made; we will rejoice and be glad in it.','Easy','KJV','Joy','');
INSERT INTO `joy_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Proverbs 10:28','The hope of the righteous shall be gladness: but the expectation of the wicked shall perish.','Intermediate','KJV','Joy','');
INSERT INTO `joy_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Psalm 71:23','My lips shall greatly rejoice when I sing unto thee; and my soul, which thou hast redeemed.','Easy','KJV','Joy','');
INSERT INTO `joy_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Zephaniah 3:17','The Lord thy God in the midst of thee is mighty; he will save, he will rejoice over thee with joy; he will rest in his love, he will joy over thee with singing.','Intermediate','KJV','Joy','');
INSERT INTO `joy_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Hebrews 12:2','Looking unto Jesus the author and finisher of our faith; who for the joy that was set before him endured the cross, despising the shame, and is set down at the right hand of the throne of God.','Intermediate','KJV','Joy','');
INSERT INTO `joy_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('1 Thessalonians 5:16-18','Rejoice evermore. Pray without ceasing. In every thing give thanks: for this is the will of God in Christ Jesus concerning you.','Easy','KJV','Joy','');
INSERT INTO `joy_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('1 Chronicles 16:27','Glory and honour are in his presence; strength and gladness are in his place.','Easy','KJV','Joy','');
INSERT INTO `joy_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Psalm 32:11','Be glad in the Lord, and rejoice, ye righteous: and shout for joy, all ye that are upright in heart.','Easy','KJV','Joy','');
INSERT INTO `joy_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Isaiah 55:12','For ye shall go out with joy, and be led forth with peace: the mountains and the hills shall break forth before you into singing, and all the trees of the field shall clap their hands.','Intermediate','KJV','Joy','');
INSERT INTO `joy_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Psalm 126:5','They that sow in tears shall reap in joy.','Easy','KJV','Joy','');
INSERT INTO `joy_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Psalm 100:1','Make a joyful noise unto the Lord, all ye lands.','Easy','KJV','Joy','');
INSERT INTO `joy_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Jeremiah 15:16','Thy words were found, and I did eat them; and thy word was unto me the joy and rejoicing of mine heart: for I am called by thy name, O Lord God of hosts.','Intermediate','KJV','Joy','');
INSERT INTO `joy_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Proverbs 12:20','Deceit is in the heart of them that imagine evil: but to the counsellors of peace is joy.','Intermediate','KJV','Joy','');

INSERT INTO `longsuffering_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Hebrews 12:1','Wherefore seeing we also are compassed about with so great a cloud of witnesses, let us lay aside every weight, and the sin which doth so easily beset us, and let us run with patience the race that is set before us.','Easy','KJV','Longsuffering','');
INSERT INTO `longsuffering_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('2 Peter 3:9','The Lord is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.','Intermediate','KJV','Longsuffering','');
INSERT INTO `longsuffering_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Romans 12:12','Rejoicing in hope; patient in tribulation; continuing instant in prayer.','Easy','KJV','Longsuffering','');
INSERT INTO `longsuffering_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Psalm 37:7-8','Rest in the Lord, and wait patiently for him: fret not thyself because of him who prospereth in his way, because of the man who bringeth wicked devices to pass. Cease from anger, and forsake wrath: fret not thyself in any wise to do evil.','Intermediate','KJV','Longsuffering','');
INSERT INTO `longsuffering_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Proverbs 15:18','A wrathful man stirreth up strife: but he that is slow to anger appeaseth strife.','Easy','KJV','Longsuffering','');
INSERT INTO `longsuffering_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('1 Corinthians 13:4','Charity suffereth long, and is kind; charity envieth not; charity vaunteth not itself, is not puffed up.','Easy','KJV','Longsuffering','');
INSERT INTO `longsuffering_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Genesis 29:20A','And Jacob served seven years for Rachel; and they seemed unto him but a few days, for the love he had to her.','Easy','KJV','Longsuffering','');
INSERT INTO `longsuffering_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Habakkuk 2:3','For the vision is yet for an appointed time, but at the end it shall speak, and not lie: though it tarry, wait for it; because it will surely come, it will not tarry.','Intermediate','KJV','Longsuffering','');
INSERT INTO `longsuffering_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Psalm 27:14','Wait on the Lord: be of good courage, and he shall strengthen thine heart: wait, I say, on the Lord.','Intermediate','KJV','Longsuffering','');
INSERT INTO `longsuffering_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Galatians 6:9','And let us not be weary in well doing: for in due season we shall reap, if we faint not.','Intermediate','KJV','Longsuffering','');
INSERT INTO `longsuffering_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('James 5:7-8','Be patient therefore, brethren, unto the coming of the Lord. Behold, the husbandman waiteth for the precious fruit of the earth, and hath long patience for it, until he receive the early and latter rain. Be ye also patient; stablish your hearts: for the coming of the Lord draweth nigh.','Difficult','KJV','Longsuffering','');
INSERT INTO `longsuffering_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Numbers 14:18','The Lord is longsuffering, and of great mercy, forgiving iniquity and transgression, and by no means clearing the guilty, visiting the iniquity of the fathers upon the children unto the third and fourth generation.','Difficult','KJV','Longsuffering','');
INSERT INTO `longsuffering_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Psalm 103:8','The Lord is merciful and gracious, slow to anger, and plenteous in mercy.','Easy','KJV','Longsuffering','');
INSERT INTO `longsuffering_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Romans 9:22-23','What if God, willing to shew his wrath, and to make his power known, endured with much longsuffering the vessels of wrath fitted to destruction: And that he might make known the riches of his glory on the vessels of mercy, which he had afore prepared unto glory.','Difficult','KJV','Longsuffering','');
INSERT INTO `longsuffering_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('1 Timothy 1:16','Howbeit for this cause I obtained mercy, that in me first Jesus Christ might shew forth all longsuffering, for a pattern to them which should hereafter believe on him to life everlasting.','Difficult','KJV','Longsuffering','');
INSERT INTO `longsuffering_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Revelation 6:10-11','And they cried with a loud voice, saying, How long, O Lord, holy and true, dost thou not judge and avenge our blood on them that dwell on the earth? And white robes were given unto every one of them; and it was said unto them, that they should rest yet for a little season, until their fellowservants also and their brethren, that should be killed as they were, should be fulfilled.','Difficult','KJV','Longsuffering','');
INSERT INTO `longsuffering_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Ecclesiastes 7:8','Better is the end of a thing than the beginning thereof: and the patient in spirit is better than the proud in spirit.','Easy','KJV','Longsuffering','');
INSERT INTO `longsuffering_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Hebrews 10:36','For ye have need of patience, that, after ye have done the will of God, ye might receive the promise.','Easy','KJV','Longsuffering','');
INSERT INTO `longsuffering_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Exodus 34:6','And the Lord passed by before him, and proclaimed, The Lord, The Lord God, merciful and gracious, longsuffering, and abundant in goodness and truth.','Intermediate','KJV','Longsuffering','');

INSERT INTO `love_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('John 3:16','For God so loved the world that he gave his only begotten son, that whosoever believes in him shall not perish, but have everlasting life.','Easy','KJV','Love','');
INSERT INTO `love_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('John 15:13','Greater love hath no man than this, that a man lay down his life for his friends.','Easy','KJV','Love','');
INSERT INTO `love_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Romans 13:8','Owe no man any thing, but to love one another: for he that loveth another hath fulfilled the law.','Easy','KJV','Love','');
INSERT INTO `love_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('1 Corinthians 13:4-8','Charity suffereth long, and is kind; charity envieth not; charity vaunteth not itself, is not puffed up, Doth not behave itself unseemly, seeketh not her own, is not easily provoked, thinketh no evil; Rejoiceth not in iniquity, but rejoiceth in the truth; Beareth all things, believeth all things, hopeth all things, endureth all things. Charity never faileth.','Difficult','KJV','Love','');
INSERT INTO `love_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Proverbs 10:12','Hatred stirreth up strifes: but love covereth all sins.','Easy','KJV','Love','');
INSERT INTO `love_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('1 Peter 4:8','And above all things have fervent charity among yourselves: for charity shall cover the multitude of sins.','Intermediate','KJV','Love','');
INSERT INTO `love_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Colossian 3:14','And above all these things put on charity, which is the bond of perfectness.','Easy','KJV','Love','');
INSERT INTO `love_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('John 13:34','A new commandment I give unto you, That ye love one another; as I have loved you, that ye also love one another.','Intermediate','KJV','Love','');
INSERT INTO `love_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Proverbs 17:17','A friend loveth at all times, and a brother is born for adversity.','Easy','KJV','Love','');
INSERT INTO `love_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Romans 12:9','Let love be without dissimulation. Abhor that which is evil; cleave to that which is good.','Intermediate','KJV','Love','');
INSERT INTO `love_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Leviticus 19:18','Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am the Lord.','Easy','KJV','Love','');
INSERT INTO `love_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('1 Corinthians 13:2','And though I have the gift of prophecy, and understand all mysteries, and all knowledge; and though I have all faith, so that I could remove mountains, and have not charity, I am nothing.','Intermediate','KJV','Love','');
INSERT INTO `love_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Matthew 5:44','But I say unto you, Love your enemies, bless them that curse you, do good to them that hate you, and pray for them which despitefully use you, and persecute you;','Easy','KJV','Love','');
INSERT INTO `love_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('1 John 4:18','There is no fear in love; but perfect love casteth out fear: because fear hath torment. He that feareth is not made perfect in love.','Easy','KJV','Love','');
INSERT INTO `love_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Matthew 22:37-40','Jesus said unto him, Thou shalt love the Lord thy God with all thy heart, and with all thy soul, and with all thy mind. This is the first and great commandment. And the second is like unto it, Thou shalt love thy neighbour as thyself. On these two commandments hang all the law and the prophets.','Difficult','KJV','Love','');
INSERT INTO `love_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('1 Corinthians 13:13','And now abideth faith, hope, charity, these three; but the greatest of these is charity.','Easy','KJV','Love','');
INSERT INTO `love_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Song of Solomon 8:6','Set me as a seal upon thine heart, as a seal upon thine arm: for love is strong as death; jealousy is cruel as the grave: the coals thereof are coals of fire, which hath a most vehement flame.','Intermediate','KJV','Love','');
INSERT INTO `love_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('1 John 4:16','And we have known and believed the love that God hath to us. God is love; and he that dwelleth in love dwelleth in God, and God in him.','Easy','KJV','Love','');
INSERT INTO `love_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('1 John 4:12','No man hath seen God at any time. If we love one another, God dwelleth in us, and his love is perfected in us.','Easy','KJV','Love','');

INSERT INTO `meekness_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Psalm 37:11','Blessed are the meek: for they shall inherit the earth.','Easy','KJV','Meekness','');
INSERT INTO `meekness_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('James 3:13','But the meek shall inherit the earth; and shall delight themselves in the abundance of peace.','Easy','KJV','Meekness','');
INSERT INTO `meekness_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Matthew 11:29','Who is a wise man and endued with knowledge among you? let him shew out of a good conversation his works with meekness of wisdom.','Intermediate','KJV','Meekness','');
INSERT INTO `meekness_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Psalm 25:9','Take my yoke upon you, and learn of me; for I am meek and lowly in heart: and ye shall find rest unto your souls.','Easy','KJV','Meekness','');
INSERT INTO `meekness_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Numbers 12:3','The meek will he guide in judgment: and the meek will he teach his way.','Easy','KJV','Meekness','');
INSERT INTO `meekness_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('James 1:21','Now the man Moses was very meek, above all the men which were upon the face of the earth.','Easy','KJV','Meekness','');
INSERT INTO `meekness_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Psalm 147:6','Wherefore lay apart all filthiness and superfluity of naughtiness, and receive with meekness the engrafted word, which is able to save your souls.','Difficult','KJV','Meekness','');
INSERT INTO `meekness_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('1 John 5:4','The Lord lifteth up the meek: he casteth the wicked down to the ground.','Easy','KJV','Meekness','');
INSERT INTO `meekness_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Isaiah 29:19','The meek also shall increase their joy in the Lord, and the poor among men shall rejoice in the Holy One of Israel.','Intermediate','KJV','Meekness','');
INSERT INTO `meekness_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Ecclesiastes 10:4','If the spirit of the ruler rise up against thee, leave not thy place; for yielding pacifieth great offences.','Intermediate','KJV','Meekness','');
INSERT INTO `meekness_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Matthew 23:11','But he that is greatest among you shall be your servant.','Easy','KJV','Meekness','');
INSERT INTO `meekness_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Isaiah 66:2','For all those things hath mine hand made, and all those things have been, saith the Lord: but to this man will I look, even to him that is poor and of a contrite spirit, and trembleth at my word.','Difficult','KJV','Meekness','');
INSERT INTO `meekness_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('James 4:6','But he giveth more grace. Wherefore he saith, God resisteth the proud, but giveth grace unto the humble.','Intermediate','KJV','Meekness','');
INSERT INTO `meekness_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Titus 3:1-2','Put them in mind to be subject to principalities and powers, to obey magistrates, to be ready to every good work, To speak evil of no man, to be no brawlers, but gentle, shewing all meekness unto all men.','Difficult','KJV','Meekness','');
INSERT INTO `meekness_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Isaiah 53&','He was oppressed, and he was afflicted, yet he opened not his mouth: he is brought as a lamb to the slaughter, and as a sheep before her shearers is dumb, so he openeth not his mouth.','Intermediate','KJV','Meekness','');

INSERT INTO `peace_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Phillippians 4:6-7','Be careful for nothing. but in everything by prayer & supplication, with thanksgiving, let your requests be made known unto god. ANd the peace of god which surpasses all understanding shall keep your hearts & minds through christ jesus.','Intermediate','KJV','Peace','');
INSERT INTO `peace_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('John 14:27','Peace I leave with you, my peace I give unto you: not as the world giveth, give I unto you. Let not your heart be troubled, neither let it be afraid.','Easy','KJV','Peace','');
INSERT INTO `peace_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Isaiah 26:3','Thou wilt keep him in perfect peace, whose mind is stayed on thee: because he trusteth in thee.','Easy','KJV','Peace','');
INSERT INTO `peace_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('2 Thessalonians 3:16','Now the Lord of peace himself give you peace always by all means. The Lord be with you all.','Easy','KJV','Peace','');
INSERT INTO `peace_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Psalm 4:8','I will both lay me down in peace, and sleep: for thou, Lord, only makest me dwell in safety.','Easy','KJV','Peace','');
INSERT INTO `peace_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Romans 5:1','Therefore being justified by faith, we have peace with God through our Lord Jesus Christ.','Intermediate','KJV','Peace','');
INSERT INTO `peace_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Colossians 3:15','And let the peace of God rule in your hearts, to the which also ye are called in one body; and be ye thankful.','Intermediate','KJV','Peace','');
INSERT INTO `peace_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Psalm 34:14','Depart from evil, and do good. seek peace, and pursue it.','Easy','KJV','Peace','');
INSERT INTO `peace_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Proverbs 16:7','When a man\'s ways please the Lord, he maketh even his enemies to be at peace with him.','Intermediate','KJV','Peace','');
INSERT INTO `peace_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('John 20:21','Then said Jesus to them again, Peace be unto you: as my Father hath sent me, even so send I you.','Intermediate','KJV','Peace','');
INSERT INTO `peace_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Mark 4:39','And he arose, and rebuked the wind, and said unto the sea, Peace, be still. And the wind ceased, and there was a great calm.','Difficult','KJV','Peace','');
INSERT INTO `peace_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Matthew 5:9','Blessed are the peacemakers: for they shall be called the children of God.','Easy','KJV','Peace','');
INSERT INTO `peace_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Hebrews 12:14','Follow peace with all men, and holiness, without which no man shall see the Lord.','Intermediate','KJV','Peace','');
INSERT INTO `peace_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('1 Corinthians 14:33','For God is not the author of confusion, but of peace, as in all churches of the saints.','Intermediate','KJV','Peace','');
INSERT INTO `peace_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('James 3:17','But the wisdom that is from above is first pure, then peaceable, gentle, and easy to be intreated, full of mercy and good fruits, without partiality, and without hypocrisy.','Difficult','KJV','Peace','');
INSERT INTO `peace_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Romans 8:6','For to be carnally minded is death; but to be spiritually minded is life and peace.','Easy','KJV','Peace','');
INSERT INTO `peace_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Psalm 29:11','The Lord will give strength unto his people; the Lord will bless his people with peace.','Easy','KJV','Peace','');
INSERT INTO `peace_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Romans 12:18','If it be possible, as much as lieth in you, live peaceably with all men.','Easy','KJV','Peace','');

INSERT INTO `temperance_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Proverbs 16:32','He that is slow to anger is better than the mighty; and he that ruleth his spirit than he that taketh a city.','Easy','KJV','Temperance','');
INSERT INTO `temperance_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Romans 8:13','For if ye live after the flesh, ye shall die: but if ye through the Spirit do mortify the deeds of the body, ye shall live.','Easy','KJV','Temperance','');
INSERT INTO `temperance_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Proverbs 25:28','He that hath no rule over his own spirit is like a city that is broken down, and without walls.','Easy','KJV','Temperance','');
INSERT INTO `temperance_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Romans 8:6','For to be carnally minded is death; but to be spiritually minded is life and peace.','Easy','KJV','Temperance','');
INSERT INTO `temperance_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('1 Peter 1:15','But as he which hath called you is holy, so be ye holy in all manner of conversation.','Easy','KJV','Temperance','');
INSERT INTO `temperance_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('2 Timothy 1:7','For God hath not given us the spirit of fear; but of power, and of love, and of a sound mind.','Easy','KJV','Temperance','');
INSERT INTO `temperance_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Colossians 3:5','Mortify therefore your members which are upon the earth; fornication, uncleanness, inordinate affection, evil concupiscence, and covetousness, which is idolatry:','Intermediate','KJV','Temperance','');
INSERT INTO `temperance_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Romans 14:21','It is good neither to eat flesh, nor to drink wine, nor any thing whereby thy brother stumbleth, or is offended, or is made weak.','Difficult','KJV','Temperance','');
INSERT INTO `temperance_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Galatians 5:23','Meekness, temperance: against such there is no law.','Easy','KJV','Temperance','');
INSERT INTO `temperance_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('1 Corinthians 9:25-27','And every man that striveth for the mastery is temperate in all things. Now they do it to obtain a corruptible crown; but we an incorruptible. I therefore so run, not as uncertainly; so fight I, not as one that beateth the air: But I keep under my body, and bring it into subjection: lest that by any means, when I have preached to others, I myself should be a castaway.','Difficult','KJV','Temperance','');
INSERT INTO `temperance_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Proverbs 23:1-3','When thou sittest to eat with a ruler, consider diligently what is before thee: And put a knife to thy throat, if thou be a man given to appetite. Be not desirous of his dainties: for they are deceitful meat.','Difficult','KJV','Temperance','');
INSERT INTO `temperance_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Galatians 5:16','This I say then, Walk in the Spirit, and ye shall not fulfil the lust of the flesh.','Easy','KJV','Temperance','');
INSERT INTO `temperance_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('2 Peter 1:5-6','And beside this, giving all diligence, add to your faith virtue; and to virtue knowledge; And to knowledge temperance; and to temperance patience; and to patience godliness;','Difficult','KJV','Temperance','');
INSERT INTO `temperance_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Titus 2:12','Teaching us that, denying unGodliness and worldly lusts, we should live soberly, righteously, and godly, in this present world.','Intermediate','KJV','Temperance','');
INSERT INTO `temperance_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Romans 13:14','But put ye on the Lord Jesus Christ, and make not provision for the flesh, to fulfil the lusts thereof.','Intermediate','KJV','Temperance','');
INSERT INTO `temperance_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Philippians 4:5','Let your moderation be known unto all men. The Lord is at hand.','Intermediate','KJV','Temperance','');
INSERT INTO `temperance_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Proverbs 25:16','Hast thou found honey? eat so much as is sufficient for thee, lest thou be filled therewith, and vomit it.','Difficult','KJV','Temperance','');
INSERT INTO `temperance_scripture` (`VERSE`,`SCRIPTURE`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Ecclesiastes 7:9','Be not hasty in thy spirit to be angry: for anger resteth in the bosom of fools.','Easy','KJV','Temperance','');

INSERT INTO `faith_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('For we walk by faith, not by sight.','2 Corinthians 5:7','Easy','KJV','Faith','');
INSERT INTO `faith_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('So then faith cometh by hearing, and hearing by the word of God.','Romans 10:17','Easy','KJV','Faith','');
INSERT INTO `faith_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Jesus said unto him, \'If thou canst believe, all things are possible to him that believeth.\'','Mark 9:23','Easy','KJV','Faith','');
INSERT INTO `faith_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('And all things, whatsoever ye shall ask in prayer, believing, ye shall receive.','Matthew 21:22','Easy','KJV','Faith','');
INSERT INTO `faith_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Even so faith, if it hath not works, is dead, being alone.','James 2:17','Easy','KJV','Faith','');
INSERT INTO `faith_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Behold, his soul which is lifted up is not upright in him: but the just shall live by his faith.','Habakkuk 2:4','Easy','KJV','Faith','');
INSERT INTO `faith_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('If we believe not, yet he abideth faithful: he cannot deny himself.','2 Timothy 2:13','Easy','KJV','Faith','');
INSERT INTO `faith_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('For whatsoever is born of God overcometh the world: and this is the victory that overcometh the world, even our faith.','1 John 5:4','Intermediate','KJV','Faith','');
INSERT INTO `faith_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('For by grace are ye saved through faith, and that not of yourselves. It is the gift of God - not of works, lest any man should boast.','Ephesians 2:8-9','Intermediate','KJV','Faith','');
INSERT INTO `faith_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Knowing this, that the trying of your faith works patience...But let him ask in faith, nothing wavering. For he that wavers is like a wave of the sea driven with the wind and tossed.','James 1:3, 6','Intermediate','KJV','Faith','');
INSERT INTO `faith_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('And Jesus said unto them, Because of your unbelief: for verily I say unto you, If ye have faith as a grain of mustard seed, ye shall say unto this mountain, Remove hence to yonder place; and it shall remove; and nothing shall be impossible unto you. Howbeit this kind goeth not out but by prayer and fasting.','Matthew 17:20-21','Difficult','KJV','Faith','');
INSERT INTO `faith_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Now faith is the substance of things hoped for, the evidence of things not seen. For by it the elders obtained a good report. Through faith we understand that the worlds were framed by the word of God, so that things which are seen were not made of things which do appear.','Hebrews 11:1-3','Difficult','KJV','Faith','');
INSERT INTO `faith_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('But without faith it is impossible to please him: for he that cometh to God must believe that he is, and that he is a rewarder of them that diligently seek him.','Hebrews 11:6','Difficult','KJV','Faith','');
INSERT INTO `faith_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Through faith also Sara herself received strength to conceive seed, and was delivered of a child when she was past age, because she judged him faithful who had promised.','Hebrews 11:11','Difficult','KJV','Faith','');

INSERT INTO `gentleness_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('A soft answer turneth away wrath: but grievous words stir up anger.','Proverbs 15:1','Easy','KJV','Gentleness','');
INSERT INTO `gentleness_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Pleasant words are as an honeycomb, sweet to the soul, and health to the bones.','Proverbs 16:25','Easy','KJV','Gentleness','');
INSERT INTO `gentleness_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES (' But sanctify the Lord God in your hearts: and be ready always to give an answer to every man that asketh you a reason of the hope that is in you with meekness and fear:','1 Peter 3:15','Intermediate','KJV','Gentleness','');
INSERT INTO `gentleness_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Put on therefore, as the elect of God, holy and beloved, bowels of mercies, kindness, humbleness of mind, meekness, longsuffering.','Colossians 3:12','Intermediate','KJV','Gentleness','');
INSERT INTO `gentleness_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('To speak evil of no man, to be no brawlers, but gentle, shewing all meekness unto all men.','Titus 3:2','Easy','KJV','Gentleness','');
INSERT INTO `gentleness_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('With all lowliness and meekness, with longsuffering, forbearing one another in love.','Ephesians 4:2','Intermediate','KJV','Gentleness','');
INSERT INTO `gentleness_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('But thou, O man of God, flee these things; and follow after righteousness, godliness, faith, love, patience, meekness.','1 Timothy 6:11','Easy','KJV','Gentleness','');
INSERT INTO `gentleness_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('But let it be the hidden man of the heart, in that which is not corruptible, even the ornament of a meek and quiet spirit, which is in the sight of God of great price.','1 Peter 3:4','Difficult','KJV','Gentleness','');
INSERT INTO `gentleness_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Take my yoke upon you, and learn of me; for I am meek and lowly in heart: and ye shall find rest unto your souls. For my yoke is easy, and my burden is light.','Matthew 11:29-30','Intermediate','KJV','Gentleness','');
INSERT INTO `gentleness_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('By long forbearing is a prince persuaded, and a soft tongue breaketh the bone.','Proverbs 25:15','Difficult','KJV','Gentleness','');
INSERT INTO `gentleness_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('And after the earthquake a fire; but the Lord was not in the fire: and after the fire a still small voice.','1 Kings 19:12','Intermediate','KJV','Gentleness','');
INSERT INTO `gentleness_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Brethren, if a man be overtaken in a fault, ye which are spiritual, restore such an one in the spirit of meekness; considering thyself, lest thou also be tempted.','Galatians 6:1','Intermediate','KJV','Gentleness','');
INSERT INTO `gentleness_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('And the servant of the Lord must not strive; but be gentle unto all men, apt to teach, patient, in meekness instructing those that oppose themselves; if God peradventure will give them repentance to the acknowledging of the truth.','2 Timothy 2:24-25','Difficult','KJV','Gentleness','');

INSERT INTO `goodness_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('I had fainted, unless I had believed to see the goodness of the Lord in the land of the living. Wait on the Lord: be of good courage, and he shall strengthen thine heart: wait, I say, on the Lord.','Psalm 27:13-14','Intermediate','KJV','Goodness','');
INSERT INTO `goodness_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Surely goodness and mercy shall follow me all the days of my life: and I will dwell in the house of the Lord for ever.','Psalm 23:6','Easy','KJV','Goodness','');
INSERT INTO `goodness_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('The Lord is good to all: and his tender mercies are over all his works.','Psalm 145:9','Easy','KJV','Goodness','');
INSERT INTO `goodness_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('And Jesus said unto him, Why callest thou me good? there is none good but one, that is, God.','Mark 10:18','Easy','KJV','Goodness','');
INSERT INTO `goodness_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Every good gift and every perfect gift is from above, and cometh down from the Father of lights, with whom is no variableness, neither shadow of turning.','James 1:17','Intermediate','KJV','Goodness','');
INSERT INTO `goodness_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('If ye then, being evil, know how to give good gifts unto your children, how much more shall your Father which is in heaven give good things to them that ask him?','Matthew 7:11','Intermediate','KJV','Goodness','');
INSERT INTO `goodness_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('He loveth righteousness and judgment: the earth is full of the goodness of the Lord.','Psalm 33:5','Easy','KJV','Goodness','');
INSERT INTO `goodness_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Oh that men would praise the Lord for his goodness, and for his wonderful works to the children of men! For he satisfieth the longing soul, and filleth the hungry soul with goodness.','Psalm 107:8-9','Intermediate','KJV','Goodness','');
INSERT INTO `goodness_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Thou gavest also thy good spirit to instruct them, and withheldest not thy manna from their mouth, and gavest them water for their thirst.','Nehemiah 9:20','Intermediate','KJV','Goodness','');
INSERT INTO `goodness_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('The Lord is good, a strong hold in the day of trouble; and he knoweth them that trust in him.','Nahum 1:7','Easy','KJV','Goodness','');
INSERT INTO `goodness_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Oh how great is thy goodness, which thou hast laid up for them that fear thee; which thou hast wrought for them that trust in thee before the sons of men! Thou shalt hide them in the secret of thy presence from the pride of man: thou shalt keep them secretly in a pavilion from the strife of tongues.','Psalm 31:19-20','Difficult','KJV','Goodness','');
INSERT INTO `goodness_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('O my soul, thou hast said unto the Lord, Thou art my Lord: my goodness extendeth not to thee;','Psalm 16:2','Difficult','KJV','Goodness','');
INSERT INTO `goodness_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('O taste and see that the Lord is good: blessed is the man that trusteth in him.','Psalm 34:8','Easy','KJV','Goodness','');
INSERT INTO `goodness_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('For the Lord God is a sun and shield: the Lord will give grace and glory: no good thing will he withhold from them that walk uprightly.','Psalm 84:11','Intermediate','KJV','Goodness','');
INSERT INTO `goodness_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('For thou, Lord, art good, and ready to forgive; and plenteous in mercy unto all them that call upon thee.','Psalm 86:5','Easy','KJV','Goodness','');
INSERT INTO `goodness_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('But love ye your enemies, and do good, and lend, hoping for nothing again; and your reward shall be great, and ye shall be the children of the Highest: for he is kind unto the unthankful and to the evil.','Luke 6:35','Difficult','KJV','Goodness','');
INSERT INTO `goodness_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Nevertheless he left not himself without witness, in that he did good, and gave us rain from heaven, and fruitful seasons, filling our hearts with food and gladness.','Acts 14:17','Intermediate','KJV','Goodness','');
INSERT INTO `goodness_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('And we know that all things work together for good to them that love God, to them who are the called according to his purpose.','Romans 8:28','Easy','KJV','Goodness','');
INSERT INTO `goodness_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('But I say unto you which hear, Love your enemies, do good to them which hate you, Bless them that curse you, and pray for them which despitefully use you.','Luke 6:27-28','Intermediate','KJV','Goodness','');

INSERT INTO `joy_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('My brethren, count it all joy when ye fall into divers temptations; Knowing this, that the trying of your faith worketh patience.','James 1:2-3','Easy','KJV','Joy','');
INSERT INTO `joy_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Hitherto have ye asked nothing in my name: ask, and ye shall receive, that your joy may be full.','John 16:24','Easy','KJV','Joy','');
INSERT INTO `joy_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Then he said unto them, Go your way, eat the fat, and drink the sweet, and send portions unto them for whom nothing is prepared: for this day is holy unto our Lord: neither be ye sorry; for the joy of the Lord is your strength.','Nehemiah 8 :10','Intermediate','KJV','Joy','');
INSERT INTO `joy_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('And the ransomed of the Lord shall return, and come to Zion with songs and everlasting joy upon their heads: they shall obtain joy and gladness, and sorrow and sighing shall flee away.','Isaiah 35:10','Intermediate','KJV','Joy','');
INSERT INTO `joy_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('For his anger endureth but a moment; in his favour is life: weeping may endure for a night, but joy cometh in the morning.','Psalm 30:5','Easy','KJV','Joy','');
INSERT INTO `joy_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Rejoice in the lord alway; and again, I say rejoice.','Philippians 4:4','Easy','KJV','Joy','');
INSERT INTO `joy_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('For the kingdom of God is not meat and drink; but righteousness, and peace, and joy in the Holy Ghost.','Romans 14:17','Easy','KJV','Joy','');
INSERT INTO `joy_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('And ye now therefore have sorrow: but I will see you again, and your heart shall rejoice, and your joy no man taketh from you.','John 16:22','Intermediate','KJV','Joy','');
INSERT INTO `joy_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('And not only so, but we glory in tribulations also: knowing that tribulation worketh patience; And patience, experience; and experience, hope: And hope maketh not ashamed; because the love of God is shed abroad in our hearts by the Holy Ghost which is given unto us.','Romans 5:3-5','Intermediate','KJV','Joy','');
INSERT INTO `joy_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Thou wilt shew me the path of life: in thy presence is fulness of joy; at thy right hand there are pleasures for evermore.','Psalm 16:11','Intermediate','KJV','Joy','');
INSERT INTO `joy_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('And when he cometh home, he calleth together his friends and neighbours, saying unto them, Rejoice with me; for I have found my sheep which was lost. I say unto you, that likewise joy shall be in heaven over one sinner that repenteth, more than over ninety and nine just persons, which need no repentance.','Luke 15:6-7','Difficult','KJV','Joy','');
INSERT INTO `joy_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Rejoicing in hope; patient in tribulation; continuing instant in prayer;','Romans 12:12','Easy','KJV','Joy','');
INSERT INTO `joy_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('These things have I spoken unto you, that my joy might remain in you, and that your joy might be full.','John 15:11','Easy','KJV','Joy','');
INSERT INTO `joy_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('This is the day which the Lord hath made; we will rejoice and be glad in it.','Psalm 118:24','Easy','KJV','Joy','');
INSERT INTO `joy_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('The hope of the righteous shall be gladness: but the expectation of the wicked shall perish.','Proverbs 10:28','Intermediate','KJV','Joy','');
INSERT INTO `joy_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('My lips shall greatly rejoice when I sing unto thee; and my soul, which thou hast redeemed.','Psalm 71:23','Easy','KJV','Joy','');
INSERT INTO `joy_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('The Lord thy God in the midst of thee is mighty; he will save, he will rejoice over thee with joy; he will rest in his love, he will joy over thee with singing.','Zephaniah 3:17','Intermediate','KJV','Joy','');
INSERT INTO `joy_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Looking unto Jesus the author and finisher of our faith; who for the joy that was set before him endured the cross, despising the shame, and is set down at the right hand of the throne of God.','Hebrews 12:2','Intermediate','KJV','Joy','');
INSERT INTO `joy_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Rejoice evermore. Pray without ceasing. In every thing give thanks: for this is the will of God in Christ Jesus concerning you.','1 Thessalonians 5:16-18','Easy','KJV','Joy','');
INSERT INTO `joy_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Glory and honour are in his presence; strength and gladness are in his place.','1 Chronicles 16:27','Easy','KJV','Joy','');
INSERT INTO `joy_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Be glad in the Lord, and rejoice, ye righteous: and shout for joy, all ye that are upright in heart.','Psalm 32:11','Easy','KJV','Joy','');
INSERT INTO `joy_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('For ye shall go out with joy, and be led forth with peace: the mountains and the hills shall break forth before you into singing, and all the trees of the field shall clap their hands.','Isaiah 55:12','Intermediate','KJV','Joy','');
INSERT INTO `joy_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('They that sow in tears shall reap in joy.','Psalm 126:5','Easy','KJV','Joy','');
INSERT INTO `joy_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Make a joyful noise unto the Lord, all ye lands.','Psalm 100:1','Easy','KJV','Joy','');
INSERT INTO `joy_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Thy words were found, and I did eat them; and thy word was unto me the joy and rejoicing of mine heart: for I am called by thy name, O Lord God of hosts.','Jeremiah 15:16','Intermediate','KJV','Joy','');
INSERT INTO `joy_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Deceit is in the heart of them that imagine evil: but to the counsellors of peace is joy.','Proverbs 12:20','Intermediate','KJV','Joy','');

INSERT INTO `longsuffering_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Wherefore seeing we also are compassed about with so great a cloud of witnesses, let us lay aside every weight, and the sin which doth so easily beset us, and let us run with patience the race that is set before us.','Hebrews 12:1','Easy','KJV','Longsuffering','');
INSERT INTO `longsuffering_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('The Lord is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.','2 Peter 3:9','Intermediate','KJV','Longsuffering','');
INSERT INTO `longsuffering_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Rejoicing in hope; patient in tribulation; continuing instant in prayer.','Romans 12:12','Easy','KJV','Longsuffering','');
INSERT INTO `longsuffering_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Rest in the Lord, and wait patiently for him: fret not thyself because of him who prospereth in his way, because of the man who bringeth wicked devices to pass. Cease from anger, and forsake wrath: fret not thyself in any wise to do evil.','Psalm 37:7-8','Intermediate','KJV','Longsuffering','');
INSERT INTO `longsuffering_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('A wrathful man stirreth up strife: but he that is slow to anger appeaseth strife.','Proverbs 15:18','Easy','KJV','Longsuffering','');
INSERT INTO `longsuffering_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Charity suffereth long, and is kind; charity envieth not; charity vaunteth not itself, is not puffed up.','1 Corinthians 13:4','Easy','KJV','Longsuffering','');
INSERT INTO `longsuffering_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('And Jacob served seven years for Rachel; and they seemed unto him but a few days, for the love he had to her.','Genesis 29:20A','Easy','KJV','Longsuffering','');
INSERT INTO `longsuffering_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('For the vision is yet for an appointed time, but at the end it shall speak, and not lie: though it tarry, wait for it; because it will surely come, it will not tarry.','Habakkuk 2:3','Intermediate','KJV','Longsuffering','');
INSERT INTO `longsuffering_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Wait on the Lord: be of good courage, and he shall strengthen thine heart: wait, I say, on the Lord.','Psalm 27:14','Intermediate','KJV','Longsuffering','');
INSERT INTO `longsuffering_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('And let us not be weary in well doing: for in due season we shall reap, if we faint not.','Galatians 6:9','Intermediate','KJV','Longsuffering','');
INSERT INTO `longsuffering_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Be patient therefore, brethren, unto the coming of the Lord. Behold, the husbandman waiteth for the precious fruit of the earth, and hath long patience for it, until he receive the early and latter rain. Be ye also patient; stablish your hearts: for the coming of the Lord draweth nigh.','James 5:7-8','Difficult','KJV','Longsuffering','');
INSERT INTO `longsuffering_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('The Lord is longsuffering, and of great mercy, forgiving iniquity and transgression, and by no means clearing the guilty, visiting the iniquity of the fathers upon the children unto the third and fourth generation.','Numbers 14:18','Difficult','KJV','Longsuffering','');
INSERT INTO `longsuffering_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('The Lord is merciful and gracious, slow to anger, and plenteous in mercy.','Psalm 103:8','Easy','KJV','Longsuffering','');
INSERT INTO `longsuffering_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('What if God, willing to shew his wrath, and to make his power known, endured with much longsuffering the vessels of wrath fitted to destruction: And that he might make known the riches of his glory on the vessels of mercy, which he had afore prepared unto glory.','Romans 9:22-23','Difficult','KJV','Longsuffering','');
INSERT INTO `longsuffering_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Howbeit for this cause I obtained mercy, that in me first Jesus Christ might shew forth all longsuffering, for a pattern to them which should hereafter believe on him to life everlasting.','1 Timothy 1:16','Difficult','KJV','Longsuffering','');
INSERT INTO `longsuffering_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('And they cried with a loud voice, saying, How long, O Lord, holy and true, dost thou not judge and avenge our blood on them that dwell on the earth? And white robes were given unto every one of them; and it was said unto them, that they should rest yet for a little season, until their fellowservants also and their brethren, that should be killed as they were, should be fulfilled.','Revelation 6:10-11','Difficult','KJV','Longsuffering','');
INSERT INTO `longsuffering_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Better is the end of a thing than the beginning thereof: and the patient in spirit is better than the proud in spirit.','Ecclesiastes 7:8','Easy','KJV','Longsuffering','');
INSERT INTO `longsuffering_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('For ye have need of patience, that, after ye have done the will of God, ye might receive the promise.','Hebrews 10:36','Easy','KJV','Longsuffering','');
INSERT INTO `longsuffering_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('And the Lord passed by before him, and proclaimed, The Lord, The Lord God, merciful and gracious, longsuffering, and abundant in goodness and truth.','Exodus 34:6','Intermediate','KJV','Longsuffering','');

INSERT INTO `love_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('For God so loved the world that he gave his only begotten son, that whosoever believes in him shall not perish, but have everlasting life.','John 3:16','Easy','KJV','Love','');
INSERT INTO `love_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Greater love hath no man than this, that a man lay down his life for his friends.','John 15:13','Easy','KJV','Love','');
INSERT INTO `love_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Owe no man any thing, but to love one another: for he that loveth another hath fulfilled the law.','Romans 13:8','Easy','KJV','Love','');
INSERT INTO `love_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Charity suffereth long, and is kind; charity envieth not; charity vaunteth not itself, is not puffed up, Doth not behave itself unseemly, seeketh not her own, is not easily provoked, thinketh no evil; Rejoiceth not in iniquity, but rejoiceth in the truth; Beareth all things, believeth all things, hopeth all things, endureth all things. Charity never faileth.','1 Corinthians 13:4-8','Difficult','KJV','Love','');
INSERT INTO `love_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Hatred stirreth up strifes: but love covereth all sins.','Proverbs 10:12','Easy','KJV','Love','');
INSERT INTO `love_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('And above all things have fervent charity among yourselves: for charity shall cover the multitude of sins.','1 Peter 4:8','Intermediate','KJV','Love','');
INSERT INTO `love_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('And above all these things put on charity, which is the bond of perfectness.','Colossian 3:14','Easy','KJV','Love','');
INSERT INTO `love_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('A new commandment I give unto you, That ye love one another; as I have loved you, that ye also love one another.','John 13:34','Intermediate','KJV','Love','');
INSERT INTO `love_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('A friend loveth at all times, and a brother is born for adversity.','Proverbs 17:17','Easy','KJV','Love','');
INSERT INTO `love_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Let love be without dissimulation. Abhor that which is evil; cleave to that which is good.','Romans 12:9','Intermediate','KJV','Love','');
INSERT INTO `love_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am the Lord.','Leviticus 19:18','Easy','KJV','Love','');
INSERT INTO `love_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('And though I have the gift of prophecy, and understand all mysteries, and all knowledge; and though I have all faith, so that I could remove mountains, and have not charity, I am nothing.','1 Corinthians 13:2','Intermediate','KJV','Love','');
INSERT INTO `love_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('But I say unto you, Love your enemies, bless them that curse you, do good to them that hate you, and pray for them which despitefully use you, and persecute you;','Matthew 5:44','Easy','KJV','Love','');
INSERT INTO `love_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('There is no fear in love; but perfect love casteth out fear: because fear hath torment. He that feareth is not made perfect in love.','1 John 4:18','Easy','KJV','Love','');
INSERT INTO `love_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Jesus said unto him, Thou shalt love the Lord thy God with all thy heart, and with all thy soul, and with all thy mind. This is the first and great commandment. And the second is like unto it, Thou shalt love thy neighbour as thyself. On these two commandments hang all the law and the prophets.','Matthew 22:37-40','Difficult','KJV','Love','');
INSERT INTO `love_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('And now abideth faith, hope, charity, these three; but the greatest of these is charity.','1 Corinthians 13:13','Easy','KJV','Love','');
INSERT INTO `love_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Set me as a seal upon thine heart, as a seal upon thine arm: for love is strong as death; jealousy is cruel as the grave: the coals thereof are coals of fire, which hath a most vehement flame.','Song of Solomon 8:6','Intermediate','KJV','Love','');
INSERT INTO `love_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('And we have known and believed the love that God hath to us. God is love; and he that dwelleth in love dwelleth in God, and God in him.','1 John 4:16','Easy','KJV','Love','');
INSERT INTO `love_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('No man hath seen God at any time. If we love one another, God dwelleth in us, and his love is perfected in us.','1 John 4:12','Easy','KJV','Love','');

INSERT INTO `meekness_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Blessed are the meek: for they shall inherit the earth.','Psalm 37:11','Easy','KJV','Meekness','');
INSERT INTO `meekness_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('But the meek shall inherit the earth; and shall delight themselves in the abundance of peace.','James 3:13','Easy','KJV','Meekness','');
INSERT INTO `meekness_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Who is a wise man and endued with knowledge among you? let him shew out of a good conversation his works with meekness of wisdom.','Matthew 11:29','Intermediate','KJV','Meekness','');
INSERT INTO `meekness_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Take my yoke upon you, and learn of me; for I am meek and lowly in heart: and ye shall find rest unto your souls.','Psalm 25:9','Easy','KJV','Meekness','');
INSERT INTO `meekness_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('The meek will he guide in judgment: and the meek will he teach his way.','Numbers 12:3','Easy','KJV','Meekness','');
INSERT INTO `meekness_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Now the man Moses was very meek, above all the men which were upon the face of the earth.','James 1:21','Easy','KJV','Meekness','');
INSERT INTO `meekness_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Wherefore lay apart all filthiness and superfluity of naughtiness, and receive with meekness the engrafted word, which is able to save your souls.','Psalm 147:6','Difficult','KJV','Meekness','');
INSERT INTO `meekness_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('The Lord lifteth up the meek: he casteth the wicked down to the ground.','1 John 5:4','Easy','KJV','Meekness','');
INSERT INTO `meekness_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('The meek also shall increase their joy in the Lord, and the poor among men shall rejoice in the Holy One of Israel.','Isaiah 29:19','Intermediate','KJV','Meekness','');
INSERT INTO `meekness_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('If the spirit of the ruler rise up against thee, leave not thy place; for yielding pacifieth great offences.','Ecclesiastes 10:4','Intermediate','KJV','Meekness','');
INSERT INTO `meekness_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('But he that is greatest among you shall be your servant.','Matthew 23:11','Easy','KJV','Meekness','');
INSERT INTO `meekness_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('For all those things hath mine hand made, and all those things have been, saith the Lord: but to this man will I look, even to him that is poor and of a contrite spirit, and trembleth at my word.','Isaiah 66:2','Difficult','KJV','Meekness','');
INSERT INTO `meekness_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('But he giveth more grace. Wherefore he saith, God resisteth the proud, but giveth grace unto the humble.','James 4:6','Intermediate','KJV','Meekness','');
INSERT INTO `meekness_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Put them in mind to be subject to principalities and powers, to obey magistrates, to be ready to every good work, To speak evil of no man, to be no brawlers, but gentle, shewing all meekness unto all men.','Titus 3:1-2','Difficult','KJV','Meekness','');
INSERT INTO `meekness_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('He was oppressed, and he was afflicted, yet he opened not his mouth: he is brought as a lamb to the slaughter, and as a sheep before her shearers is dumb, so he openeth not his mouth.','Isaiah 53&','Intermediate','KJV','Meekness','');

INSERT INTO `peace_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Be careful for nothing. but in everything by prayer & supplication, with thanksgiving, let your requests be made known unto god. ANd the peace of god which surpasses all understanding shall keep your hearts & minds through christ jesus.','Phillippians 4:6-7','Intermediate','KJV','Peace','');
INSERT INTO `peace_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Peace I leave with you, my peace I give unto you: not as the world giveth, give I unto you. Let not your heart be troubled, neither let it be afraid.','John 14:27','Easy','KJV','Peace','');
INSERT INTO `peace_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Thou wilt keep him in perfect peace, whose mind is stayed on thee: because he trusteth in thee.','Isaiah 26:3','Easy','KJV','Peace','');
INSERT INTO `peace_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Now the Lord of peace himself give you peace always by all means. The Lord be with you all.','2 Thessalonians 3:16','Easy','KJV','Peace','');
INSERT INTO `peace_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('I will both lay me down in peace, and sleep: for thou, Lord, only makest me dwell in safety.','Psalm 4:8','Easy','KJV','Peace','');
INSERT INTO `peace_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Therefore being justified by faith, we have peace with God through our Lord Jesus Christ.','Romans 5:1','Intermediate','KJV','Peace','');
INSERT INTO `peace_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('And let the peace of God rule in your hearts, to the which also ye are called in one body; and be ye thankful.','Colossians 3:15','Intermediate','KJV','Peace','');
INSERT INTO `peace_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Depart from evil, and do good. seek peace, and pursue it.','Psalm 34:14','Easy','KJV','Peace','');
INSERT INTO `peace_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('When a man\'s ways please the Lord, he maketh even his enemies to be at peace with him.','Proverbs 16:7','Intermediate','KJV','Peace','');
INSERT INTO `peace_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Then said Jesus to them again, Peace be unto you: as my Father hath sent me, even so send I you.','John 20:21','Intermediate','KJV','Peace','');
INSERT INTO `peace_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('And he arose, and rebuked the wind, and said unto the sea, Peace, be still. And the wind ceased, and there was a great calm.','Mark 4:39','Difficult','KJV','Peace','');
INSERT INTO `peace_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Blessed are the peacemakers: for they shall be called the children of God.','Matthew 5:9','Easy','KJV','Peace','');
INSERT INTO `peace_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Follow peace with all men, and holiness, without which no man shall see the Lord.','Hebrews 12:14','Intermediate','KJV','Peace','');
INSERT INTO `peace_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('For God is not the author of confusion, but of peace, as in all churches of the saints.','1 Corinthians 14:33','Intermediate','KJV','Peace','');
INSERT INTO `peace_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('But the wisdom that is from above is first pure, then peaceable, gentle, and easy to be intreated, full of mercy and good fruits, without partiality, and without hypocrisy.','James 3:17','Difficult','KJV','Peace','');
INSERT INTO `peace_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('For to be carnally minded is death; but to be spiritually minded is life and peace.','Romans 8:6','Easy','KJV','Peace','');
INSERT INTO `peace_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('The Lord will give strength unto his people; the Lord will bless his people with peace.','Psalm 29:11','Easy','KJV','Peace','');
INSERT INTO `peace_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('If it be possible, as much as lieth in you, live peaceably with all men.','Romans 12:18','Easy','KJV','Peace','');

INSERT INTO `temperance_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('He that is slow to anger is better than the mighty; and he that ruleth his spirit than he that taketh a city.','Proverbs 16:32','Easy','KJV','Temperance','');
INSERT INTO `temperance_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('For if ye live after the flesh, ye shall die: but if ye through the Spirit do mortify the deeds of the body, ye shall live.','Romans 8:13','Easy','KJV','Temperance','');
INSERT INTO `temperance_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('He that hath no rule over his own spirit is like a city that is broken down, and without walls.','Proverbs 25:28','Easy','KJV','Temperance','');
INSERT INTO `temperance_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('For to be carnally minded is death; but to be spiritually minded is life and peace.','Romans 8:6','Easy','KJV','Temperance','');
INSERT INTO `temperance_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('But as he which hath called you is holy, so be ye holy in all manner of conversation.','1 Peter 1:15','Easy','KJV','Temperance','');
INSERT INTO `temperance_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('For God hath not given us the spirit of fear; but of power, and of love, and of a sound mind.','2 Timothy 1:7','Easy','KJV','Temperance','');
INSERT INTO `temperance_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Mortify therefore your members which are upon the earth; fornication, uncleanness, inordinate affection, evil concupiscence, and covetousness, which is idolatry:','Colossians 3:5','Intermediate','KJV','Temperance','');
INSERT INTO `temperance_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('It is good neither to eat flesh, nor to drink wine, nor any thing whereby thy brother stumbleth, or is offended, or is made weak.','Romans 14:21','Difficult','KJV','Temperance','');
INSERT INTO `temperance_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Meekness, temperance: against such there is no law.','Galatians 5:23','Easy','KJV','Temperance','');
INSERT INTO `temperance_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('And every man that striveth for the mastery is temperate in all things. Now they do it to obtain a corruptible crown; but we an incorruptible. I therefore so run, not as uncertainly; so fight I, not as one that beateth the air: But I keep under my body, and bring it into subjection: lest that by any means, when I have preached to others, I myself should be a castaway.','1 Corinthians 9:25-27','Difficult','KJV','Temperance','');
INSERT INTO `temperance_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('When thou sittest to eat with a ruler, consider diligently what is before thee: And put a knife to thy throat, if thou be a man given to appetite. Be not desirous of his dainties: for they are deceitful meat.','Proverbs 23:1-3','Difficult','KJV','Temperance','');
INSERT INTO `temperance_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('This I say then, Walk in the Spirit, and ye shall not fulfil the lust of the flesh.','Galatians 5:16','Easy','KJV','Temperance','');
INSERT INTO `temperance_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('And beside this, giving all diligence, add to your faith virtue; and to virtue knowledge; And to knowledge temperance; and to temperance patience; and to patience godliness;','2 Peter 1:5-6','Difficult','KJV','Temperance','');
INSERT INTO `temperance_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Teaching us that, denying unGodliness and worldly lusts, we should live soberly, righteously, and godly, in this present world.','Titus 2:12','Intermediate','KJV','Temperance','');
INSERT INTO `temperance_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('But put ye on the Lord Jesus Christ, and make not provision for the flesh, to fulfil the lusts thereof.','Romans 13:14','Intermediate','KJV','Temperance','');
INSERT INTO `temperance_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Let your moderation be known unto all men. The Lord is at hand.','Philippians 4:5','Intermediate','KJV','Temperance','');
INSERT INTO `temperance_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Hast thou found honey? eat so much as is sufficient for thee, lest thou be filled therewith, and vomit it.','Proverbs 25:16','Difficult','KJV','Temperance','');
INSERT INTO `temperance_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('Be not hasty in thy spirit to be angry: for anger resteth in the bosom of fools.','Ecclesiastes 7:9','Easy','KJV','Temperance','');
INSERT INTO `temperance_multichoice` (`QUESTIONS`,`ANSWER`,`LOD`,`TRANSLATION`,`FRUIT`,`CATEGORY`) VALUES ('That the aged men be sober, grave, temperate, sound in faith, in charity, in patience.','Titus 2:2','Intermediate','KJV','Temperance','');

SET FOREIGN_KEY_CHECKS=1;