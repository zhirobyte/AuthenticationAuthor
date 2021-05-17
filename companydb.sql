-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2021 at 02:49 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `company`
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dname` varchar(20) DEFAULT NULL,
  `dnumber` int(1) NOT NULL,
  `mgr_ssn` char(9) DEFAULT NULL,
  `mgr_start_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dname`, `dnumber`, `mgr_ssn`, `mgr_start_date`) VALUES
('Headquarters', 1, '888665555', '1981-06-19'),
('Administration', 4, '987654321', '1995-01-01'),
('Research', 5, '333445555', '1988-05-22'),
('IT', 919, '666884444', '2020-04-30');

-- --------------------------------------------------------

--
-- Table structure for table `dependent`
--

CREATE TABLE `dependent` (
  `essn` char(9) NOT NULL,
  `dependent_name` varchar(20) NOT NULL,
  `sex` char(1) DEFAULT NULL,
  `bdate` date DEFAULT NULL,
  `relationship` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dependent`
--

INSERT INTO `dependent` (`essn`, `dependent_name`, `sex`, `bdate`, `relationship`) VALUES
('333445555', 'Aizar', 'M', '2020-04-17', 'Sons'),
('333445555', 'Alice', 'F', '1986-04-05', 'Daughter'),
('333445555', 'Joy', 'F', '1958-05-03', 'Spouse'),
('333445555', 'Theodore', 'M', '1983-10-25', 'Son'),
('987654321', 'Abner', 'M', '1988-01-04', 'Son'),
('987654321', 'Afnan', 'F', '2013-04-01', 'Daughter');

-- --------------------------------------------------------

--
-- Table structure for table `dept_locations`
--

CREATE TABLE `dept_locations` (
  `dnumber` int(1) NOT NULL,
  `dlocation` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dept_locations`
--

INSERT INTO `dept_locations` (`dnumber`, `dlocation`) VALUES
(1, 'Houston'),
(4, 'Stafford'),
(5, 'Austin'),
(5, 'Bellaire'),
(5, 'Sugarland');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `fname` varchar(20) DEFAULT NULL,
  `minit` char(1) DEFAULT NULL,
  `lname` varchar(20) DEFAULT NULL,
  `ssn` char(9) NOT NULL,
  `bdate` date DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `salary` int(5) DEFAULT NULL,
  `super_ssn` char(9) DEFAULT NULL,
  `dno` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`fname`, `minit`, `lname`, `ssn`, `bdate`, `address`, `sex`, `salary`, `super_ssn`, `dno`) VALUES
('John', 'B', 'Smith', '123456789', '1965-01-09', '731 Fondren, Houston, TX', 'M', 30000, '333445555', 5),
('Franklin', 'T', 'Wong', '333445555', '1955-12-08', '638 Voss, Houston, TX', 'M', 40000, '888665555', 5),
('Joyce', 'A', 'English', '453453453', '1972-07-31', '5631 Rice, Houston, TX', 'F', 25000, '333445555', 5),
('Ramesh', 'K', 'Narayan', '666884444', '1920-09-15', '975 Fire Oak, Humble, TX', 'M', 38000, '333445555', 5),
('Melissa', 'M', 'Jones', '808080808', '1970-07-10', '1001 Western, Houston, TX', 'F', 27500, '333445555', 5),
('James', 'E', 'Borg', '888665555', '1937-11-10', '450 Stone, Houston, TX', 'M', 55000, NULL, 1),
('Jennifer', 'S', 'Wallace', '987654321', '1941-06-20', '291 Berry, Bellaire, Tx', 'F', 37000, '888665555', 4),
('Ahmad', 'V', 'Jabbar', '987987987', '1969-03-29', '980 Dallas, Houston, TX', 'M', 22000, '987654321', 4),
('Alicia', 'J', 'Zelaya', '999887777', '1968-01-19', '3321 castle, Spring, TX', 'F', 25000, '987654321', 4);

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `pname` varchar(20) DEFAULT NULL,
  `pnumber` int(2) NOT NULL,
  `plocation` varchar(20) DEFAULT NULL,
  `dnum` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`pname`, `pnumber`, `plocation`, `dnum`) VALUES
('ProductZzz', 1, 'Bellaire', 5),
('ProductYXZ', 2, 'Sugarland', 5),
('ProductZ', 3, 'Houston', 5),
('Computerization', 10, 'Stafford', 4),
('Reorganization', 20, 'Houston', 1),
('Newbenefits', 30, 'Stafford', 4);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userid` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(30) NOT NULL,
  `role` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userid`, `email`, `password`, `name`, `role`) VALUES
(1, '', '$2y$10$lfmnA3g3BWsc4TvnDKEBvOVH6zgzGIP8kmYcrUYlBDc76gm48UZ/y', 'Faiz Hanafi', 'employee'),
(2, 'zhirosec@gmail.com', '$2y$10$1J07h0sZI102yRlMyPOvhO2EVaW2pIiGyOWm07HMQQHfpN5Huo3Fu', 'zhiro security', 'employee'),
(3, 'f.hanafi@students.esqbs.ac.id', '$2y$10$Lb05UIfAGLhp90tHXo5ScejgjhDeEhYm1Sbd35HtNX6DU.XDl.v9O', 'Faiz Hanafi', 'employee'),
(4, 'aaa@gmail.com', '$2y$10$et/5urtVNjSIo0h72CtMu.NuA9efys/J8/1dmvtYvMAmolHlLlBuu', 'zhiro security', 'employee'),
(5, 'aass@gmail.com', '$2y$10$OKlWyif0aMGkYDiS0CWuVOmtYIC4N3ngDyTW9UYEy9K.pQ8XM.cVe', 's', 'employee');

-- --------------------------------------------------------

--
-- Table structure for table `works_on`
--

CREATE TABLE `works_on` (
  `essn` char(9) CHARACTER SET latin1 NOT NULL,
  `pno` int(11) NOT NULL,
  `hours` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `works_on`
--

INSERT INTO `works_on` (`essn`, `pno`, `hours`) VALUES
('123456789', 1, 32),
('123456789', 2, 8),
('123456789', 3, 12),
('333445555', 1, 10),
('333445555', 2, 10),
('333445555', 3, 5),
('333445555', 10, 10),
('333445555', 20, 10),
('333445555', 30, 5),
('453453453', 1, 20),
('453453453', 2, 20),
('888665555', 20, 10),
('987654321', 20, 15),
('987654321', 30, 20),
('987987987', 10, 35),
('987987987', 30, 5),
('999887777', 10, 10),
('999887777', 30, 30);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dnumber`),
  ADD KEY `mgr_ssn` (`mgr_ssn`);

--
-- Indexes for table `dependent`
--
ALTER TABLE `dependent`
  ADD PRIMARY KEY (`essn`,`dependent_name`);

--
-- Indexes for table `dept_locations`
--
ALTER TABLE `dept_locations`
  ADD PRIMARY KEY (`dnumber`,`dlocation`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`ssn`),
  ADD KEY `super_ssn` (`super_ssn`),
  ADD KEY `dno` (`dno`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`pnumber`),
  ADD KEY `dnum` (`dnum`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `works_on`
--
ALTER TABLE `works_on`
  ADD PRIMARY KEY (`essn`,`pno`),
  ADD KEY `pno` (`pno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`mgr_ssn`) REFERENCES `employee` (`ssn`);

--
-- Constraints for table `dependent`
--
ALTER TABLE `dependent`
  ADD CONSTRAINT `dependent_ibfk_1` FOREIGN KEY (`essn`) REFERENCES `employee` (`ssn`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dept_locations`
--
ALTER TABLE `dept_locations`
  ADD CONSTRAINT `dept_locations_ibfk_1` FOREIGN KEY (`dnumber`) REFERENCES `department` (`dnumber`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`super_ssn`) REFERENCES `employee` (`ssn`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`dno`) REFERENCES `department` (`dnumber`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_ibfk_1` FOREIGN KEY (`dnum`) REFERENCES `department` (`dnumber`);

--
-- Constraints for table `works_on`
--
ALTER TABLE `works_on`
  ADD CONSTRAINT `works_on_ibfk_1` FOREIGN KEY (`essn`) REFERENCES `employee` (`ssn`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `works_on_ibfk_2` FOREIGN KEY (`pno`) REFERENCES `project` (`pnumber`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
