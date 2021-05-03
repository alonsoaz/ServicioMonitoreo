CREATE DATABASE  IF NOT EXISTS `barberia` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `barberia`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: barberia
-- ------------------------------------------------------
-- Server version	5.7.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `barbero`
--

DROP TABLE IF EXISTS `barbero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `barbero` (
  `idBarbero` int(11) NOT NULL AUTO_INCREMENT,
  `codBarbero` char(5) NOT NULL,
  `idDatos` int(11) DEFAULT NULL,
  `idEstado` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `dateUpdated` int(11) DEFAULT NULL,
  PRIMARY KEY (`idBarbero`),
  UNIQUE KEY `UK_codBarbero` (`codBarbero`),
  KEY `FK_BarberoDatos` (`idDatos`),
  KEY `FK_BarberoUpdt` (`modifiedBy`),
  KEY `FK_BarberoDate` (`dateUpdated`),
  KEY `FK_BarberoEstado` (`idEstado`),
  CONSTRAINT `FK_BarberoDate` FOREIGN KEY (`dateUpdated`) REFERENCES `fecha` (`idFecha`),
  CONSTRAINT `FK_BarberoDatos` FOREIGN KEY (`idDatos`) REFERENCES `datos` (`idDatos`),
  CONSTRAINT `FK_BarberoEstado` FOREIGN KEY (`idEstado`) REFERENCES `estado` (`idEstado`),
  CONSTRAINT `FK_BarberoUpdt` FOREIGN KEY (`modifiedBy`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `codCliente` char(5) NOT NULL,
  `idDatos` int(11) DEFAULT NULL,
  `pass` char(8) NOT NULL,
  `idEstado` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `dateUpdated` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE KEY `UK_cliente` (`codCliente`),
  KEY `FK_ClienteDatos` (`idDatos`),
  KEY `FK_ClienteUpdt` (`modifiedBy`),
  KEY `FK_ClienteDate` (`dateUpdated`),
  KEY `FK_ClienteEstado` (`idEstado`),
  CONSTRAINT `FK_ClienteDate` FOREIGN KEY (`dateUpdated`) REFERENCES `fecha` (`idFecha`),
  CONSTRAINT `FK_ClienteDatos` FOREIGN KEY (`idDatos`) REFERENCES `datos` (`idDatos`),
  CONSTRAINT `FK_ClienteEstado` FOREIGN KEY (`idEstado`) REFERENCES `estado` (`idEstado`),
  CONSTRAINT `FK_ClienteUpdt` FOREIGN KEY (`modifiedBy`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `datos`
--

DROP TABLE IF EXISTS `datos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datos` (
  `idDatos` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) DEFAULT NULL,
  `apellido` varchar(40) DEFAULT NULL,
  `telefono` char(9) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `dni` char(8) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idDatos`),
  UNIQUE KEY `UK_dni` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_venta` (
  `idDetalle_Venta` int(11) NOT NULL AUTO_INCREMENT,
  `codDetVenta` char(6) NOT NULL,
  `idVenta` int(11) DEFAULT NULL,
  `idEstado` int(11) DEFAULT NULL,
  `idItem` int(11) DEFAULT NULL,
  `Cantidad` double NOT NULL,
  `Descuento` double NOT NULL,
  `SubTotal` double NOT NULL,
  PRIMARY KEY (`idDetalle_Venta`),
  UNIQUE KEY `UK_detVenta` (`codDetVenta`),
  KEY `FK_DetVenta` (`idVenta`),
  KEY `FK_ItProducto` (`idItem`),
  KEY `FK_DtEstado` (`idEstado`),
  CONSTRAINT `FK_DetVenta` FOREIGN KEY (`idVenta`) REFERENCES `ventas` (`idVenta`),
  CONSTRAINT `FK_DtEstado` FOREIGN KEY (`idEstado`) REFERENCES `estado` (`idEstado`),
  CONSTRAINT `FK_ItProducto` FOREIGN KEY (`idItem`) REFERENCES `producto` (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado` (
  `idEstado` int(11) NOT NULL AUTO_INCREMENT,
  `desEstado` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fecha`
--

DROP TABLE IF EXISTS `fecha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fecha` (
  `idFecha` int(11) NOT NULL AUTO_INCREMENT,
  `detFecha` datetime DEFAULT NULL,
  `registered` datetime DEFAULT NULL,
  PRIMARY KEY (`idFecha`)
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `marca_producto`
--

DROP TABLE IF EXISTS `marca_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marca_producto` (
  `idMarcaProducto` int(11) NOT NULL AUTO_INCREMENT,
  `codMarca` varchar(10) NOT NULL,
  `nombMarca` varchar(30) NOT NULL,
  `idEstado` int(11) DEFAULT '1',
  PRIMARY KEY (`idMarcaProducto`),
  KEY `FK_MarcaEstado` (`idEstado`),
  CONSTRAINT `FK_MarcaEstado` FOREIGN KEY (`idEstado`) REFERENCES `estado` (`idEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mensaje`
--

DROP TABLE IF EXISTS `mensaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mensaje` (
  `idMensaje` int(11) NOT NULL AUTO_INCREMENT,
  `mensaje` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idMensaje`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL AUTO_INCREMENT,
  `codProducto` char(5) NOT NULL,
  `idMarcaProducto` int(11) DEFAULT NULL,
  `idTipo_producto` int(11) DEFAULT NULL,
  `nomProd` varchar(30) DEFAULT NULL,
  `idEstado` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `dateUpdated` int(11) DEFAULT NULL,
  PRIMARY KEY (`idProducto`),
  UNIQUE KEY `UK_codProducto` (`codProducto`),
  UNIQUE KEY `UK_nomProd` (`nomProd`),
  KEY `FK_ProductoTipo` (`idTipo_producto`),
  KEY `FK_ProductoMarca` (`idMarcaProducto`),
  KEY `FK_ProductoEstado` (`idEstado`),
  KEY `FK_ProductoUpdt` (`modifiedBy`),
  KEY `FK_ProductoDate` (`dateUpdated`),
  CONSTRAINT `FK_ProductoDate` FOREIGN KEY (`dateUpdated`) REFERENCES `fecha` (`idFecha`),
  CONSTRAINT `FK_ProductoEstado` FOREIGN KEY (`idEstado`) REFERENCES `estado` (`idEstado`),
  CONSTRAINT `FK_ProductoMarca` FOREIGN KEY (`idMarcaProducto`) REFERENCES `marca_producto` (`idMarcaProducto`),
  CONSTRAINT `FK_ProductoTipo` FOREIGN KEY (`idTipo_producto`) REFERENCES `tipo_producto` (`idTipo_producto`),
  CONSTRAINT `FK_ProductoUpdt` FOREIGN KEY (`modifiedBy`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserva` (
  `idReserva` int(11) NOT NULL AUTO_INCREMENT,
  `codReserva` char(5) NOT NULL,
  `idEstado` int(11) DEFAULT NULL,
  `idCliente` int(11) DEFAULT NULL,
  `idBarbero` int(11) DEFAULT NULL,
  `idHoraIni` int(11) DEFAULT NULL,
  `idServicio` int(11) DEFAULT NULL,
  `idHoraFin` int(11) DEFAULT NULL,
  PRIMARY KEY (`idReserva`),
  UNIQUE KEY `UK_codReserva` (`codReserva`),
  KEY `FK_ReservaBarbero` (`idBarbero`),
  KEY `FK_ReservaCliente` (`idCliente`),
  KEY `FK_ReservaHora` (`idHoraIni`),
  KEY `FK_ReservaServicio` (`idServicio`),
  KEY `FK_ReservaEstado` (`idEstado`),
  CONSTRAINT `FK_ReservaBarbero` FOREIGN KEY (`idBarbero`) REFERENCES `barbero` (`idBarbero`),
  CONSTRAINT `FK_ReservaCliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`),
  CONSTRAINT `FK_ReservaEstado` FOREIGN KEY (`idEstado`) REFERENCES `estado` (`idEstado`),
  CONSTRAINT `FK_ReservaHora` FOREIGN KEY (`idHoraIni`) REFERENCES `fecha` (`idFecha`),
  CONSTRAINT `FK_ReservaServicio` FOREIGN KEY (`idServicio`) REFERENCES `servicio` (`idServicio`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicio` (
  `idServicio` int(11) NOT NULL AUTO_INCREMENT,
  `codServicio` char(5) NOT NULL,
  `nomServ` varchar(30) DEFAULT NULL,
  `idEstado` int(11) DEFAULT NULL,
  `minutos` int(11) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `dateUpdated` int(11) DEFAULT NULL,
  PRIMARY KEY (`idServicio`),
  UNIQUE KEY `UK_codServicio` (`codServicio`),
  UNIQUE KEY `UK_nomServ` (`nomServ`),
  KEY `FK_ServicioUpdt` (`modifiedBy`),
  KEY `FK_ServicioDate` (`dateUpdated`),
  KEY `FK_ServicioEstado` (`idEstado`),
  CONSTRAINT `FK_ServicioDate` FOREIGN KEY (`dateUpdated`) REFERENCES `fecha` (`idFecha`),
  CONSTRAINT `FK_ServicioEstado` FOREIGN KEY (`idEstado`) REFERENCES `estado` (`idEstado`),
  CONSTRAINT `FK_ServicioUpdt` FOREIGN KEY (`modifiedBy`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_producto`
--

DROP TABLE IF EXISTS `tipo_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_producto` (
  `idTipo_producto` int(11) NOT NULL AUTO_INCREMENT,
  `idEstado` int(11) DEFAULT NULL,
  `detalle` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idTipo_producto`),
  KEY `FK_PTEstado` (`idEstado`),
  CONSTRAINT `FK_PTEstado` FOREIGN KEY (`idEstado`) REFERENCES `estado` (`idEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_usuario`
--

DROP TABLE IF EXISTS `tipo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_usuario` (
  `idTipo_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `detalle` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idTipo_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `idTipo_usuario` int(11) DEFAULT NULL,
  `codUsuario` char(5) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `cargo` varchar(20) DEFAULT NULL,
  `aka` varchar(9) DEFAULT NULL,
  `pass` char(8) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `telefono` char(9) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `UK_codUsuario` (`codUsuario`),
  UNIQUE KEY `UK_cargo` (`cargo`),
  UNIQUE KEY `UK_aka` (`aka`),
  KEY `FK_UsuarioTipo` (`idTipo_usuario`),
  CONSTRAINT `FK_UsuarioTipo` FOREIGN KEY (`idTipo_usuario`) REFERENCES `tipo_usuario` (`idTipo_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventas` (
  `idVenta` int(11) NOT NULL AUTO_INCREMENT,
  `codVenta` char(5) NOT NULL,
  `idCliente` int(11) DEFAULT NULL,
  `idEstado` int(11) DEFAULT NULL,
  `idFecha` int(11) DEFAULT NULL,
  PRIMARY KEY (`idVenta`),
  UNIQUE KEY `UK_ventas` (`codVenta`),
  KEY `FK_VentaCliente` (`idCliente`),
  KEY `FK_VentaFecha` (`idFecha`),
  KEY `FK_VentaEstado` (`idEstado`),
  CONSTRAINT `FK_VentaCliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`),
  CONSTRAINT `FK_VentaEstado` FOREIGN KEY (`idEstado`) REFERENCES `estado` (`idEstado`),
  CONSTRAINT `FK_VentaFecha` FOREIGN KEY (`idFecha`) REFERENCES `fecha` (`idFecha`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensaje`
--

LOCK TABLES `mensaje` WRITE;
/*!40000 ALTER TABLE `mensaje` DISABLE KEYS */;
INSERT INTO `mensaje` VALUES (1,'REGISTRADO CON ÉXITO'),(2,'NO SE PUDO REGISTRAR'),(3,'ACTUALIZADO CON ÉXITO'),(4,'NO SE PUDO ACTUALIZAR'),(5,'ELIMINADO CON ÉXITO'),(6,'NO SE PUDO ELIMINAR'),(7,'EL BARBERO SE ENCUENTRA DISPONIBLE'),(8,'SE REALIZO LA RESERVA CON EXITO'),(9,'NO SE PUDO RELIZAR LA RESERVA'),(10,'BIENVENIDO'),(11,'PASSWORD INCORRECTO'),(12,'EL USUARIO NO EXISTE'),(13,'EXITO EN EL CAMBIO DE CLAVE'),(14,'NO COINCIDEN'),(15,'EL BARBERO SE ENCUENTRA OCUPADO');
/*!40000 ALTER TABLE `mensaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tipo_usuario`
--

LOCK TABLES `tipo_usuario` WRITE;
/*!40000 ALTER TABLE `tipo_usuario` DISABLE KEYS */;
INSERT INTO `tipo_usuario` VALUES (1,'SYSTEM'),(2,'DATA'),(3,'WEB'),(4,'ANDROID'),(5,'SERVER'),(6,'STYLE'),(7,'EL PROFE');
/*!40000 ALTER TABLE `tipo_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,1,'U0001','SYSTEM','DATABASE','CARGO','SYS','28122018','database@correo.com','920570574','DESCRIPCION'),(2,4,'U0002','USUARIO MOVIL','SYSTEM','ANDROID','ANDROID','28122018','android@correo.com','987654321','USUARIO PARA MOVIL GENERADO POR SISTEMA'),(48,2,'U0003','ALONSO','AZALDEGUI','DATA','ZER0','46759382','alonsoaz@gmail.com','920570574','ME GUSTA EL FUTBOL'),(49,5,'U0049','RODRIGO','QUIROZ','SERVER','ZRODRIGO','CMAMO123','jrodrigo.qe@gmail.com','983400445','SCRUM MASTER');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `datos`
--

LOCK TABLES `datos` WRITE;
/*!40000 ALTER TABLE `datos` DISABLE KEYS */;
INSERT INTO `datos` VALUES (48,'CAMILO','RODRIGUEZ','957852365','KMILO@GMAIL.ES','78541263','AV. EL NARANJAL 1000'),(49,'EL','PAPU','987456123','EL@PAPU.COM','78787878','NO'),(52,'ALONSO','AZALDEGUI','932819009','ALONSO_AZ@HOTMAIL.COM','25496961','AV. ESTADOS UNIDOS #115, CALLAO'),(53,'MACBOOK','PRO','912345678','MAC@GMAIL.COM','12345678','');
/*!40000 ALTER TABLE `datos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'HABILITADO'),(2,'INHABILITADO'),(3,'POR PAGAR'),(4,'PAGADO');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fecha`
--

LOCK TABLES `fecha` WRITE;
/*!40000 ALTER TABLE `fecha` DISABLE KEYS */;
INSERT INTO `fecha` VALUES (136,'2019-06-22 00:28:13','2019-06-22 00:28:13'),(137,'2019-06-22 00:29:07','2019-06-22 00:29:07'),(138,'2019-06-22 00:31:12','2019-06-22 00:31:12'),(139,'2019-06-22 00:55:58','2019-06-22 00:55:58'),(140,'2019-06-22 06:45:34','2019-06-22 06:45:34'),(141,'2019-06-22 09:19:17','2019-06-22 09:19:17'),(142,'2019-06-22 09:31:22','2019-06-22 09:31:22'),(143,'2019-06-22 12:30:00','2019-06-22 09:34:02'),(144,'2019-06-22 13:00:00','2019-06-22 09:34:02'),(145,'2019-06-22 13:25:00','2019-06-22 09:35:12'),(146,'2019-06-22 13:55:00','2019-06-22 09:35:12'),(147,'2019-06-22 14:15:00','2019-06-22 09:48:44'),(148,'2019-06-22 14:45:00','2019-06-22 09:48:44'),(149,'2019-06-22 15:01:00','2019-06-22 09:53:20'),(150,'2019-06-22 15:31:00','2019-06-22 09:53:20'),(151,'2019-09-25 11:06:00','2019-06-22 10:52:39'),(152,'2019-09-25 11:36:00','2019-06-22 10:52:39'),(153,'2019-05-23 00:00:00','2019-06-22 11:27:35'),(154,'2019-05-23 00:30:00','2019-06-22 11:27:35'),(155,'2019-01-12 00:00:00','2019-06-22 11:55:19'),(156,'2019-01-12 00:30:00','2019-06-22 11:55:19'),(157,'2019-01-05 00:00:00','2019-06-22 12:07:07'),(158,'2019-01-05 00:30:00','2019-06-22 12:07:07'),(159,'2019-01-06 00:00:00','2019-06-22 12:41:42'),(160,'2019-01-06 00:30:00','2019-06-22 12:41:42'),(161,'2019-01-21 00:00:00','2019-06-22 12:55:50'),(162,'2019-01-21 00:30:00','2019-06-22 12:55:50'),(163,'2019-01-03 00:00:00','2019-06-22 13:18:03'),(164,'2019-01-03 00:30:00','2019-06-22 13:18:03'),(165,'2019-01-07 00:00:00','2019-06-22 13:56:15'),(166,'2019-01-07 00:30:00','2019-06-22 13:56:16'),(167,'2019-01-07 00:00:00','2019-06-22 13:56:55'),(168,'2019-01-07 00:30:00','2019-06-22 13:56:55'),(169,'2019-01-15 00:00:00','2019-06-22 14:01:05'),(170,'2019-01-15 00:30:00','2019-06-22 14:01:05'),(171,'2019-06-22 14:27:10','2019-06-22 14:27:10'),(172,'2019-06-14 00:00:00','2019-06-22 14:29:46'),(173,'2019-06-14 00:30:00','2019-06-22 14:29:46'),(174,'2019-06-23 18:06:09','2019-06-23 18:06:09'),(175,'2019-06-23 19:11:59','2019-06-23 19:11:59'),(176,'2019-06-23 19:16:17','2019-06-23 19:16:17'),(177,'2019-06-23 19:19:27','2019-06-23 19:19:27'),(178,'2019-06-23 19:19:54','2019-06-23 19:19:54'),(179,'2019-06-23 19:20:28','2019-06-23 19:20:28'),(180,'2019-06-23 19:25:45','2019-06-23 19:25:45'),(181,'2019-06-23 19:26:26','2019-06-23 19:26:26'),(182,'2019-06-23 19:26:51','2019-06-23 19:26:51'),(183,'2019-06-23 19:32:59','2019-06-23 19:32:59'),(184,'2019-06-23 19:41:04','2019-06-23 19:41:04'),(185,'2019-06-23 19:44:37','2019-06-23 19:44:37'),(186,'2019-06-23 19:49:04','2019-06-23 19:49:04'),(187,'2019-06-24 01:07:44','2019-06-24 01:07:44'),(188,'2019-06-24 01:08:22','2019-06-24 01:08:22'),(189,'2019-06-24 01:08:36','2019-06-24 01:08:36'),(190,'2019-06-24 01:09:11','2019-06-24 01:09:11'),(191,'2019-06-24 01:09:42','2019-06-24 01:09:42'),(192,'2019-06-24 01:09:46','2019-06-24 01:09:46'),(193,'2019-06-24 01:18:14','2019-06-24 01:18:14'),(194,'2019-06-24 01:18:55','2019-06-24 01:18:55'),(195,'2019-06-24 02:02:17','2019-06-24 02:02:17'),(196,'2019-06-24 03:08:14','2019-06-24 03:08:14'),(197,'2019-06-24 03:11:20','2019-06-24 03:11:20'),(198,'2019-06-24 03:30:54','2019-06-24 03:30:54'),(199,'2019-06-24 03:37:07','2019-06-24 03:37:07'),(200,'2019-06-24 03:38:32','2019-06-24 03:38:32'),(201,'2019-06-24 03:49:04','2019-06-24 03:49:04'),(202,'2019-06-24 03:51:48','2019-06-24 03:51:48'),(203,'2019-06-24 04:00:23','2019-06-24 04:00:23'),(204,'2019-06-24 04:11:34','2019-06-24 04:11:34'),(205,'2019-06-24 04:14:54','2019-06-24 04:14:54'),(206,'2019-06-24 04:52:38','2019-06-24 04:52:38'),(207,'2019-06-24 04:53:53','2019-06-24 04:53:53'),(208,'2019-06-24 04:54:38','2019-06-24 04:54:38'),(209,'2019-06-24 05:07:15','2019-06-24 05:07:15'),(210,'2019-06-24 05:07:44','2019-06-24 05:07:44'),(211,'2019-06-24 05:11:40','2019-06-24 05:11:40'),(212,'2019-06-24 05:16:52','2019-06-24 05:16:52'),(213,'2019-06-24 05:26:32','2019-06-24 05:26:32'),(214,'2019-06-24 05:27:01','2019-06-24 05:27:01'),(215,'2019-06-24 05:37:37','2019-06-24 05:37:37'),(216,'2019-06-24 05:41:23','2019-06-24 05:41:23'),(217,'2019-06-24 05:44:48','2019-06-24 05:44:48'),(218,'2019-06-24 05:51:41','2019-06-24 05:51:41'),(219,'2019-06-24 05:56:17','2019-06-24 05:56:17'),(220,'2019-06-24 05:57:02','2019-06-24 05:57:02'),(221,'2019-06-24 05:58:31','2019-06-24 05:58:31'),(222,'2019-06-24 05:59:21','2019-06-24 05:59:21'),(223,'2019-06-24 06:04:29','2019-06-24 06:04:29'),(224,'2019-06-24 06:07:20','2019-06-24 06:07:20'),(225,'2019-06-24 06:09:14','2019-06-24 06:09:14'),(226,'2019-06-24 06:11:25','2019-06-24 06:11:25'),(227,'2019-06-24 08:29:42','2019-06-24 08:29:42'),(228,'2019-06-24 08:50:41','2019-06-24 08:50:41'),(229,'2019-06-24 08:53:18','2019-06-24 08:53:18'),(230,'2019-01-11 00:00:00','2019-06-24 14:30:53'),(231,'2019-01-11 00:30:00','2019-06-24 14:30:53'),(232,'2019-06-24 14:52:45','2019-06-24 14:52:45'),(233,'2019-06-27 20:18:10','2019-06-27 20:18:10'),(234,'2021-05-03 01:00:45','2021-05-03 01:00:45'),(235,'2021-05-03 01:00:45','2021-05-03 01:00:45'),(236,'2021-05-03 01:00:56','2021-05-03 01:00:56'),(237,'2021-05-03 01:00:56','2021-05-03 01:00:56'),(238,'2021-05-02 20:05:59','2021-05-02 20:05:59');
/*!40000 ALTER TABLE `fecha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `barbero`
--

LOCK TABLES `barbero` WRITE;
/*!40000 ALTER TABLE `barbero` DISABLE KEYS */;
INSERT INTO `barbero` VALUES (8,'B0001',48,1,49,138);
/*!40000 ALTER TABLE `barbero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (40,'C0001',49,'12345678',1,48,140),(43,'C0043',52,'46759382',1,0,234),(44,'C0044',53,'12345678',1,2,238);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `marca_producto`
--

LOCK TABLES `marca_producto` WRITE;
/*!40000 ALTER TABLE `marca_producto` DISABLE KEYS */;
INSERT INTO `marca_producto` VALUES (13,'M0001','EURO STIL',1),(14,'M0001','CHARLES',1),(15,'M0001','CREW MEN',1),(16,'M0001','OMEN',1);
/*!40000 ALTER TABLE `marca_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tipo_producto`
--

LOCK TABLES `tipo_producto` WRITE;
/*!40000 ALTER TABLE `tipo_producto` DISABLE KEYS */;
INSERT INTO `tipo_producto` VALUES (8,1,'GEL'),(9,1,'SHAMPOO'),(10,1,'LACA'),(11,1,'PERFUME');
/*!40000 ALTER TABLE `tipo_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (11,'P0001',16,8,'DURAGEL MAX',1,128,25,'TE LO DEJA TIEZO, COMO ERIZO!',48,188),(12,'P0138',14,9,'PROTECTOR ANTICASPA',1,133,30,'EL MEJOR ALIADO CONTRA LA CASPA',48,187);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
INSERT INTO `servicio` VALUES (16,'S0001','CORTE MAS LAVADO',1,30,30,'CORTE MAS LAVADO',49,139);
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
INSERT INTO `reserva` VALUES (16,'R0001',4,40,8,143,16,144),(17,'R0147',4,40,8,145,16,146),(20,'R0153',4,42,8,151,16,152),(23,'R0159',4,42,8,157,16,158),(24,'R0161',4,42,8,159,16,160),(25,'R0163',4,42,8,161,16,162),(26,'R0165',3,42,8,163,16,NULL),(27,'R0167',3,42,8,NULL,16,166),(29,'R0171',3,42,8,169,16,NULL),(30,'R0232',4,42,8,230,16,231);
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (4,'V0001',40,4,186),(9,'V0005',40,4,193),(11,'V0010',40,4,195),(12,'V0012',40,4,196),(13,'V0013',42,4,197),(14,'V0014',42,4,198),(16,'V0015',42,4,200),(17,'V0017',42,4,201),(18,'V0018',42,4,202),(19,'V0019',42,4,203),(20,'V0020',42,4,204),(21,'V0021',42,4,205),(22,'V0022',42,4,206),(23,'V0023',42,4,207),(24,'V0024',42,4,208),(26,'V0025',42,4,210),(27,'V0027',42,4,211),(28,'V0028',42,4,212),(30,'V0029',42,4,214),(31,'V0031',42,4,215),(32,'V0032',42,4,216),(34,'V0033',42,4,218),(35,'V0035',42,4,219),(36,'V0036',42,4,220),(37,'V0037',42,4,221),(39,'V0038',42,4,223),(40,'V0040',42,4,224),(41,'V0041',42,4,225),(42,'V0042',42,4,226),(43,'V0043',42,4,227),(44,'V0044',42,4,228),(45,'V0045',42,4,229),(46,'V0046',42,4,232);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `detalle_venta`
--

LOCK TABLES `detalle_venta` WRITE;
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
INSERT INTO `detalle_venta` VALUES (14,'D0001',4,4,12,1,1,30),(15,'D0015',9,4,11,3,0.97,72.75),(16,'D0016',9,4,12,3,0.97,87.3),(19,'D0017',11,4,12,5,0.95,142.5),(20,'D0020',11,4,12,8,0.9,216),(21,'D0021',11,4,11,8,0.9,180),(22,'D0022',12,4,12,11,0.85,280.5),(23,'D0023',12,4,11,11,0.85,233.75),(24,'D0024',13,4,12,5,0.95,142.5),(25,'D0025',13,4,11,11,0.85,233.75),(26,'D0026',14,4,11,15,0.85,318.75),(27,'D0027',14,4,12,12,0.85,306),(30,'D0028',16,4,11,1,1,25),(31,'D0031',16,4,12,1,1,30),(32,'D0032',17,4,11,1,1,25),(33,'D0033',17,4,12,1,1,30),(34,'D0034',18,4,12,1,1,30),(35,'D0035',18,4,11,1,1,25),(36,'D0036',19,4,11,1,1,25),(37,'D0037',20,4,11,12,0.85,255),(38,'D0038',20,4,12,13,0.85,331.5),(39,'D0039',21,4,12,1,1,30),(40,'D0040',21,4,11,1,1,25),(41,'D0041',22,4,11,1,1,25),(42,'D0042',22,4,12,1,1,30),(43,'D0043',23,4,12,1,1,30),(44,'D0044',23,4,11,1,1,25),(45,'D0045',24,4,12,1,1,30),(46,'D0046',24,4,11,1,1,25),(49,'D0047',26,4,11,1,1,25),(50,'D0050',26,4,12,1,1,30),(51,'D0051',27,4,11,1,1,25),(52,'D0052',27,4,12,1,1,30),(53,'D0053',28,4,11,1,1,25),(54,'D0054',28,4,12,1,1,30),(57,'D0055',30,4,11,1,1,25),(58,'D0058',30,4,12,1,1,30),(59,'D0059',31,4,11,1,1,25),(60,'D0060',31,4,12,1,1,30),(61,'D0061',32,4,11,1,1,25),(62,'D0062',32,4,12,1,1,30),(63,'D0063',32,4,11,1,1,25),(64,'D0064',32,4,11,1,1,25),(65,'D0065',32,4,12,1,1,30),(66,'D0066',32,4,11,1,1,25),(83,'D0067',34,4,11,1,1,25),(84,'D0084',35,4,11,1,1,25),(85,'D0085',35,4,12,1,1,30),(86,'D0086',35,4,11,1,1,25),(87,'D0087',35,4,12,1,1,30),(88,'D0088',36,4,11,1,1,25),(89,'D0089',36,4,12,1,1,30),(90,'D0090',37,4,11,1,1,25),(91,'D0091',37,4,12,1,1,30),(92,'D0092',37,4,12,1,1,30),(93,'D0093',37,4,11,1,1,25),(94,'D0094',37,4,12,1,1,30),(95,'D0095',37,4,11,1,1,25),(96,'D0096',37,4,12,1,1,30),(97,'D0097',37,4,11,1,1,25),(102,'D0098',39,4,12,1,1,30),(103,'D0103',39,4,11,1,1,25),(104,'D0104',39,4,12,1,1,30),(105,'D0105',39,4,11,1,1,25),(106,'D0106',39,4,11,1,1,25),(107,'D0107',39,4,12,1,1,30),(108,'D0108',39,4,12,1,1,30),(109,'D0109',39,4,12,1,1,30),(110,'D0110',39,4,12,1,1,30),(111,'D0111',39,4,12,1,1,30),(112,'D0112',39,4,11,1,1,25),(113,'D0113',39,4,11,1,1,25),(114,'D0114',39,4,12,1,1,30),(115,'D0115',39,4,11,1,1,25),(116,'D0116',39,4,12,1,1,30),(117,'D0117',39,4,11,1,1,25),(118,'D0118',39,4,12,1,1,30),(119,'D0119',40,4,11,1,1,25),(120,'D0120',40,4,11,1,1,25),(121,'D0121',40,4,12,1,1,30),(122,'D0122',40,4,12,1,1,30),(123,'D0123',40,4,11,1,1,25),(124,'D0124',40,4,12,1,1,30),(125,'D0125',40,4,11,1,1,25),(126,'D0126',41,4,11,1,1,25),(127,'D0127',41,4,12,1,1,30),(128,'D0128',42,4,11,0,1,0),(129,'D0129',42,4,12,0,1,0),(130,'D0130',43,4,11,0,1,0),(131,'D0131',43,4,11,1,1,25),(132,'D0132',43,4,12,2,0.97,58.199999999999996),(133,'D0133',44,4,11,1,1,25),(134,'D0134',44,4,12,2,0.97,58.199999999999996),(136,'D0136',45,4,11,1,1,25),(137,'D0137',45,4,12,1,1,30),(140,'D0138',45,4,11,1,1,25),(142,'D0142',46,4,11,1,1,25),(144,'D0144',46,4,11,1,1,25),(146,'D0146',46,4,11,1,1,25);
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'barberia'
--

--
-- Dumping routines for database 'barberia'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp.Actualizar_Barbero` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Actualizar_Barbero`(
in
		P_idBarbero int,
        P_idEstado int,
		P_nombre varchar(40),
        P_apellido varchar(40),
        P_telefono char(9),
		P_DNI char(8),
		P_correo char(45),
        P_direccion char(100),
        P_usuario INT
)
BEGIN

DECLARE V_COUNT INT;
DECLARE V_IDFECHA INT;
DECLARE V_DETFECHA DATETIME;
DECLARE V_IDDATOS INT;

SET V_DETFECHA := CURTIME();

SELECT COUNT(*) INTO V_COUNT FROM datos d
join cliente c on d.iddatos = c.iddatos
WHERE DNI = P_DNI;

IF V_COUNT = 0 THEN 

SELECT idDatos into V_IDDATOS FROM datos WHERE DNI = P_DNI; 

INSERT INTO fecha (DETFECHA, REGISTERED) VALUES ( V_DETFECHA, CURTIME() );
SELECT IDFECHA INTO V_IDFECHA FROM fecha WHERE DETFECHA = V_DETFECHA;

UPDATE datos 

SET		nombre = UPPER(P_nombre), 
		apellido = UPPER(P_apellido), 
		telefono = P_telefono, 
        dni = P_DNI, 
		correo = P_correo, 
        direccion = UPPER(P_direccion)
    
WHERE idDatos = V_IDDATOS; 

UPDATE Barbero

SET idEstado = P_idEstado, modifiedBy = P_usuario, DATEUPDATED = V_IDFECHA

WHERE idBarbero = P_IDBarbero;

SELECT COUNT(*) INTO V_COUNT FROM datos d
join barbero c on d.iddatos = c.iddatos
WHERE DNI = P_DNI;

IF V_COUNT = 1 THEN 

SELECT CONCAT(MENSAJE,'') AS mensaje FROM mensaje WHERE IDMENSAJE = 3;
COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE, ' POSIBLEMENTE SE TRATE DE UN REGISTRO DUPLICADO') AS mensaje FROM mensaje WHERE IDMENSAJE = 4;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Actualizar_Cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Actualizar_Cliente`(
in
		P_idCliente int,
        P_idEstado int,
		P_nombre varchar(40),
        P_apellido varchar(40),
        P_telefono char(9),
		P_DNI char(8),
		P_correo char(45),
        P_direccion char(100),
        P_usuario INT
)
BEGIN

DECLARE V_COUNT INT;
DECLARE V_IDFECHA INT;
DECLARE V_DETFECHA DATETIME;
DECLARE V_IDDATOS INT;

SET V_DETFECHA := CURTIME();

SELECT COUNT(*) INTO V_COUNT FROM datos WHERE DNI = P_DNI;

SELECT COUNT(*) INTO V_COUNT FROM datos d
join barbero c on d.iddatos = c.iddatos
WHERE DNI = P_DNI;

IF V_COUNT = 0 THEN 

SELECT idDatos into V_IDDATOS FROM datos WHERE DNI = P_DNI; 

INSERT INTO fecha (DETFECHA, REGISTERED) VALUES ( V_DETFECHA, CURTIME() );
SELECT IDFECHA INTO V_IDFECHA FROM fecha WHERE DETFECHA = V_DETFECHA;

UPDATE datos 

SET		
		nombre = UPPER(P_nombre), 
		apellido = UPPER(P_apellido), 
		telefono = P_telefono,
		correo = P_correo, 
        direccion = UPPER(P_direccion)
    
WHERE idDatos = V_IDDATOS; 

UPDATE Cliente

SET idEstado = P_idEstado, modifiedBy = P_usuario, DATEUPDATED = V_IDFECHA

WHERE idCliente = P_idCliente;

SELECT COUNT(*) INTO V_COUNT FROM datos d
join cliente c on d.iddatos = c.iddatos
WHERE DNI = P_DNI;

IF V_COUNT = 1 THEN 

SELECT CONCAT(MENSAJE,'') AS mensaje FROM mensaje WHERE IDMENSAJE = 3;
COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE, ' POSIBLEMENTE SE TRATE DE UN REGISTRO DUPLICADO') AS mensaje FROM mensaje WHERE IDMENSAJE = 4;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Actualizar_Detalle_Venta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Actualizar_Detalle_Venta`(

    IN
    
    P_idDetalle_Venta int,
	P_stock int,
	P_precio double,    
    P_cantidad int,
	P_descuento double,
	P_subTotal double
        
)
BEGIN
	DECLARE V_COUNT INT; 
    
if P_cantidad > P_stock then
SELECT CONCAT(MENSAJE,', NO HAY STOCK DISPONIBLE.') AS mensaje FROM mensaje WHERE IDMENSAJE = 2;
else

SELECT COUNT(*) INTO V_COUNT FROM detalle_venta WHERE idEstado = 3 AND idDetalle_Venta = P_idDetalle_Venta;

IF V_COUNT = 1 THEN 


	if P_Cantidad >= 2 and P_Cantidad <= 3 then
		set P_descuento = 0.97;
	elseif P_Cantidad >= 4 and P_Cantidad <= 6 then
		set P_descuento = 0.95;
	elseif P_Cantidad >= 7 and P_Cantidad <= 10 then
		set P_descuento = 0.9;
	elseif P_Cantidad >= 11 and P_Cantidad <= 15 then
		set P_descuento = 0.85;
	else 
		set P_descuento := 1;
    end if;
    
    set P_subTotal := P_descuento*(P_Cantidad*P_PRECIO);
	    
UPDATE detalle_venta 
SET 
cantidad = P_cantidad, 
descuento = P_descuento,
subTotal = P_subTotal
WHERE idEstado = 3 and idDetalle_Venta = P_idDetalle_Venta;

SELECT COUNT(*) INTO V_COUNT FROM detalle_venta WHERE idVenta = P_idVenta and idDetalle_Venta = P_idDetalle_Venta AND cantidad = P_cantidad;

IF V_COUNT = 1 THEN 

SELECT CONCAT((SELECT mensaje FROM mensaje WHERE idMensaje = 3), ': ', desEstado) as MENSAJE
FROM detalle_venta v
join estado e on v.idEstado = e.idEstado
WHERE idVenta = P_idVenta and idDetalle_Venta = P_idDetalle_Venta;

COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE,', NO SE PUDO CAMBIAR LA CANTIDAD.') AS mensaje FROM mensaje WHERE IDMENSAJE = 2;
end if;
END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Actualizar_Marca_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Actualizar_Marca_Producto`(
in
	P_idMarcaProducto int,
    P_nombMarca varchar(30),
    P_idEstado int    
)
BEGIN

DECLARE V_COUNT INT;

SELECT COUNT(*) INTO V_COUNT FROM marca_producto WHERE idMarcaProducto = P_idMarcaProducto;

IF V_COUNT = 1 THEN  

UPDATE marca_producto 

SET nombMarca = UPPER(P_nombMarca),
    idEstado = P_idEstado
    
WHERE idMarcaProducto = P_idMarcaProducto; 

SELECT COUNT(*) INTO V_COUNT FROM marca_producto WHERE nombMarca = UPPER(P_nombMarca);

IF V_COUNT = 1 THEN 

SELECT CONCAT(MENSAJE,'') AS mensaje FROM mensaje WHERE IDMENSAJE = 3;
COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE) AS mensaje FROM mensaje WHERE IDMENSAJE = 4;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Actualizar_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Actualizar_Producto`(
in
	P_idProducto int,
    P_marca int,
    P_tipo int,
	P_nomProd varchar(40),
    P_estado int,
    P_stock int,
    P_precio double,
    P_descripcion varchar(200),
    P_usuario int
)
BEGIN

DECLARE V_COUNT INT;
DECLARE V_IDFECHA INT;
DECLARE V_DETFECHA DATETIME;

SET V_DETFECHA := CURTIME();

SELECT COUNT(*) INTO V_COUNT FROM producto WHERE idProducto = P_idProducto;

IF V_COUNT = 1 THEN 

INSERT INTO fecha (DETFECHA, REGISTERED) VALUES ( V_DETFECHA, CURTIME() );
SELECT IDFECHA INTO V_IDFECHA FROM fecha WHERE DETFECHA = V_DETFECHA;

UPDATE producto 

SET idMarcaProducto = P_marca,
    idTipo_producto = P_tipo,
	nomProd = UPPER(P_nomProd),
    stock = P_stock,
    precio = P_precio,
    descripcion = UPPER(P_descripcion),
    modifiedBy = P_usuario, DATEUPDATED = V_IDFECHA
    
WHERE idProducto = P_idProducto; 

SELECT COUNT(*) INTO V_COUNT FROM producto WHERE nomProd = UPPER(P_nomProd);

IF V_COUNT = 1 THEN 

SELECT CONCAT(MENSAJE,'') AS mensaje FROM mensaje WHERE IDMENSAJE = 3;
COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE) AS mensaje FROM mensaje WHERE IDMENSAJE = 4;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Actualizar_Servicio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Actualizar_Servicio`(
in
	P_idServicio int,
	P_nomServ varchar(40),
    P_estado int,
    P_minutos int,
    P_precio double,
    P_descripcion varchar(200),
    P_usuario int
    
)
BEGIN

DECLARE V_COUNT INT;
DECLARE V_IDFECHA INT;
DECLARE V_DETFECHA DATETIME;

SET V_DETFECHA := CURTIME();

SELECT COUNT(*) INTO V_COUNT FROM servicio WHERE idServicio = P_idServicio;

IF V_COUNT = 1 THEN 

INSERT INTO fecha (DETFECHA, REGISTERED) VALUES ( V_DETFECHA, CURTIME() );
SELECT IDFECHA INTO V_IDFECHA FROM fecha WHERE DETFECHA = V_DETFECHA;

UPDATE servicio 

SET 
	nomServ = UPPER(P_nomServ),
    idestado = P_estado,
    minutos = P_minutos,
    precio = P_precio,
    descripcion = UPPER(P_descripcion),
    modifiedBy = P_usuario, DATEUPDATED = V_IDFECHA
    
WHERE idServicio = P_idServicio; 

SELECT COUNT(*) INTO V_COUNT FROM servicio WHERE nomServ = UPPER(P_nomServ);

IF V_COUNT = 1 THEN 

SELECT CONCAT(MENSAJE,'') AS mensaje FROM mensaje WHERE IDMENSAJE = 3;
COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE) AS mensaje FROM mensaje WHERE IDMENSAJE = 4;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Actualizar_Tipo_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Actualizar_Tipo_Producto`(
in
	P_idTipo_producto int,
    P_detalle varchar(30),
    P_idEstado int    
)
BEGIN

DECLARE V_COUNT INT;

SELECT COUNT(*) INTO V_COUNT FROM tipo_producto WHERE idTipo_producto = P_idTipo_producto;

IF V_COUNT = 1 THEN  

UPDATE tipo_producto 

SET 
	detalle = UPPER(P_detalle),
    idEstado = P_idEstado
    
WHERE idTipo_producto = P_idTipo_producto;

SELECT COUNT(*) INTO V_COUNT FROM tipo_producto WHERE idTipo_producto = P_idTipo_producto AND detalle = UPPER(P_detalle);

IF V_COUNT = 1 THEN 

SELECT CONCAT(MENSAJE,'') AS mensaje FROM mensaje WHERE IDMENSAJE = 3;
COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE) AS mensaje FROM mensaje WHERE IDMENSAJE = 4;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Actualizar_Usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Actualizar_Usuario`(
in
	P_idUsuario int,
	P_nombre varchar(40),
    P_apellido varchar(40),
    P_cargo varchar(20),
    p_aka varchar(9),
    P_correo varchar(45),    
    P_telefono char(9),
    P_descripcion varchar(100)
)
BEGIN

DECLARE V_COUNT INT;

SELECT COUNT(*) INTO V_COUNT FROM usuario WHERE idUsuario = P_idUsuario;

IF V_COUNT = 1 THEN 

UPDATE usuario 

SET nombre = UPPER(P_nombre),
    apellido = UPPER(P_apellido),
	aka =  UPPER(p_aka),
    correo = P_correo,
    telefono = P_telefono,
    descripcion = UPPER(P_descripcion)
    
WHERE idUsuario = P_idUsuario; 

SELECT COUNT(*) INTO V_COUNT FROM usuario WHERE idusuario = P_idUsuario;

IF V_COUNT = 1 THEN 

SELECT CONCAT(MENSAJE,'') AS mensaje FROM mensaje WHERE IDMENSAJE = 3;
COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE) AS mensaje FROM mensaje WHERE IDMENSAJE = 4;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Buscar_Barbero` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Buscar_Barbero`(
in P_words varchar(20),
out P_idBarb int
)
BEGIN

DECLARE V_COUNT INT;

SELECT COUNT(*) INTO V_COUNT FROM barbero c
join datos d on c.idDatos = d.idDatos
join estado e on c.idestado = e.idEstado
where nombre like concat ('%',P_words,'%') or apellido like concat ('%',P_words,'%') or c.codBarbero like concat ('%',P_words,'%');

IF V_COUNT > 0 THEN 

IF V_COUNT = 1 THEN 
SELECT idBarbero into P_idBarb FROM barbero c
join datos d on c.idDatos = d.idDatos
join estado e on c.idestado = e.idEstado
where nombre like concat ('%',P_words,'%') or apellido like concat ('%',P_words,'%') or c.codBarbero like concat ('%',P_words,'%');
else
set P_idBarb := 0;
end if;

SELECT 

	idBarbero,
	concat(d.nombre,' ',d.apellido)
	as 'Nombre del Barbero',
	desEstado as Estado,      
    telefono as Celular,
    correo as 'Email',
    dni as DNI,
    direccion as Direccion
    
FROM barbero c
join datos d on c.idDatos = d.idDatos
join estado e on c.idestado = e.idEstado

where nombre like concat ('%',P_words,'%') or apellido like concat ('%',P_words,'%') or c.codBarbero like concat ('%',P_words,'%');

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Buscar_Barbero_Interno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Buscar_Barbero_Interno`(
in P_words varchar(20),
out P_idBarbero int
)
BEGIN

DECLARE V_COUNT INT;

SELECT COUNT(*) INTO V_COUNT
FROM barbero c
join datos d on c.idDatos = d.idDatos
where d.nombre like concat ('%',P_words,'%') or d.apellido like concat ('%',P_words,'%') or c.codBarbero like concat ('%',P_words,'%');

IF V_COUNT > 0 THEN 

IF V_COUNT = 1 THEN
SELECT c.idBarbero INTO P_idBarbero FROM barbero c join datos d on c.idDatos = d.idDatos
where d.nombre like concat ('%',P_words,'%') or d.apellido like concat ('%',P_words,'%') or c.codBarbero like concat ('%',P_words,'%');
ELSE
SET P_idBarbero = 0;
END IF;

SELECT 

	c.idBarbero,
    c.codBarbero as Codigo,
	concat(d.nombre,' ',d.apellido)	as 'Nombre_del_Barbero',
	e.desEstado as Estado,      
    d.telefono as Celular,
	dni as DNI,
    d.correo as 'Email',
    direccion as Direccion,
    u.aka as 'Modificado_Por',
    f.detFecha as 'Ultima_Modificacion'
    
FROM barbero c
join datos d on c.idDatos = d.idDatos
join usuario u on c.modifiedBy = u.idUsuario
join fecha f on c.dateUpdated = f.idFecha
join estado e on c.idestado = e.idEstado

where d.nombre like concat ('%',P_words,'%') or d.apellido like concat ('%',P_words,'%') or c.codBarbero like concat ('%',P_words,'%');

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Buscar_Cliente_Interno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Buscar_Cliente_Interno`(
in P_words varchar(20),
out P_ID int
)
BEGIN

DECLARE V_COUNT INT;

SELECT COUNT(*) INTO V_COUNT FROM cliente c join datos d on c.idDatos = d.idDatos where d.nombre like concat ('%',P_words,'%') or d.apellido like concat ('%',P_words,'%') or codCliente like concat ('%',P_words,'%');

IF V_COUNT > 0 THEN 

if V_COUNT = 1 then
SELECT c.idCliente into P_ID
FROM cliente c
join datos d on c.idDatos = d.idDatos
where d.nombre like concat ('%',P_words,'%') or d.apellido like concat ('%',P_words,'%') or codCliente like concat ('%',P_words,'%');
else set P_ID := 0; end if;

SELECT 

	c.idCliente,
    c.codCliente as Codigo,
	concat(d.nombre,' ',d.apellido) as 'Nombre_del_Cliente',
	desEstado as Estado,     
    d.telefono as Celular,
    d.correo as 'E-mail',
    dni as DNI,
    direccion as Direccion,
    u.aka as 'Modificado_Por',
    f.detFecha as 'Ultima_Modificacion'
    
FROM cliente c
join datos d on c.idDatos = d.idDatos
join usuario u on c.modifiedBy = u.idUsuario
join fecha f on c.dateUpdated = f.idFecha
join estado e on c.idestado = e.idEstado

where d.nombre like concat ('%',P_words,'%') or d.apellido like concat ('%',P_words,'%') or codCliente like concat ('%',P_words,'%');

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Buscar_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Buscar_Producto`(
in P_words varchar(20),
OUT P_ID INT
)
BEGIN

DECLARE V_COUNT INT;

SELECT COUNT(*) INTO V_COUNT FROM producto p
join tipo_producto t on p.idTipo_producto = t.idTipo_producto
where nomProd like concat ('%',P_words,'%') or p.descripcion like concat ('%',P_words,'%') or codProducto like concat ('%',P_words,'%')
or p.idMarcaProducto like concat ('%',P_words,'%') or p.idTipo_producto like concat ('%',P_words,'%');

IF V_COUNT > 0 THEN 

IF V_COUNT = 1 THEN
SELECT  idProducto INTO P_ID
FROM producto p
join marca_producto m on p.idMarcaProducto = m.idMarcaProducto
join tipo_producto t on p.idTipo_producto = t.idTipo_producto
where nomProd like concat ('%',P_words,'%') or p.descripcion like concat ('%',P_words,'%') or codProducto like concat ('%',P_words,'%')
or p.idMarcaProducto like concat ('%',P_words,'%') or p.idTipo_producto like concat ('%',P_words,'%');
ELSE
SET P_ID = 0;
END IF;

SELECT 

    idProducto,
    detalle as Tipo,
    nomProd as Producto,
    nombMarca as Marca,
	desEstado as Estado,      
    stock as 'Cantidad_Disponible',
    precio as Precio,
    p.descripcion as Descripcion
    
FROM producto p

join estado e on p.idestado = e.idEstado
join marca_producto m on p.idMarcaProducto = m.idMarcaProducto
join tipo_producto t on p.idTipo_producto = t.idTipo_producto

where nomProd like concat ('%',P_words,'%') or p.descripcion like concat ('%',P_words,'%') or codProducto like concat ('%',P_words,'%')
or p.idMarcaProducto like concat ('%',P_words,'%') or p.idTipo_producto like concat ('%',P_words,'%');

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Buscar_Producto_Interno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Buscar_Producto_Interno`(
in P_words varchar(20),
OUT P_ID INT
)
BEGIN

DECLARE V_COUNT INT;

SELECT COUNT(*) INTO V_COUNT FROM producto p
join marca_producto m on p.idMarcaProducto = m.idMarcaProducto
join tipo_producto t on p.idTipo_producto = t.idTipo_producto
where nomProd like concat ('%',P_words,'%') or p.descripcion like concat ('%',P_words,'%') or codProducto like concat ('%',P_words,'%')
or p.idMarcaProducto like concat ('%',P_words,'%') or p.idTipo_producto like concat ('%',P_words,'%');

IF V_COUNT > 0 THEN 
IF V_COUNT = 1 THEN
SELECT  p.idProducto INTO P_ID
FROM producto p 
join marca_producto m on p.idMarcaProducto = m.idMarcaProducto
join tipo_producto t on p.idTipo_producto = t.idTipo_producto
where nomProd like concat ('%',P_words,'%') or p.descripcion like concat ('%',P_words,'%') or codProducto like concat ('%',P_words,'%')
or p.idMarcaProducto like concat ('%',P_words,'%') or p.idTipo_producto like concat ('%',P_words,'%');
ELSE SET P_ID := 0;  END IF;

SELECT 

	p.idProducto,
    codProducto as Codigo,
    detalle as Tipo,
    nomProd as Producto,
    nombMarca as Marca,
	desEstado as Estado,      
    stock as 'Cantidad_Disponible',
    precio as Precio,
    p.descripcion as Descripcion,
    aka as 'Modificado _por:',
	detFecha as 'Ultima_modificacion'
    
FROM producto p

Join usuario u on p.modifiedBy = u.idusuario
Join fecha f on p.dateUpdated = f.idfecha
join estado e on p.idestado = e.idEstado
join marca_producto m on p.idMarcaProducto = m.idMarcaProducto
join tipo_producto t on p.idTipo_producto = t.idTipo_producto

where nomProd like concat ('%',P_words,'%') or p.descripcion like concat ('%',P_words,'%') or codProducto like concat ('%',P_words,'%')
or p.idMarcaProducto like concat ('%',P_words,'%') or p.idTipo_producto like concat ('%',P_words,'%');

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Buscar_Servicio_Interno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Buscar_Servicio_Interno`(
in P_words varchar(20),
out P_idServicio int
)
BEGIN

DECLARE V_COUNT INT;

SELECT COUNT(*) INTO V_COUNT FROM servicio
where nomServ like concat ('%',P_words,'%') or descripcion like concat ('%',P_words,'%') or codServicio like concat ('%',P_words,'%');

IF V_COUNT > 0 THEN 

IF V_COUNT = 1 THEN 

SELECT 	idServicio into P_idServicio
FROM servicio 
where nomServ like concat ('%',P_words,'%') or descripcion like concat ('%',P_words,'%') or codServicio like concat ('%',P_words,'%');

else

set  P_idServicio := 0;

end if;

SELECT 

	s.idServicio,
    codServicio as Codigo,
    nomServ as Servicio,
	desEstado as Estado,      
    minutos as 'Duracion',
    precio as Precio,
    s.descripcion as Descripcion,
    aka as 'Modificado_por:',
	detFecha as 'Ultima_modificacion'

FROM servicio s
Join usuario u on s.modifiedBy = u.idusuario
Join fecha f on s.dateUpdated = f.idfecha
join estado e on s.idestado = e.idEstado

where nomServ like concat ('%',P_words,'%') or s.descripcion like concat ('%',P_words,'%') or codServicio like concat ('%',P_words,'%');

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Buscar_Usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Buscar_Usuario`(
in P_words varchar(20),
out P_id int
)
BEGIN

DECLARE V_COUNT INT;

SELECT COUNT(*) INTO V_COUNT FROM usuario where nombre like concat ('%',P_words,'%') or apellido like concat ('%',P_words,'%') or codUsuario like concat ('%',P_words,'%');

IF V_COUNT > 0 THEN 

IF V_COUNT = 1 THEN 
SELECT idUsuario into P_id FROM usuario where nombre like concat ('%',P_words,'%') or apellido like concat ('%',P_words,'%') or codUsuario like concat ('%',P_words,'%');
else set P_id := 0;
END IF;

SELECT 

	idUsuario,
    codUsuario,
	concat(c.nombre,' ',c.apellido)	as 'Nombre_del_Usuario',
    cargo,
    aka,
    correo as 'Email',
    telefono as Celular,
    descripcion as Descripcion
    
FROM usuario c

where nombre like concat ('%',P_words,'%') or apellido like concat ('%',P_words,'%') or codUsuario like concat ('%',P_words,'%');

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Cambiar_Clave_Cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Cambiar_Clave_Cliente`(
in
	P_idCliente int, p_pass char(8),
    p_newPass char(8) 
)
BEGIN

DECLARE V_COUNT INT;

SELECT COUNT(*) into V_COUNT FROM cliente WHERE idCliente = P_idCliente and pass = p_pass;

IF V_COUNT = 1 THEN 

UPDATE cliente SET pass = p_newPass WHERE idCliente = P_idCliente; 

SELECT COUNT(*) INTO V_COUNT FROM cliente WHERE idCliente = P_idCliente AND pass = p_newPass;

IF V_COUNT = 1 THEN 

SELECT CONCAT(MENSAJE,'') AS mensaje FROM mensaje WHERE IDMENSAJE = 13;
COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE) AS mensaje FROM mensaje WHERE IDMENSAJE = 4;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Cambiar_Clave_Usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Cambiar_Clave_Usuario`(
in
	P_idUsuario int,
    p_pass char(8),
    p_newPass char(8)
    
)
BEGIN

DECLARE V_COUNT INT;

SELECT COUNT(*) INTO V_COUNT FROM usuario WHERE idUsuario = P_idUsuario and pass = p_pass;

IF V_COUNT = 1 THEN 

UPDATE usuario 

SET pass = p_newPass
    
WHERE idUsuario = P_idUsuario; 

SELECT COUNT(*) INTO V_COUNT FROM usuario WHERE idUsuario = P_idUsuario AND pass = p_newPass;

IF V_COUNT = 1 THEN 

SELECT CONCAT(MENSAJE,'') AS mensaje FROM mensaje WHERE IDMENSAJE = 13;
COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE) AS mensaje FROM mensaje WHERE IDMENSAJE = 4;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Consultar_Disponibilidad_Barbero` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Consultar_Disponibilidad_Barbero`(

    IN P_idBarbero int,
    IN P_DTconsulta DATETIME,
    IN P_idServicio int
        
)
BEGIN

	DECLARE V_duracion INT;
    DECLARE V_Y VARCHAR (10);
    DECLARE V_A VARCHAR (100);
    DECLARE V_D VARCHAR (100);
	DECLARE V_COUNT_A INT;    
    DECLARE V_COUNT_D INT;    
    declare V_RESERVA INT;
    
    
    
-- ANTES

SELECT count(*) into V_COUNT_A FROM reserva r 
join fecha h ON r.idHoraIni = h.idFecha 
join fecha f ON r.idHoraFin = f.idFecha
join servicio s ON r.idServicio = s.idServicio
where r.idServicio = 1 AND CAST(ADDTIME(CAST(P_DTconsulta AS DATETIME), concat('00:',minutos,':00')) AS DATETIME) between h.detfecha and f.detFecha and idBarbero = P_idBarbero;

-- DURANTE

SELECT count(*) into V_COUNT_D FROM reserva r 
join fecha h ON r.idHoraIni = h.idFecha 
join fecha f ON r.idHoraFin = f.idFecha
where CAST(P_DTconsulta AS DATETIME) between h.detfecha and f.detFecha and idBarbero = P_idBarbero;

IF V_COUNT_A = 1 OR V_COUNT_D = 1 THEN 

IF V_COUNT_A = 1 AND V_COUNT_D = 1 THEN

SET V_Y := ' Y ';

ELSE

SET V_Y := '';

END IF;

IF V_COUNT_A = 1 THEN 

SELECT r.idReserva into V_RESERVA FROM reserva r 
join fecha h ON r.idHoraIni = h.idFecha 
join fecha f ON r.idHoraFin = f.idFecha
join servicio s ON r.idServicio = s.idServicio
where r.idServicio = P_idServicio AND CAST(ADDTIME(CAST(P_DTconsulta AS DATETIME), concat('00:',minutos,':00')) AS DATETIME) between h.detfecha and f.detFecha and idBarbero = P_idBarbero;

SELECT CONCAT(
' ENTRE LAS: ', h.detFecha, ' Y ', f.detFecha, ' '
) into V_A FROM reserva r
join fecha h ON r.idHoraIni = h.idFecha 
join fecha f ON r.idHoraFin = f.idFecha
join servicio s ON r.idServicio = s.idServicio
where r.idServicio = P_idServicio AND CAST(ADDTIME(CAST(P_DTconsulta AS DATETIME), concat('00:',minutos,':00')) AS DATETIME) between h.detfecha and f.detFecha and idBarbero = P_idBarbero;

else

set V_A := '';

END IF;

IF V_COUNT_D = 1 THEN 

SELECT r.idReserva into V_RESERVA FROM reserva r 
join fecha h ON r.idHoraIni = h.idFecha 
join fecha f ON r.idHoraFin = f.idFecha
where CAST(P_DTconsulta AS DATETIME) between h.detfecha and f.detFecha and idBarbero = P_idBarbero;

SELECT CONCAT(
' ENTRE LAS: ', h.detFecha, ' Y ', f.detFecha, ' '
) into V_D FROM reserva r
join fecha h ON r.idHoraIni = h.idFecha 
join fecha f ON r.idHoraFin = f.idFecha
where CAST(P_DTconsulta AS DATETIME) between h.detfecha and f.detFecha and idBarbero = P_idBarbero;

else

set V_D := '';

END IF;

SELECT CONCAT(MENSAJE,'. BARBERO: ', (SELECT CONCAT(NOMBRE, ' ', APELLIDO) FROM barbero B JOIN datos D ON B.IDDATOS = D.IDDATOS where IDBARBERO = P_idBarbero), V_A, V_Y, V_D) AS mensaje FROM mensaje WHERE IDMENSAJE = 15;

ELSE

SELECT CONCAT(MENSAJE,'. BARBERO: ', (SELECT CONCAT(NOMBRE, ' ', APELLIDO) FROM barbero B JOIN datos D ON B.IDDATOS = D.IDDATOS where IDBARBERO = P_idBarbero)) AS mensaje FROM mensaje WHERE IDMENSAJE = 7;

END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Eliminar_Barbero` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Eliminar_Barbero`(
in
		P_idBarbero int
)
BEGIN

DECLARE V_COUNT INT;
DECLARE V_IDDATOS INT;

SELECT COUNT(*) INTO V_COUNT FROM barbero WHERE idBarbero = P_idBarbero;

IF V_COUNT = 1 THEN 

SELECT d.idDatos into V_IDDATOS FROM barbero B
Join datos d on B.idDatos = d.idDatos
WHERE idBarbero = P_idBarbero;

DELETE FROM barbero WHERE idBarbero = P_idBarbero;
DELETE FROM datos WHERE idDatos = V_IDDATOS; 

SELECT COUNT(*) INTO V_COUNT FROM datos WHERE idDatos = V_IDDATOS; 

IF V_COUNT = 0 THEN 

SELECT CONCAT(MENSAJE,'') AS mensaje FROM mensaje WHERE IDMENSAJE = 5;
COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE,'') AS mensaje FROM mensaje WHERE IDMENSAJE = 6;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Eliminar_Cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Eliminar_Cliente`(
in
		P_idCliente int
)
BEGIN

DECLARE V_COUNT INT;
DECLARE V_IDDATOS INT;

SELECT COUNT(*) INTO V_COUNT FROM cliente WHERE idCliente = P_idCliente;

IF V_COUNT = 1 THEN 

SELECT d.idDatos into V_IDDATOS FROM cliente B
Join datos d on B.idDatos = d.idDatos
WHERE idCliente = P_idCliente;

DELETE FROM cliente WHERE idCliente = P_idCliente;
DELETE FROM datos WHERE idDatos = V_IDDATOS; 

SELECT COUNT(*) INTO V_COUNT FROM datos WHERE idDatos = V_IDDATOS; 

IF V_COUNT = 0 THEN 

SELECT CONCAT(MENSAJE,'') AS mensaje FROM mensaje WHERE IDMENSAJE = 5;
COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE,'') AS mensaje FROM mensaje WHERE IDMENSAJE = 6;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Eliminar_Detalle_Venta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Eliminar_Detalle_Venta`(

IN P_idDetalle_Venta int

)
BEGIN

DECLARE V_COUNT INT;
declare venta int;

SELECT COUNT(*) INTO V_COUNT FROM detalle_venta WHERE idDetalle_Venta = P_idDetalle_Venta and idEstado = 3;

IF V_COUNT = 1 THEN 

	select idventa into venta FROM detalle_venta WHERE idDetalle_Venta = P_idDetalle_Venta;
	DELETE FROM detalle_venta WHERE idDetalle_Venta = P_idDetalle_Venta;
    
    select count(*) into v_count FROM detalle_venta where idVenta = venta and idEstado = 3;
    
    if V_COUNT = 0 then
    
    update ventas set idEstado = 4 where idVenta = venta;
    
    select count(*) into v_count FROM detalle_venta where idVenta = venta and idEstado = 4;
    
    if V_COUNT = 0 then
    
    delete FROM ventas where idVenta = venta and idEstado = 3;
    
    end if;
    
    end if;
    
SELECT COUNT(*) INTO V_COUNT FROM detalle_venta WHERE idDetalle_Venta = P_idDetalle_Venta;

IF V_COUNT = 0 THEN 

SELECT CONCAT(MENSAJE,'') AS mensaje FROM mensaje WHERE IDMENSAJE = 5;
COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE,'') AS mensaje FROM mensaje WHERE IDMENSAJE = 6;

END IF;    
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Eliminar_MarcaProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Eliminar_MarcaProducto`(
in
		P_idMarcaProducto int
)
BEGIN

DECLARE V_COUNT INT;

SELECT COUNT(*) INTO V_COUNT FROM marca_producto WHERE idMarcaProducto = P_idMarcaProducto;

IF V_COUNT = 1 THEN 

DELETE FROM marca_producto WHERE idMarcaProducto = P_idMarcaProducto;

SELECT COUNT(*) INTO V_COUNT FROM marca_producto WHERE idMarcaProducto = P_idMarcaProducto;

IF V_COUNT = 0 THEN 

SELECT CONCAT(MENSAJE,'') AS mensaje FROM mensaje WHERE IDMENSAJE = 5;
COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE,'') AS mensaje FROM mensaje WHERE IDMENSAJE = 6;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Eliminar_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Eliminar_Producto`(
in
		P_idProducto int
)
BEGIN

DECLARE V_COUNT INT;

SELECT COUNT(*) INTO V_COUNT FROM producto WHERE idProducto = P_idProducto;

IF V_COUNT = 1 THEN 

DELETE FROM producto WHERE idProducto = P_idProducto;

SELECT COUNT(*) INTO V_COUNT FROM producto WHERE idProducto = P_idProducto;

IF V_COUNT = 0 THEN 

SELECT CONCAT(MENSAJE,'') AS mensaje FROM mensaje WHERE IDMENSAJE = 5;
COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE,'') AS mensaje FROM mensaje WHERE IDMENSAJE = 6;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Eliminar_Reserva_Por_Cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Eliminar_Reserva_Por_Cliente`(

    IN P_idCliente int,
    IN P_idReserva int
        
)
BEGIN

	DECLARE V_COUNT INT;    

SELECT count(*) into V_COUNT FROM reserva r 
join fecha h ON r.idHoraIni = h.idFecha 
join fecha f ON r.idHoraFin = f.idFecha
join servicio s ON r.idServicio = s.idServicio
where idCliente = P_idCliente and r.idestado = 3;

IF V_COUNT > 0 THEN 

DELETE

FROM reserva 

where idCliente = P_idCliente and idReserva = P_idReserva and idEstado = 3;

SELECT 

CONCAT('RESERVA ELIMINADA PARA EL CLIENTE: ',d.Nombre, ' ', d.ApelLido,'.') AS MENSAJE

FROM cliente c

join datos d on d.idDatos = c.idDatos

where c.idCliente = P_idCliente;

ELSE

SELECT 

CONCAT('NO EXISTEN RESERVAS PENDIENTES PARA EL CLIENTE: ',d.Nombre, ' ', d.ApelLido,'.') AS MENSAJE

FROM cliente c

join datos d on d.idDatos = c.idDatos

where c.idCliente = P_idCliente;

END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Eliminar_Servicio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Eliminar_Servicio`(
in
		P_idServicio int
)
BEGIN

DECLARE V_COUNT INT;

SELECT COUNT(*) INTO V_COUNT FROM servicio WHERE idServicio = P_idServicio;

IF V_COUNT = 1 THEN 

DELETE FROM servicio WHERE idServicio = P_idServicio;

SELECT COUNT(*) INTO V_COUNT FROM servicio WHERE idServicio = P_idServicio;

IF V_COUNT = 0 THEN 

SELECT CONCAT(MENSAJE,'') AS mensaje FROM mensaje WHERE IDMENSAJE = 5;
COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE,'') AS mensaje FROM mensaje WHERE IDMENSAJE = 6;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Eliminar_Tipo_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Eliminar_Tipo_Producto`(
in
		P_idTipo_producto int
)
BEGIN

DECLARE V_COUNT INT;

SELECT COUNT(*) INTO V_COUNT FROM tipo_producto WHERE idTipo_producto = P_idTipo_producto;

IF V_COUNT = 1 THEN 

DELETE FROM tipo_producto WHERE idTipo_producto = P_idTipo_producto;

SELECT COUNT(*) INTO V_COUNT FROM tipo_producto WHERE idTipo_producto = P_idTipo_producto;

IF V_COUNT = 0 THEN 

SELECT CONCAT(MENSAJE,'') AS mensaje FROM mensaje WHERE IDMENSAJE = 5;
COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE,'') AS mensaje FROM mensaje WHERE IDMENSAJE = 6;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Eliminar_Venta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Eliminar_Venta`(

IN P_idCliente int

)
BEGIN

DECLARE V_COUNT INT;
DECLARE V_IDVENTA INT;

SELECT COUNT(*) INTO V_COUNT FROM ventas WHERE idCliente = P_idCliente and idEstado = 3;

IF V_COUNT = 1 THEN 
	
    SELECT IDVENTA INTO V_IDVENTA FROM ventas WHERE idCliente = P_idCliente and idEstado = 3;
	DELETE FROM detalle_venta WHERE IDVENTA = V_IDVENTA;
    DELETE FROM ventas WHERE idCliente = P_idCliente and idEstado = 3;

SELECT COUNT(*) INTO V_COUNT FROM ventas WHERE idVenta = V_IDVENTA;

IF V_COUNT = 0 THEN 

SELECT CONCAT(MENSAJE,'') AS mensaje FROM mensaje WHERE IDMENSAJE = 5;
COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE,'') AS mensaje FROM mensaje WHERE IDMENSAJE = 6;

END IF;        
    
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Generar_Reserva_Barbero` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Generar_Reserva_Barbero`(

    IN P_idBarbero int,
    IN P_idCliente int,
    IN P_DTconsulta DATETIME,
    IN P_idServicio int,
    OUT P_idReserva int
        
)
BEGIN

	DECLARE V_duracion INT;
    DECLARE V_Y VARCHAR (5);
    DECLARE V_A VARCHAR (100);
    DECLARE V_D VARCHAR (100);
	DECLARE V_COUNT INT;    
    declare V_RESERVA INT;
    declare V_IDFECHA int;
    declare V_IDFECHFIN int;    
    declare V_DETFECHA datetime;
    declare V_DETFECHAFIN datetime;
	DECLARE V_MAX INT;
	DECLARE V_COD VARCHAR(6);    
	DECLARE V_COUNT_A INT;    
    DECLARE V_COUNT_D INT;
    declare V_DESCUENTO DOUBLE;
    declare V_PRECIO DOUBLE;
    declare V_SUBTOTAL DOUBLE; 
    DECLARE V_IDVENTA INT;
        
select count(*) into V_COUNT FROM reserva r
join servicio s on r.idServicio = s.idServicio
join fecha h on r.idHoraIni = h.idFecha
where idBarbero = P_idBarbero and idCliente = P_idCliente and h.detFecha = CAST(P_DTconsulta AS DATETIME) and s.idServicio = P_idServicio;

IF V_COUNT = 0 THEN 

-- ANTES

SELECT count(*) into V_COUNT_A FROM reserva r 
join fecha h ON r.idHoraIni = h.idFecha 
join fecha f ON r.idHoraFin = f.idFecha
join servicio s ON r.idServicio = s.idServicio
where r.idServicio = 1 AND CAST(ADDTIME(CAST(P_DTconsulta AS DATETIME), concat('00:',minutos,':00')) AS DATETIME) between h.detfecha and f.detFecha and idBarbero = P_idBarbero;

-- DURANTE

SELECT count(*) into V_COUNT_D FROM reserva r 
join fecha h ON r.idHoraIni = h.idFecha 
join fecha f ON r.idHoraFin = f.idFecha
where CAST(P_DTconsulta AS DATETIME) between h.detfecha and f.detFecha and idBarbero = P_idBarbero;

IF V_COUNT_A = 1 OR V_COUNT_D = 1 THEN 

IF V_COUNT_A = 1 AND V_COUNT_D = 1 THEN

SET V_Y := ' Y ';

ELSE

SET V_Y := '';

END IF;

IF V_COUNT_A = 1 THEN 

SELECT r.idReserva into V_RESERVA FROM reserva r 
join fecha h ON r.idHoraIni = h.idFecha 
join fecha f ON r.idHoraFin = f.idFecha
join servicio s ON r.idServicio = s.idServicio
where r.idServicio = P_idServicio AND CAST(ADDTIME(CAST(P_DTconsulta AS DATETIME), concat('00:',minutos,':00')) AS DATETIME) between h.detfecha and f.detFecha and idBarbero = P_idBarbero;

SELECT CONCAT(
' ENTRE LAS: ', h.detFecha, ' Y ', f.detFecha, ' '
) into V_A FROM reserva r
join fecha h ON r.idHoraIni = h.idFecha 
join fecha f ON r.idHoraFin = f.idFecha
join servicio s ON r.idServicio = s.idServicio
where r.idServicio = P_idServicio AND CAST(ADDTIME(CAST(P_DTconsulta AS DATETIME), concat('00:',minutos,':00')) AS DATETIME) between h.detfecha and f.detFecha and idBarbero = P_idBarbero;

else

set V_A := '';

END IF;

IF V_COUNT_D = 1 THEN 

SELECT r.idReserva into V_RESERVA FROM reserva r 
join fecha h ON r.idHoraIni = h.idFecha 
join fecha f ON r.idHoraFin = f.idFecha
where CAST(P_DTconsulta AS DATETIME) between h.detfecha and f.detFecha and idBarbero = P_idBarbero;

SELECT CONCAT(
' ENTRE LAS: ', h.detFecha, ' Y ', f.detFecha, ' '
) into V_D FROM reserva r
join fecha h ON r.idHoraIni = h.idFecha 
join fecha f ON r.idHoraFin = f.idFecha
where CAST(P_DTconsulta AS DATETIME) between h.detfecha and f.detFecha and idBarbero = P_idBarbero;

else

set V_D := '';

END IF;

SELECT CONCAT(MENSAJE,'. BARBERO: ', (SELECT CONCAT(NOMBRE, ' ', APELLIDO) FROM barbero B JOIN datos D ON B.IDDATOS = D.IDDATOS where IDBARBERO = P_idBarbero), V_A, V_Y, V_D) AS mensaje FROM mensaje WHERE IDMENSAJE = 15;

ELSE

set V_DETFECHA := cast(P_DTconsulta as datetime);

INSERT INTO fecha (DETFECHA, REGISTERED) VALUES ( V_DETFECHA, CURTIME() );
SELECT IDFECHA into V_IDFECHA FROM fecha WHERE DETFECHA = CAST(P_DTconsulta AS DATETIME) and registered = CURTIME();

SELECT cast(ADDTIME(CAST(V_DETFECHA AS DATETIME), concat('00:',minutos,':00')) as datetime) into V_DETFECHAFIN FROM servicio where idServicio = P_idServicio;

-- set V_DETFECHAFIN := cast(('2018/12/20 06:51:00' + MINUTOS) as datetime);
INSERT INTO fecha (DETFECHA, REGISTERED) VALUES ( V_DETFECHAFIN, CURTIME() );
SELECT IDFECHA INTO V_IDFECHFIN FROM fecha WHERE DETFECHA = V_DETFECHAFIN and registered = CURTIME();

    set V_MAX = ( select last_insert_id() FROM reserva limit 1 );
	if V_MAX >= 1 and V_MAX <= 8 then
		set V_MAX = V_MAX + 1;
		set V_COD = (select concat('R000'  ,  CAST(V_MAX as CHAR)));
	elseif V_MAX >= 9 and V_MAX <= 98 then
		set V_MAX = V_MAX + 1;
		set V_COD = (select concat('R00'  ,  CAST(V_MAX as CHAR)));
	elseif V_MAX >= 99 and V_MAX <= 998 then
		set V_MAX = V_MAX + 1;
		set V_COD = (select concat('R0'  ,  CAST(V_MAX as CHAR)));
	elseif V_MAX >= 999 and V_MAX <= 9998 then
		set V_MAX = V_MAX + 1;
		set V_COD = (select concat('B'  ,  CAST(V_MAX as CHAR)));
	else 
		set V_COD = (select 'R0001');
	end if;

insert into reserva (codReserva, idEstado, idcliente, idBarbero, idHoraIni, idServicio, idHoraFin) values (V_COD, 3, P_idCliente, P_idBarbero, V_IDFECHA, P_idServicio, V_IDFECHFIN);
commit;

select idReserva into P_idReserva FROM reserva where codReserva = V_COD;

SELECT CONCAT(MENSAJE,'. BARBERO: ', (SELECT CONCAT(NOMBRE, ' ', APELLIDO) FROM barbero B JOIN datos D ON B.IDDATOS = D.IDDATOS where IDBARBERO = P_idBarbero)) AS mensaje FROM mensaje WHERE IDMENSAJE = 8;

END IF;

END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Insertar_Barbero` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Insertar_Barbero`(
in
	P_nombre varchar(40),
    P_apellido varchar(40),
    P_telefono char(9),
    P_dni char(8),
    P_correo varchar(45),
    P_direccion varchar(100),
    P_usuario int
)
BEGIN

DECLARE V_COUNT INT;
DECLARE V_IDFECHA INT;
DECLARE V_DETFECHA DATETIME;
DECLARE V_IDDATOS INT;
DECLARE V_MAX INT;
DECLARE V_COD VARCHAR(6);

SET V_DETFECHA := CURTIME();

SELECT COUNT(*) INTO V_COUNT FROM datos WHERE DNI = P_DNI;

IF V_COUNT = 0 THEN 

INSERT INTO fecha (DETFECHA, REGISTERED) VALUES ( V_DETFECHA, CURTIME() );
SELECT IDFECHA INTO V_IDFECHA FROM fecha WHERE DETFECHA = V_DETFECHA;

INSERT INTO datos 

	(nombre,
    apellido,
    telefono,
    dni,
    correo,
    direccion) 
    
VALUES 

	(UPPER(P_nombre),
    UPPER(P_apellido),
    UPPER(P_telefono),
    UPPER(P_dni),
    UPPER(P_correo),
    UPPER(P_direccion));
    
SELECT IDDATOS INTO V_IDDATOS FROM datos WHERE DNI = P_DNI;    

        set V_MAX = ( select idBarbero FROM barbero order by 1 desc limit 1 );
	if V_MAX >= 1 and V_MAX <= 8 then
		set V_MAX = V_MAX + 1;
		set V_COD = (select concat('B000'  ,  CAST(V_MAX as CHAR)));
	elseif V_MAX >= 9 and V_MAX <= 98 then
		set V_MAX = V_MAX + 1;
		set V_COD = (select concat('B00'  ,  CAST(V_MAX as CHAR)));
	elseif V_MAX >= 99 and V_MAX <= 998 then
		set V_MAX = V_MAX + 1;
		set V_COD = (select concat('B0'  ,  CAST(V_MAX as CHAR)));
	elseif V_MAX >= 999 and V_MAX <= 9998 then
		set V_MAX = V_MAX + 1;
		set V_COD = (select concat('B'  ,  CAST(V_MAX as CHAR)));
	else 
		set V_COD = (select 'B0001');
	end if;

INSERT INTO barbero (IDDATOS, CODBARBERO, IDESTADO, MODIFIEDBY, DATEUPDATED) VALUES (V_IDDATOS, V_COD, 1, P_usuario, V_IDFECHA);

SELECT mensaje FROM mensaje WHERE IDMENSAJE = 1;

SELECT COUNT(*) INTO V_COUNT FROM datos WHERE DNI = P_DNI;

IF V_COUNT = 1 THEN 

SELECT CONCAT(MENSAJE,'') AS mensaje FROM mensaje WHERE IDMENSAJE = 1;
COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE,', DEBE TRATARSE DE UN REGISTRO DUPLICADO.') AS mensaje FROM mensaje WHERE IDMENSAJE = 2;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Insertar_Cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Insertar_Cliente`(
in
	P_nombre varchar(40),
    P_apellido varchar(40),
    P_telefono char(9),
    P_dni char(8),
    P_correo varchar(45),
    P_direccion varchar(100),
    P_password char(8),
    P_usuario int,
out    
   P_idCliente  int
)
BEGIN

DECLARE V_COUNT INT;
DECLARE V_IDFECHA INT;
DECLARE V_DETFECHA DATETIME;
DECLARE V_IDDATOS INT;
DECLARE V_MAX INT;
DECLARE V_COD VARCHAR(6);

SET V_DETFECHA := CURTIME();

SELECT COUNT(*) INTO V_COUNT FROM datos WHERE DNI = P_DNI;
set P_idCliente := 0;

IF V_COUNT = 0 THEN 

INSERT INTO fecha (DETFECHA, REGISTERED) VALUES ( V_DETFECHA, CURTIME() );
SELECT IDFECHA INTO V_IDFECHA FROM fecha WHERE DETFECHA = V_DETFECHA;

INSERT INTO datos 

	(nombre,
    apellido,
    telefono,
    dni,
    correo,
    direccion) 
    
VALUES 

	(UPPER(P_nombre),
    UPPER(P_apellido),
    UPPER(P_telefono),
    UPPER(P_dni),
    UPPER(P_correo),
    UPPER(P_direccion));
    
SELECT IDDATOS INTO V_IDDATOS FROM datos WHERE DNI = P_DNI;    

	set V_MAX = ( select idCliente FROM cliente order by 1 desc limit 1 );
	if V_MAX >= 1 and V_MAX <= 8 then
		set V_MAX = V_MAX + 1;
		set V_COD = (select concat('C000'  ,  CAST(V_MAX as CHAR)));
	elseif V_MAX >= 9 and V_MAX <= 98 then
		set V_MAX = V_MAX + 1;
		set V_COD = (select concat('C00'  ,  CAST(V_MAX as CHAR)));
	elseif V_MAX >= 99 and V_MAX <= 998 then
		set V_MAX = V_MAX + 1;
		set V_COD = (select concat('C0'  ,  CAST(V_MAX as CHAR)));
	elseif V_MAX >= 999 and V_MAX <= 9998 then
		set V_MAX = V_MAX + 1;
		set V_COD = (select concat('C'  ,  CAST(V_MAX as CHAR)));
	else 
		set V_COD = (select 'C0001');
	end if;

INSERT INTO cliente (IDDATOS, CODCLIENTE, IDESTADO, PASS, MODIFIEDBY, DATEUPDATED) VALUES (V_IDDATOS, V_COD, 1, P_password,P_usuario, V_IDFECHA);

SELECT mensaje FROM mensaje WHERE IDMENSAJE = 1;

SELECT COUNT(*) INTO V_COUNT FROM datos WHERE DNI = P_DNI;

IF V_COUNT = 1 THEN 

		SELECT CONCAT((SELECT mensaje FROM mensaje WHERE idMensaje = 10), ' CLIENTE: ', concat(nombre,' ', apellido)) as MENSAJE, idCliente as id
		FROM datos d
		join cliente c on d.idDatos = c.idDatos
		where DNI = P_DNI and Telefono = P_Telefono
        ;
        SELECT idCliente into P_idCliente
		FROM datos d
		join cliente c on d.idDatos = c.idDatos
		where DNI = P_DNI and Telefono = P_Telefono
        ;
        
COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE,', DEBE TRATARSE DE UN REGISTRO DUPLICADO.') AS mensaje FROM mensaje WHERE IDMENSAJE = 2;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Insertar_Marca_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Insertar_Marca_Producto`(
in
	P_nombMarca varchar(40)    
)
BEGIN

DECLARE V_COUNT INT;
DECLARE V_MAX INT;
DECLARE V_COD VARCHAR(6);

SELECT COUNT(*) INTO V_COUNT FROM marca_producto WHERE nombMarca = P_nombMarca;

IF V_COUNT = 0 THEN 

    set V_MAX = ( select last_insert_id() FROM marca_producto limit 1 ); 
	if V_MAX >= 1 and V_MAX <= 8 then
		set V_MAX = V_MAX + 1;
		set V_COD = (select concat('M000'  ,  CAST(V_MAX as CHAR)));
	elseif V_MAX >= 9 and V_MAX <= 98 then
		set V_MAX = V_MAX + 1;
		set V_COD = (select concat('M00'  ,  CAST(V_MAX as CHAR)));
	elseif V_MAX >= 99 and V_MAX <= 998 then
		set V_MAX = V_MAX + 1;
		set V_COD = (select concat('M0'  ,  CAST(V_MAX as CHAR)));
	elseif V_MAX >= 999 and V_MAX <= 9998 then
		set V_MAX = V_MAX + 1;
		set V_COD = (select concat('M'  ,  CAST(V_MAX as CHAR)));
	else
		set V_COD = (select 'M0001');
	end if;

INSERT INTO marca_producto 

	(nombMarca, codMarca, idEstado)
    
VALUES 

	(UPPER(P_nombMarca), V_COD, 1);

SELECT mensaje FROM mensaje WHERE IDMENSAJE = 1;

SELECT COUNT(*) INTO V_COUNT FROM marca_producto WHERE nombMarca = UPPER(P_nombMarca) AND codMarca = V_COD;

IF V_COUNT = 1 THEN 

SELECT CONCAT(MENSAJE,'') AS mensaje FROM mensaje WHERE IDMENSAJE = 1;
COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE,', DEBE TRATARSE DE UN REGISTRO DUPLICADO.') AS mensaje FROM mensaje WHERE IDMENSAJE = 2;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Insertar_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Insertar_Producto`(
in
	P_nomProd varchar(40),
    p_marca int,
    p_tipo int,
    P_stock int,
    P_precio double,
    P_descripcion varchar(200),
    P_usuario int
    
)
BEGIN

DECLARE V_COUNT INT;
DECLARE V_IDFECHA INT;
DECLARE V_DETFECHA DATETIME;
DECLARE V_MAX INT;
DECLARE V_COD VARCHAR(6);

SET V_DETFECHA := CURTIME();

SELECT COUNT(*) INTO V_COUNT FROM producto WHERE nomProd = P_nomProd;

IF V_COUNT = 0 THEN 

INSERT INTO fecha (DETFECHA, REGISTERED) VALUES ( V_DETFECHA, CURTIME() );
SELECT IDFECHA INTO V_IDFECHA FROM fecha WHERE DETFECHA = V_DETFECHA;

	set V_MAX = ( select last_insert_id() FROM producto LIMIT 1);
	if V_MAX >= 1 and V_MAX <= 8 then
		set V_MAX = V_MAX + 1;
		set V_COD = (select concat('P000'  ,  CAST(V_MAX as CHAR)));
	elseif V_MAX >= 9 and V_MAX <= 98 then
		set V_MAX = V_MAX + 1;
		set V_COD = (select concat('P00'  ,  CAST(V_MAX as CHAR)));
	elseif V_MAX >= 99 and V_MAX <= 998 then
		set V_MAX = V_MAX + 1;
		set V_COD = (select concat('P0'  ,  CAST(V_MAX as CHAR)));
	elseif V_MAX >= 999 and V_MAX <= 9998 then
		set V_MAX = V_MAX + 1;
		set V_COD = (select concat('P'  ,  CAST(V_MAX as CHAR)));
	else 
		set V_COD = (select 'P0001');
	end if;

INSERT INTO producto 

	(codProducto,
    idMarcaProducto,
    idTipo_producto,
    nomProd,
    idEstado,
    stock,
    precio,
    descripcion,
    MODIFIEDBY, DATEUPDATED)
    
VALUES 

	(V_COD,
    p_marca,
    p_tipo,
    UPPER(P_nomProd),
    1,
    P_stock,
    P_precio,
    UPPER(P_descripcion),
    P_usuario, V_IDFECHA);

SELECT mensaje FROM mensaje WHERE IDMENSAJE = 1;

SELECT COUNT(*) INTO V_COUNT FROM producto WHERE nomProd = UPPER(P_nomProd) and codProducto = V_COD;

IF V_COUNT = 1 THEN 

SELECT CONCAT(MENSAJE,'') AS mensaje FROM mensaje WHERE IDMENSAJE = 1;
COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE,', DEBE TRATARSE DE UN REGISTRO DUPLICADO.') AS mensaje FROM mensaje WHERE IDMENSAJE = 2;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Insertar_Servicio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Insertar_Servicio`(
in
	P_nomServ varchar(40),
    P_minutos int,
    P_precio double,
    P_descripcion varchar(200),
    P_usuario int
    
)
BEGIN

DECLARE V_COUNT INT;
DECLARE V_IDFECHA INT;
DECLARE V_DETFECHA DATETIME;
DECLARE V_MAX INT;
DECLARE V_COD VARCHAR(6);

SET V_DETFECHA := CURTIME();

SELECT COUNT(*) INTO V_COUNT FROM servicio WHERE nomServ = P_nomServ;

IF V_COUNT = 0 THEN 

INSERT INTO fecha (DETFECHA, REGISTERED) VALUES ( V_DETFECHA, CURTIME() );
SELECT IDFECHA INTO V_IDFECHA FROM fecha WHERE DETFECHA = V_DETFECHA;

	set V_MAX = ( select idServicio FROM servicio order by 1 desc limit 1);
	if V_MAX >= 1 and V_MAX <= 8 then
		set V_MAX = V_MAX + 1;
		set V_COD = (select concat('S000'  ,  CAST(V_MAX as CHAR)));
	elseif V_MAX >= 9 and V_MAX <= 98 then
		set V_MAX = V_MAX + 1;
		set V_COD = (select concat('S00'  ,  CAST(V_MAX as CHAR)));
	elseif V_MAX >= 99 and V_MAX <= 998 then
		set V_MAX = V_MAX + 1;
		set V_COD = (select concat('S0'  ,  CAST(V_MAX as CHAR)));
	elseif V_MAX >= 999 and V_MAX <= 9998 then
		set V_MAX = V_MAX + 1;
		set V_COD = (select concat('S'  ,  CAST(V_MAX as CHAR)));
	else 
		set V_COD = (select 'S0001');
	end if;

INSERT INTO servicio 

	(codServicio,
    nomServ,
    idEstado,
    minutos,
    precio,
    descripcion,
    modifiedBy, DATEUPDATED)
    
VALUES 

	(V_COD,
    UPPER(P_nomServ),
    1,
    UPPER(P_minutos),
    P_precio,
    UPPER(P_descripcion),
    P_usuario, V_IDFECHA);

SELECT mensaje FROM mensaje WHERE IDMENSAJE = 1;

SELECT COUNT(*) INTO V_COUNT FROM servicio WHERE nomServ = UPPER(P_nomServ) and codServicio = V_COD;

IF V_COUNT = 1 THEN 

SELECT CONCAT(MENSAJE,'') AS mensaje FROM mensaje WHERE IDMENSAJE = 1;
COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE,', DEBE TRATARSE DE UN REGISTRO DUPLICADO.') AS mensaje FROM mensaje WHERE IDMENSAJE = 2;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Insertar_Tipo_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Insertar_Tipo_Producto`(
in
	P_detalle varchar(40)    
)
BEGIN

DECLARE V_COUNT INT;

SELECT COUNT(*) INTO V_COUNT FROM tipo_producto WHERE detalle = P_detalle;

IF V_COUNT = 0 THEN 

INSERT INTO tipo_producto 

	(detalle,idEstado)
    
VALUES 

	(UPPER(P_detalle),1);

SELECT mensaje FROM mensaje WHERE IDMENSAJE = 1;

SELECT COUNT(*) INTO V_COUNT FROM tipo_producto WHERE detalle = UPPER(P_detalle);

IF V_COUNT = 1 THEN 

SELECT CONCAT(MENSAJE,'') AS mensaje FROM mensaje WHERE IDMENSAJE = 1;
COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE,', DEBE TRATARSE DE UN REGISTRO DUPLICADO.') AS mensaje FROM mensaje WHERE IDMENSAJE = 2;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Insertar_Usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Insertar_Usuario`(

in
P_idTipoUsuario int,
P_nombre VARCHAR(45),
P_apellido VARCHAR(45),
P_cargo VARCHAR(20),
p_aka VARCHAR(9),
p_pass CHAR(8),
P_correo VARCHAR(45),
P_telefono CHAR(9),
P_descripcion VARCHAR(200),
out
P_idUsuario int
)
BEGIN

DECLARE V_COUNT INT;
DECLARE V_IDDATOS INT;
DECLARE V_MAX INT;
DECLARE V_COD VARCHAR(6);

set P_idUsuario := 0;

SELECT COUNT(*) into V_COUNT FROM usuario WHERE idTipo_Usuario = P_idTipoUsuario;

IF V_COUNT = 0 THEN 

    set V_MAX = ( select idUsuario FROM usuario order by 1 desc limit 1 );
	if V_MAX >= 1 and V_MAX <= 8 then
		set V_MAX = V_MAX + 1;
		set V_COD = (select concat('U000'  ,  CAST(V_MAX as CHAR)));
	elseif V_MAX >= 9 and V_MAX <= 98 then
		set V_MAX = V_MAX + 1;
		set V_COD = (select concat('U00'  ,  CAST(V_MAX as CHAR)));
	elseif V_MAX >= 99 and V_MAX <= 998 then
		set V_MAX = V_MAX + 1;
		set V_COD = (select concat('U0'  ,  CAST(V_MAX as CHAR)));
	elseif V_MAX >= 999 and V_MAX <= 9998 then
		set V_MAX = V_MAX + 1;
		set V_COD = (select concat('U'  ,  CAST(V_MAX as CHAR)));
	else 
		set V_COD = (select 'U0001');
	end if;

Select detalle into P_cargo FROM tipo_usuario where idTipo_Usuario = P_idTipoUsuario;

INSERT INTO usuario 

	(idTipo_Usuario,
    codUsuario,
    nombre,
    apellido,
    cargo,
    aka,
    pass,
    correo,
    telefono,
    descripcion) 
    
VALUES 

	(P_idTipoUsuario,
    UPPER(V_COD),
    UPPER(P_nombre),
    UPPER(P_apellido),
    UPPER(P_cargo),
    UPPER(P_aka),
    P_pass,
    P_correo,
    P_telefono,
    UPPER(P_descripcion));

SELECT COUNT(*) INTO V_COUNT FROM usuario WHERE idTipo_Usuario = P_idTipoUsuario;

IF V_COUNT = 1 THEN 

SELECT CONCAT((SELECT mensaje FROM mensaje WHERE idMensaje = 10), ' USUARIO: ', AKA) AS MENSAJE
FROM usuario
where aka = p_aka and pass = p_pass;

SELECT idUsuario into V_IDDATOS
FROM usuario
where codUsuario = V_COD;

set P_idUsuario := V_IDDATOS;

COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE,', DEBE TRATARSE DE UN REGISTRO DUPLICADO, DEBE INICIAR SESION') as mensaje FROM mensaje WHERE IDMENSAJE = 2;
SET P_idUsuario = 0;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Listar_Barbero` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Listar_Barbero`(

)
BEGIN

DECLARE V_COUNT INT;

SELECT COUNT(*) INTO V_COUNT FROM barbero;

IF V_COUNT > 0 THEN 

SELECT 

	idBarbero,
	concat(d.nombre,' ',d.apellido)
	as 'Nombre del Barbero'
    
FROM barbero c
join datos d on c.idDatos = d.idDatos
join estado e on c.idestado = e.idEstado
where c.idEstado = 1
;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Listar_Barbero_Interno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Listar_Barbero_Interno`(

)
BEGIN

DECLARE V_COUNT INT;

SELECT COUNT(*) INTO V_COUNT FROM barbero;

IF V_COUNT > 0 THEN 

SELECT 

	c.idBarbero,
    c.codBarbero as Codigo,
	concat(d.nombre,' ',d.apellido)	as 'Nombre_del_Barbero',
	e.desEstado as Estado,      
    d.telefono as Celular,
	dni as DNI,
    d.correo as 'Email',
    direccion as Direccion,
    u.aka as 'Modificado_Por',
    f.detFecha as 'Ultima_Modificacion'
    
FROM barbero c
join datos d on c.idDatos = d.idDatos
join usuario u on c.modifiedBy = u.idUsuario
join fecha f on c.dateUpdated = f.idFecha
join estado e on c.idestado = e.idEstado
;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Listar_Cliente_Interno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Listar_Cliente_Interno`(

)
BEGIN

DECLARE V_COUNT INT;

SELECT COUNT(*) INTO V_COUNT FROM cliente;

IF V_COUNT > 0 THEN 

SELECT 

	idCliente,
    c.codCliente as Codigo,
	concat(d.nombre,' ',d.apellido) as 'Nombre_del_Cliente',
    d.dni as DNI,
	desEstado as Estado,     
    d.telefono as Celular,
    d.correo as 'Email',
    direccion as Direccion,
    u.aka as 'Modificado_Por',
    f.detFecha as 'Ultima_Modificacion'
    
FROM cliente c
join datos d on c.idDatos = d.idDatos
join usuario u on c.modifiedBy = u.idUsuario
join fecha f on c.dateUpdated = f.idFecha
join estado e on c.idestado = e.idEstado
;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Listar_Marca_Interno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Listar_Marca_Interno`(

)
BEGIN

DECLARE V_COUNT INT;

SELECT COUNT(*) INTO V_COUNT FROM marca_producto;

IF V_COUNT > 0 THEN 

SELECT 

	p.idMarcaProducto,
    codMarca as Codigo,
    nombMarca as Marca,
	desEstado as Estado
    
FROM marca_producto p

join estado e on p.idestado = e.idEstado
;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Listar_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Listar_Producto`(

)
BEGIN

DECLARE V_COUNT INT;

SELECT COUNT(*) INTO V_COUNT FROM producto;

IF V_COUNT > 0 THEN 

SELECT 

    idProducto,
    nomProd as Producto,
    precio as Precio,
    p.descripcion as Descripcion
    
FROM producto p
join estado e on p.idestado = e.idEstado
join marca_producto m on p.idMarcaProducto = m.idMarcaProducto
join tipo_producto t on p.idTipo_producto = t.idTipo_producto
where p.idEstado = 1
;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Listar_Producto_Interno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Listar_Producto_Interno`(

)
BEGIN

DECLARE V_COUNT INT;

SELECT COUNT(*) INTO V_COUNT FROM producto;

IF V_COUNT > 0 THEN 

SELECT 

	p.idProducto,
    codProducto as Codigo,
    detalle as Tipo,
    nomProd as Producto,
    nombMarca as Marca,
	desEstado as Estado,      
    stock as 'Cantidad_Disponible',
    precio as Precio,
    p.descripcion as Descripcion,
    aka as 'Modificado _por:',
	detFecha as 'Ultima_modificacion'
    
FROM producto p

Join usuario u on p.modifiedBy = u.idusuario
Join fecha f on p.dateUpdated = f.idfecha
join estado e on p.idestado = e.idEstado
join marca_producto m on p.idMarcaProducto = m.idMarcaProducto
join tipo_producto t on p.idTipo_producto = t.idTipo_producto
;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Listar_Reservas_Por_Barbero_Interno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Listar_Reservas_Por_Barbero_Interno`(

    IN P_idBarbero int
        
)
BEGIN

	DECLARE V_COUNT INT;    

SELECT count(*) into V_COUNT FROM reserva r 
join fecha h ON r.idHoraIni = h.idFecha 
join fecha f ON r.idHoraFin = f.idFecha
join servicio s ON r.idServicio = s.idServicio
where idBarbero = P_idBarbero and r.idestado = 3;

IF V_COUNT > 0 THEN 

SELECT 

r.codReserva as CODIGO,
CONCAT(t.Nombre, ' ', t.ApelLido) as 'BARBERO',
s.nomServ as SERVICIO,
CONCAT(d.Nombre, ' ', d.ApelLido) as 'CLIENTE',
h.detFecha as 'INICIO',
h.detFecha as 'FIN',
e.desEstado as 'ESTADO'

FROM reserva r

join cliente c on r.idCliente = c.idCliente
join barbero b on r.idBarbero = b.idBarbero
join datos d on d.idDatos = c.idDatos
join datos t on t.idDatos = b.idDatos
join fecha h on r.idHoraIni = h.idFecha
join fecha f on r.idHoraFin = f.idFecha
join servicio s on r.idServicio = s.idServicio
join estado e on r.idEstado = e.idEstado

where r.idBarbero = P_idBarbero and r.idestado = 3;

ELSE

SELECT 

CONCAT('NO EXISTEN RESERVAS PENDIENTES PARA EL BARBERO: ',d.Nombre, ' ', d.ApelLido,'.') AS MENSAJE

FROM barbero c

join datos d on d.idDatos = c.idDatos

where c.idBarbero = P_idBarbero;

END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Listar_Reservas_Por_Cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Listar_Reservas_Por_Cliente`(

    IN P_idCliente int
        
)
BEGIN

	DECLARE V_COUNT INT;    

SELECT count(*) into V_COUNT FROM reserva r 
join fecha h ON r.idHoraIni = h.idFecha 
join fecha f ON r.idHoraFin = f.idFecha
join servicio s ON r.idServicio = s.idServicio
where idCliente = P_idCliente;

IF V_COUNT > 0 THEN 

SELECT 

r.idReserva,
CONCAT(d.Nombre, ' ', d.ApelLido) as 'CLIENTE',
s.nomServ as SERVICIO,
b.codBarbero,
CONCAT(t.Nombre, ' ', t.ApelLido) as 'BARBERO',
h.detFecha as 'INICIO',
f.detFecha as 'FIN',
e.desEstado as 'ESTADO'

FROM reserva r

join cliente c on r.idCliente = c.idCliente
join barbero b on r.idBarbero = b.idBarbero
join datos d on d.idDatos = c.idDatos
join datos t on t.idDatos = b.idDatos
join fecha h on r.idHoraIni = h.idFecha
join fecha f on r.idHoraFin = f.idFecha
join servicio s on r.idServicio = s.idServicio
join estado e on r.idEstado = e.idEstado

where r.idCliente = P_idCliente
order by r.idEstado, r.idReserva desc;

END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Listar_Reservas_Por_Cliente_Interno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Listar_Reservas_Por_Cliente_Interno`(

    IN P_idCliente int
        
)
BEGIN

	DECLARE V_COUNT INT;    

SELECT count(*) into V_COUNT FROM reserva r 
join fecha h ON r.idHoraIni = h.idFecha 
join fecha f ON r.idHoraFin = f.idFecha
join servicio s ON r.idServicio = s.idServicio
where idCliente = P_idCliente and r.idestado = 3;

IF V_COUNT > 0 THEN 

SELECT 

r.codReserva as CODIGO,
CONCAT(d.Nombre, ' ', d.ApelLido) as 'CLIENTE',
s.nomServ as SERVICIO,
CONCAT(t.Nombre, ' ', t.ApelLido) as 'BARBERO',
h.detFecha as 'INICIO',
h.detFecha as 'FIN',
e.desEstado as 'ESTADO'

FROM reserva r

join cliente c on r.idCliente = c.idCliente
join barbero b on r.idBarbero = b.idBarbero
join datos d on d.idDatos = c.idDatos
join datos t on t.idDatos = b.idDatos
join fecha h on r.idHoraIni = h.idFecha
join fecha f on r.idHoraFin = f.idFecha
join servicio s on r.idServicio = s.idServicio
join estado e on r.idEstado = e.idEstado

where r.idCliente = P_idCliente and r.idestado = 3;

ELSE

SELECT 

CONCAT('NO EXISTEN RESERVAS PENDIENTES PARA EL CLIENTE: ',d.Nombre, ' ', d.ApelLido,'.') AS MENSAJE

FROM cliente c

join datos d on d.idDatos = c.idDatos

where c.idCliente = P_idCliente;

END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Listar_Servicio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Listar_Servicio`(

)
BEGIN

DECLARE V_COUNT INT;

SELECT COUNT(*) INTO V_COUNT FROM servicio;

IF V_COUNT > 0 THEN 

SELECT 

	idServicio,
	nomServ as Servicio, 
    minutos as Duracion,
    precio as Precio

FROM servicio s
join estado e on s.idestado = e.idEstado
where s.idestado = 1
;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Listar_Servicio_Interno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Listar_Servicio_Interno`(

)
BEGIN

DECLARE V_COUNT INT;

SELECT COUNT(*) INTO V_COUNT FROM servicio;

IF V_COUNT > 0 THEN 

SELECT 

	p.idServicio,
    codServicio as Codigo,
    nomServ as Servicio,
	desEstado as Estado,      
    minutos as 'Duracion',
    precio as Precio,
    p.descripcion as Descripcion,
    aka as 'Modificado_por:',
	detFecha as 'Ultima_modificacion'
    
FROM servicio p

Join usuario u on p.modifiedBy = u.idusuario
Join fecha f on p.dateUpdated = f.idfecha
join estado e on p.idestado = e.idEstado
;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Listar_TipoProducto_Interno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Listar_TipoProducto_Interno`(

)
BEGIN

DECLARE V_COUNT INT;

SELECT COUNT(*) INTO V_COUNT FROM tipo_producto;

IF V_COUNT > 0 THEN 

SELECT 

	p.idTipo_producto,
    detalle as 'Tipo_de_producto',
	desEstado as Estado
    
FROM tipo_producto p

join estado e on p.idestado = e.idEstado
;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Listar_Usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Listar_Usuario`(

)
BEGIN

DECLARE V_COUNT INT;

SELECT COUNT(*) INTO V_COUNT FROM usuario;

IF V_COUNT > 0 THEN 

SELECT 

	idUsuario,
    codUsuario,
	concat(c.nombre,' ',c.apellido)	as 'Nombre_del_Usuario',
    cargo,
    aka,
    correo as 'Email',
    telefono as Celular,
    descripcion as Descripcion
    
FROM usuario c;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Login_Cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Login_Cliente`(

IN P_DNI CHAR(8), 
P_password char(8),
OUT P_idCliente int
)
begin

declare V_COUNT INT;

    select count(*) INTO V_COUNT FROM datos d
    join cliente c on d.idDatos = c.idDatos
	where DNI = P_DNI and pass = P_password;
    
    set P_idCLiente = 0;
    
    IF V_COUNT = 1 THEN 
    
		SELECT CONCAT((SELECT mensaje FROM mensaje WHERE idMensaje = 10), ' CLIENTE: ', concat(nombre,' ', apellido)) as MENSAJE
		FROM datos d
        join cliente c on d.idDatos = c.idDatos
		where DNI = P_DNI and pass = P_password;
        
		SELECT idCliente into P_idCliente
		FROM datos d
        join cliente c on d.idDatos = c.idDatos
		where DNI = P_DNI and pass = P_password;
        
    ELSE
    
		select count(*) INTO V_COUNT FROM datos
		where DNI = P_DNI;
    
			IF V_COUNT = 1 THEN 
    
				SELECT CONCAT((SELECT mensaje FROM mensaje WHERE idMensaje = 11), ' CLIENTE: ', concat(nombre,' ', apellido)) AS MENSAJE
				FROM datos d
				join cliente c on d.idDatos = c.idDatos
				where DNI = P_DNI
				;
    
			ELSE
    
				SELECT mensaje FROM mensaje WHERE idMensaje = 12;
    
			END IF;
    
    END IF;
    
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Login_Usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Login_Usuario`(

IN P_AKA VARCHAR(9), P_pass char(8),
OUT P_ID INT
)
begin

declare V_COUNT INT;

    select count(*) INTO V_COUNT FROM usuario
    where aka = P_AKA and pass = P_pass;
    
    IF V_COUNT = 1 THEN 
    
		SELECT CONCAT((SELECT mensaje FROM mensaje WHERE idMensaje = 10), ' USUARIO: ', AKA) as MENSAJE, idUsuario as id
		FROM usuario
		where aka = P_AKA and pass = P_pass
		;
		SELECT idUsuario INTO P_ID
		FROM usuario
		where aka = P_AKA and pass = P_pass
		;
    ELSE
		SET P_ID := 0;
		select count(*) INTO V_COUNT FROM usuario
		where aka = P_AKA;
    
			IF V_COUNT = 1 THEN 
    
				SELECT CONCAT((SELECT mensaje FROM mensaje WHERE idMensaje = 11), ' USUARIO: ', AKA) AS MENSAJE
				FROM usuario
				where aka = P_AKA
				;

			ELSE
    
				SELECT mensaje FROM mensaje WHERE idMensaje = 12;
    
			END IF;
    
    END IF;
    
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Mostrar_Detalle_Venta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Mostrar_Detalle_Venta`(

IN `p_idCliente`int

)
BEGIN

	SELECT 
		   
           dv.idDetalle_Venta,
           dv.idVenta,
           codVenta as 'CODIGO _VENTA', 
		   codCliente as 'CODIGO_CLIENTE',  
           codDetVenta as 'CODIGO_DETALLE',
           f.detFecha as FECHA,
           e.desEstado as ESTADO,
           concat(a.Nombre,' ', a.Apellido) AS CLIENTE,
           t.detalle as TIPO,
           p.nomProd as PRODUCTO,
           m.nombMarca as MARCA,
           p.precio as PRECIO,
           dv.cantidad as CANTIDAD, 
           dv.descuento as DESCUENTO,
           dv.subTotal as SUBTOTAL
           
    FROM detalle_venta dv
    
    join ventas v on dv.idVenta = v.idVenta
    join fecha f on v.idFecha = f.idFecha
    join producto p on dv.idItem = p.idProducto
    join marca_producto m on p.idMarcaProducto = m.idMarcaProducto
    join tipo_producto t on p.idTipo_producto = t.idTipo_producto
    join cliente c ON c.idCliente = v.idCliente
    join datos a on c.idDatos = a.idDatos
    join estado e on dv.idEstado = e.idEstado
    
    WHERE v.idCliente = P_idCliente AND dv.idEstado = 3
    
	ORDER BY v.idFecha desc;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Mostrar_Detalle_Venta_Interno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Mostrar_Detalle_Venta_Interno`(

IN `P_idVenta` int

)
BEGIN

	SELECT 
		   
           dv.idDetalle_Venta,
           dv.idVenta,
           codVenta as 'CODIGO _VENTA', 
		   codCliente as 'CODIGO_CLIENTE',  
           codDetVenta as 'CODIGO_DETALLE',
           f.detFecha as FECHA,
           e.desEstado as ESTADO,
           concat(a.Nombre,' ', a.Apellido) AS CLIENTE,
           t.detalle as TIPO,
           p.nomProd as PRODUCTO,
           m.nombMarca as MARCA,
           p.precio as PRECIO,
           dv.cantidad as CANTIDAD, 
           dv.descuento as DESCUENTO,
           dv.subTotal as SUBTOTAL
           
    FROM detalle_venta dv
    
    join ventas v on dv.idVenta = v.idVenta
    join fecha f on v.idFecha = f.idFecha
    join producto p on dv.idItem = p.idProducto
    join marca_producto m on p.idMarcaProducto = m.idMarcaProducto
    join tipo_producto t on p.idTipo_producto = t.idTipo_producto
    join cliente c ON c.idCliente = v.idCliente
    join datos a on c.idDatos = a.idDatos
    join estado e on dv.idEstado = e.idEstado
    
	ORDER BY v.idFecha desc;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Mostrar_Detalle_Venta_Pagada` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Mostrar_Detalle_Venta_Pagada`(

IN `p_idCliente`int, `P_idVenta` int

)
BEGIN

	SELECT 
		   
           codVenta as 'CODIGO _VENTA', 
		   codCliente as 'CODIGO_CLIENTE',  
           codDetVenta as 'CODIGO_DETALLE',
           f.detFecha as FECHA,
           e.desEstado as ESTADO,
           concat(a.Nombre,' ', a.Apellido) AS CLIENTE,
           t.detalle as TIPO,
           p.nomProd as PRODUCTO,
           m.nombMarca as MARCA,
           p.precio as PRECIO,
           dv.cantidad as CANTIDAD, 
           dv.descuento as DESCUENTO,
           dv.subTotal as SUBTOTAL
           
    FROM detalle_venta dv
    
    join ventas v on dv.idVenta = v.idVenta
    join fecha f on v.idFecha = f.idFecha
    join producto p on dv.idItem = p.idProducto
    join marca_producto m on p.idMarcaProducto = m.idMarcaProducto
    join tipo_producto t on p.idTipo_producto = t.idTipo_producto
    join cliente c ON c.idCliente = v.idCliente
    join datos a on c.idDatos = a.idDatos
    join estado e on dv.idEstado = e.idEstado
    
    WHERE dv.idVenta = P_idVenta and v.idCliente = P_idCliente AND dv.idEstado = 4
    
	ORDER BY v.idFecha desc;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Mostrar_Venta_Interno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Mostrar_Venta_Interno`(

)
BEGIN

	SELECT 
		   
           idVenta,
           codVenta as 'CODIGO_VENTA', 
		   codCliente as 'CODIGO_CLIENTE',  
           e.desestado as ESTADO,
           concat(a.Nombre,' ', a.Apellido) 			AS CLIENTE, 
           (select sum(subtotal) FROM detalle_venta t 
           join ventas v on t.idVenta = v.idVenta 
           where v.idVenta = t.idVenta) 				as TOTAL, 
           f.detFecha AS fecha 
    
    FROM ventas v
    
    join fecha f on v.idFecha = f.idFecha
    join cliente c ON v.idCliente = c.idCliente
    join datos a on c.idDatos = a.idDatos
    join estado e on v.idEstado = e.idEstado
    ORDER BY v.idFecha desc;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Mostrar_Venta_Pagada` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Mostrar_Venta_Pagada`(

IN P_idCliente int

)
BEGIN

select v.idVenta, 
		   v.codVenta as 'CODIGO_VENTA', 
		   c.codCliente as 'CODIGO_CLIENTE',  
           e.desestado as ESTADO,
           concat(a.Nombre,' ', a.Apellido) 			AS CLIENTE,
		   sum(subtotal) as TOTAL,
           f.detFecha AS fecha 
           
           FROM detalle_venta t 
           join ventas v on t.idVenta = v.idVenta
           join fecha f on v.idFecha = f.idFecha
		   join cliente c ON v.idCliente = c.idCliente
           join datos a on c.idDatos = a.idDatos
		   join estado e on v.idEstado = e.idEstado
           WHERE v.idEstado = 4 and v.idCliente = P_idCliente
           group by(v.idVenta) order by v.idVenta desc, v.idfecha desc				 
    
    ;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Mostrar_Venta_Por_Pagar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Mostrar_Venta_Por_Pagar`(

IN P_idCliente int,
OUT P_idVenta int

)
BEGIN

Select idVenta into P_idVenta FROM ventas v WHERE v.idEstado = 3 and v.idCliente = P_idCliente;

	SELECT 
		   
           codVenta as 'CODIGO_VENTA', 
		   codCliente as 'CODIGO_CLIENTE',  
           e.desestado as ESTADO,
           concat(a.Nombre,' ', a.Apellido) 			AS CLIENTE, 
           (select sum(subtotal) FROM detalle_venta t 
           join ventas v on t.idVenta = v.idVenta
           where t.idEstado = 3 and v.idCliente = P_idCliente) 		as TOTAL, 
           f.detFecha AS fecha 
    
    FROM ventas v
    
    join fecha f on v.idFecha = f.idFecha
    join cliente c ON v.idCliente = c.idCliente
    join datos a on c.idDatos = a.idDatos
    join estado e on v.idEstado = e.idEstado
    WHERE v.idEstado = 3 and v.idCliente = P_idCliente
    ORDER BY v.idFecha desc;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Pagar_Reserva_Por_Cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Pagar_Reserva_Por_Cliente`(

    IN P_idCliente int,
    IN P_idReserva int
        
)
BEGIN

	DECLARE V_COUNT INT;    

SELECT count(*) into V_COUNT FROM reserva r 
join fecha h ON r.idHoraIni = h.idFecha 
join fecha f ON r.idHoraFin = f.idFecha
join servicio s ON r.idServicio = s.idServicio
where idCliente = P_idCliente and r.idestado = 3;

IF V_COUNT > 0 THEN 

UPDATE reserva r set idEstado = 4
where r.idCliente = P_idCliente and r.idestado = 3 and r.idReserva = P_idReserva;
COMMIT;
SELECT

CONCAT('SE PAGÓ LA reserva DEL CLIENTE: ', d.Nombre, ' ', d.ApelLido,'.') AS MENSAJE

FROM cliente c

join datos d on d.idDatos = c.idDatos

where c.idCliente = P_idCliente;

ELSE

SELECT 

CONCAT('NO EXISTEN RESERVAS PENDIENTES PARA EL CLIENTE: ', d.Nombre, ' ', d.ApelLido,'.') AS MENSAJE

FROM cliente c

join datos d on d.idDatos = c.idDatos

where c.idCliente = P_idCliente;

END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Recuperar_Barbero_Android` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Recuperar_Barbero_Android`(
in P_idBarbero int
)
BEGIN

SELECT 

c.idBarbero,
concat(d.nombre,' ',d.apellido)	as 'Nombre_del_Barbero'
    
FROM barbero c
join datos d on c.idDatos = d.idDatos
join estado e on c.idestado = e.idEstado

where idBarbero = P_idBarbero;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Recuperar_Barbero_Interno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Recuperar_Barbero_Interno`(
in P_idBarbero int
)
BEGIN

SELECT 

c.idEstado,
nombre,
apellido,
telefono,
dni,
correo,
direccion
    
FROM barbero c
join datos d on c.idDatos = d.idDatos
join estado e on c.idestado = e.idEstado

where idBarbero = P_idBarbero;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Recuperar_Cliente_Interno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Recuperar_Cliente_Interno`(
in P_ID int
)
BEGIN

SELECT 

	d.nombre,
    d.apellido, 
    d.telefono,
    d.dni,
    d.correo,
    direccion,
	c.idEstado
    
FROM cliente c
join datos d on c.idDatos = d.idDatos
join estado e on c.idestado = e.idEstado

where idCliente = P_ID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Recuperar_Detalle_Venta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Recuperar_Detalle_Venta`(

IN `P_idDetalle_Venta`int

)
BEGIN

	SELECT 
		   p.stock,
           p.precio,
           dv.cantidad,
           dv.descuento,
           dv.subTotal
           
    FROM detalle_venta dv
    
	join producto p on dv.idItem = p.idProducto
    
    WHERE dv.idDetalle_Venta = P_idDetalle_Venta AND dv.idEstado = 3;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Recuperar_Marca_Interno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Recuperar_Marca_Interno`(
in P_ID int
)
BEGIN

SELECT 

	nombMarca,
    p.idEstado
    
FROM marca_producto p
join estado e on p.idestado = e.idEstado
where p.idMarcaProducto = P_ID
;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Recuperar_Producto_Android` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Recuperar_Producto_Android`(
in P_ID INT
)
BEGIN

DECLARE V_COUNT INT;

SELECT 

	p.idProducto,
    p.nomProd,
    precio,
    descripcion
    
FROM producto p

where idProducto = P_ID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Recuperar_Producto_Interno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Recuperar_Producto_Interno`(
in P_ID INT
)
BEGIN

DECLARE V_COUNT INT;

SELECT 

	p.idMarcaProducto,
    p.idTipo_producto,
    p.nomProd,
    p.idEstado,
    stock,
    precio,
    p.descripcion
    
FROM producto p

join marca_producto m on p.idMarcaProducto = m.idMarcaProducto
join tipo_producto t on p.idTipo_producto = t.idTipo_producto

where idProducto = P_ID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Recuperar_Reserva_Por_Cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Recuperar_Reserva_Por_Cliente`(

    IN P_idCliente int,
    IN P_idReserva int
        
)
BEGIN

	DECLARE V_COUNT INT;    

SELECT count(*) into V_COUNT FROM reserva r 
join fecha h ON r.idHoraIni = h.idFecha 
join fecha f ON r.idHoraFin = f.idFecha
join servicio s ON r.idServicio = s.idServicio
where idCliente = P_idCliente and r.idestado = 3;

IF V_COUNT > 0 THEN 

SELECT 

r.idReserva,
r.codReserva as CODIGO,
CONCAT(d.Nombre, ' ', d.ApelLido) as 'CLIENTE',
s.nomServ as SERVICIO,
CONCAT(t.Nombre, ' ', t.ApelLido) as 'BARBERO',
h.detFecha as 'INICIO',
f.detFecha as 'FIN',
e.desEstado as 'ESTADO'

FROM reserva r

join cliente c on r.idCliente = c.idCliente
join barbero b on r.idBarbero = b.idBarbero
join datos d on d.idDatos = c.idDatos
join datos t on t.idDatos = b.idDatos
join fecha h on r.idHoraIni = h.idFecha
join fecha f on r.idHoraFin = f.idFecha
join servicio s on r.idServicio = s.idServicio
join estado e on r.idEstado = e.idEstado

where r.idCliente = P_idCliente and r.idReserva = P_idReserva;

ELSE

SELECT 

CONCAT('NO EXISTEN RESERVAS PENDIENTES PARA EL CLIENTE: ', d.Nombre, ' ', d.ApelLido,'.') AS MENSAJE

FROM cliente c

join datos d on d.idDatos = c.idDatos

where c.idCliente = P_idCliente;

END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Recuperar_Servicio_Android` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Recuperar_Servicio_Android`(
in P_idServicio int
)
BEGIN

SELECT 
	idServicio,
	nomServ,
    minutos,
    precio

FROM servicio s
join estado e on s.idestado = e.idEstado

where idServicio = P_idServicio;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Recuperar_Servicio_Interno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Recuperar_Servicio_Interno`(
in P_idServicio int
)
BEGIN

SELECT 

	nomServ,
    s.idEstado,
    minutos,
    precio,
    descripcion,
    modifiedBy

FROM servicio s
join estado e on s.idestado = e.idEstado

where idServicio = P_idServicio;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Recuperar_TipoProducto_Interno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Recuperar_TipoProducto_Interno`(
in p_id int
)
BEGIN

SELECT 

    detalle,
    p.idEstado
    
FROM tipo_producto p
where idTipo_producto = p_id
;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Recuperar_Tipo_Usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Recuperar_Tipo_Usuario`(
)
BEGIN

declare idvoid int;
declare msgvoid varchar(50);

DECLARE V_COUNT INT;

SELECT COUNT(*) INTO V_COUNT FROM tipo_usuario t left join usuario u on t.idTipo_usuario = u.idTipo_usuario where u.idTipo_usuario is null;

IF V_COUNT > 0 THEN 

select t.detalle,  t.idTipo_usuario FROM tipo_usuario t left join usuario u on t.idTipo_usuario = u.idTipo_usuario where u.idTipo_usuario is null;

else

set @idvoid = 0;
set @msjvoid = 'ROLES OCUPADOS';

select  @msjvoid, @idvoid;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Recuperar_Usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Recuperar_Usuario`(
in P_id int
)
BEGIN

SELECT 

	nombre,
	apellido,
    cargo,
	aka,
    correo,
    telefono,
    descripcion
    
FROM usuario c

where idUsuario like P_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Registrar_Detalle_Venta_Pagada` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Registrar_Detalle_Venta_Pagada`(

    IN P_idCliente int,
    IN P_idDetalle_Venta int
        
)
BEGIN

	DECLARE V_COUNT INT;    
    DECLARE V_PRODUCTO INT; 
    DECLARE V_VENTA INT;

SELECT COUNT(*) INTO V_COUNT FROM detalle_venta dv 
join ventas v on dv.idVenta = v.idVenta
WHERE idDetalle_Venta = P_idDetalle_Venta AND dv.idEstado = 3 and v.idcliente =  P_idCliente;

IF V_COUNT > 0 THEN 
	    
SELECT idVenta INTO  V_VENTA  FROM detalle_venta WHERE idDetalle_Venta = P_idDetalle_Venta;
        
SELECT COUNT(*) INTO V_COUNT FROM detalle_venta D
JOIN ventas V ON D.IDVENTA = V.IDVENTA
WHERE D.idVenta = V_VENTA AND D.idEstado = 3;

IF V_COUNT = 1 THEN

UPDATE ventas SET idEstado = 4 WHERE IDVENTA = V_VENTA;

END IF;        
        
UPDATE detalle_venta SET idEstado = 4 WHERE idVenta = V_VENTA and idDetalle_Venta = P_idDetalle_Venta ;

SELECT D.idItem into V_PRODUCTO FROM detalle_venta D WHERE idDetalle_Venta = P_idDetalle_Venta;

update producto SET stock = (stock - (SELECT Cantidad FROM detalle_venta D WHERE D.idDetalle_Venta = P_idDetalle_Venta))
WHERE idProducto = V_PRODUCTO;

SELECT COUNT(*) INTO V_COUNT FROM detalle_venta WHERE idVenta = V_VENTA and idDetalle_Venta = P_idDetalle_Venta AND idEstado = 4;

IF V_COUNT = 1 THEN 

SELECT CONCAT((SELECT mensaje FROM mensaje WHERE idMensaje = 1), ': ', desEstado) as MENSAJE
FROM detalle_venta v
join estado e on v.idEstado = e.idEstado
WHERE idVenta = V_VENTA and idDetalle_Venta = P_idDetalle_Venta;

COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT idVenta INTO  V_VENTA  FROM detalle_venta WHERE idDetalle_Venta = P_idDetalle_Venta;

SELECT CONCAT((SELECT mensaje FROM mensaje WHERE idMensaje = 1), ': ', desEstado) as MENSAJE
FROM detalle_venta v
join estado e on v.idEstado = e.idEstado
WHERE idVenta = V_VENTA and idDetalle_Venta = P_idDetalle_Venta;

END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Registrar_Detalle_Venta_Por_Pagar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Registrar_Detalle_Venta_Por_Pagar`(

	IN 	P_idCliente int, P_idItem int, P_Cantidad int,
    OUT P_VENTA INT	
    
)
BEGIN

	declare V_MAX int;
	declare V_COD char(5);
    DECLARE V_IDFECHA INT;
    declare V_DETFECHA DATETIME;
    declare V_DESCUENTO DOUBLE;
    declare V_PRECIO DOUBLE;
    declare V_SUBTOTAL DOUBLE;
	DECLARE V_COUNT INT;   
    DECLARE V_IDVENTA INT;
    DECLARE V_STOCK INT;
    
    SELECT STOCK INTO V_STOCK FROM producto WHERE IDPRODUCTO = P_idItem;
    
if P_cantidad > V_STOCK then
SELECT CONCAT(MENSAJE,', NO HAY STOCK DISPONIBLE.') AS mensaje FROM mensaje WHERE IDMENSAJE = 2;
SET P_VENTA = 0;
else    
        
SELECT COUNT(*) INTO V_COUNT FROM detalle_venta WHERE codDetVenta = V_COD;

IF V_COUNT = 0 THEN 

SELECT COUNT(*) INTO V_COUNT FROM ventas WHERE idCliente = P_idCliente and idEstado = 3;

if V_COUNT = 0 then

    	set V_MAX = ( select idVenta FROM ventas order by idVenta desc limit 1 );
	if V_MAX >= 1 and V_MAX <= 8 then
		set V_MAX = V_MAX + 1;
		set V_COD = (select concat('V000'  ,  CAST(V_MAX as CHAR)));
	elseif V_MAX >= 9 and V_MAX <= 98 then
		set V_MAX = V_MAX + 1;
		set V_COD = (select concat('V00'  ,  CAST(V_MAX as CHAR)));
	elseif V_MAX >= 99 and V_MAX <= 998 then
		set V_MAX = V_MAX + 1;
		set V_COD = (select concat('V0'  ,  CAST(V_MAX as CHAR)));
	elseif V_MAX >= 999 and V_MAX <= 9998 then
		set V_MAX = V_MAX + 1;
		set V_COD = (select concat('V'  ,  CAST(V_MAX as CHAR)));
	else 
		set V_COD = (select 'V0001');
	end if;
    

SET V_DETFECHA := CURTIME();
    
	INSERT INTO fecha (DETFECHA, REGISTERED) VALUES ( V_DETFECHA, CURTIME() );
	SELECT IDFECHA INTO V_IDFECHA FROM fecha WHERE DETFECHA = V_DETFECHA and registered = CURTIME();    
        
INSERT INTO ventas 

	(codVenta,
    idCliente,
    idEstado,idFecha) 
    
VALUES 

	(UPPER(V_COD),
    P_idCliente,
    3, V_IDFECHA);
    
    COMMIT;

SELECT idVenta into V_IDVENTA
FROM ventas v
join estado e on v.idEstado = e.idEstado
where codVenta = V_COD;

else

SELECT idVenta into V_IDVENTA
FROM ventas WHERE idCliente = P_idCliente and idEstado = 3;

end if;

    	set V_MAX = ( select idDetalle_Venta FROM detalle_venta order by idDetalle_Venta desc limit 1);
	if V_MAX >= 1 and V_MAX <= 8 then
		set V_MAX = V_MAX + 1;
		set V_COD = (select concat('D000'  ,  CAST(V_MAX as CHAR)));
	elseif V_MAX >= 9 and V_MAX <= 98 then
		set V_MAX = V_MAX + 1;
		set V_COD = (select concat('D00'  ,  CAST(V_MAX as CHAR)));
	elseif V_MAX >= 99 and V_MAX <= 998 then
		set V_MAX = V_MAX + 1;
		set V_COD = (select concat('D0'  ,  CAST(V_MAX as CHAR)));
	elseif V_MAX >= 999 and V_MAX <= 9998 then
		set V_MAX = V_MAX + 1;
		set V_COD = (select concat('D'  ,  CAST(V_MAX as CHAR)));
	else 
		set V_COD = (select 'D0001');
	end if;
    
    if P_Cantidad >= 2 and P_Cantidad <= 3 then
		set V_DESCUENTO = 0.97;
	elseif P_Cantidad >= 4 and P_Cantidad <= 6 then
		set V_DESCUENTO = 0.95;
	elseif P_Cantidad >= 7 and P_Cantidad <= 10 then
		set V_DESCUENTO = 0.9;
	elseif P_Cantidad >= 11 and P_Cantidad <= 15 then
		set V_DESCUENTO = 0.85;
	else 
		set V_DESCUENTO := 1;
    end if;
    
    select precio into V_PRECIO
    FROM producto where idProducto = P_idItem;
    
    set V_SUBTOTAL := V_DESCUENTO*(P_Cantidad*V_PRECIO);
        
INSERT INTO detalle_venta 

	(codDetVenta,
    idVenta, idEstado,
    idItem, cantidad,
    descuento, subtotal) 
    
VALUES 

	(UPPER(V_COD),
    V_IDVENTA, 3,
    P_idItem, P_Cantidad,
    V_DESCUENTO, V_SUBTOTAL);

SELECT COUNT(*) INTO V_COUNT FROM detalle_venta WHERE codDetVenta = V_COD;

IF V_COUNT = 1 THEN 

SELECT CONCAT((SELECT mensaje FROM mensaje WHERE idMensaje = 1), ': ', desEstado) as MENSAJE
FROM detalle_venta v
join estado e on v.idEstado = e.idEstado
where codDetVenta = V_COD;

SET P_VENTA = V_IDVENTA;

COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE,', DEBE TRATARSE DE UN REGISTRO DUPLICADO.') AS mensaje FROM mensaje WHERE IDMENSAJE = 2;

END IF;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp.Registrar_Venta_Pagada` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Registrar_Venta_Pagada`(

	IN P_idCliente int
        
)
BEGIN

	DECLARE V_COUNT INT;
    DECLARE V_IDVENTA INT;

SELECT COUNT(*) into V_COUNT FROM ventas WHERE idCliente = P_idCliente AND idEstado = 3;

IF V_COUNT = 1 THEN 
	    
SELECT IDVENTA INTO V_IDVENTA FROM ventas WHERE idCliente = P_idCliente and idEstado = 3;        
UPDATE ventas SET idEstado = 4 where idCliente = P_idCliente;
CALL `sp.Registrar_Detalle_Venta_Por_Pagar`();

SELECT COUNT(*) into V_COUNT FROM ventas WHERE idVenta = V_IDVENTA and idCliente = P_idCliente AND idEstado = 4;

IF V_COUNT = 1 THEN 

SELECT CONCAT((SELECT mensaje FROM mensaje WHERE idMensaje = 1), ': ', desEstado) as MENSAJE
FROM ventas v
join estado e on v.idEstado = e.idEstado
WHERE idVenta = V_IDVENTA and idCliente = P_idCliente;

COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT((SELECT mensaje FROM mensaje WHERE idMensaje = 1), ': ', desEstado) as MENSAJE
FROM ventas v
join estado e on v.idEstado = e.idEstado
WHERE idCliente = P_idCliente;

END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-28 14:48:34
