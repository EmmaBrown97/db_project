-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 19, 2018 at 03:23 PM
-- Server version: 5.6.39-cll-lve
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `the_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `Item_Uploaded`
--
CREATE DATABASE the_store;
USE the_store;

CREATE TABLE `Item_Uploaded` (
  `product_id` int(11) NOT NULL,
  `date_added` date NOT NULL,
  `date_removed` date,
  `sales` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ENGINE=INNODB;

-- --------------------------------------------------------

--
-- Table structure for table `Product`
--

CREATE TABLE `Product` (
  `product_id` int(11) NOT NULL,
  `seller` int(11) NOT NULL COMMENT 'user_id',
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ENGINE=INNODB;

-- --------------------------------------------------------

--
-- Table structure for table `Rating`
--

CREATE TABLE `Rating` (
  `rate_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `receiver` int(11) NOT NULL COMMENT 'user_id',
  `writer` int(11) NOT NULL COMMENT 'user_id',
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `response` varchar(255),
  `number` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ENGINE=INNODB;

-- --------------------------------------------------------

--
-- Table structure for table `Sale`
--

CREATE TABLE `Sale` (
  `sale_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `seller` int(11) NOT NULL COMMENT 'user_id',
  `buyer` int(11) NOT NULL COMMENT 'user_id',
  `quantity` int(11) NOT NULL,
  `pricer_per_unit` float NOT NULL,
  `total_price` float NOT NULL,
  `date` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ENGINE=INNODB;

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ENGINE=INNODB;

-- --------------------------------------------------------

--
-- Table structure for table `Verified_User`
--

CREATE TABLE `Verified_User` (
  `user_id` int(11) NOT NULL,
  `date_joined` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `random_key` varchar(255) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `date_expired` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ENGINE=INNODB;



--
-- Indexes for dumped tables
--

--
-- Indexes for table `Item_Uploaded`
--
ALTER TABLE `Item_Uploaded`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `Product`
--
ALTER TABLE `Product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `Rating`
--
ALTER TABLE `Rating`
  ADD PRIMARY KEY (`rate_id`);

--
-- Indexes for table `Sale`
--
ALTER TABLE `Sale`
  ADD PRIMARY KEY (`sale_id`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `Verified_User`
--
ALTER TABLE `Verified_User`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Product`
--
ALTER TABLE `Product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Rating`
--
ALTER TABLE `Rating`
  MODIFY `rate_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Sale`
--
ALTER TABLE `Sale`
  MODIFY `sale_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `User`
--
ALTER TABLE `User`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;


ALTER TABLE `Product`
  ADD CONSTRAINT IU_P_product_id
  FOREIGN KEY product_id(product_id)
  REFERENCES Item_Uploaded(product_id)
  ON DELETE CASCADE;

ALTER TABLE `Product`
  ADD CONSTRAINT U_P_user_id
  FOREIGN KEY user_id(seller)
  REFERENCES User(user_id)
  ON DELETE CASCADE;

ALTER TABLE `Sale`
  ADD CONSTRAINT S_P_product_id
  FOREIGN KEY product_id(product_id)
  REFERENCES Product(product_id)
  ON DELETE CASCADE;

ALTER TABLE `Sale`
  ADD CONSTRAINT S_U_seller_id
  FOREIGN KEY user_id(seller)
  REFERENCES User(user_id)
  ON DELETE CASCADE;

ALTER TABLE `Sale`
  ADD CONSTRAINT S_U_buyer_id
  FOREIGN KEY user_id(buyer)
  REFERENCES User(user_id)
  ON DELETE CASCADE;

ALTER TABLE `Rating`
  ADD CONSTRAINT R_S_receiver_id
  FOREIGN KEY seller(receiver)
  REFERENCES Sale(seller)
  ON DELETE CASCADE;

ALTER TABLE `Rating`
  ADD CONSTRAINT R_S_writer_id
  FOREIGN KEY buyer(writer)
  REFERENCES Sale(buyer)
  ON DELETE CASCADE;

ALTER TABLE `Rating`
  ADD CONSTRAINT R_S_product_id
  FOREIGN KEY product_id(product_id)
  REFERENCES Sale(product_id)
  ON DELETE CASCADE;

ALTER TABLE `Verified_User`
  ADD CONSTRAINT VU_U_user_id
  FOREIGN KEY user_id(user_id)
  REFERENCES User(user_id)
  ON DELETE CASCADE;


--
-- INSERTING VALUES INTO TABLES
--

INSERT INTO User VALUES ('5432', 'JSmith14', 'abcd1234', 'jsmith@email.com');
INSERT INTO User VALUES ('8692', 'SallMal', 'catpassword', 'sally@email.com');
INSERT INTO User VALUES ('4217', 'YourMom', 'hellogoodbye', 'smother@email.com');
INSERT INTO User VALUES ('7634', 'Catrina', 'passwrd', 'catrina@email.com');
INSERT INTO User VALUES ('1414', 'Yolanda42', 'thisisapassword', 'yola@email.com');
INSERT INTO User VALUES ('3232', 'Kayla2', 'kjdsfhjbhf', 'kayla@email.com');


INSERT INTO Item_Uploaded VALUES('1', '2018-11-14', NULL, '0');
INSERT INTO Item_Uploaded VALUES('2', '2018-11-01', NULL, '0');
INSERT INTO Item_Uploaded VALUES('13', '2018-10-31', NULL, '0');
INSERT INTO Item_Uploaded VALUES('87', '2018-09-11', NULL, '0');
INSERT INTO Item_Uploaded VALUES('192', '2018-11-10', NULL, '0');
INSERT INTO Item_Uploaded VALUES('134', '2018-11-02', NULL, '0');
INSERT INTO Item_Uploaded VALUES('93', '2018-11-13', NULL, '0');


INSERT INTO Product VALUES ('1', '5432', 'Pumpkin', 'An orange gourd used for cooking or decoration', '25.0');
INSERT INTO Product VALUES ('2', '5432', 'Gallon of Windex', 'A gallon of a blue cleaning agent used for getting a streak-free shine on glass', '32.0');
INSERT INTO Product VALUES ('13', '8692', 'Cat Hair', 'The fur of a feline, of the tabby variety', '18.0');
INSERT INTO Product VALUES ('87', '8692', 'iPhone X', 'A perfectly working version of the newest iPhone model', '347.0');
INSERT INTO Product VALUES ('192', '1414', 'Elephant Tusk', 'A pure ivory tusk of an elephant', '1200.0');
INSERT INTO Product VALUES ('134', '3232', 'Extension Cord', 'A cord used to reach from an electrical outlet to another device', '10.0');
INSERT INTO Product VALUES ('93', '7634', 'Chocolate Chip Cookies', 'Homemade chocolate chip cookies from scratch', '83.0');

INSERT INTO Sale VALUES('1', '1', '5432', '7634', '2', '25.0','50.0', '2018-11-24');
UPDATE Item_Uploaded SET sales=sales+2 WHERE product_id=1; 
INSERT INTO Sale VALUES('2', '1', '5432', '8692', '1', '25.0','25.0', '2018-11-26');
UPDATE Item_Uploaded SET sales=sales+1 WHERE product_id=1;
UPDATE Item_Uploaded SET date_removed='2019-11-30' WHERE product_id=1;
INSERT INTO Sale VALUES('3', '93', '7634', '3232', '1', '83.0','83.0', '2018-10-01');
UPDATE Item_Uploaded SET sales=sales+1 WHERE product_id=93;
INSERT INTO Sale VALUES('4', '2', '5432', '1414', '5', '32','160', '2018-09-18');
UPDATE Item_Uploaded SET sales=sales+5 WHERE product_id=2;
INSERT INTO Sale VALUES('5', '13', '8692', '7634', '1', '18.0','18.0', '2018-01-20');
UPDATE Item_Uploaded SET sales=sales+1 WHERE product_id=13;
INSERT INTO Sale VALUES('6', '87', '8692', '1414', '1', '347','347', '2018-09-09');
UPDATE Item_Uploaded SET sales=sales+1 WHERE product_id=192;
INSERT INTO Sale VALUES('7', '192', '1414', '4217', '1', '1200.0','1200.0', '2018-07-24');
UPDATE Item_Uploaded SET sales=sales+2 WHERE product_id=134;
INSERT INTO Sale VALUES('8', '134', '3232', '7634', '2', '10.0','20.0', '2018-12-24');
UPDATE Item_Uploaded SET sales=sales+1 WHERE product_id=93;
INSERT INTO Sale VALUES('9', '93', '7634', '5432', '1', '83.0','83.0', '2018-02-24');

INSERT INTO Rating VALUES('1', '87', '8692', '1414', 'HUGE SCAM!', 'The description of this item said that the iPhone was in perfect working condition. This is a big lie, as the iPhone wont even turn on!', 'It mustve broken in the shipping process. No refunds', '1');
INSERT INTO Rating VALUES('2', '1', '5432', '7634', 'Perfect Pumpkins', 'I love these pumpkins, very orange.', 'Glad you enjoyed!', '2');
INSERT INTO Rating VALUES('3', '93', '7634', '5432', 'Deliciouso', 'These cookies tasted like my grandmas.', null, '1');

INSERT INTO Verified_User VALUES('5432','2018-11-26','jsmith@email.com','1432', '1', '2019-01-26');



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
