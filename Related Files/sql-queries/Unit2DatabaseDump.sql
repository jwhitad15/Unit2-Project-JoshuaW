SET FOREIGN_KEY_CHECKS=0;

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

SET FOREIGN_KEY_CHECKS=1;