-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 26, 2015 at 07:48 PM
-- Server version: 5.5.41-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `RNR`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(80) NOT NULL,
  `picture` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `title`, `picture`) VALUES
(8, 'Home', 'house.jpeg'),
(10, 'cooking', 'cooking.jpg'),
(11, 'wedding', 'wedding.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `emoticons`
--

CREATE TABLE IF NOT EXISTS `emoticons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chars` varchar(10) NOT NULL,
  `image` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `emoticons`
--

INSERT INTO `emoticons` (`id`, `chars`, `image`) VALUES
(1, '=D', 'happy.png'),
(2, ':(', 'sad.gif'),
(4, '^_^', 'satisfied.png'),
(5, ':)', 'smile.gif'),
(6, ':-h', 'wave.gif'),
(8, 'X(', 'angry.gif'),
(11, ';)', 'battingeyelashes.gif'),
(12, ':*', 'kis.gif'),
(13, '~x(', 'atwits''end.gif'),
(14, 'a:', 'angle.gif');

-- --------------------------------------------------------

--
-- Table structure for table `replay`
--

CREATE TABLE IF NOT EXISTS `replay` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `threadId` int(10) NOT NULL,
  `userId` int(10) NOT NULL,
  `body` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=112 ;

--
-- Dumping data for table `replay`
--

INSERT INTO `replay` (`id`, `threadId`, `userId`, `body`) VALUES
(104, 26, 11, 'Wooooooooooow ;)'),
(105, 26, 8, 'nice room'),
(107, 26, 8, '=D'),
(108, 26, 12, 'nice :)'),
(109, 27, 12, 'Nice  ^_^'),
(110, 26, 10, ':*'),
(111, 28, 9, 'what is the most favourite dish to be cooked with tomato :)');

-- --------------------------------------------------------

--
-- Table structure for table `thread`
--

CREATE TABLE IF NOT EXISTS `thread` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `toCategoryId` int(10) NOT NULL,
  `userId` int(10) NOT NULL,
  `title` varchar(30) NOT NULL,
  `body` varchar(255) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `lock` enum('on','off') NOT NULL DEFAULT 'off',
  `stick` enum('on','off') NOT NULL DEFAULT 'off',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `thread`
--

INSERT INTO `thread` (`id`, `toCategoryId`, `userId`, `title`, `body`, `picture`, `lock`, `stick`) VALUES
(26, 22, 8, 'kids bed room', 'consists of two beds', 'kidsroom.jpeg', 'off', 'on'),
(27, 22, 8, 'Bed room', 'This bedroom seems darker but, at the same time, itâ€™s also more intimate. The colors remain within an earthy palette and the wooden floors add warmth to the dÃ©cor. The lighting is particularly beautiful.', 'bedroom.jpg', 'off', 'off'),
(28, 25, 12, 'Tomato', 'For an easy, economical dish thatâ€™s heart-healthy â€“ low in sodium and saturated fat â€“ and packed with flavor, try baked tomato tilapia.', 'tomato.jpg', 'off', 'on'),
(29, 25, 12, 'Salade', 'Very healthy and not expensive dish', 'salade.jpg', 'off', 'off'),
(30, 26, 12, 'Mango', 'â€œThe king of the fruits," mango fruit is one of the most popular, nutritionally rich fruits with unique flavor, fragrance, taste, and heath promoting qualities, making it numero-uno among new functional foods, often labeled as â€œsuper fruits."', 'mango.jpg', 'off', 'on'),
(31, 26, 12, 'Banana ', 'Bananas are the most popular fruit in the world. The banana is, in fact, not a tree but a high herb that grows up to 15 metres. It is believed that there are almost 1000 varieties of bananas in the world, subdivided in 50 groups. The most commonly known b', 'banana.jpg', 'off', 'off'),
(32, 27, 12, 'Chocolate Cake', 'Chocolate Cake is my favorite cake  ', 'cake.jpg', 'off', 'off');

-- --------------------------------------------------------

--
-- Table structure for table `toCategory`
--

CREATE TABLE IF NOT EXISTS `toCategory` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `toCategoryId` int(10) NOT NULL,
  `title` varchar(30) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `lock` enum('on','off') NOT NULL DEFAULT 'off',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

--
-- Dumping data for table `toCategory`
--

INSERT INTO `toCategory` (`id`, `toCategoryId`, `title`, `picture`, `lock`) VALUES
(22, 8, 'Bed rooms', 'bedrooms.jpg', 'off'),
(23, 8, 'living rooms', 'home.jpg', 'off'),
(24, 8, 'kitchens', 'kitchen.jpeg', 'off'),
(25, 10, 'vegetables', 'cooking.jpg', 'off'),
(26, 10, 'fruits', 'fruits.jpeg', 'off'),
(27, 10, 'Tarte', 'tarte.jpg', 'off'),
(28, 11, 'Dresses', '10153808_562537987223672_64867477144790845_n.jpg', 'off'),
(29, 11, 'Rings', 'rings.jpeg', 'off');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userName` varchar(30) NOT NULL,
  `email` varchar(80) NOT NULL,
  `password` varchar(80) NOT NULL,
  `gender` enum('male','female') DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `profilePicture` varchar(100) NOT NULL DEFAULT 'noImage.gif	',
  `signature` varchar(100) DEFAULT NULL,
  `type` enum('admin','regular') DEFAULT 'regular',
  `ban` enum('on','off') DEFAULT 'off',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userName` (`userName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `userName`, `email`, `password`, `gender`, `country`, `profilePicture`, `signature`, `type`, `ban`) VALUES
(8, 'Rana', 'ranarizk52@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'female', 'Canada', '2.jpg', 'one.jpg', 'admin', 'off'),
(9, 'Riham', 'rihammohamed80@yahoo.com', 'e10adc3949ba59abbe56e057f20f883e', 'female', 'Kuwait', 'reham.jpg', 'two.jpg', 'regular', 'off'),
(10, 'Nehal', 'nehal.mohammed.1192@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'female', 'Egypt', '4.jpg', 'three.jpg', 'regular', 'off'),
(11, 'Ahmed Rizk', 'ahmed@yahoo.com', 'e10adc3949ba59abbe56e057f20f883e', 'male', 'Egypt', '3.jpg', 'four.jpg', 'regular', 'off'),
(12, 'Nahla', 'eng.nahla.mohammed@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'female', 'Egypt', '7gab.jpg', 'five.jpg', 'regular', 'off');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
