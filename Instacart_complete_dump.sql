CREATE DATABASE  IF NOT EXISTS `instacart_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `instacart_db`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: instacart_db
-- ------------------------------------------------------
-- Server version	5.6.20-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `pk_Address_id` int(11) NOT NULL AUTO_INCREMENT,
  `Street_name` varchar(70) NOT NULL,
  `Apt_number` varchar(30) DEFAULT NULL,
  `City` varchar(45) NOT NULL,
  `State` varchar(45) NOT NULL,
  `Zip` varchar(9) NOT NULL,
  `Address_delete_flag` char(1) DEFAULT 'F',
  PRIMARY KEY (`pk_Address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (5,'181 hemenway st','8','boston','MA','2115','F'),(6,'132 Pikering st','2','San Jose','CA','95103','F'),(7,'165 Hemenway st','B2','Boston','MA','2115','F'),(8,'795 E DRAGRAM',NULL,'TUCSON','AZ','85105','F'),(9,'300 BOYLSTON AVE',NULL,'SEATTLE','WA','98102','F'),(10,'2430 Nouakchott Place',NULL,'Washington','DC','20521','F'),(11,'6606 Tussing Road ',NULL,'Reynoldsburg','OH','43068','F'),(12,'175 hemenway st',NULL,'Boston','MA','2115','F'),(13,'132 Louis Lane',NULL,'New York','NY','10001','F'),(14,'132 Louis Lane',NULL,'New York','NY','10001','F'),(15,'555 Dorchester Ave',NULL,'Dorchester','NJ','5117','F');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `address_v`
--

DROP TABLE IF EXISTS `address_v`;
/*!50001 DROP VIEW IF EXISTS `address_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `address_v` (
  `pk_Address_id` tinyint NOT NULL,
  `Street_name` tinyint NOT NULL,
  `Apt_number` tinyint NOT NULL,
  `City` tinyint NOT NULL,
  `State` tinyint NOT NULL,
  `Zip` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `address_v_all`
--

DROP TABLE IF EXISTS `address_v_all`;
/*!50001 DROP VIEW IF EXISTS `address_v_all`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `address_v_all` (
  `pk_Address_id` tinyint NOT NULL,
  `Street_name` tinyint NOT NULL,
  `Apt_number` tinyint NOT NULL,
  `City` tinyint NOT NULL,
  `State` tinyint NOT NULL,
  `Zip` tinyint NOT NULL,
  `Address_delete_flag` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `pk_Customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `ActiveFrom` datetime NOT NULL,
  `fk_person_id` int(11) NOT NULL,
  `fk_CustomerType_id` tinyint(4) NOT NULL,
  `Customer_delete_flag` char(1) NOT NULL DEFAULT 'F',
  PRIMARY KEY (`pk_Customer_id`),
  KEY `fk_customer_person_id_idx` (`fk_person_id`),
  KEY `fk_Customer_CustomerType1_idx` (`fk_CustomerType_id`),
  CONSTRAINT `fk_Customer_CustomerType1` FOREIGN KEY (`fk_CustomerType_id`) REFERENCES `customertype` (`pk_CustomerType_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_customer_person_id` FOREIGN KEY (`fk_person_id`) REFERENCES `person` (`pk_Person_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'2014-01-10 01:02:00',1,1,'F'),(2,'2012-08-08 03:02:00',2,2,'F'),(3,'2011-03-20 01:02:00',3,1,'F'),(4,'2014-12-02 14:00:35',8,2,'F');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER customer_backup_t
BEFORE UPDATE
ON customer
FOR EACH ROW
BEGIN

SET @customer_id = pk_Customer_id;
SET @person_id = fk_person_id;

INSERT INTO customer_backup
SELECT null,
@person_id,
person.first_name,
person.middle_name,
person.last_name,
person.age,
personemail.email_id,
personphone.Phone_number,
personaccount.username,
personaccount.`password`,
@customer_id,
customertype.CustomerType_name,
customer.ActiveFrom
FROM customer
INNER JOIN person
ON customer.fk_person_id = person.pk_Person_id
INNER JOIN personemail
ON customer.fk_person_id = personemail.Person_Person_id
INNER JOIN personphone
ON customer.fk_person_id = personphone.Person_Person_id
INNER JOIN personaccount
ON customer.fk_person_id = personaccount.Person_Person_id
INNER JOIN customertype
ON customer.fk_CustomerType_id = customertype.pk_CustomerType_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER customer_backup_bdelete_t
BEFORE DELETE
ON customer
FOR EACH ROW
BEGIN

SET @customer_id = pk_Customer_id;
SET @person_id = fk_person_id;

INSERT INTO customer_backup
SELECT null,
@person_id,
person.first_name,
person.middle_name,
person.last_name,
person.age,
personemail.email_id,
personphone.Phone_number,
personaccount.username,
personaccount.`password`,
@customer_id,
customertype.CustomerType_name,
customer.ActiveFrom
FROM customer
INNER JOIN person
ON customer.fk_person_id = person.pk_Person_id
INNER JOIN personemail
ON customer.fk_person_id = personemail.Person_Person_id
INNER JOIN personphone
ON customer.fk_person_id = personphone.Person_Person_id
INNER JOIN personaccount
ON customer.fk_person_id = personaccount.Person_Person_id
INNER JOIN customertype
ON customer.fk_CustomerType_id = customertype.pk_CustomerType_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `customer_backup`
--

DROP TABLE IF EXISTS `customer_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_backup` (
  `pk_Customer_backup_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `middle_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) NOT NULL,
  `age` tinyint(4) NOT NULL,
  `email_id` varchar(70) NOT NULL,
  `Phone_number` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `Customer_id` int(11) NOT NULL,
  `CustomerType_name` varchar(10) NOT NULL,
  `ActiveFrom` datetime NOT NULL,
  PRIMARY KEY (`pk_Customer_backup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_backup`
--

LOCK TABLES `customer_backup` WRITE;
/*!40000 ALTER TABLE `customer_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `customer_order_history_v`
--

DROP TABLE IF EXISTS `customer_order_history_v`;
/*!50001 DROP VIEW IF EXISTS `customer_order_history_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `customer_order_history_v` (
  `pk_CustomerOrderHistory_id` tinyint NOT NULL,
  `order_date` tinyint NOT NULL,
  `fk_Customer_id` tinyint NOT NULL,
  `Order_Order_id` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `customer_order_history_v_all`
--

DROP TABLE IF EXISTS `customer_order_history_v_all`;
/*!50001 DROP VIEW IF EXISTS `customer_order_history_v_all`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `customer_order_history_v_all` (
  `pk_CustomerOrderHistory_id` tinyint NOT NULL,
  `order_date` tinyint NOT NULL,
  `fk_Customer_id` tinyint NOT NULL,
  `Order_Order_id` tinyint NOT NULL,
  `CustomerOrderHistory_delete_flag` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `customer_type_v`
--

DROP TABLE IF EXISTS `customer_type_v`;
/*!50001 DROP VIEW IF EXISTS `customer_type_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `customer_type_v` (
  `pk_CustomerType_id` tinyint NOT NULL,
  `CustomerType_name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `customer_type_v_all`
--

DROP TABLE IF EXISTS `customer_type_v_all`;
/*!50001 DROP VIEW IF EXISTS `customer_type_v_all`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `customer_type_v_all` (
  `pk_CustomerType_id` tinyint NOT NULL,
  `CustomerType_name` tinyint NOT NULL,
  `CustomerType_delete_flag` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `customer_v`
--

DROP TABLE IF EXISTS `customer_v`;
/*!50001 DROP VIEW IF EXISTS `customer_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `customer_v` (
  `pk_Customer_id` tinyint NOT NULL,
  `ActiveFrom` tinyint NOT NULL,
  `fk_person_id` tinyint NOT NULL,
  `fk_CustomerType_id` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `customer_v_all`
--

DROP TABLE IF EXISTS `customer_v_all`;
/*!50001 DROP VIEW IF EXISTS `customer_v_all`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `customer_v_all` (
  `pk_Customer_id` tinyint NOT NULL,
  `ActiveFrom` tinyint NOT NULL,
  `fk_person_id` tinyint NOT NULL,
  `fk_CustomerType_id` tinyint NOT NULL,
  `Customer_delete_flag` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `customer_view`
--

DROP TABLE IF EXISTS `customer_view`;
/*!50001 DROP VIEW IF EXISTS `customer_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `customer_view` (
  `PRODUCT_ID` tinyint NOT NULL,
  `PRODUCT_NAME` tinyint NOT NULL,
  `PRODUCT_DESCRIPTION` tinyint NOT NULL,
  `WEIGHT` tinyint NOT NULL,
  `AVERAGE_RATING` tinyint NOT NULL,
  `COMMENTS` tinyint NOT NULL,
  `DEPARTMENT` tinyint NOT NULL,
  `QUANTITY_AVAILABLE` tinyint NOT NULL,
  `PRICE` tinyint NOT NULL,
  `DISCOUNT%` tinyint NOT NULL,
  `DISCOUNT_END_DATE` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customerorderhistory`
--

DROP TABLE IF EXISTS `customerorderhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customerorderhistory` (
  `pk_CustomerOrderHistory_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_date` date NOT NULL,
  `fk_Customer_id` int(11) NOT NULL,
  `Order_Order_id` int(11) NOT NULL,
  `CustomerOrderHistory_delete_flag` char(1) NOT NULL DEFAULT 'F',
  PRIMARY KEY (`pk_CustomerOrderHistory_id`),
  KEY `fk_CustomerOrderHistory_Customer1_idx` (`fk_Customer_id`),
  KEY `fk_CustomerOrderHistory_Order1_idx` (`Order_Order_id`),
  CONSTRAINT `fk_CustomerOrderHistory_Customer1` FOREIGN KEY (`fk_Customer_id`) REFERENCES `customer` (`pk_Customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CustomerOrderHistory_Order1` FOREIGN KEY (`Order_Order_id`) REFERENCES `order` (`pk_Order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerorderhistory`
--

LOCK TABLES `customerorderhistory` WRITE;
/*!40000 ALTER TABLE `customerorderhistory` DISABLE KEYS */;
INSERT INTO `customerorderhistory` VALUES (1,'2014-11-11',1,1,'F'),(2,'2014-10-01',2,2,'F'),(3,'2014-02-22',3,3,'F');
/*!40000 ALTER TABLE `customerorderhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customertype`
--

DROP TABLE IF EXISTS `customertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customertype` (
  `pk_CustomerType_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `CustomerType_name` varchar(10) NOT NULL,
  `CustomerType_delete_flag` char(1) NOT NULL DEFAULT 'F',
  PRIMARY KEY (`pk_CustomerType_id`),
  KEY `customer_type_idx` (`CustomerType_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customertype`
--

LOCK TABLES `customertype` WRITE;
/*!40000 ALTER TABLE `customertype` DISABLE KEYS */;
INSERT INTO `customertype` VALUES (1,'regular','F'),(2,'express','F');
/*!40000 ALTER TABLE `customertype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `pk_Department_id` int(11) NOT NULL AUTO_INCREMENT,
  `Department_name` varchar(45) NOT NULL,
  `ProductDepartment_delete_flag` char(1) NOT NULL DEFAULT 'F',
  PRIMARY KEY (`pk_Department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Produce','F'),(2,'Dairy','F'),(3,'Meat/SeaFood','F');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `department_v`
--

DROP TABLE IF EXISTS `department_v`;
/*!50001 DROP VIEW IF EXISTS `department_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `department_v` (
  `pk_Department_id` tinyint NOT NULL,
  `Department_name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `discount_coupon`
--

DROP TABLE IF EXISTS `discount_coupon`;
/*!50001 DROP VIEW IF EXISTS `discount_coupon`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `discount_coupon` (
  `pk_DiscountCoupon_id` tinyint NOT NULL,
  `DiscountCoupon_name` tinyint NOT NULL,
  `Active_from` tinyint NOT NULL,
  `Deactive_date` tinyint NOT NULL,
  `dollar_value` tinyint NOT NULL,
  `fk_Customer_id` tinyint NOT NULL,
  `fk_Order_id` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `discount_coupon_all`
--

DROP TABLE IF EXISTS `discount_coupon_all`;
/*!50001 DROP VIEW IF EXISTS `discount_coupon_all`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `discount_coupon_all` (
  `pk_DiscountCoupon_id` tinyint NOT NULL,
  `DiscountCoupon_name` tinyint NOT NULL,
  `Active_from` tinyint NOT NULL,
  `Deactive_date` tinyint NOT NULL,
  `dollar_value` tinyint NOT NULL,
  `fk_Customer_id` tinyint NOT NULL,
  `fk_Order_id` tinyint NOT NULL,
  `DiscountCoupon_delete_flag` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `discountcoupon`
--

DROP TABLE IF EXISTS `discountcoupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discountcoupon` (
  `pk_DiscountCoupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `DiscountCoupon_name` varchar(45) NOT NULL,
  `Active_from` date NOT NULL,
  `Deactive_date` varchar(45) NOT NULL,
  `dollar_value` float NOT NULL,
  `fk_Customer_id` int(11) NOT NULL,
  `fk_Order_id` int(11) DEFAULT NULL,
  `DiscountCoupon_delete_flag` char(1) NOT NULL DEFAULT 'F',
  PRIMARY KEY (`pk_DiscountCoupon_id`),
  KEY `fk_DiscountCoupon_Customer1_idx` (`fk_Customer_id`),
  KEY `fk_DiscountCoupon_Order1_idx` (`fk_Order_id`),
  CONSTRAINT `fk_DiscountCoupon_Customer1` FOREIGN KEY (`fk_Customer_id`) REFERENCES `customer` (`pk_Customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DiscountCoupon_Order1` FOREIGN KEY (`fk_Order_id`) REFERENCES `order` (`pk_Order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discountcoupon`
--

LOCK TABLES `discountcoupon` WRITE;
/*!40000 ALTER TABLE `discountcoupon` DISABLE KEYS */;
INSERT INTO `discountcoupon` VALUES (1,'Promotional-10','2014-01-01','2014-12-01',10,2,2,'F'),(2,'Promotional-20','2014-11-01','2015-12-01',10,1,NULL,'F');
/*!40000 ALTER TABLE `discountcoupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `pk_Employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_Person_id` int(11) NOT NULL,
  `Title` varchar(30) NOT NULL,
  `date_of_joining` date NOT NULL,
  `date_of_leaving` date DEFAULT NULL,
  `Employee_delete_flag` char(1) NOT NULL DEFAULT 'F',
  `Employee_manager_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`pk_Employee_id`),
  KEY `fk_Employee_Person1_idx` (`fk_Person_id`),
  KEY `fk_Employee_Employee1_idx` (`Employee_manager_id`),
  CONSTRAINT `fk_Employee_Employee1` FOREIGN KEY (`Employee_manager_id`) REFERENCES `employee` (`pk_Employee_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Employee_Person1` FOREIGN KEY (`fk_Person_id`) REFERENCES `person` (`pk_Person_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,4,'Manager','2005-01-18',NULL,'F',1),(2,5,'Shipping Employee','2012-05-08',NULL,'F',1),(3,9,'Shipping Employee','2013-02-06',NULL,'F',NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `employee_salary_v`
--

DROP TABLE IF EXISTS `employee_salary_v`;
/*!50001 DROP VIEW IF EXISTS `employee_salary_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `employee_salary_v` (
  `pk_EmployeeSalary_id` tinyint NOT NULL,
  `Employee_Employee_id` tinyint NOT NULL,
  `Salary` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `employee_salary_v_all`
--

DROP TABLE IF EXISTS `employee_salary_v_all`;
/*!50001 DROP VIEW IF EXISTS `employee_salary_v_all`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `employee_salary_v_all` (
  `pk_EmployeeSalary_id` tinyint NOT NULL,
  `Employee_Employee_id` tinyint NOT NULL,
  `Salary` tinyint NOT NULL,
  `employeesalary_delete_flag` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `employee_v`
--

DROP TABLE IF EXISTS `employee_v`;
/*!50001 DROP VIEW IF EXISTS `employee_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `employee_v` (
  `pk_Employee_id` tinyint NOT NULL,
  `fk_person_id` tinyint NOT NULL,
  `Title` tinyint NOT NULL,
  `date_of_joining` tinyint NOT NULL,
  `date_of_leaving` tinyint NOT NULL,
  `Employee_manager_id` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `employee_v_all`
--

DROP TABLE IF EXISTS `employee_v_all`;
/*!50001 DROP VIEW IF EXISTS `employee_v_all`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `employee_v_all` (
  `pk_Employee_id` tinyint NOT NULL,
  `fk_Person_id` tinyint NOT NULL,
  `Title` tinyint NOT NULL,
  `date_of_joining` tinyint NOT NULL,
  `date_of_leaving` tinyint NOT NULL,
  `Employee_delete_flag` tinyint NOT NULL,
  `Employee_manager_id` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `employeesalary`
--

DROP TABLE IF EXISTS `employeesalary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employeesalary` (
  `pk_EmployeeSalary_id` int(11) NOT NULL AUTO_INCREMENT,
  `Employee_Employee_id` int(11) NOT NULL,
  `Salary` float NOT NULL,
  `employeesalary_delete_flag` char(1) NOT NULL DEFAULT 'F',
  PRIMARY KEY (`pk_EmployeeSalary_id`),
  KEY `fk_EmployeeSalary_Employee1_idx` (`Employee_Employee_id`),
  CONSTRAINT `fk_EmployeeSalary_Employee1` FOREIGN KEY (`Employee_Employee_id`) REFERENCES `employee` (`pk_Employee_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeesalary`
--

LOCK TABLES `employeesalary` WRITE;
/*!40000 ALTER TABLE `employeesalary` DISABLE KEYS */;
INSERT INTO `employeesalary` VALUES (1,1,100000,'F'),(2,2,50000,'F'),(3,3,50000,'F');
/*!40000 ALTER TABLE `employeesalary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `grocery_store_v`
--

DROP TABLE IF EXISTS `grocery_store_v`;
/*!50001 DROP VIEW IF EXISTS `grocery_store_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grocery_store_v` (
  `pk_GroceryStore_id` tinyint NOT NULL,
  `GroceryStore_name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `grocery_store_v_all`
--

DROP TABLE IF EXISTS `grocery_store_v_all`;
/*!50001 DROP VIEW IF EXISTS `grocery_store_v_all`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grocery_store_v_all` (
  `pk_GroceryStore_id` tinyint NOT NULL,
  `GroceryStore_name` tinyint NOT NULL,
  `GroceryStore_delete_flag` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `grocerystore`
--

DROP TABLE IF EXISTS `grocerystore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocerystore` (
  `pk_GroceryStore_id` int(11) NOT NULL AUTO_INCREMENT,
  `GroceryStore_name` varchar(45) NOT NULL,
  `GroceryStore_delete_flag` char(1) NOT NULL DEFAULT 'F',
  PRIMARY KEY (`pk_GroceryStore_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocerystore`
--

LOCK TABLES `grocerystore` WRITE;
/*!40000 ALTER TABLE `grocerystore` DISABLE KEYS */;
INSERT INTO `grocerystore` VALUES (1,'Whole Foods','F'),(2,'Costo Wholesale','F'),(3,'Shaws','F');
/*!40000 ALTER TABLE `grocerystore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocerystore/address`
--

DROP TABLE IF EXISTS `grocerystore/address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocerystore/address` (
  `pk_GroceryStore/Address_id` int(11) NOT NULL AUTO_INCREMENT,
  `GroceryStore_GroceryStore_id` int(11) NOT NULL,
  `Address_Address_id` int(11) NOT NULL,
  `GroceryStore/Address_delete_flag` char(1) NOT NULL DEFAULT 'F',
  PRIMARY KEY (`pk_GroceryStore/Address_id`),
  KEY `fk_GroceryStore/Address_GroceryStore1_idx` (`GroceryStore_GroceryStore_id`),
  KEY `fk_GroceryStore/Address_Address1_idx` (`Address_Address_id`),
  CONSTRAINT `fk_GroceryStore/Address_Address1` FOREIGN KEY (`Address_Address_id`) REFERENCES `address` (`pk_Address_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_GroceryStore/Address_GroceryStore1` FOREIGN KEY (`GroceryStore_GroceryStore_id`) REFERENCES `grocerystore` (`pk_GroceryStore_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocerystore/address`
--

LOCK TABLES `grocerystore/address` WRITE;
/*!40000 ALTER TABLE `grocerystore/address` DISABLE KEYS */;
INSERT INTO `grocerystore/address` VALUES (1,1,10,'F'),(2,2,11,'F'),(3,3,12,'F');
/*!40000 ALTER TABLE `grocerystore/address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `grocerystore_address_v`
--

DROP TABLE IF EXISTS `grocerystore_address_v`;
/*!50001 DROP VIEW IF EXISTS `grocerystore_address_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grocerystore_address_v` (
  `pk_GroceryStore/Address_id` tinyint NOT NULL,
  `GroceryStore_GroceryStore_id` tinyint NOT NULL,
  `Address_Address_id` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `grocerystore_address_v_all`
--

DROP TABLE IF EXISTS `grocerystore_address_v_all`;
/*!50001 DROP VIEW IF EXISTS `grocerystore_address_v_all`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grocerystore_address_v_all` (
  `pk_GroceryStore/Address_id` tinyint NOT NULL,
  `GroceryStore_GroceryStore_id` tinyint NOT NULL,
  `Address_Address_id` tinyint NOT NULL,
  `GroceryStore/Address_delete_flag` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `invoice_details_v`
--

DROP TABLE IF EXISTS `invoice_details_v`;
/*!50001 DROP VIEW IF EXISTS `invoice_details_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `invoice_details_v` (
  `pk_InvoiceDetails_id` tinyint NOT NULL,
  `fk_Order_id` tinyint NOT NULL,
  `invoice_status` tinyint NOT NULL,
  `invoice_date` tinyint NOT NULL,
  `fk_PaymentDetails_id` tinyint NOT NULL,
  `amount_paid` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `invoice_details_v_all`
--

DROP TABLE IF EXISTS `invoice_details_v_all`;
/*!50001 DROP VIEW IF EXISTS `invoice_details_v_all`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `invoice_details_v_all` (
  `pk_InvoiceDetails_id` tinyint NOT NULL,
  `fk_Order_id` tinyint NOT NULL,
  `invoice_status` tinyint NOT NULL,
  `invoice_date` tinyint NOT NULL,
  `fk_PaymentDetails_id` tinyint NOT NULL,
  `InvoiceDetails_delete_flag` tinyint NOT NULL,
  `amount_paid` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `invoicedetails`
--

DROP TABLE IF EXISTS `invoicedetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoicedetails` (
  `pk_InvoiceDetails_id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_Order_id` int(11) NOT NULL,
  `invoice_status` varchar(15) NOT NULL,
  `invoice_date` date NOT NULL,
  `fk_PaymentDetails_id` int(11) NOT NULL,
  `InvoiceDetails_delete_flag` char(1) NOT NULL DEFAULT 'F',
  `amount_paid` float NOT NULL,
  PRIMARY KEY (`pk_InvoiceDetails_id`),
  KEY `fk_InvoiceDetails_Order1_idx` (`fk_Order_id`),
  KEY `fk_InvoiceDetails_PaymentDetails1_idx` (`fk_PaymentDetails_id`),
  KEY `invoice_status_idx` (`invoice_status`),
  CONSTRAINT `fk_InvoiceDetails_Order1` FOREIGN KEY (`fk_Order_id`) REFERENCES `order` (`pk_Order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_InvoiceDetails_PaymentDetails1` FOREIGN KEY (`fk_PaymentDetails_id`) REFERENCES `paymentdetails` (`pk_PaymentDetails_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoicedetails`
--

LOCK TABLES `invoicedetails` WRITE;
/*!40000 ALTER TABLE `invoicedetails` DISABLE KEYS */;
INSERT INTO `invoicedetails` VALUES (1,1,'Payed','2014-11-12',1,'F',23.54),(2,2,'Payed','2014-10-02',2,'F',19.58),(3,3,'Payed','2014-02-23',3,'F',10.21);
/*!40000 ALTER TABLE `invoicedetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `pk_Order_id` int(11) NOT NULL AUTO_INCREMENT,
  `date_of_purchase` date DEFAULT NULL,
  `fk_Customer_id` int(11) NOT NULL,
  `order_price` float NOT NULL,
  `fk_OrderTax_id` tinyint(3) unsigned NOT NULL,
  `Order_delete_flag` char(1) NOT NULL DEFAULT 'F',
  PRIMARY KEY (`pk_Order_id`),
  KEY `fk_Order_Customer1_idx` (`fk_Customer_id`),
  KEY `fk_Order_OrderTax1_idx` (`fk_OrderTax_id`),
  CONSTRAINT `fk_Order_Customer1` FOREIGN KEY (`fk_Customer_id`) REFERENCES `customer` (`pk_Customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_OrderTax1` FOREIGN KEY (`fk_OrderTax_id`) REFERENCES `ordertax` (`pk_OrderTax_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'2014-11-11',1,21.8,1,'F'),(2,'2014-10-01',2,35,2,'F'),(3,'2014-02-22',3,9.79,1,'F');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `order_item_v`
--

DROP TABLE IF EXISTS `order_item_v`;
/*!50001 DROP VIEW IF EXISTS `order_item_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `order_item_v` (
  `pk_Order_item_id` tinyint NOT NULL,
  `quantity` tinyint NOT NULL,
  `order_item_price` tinyint NOT NULL,
  `fk_Product_id` tinyint NOT NULL,
  `fk_Order_id` tinyint NOT NULL,
  `fk_Shipment_id` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `order_item_v_all`
--

DROP TABLE IF EXISTS `order_item_v_all`;
/*!50001 DROP VIEW IF EXISTS `order_item_v_all`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `order_item_v_all` (
  `pk_Order_item_id` tinyint NOT NULL,
  `quantity` tinyint NOT NULL,
  `order_item_price` tinyint NOT NULL,
  `fk_Product_id` tinyint NOT NULL,
  `fk_Order_id` tinyint NOT NULL,
  `OrderItem_delete_flag` tinyint NOT NULL,
  `fk_Shipment_id` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `order_tax_v`
--

DROP TABLE IF EXISTS `order_tax_v`;
/*!50001 DROP VIEW IF EXISTS `order_tax_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `order_tax_v` (
  `pk_OrderTax_id` tinyint NOT NULL,
  `State` tinyint NOT NULL,
  `tax_percent` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `order_tax_v_all`
--

DROP TABLE IF EXISTS `order_tax_v_all`;
/*!50001 DROP VIEW IF EXISTS `order_tax_v_all`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `order_tax_v_all` (
  `pk_OrderTax_id` tinyint NOT NULL,
  `State` tinyint NOT NULL,
  `tax_percent` tinyint NOT NULL,
  `OrderTax_delete_flag` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `order_v`
--

DROP TABLE IF EXISTS `order_v`;
/*!50001 DROP VIEW IF EXISTS `order_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `order_v` (
  `pk_Order_id` tinyint NOT NULL,
  `date_of_purchase` tinyint NOT NULL,
  `fk_Customer_id` tinyint NOT NULL,
  `order_price` tinyint NOT NULL,
  `fk_OrderTax_id` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `order_v_all`
--

DROP TABLE IF EXISTS `order_v_all`;
/*!50001 DROP VIEW IF EXISTS `order_v_all`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `order_v_all` (
  `pk_Order_id` tinyint NOT NULL,
  `date_of_purchase` tinyint NOT NULL,
  `fk_Customer_id` tinyint NOT NULL,
  `order_price` tinyint NOT NULL,
  `fk_OrderTax_id` tinyint NOT NULL,
  `Order_delete_flag` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderitem` (
  `pk_Order_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `order_item_price` float NOT NULL,
  `fk_Product_id` int(11) NOT NULL,
  `fk_Order_id` int(11) NOT NULL,
  `OrderItem_delete_flag` char(1) NOT NULL DEFAULT 'F',
  `fk_Shipment_id` int(11) NOT NULL,
  PRIMARY KEY (`pk_Order_item_id`),
  KEY `fk_OrderItem_Product1_idx` (`fk_Product_id`),
  KEY `fk_OrderItem_Order1_idx` (`fk_Order_id`),
  KEY `fk_OrderItem_Shipment1_idx` (`fk_Shipment_id`),
  CONSTRAINT `fk_OrderItem_Order1` FOREIGN KEY (`fk_Order_id`) REFERENCES `order` (`pk_Order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrderItem_Product1` FOREIGN KEY (`fk_Product_id`) REFERENCES `product` (`pk_Product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrderItem_Shipment1` FOREIGN KEY (`fk_Shipment_id`) REFERENCES `shipment` (`pk_Shipment_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
INSERT INTO `orderitem` VALUES (1,2,3.38,1,1,'F',1),(2,1,3.09,3,1,'F',1),(3,1,15.33,5,1,'F',1),(4,1,3.09,3,2,'F',2),(5,1,17.91,6,2,'F',2),(7,1,9.79,4,3,'F',4);
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordertax`
--

DROP TABLE IF EXISTS `ordertax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordertax` (
  `pk_OrderTax_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `State` varchar(45) NOT NULL,
  `tax_percent` float NOT NULL,
  `OrderTax_delete_flag` char(1) NOT NULL DEFAULT 'F',
  PRIMARY KEY (`pk_OrderTax_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordertax`
--

LOCK TABLES `ordertax` WRITE;
/*!40000 ALTER TABLE `ordertax` DISABLE KEYS */;
INSERT INTO `ordertax` VALUES (1,'MA',8,'F'),(2,'CA',10,'F'),(3,'AZ',6,'F'),(4,'WA',9,'F');
/*!40000 ALTER TABLE `ordertax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `payment_details_v`
--

DROP TABLE IF EXISTS `payment_details_v`;
/*!50001 DROP VIEW IF EXISTS `payment_details_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `payment_details_v` (
  `pk_PaymentDetails_id` tinyint NOT NULL,
  `Card_name` tinyint NOT NULL,
  `Card_number` tinyint NOT NULL,
  `Expiration_date` tinyint NOT NULL,
  `security_code` tinyint NOT NULL,
  `Customer_Customer_id` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `payment_details_v_all`
--

DROP TABLE IF EXISTS `payment_details_v_all`;
/*!50001 DROP VIEW IF EXISTS `payment_details_v_all`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `payment_details_v_all` (
  `pk_PaymentDetails_id` tinyint NOT NULL,
  `Card_name` tinyint NOT NULL,
  `Card_number` tinyint NOT NULL,
  `Expiration_date` tinyint NOT NULL,
  `security_code` tinyint NOT NULL,
  `Customer_Customer_id` tinyint NOT NULL,
  `PaymentDetails_delete_flag` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `paymentdetails`
--

DROP TABLE IF EXISTS `paymentdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymentdetails` (
  `pk_PaymentDetails_id` int(11) NOT NULL AUTO_INCREMENT,
  `Card_name` varchar(50) NOT NULL,
  `Card_number` varchar(16) NOT NULL,
  `Expiration_date` date NOT NULL,
  `security_code` varchar(3) NOT NULL,
  `Customer_Customer_id` int(11) NOT NULL,
  `PaymentDetails_delete_flag` char(1) NOT NULL DEFAULT 'F',
  PRIMARY KEY (`pk_PaymentDetails_id`),
  KEY `fk_PaymentDetails_Customer1_idx` (`Customer_Customer_id`),
  KEY `card_details_idx` (`Card_number`),
  CONSTRAINT `fk_PaymentDetails_Customer1` FOREIGN KEY (`Customer_Customer_id`) REFERENCES `customer` (`pk_Customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentdetails`
--

LOCK TABLES `paymentdetails` WRITE;
/*!40000 ALTER TABLE `paymentdetails` DISABLE KEYS */;
INSERT INTO `paymentdetails` VALUES (1,'MasterCard','6957854123621254','2015-06-01','458',1,'F'),(2,'Visa','5213695987456321','2016-12-01','369',2,'F'),(3,'Discover','1203985621036574','2015-07-01','412',3,'F');
/*!40000 ALTER TABLE `paymentdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `pk_Person_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `middle_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) NOT NULL,
  `age` tinyint(4) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `Person_delete_flag` char(1) NOT NULL DEFAULT 'F',
  PRIMARY KEY (`pk_Person_id`),
  UNIQUE KEY `last_name_idx` (`last_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'Vaibhav','R','Mistry',24,'Male','F'),(2,'Richa','P','Sharma',19,'Female','F'),(3,'Ankit','E','Gala',42,'Male','F'),(4,'Jimmy',NULL,'Shah',36,'Male','F'),(5,'Sarah','J','Feller',50,'Female','F'),(6,'harshit','k','patel',26,'Male','F'),(8,'harshit','k','hubert',26,'Male','F'),(9,'Shaily',NULL,'Arora',41,'Female','F');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person/address`
--

DROP TABLE IF EXISTS `person/address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person/address` (
  `pk_Person/Address_id` int(11) NOT NULL AUTO_INCREMENT,
  `Address_Address_id` int(11) NOT NULL,
  `Person_Person_id` int(11) NOT NULL,
  `Person/Address_delete_flag` char(1) NOT NULL DEFAULT 'F',
  PRIMARY KEY (`pk_Person/Address_id`),
  KEY `fk_Person/Address_Address1_idx` (`Address_Address_id`),
  KEY `fk_Person/Address_Person1_idx` (`Person_Person_id`),
  CONSTRAINT `fk_Person/Address_Address1` FOREIGN KEY (`Address_Address_id`) REFERENCES `address` (`pk_Address_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Person/Address_Person1` FOREIGN KEY (`Person_Person_id`) REFERENCES `person` (`pk_Person_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person/address`
--

LOCK TABLES `person/address` WRITE;
/*!40000 ALTER TABLE `person/address` DISABLE KEYS */;
INSERT INTO `person/address` VALUES (1,5,1,'F'),(2,5,1,'F'),(3,6,2,'F'),(4,7,3,'F'),(5,8,4,'F'),(6,9,5,'F'),(7,13,6,'F'),(8,14,8,'F'),(9,15,9,'F');
/*!40000 ALTER TABLE `person/address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `person_account_v`
--

DROP TABLE IF EXISTS `person_account_v`;
/*!50001 DROP VIEW IF EXISTS `person_account_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `person_account_v` (
  `pk_PersonAccount_id` tinyint NOT NULL,
  `Person_Person_id` tinyint NOT NULL,
  `username` tinyint NOT NULL,
  `password` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `person_account_v_all`
--

DROP TABLE IF EXISTS `person_account_v_all`;
/*!50001 DROP VIEW IF EXISTS `person_account_v_all`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `person_account_v_all` (
  `pk_PersonAccount_id` tinyint NOT NULL,
  `Person_Person_id` tinyint NOT NULL,
  `username` tinyint NOT NULL,
  `password` tinyint NOT NULL,
  `PersonAccount_delete_flag` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `person_address_v`
--

DROP TABLE IF EXISTS `person_address_v`;
/*!50001 DROP VIEW IF EXISTS `person_address_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `person_address_v` (
  `pk_Person/Address_id` tinyint NOT NULL,
  `Address_Address_id` tinyint NOT NULL,
  `Person_Person_id` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `person_address_v_all`
--

DROP TABLE IF EXISTS `person_address_v_all`;
/*!50001 DROP VIEW IF EXISTS `person_address_v_all`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `person_address_v_all` (
  `pk_Person/Address_id` tinyint NOT NULL,
  `Address_Address_id` tinyint NOT NULL,
  `Person_Person_id` tinyint NOT NULL,
  `Person/Address_delete_flag` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `person_email_v`
--

DROP TABLE IF EXISTS `person_email_v`;
/*!50001 DROP VIEW IF EXISTS `person_email_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `person_email_v` (
  `pk_PersonEmail_id` tinyint NOT NULL,
  `Person_Person_id` tinyint NOT NULL,
  `email_id` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `person_email_v_all`
--

DROP TABLE IF EXISTS `person_email_v_all`;
/*!50001 DROP VIEW IF EXISTS `person_email_v_all`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `person_email_v_all` (
  `pk_PersonEmail_id` tinyint NOT NULL,
  `Person_Person_id` tinyint NOT NULL,
  `email_id` tinyint NOT NULL,
  `PersonEmail_delete_flag` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `person_phone_v`
--

DROP TABLE IF EXISTS `person_phone_v`;
/*!50001 DROP VIEW IF EXISTS `person_phone_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `person_phone_v` (
  `pk_PersonPhone_id` tinyint NOT NULL,
  `Person_Person_id` tinyint NOT NULL,
  `Phone_number` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `person_phone_v_all`
--

DROP TABLE IF EXISTS `person_phone_v_all`;
/*!50001 DROP VIEW IF EXISTS `person_phone_v_all`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `person_phone_v_all` (
  `pk_PersonPhone_id` tinyint NOT NULL,
  `Person_Person_id` tinyint NOT NULL,
  `Phone_number` tinyint NOT NULL,
  `PersonPhone_delete_flag` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `person_v`
--

DROP TABLE IF EXISTS `person_v`;
/*!50001 DROP VIEW IF EXISTS `person_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `person_v` (
  `pk_Person_id` tinyint NOT NULL,
  `first_name` tinyint NOT NULL,
  `middle_name` tinyint NOT NULL,
  `last_name` tinyint NOT NULL,
  `age` tinyint NOT NULL,
  `gender` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `person_v_all`
--

DROP TABLE IF EXISTS `person_v_all`;
/*!50001 DROP VIEW IF EXISTS `person_v_all`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `person_v_all` (
  `pk_Person_id` tinyint NOT NULL,
  `first_name` tinyint NOT NULL,
  `middle_name` tinyint NOT NULL,
  `last_name` tinyint NOT NULL,
  `age` tinyint NOT NULL,
  `gender` tinyint NOT NULL,
  `Person_delete_flag` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `personaccount`
--

DROP TABLE IF EXISTS `personaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personaccount` (
  `pk_PersonAccount_id` int(11) NOT NULL AUTO_INCREMENT,
  `Person_Person_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `PersonAccount_delete_flag` char(1) NOT NULL DEFAULT 'F',
  PRIMARY KEY (`pk_PersonAccount_id`),
  KEY `fk_PersonAccount_Person1_idx` (`Person_Person_id`),
  CONSTRAINT `fk_PersonAccount_Person1` FOREIGN KEY (`Person_Person_id`) REFERENCES `person` (`pk_Person_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personaccount`
--

LOCK TABLES `personaccount` WRITE;
/*!40000 ALTER TABLE `personaccount` DISABLE KEYS */;
INSERT INTO `personaccount` VALUES (1,1,'vaibhav','abc123','F'),(2,2,'richa','12rb3','F'),(3,3,'ankits','sub1256','F'),(4,4,'jim','561tty','F'),(5,5,'sarah','gef456','F'),(6,6,'harshit','56har09','F'),(7,8,'harshit','56har09','F'),(8,9,'shaily','shaily654','F');
/*!40000 ALTER TABLE `personaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personemail`
--

DROP TABLE IF EXISTS `personemail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personemail` (
  `pk_PersonEmail_id` int(11) NOT NULL AUTO_INCREMENT,
  `Person_Person_id` int(11) NOT NULL,
  `email_id` varchar(70) NOT NULL,
  `PersonEmail_delete_flag` char(1) NOT NULL DEFAULT 'F',
  PRIMARY KEY (`pk_PersonEmail_id`),
  KEY `fk_PersonEmail_Person1_idx` (`Person_Person_id`),
  FULLTEXT KEY `email_idx` (`email_id`),
  CONSTRAINT `fk_PersonEmail_Person1` FOREIGN KEY (`Person_Person_id`) REFERENCES `person` (`pk_Person_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personemail`
--

LOCK TABLES `personemail` WRITE;
/*!40000 ALTER TABLE `personemail` DISABLE KEYS */;
INSERT INTO `personemail` VALUES (1,1,'vaibhav@gmail.com','F'),(2,2,'richa@hotmail.com','F'),(3,3,'ankit@gmail.com','F'),(4,4,'jimmy@aol.com','F'),(5,5,'sarah@gmail.com','F'),(11,6,'harshit@gmail.com','F'),(12,8,'harshit@gmail.com','F'),(13,9,'shaily@hotmail.com','F');
/*!40000 ALTER TABLE `personemail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personphone`
--

DROP TABLE IF EXISTS `personphone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personphone` (
  `pk_PersonPhone_id` int(11) NOT NULL AUTO_INCREMENT,
  `Person_Person_id` int(11) NOT NULL,
  `Phone_number` varchar(10) NOT NULL,
  `PersonPhone_delete_flag` char(1) NOT NULL DEFAULT 'F',
  PRIMARY KEY (`pk_PersonPhone_id`),
  KEY `fk_PersonPhone_Person1_idx` (`Person_Person_id`),
  CONSTRAINT `fk_PersonPhone_Person1` FOREIGN KEY (`Person_Person_id`) REFERENCES `person` (`pk_Person_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personphone`
--

LOCK TABLES `personphone` WRITE;
/*!40000 ALTER TABLE `personphone` DISABLE KEYS */;
INSERT INTO `personphone` VALUES (1,1,'2651478962','F'),(2,2,'5789541362','F'),(3,3,'2451362578','F'),(4,4,'2362145217','F'),(5,5,'6985215347','F'),(6,6,'','F'),(7,8,'','F'),(8,9,'','F');
/*!40000 ALTER TABLE `personphone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `pk_Product_id` int(11) NOT NULL AUTO_INCREMENT,
  `Product_name` varchar(45) NOT NULL,
  `Product_description` varchar(250) DEFAULT NULL,
  `Product_weight` tinyint(4) DEFAULT NULL,
  `Product_price` float NOT NULL,
  `Product_delete_flag` char(1) NOT NULL DEFAULT 'F',
  `ProductDiscount_pk_ProductDiscount_id` int(11) DEFAULT NULL,
  `fk_Department_id` int(11) NOT NULL,
  PRIMARY KEY (`pk_Product_id`),
  KEY `product_price_idx` (`Product_price`),
  KEY `fk_Product_ProductDiscount1_idx` (`ProductDiscount_pk_ProductDiscount_id`),
  KEY `fk_Product_Department1_idx` (`fk_Department_id`),
  CONSTRAINT `fk_Product_Department1` FOREIGN KEY (`fk_Department_id`) REFERENCES `department` (`pk_Department_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product_ProductDiscount1` FOREIGN KEY (`ProductDiscount_pk_ProductDiscount_id`) REFERENCES `productdiscount` (`pk_ProductDiscount_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Bananas','Box of Bananas',3,1.69,'F',NULL,1),(2,'Corn','Nature fresh corn',8,6.09,'F',1,1),(3,'Milk','Kirkland milk',1,3.09,'F',NULL,2),(4,'Butter','Stops yummy butter',4,9.79,'F',1,2),(5,'Chiken','Fresh curry cut',7,15.33,'F',NULL,3),(6,'Fish','Tilapia fish',3,17.91,'F',1,3),(7,'mushrooms','Organic Mushrooms',1,3.21,'F',NULL,1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER product_backup_t
BEFORE UPDATE
ON product
FOR EACH ROW
BEGIN
SET @prod_id = pk_Product_id;

INSERT INTO product_backup 
SELECT @prod_id, 
product.Product_name, 
product.Product_description, 
product.Product_weight,
product.Product_price,
department.Department_name
FROM product
INNER JOIN department
ON product.fk_Department_id = department.pk_Department_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER product_backup_bdelete_t
BEFORE DELETE
ON product
FOR EACH ROW
BEGIN
SET @prod_id = pk_Product_id;

INSERT INTO product_backup 
SELECT @prod_id, 
product.Product_name, 
product.Product_description, 
product.Product_weight,
product.Product_price,
department.Department_name
FROM product
INNER JOIN department
ON product.fk_Department_id = department.pk_Department_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `product_availability_v`
--

DROP TABLE IF EXISTS `product_availability_v`;
/*!50001 DROP VIEW IF EXISTS `product_availability_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `product_availability_v` (
  `pk_ProductAvailability_id` tinyint NOT NULL,
  `ProductAvailability` tinyint NOT NULL,
  `GroceryStore_GroceryStore_id` tinyint NOT NULL,
  `Product_Product_id` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `product_availability_v_all`
--

DROP TABLE IF EXISTS `product_availability_v_all`;
/*!50001 DROP VIEW IF EXISTS `product_availability_v_all`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `product_availability_v_all` (
  `pk_ProductAvailability_id` tinyint NOT NULL,
  `ProductAvailability` tinyint NOT NULL,
  `GroceryStore_GroceryStore_id` tinyint NOT NULL,
  `Product_Product_id` tinyint NOT NULL,
  `ProductAvailability_delete_flag` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `product_backup`
--

DROP TABLE IF EXISTS `product_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_backup` (
  `pk_Product_backup_id` int(11) NOT NULL AUTO_INCREMENT,
  `pk_Product_id` int(11) NOT NULL,
  `Product_name` varchar(45) NOT NULL,
  `Product_description` varchar(250) DEFAULT NULL,
  `Product_weight` tinyint(4) DEFAULT NULL,
  `Product_price` float NOT NULL,
  `Department_name` varchar(45) NOT NULL,
  PRIMARY KEY (`pk_Product_backup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_backup`
--

LOCK TABLES `product_backup` WRITE;
/*!40000 ALTER TABLE `product_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `product_discount_v`
--

DROP TABLE IF EXISTS `product_discount_v`;
/*!50001 DROP VIEW IF EXISTS `product_discount_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `product_discount_v` (
  `pk_ProductDiscount_id` tinyint NOT NULL,
  `discount_percent` tinyint NOT NULL,
  `Active_from` tinyint NOT NULL,
  `Deactive_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `product_discount_v_all`
--

DROP TABLE IF EXISTS `product_discount_v_all`;
/*!50001 DROP VIEW IF EXISTS `product_discount_v_all`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `product_discount_v_all` (
  `pk_ProductDiscount_id` tinyint NOT NULL,
  `discount_percent` tinyint NOT NULL,
  `Active_from` tinyint NOT NULL,
  `Deactive_date` tinyint NOT NULL,
  `ProductDiscount_delete_flag` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `product_rating_v`
--

DROP TABLE IF EXISTS `product_rating_v`;
/*!50001 DROP VIEW IF EXISTS `product_rating_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `product_rating_v` (
  `pk_ProductRating_id` tinyint NOT NULL,
  `fk_Product_id` tinyint NOT NULL,
  `fk_Customer_id` tinyint NOT NULL,
  `Rating` tinyint NOT NULL,
  `Comments` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `product_rating_v_all`
--

DROP TABLE IF EXISTS `product_rating_v_all`;
/*!50001 DROP VIEW IF EXISTS `product_rating_v_all`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `product_rating_v_all` (
  `pk_ProductRating_id` tinyint NOT NULL,
  `fk_Product_id` tinyint NOT NULL,
  `fk_Customer_id` tinyint NOT NULL,
  `Rating` tinyint NOT NULL,
  `Comments` tinyint NOT NULL,
  `ProductRating_delete_flag` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `product_v`
--

DROP TABLE IF EXISTS `product_v`;
/*!50001 DROP VIEW IF EXISTS `product_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `product_v` (
  `pk_Product_id` tinyint NOT NULL,
  `Product_name` tinyint NOT NULL,
  `Product_description` tinyint NOT NULL,
  `Product_weight` tinyint NOT NULL,
  `Product_price` tinyint NOT NULL,
  `ProductDiscount_pk_ProductDiscount_id` tinyint NOT NULL,
  `fk_Department_id` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `product_v_all`
--

DROP TABLE IF EXISTS `product_v_all`;
/*!50001 DROP VIEW IF EXISTS `product_v_all`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `product_v_all` (
  `pk_Product_id` tinyint NOT NULL,
  `Product_name` tinyint NOT NULL,
  `Product_description` tinyint NOT NULL,
  `Product_weight` tinyint NOT NULL,
  `Product_price` tinyint NOT NULL,
  `Product_delete_flag` tinyint NOT NULL,
  `ProductDiscount_pk_ProductDiscount_id` tinyint NOT NULL,
  `fk_Department_id` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `productavailability`
--

DROP TABLE IF EXISTS `productavailability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productavailability` (
  `pk_ProductAvailability_id` int(11) NOT NULL AUTO_INCREMENT,
  `ProductAvailability` int(10) unsigned NOT NULL,
  `GroceryStore_GroceryStore_id` int(11) NOT NULL,
  `Product_Product_id` int(11) NOT NULL,
  `ProductAvailability_delete_flag` char(1) NOT NULL DEFAULT 'F',
  PRIMARY KEY (`pk_ProductAvailability_id`),
  KEY `fk_ProductAvailability_GroceryStore_idx` (`GroceryStore_GroceryStore_id`),
  KEY `fk_ProductAvailability_Product1_idx` (`Product_Product_id`),
  CONSTRAINT `fk_ProductAvailability_GroceryStore` FOREIGN KEY (`GroceryStore_GroceryStore_id`) REFERENCES `grocerystore` (`pk_GroceryStore_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProductAvailability_Product1` FOREIGN KEY (`Product_Product_id`) REFERENCES `product` (`pk_Product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productavailability`
--

LOCK TABLES `productavailability` WRITE;
/*!40000 ALTER TABLE `productavailability` DISABLE KEYS */;
INSERT INTO `productavailability` VALUES (1,50,1,1,'F'),(2,60,2,1,'F'),(3,30,2,2,'F'),(4,100,1,2,'F'),(5,90,1,3,'F'),(6,50,2,3,'F'),(7,66,2,4,'F'),(8,70,3,4,'F'),(9,20,2,5,'F'),(10,30,3,5,'F'),(11,5,3,6,'F'),(12,90,1,6,'F'),(13,10,1,7,'F');
/*!40000 ALTER TABLE `productavailability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productdiscount`
--

DROP TABLE IF EXISTS `productdiscount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productdiscount` (
  `pk_ProductDiscount_id` int(11) NOT NULL AUTO_INCREMENT,
  `discount_percent` float unsigned NOT NULL,
  `Active_from` date NOT NULL,
  `Deactive_date` date NOT NULL,
  `ProductDiscount_delete_flag` char(1) NOT NULL DEFAULT 'F',
  PRIMARY KEY (`pk_ProductDiscount_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productdiscount`
--

LOCK TABLES `productdiscount` WRITE;
/*!40000 ALTER TABLE `productdiscount` DISABLE KEYS */;
INSERT INTO `productdiscount` VALUES (1,20,'2014-09-01','2015-01-01','F'),(2,10,'2014-04-01','2014-06-01','F');
/*!40000 ALTER TABLE `productdiscount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productrating`
--

DROP TABLE IF EXISTS `productrating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productrating` (
  `pk_ProductRating_id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_Product_id` int(11) NOT NULL,
  `fk_Customer_id` int(11) DEFAULT NULL,
  `Rating` tinyint(3) unsigned NOT NULL,
  `Comments` varchar(150) DEFAULT NULL,
  `ProductRating_delete_flag` char(1) NOT NULL DEFAULT 'F',
  PRIMARY KEY (`pk_ProductRating_id`),
  KEY `fk_ProductRating_Product1_idx` (`fk_Product_id`),
  KEY `fk_ProductRating_Customer1_idx` (`fk_Customer_id`),
  CONSTRAINT `fk_ProductRating_Customer1` FOREIGN KEY (`fk_Customer_id`) REFERENCES `customer` (`pk_Customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProductRating_Product1` FOREIGN KEY (`fk_Product_id`) REFERENCES `product` (`pk_Product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productrating`
--

LOCK TABLES `productrating` WRITE;
/*!40000 ALTER TABLE `productrating` DISABLE KEYS */;
INSERT INTO `productrating` VALUES (1,1,1,8,'Good Purchase','F'),(2,1,2,2,'Not worth','F'),(3,2,3,7,'Good Purchase','F'),(4,3,1,8,'Good Purchase','F'),(5,4,2,9,'Good Purchase','F'),(6,5,1,10,'Worth the Purchase','F');
/*!40000 ALTER TABLE `productrating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipment`
--

DROP TABLE IF EXISTS `shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipment` (
  `pk_Shipment_id` int(11) NOT NULL AUTO_INCREMENT,
  `Ship_date` date NOT NULL,
  `Shipment_tracking_number` varchar(15) NOT NULL,
  `Shipment_delete_flag` char(1) NOT NULL DEFAULT 'F',
  PRIMARY KEY (`pk_Shipment_id`),
  UNIQUE KEY `Shipment_tracking_number_UNIQUE` (`Shipment_tracking_number`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipment`
--

LOCK TABLES `shipment` WRITE;
/*!40000 ALTER TABLE `shipment` DISABLE KEYS */;
INSERT INTO `shipment` VALUES (1,'2014-11-15','6523145781','F'),(2,'2014-10-05','5147541207','F'),(4,'2014-02-25','5123657810','F');
/*!40000 ALTER TABLE `shipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `shipment_v`
--

DROP TABLE IF EXISTS `shipment_v`;
/*!50001 DROP VIEW IF EXISTS `shipment_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `shipment_v` (
  `pk_Shipment_id` tinyint NOT NULL,
  `Ship_date` tinyint NOT NULL,
  `Shipment_tracking_number` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `shipment_v_all`
--

DROP TABLE IF EXISTS `shipment_v_all`;
/*!50001 DROP VIEW IF EXISTS `shipment_v_all`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `shipment_v_all` (
  `pk_Shipment_id` tinyint NOT NULL,
  `Ship_date` tinyint NOT NULL,
  `Shipment_tracking_number` tinyint NOT NULL,
  `Shipment_delete_flag` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `shipping_employee_v`
--

DROP TABLE IF EXISTS `shipping_employee_v`;
/*!50001 DROP VIEW IF EXISTS `shipping_employee_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `shipping_employee_v` (
  `pk_ShippingEmployee_id` tinyint NOT NULL,
  `fk_Employee_id` tinyint NOT NULL,
  `Shipment_Shipment_id` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `shipping_employee_v_all`
--

DROP TABLE IF EXISTS `shipping_employee_v_all`;
/*!50001 DROP VIEW IF EXISTS `shipping_employee_v_all`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `shipping_employee_v_all` (
  `pk_ShippingEmployee_id` tinyint NOT NULL,
  `fk_Employee_id` tinyint NOT NULL,
  `Shipment_Shipment_id` tinyint NOT NULL,
  `ShippingEmployee_delete_flag` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `shipping_employee_view`
--

DROP TABLE IF EXISTS `shipping_employee_view`;
/*!50001 DROP VIEW IF EXISTS `shipping_employee_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `shipping_employee_view` (
  `SHIPMENT_ID` tinyint NOT NULL,
  `TRACKING_NUMBER` tinyint NOT NULL,
  `QUANTITY` tinyint NOT NULL,
  `PRODUCT_ID` tinyint NOT NULL,
  `PRODUCT_NAME` tinyint NOT NULL,
  `ORDER_ID` tinyint NOT NULL,
  `ORDER_DATE` tinyint NOT NULL,
  `CUSTOMER_ID` tinyint NOT NULL,
  `CUSTOMER_NAME` tinyint NOT NULL,
  `EMAIL_ID` tinyint NOT NULL,
  `SHIP_ADDRESS` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `shippingemployee`
--

DROP TABLE IF EXISTS `shippingemployee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shippingemployee` (
  `pk_ShippingEmployee_id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_Employee_id` int(11) NOT NULL,
  `Shipment_Shipment_id` int(11) NOT NULL,
  `ShippingEmployee_delete_flag` char(1) NOT NULL DEFAULT 'F',
  PRIMARY KEY (`pk_ShippingEmployee_id`),
  KEY `fk_ShippingEmployee_Employee1_idx` (`fk_Employee_id`),
  KEY `fk_ShippingEmployee_Shipment1_idx` (`Shipment_Shipment_id`),
  CONSTRAINT `fk_ShippingEmployee_Employee1` FOREIGN KEY (`fk_Employee_id`) REFERENCES `employee` (`pk_Employee_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ShippingEmployee_Shipment1` FOREIGN KEY (`Shipment_Shipment_id`) REFERENCES `shipment` (`pk_Shipment_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shippingemployee`
--

LOCK TABLES `shippingemployee` WRITE;
/*!40000 ALTER TABLE `shippingemployee` DISABLE KEYS */;
INSERT INTO `shippingemployee` VALUES (4,2,1,'F'),(5,2,2,'F');
/*!40000 ALTER TABLE `shippingemployee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'instacart_db'
--

--
-- Dumping routines for database 'instacart_db'
--
/*!50003 DROP PROCEDURE IF EXISTS `Insert_person_data_2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insert_person_data_2`(first_name varchar(45), middle_name varchar(45), last_name varchar(45), age tinyint(4), gender varchar(10), 
 email_id varchar(70), phone_no varchar(10), street_addr varchar(70), apt_no varchar(30), city varchar(45), state varchar(45), zip varchar(9),
username varchar(20), pass varchar(20), person_type char(1), customer_type varchar(10), emp_title varchar(30), date_of_joining date, salary float )
BEGIN
INSERT INTO person values(null, first_name, middle_name, last_name, age, gender,'F');
SET @person_id = (SELECT MAX(pk_Person_id) FROM PERSON);
INSERT INTO personemail values (null,@person_id, email_id, 'F');
INSERT INTO personphone values (null, @person_id, Phone_number, 'F');
INSERT INTO address values (null, street_addr, apt_no, city, state, zip, 'F');
SET @address_id =(SELECT MAX(pk_Address_id) FROM address);
INSERT INTO `person/address` values(null,@address_id,@person_id, 'F');
INSERT INTO personaccount values (null, @person_id, username, pass , 'F');
IF (person_type = 'c')
THEN
SET @c_type_id = (SELECT pk_CustomerType_id FROM customertype WHERE CustomerType_name=customer_type);
INSERT INTO customer values (null, now(), @person_id, @c_type_id, 'F');

ELSE IF(person_type = 'e')
THEN
INSERT INTO employee values(null,@person_id,emp_title,date_of_joining, null, 'F', null);
SET @emp_id = (SELECT MAX(pk_Employee_id) FROM employee);
INSERT INTO employeesalary values (null, @emp_id, salary, 'F');
END IF;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_product_data` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_product_data`(product_name varchar(45), product_description varchar(250), weight tinyint(4), price float, department varchar(45), 
quantity int(10), grocery_store varchar(45))
BEGIN
IF EXISTS (SELECT pk_GroceryStore_id FROM grocerystore WHERE GroceryStore_name = grocery_store)
THEN
SET @grocery_s_id = (SELECT pk_GroceryStore_id FROM grocerystore WHERE GroceryStore_name = grocery_store);
ELSE
INSERT INTO grocerystore values (null, GroceryStore_name, 'F');
SET @grocery_s_id = (SELECT MAX(pk_GroceryStore_id) FROM grocerystore);
END IF;
IF EXISTS (SELECT pk_Department_id FROM department WHERE Department_name=department)
THEN
SET @dept_id =(SELECT pk_Department_id FROM department WHERE Department_name=department);
ELSE
INSERT INTO department values (null,department,'F');
SET @dept_id = (SELECT MAX(pk_Department_id) FROM department);
END IF;
INSERT INTO product values (null, product_name, product_description, weight, price, 'F', null, @dept_id);
SET @prod_id = (SELECT MAX(pk_Product_id) FROM product);
INSERT INTO productavailability values(null,quantity, @grocery_s_id,@prod_id,'F');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `address_v`
--

/*!50001 DROP TABLE IF EXISTS `address_v`*/;
/*!50001 DROP VIEW IF EXISTS `address_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `address_v` AS select `address`.`pk_Address_id` AS `pk_Address_id`,`address`.`Street_name` AS `Street_name`,`address`.`Apt_number` AS `Apt_number`,`address`.`City` AS `City`,`address`.`State` AS `State`,`address`.`Zip` AS `Zip` from `address` where (`address`.`Address_delete_flag` = 'F') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `address_v_all`
--

/*!50001 DROP TABLE IF EXISTS `address_v_all`*/;
/*!50001 DROP VIEW IF EXISTS `address_v_all`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `address_v_all` AS select `address`.`pk_Address_id` AS `pk_Address_id`,`address`.`Street_name` AS `Street_name`,`address`.`Apt_number` AS `Apt_number`,`address`.`City` AS `City`,`address`.`State` AS `State`,`address`.`Zip` AS `Zip`,`address`.`Address_delete_flag` AS `Address_delete_flag` from `address` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customer_order_history_v`
--

/*!50001 DROP TABLE IF EXISTS `customer_order_history_v`*/;
/*!50001 DROP VIEW IF EXISTS `customer_order_history_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_order_history_v` AS select `customerorderhistory`.`pk_CustomerOrderHistory_id` AS `pk_CustomerOrderHistory_id`,`customerorderhistory`.`order_date` AS `order_date`,`customerorderhistory`.`fk_Customer_id` AS `fk_Customer_id`,`customerorderhistory`.`Order_Order_id` AS `Order_Order_id` from `customerorderhistory` where (`customerorderhistory`.`CustomerOrderHistory_delete_flag` = 'F') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customer_order_history_v_all`
--

/*!50001 DROP TABLE IF EXISTS `customer_order_history_v_all`*/;
/*!50001 DROP VIEW IF EXISTS `customer_order_history_v_all`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_order_history_v_all` AS select `customerorderhistory`.`pk_CustomerOrderHistory_id` AS `pk_CustomerOrderHistory_id`,`customerorderhistory`.`order_date` AS `order_date`,`customerorderhistory`.`fk_Customer_id` AS `fk_Customer_id`,`customerorderhistory`.`Order_Order_id` AS `Order_Order_id`,`customerorderhistory`.`CustomerOrderHistory_delete_flag` AS `CustomerOrderHistory_delete_flag` from `customerorderhistory` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customer_type_v`
--

/*!50001 DROP TABLE IF EXISTS `customer_type_v`*/;
/*!50001 DROP VIEW IF EXISTS `customer_type_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_type_v` AS select `customertype`.`pk_CustomerType_id` AS `pk_CustomerType_id`,`customertype`.`CustomerType_name` AS `CustomerType_name` from `customertype` where (`customertype`.`CustomerType_delete_flag` = 'F') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customer_type_v_all`
--

/*!50001 DROP TABLE IF EXISTS `customer_type_v_all`*/;
/*!50001 DROP VIEW IF EXISTS `customer_type_v_all`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_type_v_all` AS select `customertype`.`pk_CustomerType_id` AS `pk_CustomerType_id`,`customertype`.`CustomerType_name` AS `CustomerType_name`,`customertype`.`CustomerType_delete_flag` AS `CustomerType_delete_flag` from `customertype` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customer_v`
--

/*!50001 DROP TABLE IF EXISTS `customer_v`*/;
/*!50001 DROP VIEW IF EXISTS `customer_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_v` AS select `customer`.`pk_Customer_id` AS `pk_Customer_id`,`customer`.`ActiveFrom` AS `ActiveFrom`,`customer`.`fk_person_id` AS `fk_person_id`,`customer`.`fk_CustomerType_id` AS `fk_CustomerType_id` from `customer` where (`customer`.`Customer_delete_flag` = 'F') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customer_v_all`
--

/*!50001 DROP TABLE IF EXISTS `customer_v_all`*/;
/*!50001 DROP VIEW IF EXISTS `customer_v_all`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_v_all` AS select `customer`.`pk_Customer_id` AS `pk_Customer_id`,`customer`.`ActiveFrom` AS `ActiveFrom`,`customer`.`fk_person_id` AS `fk_person_id`,`customer`.`fk_CustomerType_id` AS `fk_CustomerType_id`,`customer`.`Customer_delete_flag` AS `Customer_delete_flag` from `customer` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customer_view`
--

/*!50001 DROP TABLE IF EXISTS `customer_view`*/;
/*!50001 DROP VIEW IF EXISTS `customer_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_view` AS select `product`.`pk_Product_id` AS `PRODUCT_ID`,`product`.`Product_name` AS `PRODUCT_NAME`,`product`.`Product_description` AS `PRODUCT_DESCRIPTION`,`product`.`Product_weight` AS `WEIGHT`,avg(`productrating`.`Rating`) AS `AVERAGE_RATING`,group_concat(`productrating`.`Comments` separator ' , ') AS `COMMENTS`,`department`.`Department_name` AS `DEPARTMENT`,`productavailability`.`ProductAvailability` AS `QUANTITY_AVAILABLE`,`product`.`Product_price` AS `PRICE`,coalesce(`productdiscount`.`discount_percent`,'Not Available') AS `DISCOUNT%`,coalesce(`productdiscount`.`Deactive_date`,cast((curdate() - 1) as date)) AS `DISCOUNT_END_DATE` from ((((`product` left join `productdiscount` on((`product`.`ProductDiscount_pk_ProductDiscount_id` = `productdiscount`.`pk_ProductDiscount_id`))) left join `department` on((`product`.`fk_Department_id` = `department`.`pk_Department_id`))) left join `productavailability` on((`product`.`pk_Product_id` = `productavailability`.`Product_Product_id`))) left join `productrating` on((`product`.`pk_Product_id` = `productrating`.`fk_Product_id`))) group by `product`.`pk_Product_id` order by `product`.`pk_Product_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `department_v`
--

/*!50001 DROP TABLE IF EXISTS `department_v`*/;
/*!50001 DROP VIEW IF EXISTS `department_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `department_v` AS select `department`.`pk_Department_id` AS `pk_Department_id`,`department`.`Department_name` AS `Department_name` from `department` where (`department`.`ProductDepartment_delete_flag` = 'F') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `discount_coupon`
--

/*!50001 DROP TABLE IF EXISTS `discount_coupon`*/;
/*!50001 DROP VIEW IF EXISTS `discount_coupon`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `discount_coupon` AS select `discountcoupon`.`pk_DiscountCoupon_id` AS `pk_DiscountCoupon_id`,`discountcoupon`.`DiscountCoupon_name` AS `DiscountCoupon_name`,`discountcoupon`.`Active_from` AS `Active_from`,`discountcoupon`.`Deactive_date` AS `Deactive_date`,`discountcoupon`.`dollar_value` AS `dollar_value`,`discountcoupon`.`fk_Customer_id` AS `fk_Customer_id`,`discountcoupon`.`fk_Order_id` AS `fk_Order_id` from `discountcoupon` where (`discountcoupon`.`DiscountCoupon_delete_flag` = 'F') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `discount_coupon_all`
--

/*!50001 DROP TABLE IF EXISTS `discount_coupon_all`*/;
/*!50001 DROP VIEW IF EXISTS `discount_coupon_all`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `discount_coupon_all` AS select `discountcoupon`.`pk_DiscountCoupon_id` AS `pk_DiscountCoupon_id`,`discountcoupon`.`DiscountCoupon_name` AS `DiscountCoupon_name`,`discountcoupon`.`Active_from` AS `Active_from`,`discountcoupon`.`Deactive_date` AS `Deactive_date`,`discountcoupon`.`dollar_value` AS `dollar_value`,`discountcoupon`.`fk_Customer_id` AS `fk_Customer_id`,`discountcoupon`.`fk_Order_id` AS `fk_Order_id`,`discountcoupon`.`DiscountCoupon_delete_flag` AS `DiscountCoupon_delete_flag` from `discountcoupon` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employee_salary_v`
--

/*!50001 DROP TABLE IF EXISTS `employee_salary_v`*/;
/*!50001 DROP VIEW IF EXISTS `employee_salary_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employee_salary_v` AS select `employeesalary`.`pk_EmployeeSalary_id` AS `pk_EmployeeSalary_id`,`employeesalary`.`Employee_Employee_id` AS `Employee_Employee_id`,`employeesalary`.`Salary` AS `Salary` from `employeesalary` where (`employeesalary`.`employeesalary_delete_flag` = 'F') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employee_salary_v_all`
--

/*!50001 DROP TABLE IF EXISTS `employee_salary_v_all`*/;
/*!50001 DROP VIEW IF EXISTS `employee_salary_v_all`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employee_salary_v_all` AS select `employeesalary`.`pk_EmployeeSalary_id` AS `pk_EmployeeSalary_id`,`employeesalary`.`Employee_Employee_id` AS `Employee_Employee_id`,`employeesalary`.`Salary` AS `Salary`,`employeesalary`.`employeesalary_delete_flag` AS `employeesalary_delete_flag` from `employeesalary` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employee_v`
--

/*!50001 DROP TABLE IF EXISTS `employee_v`*/;
/*!50001 DROP VIEW IF EXISTS `employee_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employee_v` AS select `employee`.`pk_Employee_id` AS `pk_Employee_id`,`employee`.`fk_Person_id` AS `fk_person_id`,`employee`.`Title` AS `Title`,`employee`.`date_of_joining` AS `date_of_joining`,`employee`.`date_of_leaving` AS `date_of_leaving`,`employee`.`Employee_manager_id` AS `Employee_manager_id` from `employee` where (`employee`.`Employee_delete_flag` = 'F') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employee_v_all`
--

/*!50001 DROP TABLE IF EXISTS `employee_v_all`*/;
/*!50001 DROP VIEW IF EXISTS `employee_v_all`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employee_v_all` AS select `employee`.`pk_Employee_id` AS `pk_Employee_id`,`employee`.`fk_Person_id` AS `fk_Person_id`,`employee`.`Title` AS `Title`,`employee`.`date_of_joining` AS `date_of_joining`,`employee`.`date_of_leaving` AS `date_of_leaving`,`employee`.`Employee_delete_flag` AS `Employee_delete_flag`,`employee`.`Employee_manager_id` AS `Employee_manager_id` from `employee` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grocery_store_v`
--

/*!50001 DROP TABLE IF EXISTS `grocery_store_v`*/;
/*!50001 DROP VIEW IF EXISTS `grocery_store_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grocery_store_v` AS select `grocerystore`.`pk_GroceryStore_id` AS `pk_GroceryStore_id`,`grocerystore`.`GroceryStore_name` AS `GroceryStore_name` from `grocerystore` where (`grocerystore`.`GroceryStore_delete_flag` = 'F') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grocery_store_v_all`
--

/*!50001 DROP TABLE IF EXISTS `grocery_store_v_all`*/;
/*!50001 DROP VIEW IF EXISTS `grocery_store_v_all`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grocery_store_v_all` AS select `grocerystore`.`pk_GroceryStore_id` AS `pk_GroceryStore_id`,`grocerystore`.`GroceryStore_name` AS `GroceryStore_name`,`grocerystore`.`GroceryStore_delete_flag` AS `GroceryStore_delete_flag` from `grocerystore` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grocerystore_address_v`
--

/*!50001 DROP TABLE IF EXISTS `grocerystore_address_v`*/;
/*!50001 DROP VIEW IF EXISTS `grocerystore_address_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grocerystore_address_v` AS select `grocerystore/address`.`pk_GroceryStore/Address_id` AS `pk_GroceryStore/Address_id`,`grocerystore/address`.`GroceryStore_GroceryStore_id` AS `GroceryStore_GroceryStore_id`,`grocerystore/address`.`Address_Address_id` AS `Address_Address_id` from `grocerystore/address` where (`grocerystore/address`.`GroceryStore/Address_delete_flag` = 'F') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grocerystore_address_v_all`
--

/*!50001 DROP TABLE IF EXISTS `grocerystore_address_v_all`*/;
/*!50001 DROP VIEW IF EXISTS `grocerystore_address_v_all`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grocerystore_address_v_all` AS select `grocerystore/address`.`pk_GroceryStore/Address_id` AS `pk_GroceryStore/Address_id`,`grocerystore/address`.`GroceryStore_GroceryStore_id` AS `GroceryStore_GroceryStore_id`,`grocerystore/address`.`Address_Address_id` AS `Address_Address_id`,`grocerystore/address`.`GroceryStore/Address_delete_flag` AS `GroceryStore/Address_delete_flag` from `grocerystore/address` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `invoice_details_v`
--

/*!50001 DROP TABLE IF EXISTS `invoice_details_v`*/;
/*!50001 DROP VIEW IF EXISTS `invoice_details_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `invoice_details_v` AS select `invoicedetails`.`pk_InvoiceDetails_id` AS `pk_InvoiceDetails_id`,`invoicedetails`.`fk_Order_id` AS `fk_Order_id`,`invoicedetails`.`invoice_status` AS `invoice_status`,`invoicedetails`.`invoice_date` AS `invoice_date`,`invoicedetails`.`fk_PaymentDetails_id` AS `fk_PaymentDetails_id`,`invoicedetails`.`amount_paid` AS `amount_paid` from `invoicedetails` where (`invoicedetails`.`InvoiceDetails_delete_flag` = 'F') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `invoice_details_v_all`
--

/*!50001 DROP TABLE IF EXISTS `invoice_details_v_all`*/;
/*!50001 DROP VIEW IF EXISTS `invoice_details_v_all`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `invoice_details_v_all` AS select `invoicedetails`.`pk_InvoiceDetails_id` AS `pk_InvoiceDetails_id`,`invoicedetails`.`fk_Order_id` AS `fk_Order_id`,`invoicedetails`.`invoice_status` AS `invoice_status`,`invoicedetails`.`invoice_date` AS `invoice_date`,`invoicedetails`.`fk_PaymentDetails_id` AS `fk_PaymentDetails_id`,`invoicedetails`.`InvoiceDetails_delete_flag` AS `InvoiceDetails_delete_flag`,`invoicedetails`.`amount_paid` AS `amount_paid` from `invoicedetails` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `order_item_v`
--

/*!50001 DROP TABLE IF EXISTS `order_item_v`*/;
/*!50001 DROP VIEW IF EXISTS `order_item_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `order_item_v` AS select `orderitem`.`pk_Order_item_id` AS `pk_Order_item_id`,`orderitem`.`quantity` AS `quantity`,`orderitem`.`order_item_price` AS `order_item_price`,`orderitem`.`fk_Product_id` AS `fk_Product_id`,`orderitem`.`fk_Order_id` AS `fk_Order_id`,`orderitem`.`fk_Shipment_id` AS `fk_Shipment_id` from `orderitem` where (`orderitem`.`OrderItem_delete_flag` = 'F') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `order_item_v_all`
--

/*!50001 DROP TABLE IF EXISTS `order_item_v_all`*/;
/*!50001 DROP VIEW IF EXISTS `order_item_v_all`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `order_item_v_all` AS select `orderitem`.`pk_Order_item_id` AS `pk_Order_item_id`,`orderitem`.`quantity` AS `quantity`,`orderitem`.`order_item_price` AS `order_item_price`,`orderitem`.`fk_Product_id` AS `fk_Product_id`,`orderitem`.`fk_Order_id` AS `fk_Order_id`,`orderitem`.`OrderItem_delete_flag` AS `OrderItem_delete_flag`,`orderitem`.`fk_Shipment_id` AS `fk_Shipment_id` from `orderitem` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `order_tax_v`
--

/*!50001 DROP TABLE IF EXISTS `order_tax_v`*/;
/*!50001 DROP VIEW IF EXISTS `order_tax_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `order_tax_v` AS select `ordertax`.`pk_OrderTax_id` AS `pk_OrderTax_id`,`ordertax`.`State` AS `State`,`ordertax`.`tax_percent` AS `tax_percent` from `ordertax` where (`ordertax`.`OrderTax_delete_flag` = 'F') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `order_tax_v_all`
--

/*!50001 DROP TABLE IF EXISTS `order_tax_v_all`*/;
/*!50001 DROP VIEW IF EXISTS `order_tax_v_all`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `order_tax_v_all` AS select `ordertax`.`pk_OrderTax_id` AS `pk_OrderTax_id`,`ordertax`.`State` AS `State`,`ordertax`.`tax_percent` AS `tax_percent`,`ordertax`.`OrderTax_delete_flag` AS `OrderTax_delete_flag` from `ordertax` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `order_v`
--

/*!50001 DROP TABLE IF EXISTS `order_v`*/;
/*!50001 DROP VIEW IF EXISTS `order_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `order_v` AS select `order`.`pk_Order_id` AS `pk_Order_id`,`order`.`date_of_purchase` AS `date_of_purchase`,`order`.`fk_Customer_id` AS `fk_Customer_id`,`order`.`order_price` AS `order_price`,`order`.`fk_OrderTax_id` AS `fk_OrderTax_id` from `order` where (`order`.`Order_delete_flag` = 'F') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `order_v_all`
--

/*!50001 DROP TABLE IF EXISTS `order_v_all`*/;
/*!50001 DROP VIEW IF EXISTS `order_v_all`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `order_v_all` AS select `order`.`pk_Order_id` AS `pk_Order_id`,`order`.`date_of_purchase` AS `date_of_purchase`,`order`.`fk_Customer_id` AS `fk_Customer_id`,`order`.`order_price` AS `order_price`,`order`.`fk_OrderTax_id` AS `fk_OrderTax_id`,`order`.`Order_delete_flag` AS `Order_delete_flag` from `order` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `payment_details_v`
--

/*!50001 DROP TABLE IF EXISTS `payment_details_v`*/;
/*!50001 DROP VIEW IF EXISTS `payment_details_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `payment_details_v` AS select `paymentdetails`.`pk_PaymentDetails_id` AS `pk_PaymentDetails_id`,`paymentdetails`.`Card_name` AS `Card_name`,`paymentdetails`.`Card_number` AS `Card_number`,`paymentdetails`.`Expiration_date` AS `Expiration_date`,`paymentdetails`.`security_code` AS `security_code`,`paymentdetails`.`Customer_Customer_id` AS `Customer_Customer_id` from `paymentdetails` where (`paymentdetails`.`PaymentDetails_delete_flag` = 'F') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `payment_details_v_all`
--

/*!50001 DROP TABLE IF EXISTS `payment_details_v_all`*/;
/*!50001 DROP VIEW IF EXISTS `payment_details_v_all`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `payment_details_v_all` AS select `paymentdetails`.`pk_PaymentDetails_id` AS `pk_PaymentDetails_id`,`paymentdetails`.`Card_name` AS `Card_name`,`paymentdetails`.`Card_number` AS `Card_number`,`paymentdetails`.`Expiration_date` AS `Expiration_date`,`paymentdetails`.`security_code` AS `security_code`,`paymentdetails`.`Customer_Customer_id` AS `Customer_Customer_id`,`paymentdetails`.`PaymentDetails_delete_flag` AS `PaymentDetails_delete_flag` from `paymentdetails` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `person_account_v`
--

/*!50001 DROP TABLE IF EXISTS `person_account_v`*/;
/*!50001 DROP VIEW IF EXISTS `person_account_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `person_account_v` AS select `personaccount`.`pk_PersonAccount_id` AS `pk_PersonAccount_id`,`personaccount`.`Person_Person_id` AS `Person_Person_id`,`personaccount`.`username` AS `username`,`personaccount`.`password` AS `password` from `personaccount` where (`personaccount`.`PersonAccount_delete_flag` = 'F') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `person_account_v_all`
--

/*!50001 DROP TABLE IF EXISTS `person_account_v_all`*/;
/*!50001 DROP VIEW IF EXISTS `person_account_v_all`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `person_account_v_all` AS select `personaccount`.`pk_PersonAccount_id` AS `pk_PersonAccount_id`,`personaccount`.`Person_Person_id` AS `Person_Person_id`,`personaccount`.`username` AS `username`,`personaccount`.`password` AS `password`,`personaccount`.`PersonAccount_delete_flag` AS `PersonAccount_delete_flag` from `personaccount` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `person_address_v`
--

/*!50001 DROP TABLE IF EXISTS `person_address_v`*/;
/*!50001 DROP VIEW IF EXISTS `person_address_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `person_address_v` AS select `person/address`.`pk_Person/Address_id` AS `pk_Person/Address_id`,`person/address`.`Address_Address_id` AS `Address_Address_id`,`person/address`.`Person_Person_id` AS `Person_Person_id` from `person/address` where (`person/address`.`Person/Address_delete_flag` = 'F') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `person_address_v_all`
--

/*!50001 DROP TABLE IF EXISTS `person_address_v_all`*/;
/*!50001 DROP VIEW IF EXISTS `person_address_v_all`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `person_address_v_all` AS select `person/address`.`pk_Person/Address_id` AS `pk_Person/Address_id`,`person/address`.`Address_Address_id` AS `Address_Address_id`,`person/address`.`Person_Person_id` AS `Person_Person_id`,`person/address`.`Person/Address_delete_flag` AS `Person/Address_delete_flag` from `person/address` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `person_email_v`
--

/*!50001 DROP TABLE IF EXISTS `person_email_v`*/;
/*!50001 DROP VIEW IF EXISTS `person_email_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `person_email_v` AS select `personemail`.`pk_PersonEmail_id` AS `pk_PersonEmail_id`,`personemail`.`Person_Person_id` AS `Person_Person_id`,`personemail`.`email_id` AS `email_id` from `personemail` where (`personemail`.`PersonEmail_delete_flag` = 'F') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `person_email_v_all`
--

/*!50001 DROP TABLE IF EXISTS `person_email_v_all`*/;
/*!50001 DROP VIEW IF EXISTS `person_email_v_all`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `person_email_v_all` AS select `personemail`.`pk_PersonEmail_id` AS `pk_PersonEmail_id`,`personemail`.`Person_Person_id` AS `Person_Person_id`,`personemail`.`email_id` AS `email_id`,`personemail`.`PersonEmail_delete_flag` AS `PersonEmail_delete_flag` from `personemail` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `person_phone_v`
--

/*!50001 DROP TABLE IF EXISTS `person_phone_v`*/;
/*!50001 DROP VIEW IF EXISTS `person_phone_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `person_phone_v` AS select `personphone`.`pk_PersonPhone_id` AS `pk_PersonPhone_id`,`personphone`.`Person_Person_id` AS `Person_Person_id`,`personphone`.`Phone_number` AS `Phone_number` from `personphone` where (`personphone`.`PersonPhone_delete_flag` = 'F') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `person_phone_v_all`
--

/*!50001 DROP TABLE IF EXISTS `person_phone_v_all`*/;
/*!50001 DROP VIEW IF EXISTS `person_phone_v_all`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `person_phone_v_all` AS select `personphone`.`pk_PersonPhone_id` AS `pk_PersonPhone_id`,`personphone`.`Person_Person_id` AS `Person_Person_id`,`personphone`.`Phone_number` AS `Phone_number`,`personphone`.`PersonPhone_delete_flag` AS `PersonPhone_delete_flag` from `personphone` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `person_v`
--

/*!50001 DROP TABLE IF EXISTS `person_v`*/;
/*!50001 DROP VIEW IF EXISTS `person_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `person_v` AS select `person`.`pk_Person_id` AS `pk_Person_id`,`person`.`first_name` AS `first_name`,`person`.`middle_name` AS `middle_name`,`person`.`last_name` AS `last_name`,`person`.`age` AS `age`,`person`.`gender` AS `gender` from `person` where (`person`.`Person_delete_flag` = 'F') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `person_v_all`
--

/*!50001 DROP TABLE IF EXISTS `person_v_all`*/;
/*!50001 DROP VIEW IF EXISTS `person_v_all`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `person_v_all` AS select `person`.`pk_Person_id` AS `pk_Person_id`,`person`.`first_name` AS `first_name`,`person`.`middle_name` AS `middle_name`,`person`.`last_name` AS `last_name`,`person`.`age` AS `age`,`person`.`gender` AS `gender`,`person`.`Person_delete_flag` AS `Person_delete_flag` from `person` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `product_availability_v`
--

/*!50001 DROP TABLE IF EXISTS `product_availability_v`*/;
/*!50001 DROP VIEW IF EXISTS `product_availability_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `product_availability_v` AS select `productavailability`.`pk_ProductAvailability_id` AS `pk_ProductAvailability_id`,`productavailability`.`ProductAvailability` AS `ProductAvailability`,`productavailability`.`GroceryStore_GroceryStore_id` AS `GroceryStore_GroceryStore_id`,`productavailability`.`Product_Product_id` AS `Product_Product_id` from `productavailability` where (`productavailability`.`ProductAvailability_delete_flag` = 'F') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `product_availability_v_all`
--

/*!50001 DROP TABLE IF EXISTS `product_availability_v_all`*/;
/*!50001 DROP VIEW IF EXISTS `product_availability_v_all`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `product_availability_v_all` AS select `productavailability`.`pk_ProductAvailability_id` AS `pk_ProductAvailability_id`,`productavailability`.`ProductAvailability` AS `ProductAvailability`,`productavailability`.`GroceryStore_GroceryStore_id` AS `GroceryStore_GroceryStore_id`,`productavailability`.`Product_Product_id` AS `Product_Product_id`,`productavailability`.`ProductAvailability_delete_flag` AS `ProductAvailability_delete_flag` from `productavailability` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `product_discount_v`
--

/*!50001 DROP TABLE IF EXISTS `product_discount_v`*/;
/*!50001 DROP VIEW IF EXISTS `product_discount_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `product_discount_v` AS select `productdiscount`.`pk_ProductDiscount_id` AS `pk_ProductDiscount_id`,`productdiscount`.`discount_percent` AS `discount_percent`,`productdiscount`.`Active_from` AS `Active_from`,`productdiscount`.`Deactive_date` AS `Deactive_date` from `productdiscount` where (`productdiscount`.`ProductDiscount_delete_flag` = 'F') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `product_discount_v_all`
--

/*!50001 DROP TABLE IF EXISTS `product_discount_v_all`*/;
/*!50001 DROP VIEW IF EXISTS `product_discount_v_all`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `product_discount_v_all` AS select `productdiscount`.`pk_ProductDiscount_id` AS `pk_ProductDiscount_id`,`productdiscount`.`discount_percent` AS `discount_percent`,`productdiscount`.`Active_from` AS `Active_from`,`productdiscount`.`Deactive_date` AS `Deactive_date`,`productdiscount`.`ProductDiscount_delete_flag` AS `ProductDiscount_delete_flag` from `productdiscount` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `product_rating_v`
--

/*!50001 DROP TABLE IF EXISTS `product_rating_v`*/;
/*!50001 DROP VIEW IF EXISTS `product_rating_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `product_rating_v` AS select `productrating`.`pk_ProductRating_id` AS `pk_ProductRating_id`,`productrating`.`fk_Product_id` AS `fk_Product_id`,`productrating`.`fk_Customer_id` AS `fk_Customer_id`,`productrating`.`Rating` AS `Rating`,`productrating`.`Comments` AS `Comments` from `productrating` where (`productrating`.`ProductRating_delete_flag` = 'F') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `product_rating_v_all`
--

/*!50001 DROP TABLE IF EXISTS `product_rating_v_all`*/;
/*!50001 DROP VIEW IF EXISTS `product_rating_v_all`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `product_rating_v_all` AS select `productrating`.`pk_ProductRating_id` AS `pk_ProductRating_id`,`productrating`.`fk_Product_id` AS `fk_Product_id`,`productrating`.`fk_Customer_id` AS `fk_Customer_id`,`productrating`.`Rating` AS `Rating`,`productrating`.`Comments` AS `Comments`,`productrating`.`ProductRating_delete_flag` AS `ProductRating_delete_flag` from `productrating` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `product_v`
--

/*!50001 DROP TABLE IF EXISTS `product_v`*/;
/*!50001 DROP VIEW IF EXISTS `product_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `product_v` AS select `product`.`pk_Product_id` AS `pk_Product_id`,`product`.`Product_name` AS `Product_name`,`product`.`Product_description` AS `Product_description`,`product`.`Product_weight` AS `Product_weight`,`product`.`Product_price` AS `Product_price`,`product`.`ProductDiscount_pk_ProductDiscount_id` AS `ProductDiscount_pk_ProductDiscount_id`,`product`.`fk_Department_id` AS `fk_Department_id` from `product` where (`product`.`Product_delete_flag` = 'F') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `product_v_all`
--

/*!50001 DROP TABLE IF EXISTS `product_v_all`*/;
/*!50001 DROP VIEW IF EXISTS `product_v_all`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `product_v_all` AS select `product`.`pk_Product_id` AS `pk_Product_id`,`product`.`Product_name` AS `Product_name`,`product`.`Product_description` AS `Product_description`,`product`.`Product_weight` AS `Product_weight`,`product`.`Product_price` AS `Product_price`,`product`.`Product_delete_flag` AS `Product_delete_flag`,`product`.`ProductDiscount_pk_ProductDiscount_id` AS `ProductDiscount_pk_ProductDiscount_id`,`product`.`fk_Department_id` AS `fk_Department_id` from `product` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `shipment_v`
--

/*!50001 DROP TABLE IF EXISTS `shipment_v`*/;
/*!50001 DROP VIEW IF EXISTS `shipment_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `shipment_v` AS select `shipment`.`pk_Shipment_id` AS `pk_Shipment_id`,`shipment`.`Ship_date` AS `Ship_date`,`shipment`.`Shipment_tracking_number` AS `Shipment_tracking_number` from `shipment` where (`shipment`.`Shipment_delete_flag` = 'F') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `shipment_v_all`
--

/*!50001 DROP TABLE IF EXISTS `shipment_v_all`*/;
/*!50001 DROP VIEW IF EXISTS `shipment_v_all`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `shipment_v_all` AS select `shipment`.`pk_Shipment_id` AS `pk_Shipment_id`,`shipment`.`Ship_date` AS `Ship_date`,`shipment`.`Shipment_tracking_number` AS `Shipment_tracking_number`,`shipment`.`Shipment_delete_flag` AS `Shipment_delete_flag` from `shipment` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `shipping_employee_v`
--

/*!50001 DROP TABLE IF EXISTS `shipping_employee_v`*/;
/*!50001 DROP VIEW IF EXISTS `shipping_employee_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `shipping_employee_v` AS select `shippingemployee`.`pk_ShippingEmployee_id` AS `pk_ShippingEmployee_id`,`shippingemployee`.`fk_Employee_id` AS `fk_Employee_id`,`shippingemployee`.`Shipment_Shipment_id` AS `Shipment_Shipment_id` from `shippingemployee` where (`shippingemployee`.`ShippingEmployee_delete_flag` = 'F') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `shipping_employee_v_all`
--

/*!50001 DROP TABLE IF EXISTS `shipping_employee_v_all`*/;
/*!50001 DROP VIEW IF EXISTS `shipping_employee_v_all`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `shipping_employee_v_all` AS select `shippingemployee`.`pk_ShippingEmployee_id` AS `pk_ShippingEmployee_id`,`shippingemployee`.`fk_Employee_id` AS `fk_Employee_id`,`shippingemployee`.`Shipment_Shipment_id` AS `Shipment_Shipment_id`,`shippingemployee`.`ShippingEmployee_delete_flag` AS `ShippingEmployee_delete_flag` from `shippingemployee` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `shipping_employee_view`
--

/*!50001 DROP TABLE IF EXISTS `shipping_employee_view`*/;
/*!50001 DROP VIEW IF EXISTS `shipping_employee_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `shipping_employee_view` AS select `shipment`.`pk_Shipment_id` AS `SHIPMENT_ID`,`shipment`.`Shipment_tracking_number` AS `TRACKING_NUMBER`,`orderitem`.`quantity` AS `QUANTITY`,`orderitem`.`fk_Product_id` AS `PRODUCT_ID`,`product`.`Product_name` AS `PRODUCT_NAME`,`order`.`pk_Order_id` AS `ORDER_ID`,`order`.`date_of_purchase` AS `ORDER_DATE`,`customer`.`pk_Customer_id` AS `CUSTOMER_ID`,concat(`person`.`first_name`,' ',coalesce(`person`.`middle_name`,' '),`person`.`last_name`) AS `CUSTOMER_NAME`,`personemail`.`email_id` AS `EMAIL_ID`,concat(`address`.`Street_name`,' , ',`address`.`Apt_number`,' , ',`address`.`City`,' , ',`address`.`State`,' , ',`address`.`Zip`) AS `SHIP_ADDRESS` from ((((((((`order` join `customer` on((`order`.`fk_Customer_id` = `customer`.`pk_Customer_id`))) join `person` on((`person`.`pk_Person_id` = `customer`.`fk_person_id`))) join `person/address` on((`person/address`.`Person_Person_id` = `person`.`pk_Person_id`))) join `address` on((`address`.`pk_Address_id` = `person/address`.`Address_Address_id`))) join `personemail` on((`person`.`pk_Person_id` = `personemail`.`Person_Person_id`))) join `orderitem` on((`orderitem`.`fk_Order_id` = `order`.`pk_Order_id`))) join `shipment` on((`shipment`.`pk_Shipment_id` = `orderitem`.`fk_Shipment_id`))) join `product` on((`product`.`pk_Product_id` = `orderitem`.`fk_Product_id`))) group by `product`.`pk_Product_id` order by `shipment`.`pk_Shipment_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-03  1:01:07
