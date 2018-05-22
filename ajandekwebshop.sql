-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 18, 2018 at 08:57 AM
-- Server version: 5.7.21
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ajandekwebshop`
--
CREATE DATABASE IF NOT EXISTS `ajandekwebshop` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `ajandekwebshop`;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `id` bigint(20) NOT NULL,
  `productid` bigint(20) NOT NULL,
  `amount` smallint(6) NOT NULL,
  `price` int(11) NOT NULL,
  `vasarloid` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cart_vasarlo` (`vasarloid`),
  KEY `fk_cart_product` (`productid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
CREATE TABLE IF NOT EXISTS `city` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `amount` smallint(6) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rendeles`
--

DROP TABLE IF EXISTS `rendeles`;
CREATE TABLE IF NOT EXISTS `rendeles` (
  `id` bigint(20) NOT NULL,
  `vasarloid` bigint(20) NOT NULL,
  `cartid` bigint(20) NOT NULL,
  `sum` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rendeles_cart` (`cartid`),
  KEY `fk_rendeles_vasarlo` (`vasarloid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vasarlo`
--

DROP TABLE IF EXISTS `vasarlo`;
CREATE TABLE IF NOT EXISTS `vasarlo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `logged_in` tinyint(4) NOT NULL DEFAULT '0',
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `user_address` varchar(200) NOT NULL,
  `secondary_address` varchar(200) DEFAULT NULL,
  `cityid` bigint(20) NOT NULL,
  `newsletter` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vasarlo`
--

INSERT INTO `vasarlo` (`id`, `name`, `logged_in`, `username`, `password`, `email`, `user_address`, `secondary_address`, `cityid`, `newsletter`) VALUES
(1, 'test béla', 0, 'testuser1', 'test', 'testuser1@gmail.com', 'dummy street 41', NULL, 1, 1),
(2, 'test istván', 0, 'testuser2', 'test', 'testuser2@gmail.com', 'dummy street 42', NULL, 1, 1),
(3, 'test loggedin', 1, 'loggeduser', 'test', 'asd@gmail.com', 'dummy street 44', NULL, 6, 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `fk_cart_product` FOREIGN KEY (`productid`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `fk_cart_vasarlo` FOREIGN KEY (`vasarloid`) REFERENCES `vasarlo` (`id`);

--
-- Constraints for table `rendeles`
--
ALTER TABLE `rendeles`
  ADD CONSTRAINT `fk_rendeles_cart` FOREIGN KEY (`cartid`) REFERENCES `cart` (`id`),
  ADD CONSTRAINT `fk_rendeles_vasarlo` FOREIGN KEY (`vasarloid`) REFERENCES `vasarlo` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
