SELECT * FROM user;
SELECT * FROM scripture;
SELECT * FROM question;

SELECT first_name
FROM user
WHERE last_name = "White";

SELECT first_name, last_name
FROM  user
WHERE password LIKE "%Admin:%";

SELECT verse
FROM  scripture
WHERE fruit = "Joy"
GROUP BY verse, fruit;

SELECT questions
FROM question
WHERE (LENGTH(questions) - LENGTH(REPLACE(questions, ' ', '')) + 1) > 20;