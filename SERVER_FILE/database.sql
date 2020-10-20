-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.13-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for db_beli_yuk
CREATE DATABASE IF NOT EXISTS `db_beli_yuk` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `db_beli_yuk`;

-- Dumping structure for table db_beli_yuk.tb_kategori
CREATE TABLE IF NOT EXISTS `tb_kategori` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Kategori` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table db_beli_yuk.tb_kategori: ~4 rows (approximately)
/*!40000 ALTER TABLE `tb_kategori` DISABLE KEYS */;
REPLACE INTO `tb_kategori` (`id`, `Kategori`) VALUES
	(1, 'Komputer dan Laptop'),
	(2, 'Handphone'),
	(3, 'Pakaian'),
	(4, 'Perabotan Rumah Tangga'),
	(5, 'Makanan');
/*!40000 ALTER TABLE `tb_kategori` ENABLE KEYS */;

-- Dumping structure for table db_beli_yuk.tb_produk
CREATE TABLE IF NOT EXISTS `tb_produk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` text DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `photoPath` text DEFAULT NULL,
  `idKategori` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tb_produk_tb_kategori` (`idKategori`),
  CONSTRAINT `FK_tb_produk_tb_kategori` FOREIGN KEY (`idKategori`) REFERENCES `tb_kategori` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table db_beli_yuk.tb_produk: ~6 rows (approximately)
/*!40000 ALTER TABLE `tb_produk` DISABLE KEYS */;
REPLACE INTO `tb_produk` (`id`, `nama`, `harga`, `deskripsi`, `photoPath`, `idKategori`) VALUES
	(1, 'HP s1000 Mouse Wireless USB Optical 1600DPI /HP WIRELESS MOUSE ', 58000, 'Mouse wireless kualitas terjamin dengan design yang pas di genggaman tangan anda. Sangat cocok buat anda yg sering berpergian dengan notebook anda karena mouse ini sangat mudah dimasukan ke dalam tas laptop anda. Menggunakan 2 buah baterai AA (BATERAI TIDAK TERMASUK).', 'https://ecs7.tokopedia.net/img/cache/200-square/product-1/2020/8/7/68984376/68984376_f21ddffd-cbc5-4c0f-8213-1616eb41562a_800_800.webp', 1),
	(2, 'IPHONE X 64GB 64 GARANSI 1 TAHUN ', 6800000, 'Deskripsi IPHONE X 64GB 64 GARANSI 1 TAHUN TERMURAH BLACK WHITE GREY SILVER - Putih', 'https://ecs7.tokopedia.net/img/cache/200-square/product-1/2020/8/24/110238905/110238905_56e925ed-104d-4c6f-aa08-4c1a52ddba4a_1024_1024.webp', 2),
	(3, 'Robot RT-BF10 Cleanable 720\' Rotating Clip Base Portable', 94000, 'Spesifikasi : Model : RT-BF10,Input DC : 5V/1A,Battery Capacity : 2000mAh,Size : 150x190x100mm, Weight : 258g', 'https://ecs7.tokopedia.net/img/cache/200-square/product-1/2020/8/8/28803018/28803018_200815fe-b88b-4893-8991-f8f3fb5bb29e_700_700.webp', 4),
	(4, 'Mug Kantor Gelas Teh / Kopi Panas Stainless Souvenir Promosi', 21000, 'Material : body dari Stainless Stell, gagang dari plastik, tutup dari stainless stell + plastik, Ukuran : 7.2 x 7.2 x 12.5 cm, Kapasitas : 350 ml, Kemasan : box', 'https://ecs7.tokopedia.net/img/cache/200-square/product-1/2015/9/9/244841/244841_0e069aaf-bca9-4c63-a0e8-274d1b22f2dd.jpg.webp', 4),
	(5, 'Piring Makan Cekung Keramik Ming 9" isi 6 pcs', 200000, '1 set terdiri dari 6 buah piring cekung MING,', 'https://ecs7.tokopedia.net/img/cache/200-square/VqbcmM/2020/9/8/08a9fdf5-bac9-481b-b9a4-8b2711d36502.jpg.webp', 4),
	(6, 'ECLE Bluetooth 5.1 Wireless Earphone /Headset In Ear HD', 80000, 'ECLE Earphone wireless bluetooth yang sangat ringan,memberikan kenyamanan disaat anda menggunakannya. Shell waterproff dan teknologi interior Nano-coating yang melindungi earphone dari hujan dan keringat selama anda melakukan aktivitas. One-touch button yang ada pada headphones akan membuat anda lebih praktis dalam menggunakannya, seperti untuk bermain game dan menunda pemutaran musik, mengatur suara, menjawab dan mengakhiri telpon, dll. Pakailah earphone bluetooth stereo HD ini, dan anda akan dapat menikmati nyamannya mendengar musik audio HD setiap waktu.', 'https://ecs7.tokopedia.net/img/cache/200-square/product-1/2020/9/15/53087535/53087535_c89c4320-6382-4912-b196-af7d250209e1_2048_2047.webp', 2),
	(9, 'MINISO Headset Earphone Headphone Dilipat Portable ', 160000, 'MINISO Headset Earphone Headphone Dilipat Portable Simple Original', 'https://ecs7.tokopedia.net/img/cache/200-square/VqbcmM/2020/10/16/ea44aa5a-2bd5-4753-a5a4-ad14dd2fdc0e.jpg.webp', 1),
	(10, 'SEDAP GORENG / MIE SEDAP GORENG MURAH', 2500, 'Mie Instant dalam kemasan, terbuat dari bahan mie berkualitas terbaik dan bumbu-bumbu pilihan sehingga menciptakan rasanya yang sedap. Mie Sedaap terus berinovasi untuk memberikan yang terbaik bagi konsumennya. Karena soal rasa lidah ngga bisa bohong. Mie Sedaap merupakan satu-satunya mi instant yang mendapatkan sertifikasi ISO 22000. Terdapat 9 varian rasa :', 'https://ecs7.tokopedia.net/img/cache/200-square/product-1/2020/5/15/1499263/1499263_b434dab3-b6a6-4578-9a78-240220716242_640_640.webp', 5),
	(11, 'Kaos google baju distro hitam', 90000, 'Kaos google baju distro hitam ini sangat cocok untuk di pakai saat jalan jalan maupun untuk sehari hari,', 'https://ecs7.tokopedia.net/img/cache/200-square/product-1/2018/9/22/6924252/6924252_bcdc3571-c165-472a-85f9-7cf9aab9c816_2048_1842.jpg.webp', 3);
/*!40000 ALTER TABLE `tb_produk` ENABLE KEYS */;

-- Dumping structure for table db_beli_yuk.tb_user
CREATE TABLE IF NOT EXISTS `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '0',
  `password` varchar(50) NOT NULL DEFAULT '0',
  `alamat` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table db_beli_yuk.tb_user: ~3 rows (approximately)
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
REPLACE INTO `tb_user` (`id`, `email`, `name`, `password`, `alamat`) VALUES
	(1, 'flutter@gmai.com', 'irpan2', '5acebc4cb70ddbb074b0ac76aab176ae', 'samarinda'),
	(2, 'tes@gmail.com	', 'tes', '8437d57a290a28d8f5f0a6a72466fa61', 'samarinda'),
	(3, 'test@gmail.com', 'test', '098f6bcd4621d373cade4e832627b4f6', 'samarinda'),
	(4, 'io@gmail.com', 'io', 'f98ed07a4d5f50f7de1410d905f1477f', 'samarinda');
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
