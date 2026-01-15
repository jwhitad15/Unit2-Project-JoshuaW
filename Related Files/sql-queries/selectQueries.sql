SELECT * FROM user;
SELECT * FROM roles;
SELECT * FROM scripture;
SELECT * FROM question;
SELECT * FROM activity;
SELECT * FROM faith_multichoice;
SELECT * FROM faith_scripture;
SELECT * FROM fruit_category;
SELECT * FROM game_activity;
SELECT * FROM gentleness_multichoice;
SELECT * FROM gentleness_scripture;
SELECT * FROM goodness_multichoice;
SELECT * FROM goodness_scripture;
SELECT * FROM joy_multichoice;
SELECT * FROM joy_scripture;
SELECT * FROM login_activity;
SELECT * FROM longsuffering_multichoice;
SELECT * FROM longsuffering_scripture;
SELECT * FROM love_multichoice;
SELECT * FROM love_scripture;
SELECT * FROM meekness_multichoice;
SELECT * FROM meekness_scripture;
SELECT * FROM peace_multichoice;
SELECT * FROM peace_scripture;
SELECT * FROM scope_activity;
SELECT * FROM temperance_multichoice;
SELECT * FROM temperance_scripture;
SELECT * FROM user_activity;
SELECT * FROM user_profile;

SELECT DATABASE();

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