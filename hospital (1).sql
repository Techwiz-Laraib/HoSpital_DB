-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2024 at 07:53 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_admininfo` (`Roles` VARCHAR(255))   BEGIN
    IF Roles IS NULL THEN
        select * from hospitaladministrators ;
    ELSE
            SELECT Roles FROM hospitaladministrators h
            WHERE h.Roles = Roles;
    END IF;
	END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `search_by_firstname` (IN `search_name` VARCHAR(255))   BEGIN
    SELECT *
    FROM hospitaladministrators
    WHERE firstname = search_name;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `DepartmentID` int(11) NOT NULL,
  `DepartmentName` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`DepartmentID`, `DepartmentName`) VALUES
(1, 'Administration'),
(2, 'Nursing'),
(3, 'Finance');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `DoctorID` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Gender` enum('Male','Female','Other') DEFAULT NULL,
  `Specialization` varchar(100) DEFAULT NULL,
  `HospitalID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`DoctorID`, `FirstName`, `LastName`, `Gender`, `Specialization`, `HospitalID`) VALUES
(1, 'John', 'Doe', 'Male', 'Cardiology', 1),
(2, 'Jane', 'Smith', 'Female', 'Pediatrics', 2),
(3, 'Ahmed', 'Ali', 'Male', 'Orthopedics', 1),
(4, 'Fatima', 'Khan', 'Female', 'Oncology', 3),
(5, 'Michael', 'Johnson', 'Male', 'Neurology', 2),
(6, 'Aisha', 'Ahmed', 'Female', 'Dermatology', 3),
(7, 'David', 'Lee', 'Male', 'Surgery', 1),
(8, 'Sara', 'Garcia', 'Female', 'Internal Medicine', 2),
(9, 'Ali', 'Chowdhury', 'Male', 'Ophthalmology', 1),
(10, 'Maria', 'Lopez', 'Female', 'Psychiatry', 3);

-- --------------------------------------------------------

--
-- Table structure for table `hospitaladministrators`
--

CREATE TABLE `hospitaladministrators` (
  `AdminID` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Gender` enum('Male','Female','Other') DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `Roles` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hospitaladministrators`
--

INSERT INTO `hospitaladministrators` (`AdminID`, `FirstName`, `LastName`, `Gender`, `Salary`, `Roles`) VALUES
(1, 'Raza', 'Meer', 'Male', 50000.00, 'CEO'),
(2, 'Muhammad', 'Ahsan', 'Male', 40000.00, 'COO'),
(3, 'Shazia', 'Batool', 'Female', 35000.00, 'HA'),
(4, 'Amir', 'Hassan', 'Male', 30000.00, 'HIM'),
(5, 'Omar', 'Mehmood', 'Male', 40000.00, 'CHO');

-- --------------------------------------------------------

--
-- Table structure for table `hospitals`
--

CREATE TABLE `hospitals` (
  `HospitalID` int(11) NOT NULL,
  `HospitalName` varchar(100) DEFAULT NULL,
  `Location` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hospitals`
--

INSERT INTO `hospitals` (`HospitalID`, `HospitalName`, `Location`) VALUES
(1, 'Hospital A', 'Sialkot'),
(2, 'Hospital B', 'Rawalpindi'),
(3, 'Hospital C', 'Lahore');

-- --------------------------------------------------------

--
-- Table structure for table `lab`
--

CREATE TABLE `lab` (
  `LabID` int(11) NOT NULL,
  `LabName` varchar(100) DEFAULT NULL,
  `TestName` varchar(100) DEFAULT NULL,
  `Result` varchar(255) DEFAULT NULL,
  `DoctorID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lab`
--

INSERT INTO `lab` (`LabID`, `LabName`, `TestName`, `Result`, `DoctorID`) VALUES
(1, 'Lab A', 'Blood Test', 'Normal', 1),
(2, 'Lab B', 'X-ray', 'Abnormal', 2),
(3, 'Lab A', 'Urinalysis', 'Normal', 3),
(4, 'Lab C', 'MRI', 'Abnormal', 1),
(5, 'Lab B', 'Ultrasound', 'Normal', 2);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `StaffID` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Gender` enum('Male','Female','Other') DEFAULT NULL,
  `DepartmentID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`StaffID`, `FirstName`, `LastName`, `Gender`, `DepartmentID`) VALUES
(1, 'John', 'Doe', 'Male', 1),
(2, 'Jane', 'Smith', 'Female', 2),
(3, 'Ahmed', 'Ali', 'Male', 1),
(4, 'Fatima', 'Khan', 'Female', 2),
(5, 'Michael', 'Johnson', 'Male', 3),
(6, 'Aisha', 'Ahmed', 'Female', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`DepartmentID`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`DoctorID`),
  ADD KEY `HospitalID` (`HospitalID`);

--
-- Indexes for table `hospitaladministrators`
--
ALTER TABLE `hospitaladministrators`
  ADD PRIMARY KEY (`AdminID`);

--
-- Indexes for table `hospitals`
--
ALTER TABLE `hospitals`
  ADD PRIMARY KEY (`HospitalID`);

--
-- Indexes for table `lab`
--
ALTER TABLE `lab`
  ADD PRIMARY KEY (`LabID`),
  ADD KEY `DoctorID` (`DoctorID`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`StaffID`),
  ADD KEY `DepartmentID` (`DepartmentID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `DepartmentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `DoctorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `hospitaladministrators`
--
ALTER TABLE `hospitaladministrators`
  MODIFY `AdminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `hospitals`
--
ALTER TABLE `hospitals`
  MODIFY `HospitalID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `lab`
--
ALTER TABLE `lab`
  MODIFY `LabID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `StaffID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `doctors_ibfk_1` FOREIGN KEY (`HospitalID`) REFERENCES `hospitals` (`HospitalID`);

--
-- Constraints for table `lab`
--
ALTER TABLE `lab`
  ADD CONSTRAINT `lab_ibfk_1` FOREIGN KEY (`DoctorID`) REFERENCES `doctors` (`DoctorID`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`DepartmentID`) REFERENCES `departments` (`DepartmentID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
