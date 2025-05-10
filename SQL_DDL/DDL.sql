-- User Table
CREATE TABLE `User` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT,
  `Email` VARCHAR(40) NOT NULL,
  `Role` VARCHAR(20) DEFAULT NULL,
  `Is_active` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Email_UNIQUE` (`Email`)
);

-- Students Table
CREATE TABLE `Students` (
  `Pid` VARCHAR(20) NOT NULL,
  `Email` VARCHAR(40) NOT NULL,
  `Dept_Code` VARCHAR(20) NOT NULL,
  `Course_Name` VARCHAR(40) NOT NULL,
  `CGPA` FLOAT(4,2) DEFAULT NULL,
  `Semester` INT(3) DEFAULT NULL,
  `Description` VARCHAR(150) DEFAULT NULL,
  `Date_of_birth` DATE DEFAULT NULL,
  PRIMARY KEY (`Pid`),
  FOREIGN KEY (`Email`) REFERENCES `User` (`Email`) ON DELETE CASCADE
);

-- Company Table
CREATE TABLE `Company` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(20) NOT NULL,
  `Location` VARCHAR(30) NOT NULL,
  `Website` VARCHAR(50) NOT NULL,
  `Email` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`Id`)
);

-- Job_Posting Table
CREATE TABLE `Job_Posting` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT,
  `Company_id` INT(11) NOT NULL,
  `Eligibility` VARCHAR(150) NOT NULL,
  `Application_Open_Date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Application_Close_Date` DATETIME NOT NULL,
  `Location` VARCHAR(40) NOT NULL,
  `Job_Description` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`Id`),
  FOREIGN KEY (`Company_id`) REFERENCES `Company` (`Id`) ON DELETE CASCADE
);

-- Job_Applications Table
CREATE TABLE `Job_Applications` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT,
  `Company_id` INT(11) NOT NULL,
  `student_id` VARCHAR(20) NOT NULL,
  `Application_Date` DATETIME NOT NULL,
  PRIMARY KEY (`Id`),
  FOREIGN KEY (`Company_id`) REFERENCES `Company` (`Id`) ON DELETE CASCADE,
  FOREIGN KEY (`student_id`) REFERENCES `Students` (`Pid`) ON DELETE CASCADE
);
