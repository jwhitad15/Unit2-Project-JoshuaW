# Welcome to FOTHS

<img width="500" height="268" alt="FOTHS_Logo" src="https://github.com/user-attachments/assets/d1a445c0-e039-4f1b-abc0-b75efced66a6" />

***

**FOTHS**, short for *Fruits of the Holy Spirit*, was created as an educational tool designed to solidify biblical teaching into the minds of its users. 
This application is for the youth, adults, clergy members, and parents alike.
FOTH's main feature comes equipped with three modes:
1. **STUDY**: a flashcard-like mode that displays Scriptures & verse titles to the user.
2. **RECALL**: a mode similar to *STUDY, RECALL* displays a Scripture with an empty text box for users to input the correct verse title.
3. **QUIZ**: a multichoice quiz that displays a single question & with four corresponding options for answers.
In addition to the main feature, Game Mode, FOTHS allows users to register a personal account, create custom goals directly in the application, and have access to additional resources that help facilitate biblical learning.
******

# Play FOTHS On Your Local Device

## General Instructions
* Ensure you have a functional internet browser like Chrome, Safari, Mozilla, etc.
* Download the following editing softwares: **VS Code | IntelliJ IDEA CE | MySQL Workbench | Postman** <--- *click the links to download*
* Clone this GitHub repository to your local machine
* After you copy the repository link, open your device's terminal and enter the following into the command line:
  
  `git clone https://github.com/jwhitad15/Unit2-Project-JoshuaW`

## Frontend Instructions
* Start your VS Code application
* Click *File* >>> click *Open Folder...*

    > <img width="364" height="223" alt="Screenshot 2025-08-15 at 1 36 20 PM" src="https://github.com/user-attachments/assets/819ce306-fd90-4a05-a34d-50ec8b302e13" />
* Navigate to the **FOTHS (Frontend)** directory that was cloned to your local machine
* Double-click the folder or press *open*

## Backend Instructions
* Start your IntelliJ IDEA CE application
* In the upper left hand corner of IntelliJ, you'll see a dropdown menu next to the *| Exit | Minimize | Maximize |* buttons of your application's interface
  
    > <img width="371" height="79" alt="Screenshot 2025-08-15 at 2 16 50 PM" src="https://github.com/user-attachments/assets/9b58a05b-7ceb-43c5-8ace-cca3c39ba913" />
    >
    > Click the dropdown menu, navigate to the **FOTHS (backend)** directory that was cloned to your local machine, then double-click or press *open*
    
or..

* Navigate to the FOTHS (backend) directorv on vour local machine.
* Locate the file named *pom.xmL*> double click > select *Open Project* when prompted (MAKE SURE YOU SELECT OPEN PROJECT & NOT OPEN FILE)!
* Once the project is open in IntelliJ, you may execute the backend code and run the application.
  
### Backend Execution
* In the upper right hand corner of IntelliJ, Click the green *play* button to run the backend of your application.
    > <img width="280" height="103" alt="Screenshot 2025-08-15 at 2 10 34 PM" src="https://github.com/user-attachments/assets/885ec1e0-c537-4d68-b28e-5b963c99b15f" />
    
* To ensure a successful execution of backend code, you should see the term **Tomcat** in the terminal (see image below)
    > <img width="1912" height="94" alt="Screenshot 2025-08-15 at 2 32 14 PM" src="https://github.com/user-attachments/assets/ce84fbfb-2781-4057-a613-e7eca21d4177" />

## Database Instructions
* To run FOTHS with real data, you'll need to successfully download and open MySQL workbench
  
*Assuming you have access to the project's MySQL database...*
  * connect to your local port upon opening MySQL

  > <img width="323" height="203" alt="Screenshot 2025-08-15 at 2 55 59 PM" src="https://github.com/user-attachments/assets/b53502b5-6764-47b0-9520-cce8ac3bf26e" />
  
  * test table population by entering the following query commands for each table:
    
    > `SELECT * FROM user`
    > 
    > `SELECT * FROM scripture`
    > 
    > `SELECT * FROM question`
    >
    > *default table names are *user*, *scripture*, *question**
    
  * After execution of those commands, you should see the Column names for each of the tables in the viewport window.
    * *double check these column names, as they will be important for troubleshooting your backend-database connection (should you need to troubleshoot)*
    * *the column names for each table are as following:*
      
      > USER: first_name, last_name, email, username, password
      > 
      > SCRIPTURE: fruit, scripture, verse, lod (level of difficulty), translation, category
      > 
      > QUESTION: fruit, questions, answer, lod (level of difficulty), translation, category
      > 
      > *it is important to use the **exact** spelling of the column names, as IntelliJ will not recognize variations*
      
      
*Assuming you do NOT have access to the project's MySQL database...*

* If you do not have access to the original database, you will need to:
  * recreate a database in the same way the original was setup
    * *three data tables: user, scripture, question*
      1. In the upper left area of the IDE, click on the *Schemas* tab
      2. Right click inside the *Schemas* window and select *create schema*
      3. Label the schema *FOTHS*
      4. Right click the newly made *FOTHS* database and select *create table*
      5. Label the table *user*
      6. Create two additional tables in this manner - label them **scripture & question**, respectively* 
    * *ensure each of the tables has the exact columns mentioned in the above section
    * check your pom.xml file to ensure it has the MySQL connector; check your backend logic to ensure the data is being fetched from the correct table
  * Once the tables are created according to the instructions, you will need to populate each table
  * You will also need to fetch data from the database (see information on Postman & Java endpoints)

* For more information on how to build a MySQL database, visit YouTube or your favorie search engine

***

## Localhost Ports
**Disclaimer:** *Your ports may be different than the ones listed below!*
* **VS Code Localhost:** 5173
* **IntelliJ IDEA CE Localhost:** 8080
* **MYSQL Localhost:** 3306

***

## FOTHS Technology Stack

**Frontend**
* React
* Node.js

**Backend**
* Maven
* Spring/SpringBoot
* Lombok
* MySQL

**Supplemental**
* Github
* Canva
* Trello
* Google Suite
* Postman
* VSC
* IntelliJ IDEA CE

***
