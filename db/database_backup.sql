/*
SQLyog Community v13.1.9 (64 bit)
MySQL - 8.0.17 : Database - mihotel
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mihotel` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `mihotel`;

/*Table structure for table `clientes` */

DROP TABLE IF EXISTS `clientes`;

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `dni` varchar(15) NOT NULL,
  `edad` tinyint(2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `clientes` */

insert  into `clientes`(`id`,`nombre`,`dni`,`edad`,`status`,`createdAt`,`updatedAt`) values 
(1,'Pablo Escobar','1075321',22,1,NULL,NULL),
(2,'Karen Alvarez','1079187',22,1,NULL,NULL),
(3,'Uriel Escobar','1079100',13,1,NULL,NULL);

/*Table structure for table `estadia` */

DROP TABLE IF EXISTS `estadia`;

CREATE TABLE `estadia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ClienteId` int(11) NOT NULL,
  `HabitacioneId` int(11) NOT NULL,
  `tipoPlanId` int(11) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `acompañantes` int(11) NOT NULL,
  `total` float(10,2) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_estadia_cliente` (`ClienteId`),
  KEY `fk_estadia_habitacion` (`HabitacioneId`),
  KEY `fk_estadia_tipo_plan` (`tipoPlanId`),
  CONSTRAINT `fk_ClienteId_estadia` FOREIGN KEY (`ClienteId`) REFERENCES `clientes` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_HabitacioneId_estadia` FOREIGN KEY (`HabitacioneId`) REFERENCES `habitaciones` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tipoPlanId_estadia` FOREIGN KEY (`tipoPlanId`) REFERENCES `tipoplan` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `estadia` */

insert  into `estadia`(`id`,`ClienteId`,`HabitacioneId`,`tipoPlanId`,`fecha_ingreso`,`acompañantes`,`total`,`createdAt`,`updatedAt`) values 
(1,1,3,2,'2022-02-19',1,250000.00,NULL,NULL),
(2,2,11,3,'2022-02-11',3,520000.00,'2022-02-14 03:59:05','2022-02-14 04:01:02'),
(4,3,8,1,'2022-02-16',0,190000.00,'2022-02-14 03:56:50',NULL),
(5,1,6,1,'2022-02-02',1,NULL,'2022-02-14 03:56:26',NULL);

/*Table structure for table `estadiadetalles` */

DROP TABLE IF EXISTS `estadiadetalles`;

CREATE TABLE `estadiadetalles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_estadia` int(11) NOT NULL,
  `servicio` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `EstadiumId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_estadia_detalle_id_estadia` (`id_estadia`),
  KEY `fk_estadia_detalle_servicio` (`servicio`),
  CONSTRAINT `fk_estadia_detalle_id_estadia` FOREIGN KEY (`id_estadia`) REFERENCES `estadia` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_estadia_detalle_servicio` FOREIGN KEY (`servicio`) REFERENCES `servicios` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `estadiadetalles` */

insert  into `estadiadetalles`(`id`,`id_estadia`,`servicio`,`cantidad`,`createdAt`,`updatedAt`,`EstadiumId`) values 
(1,1,1,1,'2022-02-14 04:03:21',NULL,NULL),
(2,1,2,2,'2022-02-14 04:03:59',NULL,NULL),
(3,2,2,4,'2022-02-14 04:04:17',NULL,NULL),
(4,4,2,2,'2022-02-14 04:04:19',NULL,NULL),
(5,4,3,1,'2022-02-14 04:04:22',NULL,NULL),
(6,5,2,2,NULL,NULL,NULL);

/*Table structure for table `habitaciones` */

DROP TABLE IF EXISTS `habitaciones`;

CREATE TABLE `habitaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_habitacion` int(11) NOT NULL,
  `code` varchar(3) NOT NULL,
  `estado` enum('libre','reservada','ocupada','inhabilitada') NOT NULL DEFAULT 'libre',
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_habitacion_tipo_habitacion` (`tipo_habitacion`),
  CONSTRAINT `fk_habitacion_tipo_habitacion` FOREIGN KEY (`tipo_habitacion`) REFERENCES `tipo_habitacion` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `habitaciones` */

insert  into `habitaciones`(`id`,`tipo_habitacion`,`code`,`estado`,`createdAt`,`updatedAt`) values 
(1,1,'101','libre',NULL,NULL),
(2,1,'102','libre',NULL,NULL),
(3,2,'103','libre',NULL,NULL),
(4,3,'104','libre',NULL,NULL),
(5,2,'201','libre',NULL,NULL),
(6,2,'202','libre',NULL,NULL),
(7,2,'203','libre',NULL,NULL),
(8,1,'204','libre',NULL,NULL),
(9,3,'301','libre',NULL,NULL),
(10,3,'302','libre',NULL,NULL),
(11,2,'303','libre',NULL,NULL);

/*Table structure for table `servicios` */

DROP TABLE IF EXISTS `servicios`;

CREATE TABLE `servicios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `servicio` varchar(50) NOT NULL,
  `valor` float(10,2) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `servicios` */

insert  into `servicios`(`id`,`servicio`,`valor`,`createdAt`,`updatedAt`) values 
(1,'spa',10000.00,NULL,NULL),
(2,'restaurante',30000.00,NULL,NULL),
(3,'gym',15000.00,NULL,NULL);

/*Table structure for table `tipo_habitacion` */

DROP TABLE IF EXISTS `tipo_habitacion`;

CREATE TABLE `tipo_habitacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(25) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tipo_habitacion` */

insert  into `tipo_habitacion`(`id`,`tipo`,`createdAt`,`updatedAt`) values 
(1,'basica',NULL,NULL),
(2,'doble',NULL,NULL),
(3,'triple',NULL,NULL);

/*Table structure for table `tipoplan` */

DROP TABLE IF EXISTS `tipoplan`;

CREATE TABLE `tipoplan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(15) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tipoplan` */

insert  into `tipoplan`(`id`,`tipo`,`createdAt`,`updatedAt`) values 
(1,'weekdays',NULL,NULL),
(2,'weekend',NULL,NULL),
(3,'all in one',NULL,NULL);

/* Trigger structure for table `estadiadetalles` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `setTotalEstadia` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `setTotalEstadia` BEFORE UPDATE ON `estadiadetalles` FOR EACH ROW BEGIN
	SET @total = 0;
	set @plan = 	(SELECT es.tipoPlanId
			FROM estadia AS es
			INNER JOIN tipoplan
			ON tipoplan.id = es.tipoPlanId
			WHERE es.id = old.id_estadia);
			
	SET @numPeople = (SELECT es.acompañantes
			FROM estadia AS es
			INNER JOIN tipoplan
			ON tipoplan.id = es.tipoPlanId
			WHERE es.id = old.id_estadia);
			
	SET @totalSer = (SELECT totalServicios 
			FROM (SELECT es.id, (esd.cantidad * ser.valor) AS totalServicios
			FROM estadia AS es
			INNER JOIN estadiadetalles esd
			ON es.id = esd.id_estadia
			INNER JOIN servicios ser
			ON ser.id = esd.servicio
			GROUP BY es.id) AS tabl
			WHERE id = old.id_estadia);
			
	if @plan = 1 then
		UPDATE `mihotel`.`estadia` 
		SET
		`total` = (50000 + (80000 * (@numPeople + 1)) + @totalSer)
		WHERE
		`id` = old.id_estadia;
	end if;
	
	IF @plan = 2 THEN
		UPDATE `mihotel`.`estadia` 
		SET
		`total` = (80000 + (80000 * (@numPeople + 1)) + @totalSer)
		WHERE
		`id` = old.id_estadia;
	END IF;
	
	IF @plan = 3 THEN
		UPDATE `mihotel`.`estadia` 
		SET
		`total` = (80000 + (80000 * (@numPeople + 1)) + @totalSer)
		WHERE
		`id` = old.id_estadia;
	END IF;
    END */$$


DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
