-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2022 at 03:02 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lelo`
--

-- --------------------------------------------------------

--
-- Table structure for table `bid`
--

CREATE TABLE `bid` (
  `id_bid` bigint(20) NOT NULL,
  `id_cats` int(11) DEFAULT NULL,
  `tanggal_dimulai` datetime NOT NULL,
  `tanggal_berakhir` datetime NOT NULL,
  `harga_terakhir` bigint(20) NOT NULL DEFAULT 0,
  `status` enum('dibuka','ditutup') DEFAULT 'ditutup',
  `id_products` bigint(20) NOT NULL,
  `id_bidders` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bid`
--

INSERT INTO `bid` (`id_bid`, `id_cats`, `tanggal_dimulai`, `tanggal_berakhir`, `harga_terakhir`, `status`, `id_products`, `id_bidders`) VALUES
(64, 2, '2022-11-14 18:16:00', '2022-11-15 18:16:00', 700000, 'ditutup', 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `bidder`
--

CREATE TABLE `bidder` (
  `id_bidder` bigint(20) NOT NULL,
  `id_user` int(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `telp` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bidder`
--

INSERT INTO `bidder` (`id_bidder`, `id_user`, `name`, `gambar`, `telp`) VALUES
(1, 2, 'test', '-----', '08745345'),
(2, 1, 'admin', '9-9-', '08745345'),
(3, 3, 'test1', '213', '08745345');

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id_history` bigint(20) NOT NULL,
  `idbid` bigint(20) DEFAULT NULL,
  `idbidder` bigint(20) DEFAULT NULL,
  `bid` bigint(20) NOT NULL,
  `status_lelang` enum('proses','pemenang','kalah') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id_history`, `idbid`, `idbidder`, `bid`, `status_lelang`) VALUES
(5, 64, 1, 10000, 'kalah'),
(6, 64, 3, 23424, 'kalah');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kat` int(11) NOT NULL,
  `name_kat` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kat`, `name_kat`) VALUES
(2, 'Elektronik'),
(3, 'test123'),
(4, 'Chainsaw Man');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` bigint(20) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `harga_awal` int(30) NOT NULL,
  `gambar_produk` varchar(255) NOT NULL,
  `idcat` int(11) DEFAULT NULL,
  `kondisi` enum('firsthand','seconhand','rusak') NOT NULL,
  `deskripsi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `nama`, `harga_awal`, `gambar_produk`, `idcat`, `kondisi`, `deskripsi`) VALUES
(4, 'Playstation 4', 234345, '1617736991_112-1123171_ps4-png-picture-playstation-4-transparent-png.png', 2, 'firsthand', 'Kondisi Bagus');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(30) NOT NULL,
  `level` enum('user','admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `name`, `username`, `password`, `email`, `level`) VALUES
(1, 'admin1', 'admin', 'admin123', 'admin@admin.com', 'admin'),
(2, 'test', 'test', 'test124', 'test@test.com', 'user'),
(3, 'test1', 'test1', '1241', 'test1@test.com', 'user'),
(4, 'Abdmustaim', 'abd202', '088823', 'rasid@gmail.com', 'user'),
(5, 'Abdmus', 'abdx', '$2y$10$x7DrlAHUkb3Z8Rs7Mvpm9.wByg0CmYstuBCiShHUBPwIie94cAKKm', 'abd@gmail.com', 'user'),
(6, 'ari', 'ari2020', '$2y$10$Y1YzBwx.F9tMT9tvQf0jwOEEgENHupfTDk5cGqvPSb94twA.FziP.', 'ari@gmail.com', 'user'),
(7, 'Gusti Dimas', 'abd23', '$2y$10$bhEfVvMyV8jAzauE6D5cmOByUZ9y4ti88X7BgNCuQeM8srTHn3gwm', 'mustaqimxx@gmail.com', 'user'),
(8, 'admin', 'admin2', '$2y$10$IhsMO/AZJDYnT5Jm0g7csOTv3LfbH7xsUKRFEVWD5pVBhXE3o8Sey', 'admin1@admin.com', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bid`
--
ALTER TABLE `bid`
  ADD PRIMARY KEY (`id_bid`),
  ADD KEY `id_cats` (`id_cats`),
  ADD KEY `id_products` (`id_products`),
  ADD KEY `id_bidders` (`id_bidders`);

--
-- Indexes for table `bidder`
--
ALTER TABLE `bidder`
  ADD PRIMARY KEY (`id_bidder`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id_history`),
  ADD KEY `idbidder` (`idbidder`),
  ADD KEY `idbid` (`idbid`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kat`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD KEY `idcat` (`idcat`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bid`
--
ALTER TABLE `bid`
  MODIFY `id_bid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `bidder`
--
ALTER TABLE `bidder`
  MODIFY `id_bidder` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id_history` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bid`
--
ALTER TABLE `bid`
  ADD CONSTRAINT `bid_ibfk_2` FOREIGN KEY (`id_cats`) REFERENCES `kategori` (`id_kat`),
  ADD CONSTRAINT `bid_ibfk_4` FOREIGN KEY (`id_products`) REFERENCES `produk` (`id_produk`),
  ADD CONSTRAINT `bid_ibfk_5` FOREIGN KEY (`id_bidders`) REFERENCES `bidder` (`id_bidder`);

--
-- Constraints for table `bidder`
--
ALTER TABLE `bidder`
  ADD CONSTRAINT `bidder_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);

--
-- Constraints for table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`idbidder`) REFERENCES `bidder` (`id_bidder`),
  ADD CONSTRAINT `history_ibfk_2` FOREIGN KEY (`idbid`) REFERENCES `bid` (`id_bid`);

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`idcat`) REFERENCES `kategori` (`id_kat`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
