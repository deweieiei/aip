-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 07, 2022 at 07:21 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `data`
--

-- --------------------------------------------------------

--
-- Table structure for table `datachang`
--

CREATE TABLE `datachang` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `iduser` varchar(100) NOT NULL,
  `birthday` varchar(100) NOT NULL,
  `tradesman` varchar(100) NOT NULL,
  `province` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `datachang`
--

INSERT INTO `datachang` (`id`, `username`, `lastname`, `iduser`, `birthday`, `tradesman`, `province`) VALUES
(1, '1', '2', '3', '4', '5', '6'),
(2, '22', '22', '22', '22', '22', '22'),
(3, '33', '33', '33', '33', '33', '33'),
(4, '33', '33', '33', '33', '33', '33'),
(5, '33', '33', '33', '33', '33', '33'),
(6, '1', '1', '1', '1', '1', '1'),
(7, '1', '1', '1', '1', '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `datauser`
--

CREATE TABLE `datauser` (
  `id` int(11) NOT NULL,
  `username` text COLLATE utf8_bin NOT NULL,
  `firstname` text COLLATE utf8_bin NOT NULL,
  `lastname` text COLLATE utf8_bin NOT NULL,
  `email` text COLLATE utf8_bin NOT NULL,
  `password` text COLLATE utf8_bin NOT NULL,
  `layer` text COLLATE utf8_bin NOT NULL,
  `datetime` datetime DEFAULT NULL,
  `line` text COLLATE utf8_bin NOT NULL,
  `numphon` text COLLATE utf8_bin NOT NULL,
  `facebook` text COLLATE utf8_bin NOT NULL,
  `address` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `datauser`
--

INSERT INTO `datauser` (`id`, `username`, `firstname`, `lastname`, `email`, `password`, `layer`, `datetime`, `line`, `numphon`, `facebook`, `address`) VALUES
(20, 'dew', 'pairot', 'tanya', 'dew@gmail.com', 'b5ab969eff6a4ef1982e6e4f9198c746', '2', '2022-07-24 18:36:35', '1234', '999999', '8888888', 'address'),
(21, 'dew1', 'dew', 'dew', 'dew1@gmail.com', '4853bbdcc5b9de19df32ee81cf111360', '2', '2022-07-30 08:45:48', '1234', '999999', '8888888', 'address'),
(22, 'dew2', 'pairot', 'tanya', 'dew2@mail.com', 'bb922a2161f680a010bf15f258fba97b', '2', '2022-08-05 14:05:36', '', '', '', ''),
(23, 'ไพโรจน์', 'ไพโรจน์2', 'ไพโรจน์3', 'ไพโรจน์4', 'ไพโรจน์5', '2', NULL, '', '', '', ''),
(24, '', '', '', '', '60fd48f566af64f10400720295741106', '', '2022-08-05 15:15:22', '', '', '', ''),
(25, 'dew3', 'ไพโรจน์', 'ธัญญเจิญ', 'dew3@gmail.com', '62605e85540d1170a7afee10f39d262a', '2', '2022-08-05 15:17:33', 't1', 't2', 't3', 't4'),
(26, 'pt1', 'ppt11', 'ddt11', 'ppt@gmail.com', 'ee262c65bf9ddc5d3fcd6f09a2beaad0', '2', '2022-08-06 11:57:30', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `gt` varchar(2) NOT NULL,
  `userid` int(11) NOT NULL,
  `textpost` text NOT NULL,
  `timepost` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `gt`, `userid`, `textpost`, `timepost`) VALUES
(12, 'กa', 1, 'data1', '2022-07-24 17:54:57'),
(13, 'ขb', 1, 'data2', '2022-07-24 17:55:07');

-- --------------------------------------------------------

--
-- Table structure for table `postdb`
--

CREATE TABLE `postdb` (
  `id` int(11) NOT NULL,
  `infor` text NOT NULL,
  `time` text NOT NULL,
  `count` int(12) NOT NULL,
  `phone` int(11) NOT NULL,
  `line` text NOT NULL,
  `datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `postdb`
--

INSERT INTO `postdb` (`id`, `infor`, `time`, `count`, `phone`, `line`, `datetime`) VALUES
(14, 'ซ่อมไฟข้างตึกมีหลอดไฟไห้อุปกรณ์', '25/12/2565/12:00-12:30', 12000, 982934661, 'dieiei123', '2022-08-02 04:36:46'),
(15, 'ซ่อมกำเเพงปูนจากอุบัติเหตูรถชน ไม่มีอุปกรณ์การซ่อม', '15/05/2565/12:00-13:00', 900, 987123456, 'hibooo', '2022-08-02 04:45:22'),
(16, 'test01', '10/2/2565', 1200, 987654321, 'dew', '2022-08-02 05:17:49'),
(17, 'ภาษาไทย หรือ ภาษาไทยกลาง เป็นภาษาในกลุ่มภาษาไท ซึ่งเป็นกลุ่มย่อยของตระกูลภาษาขร้า-ไท และเป็นภาษาราชการ และภาษาประจำชาติของประเทศไทย[3][4] มีการสันนิษฐานว่าภาษาในตระกูลนี้มีถิ่นกำเนิดจากทางตอนใต้ของประเทศจีน และนักภาษาศาสตร์บางส่วนเสนอว่า ภาษาไทยน่าจะมีความเชื่อมโยงกับตระกูลภาษาออสโตร-เอเชียติก ตระกูลภาษาออสโตรนีเซียน และตระกูลภาษาจีน-ทิเบต', '12:00-13:00', 1200, 987654321, 'dew1234', '2022-08-05 15:23:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `datachang`
--
ALTER TABLE `datachang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `datauser`
--
ALTER TABLE `datauser`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `postdb`
--
ALTER TABLE `postdb`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `datachang`
--
ALTER TABLE `datachang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `datauser`
--
ALTER TABLE `datauser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `postdb`
--
ALTER TABLE `postdb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
