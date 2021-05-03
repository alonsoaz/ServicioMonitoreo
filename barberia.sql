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
/*!40101 SET NAMES utf8 */;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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

SELECT COUNT(*) INTO V_COUNT FROM DATOS d
join cliente c on d.iddatos = c.iddatos
WHERE DNI = P_DNI;

IF V_COUNT = 0 THEN 

SELECT idDatos into V_IDDATOS FROM Datos WHERE DNI = P_DNI; 

INSERT INTO FECHA (DETFECHA, REGISTERED) VALUES ( V_DETFECHA, CURTIME() );
SELECT IDFECHA INTO V_IDFECHA FROM FECHA WHERE DETFECHA = V_DETFECHA;

UPDATE Datos 

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

SELECT COUNT(*) INTO V_COUNT FROM DATOS d
join barbero c on d.iddatos = c.iddatos
WHERE DNI = P_DNI;

IF V_COUNT = 1 THEN 

SELECT CONCAT(MENSAJE,'') AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 3;
COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE, ' POSIBLEMENTE SE TRATE DE UN REGISTRO DUPLICADO') AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 4;

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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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

SELECT COUNT(*) INTO V_COUNT FROM DATOS WHERE DNI = P_DNI;

SELECT COUNT(*) INTO V_COUNT FROM DATOS d
join barbero c on d.iddatos = c.iddatos
WHERE DNI = P_DNI;

IF V_COUNT = 0 THEN 

SELECT idDatos into V_IDDATOS FROM Datos WHERE DNI = P_DNI; 

INSERT INTO FECHA (DETFECHA, REGISTERED) VALUES ( V_DETFECHA, CURTIME() );
SELECT IDFECHA INTO V_IDFECHA FROM FECHA WHERE DETFECHA = V_DETFECHA;

UPDATE Datos 

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

SELECT COUNT(*) INTO V_COUNT FROM DATOS d
join cliente c on d.iddatos = c.iddatos
WHERE DNI = P_DNI;

IF V_COUNT = 1 THEN 

SELECT CONCAT(MENSAJE,'') AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 3;
COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE, ' POSIBLEMENTE SE TRATE DE UN REGISTRO DUPLICADO') AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 4;

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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
SELECT CONCAT(MENSAJE,', NO HAY STOCK DISPONIBLE.') AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 2;
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

SELECT CONCAT((SELECT MENSAJE FROM mensaje WHERE idMensaje = 3), ': ', desEstado) as MENSAJE
FROM detalle_venta v
join estado e on v.idEstado = e.idEstado
WHERE idVenta = P_idVenta and idDetalle_Venta = P_idDetalle_Venta;

COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE,', NO SE PUDO CAMBIAR LA CANTIDAD.') AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 2;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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

SELECT CONCAT(MENSAJE,'') AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 3;
COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE) AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 4;

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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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

SELECT COUNT(*) INTO V_COUNT FROM Producto WHERE idProducto = P_idProducto;

IF V_COUNT = 1 THEN 

INSERT INTO FECHA (DETFECHA, REGISTERED) VALUES ( V_DETFECHA, CURTIME() );
SELECT IDFECHA INTO V_IDFECHA FROM FECHA WHERE DETFECHA = V_DETFECHA;

UPDATE Producto 

SET idMarcaProducto = P_marca,
    idTipo_producto = P_tipo,
	nomProd = UPPER(P_nomProd),
    stock = P_stock,
    precio = P_precio,
    descripcion = UPPER(P_descripcion),
    modifiedBy = P_usuario, DATEUPDATED = V_IDFECHA
    
WHERE idProducto = P_idProducto; 

SELECT COUNT(*) INTO V_COUNT FROM Producto WHERE nomProd = UPPER(P_nomProd);

IF V_COUNT = 1 THEN 

SELECT CONCAT(MENSAJE,'') AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 3;
COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE) AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 4;

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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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

SELECT COUNT(*) INTO V_COUNT FROM Servicio WHERE idServicio = P_idServicio;

IF V_COUNT = 1 THEN 

INSERT INTO FECHA (DETFECHA, REGISTERED) VALUES ( V_DETFECHA, CURTIME() );
SELECT IDFECHA INTO V_IDFECHA FROM FECHA WHERE DETFECHA = V_DETFECHA;

UPDATE Servicio 

SET 
	nomServ = UPPER(P_nomServ),
    idestado = P_estado,
    minutos = P_minutos,
    precio = P_precio,
    descripcion = UPPER(P_descripcion),
    modifiedBy = P_usuario, DATEUPDATED = V_IDFECHA
    
WHERE idServicio = P_idServicio; 

SELECT COUNT(*) INTO V_COUNT FROM Servicio WHERE nomServ = UPPER(P_nomServ);

IF V_COUNT = 1 THEN 

SELECT CONCAT(MENSAJE,'') AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 3;
COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE) AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 4;

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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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

SELECT CONCAT(MENSAJE,'') AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 3;
COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE) AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 4;

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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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

SELECT COUNT(*) INTO V_COUNT FROM Usuario WHERE idUsuario = P_idUsuario;

IF V_COUNT = 1 THEN 

UPDATE Usuario 

SET nombre = UPPER(P_nombre),
    apellido = UPPER(P_apellido),
	aka =  UPPER(p_aka),
    correo = P_correo,
    telefono = P_telefono,
    descripcion = UPPER(P_descripcion)
    
WHERE idUsuario = P_idUsuario; 

SELECT COUNT(*) INTO V_COUNT FROM Usuario WHERE idusuario = P_idUsuario;

IF V_COUNT = 1 THEN 

SELECT CONCAT(MENSAJE,'') AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 3;
COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE) AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 4;

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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Buscar_Barbero`(
in P_words varchar(20),
out P_idBarb int
)
BEGIN

DECLARE V_COUNT INT;

SELECT COUNT(*) INTO V_COUNT FROM Barbero c
join datos d on c.idDatos = d.idDatos
join estado e on c.idestado = e.idEstado
where nombre like concat ('%',P_words,'%') or apellido like concat ('%',P_words,'%') or c.codBarbero like concat ('%',P_words,'%');

IF V_COUNT > 0 THEN 

IF V_COUNT = 1 THEN 
SELECT idBarbero into P_idBarb FROM Barbero c
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
    
FROM Barbero c
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Buscar_Barbero_Interno`(
in P_words varchar(20),
out P_idBarbero int
)
BEGIN

DECLARE V_COUNT INT;

SELECT COUNT(*) INTO V_COUNT
FROM Barbero c
join datos d on c.idDatos = d.idDatos
where d.nombre like concat ('%',P_words,'%') or d.apellido like concat ('%',P_words,'%') or c.codBarbero like concat ('%',P_words,'%');

IF V_COUNT > 0 THEN 

IF V_COUNT = 1 THEN
SELECT c.idBarbero INTO P_idBarbero FROM Barbero c join datos d on c.idDatos = d.idDatos
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
    
FROM Barbero c
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Buscar_Cliente_Interno`(
in P_words varchar(20),
out P_ID int
)
BEGIN

DECLARE V_COUNT INT;

SELECT COUNT(*) INTO V_COUNT FROM Cliente c join datos d on c.idDatos = d.idDatos where d.nombre like concat ('%',P_words,'%') or d.apellido like concat ('%',P_words,'%') or codCliente like concat ('%',P_words,'%');

IF V_COUNT > 0 THEN 

if V_COUNT = 1 then
SELECT c.idCliente into P_ID
FROM Cliente c
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
    
FROM Cliente c
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Buscar_Producto`(
in P_words varchar(20),
OUT P_ID INT
)
BEGIN

DECLARE V_COUNT INT;

SELECT COUNT(*) INTO V_COUNT FROM Producto p
join tipo_producto t on p.idTipo_producto = t.idTipo_producto
where nomProd like concat ('%',P_words,'%') or p.descripcion like concat ('%',P_words,'%') or codProducto like concat ('%',P_words,'%')
or p.idMarcaProducto like concat ('%',P_words,'%') or p.idTipo_producto like concat ('%',P_words,'%');

IF V_COUNT > 0 THEN 

IF V_COUNT = 1 THEN
SELECT  idProducto INTO P_ID
FROM Producto p
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
    
FROM Producto p

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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Buscar_Producto_Interno`(
in P_words varchar(20),
OUT P_ID INT
)
BEGIN

DECLARE V_COUNT INT;

SELECT COUNT(*) INTO V_COUNT FROM Producto p
join marca_producto m on p.idMarcaProducto = m.idMarcaProducto
join tipo_producto t on p.idTipo_producto = t.idTipo_producto
where nomProd like concat ('%',P_words,'%') or p.descripcion like concat ('%',P_words,'%') or codProducto like concat ('%',P_words,'%')
or p.idMarcaProducto like concat ('%',P_words,'%') or p.idTipo_producto like concat ('%',P_words,'%');

IF V_COUNT > 0 THEN 
IF V_COUNT = 1 THEN
SELECT  p.idProducto INTO P_ID
FROM Producto p 
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
    
FROM Producto p

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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Buscar_Servicio_Interno`(
in P_words varchar(20),
out P_idServicio int
)
BEGIN

DECLARE V_COUNT INT;

SELECT COUNT(*) INTO V_COUNT FROM Servicio
where nomServ like concat ('%',P_words,'%') or descripcion like concat ('%',P_words,'%') or codServicio like concat ('%',P_words,'%');

IF V_COUNT > 0 THEN 

IF V_COUNT = 1 THEN 

SELECT 	idServicio into P_idServicio
FROM Servicio 
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

FROM Servicio s
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Buscar_Usuario`(
in P_words varchar(20),
out P_id int
)
BEGIN

DECLARE V_COUNT INT;

SELECT COUNT(*) INTO V_COUNT FROM USUARIO where nombre like concat ('%',P_words,'%') or apellido like concat ('%',P_words,'%') or codUsuario like concat ('%',P_words,'%');

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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Cambiar_Clave_Cliente`(
in
	P_idCliente int, p_pass char(8),
    p_newPass char(8) 
)
BEGIN

DECLARE V_COUNT INT;

SELECT COUNT(*) into V_COUNT FROM Cliente WHERE idCliente = P_idCliente and pass = p_pass;

IF V_COUNT = 1 THEN 

UPDATE Cliente SET pass = p_newPass WHERE idCliente = P_idCliente; 

SELECT COUNT(*) INTO V_COUNT FROM Cliente WHERE idCliente = P_idCliente AND pass = p_newPass;

IF V_COUNT = 1 THEN 

SELECT CONCAT(MENSAJE,'') AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 13;
COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE) AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 4;

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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Cambiar_Clave_Usuario`(
in
	P_idUsuario int,
    p_pass char(8),
    p_newPass char(8)
    
)
BEGIN

DECLARE V_COUNT INT;

SELECT COUNT(*) INTO V_COUNT FROM Usuario WHERE idUsuario = P_idUsuario and pass = p_pass;

IF V_COUNT = 1 THEN 

UPDATE Usuario 

SET pass = p_newPass
    
WHERE idUsuario = P_idUsuario; 

SELECT COUNT(*) INTO V_COUNT FROM Usuario WHERE idUsuario = P_idUsuario AND pass = p_newPass;

IF V_COUNT = 1 THEN 

SELECT CONCAT(MENSAJE,'') AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 13;
COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE) AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 4;

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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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

SELECT count(*) into V_COUNT_A FROM RESERVA r 
join FECHA h ON r.idHoraIni = h.idFecha 
join FECHA f ON r.idHoraFin = f.idFecha
join servicio s ON r.idServicio = s.idServicio
where r.idServicio = 1 AND CAST(ADDTIME(CAST(P_DTconsulta AS DATETIME), concat('00:',minutos,':00')) AS DATETIME) between h.detfecha and f.detFecha and idBarbero = P_idBarbero;

-- DURANTE

SELECT count(*) into V_COUNT_D FROM RESERVA r 
join FECHA h ON r.idHoraIni = h.idFecha 
join FECHA f ON r.idHoraFin = f.idFecha
where CAST(P_DTconsulta AS DATETIME) between h.detfecha and f.detFecha and idBarbero = P_idBarbero;

IF V_COUNT_A = 1 OR V_COUNT_D = 1 THEN 

IF V_COUNT_A = 1 AND V_COUNT_D = 1 THEN

SET V_Y := ' Y ';

ELSE

SET V_Y := '';

END IF;

IF V_COUNT_A = 1 THEN 

SELECT r.idReserva into V_RESERVA FROM RESERVA r 
join FECHA h ON r.idHoraIni = h.idFecha 
join FECHA f ON r.idHoraFin = f.idFecha
join servicio s ON r.idServicio = s.idServicio
where r.idServicio = P_idServicio AND CAST(ADDTIME(CAST(P_DTconsulta AS DATETIME), concat('00:',minutos,':00')) AS DATETIME) between h.detfecha and f.detFecha and idBarbero = P_idBarbero;

SELECT CONCAT(
' ENTRE LAS: ', h.detFecha, ' Y ', f.detFecha, ' '
) into V_A FROM RESERVA r
join FECHA h ON r.idHoraIni = h.idFecha 
join FECHA f ON r.idHoraFin = f.idFecha
join servicio s ON r.idServicio = s.idServicio
where r.idServicio = P_idServicio AND CAST(ADDTIME(CAST(P_DTconsulta AS DATETIME), concat('00:',minutos,':00')) AS DATETIME) between h.detfecha and f.detFecha and idBarbero = P_idBarbero;

else

set V_A := '';

END IF;

IF V_COUNT_D = 1 THEN 

SELECT r.idReserva into V_RESERVA FROM RESERVA r 
join FECHA h ON r.idHoraIni = h.idFecha 
join FECHA f ON r.idHoraFin = f.idFecha
where CAST(P_DTconsulta AS DATETIME) between h.detfecha and f.detFecha and idBarbero = P_idBarbero;

SELECT CONCAT(
' ENTRE LAS: ', h.detFecha, ' Y ', f.detFecha, ' '
) into V_D FROM RESERVA r
join FECHA h ON r.idHoraIni = h.idFecha 
join FECHA f ON r.idHoraFin = f.idFecha
where CAST(P_DTconsulta AS DATETIME) between h.detfecha and f.detFecha and idBarbero = P_idBarbero;

else

set V_D := '';

END IF;

SELECT CONCAT(MENSAJE,'. BARBERO: ', (SELECT CONCAT(NOMBRE, ' ', APELLIDO) FROM BARBERO B JOIN DATOS D ON B.IDDATOS = D.IDDATOS where IDBARBERO = P_idBarbero), V_A, V_Y, V_D) AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 15;

ELSE

SELECT CONCAT(MENSAJE,'. BARBERO: ', (SELECT CONCAT(NOMBRE, ' ', APELLIDO) FROM BARBERO B JOIN DATOS D ON B.IDDATOS = D.IDDATOS where IDBARBERO = P_idBarbero)) AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 7;

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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Eliminar_Barbero`(
in
		P_idBarbero int
)
BEGIN

DECLARE V_COUNT INT;
DECLARE V_IDDATOS INT;

SELECT COUNT(*) INTO V_COUNT FROM Barbero WHERE idBarbero = P_idBarbero;

IF V_COUNT = 1 THEN 

SELECT d.idDatos into V_IDDATOS FROM Barbero B
Join Datos d on B.idDatos = d.idDatos
WHERE idBarbero = P_idBarbero;

DELETE FROM Barbero WHERE idBarbero = P_idBarbero;
DELETE FROM Datos WHERE idDatos = V_IDDATOS; 

SELECT COUNT(*) INTO V_COUNT FROM DATOS WHERE idDatos = V_IDDATOS; 

IF V_COUNT = 0 THEN 

SELECT CONCAT(MENSAJE,'') AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 5;
COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE,'') AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 6;

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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Eliminar_Cliente`(
in
		P_idCliente int
)
BEGIN

DECLARE V_COUNT INT;
DECLARE V_IDDATOS INT;

SELECT COUNT(*) INTO V_COUNT FROM Cliente WHERE idCliente = P_idCliente;

IF V_COUNT = 1 THEN 

SELECT d.idDatos into V_IDDATOS FROM Cliente B
Join Datos d on B.idDatos = d.idDatos
WHERE idCliente = P_idCliente;

DELETE FROM Cliente WHERE idCliente = P_idCliente;
DELETE FROM Datos WHERE idDatos = V_IDDATOS; 

SELECT COUNT(*) INTO V_COUNT FROM DATOS WHERE idDatos = V_IDDATOS; 

IF V_COUNT = 0 THEN 

SELECT CONCAT(MENSAJE,'') AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 5;
COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE,'') AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 6;

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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Eliminar_Detalle_Venta`(

IN P_idDetalle_Venta int

)
BEGIN

DECLARE V_COUNT INT;
declare venta int;

SELECT COUNT(*) INTO V_COUNT FROM DETALLE_VENTA WHERE idDetalle_Venta = P_idDetalle_Venta and idEstado = 3;

IF V_COUNT = 1 THEN 

	select idventa into venta from DETALLE_VENTA WHERE idDetalle_Venta = P_idDetalle_Venta;
	DELETE FROM DETALLE_VENTA WHERE idDetalle_Venta = P_idDetalle_Venta;
    
    select count(*) into v_count from DETALLE_VENTA where idVenta = venta and idEstado = 3;
    
    if V_COUNT = 0 then
    
    update ventas set idEstado = 4 where idVenta = venta;
    
    select count(*) into v_count from DETALLE_VENTA where idVenta = venta and idEstado = 4;
    
    if V_COUNT = 0 then
    
    delete from ventas where idVenta = venta and idEstado = 3;
    
    end if;
    
    end if;
    
SELECT COUNT(*) INTO V_COUNT FROM DETALLE_VENTA WHERE idDetalle_Venta = P_idDetalle_Venta;

IF V_COUNT = 0 THEN 

SELECT CONCAT(MENSAJE,'') AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 5;
COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE,'') AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 6;

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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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

SELECT CONCAT(MENSAJE,'') AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 5;
COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE,'') AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 6;

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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Eliminar_Producto`(
in
		P_idProducto int
)
BEGIN

DECLARE V_COUNT INT;

SELECT COUNT(*) INTO V_COUNT FROM Producto WHERE idProducto = P_idProducto;

IF V_COUNT = 1 THEN 

DELETE FROM Producto WHERE idProducto = P_idProducto;

SELECT COUNT(*) INTO V_COUNT FROM Producto WHERE idProducto = P_idProducto;

IF V_COUNT = 0 THEN 

SELECT CONCAT(MENSAJE,'') AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 5;
COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE,'') AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 6;

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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Eliminar_Reserva_Por_Cliente`(

    IN P_idCliente int,
    IN P_idReserva int
        
)
BEGIN

	DECLARE V_COUNT INT;    

SELECT count(*) into V_COUNT FROM RESERVA r 
join FECHA h ON r.idHoraIni = h.idFecha 
join FECHA f ON r.idHoraFin = f.idFecha
join servicio s ON r.idServicio = s.idServicio
where idCliente = P_idCliente and r.idestado = 3;

IF V_COUNT > 0 THEN 

DELETE

FROM reserva 

where idCliente = P_idCliente and idReserva = P_idReserva and idEstado = 3;

SELECT 

CONCAT('RESERVA ELIMINADA PARA EL CLIENTE: ',d.Nombre, ' ', d.ApelLido,'.') AS MENSAJE

from cliente c

join datos d on d.idDatos = c.idDatos

where c.idCliente = P_idCliente;

ELSE

SELECT 

CONCAT('NO EXISTEN RESERVAS PENDIENTES PARA EL CLIENTE: ',d.Nombre, ' ', d.ApelLido,'.') AS MENSAJE

from cliente c

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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Eliminar_Servicio`(
in
		P_idServicio int
)
BEGIN

DECLARE V_COUNT INT;

SELECT COUNT(*) INTO V_COUNT FROM Servicio WHERE idServicio = P_idServicio;

IF V_COUNT = 1 THEN 

DELETE FROM Servicio WHERE idServicio = P_idServicio;

SELECT COUNT(*) INTO V_COUNT FROM Servicio WHERE idServicio = P_idServicio;

IF V_COUNT = 0 THEN 

SELECT CONCAT(MENSAJE,'') AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 5;
COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE,'') AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 6;

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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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

SELECT CONCAT(MENSAJE,'') AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 5;
COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE,'') AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 6;

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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Eliminar_Venta`(

IN P_idCliente int

)
BEGIN

DECLARE V_COUNT INT;
DECLARE V_IDVENTA INT;

SELECT COUNT(*) INTO V_COUNT FROM VENTAS WHERE idCliente = P_idCliente and idEstado = 3;

IF V_COUNT = 1 THEN 
	
    SELECT IDVENTA INTO V_IDVENTA FROM ventas WHERE idCliente = P_idCliente and idEstado = 3;
	DELETE FROM DETALLE_VENTA WHERE IDVENTA = V_IDVENTA;
    DELETE FROM VENTAS WHERE idCliente = P_idCliente and idEstado = 3;

SELECT COUNT(*) INTO V_COUNT FROM VENTAS WHERE idVenta = V_IDVENTA;

IF V_COUNT = 0 THEN 

SELECT CONCAT(MENSAJE,'') AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 5;
COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE,'') AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 6;

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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
        
select count(*) into V_COUNT from reserva r
join servicio s on r.idServicio = s.idServicio
join fecha h on r.idHoraIni = h.idFecha
where idBarbero = P_idBarbero and idCliente = P_idCliente and h.detFecha = CAST(P_DTconsulta AS DATETIME) and s.idServicio = P_idServicio;

IF V_COUNT = 0 THEN 

-- ANTES

SELECT count(*) into V_COUNT_A FROM RESERVA r 
join FECHA h ON r.idHoraIni = h.idFecha 
join FECHA f ON r.idHoraFin = f.idFecha
join servicio s ON r.idServicio = s.idServicio
where r.idServicio = 1 AND CAST(ADDTIME(CAST(P_DTconsulta AS DATETIME), concat('00:',minutos,':00')) AS DATETIME) between h.detfecha and f.detFecha and idBarbero = P_idBarbero;

-- DURANTE

SELECT count(*) into V_COUNT_D FROM RESERVA r 
join FECHA h ON r.idHoraIni = h.idFecha 
join FECHA f ON r.idHoraFin = f.idFecha
where CAST(P_DTconsulta AS DATETIME) between h.detfecha and f.detFecha and idBarbero = P_idBarbero;

IF V_COUNT_A = 1 OR V_COUNT_D = 1 THEN 

IF V_COUNT_A = 1 AND V_COUNT_D = 1 THEN

SET V_Y := ' Y ';

ELSE

SET V_Y := '';

END IF;

IF V_COUNT_A = 1 THEN 

SELECT r.idReserva into V_RESERVA FROM RESERVA r 
join FECHA h ON r.idHoraIni = h.idFecha 
join FECHA f ON r.idHoraFin = f.idFecha
join servicio s ON r.idServicio = s.idServicio
where r.idServicio = P_idServicio AND CAST(ADDTIME(CAST(P_DTconsulta AS DATETIME), concat('00:',minutos,':00')) AS DATETIME) between h.detfecha and f.detFecha and idBarbero = P_idBarbero;

SELECT CONCAT(
' ENTRE LAS: ', h.detFecha, ' Y ', f.detFecha, ' '
) into V_A FROM RESERVA r
join FECHA h ON r.idHoraIni = h.idFecha 
join FECHA f ON r.idHoraFin = f.idFecha
join servicio s ON r.idServicio = s.idServicio
where r.idServicio = P_idServicio AND CAST(ADDTIME(CAST(P_DTconsulta AS DATETIME), concat('00:',minutos,':00')) AS DATETIME) between h.detfecha and f.detFecha and idBarbero = P_idBarbero;

else

set V_A := '';

END IF;

IF V_COUNT_D = 1 THEN 

SELECT r.idReserva into V_RESERVA FROM RESERVA r 
join FECHA h ON r.idHoraIni = h.idFecha 
join FECHA f ON r.idHoraFin = f.idFecha
where CAST(P_DTconsulta AS DATETIME) between h.detfecha and f.detFecha and idBarbero = P_idBarbero;

SELECT CONCAT(
' ENTRE LAS: ', h.detFecha, ' Y ', f.detFecha, ' '
) into V_D FROM RESERVA r
join FECHA h ON r.idHoraIni = h.idFecha 
join FECHA f ON r.idHoraFin = f.idFecha
where CAST(P_DTconsulta AS DATETIME) between h.detfecha and f.detFecha and idBarbero = P_idBarbero;

else

set V_D := '';

END IF;

SELECT CONCAT(MENSAJE,'. BARBERO: ', (SELECT CONCAT(NOMBRE, ' ', APELLIDO) FROM BARBERO B JOIN DATOS D ON B.IDDATOS = D.IDDATOS where IDBARBERO = P_idBarbero), V_A, V_Y, V_D) AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 15;

ELSE

set V_DETFECHA := cast(P_DTconsulta as datetime);

INSERT INTO FECHA (DETFECHA, REGISTERED) VALUES ( V_DETFECHA, CURTIME() );
SELECT IDFECHA into V_IDFECHA FROM FECHA WHERE DETFECHA = CAST(P_DTconsulta AS DATETIME) and registered = CURTIME();

SELECT cast(ADDTIME(CAST(V_DETFECHA AS DATETIME), concat('00:',minutos,':00')) as datetime) into V_DETFECHAFIN from servicio where idServicio = P_idServicio;

-- set V_DETFECHAFIN := cast(('2018/12/20 06:51:00' + MINUTOS) as datetime);
INSERT INTO FECHA (DETFECHA, REGISTERED) VALUES ( V_DETFECHAFIN, CURTIME() );
SELECT IDFECHA INTO V_IDFECHFIN FROM FECHA WHERE DETFECHA = V_DETFECHAFIN and registered = CURTIME();

    set V_MAX = ( select last_insert_id() from reserva limit 1 );
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

select idReserva into P_idReserva from reserva where codReserva = V_COD;

SELECT CONCAT(MENSAJE,'. BARBERO: ', (SELECT CONCAT(NOMBRE, ' ', APELLIDO) FROM BARBERO B JOIN DATOS D ON B.IDDATOS = D.IDDATOS where IDBARBERO = P_idBarbero)) AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 8;

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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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

SELECT COUNT(*) INTO V_COUNT FROM DATOS WHERE DNI = P_DNI;

IF V_COUNT = 0 THEN 

INSERT INTO FECHA (DETFECHA, REGISTERED) VALUES ( V_DETFECHA, CURTIME() );
SELECT IDFECHA INTO V_IDFECHA FROM FECHA WHERE DETFECHA = V_DETFECHA;

INSERT INTO DATOS 

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
    
SELECT IDDATOS INTO V_IDDATOS FROM DATOS WHERE DNI = P_DNI;    

        set V_MAX = ( select idBarbero from Barbero order by 1 desc limit 1 );
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

INSERT INTO Barbero (IDDATOS, CODBARBERO, IDESTADO, MODIFIEDBY, DATEUPDATED) VALUES (V_IDDATOS, V_COD, 1, P_usuario, V_IDFECHA);

SELECT MENSAJE FROM MENSAJE WHERE IDMENSAJE = 1;

SELECT COUNT(*) INTO V_COUNT FROM DATOS WHERE DNI = P_DNI;

IF V_COUNT = 1 THEN 

SELECT CONCAT(MENSAJE,'') AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 1;
COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE,', DEBE TRATARSE DE UN REGISTRO DUPLICADO.') AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 2;

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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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

SELECT COUNT(*) INTO V_COUNT FROM DATOS WHERE DNI = P_DNI;
set P_idCliente := 0;

IF V_COUNT = 0 THEN 

INSERT INTO FECHA (DETFECHA, REGISTERED) VALUES ( V_DETFECHA, CURTIME() );
SELECT IDFECHA INTO V_IDFECHA FROM FECHA WHERE DETFECHA = V_DETFECHA;

INSERT INTO DATOS 

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
    
SELECT IDDATOS INTO V_IDDATOS FROM DATOS WHERE DNI = P_DNI;    

	set V_MAX = ( select idCliente from Cliente order by 1 desc limit 1 );
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

INSERT INTO Cliente (IDDATOS, CODCLIENTE, IDESTADO, PASS, MODIFIEDBY, DATEUPDATED) VALUES (V_IDDATOS, V_COD, 1, P_password,P_usuario, V_IDFECHA);

SELECT MENSAJE FROM MENSAJE WHERE IDMENSAJE = 1;

SELECT COUNT(*) INTO V_COUNT FROM DATOS WHERE DNI = P_DNI;

IF V_COUNT = 1 THEN 

		SELECT CONCAT((SELECT MENSAJE FROM mensaje WHERE idMensaje = 10), ' CLIENTE: ', concat(nombre,' ', apellido)) as MENSAJE, idCliente as id
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

SELECT CONCAT(MENSAJE,', DEBE TRATARSE DE UN REGISTRO DUPLICADO.') AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 2;

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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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

    set V_MAX = ( select last_insert_id() from marca_producto limit 1 ); 
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

SELECT MENSAJE FROM MENSAJE WHERE IDMENSAJE = 1;

SELECT COUNT(*) INTO V_COUNT FROM marca_producto WHERE nombMarca = UPPER(P_nombMarca) AND codMarca = V_COD;

IF V_COUNT = 1 THEN 

SELECT CONCAT(MENSAJE,'') AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 1;
COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE,', DEBE TRATARSE DE UN REGISTRO DUPLICADO.') AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 2;

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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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

SELECT COUNT(*) INTO V_COUNT FROM PRODUCTO WHERE nomProd = P_nomProd;

IF V_COUNT = 0 THEN 

INSERT INTO FECHA (DETFECHA, REGISTERED) VALUES ( V_DETFECHA, CURTIME() );
SELECT IDFECHA INTO V_IDFECHA FROM FECHA WHERE DETFECHA = V_DETFECHA;

	set V_MAX = ( select last_insert_id() from Producto LIMIT 1);
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

INSERT INTO PRODUCTO 

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

SELECT MENSAJE FROM MENSAJE WHERE IDMENSAJE = 1;

SELECT COUNT(*) INTO V_COUNT FROM PRODUCTO WHERE nomProd = UPPER(P_nomProd) and codProducto = V_COD;

IF V_COUNT = 1 THEN 

SELECT CONCAT(MENSAJE,'') AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 1;
COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE,', DEBE TRATARSE DE UN REGISTRO DUPLICADO.') AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 2;

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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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

SELECT COUNT(*) INTO V_COUNT FROM Servicio WHERE nomServ = P_nomServ;

IF V_COUNT = 0 THEN 

INSERT INTO FECHA (DETFECHA, REGISTERED) VALUES ( V_DETFECHA, CURTIME() );
SELECT IDFECHA INTO V_IDFECHA FROM FECHA WHERE DETFECHA = V_DETFECHA;

	set V_MAX = ( select idServicio from Servicio order by 1 desc limit 1);
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

INSERT INTO Servicio 

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

SELECT MENSAJE FROM MENSAJE WHERE IDMENSAJE = 1;

SELECT COUNT(*) INTO V_COUNT FROM Servicio WHERE nomServ = UPPER(P_nomServ) and codServicio = V_COD;

IF V_COUNT = 1 THEN 

SELECT CONCAT(MENSAJE,'') AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 1;
COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE,', DEBE TRATARSE DE UN REGISTRO DUPLICADO.') AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 2;

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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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

SELECT MENSAJE FROM MENSAJE WHERE IDMENSAJE = 1;

SELECT COUNT(*) INTO V_COUNT FROM tipo_producto WHERE detalle = UPPER(P_detalle);

IF V_COUNT = 1 THEN 

SELECT CONCAT(MENSAJE,'') AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 1;
COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE,', DEBE TRATARSE DE UN REGISTRO DUPLICADO.') AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 2;

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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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

SELECT COUNT(*) into V_COUNT FROM USUARIO WHERE idTipo_Usuario = P_idTipoUsuario;

IF V_COUNT = 0 THEN 

    set V_MAX = ( select idUsuario from Usuario order by 1 desc limit 1 );
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

Select detalle into P_cargo from tipo_usuario where idTipo_Usuario = P_idTipoUsuario;

INSERT INTO USUARIO 

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

SELECT COUNT(*) INTO V_COUNT FROM USUARIO WHERE idTipo_Usuario = P_idTipoUsuario;

IF V_COUNT = 1 THEN 

SELECT CONCAT((SELECT MENSAJE FROM mensaje WHERE idMensaje = 10), ' USUARIO: ', AKA) AS MENSAJE
FROM USUARIO
where aka = p_aka and pass = p_pass;

SELECT idUsuario into V_IDDATOS
FROM USUARIO
where codUsuario = V_COD;

set P_idUsuario := V_IDDATOS;

COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE,', DEBE TRATARSE DE UN REGISTRO DUPLICADO, DEBE INICIAR SESION') as MENSAJE FROM MENSAJE WHERE IDMENSAJE = 2;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Listar_Barbero`(

)
BEGIN

DECLARE V_COUNT INT;

SELECT COUNT(*) INTO V_COUNT FROM Barbero;

IF V_COUNT > 0 THEN 

SELECT 

	idBarbero,
	concat(d.nombre,' ',d.apellido)
	as 'Nombre del Barbero'
    
FROM Barbero c
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Listar_Barbero_Interno`(

)
BEGIN

DECLARE V_COUNT INT;

SELECT COUNT(*) INTO V_COUNT FROM Barbero;

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
    
FROM Barbero c
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Listar_Cliente_Interno`(

)
BEGIN

DECLARE V_COUNT INT;

SELECT COUNT(*) INTO V_COUNT FROM Cliente;

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
    
FROM Cliente c
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Listar_Producto`(

)
BEGIN

DECLARE V_COUNT INT;

SELECT COUNT(*) INTO V_COUNT FROM Producto;

IF V_COUNT > 0 THEN 

SELECT 

    idProducto,
    nomProd as Producto,
    precio as Precio,
    p.descripcion as Descripcion
    
FROM Producto p
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Listar_Producto_Interno`(

)
BEGIN

DECLARE V_COUNT INT;

SELECT COUNT(*) INTO V_COUNT FROM Producto;

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
    
FROM Producto p

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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Listar_Reservas_Por_Barbero_Interno`(

    IN P_idBarbero int
        
)
BEGIN

	DECLARE V_COUNT INT;    

SELECT count(*) into V_COUNT FROM RESERVA r 
join FECHA h ON r.idHoraIni = h.idFecha 
join FECHA f ON r.idHoraFin = f.idFecha
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

from RESERVA r

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

from Barbero c

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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Listar_Reservas_Por_Cliente`(

    IN P_idCliente int
        
)
BEGIN

	DECLARE V_COUNT INT;    

SELECT count(*) into V_COUNT FROM RESERVA r 
join FECHA h ON r.idHoraIni = h.idFecha 
join FECHA f ON r.idHoraFin = f.idFecha
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

from RESERVA r

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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Listar_Reservas_Por_Cliente_Interno`(

    IN P_idCliente int
        
)
BEGIN

	DECLARE V_COUNT INT;    

SELECT count(*) into V_COUNT FROM RESERVA r 
join FECHA h ON r.idHoraIni = h.idFecha 
join FECHA f ON r.idHoraFin = f.idFecha
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

from RESERVA r

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

from cliente c

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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Listar_Servicio`(

)
BEGIN

DECLARE V_COUNT INT;

SELECT COUNT(*) INTO V_COUNT FROM Servicio;

IF V_COUNT > 0 THEN 

SELECT 

	idServicio,
	nomServ as Servicio, 
    minutos as Duracion,
    precio as Precio

FROM Servicio s
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Listar_Servicio_Interno`(

)
BEGIN

DECLARE V_COUNT INT;

SELECT COUNT(*) INTO V_COUNT FROM Servicio;

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
    
FROM Servicio p

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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Listar_Usuario`(

)
BEGIN

DECLARE V_COUNT INT;

SELECT COUNT(*) INTO V_COUNT FROM USUARIO;

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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Login_Cliente`(

IN P_DNI CHAR(8), 
P_password char(8),
OUT P_idCliente int
)
begin

declare V_COUNT INT;

    select count(*) INTO V_COUNT from datos d
    join cliente c on d.idDatos = c.idDatos
	where DNI = P_DNI and pass = P_password;
    
    set P_idCLiente = 0;
    
    IF V_COUNT = 1 THEN 
    
		SELECT CONCAT((SELECT MENSAJE FROM mensaje WHERE idMensaje = 10), ' CLIENTE: ', concat(nombre,' ', apellido)) as MENSAJE
		FROM datos d
        join cliente c on d.idDatos = c.idDatos
		where DNI = P_DNI and pass = P_password;
        
		SELECT idCliente into P_idCliente
		FROM datos d
        join cliente c on d.idDatos = c.idDatos
		where DNI = P_DNI and pass = P_password;
        
    ELSE
    
		select count(*) INTO V_COUNT from datos
		where DNI = P_DNI;
    
			IF V_COUNT = 1 THEN 
    
				SELECT CONCAT((SELECT MENSAJE FROM mensaje WHERE idMensaje = 11), ' CLIENTE: ', concat(nombre,' ', apellido)) AS MENSAJE
				FROM datos d
				join cliente c on d.idDatos = c.idDatos
				where DNI = P_DNI
				;
    
			ELSE
    
				SELECT MENSAJE FROM MENSAJE WHERE idMensaje = 12;
    
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Login_Usuario`(

IN P_AKA VARCHAR(9), P_pass char(8),
OUT P_ID INT
)
begin

declare V_COUNT INT;

    select count(*) INTO V_COUNT from USUARIO
    where aka = P_AKA and pass = P_pass;
    
    IF V_COUNT = 1 THEN 
    
		SELECT CONCAT((SELECT MENSAJE FROM mensaje WHERE idMensaje = 10), ' USUARIO: ', AKA) as MENSAJE, idUsuario as id
		FROM USUARIO
		where aka = P_AKA and pass = P_pass
		;
		SELECT idUsuario INTO P_ID
		FROM USUARIO
		where aka = P_AKA and pass = P_pass
		;
    ELSE
		SET P_ID := 0;
		select count(*) INTO V_COUNT from USUARIO
		where aka = P_AKA;
    
			IF V_COUNT = 1 THEN 
    
				SELECT CONCAT((SELECT MENSAJE FROM mensaje WHERE idMensaje = 11), ' USUARIO: ', AKA) AS MENSAJE
				FROM USUARIO
				where aka = P_AKA
				;

			ELSE
    
				SELECT MENSAJE FROM MENSAJE WHERE idMensaje = 12;
    
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
    
    join Ventas v on dv.idVenta = v.idVenta
    join fecha f on v.idFecha = f.idFecha
    join producto p on dv.idItem = p.idProducto
    join marca_producto m on p.idMarcaProducto = m.idMarcaProducto
    join tipo_producto t on p.idTipo_producto = t.idTipo_producto
    join Cliente c ON c.idCliente = v.idCliente
    join Datos a on c.idDatos = a.idDatos
    join ESTADO e on dv.idEstado = e.idEstado
    
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
    
    join Ventas v on dv.idVenta = v.idVenta
    join fecha f on v.idFecha = f.idFecha
    join producto p on dv.idItem = p.idProducto
    join marca_producto m on p.idMarcaProducto = m.idMarcaProducto
    join tipo_producto t on p.idTipo_producto = t.idTipo_producto
    join Cliente c ON c.idCliente = v.idCliente
    join Datos a on c.idDatos = a.idDatos
    join ESTADO e on dv.idEstado = e.idEstado
    
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
    
    join Ventas v on dv.idVenta = v.idVenta
    join fecha f on v.idFecha = f.idFecha
    join producto p on dv.idItem = p.idProducto
    join marca_producto m on p.idMarcaProducto = m.idMarcaProducto
    join tipo_producto t on p.idTipo_producto = t.idTipo_producto
    join Cliente c ON c.idCliente = v.idCliente
    join Datos a on c.idDatos = a.idDatos
    join ESTADO e on dv.idEstado = e.idEstado
    
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
           (select sum(subtotal) from detalle_venta t 
           join ventas v on t.idVenta = v.idVenta 
           where v.idVenta = t.idVenta) 				as TOTAL, 
           f.detFecha AS FECHA 
    
    FROM VENTAS v
    
    join fecha f on v.idFecha = f.idFecha
    join Cliente c ON v.idCliente = c.idCliente
    join Datos a on c.idDatos = a.idDatos
    join ESTADO e on v.idEstado = e.idEstado
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
           f.detFecha AS FECHA 
           
           from detalle_venta t 
           join ventas v on t.idVenta = v.idVenta
           join fecha f on v.idFecha = f.idFecha
		   join Cliente c ON v.idCliente = c.idCliente
           join Datos a on c.idDatos = a.idDatos
		   join ESTADO e on v.idEstado = e.idEstado
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Mostrar_Venta_Por_Pagar`(

IN P_idCliente int,
OUT P_idVenta int

)
BEGIN

Select idVenta into P_idVenta FROM VENTAS v WHERE v.idEstado = 3 and v.idCliente = P_idCliente;

	SELECT 
		   
           codVenta as 'CODIGO_VENTA', 
		   codCliente as 'CODIGO_CLIENTE',  
           e.desestado as ESTADO,
           concat(a.Nombre,' ', a.Apellido) 			AS CLIENTE, 
           (select sum(subtotal) from detalle_venta t 
           join ventas v on t.idVenta = v.idVenta
           where t.idEstado = 3 and v.idCliente = P_idCliente) 		as TOTAL, 
           f.detFecha AS FECHA 
    
    FROM VENTAS v
    
    join fecha f on v.idFecha = f.idFecha
    join Cliente c ON v.idCliente = c.idCliente
    join Datos a on c.idDatos = a.idDatos
    join ESTADO e on v.idEstado = e.idEstado
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Pagar_Reserva_Por_Cliente`(

    IN P_idCliente int,
    IN P_idReserva int
        
)
BEGIN

	DECLARE V_COUNT INT;    

SELECT count(*) into V_COUNT FROM RESERVA r 
join FECHA h ON r.idHoraIni = h.idFecha 
join FECHA f ON r.idHoraFin = f.idFecha
join servicio s ON r.idServicio = s.idServicio
where idCliente = P_idCliente and r.idestado = 3;

IF V_COUNT > 0 THEN 

UPDATE reserva r set idEstado = 4
where r.idCliente = P_idCliente and r.idestado = 3 and r.idReserva = P_idReserva;
COMMIT;
SELECT

CONCAT('SE PAGÓ LA RESERVA DEL CLIENTE: ', d.Nombre, ' ', d.ApelLido,'.') AS MENSAJE

from cliente c

join datos d on d.idDatos = c.idDatos

where c.idCliente = P_idCliente;

ELSE

SELECT 

CONCAT('NO EXISTEN RESERVAS PENDIENTES PARA EL CLIENTE: ', d.Nombre, ' ', d.ApelLido,'.') AS MENSAJE

from cliente c

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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Recuperar_Barbero_Android`(
in P_idBarbero int
)
BEGIN

SELECT 

c.idBarbero,
concat(d.nombre,' ',d.apellido)	as 'Nombre_del_Barbero'
    
FROM Barbero c
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
    
FROM Barbero c
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
    
FROM Cliente c
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
    
FROM Producto p

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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
    
FROM Producto p

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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Recuperar_Reserva_Por_Cliente`(

    IN P_idCliente int,
    IN P_idReserva int
        
)
BEGIN

	DECLARE V_COUNT INT;    

SELECT count(*) into V_COUNT FROM RESERVA r 
join FECHA h ON r.idHoraIni = h.idFecha 
join FECHA f ON r.idHoraFin = f.idFecha
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

from RESERVA r

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

from cliente c

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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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

FROM Servicio s
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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

FROM Servicio s
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Recuperar_Tipo_Usuario`(
)
BEGIN

declare idvoid int;
declare msgvoid varchar(50);

DECLARE V_COUNT INT;

SELECT COUNT(*) INTO V_COUNT FROM tipo_usuario t left join usuario u on t.idTipo_usuario = u.idTipo_usuario where u.idTipo_usuario is null;

IF V_COUNT > 0 THEN 

select t.detalle,  t.idTipo_usuario from tipo_usuario t left join usuario u on t.idTipo_usuario = u.idTipo_usuario where u.idTipo_usuario is null;

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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
        
SELECT COUNT(*) INTO V_COUNT FROM DETALLE_VENTA D
JOIN VENTAS V ON D.IDVENTA = V.IDVENTA
WHERE D.idVenta = V_VENTA AND D.idEstado = 3;

IF V_COUNT = 1 THEN

UPDATE VENTAS SET idEstado = 4 WHERE IDVENTA = V_VENTA;

END IF;        
        
UPDATE detalle_venta SET idEstado = 4 WHERE idVenta = V_VENTA and idDetalle_Venta = P_idDetalle_Venta ;

SELECT D.idItem into V_PRODUCTO FROM detalle_venta D WHERE idDetalle_Venta = P_idDetalle_Venta;

update producto SET stock = (stock - (SELECT Cantidad FROM detalle_venta D WHERE D.idDetalle_Venta = P_idDetalle_Venta))
WHERE idProducto = V_PRODUCTO;

SELECT COUNT(*) INTO V_COUNT FROM detalle_venta WHERE idVenta = V_VENTA and idDetalle_Venta = P_idDetalle_Venta AND idEstado = 4;

IF V_COUNT = 1 THEN 

SELECT CONCAT((SELECT MENSAJE FROM mensaje WHERE idMensaje = 1), ': ', desEstado) as MENSAJE
FROM detalle_venta v
join estado e on v.idEstado = e.idEstado
WHERE idVenta = V_VENTA and idDetalle_Venta = P_idDetalle_Venta;

COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT idVenta INTO  V_VENTA  FROM detalle_venta WHERE idDetalle_Venta = P_idDetalle_Venta;

SELECT CONCAT((SELECT MENSAJE FROM mensaje WHERE idMensaje = 1), ': ', desEstado) as MENSAJE
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
    
    SELECT STOCK INTO V_STOCK FROM PRODUCTO WHERE IDPRODUCTO = P_idItem;
    
if P_cantidad > V_STOCK then
SELECT CONCAT(MENSAJE,', NO HAY STOCK DISPONIBLE.') AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 2;
SET P_VENTA = 0;
else    
        
SELECT COUNT(*) INTO V_COUNT FROM DETALLE_VENTA WHERE codDetVenta = V_COD;

IF V_COUNT = 0 THEN 

SELECT COUNT(*) INTO V_COUNT FROM VENTAS WHERE idCliente = P_idCliente and idEstado = 3;

if V_COUNT = 0 then

    	set V_MAX = ( select idVenta from Ventas order by idVenta desc limit 1 );
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
    
	INSERT INTO FECHA (DETFECHA, REGISTERED) VALUES ( V_DETFECHA, CURTIME() );
	SELECT IDFECHA INTO V_IDFECHA FROM FECHA WHERE DETFECHA = V_DETFECHA and registered = CURTIME();    
        
INSERT INTO VENTAS 

	(codVenta,
    idCliente,
    idEstado,idFecha) 
    
VALUES 

	(UPPER(V_COD),
    P_idCliente,
    3, V_IDFECHA);
    
    COMMIT;

SELECT idVenta into V_IDVENTA
FROM VENTAS v
join estado e on v.idEstado = e.idEstado
where codVenta = V_COD;

else

SELECT idVenta into V_IDVENTA
FROM VENTAS WHERE idCliente = P_idCliente and idEstado = 3;

end if;

    	set V_MAX = ( select idDetalle_Venta from DETALLE_VENTA order by idDetalle_Venta desc limit 1);
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
    from producto where idProducto = P_idItem;
    
    set V_SUBTOTAL := V_DESCUENTO*(P_Cantidad*V_PRECIO);
        
INSERT INTO DETALLE_VENTA 

	(codDetVenta,
    idVenta, idEstado,
    idItem, cantidad,
    descuento, subtotal) 
    
VALUES 

	(UPPER(V_COD),
    V_IDVENTA, 3,
    P_idItem, P_Cantidad,
    V_DESCUENTO, V_SUBTOTAL);

SELECT COUNT(*) INTO V_COUNT FROM DETALLE_VENTA WHERE codDetVenta = V_COD;

IF V_COUNT = 1 THEN 

SELECT CONCAT((SELECT MENSAJE FROM mensaje WHERE idMensaje = 1), ': ', desEstado) as MENSAJE
FROM DETALLE_VENTA v
join estado e on v.idEstado = e.idEstado
where codDetVenta = V_COD;

SET P_VENTA = V_IDVENTA;

COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT(MENSAJE,', DEBE TRATARSE DE UN REGISTRO DUPLICADO.') AS MENSAJE FROM MENSAJE WHERE IDMENSAJE = 2;

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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp.Registrar_Venta_Pagada`(

	IN P_idCliente int
        
)
BEGIN

	DECLARE V_COUNT INT;
    DECLARE V_IDVENTA INT;

SELECT COUNT(*) into V_COUNT FROM VENTAS WHERE idCliente = P_idCliente AND idEstado = 3;

IF V_COUNT = 1 THEN 
	    
SELECT IDVENTA INTO V_IDVENTA FROM ventas WHERE idCliente = P_idCliente and idEstado = 3;        
UPDATE VENTAS SET idEstado = 4 where idCliente = P_idCliente;
CALL `sp.Registrar_Detalle_Venta_Por_Pagar`();

SELECT COUNT(*) into V_COUNT FROM VENTAS WHERE idVenta = V_IDVENTA and idCliente = P_idCliente AND idEstado = 4;

IF V_COUNT = 1 THEN 

SELECT CONCAT((SELECT MENSAJE FROM mensaje WHERE idMensaje = 1), ': ', desEstado) as MENSAJE
FROM VENTAS v
join estado e on v.idEstado = e.idEstado
WHERE idVenta = V_IDVENTA and idCliente = P_idCliente;

COMMIT;

ELSE

ROLLBACK;

END IF;

ELSE

SELECT CONCAT((SELECT MENSAJE FROM mensaje WHERE idMensaje = 1), ': ', desEstado) as MENSAJE
FROM VENTAS v
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
