-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2022 at 03:43 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `adiansafrida`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(11) NOT NULL,
  `nama_barang` varchar(30) NOT NULL,
  `harga` varchar(15) DEFAULT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `nama_barang`, `harga`, `jumlah`) VALUES
(1, 'Tempat Tidur', 'Rp. 2.000.000', 1),
(2, 'Casing', '25000', 39),
(3, 'Headset', 'Rp. 78.000', 1),
(4, 'Plastik', 'Rp. 35.000', 10),
(5, 'Kardus', 'Rp. 150.000', 13),
(6, 'Kardus', 'Rp. 18.500', 7),
(7, 'Baju Tidur', 'Rp. 99.900', 2);

-- --------------------------------------------------------

--
-- Table structure for table `pembeli`
--

CREATE TABLE `pembeli` (
  `id` int(100) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `no_telp` char(14) DEFAULT NULL,
  `alamat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembeli`
--

INSERT INTO `pembeli` (`id`, `nama`, `no_telp`, `alamat`) VALUES
(201, 'Lia', '081212121212', 'Jakarta'),
(202, 'Akhir', '089898989898', 'Bali'),
(203, 'Ani', '08794888888', 'Tangerang'),
(204, 'Kaka', '083435555322', 'Jakarta'),
(205, 'Hari', '0876767676888', 'Bandung'),
(206, 'Tino', '087777772222', 'Tangerang'),
(207, 'Yusuf', '08747574737', 'Jakarta'),
(208, 'Harto', '067867868723', 'Jakarta'),
(209, 'Inta', '08568678655', 'Depok'),
(210, 'Tobat', '0847382763777', 'Tangerang'),
(211, 'Omar', '08392839821', 'Bandung');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `id_pembeli` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan` varchar(100) DEFAULT NULL,
  `qty` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_barang`, `id_pembeli`, `tanggal`, `keterangan`, `qty`) VALUES
(1, 2, 201, '2022-12-13', 'yes', '3'),
(2, 4, 208, '2022-12-15', 'yes', '5'),
(3, 5, 203, '2022-12-04', 'yes', '7'),
(4, 4, 204, '2022-12-06', 'yes', '5');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembeli`
--
ALTER TABLE `pembeli`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `fk_pembeli` (`id_pembeli`),
  ADD KEY `fk_barang` (`id_barang`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=316;

--
-- AUTO_INCREMENT for table `pembeli`
--
ALTER TABLE `pembeli`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=212;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `fk_barang` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id`),
  ADD CONSTRAINT `fk_pembeli` FOREIGN KEY (`id_pembeli`) REFERENCES `pembeli` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
