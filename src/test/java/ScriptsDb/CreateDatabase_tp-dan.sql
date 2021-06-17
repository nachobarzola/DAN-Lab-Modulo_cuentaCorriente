-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.24 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for tp-dan
CREATE DATABASE IF NOT EXISTS `tp-dan` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tp-dan`;

-- Dumping structure for table tp-dan.cheque
CREATE TABLE IF NOT EXISTS `cheque` (
  `banco` varchar(255) DEFAULT NULL,
  `fecha_cobro` datetime(6) DEFAULT NULL,
  `nro_cheque` int DEFAULT NULL,
  `id_cheque_medio_pago` int NOT NULL,
  PRIMARY KEY (`id_cheque_medio_pago`),
  CONSTRAINT `FKrnr7cvpxut0wu8eqbco5y2ojm` FOREIGN KEY (`id_cheque_medio_pago`) REFERENCES `medio_pago` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table tp-dan.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `cuit` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `razon_social` varchar(255) DEFAULT NULL,
  `fecha_baja` date DEFAULT NULL,
  `habilitado_online` bit(1) DEFAULT NULL,
  `max_cuenta_corriente` int DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `FKetx0tojxf5yevxcyt6qb526x5` (`id_usuario`),
  CONSTRAINT `FKetx0tojxf5yevxcyt6qb526x5` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table tp-dan.detalle_pedido
CREATE TABLE IF NOT EXISTS `detalle_pedido` (
  `id_detalle_pedido` int NOT NULL AUTO_INCREMENT,
  `cantidad` int DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  `id_pedido` int DEFAULT NULL,
  PRIMARY KEY (`id_detalle_pedido`),
  KEY `FKjfm9pk0w2eag8tx8lu6pbego6` (`id_producto`),
  KEY `FK7n9hdifr08joboojejveby1vr` (`id_pedido`),
  CONSTRAINT `FK7n9hdifr08joboojejveby1vr` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  CONSTRAINT `FKjfm9pk0w2eag8tx8lu6pbego6` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table tp-dan.detalle_provision
CREATE TABLE IF NOT EXISTS `detalle_provision` (
  `id_detalle_provision` int NOT NULL AUTO_INCREMENT,
  `cantidad` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  `id_provision` int DEFAULT NULL,
  PRIMARY KEY (`id_detalle_provision`),
  KEY `FKj76q3xhmt2dax45un4jpgr7dm` (`id_producto`),
  KEY `FKd6expep8fs2dj77dy8ydxy3t9` (`id_provision`),
  CONSTRAINT `FKd6expep8fs2dj77dy8ydxy3t9` FOREIGN KEY (`id_provision`) REFERENCES `provision` (`id_provision`),
  CONSTRAINT `FKj76q3xhmt2dax45un4jpgr7dm` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table tp-dan.efectivo
CREATE TABLE IF NOT EXISTS `efectivo` (
  `nro_recibo` int DEFAULT NULL,
  `id_efectivo_medio_pago` int NOT NULL,
  PRIMARY KEY (`id_efectivo_medio_pago`),
  CONSTRAINT `FK5o6jy2q18u4dosr5bxe06dl1` FOREIGN KEY (`id_efectivo_medio_pago`) REFERENCES `medio_pago` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table tp-dan.empleado
CREATE TABLE IF NOT EXISTS `empleado` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `mail` varchar(255) DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `FKt7vdal63o7rdoojoy7ywhjesh` (`id_usuario`),
  CONSTRAINT `FKt7vdal63o7rdoojoy7ywhjesh` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table tp-dan.estado_pedido
CREATE TABLE IF NOT EXISTS `estado_pedido` (
  `id_estado_pedido` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_estado_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table tp-dan.medio_pago
CREATE TABLE IF NOT EXISTS `medio_pago` (
  `id` int NOT NULL AUTO_INCREMENT,
  `observacion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table tp-dan.movimientos_stock
CREATE TABLE IF NOT EXISTS `movimientos_stock` (
  `id_movimiento_stock` int NOT NULL AUTO_INCREMENT,
  `cantidad_entrada` int DEFAULT NULL,
  `cantidad_salida` int DEFAULT NULL,
  `fecha` datetime(6) DEFAULT NULL,
  `id_detalle_pedido` int DEFAULT NULL,
  `id_detalle_provision` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  PRIMARY KEY (`id_movimiento_stock`),
  KEY `FK3kcr2x5hd0u61tjtflg1xmd9i` (`id_detalle_pedido`),
  KEY `FKkbeoy1c6r6qbyf1h6ugdwvkkl` (`id_detalle_provision`),
  KEY `FKamk5a9dmx95vjp4d4vw4jrxb4` (`id_producto`),
  CONSTRAINT `FK3kcr2x5hd0u61tjtflg1xmd9i` FOREIGN KEY (`id_detalle_pedido`) REFERENCES `detalle_pedido` (`id_detalle_pedido`),
  CONSTRAINT `FKamk5a9dmx95vjp4d4vw4jrxb4` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`),
  CONSTRAINT `FKkbeoy1c6r6qbyf1h6ugdwvkkl` FOREIGN KEY (`id_detalle_provision`) REFERENCES `detalle_provision` (`id_detalle_provision`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table tp-dan.obra
CREATE TABLE IF NOT EXISTS `obra` (
  `id_obra` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `latitud` float DEFAULT NULL,
  `longitud` float DEFAULT NULL,
  `superficie` int DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  `id_tipo_obra` int DEFAULT NULL,
  PRIMARY KEY (`id_obra`),
  KEY `FKe6pqauh2107yp091rdhq78th1` (`id_cliente`),
  KEY `FKjtg36cfq5imcy9u57c677w4lt` (`id_tipo_obra`),
  CONSTRAINT `FKe6pqauh2107yp091rdhq78th1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `FKjtg36cfq5imcy9u57c677w4lt` FOREIGN KEY (`id_tipo_obra`) REFERENCES `tipo_obra` (`id_tipo_obra`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table tp-dan.pago
CREATE TABLE IF NOT EXISTS `pago` (
  `id_pago` int NOT NULL AUTO_INCREMENT,
  `fecha_pago` datetime(6) DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  `id_medio_pago` int DEFAULT NULL,
  PRIMARY KEY (`id_pago`),
  KEY `FK2fmwlqws6jmrycdhkn2bl8m0p` (`id_cliente`),
  KEY `FKenb53msdugorbaoaiabvisg99` (`id_medio_pago`),
  CONSTRAINT `FK2fmwlqws6jmrycdhkn2bl8m0p` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `FKenb53msdugorbaoaiabvisg99` FOREIGN KEY (`id_medio_pago`) REFERENCES `medio_pago` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table tp-dan.pedido
CREATE TABLE IF NOT EXISTS `pedido` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `fecha_pedido` date DEFAULT NULL,
  `id_estado_pedido` int DEFAULT NULL,
  `id_obra` int DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `FKpwts0xmsajvn0pjcukb14hpih` (`id_estado_pedido`),
  KEY `FKmtnlpv8yx33wfgetcgeuatap0` (`id_obra`),
  CONSTRAINT `FKmtnlpv8yx33wfgetcgeuatap0` FOREIGN KEY (`id_obra`) REFERENCES `obra` (`id_obra`),
  CONSTRAINT `FKpwts0xmsajvn0pjcukb14hpih` FOREIGN KEY (`id_estado_pedido`) REFERENCES `estado_pedido` (`id_estado_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table tp-dan.producto
CREATE TABLE IF NOT EXISTS `producto` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `stock_actual` int DEFAULT NULL,
  `stock_minimo` int DEFAULT NULL,
  `id_unidad` int DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `FK5ihd5590a1omv6gav6g35w5bh` (`id_unidad`),
  CONSTRAINT `FK5ihd5590a1omv6gav6g35w5bh` FOREIGN KEY (`id_unidad`) REFERENCES `unidad` (`id_unidad`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table tp-dan.provision
CREATE TABLE IF NOT EXISTS `provision` (
  `id_provision` int NOT NULL AUTO_INCREMENT,
  `fecha_provision` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id_provision`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table tp-dan.tipo_obra
CREATE TABLE IF NOT EXISTS `tipo_obra` (
  `id_tipo_obra` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_obra`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table tp-dan.tipo_usuario
CREATE TABLE IF NOT EXISTS `tipo_usuario` (
  `id_tipo_usuario` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table tp-dan.transferencia
CREATE TABLE IF NOT EXISTS `transferencia` (
  `cbu_destino` varchar(255) DEFAULT NULL,
  `cbu_origen` varchar(255) DEFAULT NULL,
  `codigo_transferencia` bigint DEFAULT NULL,
  `id_transferencia_medio_pago` int NOT NULL,
  PRIMARY KEY (`id_transferencia_medio_pago`),
  CONSTRAINT `FKq2vwgcuujagrw74vsuqtio9hf` FOREIGN KEY (`id_transferencia_medio_pago`) REFERENCES `medio_pago` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table tp-dan.unidad
CREATE TABLE IF NOT EXISTS `unidad` (
  `id_unidad` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_unidad`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table tp-dan.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `password` varchar(255) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `id_tipo_usuario` int DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `FKr9xk0brid147iaydo8j47o9p2` (`id_tipo_usuario`),
  CONSTRAINT `FKr9xk0brid147iaydo8j47o9p2` FOREIGN KEY (`id_tipo_usuario`) REFERENCES `tipo_usuario` (`id_tipo_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
