-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 31, 2017 at 09:26 AM
-- Server version: 10.1.21-MariaDB
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
-- Database: `aji-app`
--

-- --------------------------------------------------------

--
-- Table structure for table `accesstoken`
--

CREATE TABLE `accesstoken` (
  `id` varchar(255) NOT NULL,
  `ttl` int(11) DEFAULT NULL,
  `scopes` text,
  `created` datetime DEFAULT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `acl`
--

CREATE TABLE `acl` (
  `id` int(11) NOT NULL,
  `model` varchar(512) DEFAULT NULL,
  `property` varchar(512) DEFAULT NULL,
  `accessType` varchar(512) DEFAULT NULL,
  `permission` varchar(512) DEFAULT NULL,
  `principalType` varchar(512) DEFAULT NULL,
  `principalId` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `aji_accorder`
--

CREATE TABLE `aji_accorder` (
  `id_acc` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `id_seller` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `tanggal_acc` date NOT NULL,
  `nama_barang` varchar(30) NOT NULL,
  `photo_barang` varchar(100) NOT NULL,
  `jenis_barang` varchar(30) NOT NULL,
  `harga` varchar(30) NOT NULL,
  `jumlah_barang` int(11) NOT NULL,
  `total_harga` varchar(30) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `aji_chat`
--

CREATE TABLE `aji_chat` (
  `id` int(11) NOT NULL,
  `header_chat` varchar(45) NOT NULL,
  `fromId` varchar(45) NOT NULL,
  `toId` varchar(45) NOT NULL,
  `chat` varchar(300) NOT NULL,
  `fromName` varchar(45) NOT NULL,
  `toName` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `aji_chatheader`
--

CREATE TABLE `aji_chatheader` (
  `id` int(11) NOT NULL,
  `header_chat` varchar(45) NOT NULL,
  `created_first` varchar(45) NOT NULL,
  `created_second` varchar(45) NOT NULL,
  `fromName` varchar(45) NOT NULL,
  `toName` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `aji_order`
--

CREATE TABLE `aji_order` (
  `id_order` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `id_seller` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `tanggal_order` date NOT NULL,
  `nama_barang` varchar(20) NOT NULL,
  `photo_barang` varchar(100) NOT NULL,
  `jenis_barang` varchar(20) NOT NULL,
  `harga` varchar(20) NOT NULL,
  `jumlah_barang` int(11) NOT NULL,
  `total_harga` varchar(20) NOT NULL,
  `alamat` varchar(20) NOT NULL,
  `status` varchar(40) NOT NULL,
  `payment` varchar(45) NOT NULL,
  `payment_tot` int(100) NOT NULL,
  `bank` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `aji_order_proses`
--

CREATE TABLE `aji_order_proses` (
  `id_order` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `id_seller` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `tanggal_order` date NOT NULL,
  `nama_barang` varchar(20) NOT NULL,
  `photo_barang` varchar(100) NOT NULL,
  `jenis_barang` varchar(20) NOT NULL,
  `harga` varchar(20) NOT NULL,
  `jumlah_barang` int(11) NOT NULL,
  `total_harga` varchar(20) NOT NULL,
  `alamat` varchar(20) NOT NULL,
  `status` varchar(40) NOT NULL,
  `payment` varchar(20) NOT NULL,
  `payment_tot` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `aji_posting`
--

CREATE TABLE `aji_posting` (
  `id_barang` int(11) NOT NULL,
  `id_seller` int(11) NOT NULL,
  `create_tanggal` date NOT NULL,
  `nama_barang` varchar(20) NOT NULL,
  `jenis_barang` varchar(20) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `deskripsi` varchar(100) NOT NULL,
  `harga` varchar(20) NOT NULL,
  `reputasi` int(50) NOT NULL,
  `role` varchar(10) NOT NULL,
  `stock` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `aji_topup`
--

CREATE TABLE `aji_topup` (
  `id` int(11) NOT NULL,
  `id_customer` varchar(45) NOT NULL,
  `nama_customer` varchar(45) NOT NULL,
  `photo` varchar(45) NOT NULL,
  `nominal` varchar(45) NOT NULL,
  `to_bank` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `aji_user_auth`
--

CREATE TABLE `aji_user_auth` (
  `id` int(11) NOT NULL,
  `UserAuth` varchar(10) NOT NULL,
  `PassAuth` varchar(10) NOT NULL,
  `hak_user` varchar(10) NOT NULL,
  `nama_lengkap` varchar(20) NOT NULL,
  `topup` int(100) NOT NULL,
  `alamat` varchar(45) NOT NULL,
  `no_telp` varchar(13) NOT NULL,
  `jenis_akun` int(11) NOT NULL,
  `tempat_lahir` varchar(50) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` varchar(20) NOT NULL,
  `bank` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aji_user_auth`
--

INSERT INTO `aji_user_auth` (`id`, `UserAuth`, `PassAuth`, `hak_user`, `nama_lengkap`, `topup`, `alamat`, `no_telp`, `jenis_akun`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `bank`) VALUES
(1, 'seller', 'seller', 'seller', 'Seller', 0, 'Jakarta', '085219100674', 1, 'Tangerang, 14 November 1993', '0000-00-00', 'Laki-Laki', '7111190878'),
(2, 'user', 'user', 'customer', 'User', 45050000, 'Jakarta', '085219100674', 0, 'Tangerang, 14 November 1993', '0000-00-00', 'Laki-Laki', ''),
(8, 'admin', 'admin', 'admin', 'Admin', 0, 'Jakarta', '085219100674', 0, 'Tangerang, 14 November 1993', '0000-00-00', 'Laki-Laki', '');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(512) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rolemapping`
--

CREATE TABLE `rolemapping` (
  `id` int(11) NOT NULL,
  `principalType` varchar(512) DEFAULT NULL,
  `principalId` varchar(255) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `realm` varchar(512) DEFAULT NULL,
  `username` varchar(512) DEFAULT NULL,
  `password` varchar(512) NOT NULL,
  `email` varchar(512) NOT NULL,
  `emailVerified` tinyint(1) DEFAULT NULL,
  `verificationToken` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accesstoken`
--
ALTER TABLE `accesstoken`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `acl`
--
ALTER TABLE `acl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aji_accorder`
--
ALTER TABLE `aji_accorder`
  ADD PRIMARY KEY (`id_acc`);

--
-- Indexes for table `aji_chat`
--
ALTER TABLE `aji_chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aji_chatheader`
--
ALTER TABLE `aji_chatheader`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aji_order`
--
ALTER TABLE `aji_order`
  ADD PRIMARY KEY (`id_order`);

--
-- Indexes for table `aji_order_proses`
--
ALTER TABLE `aji_order_proses`
  ADD PRIMARY KEY (`id_order`);

--
-- Indexes for table `aji_posting`
--
ALTER TABLE `aji_posting`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `aji_topup`
--
ALTER TABLE `aji_topup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aji_user_auth`
--
ALTER TABLE `aji_user_auth`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rolemapping`
--
ALTER TABLE `rolemapping`
  ADD PRIMARY KEY (`id`),
  ADD KEY `principalId` (`principalId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acl`
--
ALTER TABLE `acl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aji_accorder`
--
ALTER TABLE `aji_accorder`
  MODIFY `id_acc` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aji_chat`
--
ALTER TABLE `aji_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aji_chatheader`
--
ALTER TABLE `aji_chatheader`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aji_order`
--
ALTER TABLE `aji_order`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aji_order_proses`
--
ALTER TABLE `aji_order_proses`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aji_posting`
--
ALTER TABLE `aji_posting`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aji_topup`
--
ALTER TABLE `aji_topup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aji_user_auth`
--
ALTER TABLE `aji_user_auth`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rolemapping`
--
ALTER TABLE `rolemapping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
