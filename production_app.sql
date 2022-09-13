-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 13, 2022 at 03:16 AM
-- Server version: 8.0.29
-- PHP Version: 8.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `production_api_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_bookings`
--

CREATE TABLE `app_bookings` (
  `booking_id` int NOT NULL,
  `booking_ref_no` varchar(17) DEFAULT NULL,
  `booking_type` varchar(50) NOT NULL,
  `booking_item` int NOT NULL,
  `booking_subitem` text,
  `booking_extras` varchar(255) DEFAULT NULL,
  `booking_date` bigint NOT NULL,
  `booking_expiry` bigint NOT NULL,
  `booking_user` int NOT NULL,
  `booking_status` varchar(10) NOT NULL,
  `booking_payment_type` varchar(100) DEFAULT NULL,
  `booking_additional_notes` text,
  `booking_total` double NOT NULL,
  `booking_amount_paid` double NOT NULL DEFAULT '0',
  `booking_remaining` double NOT NULL,
  `booking_checkin` date DEFAULT NULL,
  `booking_checkout` date DEFAULT NULL,
  `booking_nights` tinyint DEFAULT NULL,
  `booking_adults` tinyint DEFAULT '1',
  `booking_child` tinyint DEFAULT '0',
  `booking_deposit` double NOT NULL,
  `booking_tax` double NOT NULL,
  `booking_paymethod_tax` double NOT NULL,
  `booking_extras_total_fee` double DEFAULT '0',
  `booking_extra_beds` int DEFAULT '0',
  `booking_extra_beds_charges` double DEFAULT '0',
  `booking_curr_code` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `booking_curr_symbol` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `booking_coupon` varchar(10) DEFAULT NULL,
  `booking_coupon_rate` double DEFAULT NULL,
  `booking_payment_date` bigint DEFAULT NULL,
  `booking_cancellation_request` tinyint NOT NULL DEFAULT '0',
  `booking_txn_id` varchar(255) DEFAULT NULL,
  `booking_show` tinyint DEFAULT '1',
  `booking_guest_info` text,
  `book_token` text,
  `booking_logs` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `app_modules`
--

CREATE TABLE `app_modules` (
  `id` bigint NOT NULL,
  `parent_id` enum('hotels','flights','tours','cars','visa','reviews','extra','rental','cruise') NOT NULL,
  `name` varchar(150) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `settings` text NOT NULL,
  `order` varchar(300) NOT NULL,
  `c1` varchar(225) NOT NULL,
  `c2` varchar(225) NOT NULL,
  `c3` varchar(225) NOT NULL,
  `c4` varchar(225) NOT NULL,
  `c5` varchar(225) NOT NULL,
  `c6` varchar(225) NOT NULL,
  `c7` varchar(225) NOT NULL,
  `c8` varchar(225) NOT NULL,
  `c9` varchar(225) NOT NULL,
  `c10` varchar(225) NOT NULL,
  `b2c_markup` int NOT NULL DEFAULT '0',
  `b2b_markup` int NOT NULL DEFAULT '0',
  `b2e_markup` int NOT NULL DEFAULT '0',
  `developer_mode` varchar(225) NOT NULL,
  `desposit` int NOT NULL DEFAULT '0',
  `tax` int NOT NULL DEFAULT '0',
  `servicefee` int NOT NULL DEFAULT '0',
  `deposit_type` varchar(225) NOT NULL DEFAULT '0',
  `tax_type` varchar(225) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `module_currency` varchar(225) DEFAULT NULL,
  `payment_mode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_modules`
--

INSERT INTO `app_modules` (`id`, `parent_id`, `name`, `is_active`, `settings`, `order`, `c1`, `c2`, `c3`, `c4`, `c5`, `c6`, `c7`, `c8`, `c9`, `c10`, `b2c_markup`, `b2b_markup`, `b2e_markup`, `developer_mode`, `desposit`, `tax`, `servicefee`, `deposit_type`, `tax_type`, `color`, `module_currency`, `payment_mode`) VALUES
(1, 'extra', 'Blog', 1, '{\"name\":\"Blog\",\"label\":\"Blog\",\"slug\":\"blog\",\"frontend\":{\"label\":\"Blog\",\"slug\":\"blog\",\"icon\":\"blog.png\"},\"description\":\"\",\"active\":1,\"order\":\"26\",\"menus\":{\"icon\":\"<span class=\'material-icons\'>auto_stories<\\/span>\",\"admin\":[{\"label\":\"Posts\",\"link\":\"admin\\/blog\"},{\"label\":\"Blog Categories\",\"link\":\"admin\\/blog\\/category\"},{\"label\":\"Blog Settings\",\"link\":\"admin\\/blog\\/settings\"}],\"supplier\":[]}}', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', 0, 0, 0, '', NULL, NULL, 'USD', NULL),
(2, 'cars', 'Cars', 0, '{\"name\":\"Cars\",\"label\":\"Cars\",\"slug\":\"cars\",\"frontend\":{\"label\":\"Cars\",\"slug\":\"cars\",\"icon\":\"la la-car\"},\"description\":\"\",\"active\":0,\"order\":\"1\",\"menus\":{\"icon\":\"fa fa-car\",\"admin\":[{\"label\":\"Cars\",\"link\":\"admin\\/cars\"},{\"label\":\"Extras\",\"link\":\"admin\\/cars\\/extras\"},{\"label\":\"Cars Settings\",\"link\":\"admin\\/cars\\/settings\"}],\"supplier\":[{\"label\":\"Cars\",\"link\":\"supplier\\/cars\"},{\"label\":\"Extras\",\"link\":\"supplier\\/cars\\/extras\"}]}}', '5', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', 0, 0, 0, '', NULL, NULL, 'USD', NULL),
(4, 'extra', 'Coupons', 0, '{\"name\":\"Coupons\",\"label\":\"Coupons\",\"slug\":\"\",\"frontend\":[],\"description\":\"\",\"active\":0,\"order\":\"29\",\"menus\":{\"icon\":\"\",\"admin\":[],\"supplier\":[]}}', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', 0, 0, 0, '', NULL, NULL, 'USD', NULL),
(6, 'flights', 'Flights', 1, '{\"name\":\"Flights\",\"label\":\"Flights\",\"slug\":\"flights\",\"test\":\"false\",\"frontend\":{\"label\":\"Flights\",\"slug\":\"flights\",\"icon\":\"la la-plane\"},\"description\":\"\",\"active\":1,\"order\":\"1\",\"menus\":{\"icon\":\"fa fa-plane\",\"admin\":[{\"label\":\"Routes\",\"link\":\"admin\\/flights\\/routes\"},{\"label\":\"Airports\",\"link\":\"admin\\/flights\\/airports\"},{\"label\":\"Airlines\",\"link\":\"admin\\/flights\\/airlines\"},{\"label\":\"Countries\",\"link\":\"admin\\/flights\\/countries\"},{\"label\":\"Featured Flights\",\"link\":\"admin\\/flights\"},{\"label\":\"Settings\",\"link\":\"admin\\/settings\\/modules\\/module_setting\\/flights\"}],\"supplier\":[]},\"\":null}', '2', '', '', '', '', '', '', '', '', '', '', 10, 5, 2, '0', 100, 10, 5, '', NULL, '#000000', 'USD', NULL),
(8, 'hotels', 'Hotels', 1, '{\"name\":\"Hotels\",\"label\":\"Hotels\",\"slug\":\"hotels\",\"frontend\":{\"label\":\"Hotels\",\"slug\":\"hotels\",\"icon\":\"la la-building-o\"},\"description\":\"\",\"active\":1,\"order\":\"1\",\"menus\":{\"icon\":\"fa fa-building-o\",\"admin\":[{\"label\":\"Hotels\",\"link\":\"admin\\/hotels\"},{\"label\":\"Rooms\",\"link\":\"admin\\/hotels\\/rooms\"},{\"label\":\"Extras\",\"link\":\"admin\\/hotels\\/extras\"},{\"label\":\"Reviews\",\"link\":\"admin\\/hotels\\/reviews\"},{\"label\":\"Settings\",\"link\":\"admin\\/hotels\\/settings\"}],\"supplier\":[{\"label\":\"Manage Hotels\",\"link\":\"supplier\\/hotels\"},{\"label\":\"Manage Rooms\",\"link\":\"supplier\\/hotels\\/rooms\"},{\"label\":\"Add Room\",\"link\":\"supplier\\/hotels\\/rooms\\/add\"},{\"label\":\"Extras\",\"link\":\"supplier\\/hotels\\/extras\"}]},\"ordering\":\"645\"}', '1', '', '', '', '', '', '', '', '', '', '', 10, 5, 2, '', 100, 2, 10, 'percentage', 'percentage', NULL, 'USD', NULL),
(12, 'extra', 'Locations', 1, '{\"name\":\"Locations\",\"label\":\"Locations\",\"slug\":\"\",\"frontend\":[],\"description\":\"\",\"active\":1,\"order\":\"28\",\"menus\":{\"icon\":\"<span class=\'material-icons\'>map<\\/span>\",\"admin\":[{\"label\":\"Locations \",\"link\":\"admin\\/locations\"}],\"supplier\":[{\"label\":\"Locations\",\"link\":\"supplier\\/locations\"}]}}', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', 0, 0, 0, '', NULL, NULL, 'USD', NULL),
(13, 'extra', 'Newsletter', 1, '{\"name\":\"Newsletter\",\"label\":\"Newsletter\",\"slug\":\"\",\"frontend\":[],\"description\":\"\",\"active\":1,\"order\":\"31\",\"menus\":{\"icon\":\"\",\"admin\":[],\"supplier\":[]}}', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', 0, 0, 0, '', NULL, NULL, 'USD', NULL),
(14, 'extra', 'Offers', 1, '{\"name\":\"Offers\",\"label\":\"Offers\",\"slug\":\"offers\",\"frontend\":{\"label\":\"Offers\",\"slug\":\"offers\",\"icon\":\"offers.png\"},\"description\":\"\",\"active\":1,\"order\":\"25\",\"menus\":{\"icon\":\"\",\"admin\":[],\"supplier\":[]}}', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', 0, 0, 0, '', NULL, NULL, 'USD', NULL),
(15, 'extra', 'Reviews', 0, '{\"name\":\"Reviews\",\"label\":\"Reviews\",\"slug\":\"\",\"frontend\":[],\"description\":\"\",\"active\":0,\"order\":\"29\",\"menus\":{\"icon\":\"\",\"admin\":[],\"supplier\":[]}}', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', 0, 0, 0, '', NULL, NULL, 'USD', NULL),
(16, 'tours', 'Tours', 1, '{\"name\":\"Tours\",\"label\":\"Tours\",\"slug\":\"tours\",\"frontend\":{\"label\":\"Tours\",\"slug\":\"tours\",\"icon\":\"la la-suitcase\"},\"description\":\"\",\"active\":1,\"order\":\"3\",\"menus\":{\"icon\":\"fa fa-suitcase\",\"admin\":[{\"label\":\"Tours\",\"link\":\"admin\\/tours\"},{\"label\":\"Extras\",\"link\":\"admin\\/tours\\/extras\"},{\"label\":\"Reviews\",\"link\":\"admin\\/tours\\/reviews\"},{\"label\":\"Settings\",\"link\":\"admin\\/tours\\/settings\"}],\"supplier\":[{\"label\":\"Manage Tours\",\"link\":\"supplier\\/tours\"},{\"label\":\"Extras\",\"link\":\"supplier\\/tours\\/extras\"}]}}', '3', '', '', '', '', '', '', '', '', '', '', 10, 5, 3, '', 100, 10, 10, 'percentage', 'fixed', NULL, 'USD', NULL),
(26, 'tours', 'Viator', 1, '{\"name\":\"Viator\",\"label\":\"Viator\",\"slug\":\"viator\",\"frontend\":{\"label\":\"Viator\",\"slug\":\"viator\",\"icon\":\"flight.png\"},\"description\":\"\",\"active\":1,\"order\":\"21\",\"menus\":{\"icon\":\"fa fa-tag\",\"admin\":[{\"label\":\"viator Settings\",\"link\":\"admin\\/viator\\/settings\"}],\"supplier\":[]},\"settings\":{\"api_environment\":\"production\",\"api_endpoint\":\"https:\\/\\/viatorapi.viator.com\\/service\\/\",\"apiKey\":\"380374363657375804\"}}', '3', '28fdcf77-82bf-4389-9295-6afdd1828002', '', '', '', '', '', '', '', '', '', 10, 5, 3, '0', 100, 0, 0, '', NULL, '#176a6e', 'USD', '1'),
(39, 'rental', 'Rentals', 0, '{\"name\":\"Rentals\",\"label\":\"Rentals\",\"slug\":\"rentals\",\"frontend\":{\"label\":\"Rentals\",\"slug\":\"rentals\",\"icon\":\"tour.png\"},\"description\":\"\",\"active\":0,\"order\":\"20\",\"menus\":{\"icon\":\"fa fa-suitcase\",\"admin\":[{\"label\":\"Rentals\",\"link\":\"admin\\/rentals\"},{\"label\":\"Extras\",\"link\":\"admin\\/rentals\\/extras\"},{\"label\":\"Reviews\",\"link\":\"admin\\/rentals\\/reviews\"},{\"label\":\"Settings\",\"link\":\"admin\\/rentals\\/settings\"}],\"supplier\":[{\"label\":\"Manage Tours\",\"link\":\"supplier\\/tours\"},{\"label\":\"Extras\",\"link\":\"supplier\\/tours\\/extras\"}]}}', '1', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', 0, 0, 0, '', NULL, NULL, 'USD', NULL),
(40, 'cruise', 'Boats', 0, '{\"name\":\"Boats\",\"label\":\"Boats\",\"slug\":\"boats\",\"frontend\":{\"label\":\"Boats\",\"slug\":\"boats\",\"icon\":\"la la-suitcase\"},\"description\":\"\",\"active\":0,\"order\":\"19\",\"menus\":{\"icon\":\"fa fa-suitcase\",\"admin\":[{\"label\":\"Boats\",\"link\":\"admin\\/boats\"},{\"label\":\"Add New\",\"link\":\"admin\\/boats\\/add\"},{\"label\":\"Extras\",\"link\":\"admin\\/boats\\/extras\"},{\"label\":\"Reviews\",\"link\":\"admin\\/boats\\/reviews\"},{\"label\":\"Settings\",\"link\":\"admin\\/boats\\/settings\"}],\"supplier\":[{\"label\":\"Manage Rentals\",\"link\":\"supplier\\/rentals\"},{\"label\":\"Extras\",\"link\":\"supplier\\/rentals\\/extras\"}]}}', '2', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', 0, 0, 0, '', NULL, NULL, 'USD', NULL),
(47, 'hotels', 'Rezlives', 0, '{\"name\":\"Rezlives\",\"label\":\"Rezlives\",\"slug\":\"rezlives\",\"frontend\":{\"label\":\"Hotels\",\"slug\":\"properties\",\"icon\":\"hotel.png\"},\"description\":\"\",\"active\":0,\"order\":\"2\",\"menus\":{\"icon\":\"fa fa-building\",\"admin\":[{\"label\":\"Bookings\",\"link\":\"admin\\/rezlives\\/bookings\"},{\"label\":\"Settings\",\"link\":\"admin\\/settings\\/modules\\/module_setting\\/rezlives\"}],\"supplier\":[]}}', '1', 'CD32251', 'reims.qviclub', 'Selangor@2021', '', '', '', '', '', '', '', 10, 5, 2, '0', 5, 3, 4, '', NULL, '#f9af4c', 'USD', '1'),
(49, 'visa', 'Ivisa', 0, '{\"name\":\"ivisa\",\"label\":\"Visa\",\"slug\":\"ivisa\",\"frontend\":{\"label\":\"Visa\",\"slug\":\"ivisa\",\"icon\":\"la la-tag\"},\"description\":\"\",\"active\":0,\"order\":\"1\",\"menus\":{\"icon\":\"fa fa-tag\",\"admin\":[{\"label\":\"Settings\",\"link\":\"admin\\/ivisa\\/settings\"},{\"label\":\"Bookings\",\"link\":\"admin\\/ivisa\\/booking\"}],\"supplier\":[]}}', '6', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', 0, 0, 0, '', NULL, NULL, 'USD', NULL),
(54, 'flights', 'Kiwi', 0, '{\"name\":\"Kiwi\",\"label\":\"Kiwi\",\"slug\":\"kiwi\",\"test\":\"false\",\"frontend\":{\"label\":\"Flights\",\"slug\":\"flights\",\"icon\":\"la la-plane\"},\"description\":\"\",\"active\":0,\"order\":\"3\",\"menus\":{\"icon\":\"fa fa-plane\",\"admin\":[{\"label\":\"Settings\",\"link\":\"admin\\/settings\\/modules\\/module_setting\\/kiwi\\/\"},{\"label\":\"Bookings\",\"link\":\"admin\\/kiwi\\/bookings\"}],\"supplier\":[]},\"\":null}', '2', 'booknowphptravels', 'hM_ulx_KEwojzGyTCrKeSJuWMUVJWIA9', '', '', '', '', '', '', '', '', 10, 10, 10, '1', 10, 10, 10, '', NULL, '#00a991', 'USD', '1'),
(57, 'flights', 'Amadeus', 1, '{\"name\":\"Amadeus\",\"label\":\"Amadeus\",\"slug\":\"amadeus\",\"test\":\"false\",\"frontend\":{\"label\":\"Flights\",\"slug\":\"flights\",\"icon\":\"la la-plane\"},\"description\":\"\",\"active\":1,\"order\":\"2\",\"menus\":{\"icon\":\"fa fa-plane\",\"admin\":[{\"label\":\"Settings\",\"link\":\"admin\\/settings\\/modules\\/module_setting\\/amadeus\\/\"},{\"label\":\"Bookings\",\"link\":\"admin\\/amadeus\\/bookings\"}],\"supplier\":[]},\"\":null}', '2', 'client_credentials', '96SUxWJF6Jum216jiJjWWxbCfkFIB3wG', 'KN1B1ces6kppK5ET', '', '', '', '', '', '', '', 10, 5, 3, '1', 100, 5, 0, '', NULL, '#005eb8', 'USD', '1'),
(58, 'flights', 'Aerticket', 0, '{\"name\":\"Aerticket\",\"label\":\"Aerticket\",\"slug\":\"aerticket\",\"test\":\"false\",\"frontend\":{\"label\":\"Flights\",\"slug\":\"flights\",\"icon\":\"la la-plane\"},\"description\":\"\",\"active\":0,\"order\":\"4\",\"menus\":{\"icon\":\"fa fa-plane\",\"admin\":[{\"label\":\"Settings\",\"link\":\"admin\\/settings\\/modules\\/module_setting\\/aerticket\\/\"},{\"label\":\"Bookings\",\"link\":\"admin\\/aerticket\\/bookings\"}],\"supplier\":[]},\"\":null}', '2', '930661', '^RslASmVBXvSV#tr', '', '', '', '', '', '', '', '', 10, 5, 3, '1', 100, 0, 0, '0', NULL, '#2258a6', 'USD', '1'),
(59, 'hotels', 'Hotelston', 0, '{\"name\":\"Hotelston\",\"label\":\"Hotelston\",\"slug\":\"hotelston\",\"frontend\":{\"label\":\"Hotels\",\"slug\":\"properties\",\"icon\":\"hotel.png\"},\"description\":\"\",\"active\":0,\"order\":\"7\",\"menus\":{\"icon\":\"fa fa-building\",\"admin\":[{\"label\":\"Bookings\",\"link\":\"admin\\/hotelston\\/bookings\"},{\"label\":\"Settings\",\"link\":\"admin\\/hotelston\\/settings\"}],\"supplier\":[]}}', '2', 'info@phptravels.com', 'Allah4ever44', '', '', '', '', '', '', '', '', 0, 0, 0, '0', 0, 0, 0, '0', NULL, '#a7d701', 'EUR', '1'),
(60, 'hotels', 'Agoda', 0, '{\"name\":\"Agoda\",\"label\":\"Agoda\",\"slug\":\"agoda\",\"frontend\":{\"label\":\"Hotels\",\"slug\":\"properties\",\"icon\":\"hotel.png\"},\"description\":\"\",\"active\":0,\"order\":\"7\",\"menus\":{\"icon\":\"fa fa-building\",\"admin\":[{\"label\":\"Bookings\",\"link\":\"admin\\/agoda\\/bookings\"},{\"label\":\"Settings\",\"link\":\"admin\\/agoda\\/settings\"}],\"supplier\":[]}}', '2', 'http://affiliateapi7643.agoda.com/affiliateservice/lt_v1', '1743607', 'A34C14A7-4BC3-4D0D-BD43-36CA7A4BB2B9', '', '', '', '', '', '', '', 0, 0, 0, '1', 0, 0, 0, '0', NULL, '#ff0000', 'USD', '1'),
(61, 'flights', 'Duffel', 0, '{\"name\":\"Duffel\",\"label\":\"Duffel\",\"slug\":\"duffel\",\"test\":\"false\",\"frontend\":{\"label\":\"Flights\",\"slug\":\"flights\",\"icon\":\"la la-plane\"},\"description\":\"\",\"active\":0,\"order\":\"2\",\"menus\":{\"icon\":\"fa fa-plane\",\"admin\":[{\"label\":\"Settings\",\"link\":\"admin\\/settings\\/modules\\/module_setting\\/duffel\\/\"},{\"label\":\"Bookings\",\"link\":\"admin\\/duffel\\/bookings\"}],\"supplier\":[]},\"\":null}', '2', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '0', 0, 0, 0, '0', NULL, '#e14747', 'USD', '1'),
(62, 'flights', 'Hiholiday', 0, '{\"name\":\"Hiholiday\",\"label\":\"Hiholiday\",\"slug\":\"hiholiday\",\"test\":\"false\",\"frontend\":{\"label\":\"Flights\",\"slug\":\"flights\",\"icon\":\"la la-plane\"},\"description\":\"\",\"active\":0,\"order\":\"2\",\"menus\":{\"icon\":\"fa fa-plane\",\"admin\":[{\"label\":\"Settings\",\"link\":\"admin\\/settings\\/modules\\/module_setting\\/hiholiday\\/\"},{\"label\":\"Bookings\",\"link\":\"admin\\/hiholiday\\/bookings\"}],\"supplier\":[]},\"\":null}', '2', '2495722d-8796-43ad-8f0e-90fd088c20c7', '09120335360', '5126', '', '', '', '', '', '', '', 0, 0, 0, '0', 0, 0, 0, '0', NULL, '#000000', 'IRR', '1'),
(63, 'flights', 'Iata', 0, '{\"name\":\"iata\",\"label\":\"iata\",\"slug\":\"iata\",\"test\":\"false\",\"frontend\":{\"label\":\"Flights\",\"slug\":\"flights\",\"icon\":\"la la-plane\"},\"description\":\"\",\"active\":0,\"order\":\"2\",\"menus\":{\"icon\":\"fa fa-plane\",\"admin\":[{\"label\":\"Settings\",\"link\":\"admin/settings/modules/module_setting\\/iata\\/\"},{\"label\":\"Bookings\",\"link\":\"admin\\/iata\\/bookings\"}],\"supplier\":[]},\"\":null}', '2', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '', 0, 0, 0, '0', NULL, NULL, NULL, NULL),
(64, 'tours', 'Tiqets', 1, '{\"name\":\"Tiqets\",\"label\":\"Tiqets\",\"slug\":\"Tiqets\",\"test\":\"false\",\"frontend\":{\"label\":\"Tiqets\",\"slug\":\"Tiqets\",\"icon\":\"la la-briefcase\"},\"description\":\"\",\"active\":1,\"order\":\"2\",\"menus\":{\"icon\":\"fa fa-briefcase\",\"admin\":[{\"label\":\"Settings\",\"link\":\"admin\\/settings\\/modules\\/module_setting\\/Tiqets\\/\"}],\"supplier\":[]},\"\":null}', '3', 'fZdFl0JKlfgz5j5vNXaMxAHlLJ2ZzJVA', '', '', '', '', '', '', '', '', '', 0, 0, 0, '1', 0, 0, 0, '0', NULL, '#48c2c5', 'USD', '0');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `datetime` datetime NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `user_id`, `type`, `datetime`, `description`) VALUES
(5, 1, 'login', '2022-09-12 04:09:27', '{\"id\":1,\"first_name\":\"Supers\",\"last_name\":\"Admins\",\"email\":\"admin@phptravels.com\",\"password\":\"61152c80d1514e22fba66002597d0104\",\"status\":\"0\",\"country_code\":\"PK\",\"type\":\"admin\",\"currency\":\"1\",\"address1\":\"address 1\",\"address2\":\"address 2\",\"company_name\":\"Ag'),
(6, 1, 'login', '2022-09-12 04:25:02', '{\"id\":1,\"first_name\":\"Supers\",\"last_name\":\"Admins\",\"email\":\"admin@phptravels.com\",\"password\":\"61152c80d1514e22fba66002597d0104\",\"status\":\"0\",\"country_code\":\"PK\",\"type\":\"admin\",\"currency\":\"1\",\"address1\":\"address 1\",\"address2\":\"address 2\",\"company_name\":\"Ag'),
(7, 1, 'login', '2022-09-12 04:25:08', '{\"id\":1,\"first_name\":\"Supers\",\"last_name\":\"Admins\",\"email\":\"admin@phptravels.com\",\"password\":\"61152c80d1514e22fba66002597d0104\",\"status\":\"0\",\"country_code\":\"PK\",\"type\":\"admin\",\"currency\":\"1\",\"address1\":\"address 1\",\"address2\":\"address 2\",\"company_name\":\"Ag'),
(8, 1, 'login', '2022-09-12 04:25:17', '{\"id\":1,\"first_name\":\"Supers\",\"last_name\":\"Admins\",\"email\":\"admin@phptravels.com\",\"password\":\"61152c80d1514e22fba66002597d0104\",\"status\":\"0\",\"country_code\":\"PK\",\"type\":\"admin\",\"currency\":\"1\",\"address1\":\"address 1\",\"address2\":\"address 2\",\"company_name\":\"Ag'),
(9, 1, 'login', '2022-09-12 04:27:15', '{\"id\":1,\"first_name\":\"Supers\",\"last_name\":\"Admins\",\"email\":\"admin@phptravels.com\",\"password\":\"61152c80d1514e22fba66002597d0104\",\"status\":\"0\",\"country_code\":\"PK\",\"type\":\"admin\",\"currency\":\"1\",\"address1\":\"address 1\",\"address2\":\"address 2\",\"company_name\":\"Ag'),
(10, 1, 'login', '2022-09-12 04:55:31', '{\"id\":1,\"first_name\":\"Supers\",\"last_name\":\"Admins\",\"email\":\"admin@phptravels.com\",\"password\":\"61152c80d1514e22fba66002597d0104\",\"status\":\"0\",\"country_code\":\"PK\",\"type\":\"admin\",\"currency\":\"1\",\"address1\":\"address 1\",\"address2\":\"address 2\",\"company_name\":\"Ag'),
(11, 1, 'login', '2022-09-12 05:05:39', '{\"id\":1,\"first_name\":\"Supers\",\"last_name\":\"Admins\",\"email\":\"admin@phptravels.com\",\"password\":\"61152c80d1514e22fba66002597d0104\",\"status\":\"0\",\"country_code\":\"PK\",\"type\":\"admin\",\"currency\":\"1\",\"address1\":\"address 1\",\"address2\":\"address 2\",\"company_name\":\"Ag'),
(12, 1, 'login', '2022-09-12 05:07:10', '{\"id\":1,\"first_name\":\"Supers\",\"last_name\":\"Admins\",\"email\":\"admin@phptravels.com\",\"password\":\"61152c80d1514e22fba66002597d0104\",\"status\":\"0\",\"country_code\":\"PK\",\"type\":\"admin\",\"currency\":\"1\",\"address1\":\"address 1\",\"address2\":\"address 2\",\"company_name\":\"Ag'),
(13, 1, 'login', '2022-09-12 05:07:55', '{\"id\":1,\"first_name\":\"Supers\",\"last_name\":\"Admins\",\"email\":\"admin@phptravels.com\",\"password\":\"61152c80d1514e22fba66002597d0104\",\"status\":\"0\",\"country_code\":\"PK\",\"type\":\"admin\",\"currency\":\"1\",\"address1\":\"address 1\",\"address2\":\"address 2\",\"company_name\":\"Ag'),
(14, 1, 'login', '2022-09-12 05:09:09', '{\"id\":1,\"first_name\":\"Supers\",\"last_name\":\"Admins\",\"email\":\"admin@phptravels.com\",\"password\":\"61152c80d1514e22fba66002597d0104\",\"status\":\"0\",\"country_code\":\"PK\",\"type\":\"admin\",\"currency\":\"1\",\"address1\":\"address 1\",\"address2\":\"address 2\",\"company_name\":\"Ag'),
(15, 1, 'login', '2022-09-12 05:09:24', '{\"id\":1,\"first_name\":\"Supers\",\"last_name\":\"Admins\",\"email\":\"admin@phptravels.com\",\"password\":\"61152c80d1514e22fba66002597d0104\",\"status\":\"0\",\"country_code\":\"PK\",\"type\":\"admin\",\"currency\":\"1\",\"address1\":\"address 1\",\"address2\":\"address 2\",\"company_name\":\"Ag'),
(16, 1, 'login', '2022-09-12 05:10:01', '{\"id\":1,\"first_name\":\"Supers\",\"last_name\":\"Admins\",\"email\":\"admin@phptravels.com\",\"password\":\"61152c80d1514e22fba66002597d0104\",\"status\":\"0\",\"country_code\":\"PK\",\"type\":\"admin\",\"currency\":\"1\",\"address1\":\"address 1\",\"address2\":\"address 2\",\"company_name\":\"Ag'),
(17, 1, 'login', '2022-09-12 05:10:39', '{\"id\":1,\"first_name\":\"Supers\",\"last_name\":\"Admins\",\"email\":\"admin@phptravels.com\",\"password\":\"61152c80d1514e22fba66002597d0104\",\"status\":\"0\",\"country_code\":\"PK\",\"type\":\"admin\",\"currency\":\"1\",\"address1\":\"address 1\",\"address2\":\"address 2\",\"company_name\":\"Ag'),
(18, 1, 'login', '2022-09-12 05:20:38', '{\"id\":1,\"first_name\":\"Supers\",\"last_name\":\"Admins\",\"email\":\"admin@phptravels.com\",\"password\":\"61152c80d1514e22fba66002597d0104\",\"status\":\"0\",\"country_code\":\"PK\",\"type\":\"admin\",\"currency\":\"1\",\"address1\":\"address 1\",\"address2\":\"address 2\",\"company_name\":\"Ag'),
(19, 1, 'login', '2022-09-12 05:23:23', '{\"id\":1,\"first_name\":\"Supers\",\"last_name\":\"Admins\",\"email\":\"admin@phptravels.com\",\"password\":\"61152c80d1514e22fba66002597d0104\",\"status\":\"0\",\"country_code\":\"PK\",\"type\":\"admin\",\"currency\":\"1\",\"address1\":\"address 1\",\"address2\":\"address 2\",\"company_name\":\"Ag'),
(20, 1, 'login', '2022-09-12 05:26:03', '{\"id\":1,\"first_name\":\"Supers\",\"last_name\":\"Admins\",\"email\":\"admin@phptravels.com\",\"password\":\"61152c80d1514e22fba66002597d0104\",\"status\":\"0\",\"country_code\":\"PK\",\"type\":\"admin\",\"currency\":\"1\",\"address1\":\"address 1\",\"address2\":\"address 2\",\"company_name\":\"Ag'),
(21, 1, 'login', '2022-09-12 05:26:16', '{\"id\":1,\"first_name\":\"Supers\",\"last_name\":\"Admins\",\"email\":\"admin@phptravels.com\",\"password\":\"61152c80d1514e22fba66002597d0104\",\"status\":\"0\",\"country_code\":\"PK\",\"type\":\"admin\",\"currency\":\"1\",\"address1\":\"address 1\",\"address2\":\"address 2\",\"company_name\":\"Ag'),
(22, 1, 'login', '2022-09-12 05:34:57', '{\"id\":1,\"first_name\":\"Supers\",\"last_name\":\"Admins\",\"email\":\"admin@phptravels.com\",\"password\":\"61152c80d1514e22fba66002597d0104\",\"status\":\"0\",\"country_code\":\"PK\",\"type\":\"admin\",\"currency\":\"1\",\"address1\":\"address 1\",\"address2\":\"address 2\",\"company_name\":\"Ag'),
(23, 1, 'login', '2022-09-12 05:35:25', '{\"id\":1,\"first_name\":\"Supers\",\"last_name\":\"Admins\",\"email\":\"admin@phptravels.com\",\"password\":\"61152c80d1514e22fba66002597d0104\",\"status\":\"0\",\"country_code\":\"PK\",\"type\":\"admin\",\"currency\":\"1\",\"address1\":\"address 1\",\"address2\":\"address 2\",\"company_name\":\"Ag'),
(24, 1, 'login', '2022-09-12 05:36:05', '{\"id\":1,\"first_name\":\"Supers\",\"last_name\":\"Admins\",\"email\":\"admin@phptravels.com\",\"password\":\"61152c80d1514e22fba66002597d0104\",\"status\":\"0\",\"country_code\":\"PK\",\"type\":\"admin\",\"currency\":\"1\",\"address1\":\"address 1\",\"address2\":\"address 2\",\"company_name\":\"Ag'),
(25, 1, 'login', '2022-09-12 05:37:28', '{\"id\":1,\"first_name\":\"Supers\",\"last_name\":\"Admins\",\"email\":\"admin@phptravels.com\",\"password\":\"61152c80d1514e22fba66002597d0104\",\"status\":\"0\",\"country_code\":\"PK\",\"type\":\"admin\",\"currency\":\"1\",\"address1\":\"address 1\",\"address2\":\"address 2\",\"company_name\":\"Ag'),
(26, 1, 'login', '2022-09-12 05:37:55', '{\"id\":1,\"first_name\":\"Supers\",\"last_name\":\"Admins\",\"email\":\"admin@phptravels.com\",\"password\":\"61152c80d1514e22fba66002597d0104\",\"status\":\"0\",\"country_code\":\"PK\",\"type\":\"admin\",\"currency\":\"1\",\"address1\":\"address 1\",\"address2\":\"address 2\",\"company_name\":\"Ag'),
(27, 1, 'login', '2022-09-12 05:41:42', '{\"id\":1,\"first_name\":\"Supers\",\"last_name\":\"Admins\",\"email\":\"admin@phptravels.com\",\"password\":\"61152c80d1514e22fba66002597d0104\",\"status\":\"0\",\"country_code\":\"PK\",\"type\":\"admin\",\"currency\":\"1\",\"address1\":\"address 1\",\"address2\":\"address 2\",\"company_name\":\"Ag'),
(28, 1, 'login', '2022-09-12 05:42:50', '{\"id\":1,\"first_name\":\"Supers\",\"last_name\":\"Admins\",\"email\":\"admin@phptravels.com\",\"password\":\"61152c80d1514e22fba66002597d0104\",\"status\":\"0\",\"country_code\":\"PK\",\"type\":\"admin\",\"currency\":\"1\",\"address1\":\"address 1\",\"address2\":\"address 2\",\"company_name\":\"Ag'),
(29, 1, 'login', '2022-09-12 05:44:26', '{\"id\":1,\"first_name\":\"Supers\",\"last_name\":\"Admins\",\"email\":\"admin@phptravels.com\",\"password\":\"61152c80d1514e22fba66002597d0104\",\"status\":\"0\",\"country_code\":\"PK\",\"type\":\"admin\",\"currency\":\"1\",\"address1\":\"address 1\",\"address2\":\"address 2\",\"company_name\":\"Ag'),
(30, 1, 'login', '2022-09-12 05:57:06', '{\"id\":1,\"first_name\":\"Supers\",\"last_name\":\"Admins\",\"email\":\"admin@phptravels.com\",\"password\":\"61152c80d1514e22fba66002597d0104\",\"status\":\"0\",\"country_code\":\"PK\",\"type\":\"admin\",\"currency\":\"1\",\"address1\":\"address 1\",\"address2\":\"address 2\",\"company_name\":\"Ag'),
(31, 1, 'login', '2022-09-12 06:11:20', '{\"id\":1,\"first_name\":\"Supers\",\"last_name\":\"Admins\",\"email\":\"admin@phptravels.com\",\"password\":\"61152c80d1514e22fba66002597d0104\",\"status\":\"0\",\"country_code\":\"PK\",\"type\":\"admin\",\"currency\":\"1\",\"address1\":\"address 1\",\"address2\":\"address 2\",\"company_name\":\"Ag'),
(32, 1, 'login', '2022-09-12 06:14:15', '{\"id\":1,\"first_name\":\"Supers\",\"last_name\":\"Admins\",\"email\":\"admin@phptravels.com\",\"password\":\"61152c80d1514e22fba66002597d0104\",\"status\":\"0\",\"country_code\":\"PK\",\"type\":\"admin\",\"currency\":\"1\",\"address1\":\"address 1\",\"address2\":\"address 2\",\"company_name\":\"Ag'),
(33, 1, 'login', '2022-09-12 06:22:35', '{\"id\":1,\"first_name\":\"Supers\",\"last_name\":\"Admins\",\"email\":\"admin@phptravels.com\",\"password\":\"61152c80d1514e22fba66002597d0104\",\"status\":\"0\",\"country_code\":\"PK\",\"type\":\"admin\",\"currency\":\"1\",\"address1\":\"address 1\",\"address2\":\"address 2\",\"company_name\":\"Ag'),
(34, 1, 'login', '2022-09-12 07:37:15', '{\"id\":1,\"first_name\":\"Supers\",\"last_name\":\"Admins\",\"email\":\"admin@phptravels.com\",\"password\":\"61152c80d1514e22fba66002597d0104\",\"status\":\"0\",\"country_code\":\"PK\",\"type\":\"admin\",\"currency\":\"1\",\"address1\":\"address 1\",\"address2\":\"address 2\",\"company_name\":\"Ag'),
(35, 1, 'login', '2022-09-12 07:55:26', '{\"id\":1,\"first_name\":\"Supers\",\"last_name\":\"Admins\",\"email\":\"admin@phptravels.com\",\"password\":\"61152c80d1514e22fba66002597d0104\",\"status\":\"0\",\"country_code\":\"PK\",\"type\":\"admin\",\"currency\":\"1\",\"address1\":\"address 1\",\"address2\":\"address 2\",\"company_name\":\"Ag'),
(36, 1, 'login', '2022-09-12 07:55:28', '{\"id\":1,\"first_name\":\"Supers\",\"last_name\":\"Admins\",\"email\":\"admin@phptravels.com\",\"password\":\"61152c80d1514e22fba66002597d0104\",\"status\":\"0\",\"country_code\":\"PK\",\"type\":\"admin\",\"currency\":\"1\",\"address1\":\"address 1\",\"address2\":\"address 2\",\"company_name\":\"Ag'),
(37, 1, 'login', '2022-09-12 07:55:30', '{\"id\":1,\"first_name\":\"Supers\",\"last_name\":\"Admins\",\"email\":\"admin@phptravels.com\",\"password\":\"61152c80d1514e22fba66002597d0104\",\"status\":\"0\",\"country_code\":\"PK\",\"type\":\"admin\",\"currency\":\"1\",\"address1\":\"address 1\",\"address2\":\"address 2\",\"company_name\":\"Ag'),
(38, 1, 'login', '2022-09-12 07:58:51', '{\"id\":1,\"first_name\":\"Supers\",\"last_name\":\"Admins\",\"email\":\"admin@phptravels.com\",\"password\":\"61152c80d1514e22fba66002597d0104\",\"status\":\"0\",\"country_code\":\"PK\",\"type\":\"admin\",\"currency\":\"1\",\"address1\":\"address 1\",\"address2\":\"address 2\",\"company_name\":\"Ag'),
(39, 1, 'login', '2022-09-12 07:59:32', '{\"id\":1,\"first_name\":\"Supers\",\"last_name\":\"Admins\",\"email\":\"admin@phptravels.com\",\"password\":\"61152c80d1514e22fba66002597d0104\",\"status\":\"0\",\"country_code\":\"PK\",\"type\":\"admin\",\"currency\":\"1\",\"address1\":\"address 1\",\"address2\":\"address 2\",\"company_name\":\"Ag'),
(40, 1, 'login', '2022-09-12 08:01:10', '{\"id\":1,\"first_name\":\"Supers\",\"last_name\":\"Admins\",\"email\":\"admin@phptravels.com\",\"password\":\"61152c80d1514e22fba66002597d0104\",\"status\":\"0\",\"country_code\":\"PK\",\"type\":\"admin\",\"currency\":\"1\",\"address1\":\"address 1\",\"address2\":\"address 2\",\"company_name\":\"Ag'),
(41, 1, 'login', '2022-09-12 08:02:52', '{\"id\":1,\"user_id\":\"425691\",\"first_name\":\"Supers\",\"last_name\":\"Admins\",\"email\":\"admin@phptravels.com\",\"password\":\"61152c80d1514e22fba66002597d0104\",\"status\":\"0\",\"country_code\":\"PK\",\"type\":\"admin\",\"currency\":\"1\",\"address1\":\"address 1\",\"address2\":\"address 2\"'),
(42, 1, 'login', '2022-09-12 08:04:29', '{\"id\":1,\"user_id\":\"425691\",\"first_name\":\"Supers\",\"last_name\":\"Admins\",\"email\":\"admin@phptravels.com\",\"password\":\"61152c80d1514e22fba66002597d0104\",\"status\":\"0\",\"country_code\":\"PK\",\"type\":\"admin\",\"currency\":\"1\",\"address1\":\"address 1\",\"address2\":\"address 2\"'),
(43, 1, 'login', '2022-09-12 08:28:23', '{\"id\":1,\"user_id\":\"425691\",\"first_name\":\"Supers\",\"last_name\":\"Admins\",\"email\":\"admin@phptravels.com\",\"password\":\"61152c80d1514e22fba66002597d0104\",\"status\":\"0\",\"country_code\":\"PK\",\"type\":\"admin\",\"currency\":\"1\",\"address1\":\"address 1\",\"address2\":\"address 2\"'),
(44, 1, 'login', '2022-09-12 09:03:15', '{\"id\":1,\"user_id\":\"425691\",\"first_name\":\"Supers\",\"last_name\":\"Admins\",\"email\":\"admin@phptravels.com\",\"password\":\"61152c80d1514e22fba66002597d0104\",\"status\":\"0\",\"country_code\":\"PK\",\"type\":\"admin\",\"currency\":\"1\",\"address1\":\"address 1\",\"address2\":\"address 2\"');

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` enum('flights','hotels','tours','cars','visa') NOT NULL DEFAULT 'flights',
  `status` enum('1','0') NOT NULL DEFAULT '0',
  `color` varchar(255) DEFAULT NULL,
  `c1` varchar(255) DEFAULT NULL,
  `c2` varchar(255) DEFAULT NULL,
  `c3` varchar(255) DEFAULT NULL,
  `c4` varchar(255) DEFAULT NULL,
  `b2c_markup` int DEFAULT NULL,
  `b2b_markup` int DEFAULT NULL,
  `b2e_markup` int DEFAULT NULL,
  `dev_mode` enum('1','0') NOT NULL DEFAULT '0',
  `payment_mode` enum('1','0') NOT NULL DEFAULT '0',
  `currency` varchar(255) DEFAULT NULL,
  `module_color` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `name`, `type`, `status`, `color`, `c1`, `c2`, `c3`, `c4`, `b2c_markup`, `b2b_markup`, `b2e_markup`, `dev_mode`, `payment_mode`, `currency`, `module_color`) VALUES
(1, 'flights', 'flights', '1', NULL, 'c1', 'c2', 'c2', 'c5', 10, 20, 30, '0', '1', 'USD', '#00ff59'),
(2, 'hotels', 'hotels', '1', NULL, '', '', '', '', 0, 0, 0, '0', '0', 'PKR', '#ff0000'),
(3, 'tours', 'tours', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL),
(4, 'cars', 'cars', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL),
(5, 'visa', 'visa', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL),
(6, 'amadeus', 'flights', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL),
(7, 'duffel', 'flights', '0', NULL, '', '', '', '', 0, 0, 0, '0', '0', NULL, '#000000'),
(8, 'kiwi', 'flights', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL),
(9, 'rezlive', 'hotels', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL),
(10, 'hotelston', 'flights', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL),
(11, 'agoda', 'hotels', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL),
(12, 'viator', 'tours', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL),
(13, 'tiqets', 'tours', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `api_key` varchar(255) DEFAULT NULL,
  `business_name` varchar(70) NOT NULL,
  `home_title` varchar(250) DEFAULT NULL,
  `site_url` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tag_line` varchar(255) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `seo_status` smallint NOT NULL DEFAULT '1',
  `meta_description` text,
  `header_logo_img` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `favicon_img` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `javascript` text,
  `reviews` enum('Yes','No') NOT NULL DEFAULT 'No',
  `default_language` varchar(100) NOT NULL DEFAULT 'en',
  `multi_language` enum('1','0') NOT NULL DEFAULT '1',
  `license_key` varchar(50) DEFAULT NULL,
  `default_theme` varchar(75) DEFAULT 'default',
  `offline_message` text,
  `site_offline` smallint DEFAULT '0',
  `default_gateway` varchar(200) DEFAULT NULL,
  `multi_currency` enum('1','0') NOT NULL DEFAULT '0',
  `booking_expiry` tinyint DEFAULT '1',
  `booking_cancellation` tinyint NOT NULL DEFAULT '1',
  `user_registration` enum('1','0') DEFAULT '1',
  `supplier_registration` enum('1','0') NOT NULL DEFAULT '0',
  `agent_registration` enum('1','0') NOT NULL DEFAULT '0',
  `guest_booking` enum('1','0') NOT NULL DEFAULT '0',
  `social_facebook` varchar(255) DEFAULT NULL,
  `social_twitter` varchar(255) DEFAULT NULL,
  `social_linkedin` varchar(255) DEFAULT NULL,
  `social_instagram` varchar(255) DEFAULT NULL,
  `social_google` varchar(255) DEFAULT NULL,
  `social_whatsapp` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `user_id`, `api_key`, `business_name`, `home_title`, `site_url`, `tag_line`, `address`, `phone`, `seo_status`, `meta_description`, `header_logo_img`, `favicon_img`, `javascript`, `reviews`, `default_language`, `multi_language`, `license_key`, `default_theme`, `offline_message`, `site_offline`, `default_gateway`, `multi_currency`, `booking_expiry`, `booking_cancellation`, `user_registration`, `supplier_registration`, `agent_registration`, `guest_booking`, `social_facebook`, `social_twitter`, `social_linkedin`, `social_instagram`, `social_google`, `social_whatsapp`) VALUES
(1, '425691', 'phptravels', 'PHPTRAVELS', 'PHPTRAVEL', 'https://phptravels.net', NULL, '', NULL, 1, 'php travels is complete booking and reservation system provides complete solution for travel agency', 'logo.png', 'favicon.png', '<script>\r\n// your code goes here \r\n\r\n</script>', 'Yes', 'fr', '1', 'license', 'default', 'offline message', 0, 'AuthorizeNet_AIM', '0', 1, 1, '0', '0', '0', '0', 'https://facebook.com/phptravels', 'https://twitter.com/phptravels', 'https://linkedin.com/phptravels', 'https://instagram.com/phptravels', 'https://google.com/phptravels', 'https://whatsapp.com/phptravels');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `first_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email_code` varchar(255) DEFAULT NULL,
  `password` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` enum('1','0') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  `country_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `type` enum('admin','admin_staff','agent','corporate','supplier') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `currency_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `company_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `company_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `company_commission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_id`, `first_name`, `last_name`, `email`, `phone`, `email_code`, `password`, `status`, `country_code`, `type`, `currency_id`, `address1`, `address2`, `company_name`, `company_phone`, `company_email`, `company_commission`, `created_at`) VALUES
(1, '425691', 'Supers', 'Admins', 'admin@phptravels.com', '0123456789', NULL, '61152c80d1514e22fba66002597d0104', '0', 'PK', 'admin', '1', 'address 1', 'address 2', 'Agency Name', '0123456', 'agency@email.com', NULL, NULL),
(3, '', 'Demo', 'Supplier', 'supplier@phptravels.com', NULL, NULL, '21232f297a57a5a743894a0e4a801fc3', '0', NULL, 'supplier', NULL, 'address 1', 'address 2', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

CREATE TABLE `visitors` (
  `id` int NOT NULL,
  `data_object` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_bookings`
--
ALTER TABLE `app_bookings`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `app_modules`
--
ALTER TABLE `app_modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `visitors`
--
ALTER TABLE `visitors`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_bookings`
--
ALTER TABLE `app_bookings`
  MODIFY `booking_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_modules`
--
ALTER TABLE `app_modules`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `visitors`
--
ALTER TABLE `visitors`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
