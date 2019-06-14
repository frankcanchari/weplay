-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: db_tecnoserv
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.38-MariaDB

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
-- Table structure for table `asientos`
--

DROP TABLE IF EXISTS `asientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asientos` (
  `idAsiento` int(11) NOT NULL,
  `fila` int(11) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `idCategAsiento` int(11) DEFAULT NULL,
  `idStockAsiento` int(11) DEFAULT NULL,
  PRIMARY KEY (`idAsiento`),
  KEY `FK_Asientos_CategoriaAsiento` (`idCategAsiento`),
  KEY `FK_Asientos_EstadoAsiento` (`estado`),
  KEY `FK_Asientos_StockAsientos` (`idStockAsiento`),
  CONSTRAINT `FK_Asientos_CategoriaAsiento` FOREIGN KEY (`idCategAsiento`) REFERENCES `categoriaasiento` (`idCategoriaAsiento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Asientos_EstadoAsiento` FOREIGN KEY (`estado`) REFERENCES `estadoasiento` (`idEstadoA`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Asientos_StockAsientos` FOREIGN KEY (`idStockAsiento`) REFERENCES `stockasientos` (`idStockAsiento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asientos`
--

LOCK TABLES `asientos` WRITE;
/*!40000 ALTER TABLE `asientos` DISABLE KEYS */;
/*!40000 ALTER TABLE `asientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auspiciadores`
--

DROP TABLE IF EXISTS `auspiciadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auspiciadores` (
  `idAuspiciadores` int(11) NOT NULL,
  `descripcionAus` varchar(50) DEFAULT NULL,
  `imagenE` longblob,
  `idTipoAuspiciador` int(11) DEFAULT NULL,
  PRIMARY KEY (`idAuspiciadores`),
  KEY `FK_Auspiciadores_TipoAuspiciadores` (`idTipoAuspiciador`),
  CONSTRAINT `FK_Auspiciadores_TipoAuspiciadores` FOREIGN KEY (`idTipoAuspiciador`) REFERENCES `tipoauspiciadores` (`idTipoAuspiciador`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auspiciadores`
--

LOCK TABLES `auspiciadores` WRITE;
/*!40000 ALTER TABLE `auspiciadores` DISABLE KEYS */;
/*!40000 ALTER TABLE `auspiciadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoriaasiento`
--

DROP TABLE IF EXISTS `categoriaasiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoriaasiento` (
  `idCategoriaAsiento` int(11) NOT NULL,
  `NombreCategoriaA` varchar(50) DEFAULT NULL,
  `DescripCategoriaA` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idCategoriaAsiento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoriaasiento`
--

LOCK TABLES `categoriaasiento` WRITE;
/*!40000 ALTER TABLE `categoriaasiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoriaasiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ceremonias`
--

DROP TABLE IF EXISTS `ceremonias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ceremonias` (
  `idCeremonias` int(11) NOT NULL,
  `DescripcionC` varchar(100) DEFAULT NULL,
  `imagenC` longblob,
  `idTipoCeremonias` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCeremonias`),
  KEY `FK_Ceremonias_TipoCeremonias` (`idTipoCeremonias`),
  CONSTRAINT `FK_Ceremonias_TipoCeremonias` FOREIGN KEY (`idTipoCeremonias`) REFERENCES `tipoceremonias` (`idTipoCeremonias`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ceremonias`
--

LOCK TABLES `ceremonias` WRITE;
/*!40000 ALTER TABLE `ceremonias` DISABLE KEYS */;
/*!40000 ALTER TABLE `ceremonias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comiteorganizador`
--

DROP TABLE IF EXISTS `comiteorganizador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comiteorganizador` (
  `idComite` int(11) NOT NULL,
  `idRepresentateORG` int(11) DEFAULT NULL,
  `NombresR` varchar(50) DEFAULT NULL,
  `ApellidoR` varchar(50) DEFAULT NULL,
  `imagenR` longblob,
  `DescripcionCO` varchar(100) DEFAULT NULL,
  `idTipoRepresentante` int(11) DEFAULT NULL,
  PRIMARY KEY (`idComite`),
  KEY `FK_ComiteOrganizador_Representantes` (`idRepresentateORG`),
  KEY `FK_ComiteOrganizador_TipoRepresentante` (`idTipoRepresentante`),
  CONSTRAINT `FK_ComiteOrganizador_Representantes` FOREIGN KEY (`idRepresentateORG`) REFERENCES `representantes` (`IdRepresentateORG`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ComiteOrganizador_TipoRepresentante` FOREIGN KEY (`idTipoRepresentante`) REFERENCES `tiporepresentante` (`idTipoRepresentante`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comiteorganizador`
--

LOCK TABLES `comiteorganizador` WRITE;
/*!40000 ALTER TABLE `comiteorganizador` DISABLE KEYS */;
/*!40000 ALTER TABLE `comiteorganizador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_entrada`
--

DROP TABLE IF EXISTS `compra_entrada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compra_entrada` (
  `idCompraEntrada` int(11) NOT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `idSede` int(11) DEFAULT NULL,
  `idHorarioEvento` int(11) DEFAULT NULL,
  `idMoneda` int(11) DEFAULT NULL,
  `idReporteEntrada` int(11) DEFAULT NULL,
  `idAsiento` int(11) DEFAULT NULL,
  `NumTarjeta` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idCompraEntrada`),
  KEY `FK_Compra_Entrada_Asientos` (`idAsiento`),
  KEY `FK_Compra_Entrada_HorarioEventos` (`idHorarioEvento`),
  KEY `FK_Compra_Entrada_Moneda` (`idMoneda`),
  KEY `FK_Compra_Entrada_ReporteEntrada` (`idReporteEntrada`),
  KEY `FK_Compra_Entrada_Sedes` (`idSede`),
  KEY `FK_Compra_Entrada_Usuarios` (`idUsuario`),
  CONSTRAINT `FK_Compra_Entrada_Asientos` FOREIGN KEY (`idAsiento`) REFERENCES `asientos` (`idAsiento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Compra_Entrada_HorarioEventos` FOREIGN KEY (`idHorarioEvento`) REFERENCES `horarioeventos` (`idHorarioEventos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Compra_Entrada_Moneda` FOREIGN KEY (`idMoneda`) REFERENCES `moneda` (`idMoneda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Compra_Entrada_ReporteEntrada` FOREIGN KEY (`idReporteEntrada`) REFERENCES `reporteentrada` (`idReporteEntrada`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Compra_Entrada_Sedes` FOREIGN KEY (`idSede`) REFERENCES `sedes` (`idSede`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Compra_Entrada_Usuarios` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_entrada`
--

LOCK TABLES `compra_entrada` WRITE;
/*!40000 ALTER TABLE `compra_entrada` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra_entrada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprobantepago`
--

DROP TABLE IF EXISTS `comprobantepago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comprobantepago` (
  `idPagosEntrada` int(11) NOT NULL,
  `idCompraEntrada` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPagosEntrada`),
  KEY `FK_ComprobantePago_Compra_Entrada` (`idCompraEntrada`),
  CONSTRAINT `FK_ComprobantePago_Compra_Entrada` FOREIGN KEY (`idCompraEntrada`) REFERENCES `compra_entrada` (`idCompraEntrada`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprobantepago`
--

LOCK TABLES `comprobantepago` WRITE;
/*!40000 ALTER TABLE `comprobantepago` DISABLE KEYS */;
/*!40000 ALTER TABLE `comprobantepago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_sede_deporte`
--

DROP TABLE IF EXISTS `config_sede_deporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_sede_deporte` (
  `idConfigSedeDeporte` int(11) NOT NULL AUTO_INCREMENT,
  `idSedeFK` int(11) NOT NULL,
  `idDeporteFK` int(11) NOT NULL,
  PRIMARY KEY (`idConfigSedeDeporte`),
  KEY `idSedeFK` (`idSedeFK`),
  KEY `idDeporteFK` (`idDeporteFK`),
  CONSTRAINT `config_sede_deporte_ibfk_1` FOREIGN KEY (`idSedeFK`) REFERENCES `sedes` (`idSede`),
  CONSTRAINT `config_sede_deporte_ibfk_2` FOREIGN KEY (`idDeporteFK`) REFERENCES `deportes` (`idDeporte`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_sede_deporte`
--

LOCK TABLES `config_sede_deporte` WRITE;
/*!40000 ALTER TABLE `config_sede_deporte` DISABLE KEYS */;
INSERT INTO `config_sede_deporte` VALUES (1,1,2),(2,4,6);
/*!40000 ALTER TABLE `config_sede_deporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conocenos`
--

DROP TABLE IF EXISTS `conocenos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conocenos` (
  `idconocenos` int(11) NOT NULL AUTO_INCREMENT,
  `co_desc` text NOT NULL,
  `co_imagen` varchar(50) NOT NULL,
  `co_fecha` date NOT NULL,
  `bEstPri` bit(1) NOT NULL,
  PRIMARY KEY (`idconocenos`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conocenos`
--

LOCK TABLES `conocenos` WRITE;
/*!40000 ALTER TABLE `conocenos` DISABLE KEYS */;
INSERT INTO `conocenos` VALUES (1,'CONOCEMOS: Estamos preparando el camino a los XVIII Juegos Panamericanos y Sextos Juegos Parapanamericanos.','vista/mgc/img/conocenos.jpg','2019-05-17','');
/*!40000 ALTER TABLE `conocenos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deportedestacado`
--

DROP TABLE IF EXISTS `deportedestacado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deportedestacado` (
  `idDeporteDestac` int(11) NOT NULL,
  `idRanking` int(11) DEFAULT NULL,
  `idPais` int(11) DEFAULT NULL,
  PRIMARY KEY (`idDeporteDestac`),
  KEY `FK_DeporteDestacado_Pais` (`idPais`),
  KEY `FK_DeporteDestacado_Ranking` (`idRanking`),
  CONSTRAINT `FK_DeporteDestacado_Ranking` FOREIGN KEY (`idRanking`) REFERENCES `ranking` (`idRanking`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `F_DepDestacado_pais` FOREIGN KEY (`idPais`) REFERENCES `pais` (`idPais`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deportedestacado`
--

LOCK TABLES `deportedestacado` WRITE;
/*!40000 ALTER TABLE `deportedestacado` DISABLE KEYS */;
/*!40000 ALTER TABLE `deportedestacado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deportes`
--

DROP TABLE IF EXISTS `deportes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deportes` (
  `idDeporte` int(11) NOT NULL,
  `NombDeporte` varchar(50) DEFAULT NULL,
  `idDetalleDeporte` int(11) DEFAULT NULL,
  `idReglamento` int(11) DEFAULT NULL,
  PRIMARY KEY (`idDeporte`),
  KEY `FK_Deportes_DetalleDeporte` (`idDetalleDeporte`),
  KEY `FK_Deportes_Reglamento` (`idReglamento`),
  CONSTRAINT `FK_Deportes_DetalleDeporte` FOREIGN KEY (`idDetalleDeporte`) REFERENCES `detalledeporte` (`idDetalleDeporte`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Deportes_Reglamento` FOREIGN KEY (`idReglamento`) REFERENCES `reglamento` (`idReglamento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deportes`
--

LOCK TABLES `deportes` WRITE;
/*!40000 ALTER TABLE `deportes` DISABLE KEYS */;
INSERT INTO `deportes` VALUES (1,'Futbol',NULL,NULL),(2,'Atletismo',NULL,NULL),(3,'Bádminton',NULL,NULL),(4,'Baloncesto',NULL,NULL),(5,'Boxeo',NULL,NULL),(6,'Ciclismo de Pista',NULL,NULL),(7,'Ciclismo de Ruta',NULL,NULL),(8,'Gimnasia Ritmica',NULL,NULL),(9,'Golf',NULL,NULL),(10,'Judo',NULL,NULL);
/*!40000 ALTER TABLE `deportes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deportistas`
--

DROP TABLE IF EXISTS `deportistas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deportistas` (
  `idDeportistas` int(11) NOT NULL AUTO_INCREMENT,
  `idDeporte` int(11) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `Nombre_Deportista` varchar(100) DEFAULT NULL,
  `idPais` int(11) DEFAULT NULL,
  PRIMARY KEY (`idDeportistas`),
  KEY `FK_Deportistas_Deportes` (`idDeporte`),
  KEY `FK_Deportistas_Pais` (`idPais`),
  KEY `FK_Deportistas_Usuarios` (`Nombre_Deportista`),
  CONSTRAINT `Dep_pais` FOREIGN KEY (`idPais`) REFERENCES `pais` (`idPais`),
  CONSTRAINT `FK_Deportistas_Deportes` FOREIGN KEY (`idDeporte`) REFERENCES `deportes` (`idDeporte`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deportistas`
--

LOCK TABLES `deportistas` WRITE;
/*!40000 ALTER TABLE `deportistas` DISABLE KEYS */;
INSERT INTO `deportistas` VALUES (1,3,'badminton deporte de a dos','harold Ferrer',1),(2,3,'deporte de a dos','jonathan Franco',9),(3,2,'deporte base','frank',4),(4,2,'deporte base','Ines Melchor',18),(5,2,'deporte base','Gladys Tejeda',18),(6,2,'deporte base','Kimberly Garcia',18),(7,2,'deporte base','Raul Pacheco',18),(8,3,'raqueta y una plumilla','Fernanda Saponara',18),(9,3,'raqueta y una plumilla','Mario Cuba Rodriguez',18),(10,3,'raqueta y una plumilla','Katherine Winder Cochella',18),(11,3,'raqueta y una plumilla','Paula La torre Regal',18),(12,3,'raqueta y una plumilla','Diego MiniCuadros',18),(13,3,'raqueta y una plumilla','Ines Castillo Salazar',18),(14,3,'raqueta y una plumilla','Daniela Macias Brandes',18),(15,3,'raqueta y una plumilla','Danica Nishimura Higa',18),(16,3,'raqueta y una plumilla','Daniel La torre Regal',18);
/*!40000 ALTER TABLE `deportistas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalledeporte`
--

DROP TABLE IF EXISTS `detalledeporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalledeporte` (
  `idDetalleDeporte` int(11) NOT NULL,
  `descripcionDeporte` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idDetalleDeporte`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalledeporte`
--

LOCK TABLES `detalledeporte` WRITE;
/*!40000 ALTER TABLE `detalledeporte` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalledeporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalleeventos`
--

DROP TABLE IF EXISTS `detalleeventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalleeventos` (
  `idDetalleEvento` int(11) NOT NULL AUTO_INCREMENT,
  `idEvento` int(11) DEFAULT NULL,
  `idDeportista` int(11) DEFAULT NULL,
  PRIMARY KEY (`idDetalleEvento`),
  KEY `FK_DetalleEventos_Deportistas` (`idDeportista`),
  KEY `FK_DetalleEventos_Eventos` (`idEvento`),
  CONSTRAINT `FK_detalle_deportista` FOREIGN KEY (`idDeportista`) REFERENCES `deportistas` (`idDeportistas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleeventos`
--

LOCK TABLES `detalleeventos` WRITE;
/*!40000 ALTER TABLE `detalleeventos` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalleeventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipo`
--

DROP TABLE IF EXISTS `equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipo` (
  `idEquipo` int(11) NOT NULL AUTO_INCREMENT,
  `idPaisFK` int(11) NOT NULL,
  `totalIntegrantes` int(11) NOT NULL,
  PRIMARY KEY (`idEquipo`),
  KEY `FK_equipo_pais` (`idPaisFK`),
  CONSTRAINT `FK_equipo_pais` FOREIGN KEY (`idPaisFK`) REFERENCES `pais` (`idPais`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipo`
--

LOCK TABLES `equipo` WRITE;
/*!40000 ALTER TABLE `equipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadoasiento`
--

DROP TABLE IF EXISTS `estadoasiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estadoasiento` (
  `idEstadoA` int(11) NOT NULL,
  `descripcion` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`idEstadoA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadoasiento`
--

LOCK TABLES `estadoasiento` WRITE;
/*!40000 ALTER TABLE `estadoasiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `estadoasiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadousuario`
--

DROP TABLE IF EXISTS `estadousuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estadousuario` (
  `idEstadoUsuario` int(11) NOT NULL,
  `DescripcionEstado` varchar(50) NOT NULL,
  PRIMARY KEY (`idEstadoUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadousuario`
--

LOCK TABLES `estadousuario` WRITE;
/*!40000 ALTER TABLE `estadousuario` DISABLE KEYS */;
INSERT INTO `estadousuario` VALUES (1,'Activado'),(2,'Desactivado');
/*!40000 ALTER TABLE `estadousuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventos`
--

DROP TABLE IF EXISTS `eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventos` (
  `idEvento` int(11) NOT NULL AUTO_INCREMENT,
  `idSede` int(11) DEFAULT NULL,
  `idHorarioEventos` int(11) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `idDeportesFK` int(11) NOT NULL,
  `idConfig_Sede_DeporteFK` int(11) NOT NULL,
  PRIMARY KEY (`idEvento`),
  KEY `FK_Eventos_HorarioEventos` (`idHorarioEventos`),
  KEY `FK_Eventos_Sedes` (`idSede`),
  KEY `idDeportesFK` (`idDeportesFK`),
  KEY `FK_eventos_Config_sede_deporte` (`idConfig_Sede_DeporteFK`),
  CONSTRAINT `FK_Eventos_HorarioEventos` FOREIGN KEY (`idHorarioEventos`) REFERENCES `horarioeventos` (`idHorarioEventos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Eventos_Sedes` FOREIGN KEY (`idSede`) REFERENCES `sedes` (`idSede`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_eventos_Config_sede_deporte` FOREIGN KEY (`idConfig_Sede_DeporteFK`) REFERENCES `config_sede_deporte` (`idConfigSedeDeporte`),
  CONSTRAINT `eventos_ibfk_1` FOREIGN KEY (`idDeportesFK`) REFERENCES `deportes` (`idDeporte`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos`
--

LOCK TABLES `eventos` WRITE;
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
INSERT INTO `eventos` VALUES (1,1,1,'av. probando',3,1),(3,4,1,'av. seg prueba',6,2);
/*!40000 ALTER TABLE `eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fechaevento`
--

DROP TABLE IF EXISTS `fechaevento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fechaevento` (
  `idFechaEvento` int(11) NOT NULL,
  `idHora` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`idFechaEvento`),
  KEY `FK_FechaEvento_Hora` (`idHora`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fechaevento`
--

LOCK TABLES `fechaevento` WRITE;
/*!40000 ALTER TABLE `fechaevento` DISABLE KEYS */;
INSERT INTO `fechaevento` VALUES (1,1,'2019-05-30');
/*!40000 ALTER TABLE `fechaevento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galeria`
--

DROP TABLE IF EXISTS `galeria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `galeria` (
  `idGaleria` int(11) NOT NULL,
  `Fotos` longblob,
  `Medios` varchar(50) DEFAULT NULL,
  `Documentos` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idGaleria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galeria`
--

LOCK TABLES `galeria` WRITE;
/*!40000 ALTER TABLE `galeria` DISABLE KEYS */;
/*!40000 ALTER TABLE `galeria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hora`
--

DROP TABLE IF EXISTS `hora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hora` (
  `idHora` int(11) NOT NULL,
  `horainicio` varchar(10) DEFAULT NULL,
  `horafin` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idHora`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hora`
--

LOCK TABLES `hora` WRITE;
/*!40000 ALTER TABLE `hora` DISABLE KEYS */;
/*!40000 ALTER TABLE `hora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horarioeventos`
--

DROP TABLE IF EXISTS `horarioeventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horarioeventos` (
  `idHorarioEventos` int(11) NOT NULL,
  `idDeporte` int(11) DEFAULT NULL,
  `idFechaEvento` int(11) DEFAULT NULL,
  PRIMARY KEY (`idHorarioEventos`),
  KEY `FK_HorarioEventos_FechaEvento` (`idFechaEvento`),
  KEY `idDeporte` (`idDeporte`),
  CONSTRAINT `FK_HorarioEventos_FechaEvento` FOREIGN KEY (`idFechaEvento`) REFERENCES `fechaevento` (`idFechaEvento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `horarioeventos_ibfk_1` FOREIGN KEY (`idDeporte`) REFERENCES `deportes` (`idDeporte`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horarioeventos`
--

LOCK TABLES `horarioeventos` WRITE;
/*!40000 ALTER TABLE `horarioeventos` DISABLE KEYS */;
INSERT INTO `horarioeventos` VALUES (1,1,1);
/*!40000 ALTER TABLE `horarioeventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institucional`
--

DROP TABLE IF EXISTS `institucional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `institucional` (
  `idInstitucional` int(11) NOT NULL,
  `descripInstitucional` varchar(100) DEFAULT NULL,
  `imagenInstitucional` longblob,
  `idTipoInstitucional` int(11) DEFAULT NULL,
  PRIMARY KEY (`idInstitucional`),
  KEY `FK_Institucional_TipoInstitucional` (`idTipoInstitucional`),
  CONSTRAINT `FK_Institucional_TipoInstitucional` FOREIGN KEY (`idTipoInstitucional`) REFERENCES `tipoinstitucional` (`idTipoInstitucional`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institucional`
--

LOCK TABLES `institucional` WRITE;
/*!40000 ALTER TABLE `institucional` DISABLE KEYS */;
/*!40000 ALTER TABLE `institucional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `integrantes`
--

DROP TABLE IF EXISTS `integrantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `integrantes` (
  `idIntegrante` int(11) NOT NULL AUTO_INCREMENT,
  `idEquipoFK` int(11) NOT NULL,
  `idDeportistasFK` int(11) NOT NULL,
  PRIMARY KEY (`idIntegrante`),
  KEY `FK_integrantes_equipo` (`idEquipoFK`),
  KEY `FK_integrnates_deportistas` (`idDeportistasFK`),
  CONSTRAINT `FK_integrantes_equipo` FOREIGN KEY (`idEquipoFK`) REFERENCES `equipo` (`idEquipo`),
  CONSTRAINT `FK_integrnates_deportistas` FOREIGN KEY (`idDeportistasFK`) REFERENCES `deportistas` (`idDeportistas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integrantes`
--

LOCK TABLES `integrantes` WRITE;
/*!40000 ALTER TABLE `integrantes` DISABLE KEYS */;
/*!40000 ALTER TABLE `integrantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medallas`
--

DROP TABLE IF EXISTS `medallas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medallas` (
  `idMedalla` int(11) NOT NULL,
  `idTipoMedalla` int(11) DEFAULT NULL,
  `IdNumMedalla` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMedalla`),
  KEY `FK_Medallas_TipoMedalla` (`idTipoMedalla`),
  CONSTRAINT `FK_Medallas_TipoMedalla` FOREIGN KEY (`idTipoMedalla`) REFERENCES `tipomedalla` (`idTipoMedalla`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medallas`
--

LOCK TABLES `medallas` WRITE;
/*!40000 ALTER TABLE `medallas` DISABLE KEYS */;
/*!40000 ALTER TABLE `medallas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medallerohistorico`
--

DROP TABLE IF EXISTS `medallerohistorico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medallerohistorico` (
  `idmedHis_PK` int(11) NOT NULL AUTO_INCREMENT,
  `medHisPue` int(11) NOT NULL,
  `pai_FK` int(11) NOT NULL,
  `medHisOro` int(11) NOT NULL,
  `medHisPla` int(11) NOT NULL,
  `medHisBro` int(11) NOT NULL,
  `medHisTot` int(11) NOT NULL,
  PRIMARY KEY (`idmedHis_PK`),
  KEY `FK_medHist_Pais` (`pai_FK`),
  CONSTRAINT `FK_medHist_Pais` FOREIGN KEY (`pai_FK`) REFERENCES `pais` (`idPais`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medallerohistorico`
--

LOCK TABLES `medallerohistorico` WRITE;
/*!40000 ALTER TABLE `medallerohistorico` DISABLE KEYS */;
INSERT INTO `medallerohistorico` VALUES (1,1,1,1948,1455,1027,1000),(2,2,2,875,593,558,2026),(3,3,3,456,656,801,1913),(4,4,4,328,359,520,1207),(5,5,5,294,331,435,1060),(6,6,6,220,289,502,1019),(7,7,7,108,148,277,574),(8,8,8,92,205,277,574),(9,9,9,44,91,151,286),(10,10,10,29,63,112,204),(11,11,11,28,81,134,243),(12,12,12,28,30,61,119),(13,13,13,25,46,60,131),(14,14,14,20,15,40,75),(15,15,15,12,25,46,83),(16,16,16,11,23,29,63),(17,17,17,9,15,13,37),(18,18,18,8,33,69,110),(19,19,19,5,9,17,31),(20,20,20,5,6,11,22),(21,21,21,3,19,26,48),(22,22,22,3,2,5,10),(23,23,23,2,4,12,18),(24,24,24,1,8,13,22),(25,25,25,1,4,4,9),(26,26,26,1,4,1,6),(27,27,27,1,0,2,3),(28,28,28,1,0,2,3),(29,29,29,0,4,7,11),(30,30,30,0,4,6,10),(31,31,31,0,4,11,15),(32,32,32,0,2,5,7),(33,33,33,0,2,1,3),(34,34,34,0,2,1,3),(35,35,35,0,2,8,10),(36,36,36,0,2,6,8),(37,37,37,0,2,4,6),(38,38,38,0,2,2,4),(39,39,39,0,0,2,2),(40,40,40,0,0,2,2),(41,41,41,0,0,0,0),(42,42,42,0,0,0,0);
/*!40000 ALTER TABLE `medallerohistorico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menuprincipal`
--

DROP TABLE IF EXISTS `menuprincipal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menuprincipal` (
  `idMenuPrincipal` int(11) NOT NULL,
  `idCeremonias` int(11) DEFAULT NULL,
  `idPreguntasFrecuentes` int(11) DEFAULT NULL,
  `idAuspiciadores` int(11) DEFAULT NULL,
  `idInstitucional` int(11) DEFAULT NULL,
  `idComite` int(11) DEFAULT NULL,
  `idGaleria` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMenuPrincipal`),
  KEY `FK_MenuPrincipal_Auspiciadores` (`idAuspiciadores`),
  KEY `FK_MenuPrincipal_Ceremonias` (`idCeremonias`),
  KEY `FK_MenuPrincipal_ComiteOrganizador` (`idComite`),
  KEY `FK_MenuPrincipal_Galeria` (`idGaleria`),
  KEY `FK_MenuPrincipal_Institucional` (`idInstitucional`),
  KEY `FK_MenuPrincipal_PreguntasFrecuentes` (`idPreguntasFrecuentes`),
  CONSTRAINT `FK_MenuPrincipal_Auspiciadores` FOREIGN KEY (`idAuspiciadores`) REFERENCES `auspiciadores` (`idAuspiciadores`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_MenuPrincipal_Ceremonias` FOREIGN KEY (`idCeremonias`) REFERENCES `ceremonias` (`idCeremonias`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_MenuPrincipal_ComiteOrganizador` FOREIGN KEY (`idComite`) REFERENCES `comiteorganizador` (`idComite`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_MenuPrincipal_Galeria` FOREIGN KEY (`idGaleria`) REFERENCES `galeria` (`idGaleria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_MenuPrincipal_Institucional` FOREIGN KEY (`idInstitucional`) REFERENCES `institucional` (`idInstitucional`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuprincipal`
--

LOCK TABLES `menuprincipal` WRITE;
/*!40000 ALTER TABLE `menuprincipal` DISABLE KEYS */;
/*!40000 ALTER TABLE `menuprincipal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mision`
--

DROP TABLE IF EXISTS `mision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mision` (
  `idmision` int(11) NOT NULL AUTO_INCREMENT,
  `mi_desc` text NOT NULL,
  `mi_imagen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `mi_fecha` date NOT NULL,
  `bEstPri` bit(1) NOT NULL,
  PRIMARY KEY (`idmision`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mision`
--

LOCK TABLES `mision` WRITE;
/*!40000 ALTER TABLE `mision` DISABLE KEYS */;
INSERT INTO `mision` VALUES (1,'patatas','ruta3.jpg','2019-04-16','\0'),(2,'patatas','ruta3.jpg','2019-04-16','\0'),(3,'patatas','ruta3.jpg','2019-04-16','\0'),(4,'MISION: Ejecutar con eficacia las acciones necesarias para el desarrollo de los XVIII Juegos Panamericanos y Juegos Parapanamericanos del 2019, de manera planificada y coordinada con los actores involucrados.','vista/mgc/img/mision.jpg','2019-05-16','');
/*!40000 ALTER TABLE `mision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moneda`
--

DROP TABLE IF EXISTS `moneda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moneda` (
  `idMoneda` int(11) NOT NULL,
  `idTipoMoneda` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMoneda`),
  KEY `FK_Moneda_TipoMoneda` (`idTipoMoneda`),
  CONSTRAINT `FK_Moneda_TipoMoneda` FOREIGN KEY (`idTipoMoneda`) REFERENCES `tipomoneda` (`idTipoMoneda`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moneda`
--

LOCK TABLES `moneda` WRITE;
/*!40000 ALTER TABLE `moneda` DISABLE KEYS */;
/*!40000 ALTER TABLE `moneda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `norma`
--

DROP TABLE IF EXISTS `norma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `norma` (
  `idNormaPK` int(11) NOT NULL AUTO_INCREMENT,
  `numNor` int(11) NOT NULL,
  `contNor` text NOT NULL,
  `SecRegFK` int(11) NOT NULL,
  PRIMARY KEY (`idNormaPK`),
  KEY `FK_Norma_SeccReg` (`SecRegFK`),
  CONSTRAINT `FK_Norma_SeccReg` FOREIGN KEY (`SecRegFK`) REFERENCES `seccionreglamento` (`idSecRegPK`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `norma`
--

LOCK TABLES `norma` WRITE;
/*!40000 ALTER TABLE `norma` DISABLE KEYS */;
INSERT INTO `norma` VALUES (1,1,'1.  Establecer las reglas a través de las cuales se cumpla, estrictamente, todo lo relativo a la organización de los Juegos Panamericanos.',1),(2,2,'2.  Definir los aspectos organizativos, técnicos y de logística general que debe cumplirse, tanto en la etapa preparatoria como durante el desarrollo de los Juegos Panamericanos.',1),(3,3,'3.  Controlar y asegurar que el Comité Organizador cumpla sus obligaciones y garantice las condiciones adecuadas, desde el punto de vista material, organizativo y técnico, para que los Juegos Panamericanos se desarrollen exitosamente,	en	beneficio	de	los	atletas	y	de	los	Miembros	de	la	Odepa.\r\n',1),(4,4,'4.  Establecer un marco adecuado para la coordinación entre todos los factores que	participan	en	la	organización	de	los	Juegos,	definiendo	y	armonizando	las	responsabilidades	de	cada	una	de	las	partes,	en	interés	y	en	beneficio	de	los	propios Juegos, de los atletas y demás participantes.\r\n',1),(5,5,'5.  Respetar los principios generales establecidos por el Comité Olímpico Internacional para la organización de los Juegos Olímpicos y adoptar su aplicación, cuando resulte conveniente, en el ámbito de los Juegos Panamericanos, particularmente	lo	que	se	refiere	al	concepto	organizativo,	las	reglas	técnicas	para cada deporte, la lucha contra el dopaje, el juego limpio, el espíritu humanista y solidario, el respeto al medio ambiente y la promoción de la imagen olímpica que debe caracterizar a los Juegos Panamericanos, reconociendo, en todo momento, que la Organización Deportiva Panamericana es la máxima autoridad sobre cualquier cuestión relativa a los Juegos Panamericanos.',1),(6,6,'6.  Asegurar que el Reglamento sea respetado por los Miembros de la Odepa, sus atletas	y	oficiales	representantes	y	por	el	Comité	Organizador;	así	como,	por	las Federaciones Internacionales y/o Confederaciones Deportivas Panamericanas u organizaciones deportivas con similares funciones y cualquier otro participante debidamente acreditado en los Juegos Panamericanos. ',1),(7,1,'1.  La Comisión Técnica de la Odepa preparará un Proyecto de Programa Deportivo de los Juegos para su aprobación por el Comité Ejecutivo de la Odepa, a	fin	de	que	sea	entregado	a	las	ciudades	candidatas	a	organizar	los	Juegos	Panamericanos,	una	vez	que	comience	el	proceso	de	candidatura,	con el fin de que dichas ciudades puedan evaluar las posibilidades de llevarlo a cabo en su totalidad.',2),(8,2,'2.  Una vez que la Odepa haya elegido la ciudad que organizará los Juegos, la Comisión Técnica de la Odepa tendrá la responsabilidad de presentar una propuesta al Comité Ejecutivo de la Odepa sobre los deportes, disciplinas y eventos que se recomienda incluir en el Programa de los Juegos Panamericanos. Dicha propuesta será elaborada en coordinación con el Comité Organizador, el Miembro de la Odepa sede de los Juegos y las Confederaciones Deportivas Panamericanas y/o Federaciones Internacionales. La Comisión Técnica someterá el Proyecto del Programa de los Juegos Panamericanos al Comité Ejecutivo de la Odepa para su aprobación',2),(9,3,'3.  El Proyecto de Programa de los Juegos Panamericanos tendrá como base los siguientes aspectos:',2),(10,4,'4.  El Programa incluirá los deportes considerados en el Programa de los siguientes Juegos Olímpicos y que actualmente son:',2),(11,5,'5.  Para que un deporte no olímpico sea elegible para formar parte del Programa de los Juegos Panamericanos, su Federación Internacional debe ser reconocida por la Odepa; al menos veinte (20) Miembros de la Odepa deberán reconocer a su correspondiente Federación Nacional y el Estatuto de la Confederación Deportiva Panamericana y la Federación Internacional deben presentarse a la Comisión Técnica de la Odepa, junto con una descripción detallada de las actividades de su deporte en América. La Comisión Técnica de la Odepa revisará estos documentos y hará una recomendación al Comité Ejecutivo de la Odepa.',2),(12,1,'1.  Las competencias deportivas de los Juegos Panamericanos serán consideradas oficiales siempre que, al	menos noventa (90)	días	antes	del	comienzo	de	los	Juegos	Panamericanos, las inscripciones numéricas finales hayan sido hechas y se cumplan las siguientes condiciones:',3),(13,2,'2.  Si las condiciones mínimas establecidas en el numeral (1) no han sido cumplidas	al momento en que las inscripciones finales sean requeridas por nombre (de 15 a 21 días antes de la inauguración de los Juegos), el deporte, la disciplina o la prueba no se realizará y el Comité Organizador, previa consulta con la Odepa, notificará	la decisión a los CON inscritos, dentro de las 4 horas posteriores a la toma de la decisión.',3),(14,1,'1.  Para participar en los Juegos Panamericanos, un competidor es elegible si está dispuesto a observar, acatar y cumplir el Estatuto de la Odepa y el Reglamento de los Juegos Panamericanos; así como, los reglamentos de su Comité Olímpico Nacional y de la Federación Internacional y/o Confederación Deportiva Panamericana del deporte que representa.',4),(15,2,'2.  No existen límites de edad para los competidores en los Juegos Panamericanos, excepto cuando haya sido previamente aprobado y notificado a la	 Odepa por la Federación Internacional y/o Confederación Panamericana que gobierna un deporte específico.',4),(16,3,'3.  El Estatuto de la Odepa en su Artículo XXII, acápites 4 y 5, sobre la nacionalidad de los atletas participantes en los Juegos Panamericanos, establece que: (4) “Todo competidor que posea simultáneamente la nacionalidad de dos o más países podrá representar a uno de ellos de su elección. Sin embargo, después de haber representado a un país en los Juegos Panamericanos, en campeonatos mundiales o regionales reconocidos por una Confederación Deportiva Panamericana competente, no podrá representar a otro país, a menos que satisfaga las condiciones previstas en el párrafo 5 más abajo, aplicables a las personas que hayan cambiado de nacionalidad o adquirido una nueva.',4),(17,1,'1.  Sobre la inscripción de los atletas en los Juegos Panamericanos el Estatuto de la Odepa, en su Artículo XXII, acápites 6, 7 y 8, establece lo siguiente: (6) “Solo los Miembros de la Odepa podrán inscribir competidores en los Juegos	Panamericanos.	El	derecho	de	aceptar	definitivamente	las	inscripciones	corresponde al Comité Ejecutivo de la Odepa.” (7) “Los miembros de la Odepa solo ejercerán este derecho sobre la base de las recomendaciones de inscripción formuladas por sus federaciones nacionales. Si el Miembro de la Odepa las aprueba, transmitirá estas inscripciones al Comité Organizador, que tendrá la obligación de acusar recibo. Cada Miembro de la Odepa deberá investigar la validez de las inscripciones propuestas por las federaciones nacionales y asegurarse de que ningún candidato ha sido rechazado por razones raciales, religiosas o políticas o como consecuencia de cualquier otra forma de discriminación.” (8) “La participación en los Juegos Panamericanos implica para todo competidor, el compromiso de respetar las disposiciones contenidas en el Estatuto de la Odepa, el Reglamento de los Juegos Panamericanos y los Reglamentos Técnicos de cada deporte. El Miembro de la Odepa que inscribe a un competidor asegura, bajo su responsabilidad, que dicho competidor tiene plena conciencia de su compromiso de respetar el Estatuto de la Odepa, el Reglamento de los Juegos Panamericanos y el Código Mundial Antidopaje.',5),(18,2,'2.  El Comité Organizador de los Juegos Panamericanos enviará los formularios oficiales	de	inscripción,	a	los	Miembros	de	la	Odepa,	como	mínimo	seis	(6)	meses antes de la fecha de inauguración de los Juegos Panamericanos. Los formularios de inscripción deberán especificar todas las disciplinas y prueba de cada deporte que han sido incluidas en el Programa de los Juegos Panamericanos.',5),(19,1,'1.  Las protestas o reclamaciones relacionadas con la elegibilidad de un competidor, deberán ser presentadas, por su Jefe de Misión o el representante de este, junto con un depósito de $100.00 USD (cien dólares), al Comité Ejecutivo de la Odepa, el que decidirá sobre el asunto. El Comité Ejecutivo de la Odepa podrá actuar con la presencia de un mínimo de tres de sus miembros. El análisis de los casos tendrá en cuenta lo siguiente:',6),(20,2,'2.  Las protestas sobre asuntos técnicos realizadas, de acuerdo a las Reglas de las Federaciones Internacionales, serán dirigidas a la autoridad actuante, Juez o Árbitro, de acuerdo a la nomenclatura utilizada en cada deporte, quien, en coordinación con la Federación Internacional y/o Confederación Deportiva Panamericana, decidirá en primera instancia. La decisión puede ser recurrida ante el Jurado de Apelaciones, actuante en el deporte en cuestión, de acuerdo a las reglas del deporte correspondiente.',6),(21,1,'1.  Solo los competidores, así como el personal médico y paramédico y oficiales de equipo, de acuerdo a las cuotas aprobadas y que realicen servicios esenciales para los competidores, inscritos por su correspondiente CON, serán alojados en la Villa Panamericana.',7),(22,2,'2.  Las cuotas para oficiales de equipo alojados en la Villa Panamericana, para cada Miembro de la Odepa, son fijadas por el Comité Ejecutivo de la Odepa y no podrán exceder el cuarenta por ciento (40%) del número de competidores inscritos por cada Miembro de la Odepa.',7),(25,3,'3.  Los oficiales de competencia	(árbitros,	jueces, cronometristas, inspectores y otro personal técnico reglamentario) deberán ser designados por la Federación Internacional y/o Confederación Deportiva Panamericana respectiva, según sus reglamentos y de acuerdo con la retroalimentación y transporte local durante los Juegos Panamericanos y, en el caso que esté establecido, honorarios para dichos	oficiales	de	competencia,	son	responsabilidad	del	Comité	Organizador.',7),(26,1,'1.  Villa Panamericana:',8);
/*!40000 ALTER TABLE `norma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oficinasorganigrama`
--

DROP TABLE IF EXISTS `oficinasorganigrama`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oficinasorganigrama` (
  `idSecretaria` int(11) NOT NULL AUTO_INCREMENT,
  `se_nombre` varchar(60) NOT NULL,
  `se_tipo` bit(1) DEFAULT NULL,
  PRIMARY KEY (`idSecretaria`),
  KEY `idSecretaria` (`idSecretaria`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oficinasorganigrama`
--

LOCK TABLES `oficinasorganigrama` WRITE;
/*!40000 ALTER TABLE `oficinasorganigrama` DISABLE KEYS */;
INSERT INTO `oficinasorganigrama` VALUES (1,'Secreteraría Ejecutiva',''),(2,'Oficina de Administración',''),(3,'Oficina de Recursos Humanos',''),(4,'Oficina de Voluntariado',''),(5,'Oficina de Acreditación',''),(6,'Oficina de Asesoría Jurídica',''),(7,'Oficina de Planeamiento, Presupuesto y Modernización',''),(8,'Oficina de Coordinación de Riesgos y Legado',''),(10,'Dirección Ejecutiva','\0'),(11,'Dirección de Integración','\0'),(12,'Dirección de Proyectos e Infraestructura Definitiva','\0'),(13,'Dirección de Operaciones','\0'),(14,'Dirección de Desarrollo Tecnológico y Transmisiones','\0'),(15,'Dirección de Comunicaciones','\0');
/*!40000 ALTER TABLE `oficinasorganigrama` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pais` (
  `idPais` int(11) NOT NULL AUTO_INCREMENT,
  `NombrePais` varchar(40) DEFAULT NULL,
  `BanderaPais` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idPais`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (1,'Estados Unidos','C:\\xampp\\htdocs\\WEPLAY\\vista\\mgc\\img\\banderas\\estadosUnidos.jpg'),(2,'Cuba','C:\\xampp\\htdocs\\WEPLAY\\vista\\mgc\\img\\banderas\\cuba.jpg'),(3,'Canadá','C:\\xampp\\htdocs\\WEPLAY\\vista\\mgc\\img\\banderas\\canada.jpg'),(4,'Brasil','C:\\xampp\\htdocs\\WEPLAY\\vista\\mgc\\img\\banderas\\brasil.jpg'),(5,'Argentina','C:\\xampp\\htdocs\\WEPLAY\\vista\\mgc\\img\\banderas\\argentina.jpg'),(6,'Mexico','C:\\xampp\\htdocs\\WEPLAY\\vista\\mgc\\img\\banderas\\mexico.jpg'),(7,'Colombia',' C:\\xampp\\htdocs\\WEPLAY\\vista\\mgc\\img\\banderas\\colombia.jpg'),(8,'Venezuela','C:\\xampp\\htdocs\\WEPLAY\\vista\\mgc\\img\\banderas\\venezuela.jpg'),(9,'Chile','C:\\xampp\\htdocs\\WEPLAY\\vista\\mgc\\img\\banderas\\chile.jpg'),(10,'República Dominicana','C:\\xampp\\htdocs\\WEPLAY\\vista\\mgc\\img\\banderas\\republicaDominicana.jpg'),(11,'Puerto Rico','C:\\xampp\\htdocs\\WEPLAY\\vista\\mgc\\img\\banderas\\puertoRico.jpg'),(12,'Ecuador',NULL),(13,'Jamaica',NULL),(14,'Guatemala',NULL),(15,'Uruguay',NULL),(16,'Trinidad y Tobago',NULL),(17,'Bahamas',NULL),(18,'Perú',NULL),(19,'Antillas Neerlandesas',NULL),(20,'Costa Rica',NULL),(21,'Panamá',NULL),(22,'Surinam',NULL),(23,'Guyana',NULL),(24,'El Salvador',NULL),(25,'Bermudas',NULL),(26,'Islas Caimán',NULL),(27,'Antigua y Barbuda',NULL),(28,'Santa Lucía',NULL),(29,'Nicaragua',NULL),(30,'Islas Virgenes de los Estados Unidos',NULL),(31,'Barbados',NULL),(32,'Haití',NULL),(33,'Dominica',NULL),(34,'San Cristóbal Y Nieves',NULL),(35,'Paraguay',NULL),(36,'Bolivia',NULL),(37,'Honduras',NULL),(38,'Granada',NULL),(39,'Belice',NULL),(40,'San Vicente y las Granadinas',NULL),(41,'Aruba',NULL),(42,'Islas Virgenes Británicas',NULL);
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participantegrupal`
--

DROP TABLE IF EXISTS `participantegrupal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participantegrupal` (
  `idPartGrupal` int(11) NOT NULL AUTO_INCREMENT,
  `idEventoFK` int(11) NOT NULL,
  `idEquipo1FK` int(11) NOT NULL,
  `idEquipo2FK` int(11) NOT NULL,
  PRIMARY KEY (`idPartGrupal`),
  KEY `FK_partGrupal_Equipo1` (`idEquipo1FK`),
  KEY `FK_partGrupal_Equipo2` (`idEquipo2FK`),
  KEY `Fk_partGrupal_eventos` (`idEventoFK`),
  CONSTRAINT `FK_partGrupal_Equipo1` FOREIGN KEY (`idEquipo1FK`) REFERENCES `equipo` (`idEquipo`),
  CONSTRAINT `FK_partGrupal_Equipo2` FOREIGN KEY (`idEquipo2FK`) REFERENCES `equipo` (`idEquipo`),
  CONSTRAINT `Fk_partGrupal_eventos` FOREIGN KEY (`idEventoFK`) REFERENCES `eventos` (`idEvento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participantegrupal`
--

LOCK TABLES `participantegrupal` WRITE;
/*!40000 ALTER TABLE `participantegrupal` DISABLE KEYS */;
/*!40000 ALTER TABLE `participantegrupal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participanteindividual`
--

DROP TABLE IF EXISTS `participanteindividual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participanteindividual` (
  `idPartIndividual` int(11) NOT NULL AUTO_INCREMENT,
  `idDeportistasFK` int(11) NOT NULL,
  `idPaisFK` int(11) NOT NULL,
  `idEventoFK` int(11) NOT NULL,
  PRIMARY KEY (`idPartIndividual`),
  KEY `FK_partiipanteIndividual_Eventos` (`idEventoFK`),
  KEY `FK_partIndividual_deportistas` (`idDeportistasFK`),
  KEY `FK_Partiindividual_Pais` (`idPaisFK`),
  CONSTRAINT `FK_Partiindividual_Pais` FOREIGN KEY (`idPaisFK`) REFERENCES `pais` (`idPais`),
  CONSTRAINT `FK_partIndividual_deportistas` FOREIGN KEY (`idDeportistasFK`) REFERENCES `deportistas` (`idDeportistas`),
  CONSTRAINT `FK_partiipanteIndividual_Eventos` FOREIGN KEY (`idEventoFK`) REFERENCES `eventos` (`idEvento`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participanteindividual`
--

LOCK TABLES `participanteindividual` WRITE;
/*!40000 ALTER TABLE `participanteindividual` DISABLE KEYS */;
INSERT INTO `participanteindividual` VALUES (1,1,1,1),(2,2,9,1),(8,8,18,1),(9,9,18,1),(10,10,18,1),(11,11,18,1),(12,12,18,1),(13,13,18,1),(14,14,18,1),(15,15,18,1),(16,16,18,1);
/*!40000 ALTER TABLE `participanteindividual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pregfrecareas`
--

DROP TABLE IF EXISTS `pregfrecareas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pregfrecareas` (
  `idareaPreFrePK` int(11) NOT NULL AUTO_INCREMENT,
  `nomAre` varchar(255) NOT NULL,
  PRIMARY KEY (`idareaPreFrePK`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pregfrecareas`
--

LOCK TABLES `pregfrecareas` WRITE;
/*!40000 ALTER TABLE `pregfrecareas` DISABLE KEYS */;
INSERT INTO `pregfrecareas` VALUES (1,'JUEGOS PANAMERICANOS'),(2,'VOLUNTARIADO'),(3,'CONVOCATORIAS'),(4,'SEDES'),(5,'COMPETENCIAS'),(6,'TICKETS'),(7,'PROVEEDORES'),(8,'CONTACTO');
/*!40000 ALTER TABLE `pregfrecareas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preguntasfrecuentes`
--

DROP TABLE IF EXISTS `preguntasfrecuentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preguntasfrecuentes` (
  `idPreFrePK` int(11) NOT NULL AUTO_INCREMENT,
  `pregResCont` varchar(255) NOT NULL,
  `idAreaPreFreFK` int(11) NOT NULL,
  PRIMARY KEY (`idPreFrePK`),
  KEY `FK_pregFrec_Areas` (`idAreaPreFreFK`),
  CONSTRAINT `FK_pregFrec_Areas` FOREIGN KEY (`idAreaPreFreFK`) REFERENCES `pregfrecareas` (`idareaPreFrePK`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preguntasfrecuentes`
--

LOCK TABLES `preguntasfrecuentes` WRITE;
/*!40000 ALTER TABLE `preguntasfrecuentes` DISABLE KEYS */;
INSERT INTO `preguntasfrecuentes` VALUES (1,'1. ¿Cuándo se llevarán a cabo los Juegos Panamericanos?\r\nLos Juegos se llevarán a cabo desde el 26 de julio al 11 de agosto. ',1),(2,'2. ¿Cuántos deportes y disciplinas tendrán los Juegos Panamericanos? Los Juegos Panamericanos contarán con 39 deportes y 61 disciplinas. ',1),(3,'3. ¿Cuántos deportistas participarán en los Juegos Panamericanos?\r\nEn los Juegos Panamericanos participarán 6680 deportistas. ',1),(4,'4. ¿Cuántas delegaciones participarán en los Juegos Panamericanos?\r\nParticiparán 41 delegaciones en los Juegos Panamericanos.',1),(5,'1. ¿Cuántos voluntarios podrán participar en los jeugos Panamericanos Lima 2019? Necesitamos 12mil voluntarios y voluntarias para los XVIII Juegos Panamericanos. La convocatoria de voluntarios y voluntarias estará abierta a nivel ancional e internacional.',2),(6,'2. ¿Hay un límite de edad?\r\nLos límites los pones tú. Solo debes ser mayor de 16 años al 01 de abril de 2019, día en el cual se da inicio a las actividades previas de los Juegos Panamericanos. ',2),(7,'3. ¿Las personas con discapacidad pueden participar en el programa de Voluntariado?\r\n¡Te necesitamos! Esperamos que las personas con discapacidad participen en los Juegos Panamericanos y/o en los Juegos Parapanamericanos. ',2),(8,'4. Si soy extranjero, ¿también puedo ser voluntario o voluntaria de los Juegos Panamericanos Lima 2019?\r\n¡Por supuesto! Las inscripciones del Programa de Voluntariado se lanzarán a nivel nacional como internacional. ',2),(9,'1. ¿Cómo puedo postular a las convocatorias de Lima2019?\r\nPuedes conocer las convocatorias laborales en la sección Trabaja con Nosotros ',3),(10,'2. ¿Cómo me puedo contactar con el área de selección de personal?\r\nSi tienes una consulta sobre un proceso puedes escribir a consultascas@lima2019.pe ',3),(11,'3. He postulado a una convocatoria y tengo dudas sobre el proceso ¿Cómo puedo contactarlos?\r\nPuedes escribir a convocatorias@lima2019.pe ',3),(12,'4. Si soy extranjero, ¿puedo postular a una convocatoria?\r\nTodos pueden postular siempre y cuando cumplan con los requisitos y la correcta presentación de los formatos y/o anexos según lo indican las bases. ',3),(13,'1. ¿Cuál es el número de obras listas para los Juegos Lima 2019?\r\nActualmente contamos con 10 sedes entregadas para la realización de los juegos Lima 2019. ',4),(14,'2. ¿Cuándo estarán listas las demás obras?\r\nLa infraestructura en construcción estará lista en marzo de 2019, fecha en la que estará ejecutada el 100% de las obras. ',4),(15,'3. ¿Cuál es la sede de inauguración y clausura de los Juegos Lima 2019?\r\nLa inauguración y clausura de los Juegos Lima 2019 será en el Estadio Nacional. ',4),(16,'4. ¿Cuántas sedes de competencia tiene Lima 2019?\r\nContamos con 19 sedes de competencia para la realización de los Juegos Panamericanos y Parapanamericanos. ',4),(17,'1. ¿Está lista la programación de las competencias?\r\nLa programación final está lista, los detalles los puedes ver a través de nuestros canales oficiales. ',5),(19,'2. ¿Cómo puedo competir en los Juegos Panamericanos?\r\nPara participar en los Juegos Panamericanos debes ser un atleta de alto rendimiento y ser seleccionado por la federación nacional de tu deporte. ',5),(20,'3. ¿Cómo puedo saber el sistema de clasificación a Lima 2019?\r\nPuedes conocer el manual de clasificación a nuestros juegos aquí http://www.panamsports.org/downloads/pdf/manual-de-sistemas-de-clasificacion-lima-2019.pdf ',5),(21,'4. ¿Cuántas delegaciones participarán en los Juegos Panamericanos?\r\nParticiparán 41 delegaciones en los Juegos Panamericanos. ',5),(22,'1. ¿Cuándo inicia la venta de tickets?\r\nLa venta de tickets iniciará el 27 de mayo. Estaremos informando todos los detalles a través de nuestros canales oficiales. ',6),(23,'1. ¿Cómo puedo ser proveedor de los Juegos?\r\nPuedes conocer los procesos de contrataciones que se llevaron o se están llevando en la sección de Contrataciones. ',7),(24,'1. ¿A qué teléfono me puedo comunicar?\r\nEl número de nuestra central telefónica es 4105500. Si estás fuera de Perú deberás anteponerle el código (511). ',8),(25,'2. Quisiéramos compartir una nota de prensa con ustedes, ¿a qué correo la podemos compartir?\r\nPuedes escribir a prensa@lima2019.pe para compartir tu información. ',8);
/*!40000 ALTER TABLE `preguntasfrecuentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ranking`
--

DROP TABLE IF EXISTS `ranking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ranking` (
  `idRanking` int(11) NOT NULL,
  `idDeportista` int(11) DEFAULT NULL,
  `idDeporte` int(11) DEFAULT NULL,
  `idMedalla` int(11) DEFAULT NULL,
  PRIMARY KEY (`idRanking`),
  KEY `FK_Ranking_Deportes` (`idDeporte`),
  KEY `FK_Ranking_Deportistas` (`idDeportista`),
  KEY `FK_Ranking_Medallas` (`idMedalla`),
  CONSTRAINT `FK_Ranking_Deportes` FOREIGN KEY (`idDeporte`) REFERENCES `deportes` (`idDeporte`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Ranking_Deportista` FOREIGN KEY (`idDeportista`) REFERENCES `deportistas` (`idDeportistas`),
  CONSTRAINT `FK_Ranking_Medallas` FOREIGN KEY (`idMedalla`) REFERENCES `medallas` (`idMedalla`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ranking`
--

LOCK TABLES `ranking` WRITE;
/*!40000 ALTER TABLE `ranking` DISABLE KEYS */;
/*!40000 ALTER TABLE `ranking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reglamento`
--

DROP TABLE IF EXISTS `reglamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reglamento` (
  `idReglamento` int(11) NOT NULL,
  `descripReglamento` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idReglamento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reglamento`
--

LOCK TABLES `reglamento` WRITE;
/*!40000 ALTER TABLE `reglamento` DISABLE KEYS */;
INSERT INTO `reglamento` VALUES (1,'reglamento de futbol');
/*!40000 ALTER TABLE `reglamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporteentrada`
--

DROP TABLE IF EXISTS `reporteentrada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporteentrada` (
  `idReporteEntrada` int(11) NOT NULL,
  `idDeporte` int(11) DEFAULT NULL,
  PRIMARY KEY (`idReporteEntrada`),
  KEY `FK_ReporteEntrada_Deportes` (`idDeporte`),
  CONSTRAINT `FK_ReporteEntrada_Deportes` FOREIGN KEY (`idDeporte`) REFERENCES `deportes` (`idDeporte`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporteentrada`
--

LOCK TABLES `reporteentrada` WRITE;
/*!40000 ALTER TABLE `reporteentrada` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporteentrada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `representantes`
--

DROP TABLE IF EXISTS `representantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `representantes` (
  `IdRepresentateORG` int(11) NOT NULL,
  `DescripcionR` text,
  PRIMARY KEY (`IdRepresentateORG`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `representantes`
--

LOCK TABLES `representantes` WRITE;
/*!40000 ALTER TABLE `representantes` DISABLE KEYS */;
INSERT INTO `representantes` VALUES (1,'Representante del Ministerio de Transportes y Comunicaciones.'),(2,'Representante del Ministerio de Trasportes y Comunicaciones.'),(3,'Representante de la Municipalidad Metropolitana de Lima.'),(4,'Representante de la Municipalidad Metropolitana de Lima.'),(5,'Representante del Gobierno Regional del Callao.'),(6,'Presidente del comite Olímpico Peruano.'),(7,'Representante del comite Olimpico Peruano.'),(8,'Representante del Instituto Peruano del Deporte.'),(9,'Representante del Ministerio de Economia y Finanzas.'),(10,'Representante del Ministerio de Vivienda y Contrucción.'),(11,'Representante del Ministerio de Educación.'),(12,'Representate del Comite Olímpico Internacional.'),(13,'Presidente de la Asociación Nacional Paralímpica del Perú.');
/*!40000 ALTER TABLE `representantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resultadogrupal`
--

DROP TABLE IF EXISTS `resultadogrupal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resultadogrupal` (
  `idResGrupal` int(11) NOT NULL AUTO_INCREMENT,
  `idPartGrupalFK` int(11) NOT NULL,
  `fechaResultadoGr` date NOT NULL,
  `res_gr_puesto` varchar(25) NOT NULL,
  PRIMARY KEY (`idResGrupal`),
  KEY `FK_resGrupal_partGrupal` (`idPartGrupalFK`),
  CONSTRAINT `FK_resGrupal_partGrupal` FOREIGN KEY (`idPartGrupalFK`) REFERENCES `participantegrupal` (`idPartGrupal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resultadogrupal`
--

LOCK TABLES `resultadogrupal` WRITE;
/*!40000 ALTER TABLE `resultadogrupal` DISABLE KEYS */;
/*!40000 ALTER TABLE `resultadogrupal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resultadoindividual`
--

DROP TABLE IF EXISTS `resultadoindividual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resultadoindividual` (
  `idResIndividual` int(11) NOT NULL AUTO_INCREMENT,
  `idPartIndividualFK` int(11) NOT NULL,
  `fechaResultado` date NOT NULL,
  `res_in_puesto` varchar(25) NOT NULL,
  PRIMARY KEY (`idResIndividual`),
  KEY `ResIndividual_partIndividual_FK` (`idPartIndividualFK`),
  CONSTRAINT `ResIndividual_partIndividual_FK` FOREIGN KEY (`idPartIndividualFK`) REFERENCES `participanteindividual` (`idPartIndividual`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resultadoindividual`
--

LOCK TABLES `resultadoindividual` WRITE;
/*!40000 ALTER TABLE `resultadoindividual` DISABLE KEYS */;
INSERT INTO `resultadoindividual` VALUES (1,1,'2019-05-30','1'),(9,1,'0000-00-00','16'),(10,1,'2019-05-31','23'),(11,16,'2019-05-31','12'),(12,9,'2019-05-31','1'),(13,10,'2019-05-31','1'),(14,1,'2019-06-10','4');
/*!40000 ALTER TABLE `resultadoindividual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seccionreglamento`
--

DROP TABLE IF EXISTS `seccionreglamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seccionreglamento` (
  `idSecRegPK` int(11) NOT NULL AUTO_INCREMENT,
  `numSec` int(11) NOT NULL,
  `TitSec` varchar(255) NOT NULL,
  PRIMARY KEY (`idSecRegPK`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seccionreglamento`
--

LOCK TABLES `seccionreglamento` WRITE;
/*!40000 ALTER TABLE `seccionreglamento` DISABLE KEYS */;
INSERT INTO `seccionreglamento` VALUES (1,1,'SECCION I OBJETIVOS'),(2,2,'SECCIÓN II PROGRAMA DE LOS JUEGOS PANAMERICANOS'),(3,3,'SECCIÓN III COMPETENCIAS DE LOS JUEGOS PANAMERICANOS\r\n'),(4,4,'SECCIÓN IV ELEGIBILIDAD DE LOS ATLETAS PARA PARTICIPAR EN LOS JUEGOS PANAMERICANOS\r\n'),(5,5,'SECCIÓN V INSCRIPCIONES DE LOS PARTICIPANTES EN LOS JUEGOS PANAMERICANOS\r\n'),(6,6,'SECCIÓN VI PROTESTAS Y RECLAMACIONES DURANTE LOS JUEGOS PANAMERICANOS\r\n'),(7,7,'SECCIÓN VII OFICIALES, PERSONAL MÉDICO Y PARAMÉDICO, OFICIALES TÉCNICOS, JUECES Y ÁRBITROS QUE ACTUARÁN EN LOS JUEGOS PANAMERICANOS\r\n'),(8,8,'SECCIÓN VIII ALOJAMIENTO DE LOS PARTICIPANTES EN LOS JUEGOS PANAMERICANOS\r\n'),(9,9,'SECCIÓN IX ACREDITACIÓN DE LOS PARTICIPANTES EN LOS JUEGOS PANAMERICANOS\r\n'),(10,10,'SECCIÓN X REUNIÓN DE JEFES DE MISIÓN\r\nSECCIÓN X REUNIÓN DE JEFES DE MISIÓN\r\n');
/*!40000 ALTER TABLE `seccionreglamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sedes`
--

DROP TABLE IF EXISTS `sedes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sedes` (
  `idSede` int(11) NOT NULL,
  `NombreSede` varchar(255) NOT NULL,
  `imgSede` varchar(255) NOT NULL,
  `DireccionSede` varchar(50) NOT NULL,
  PRIMARY KEY (`idSede`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sedes`
--

LOCK TABLES `sedes` WRITE;
/*!40000 ALTER TABLE `sedes` DISABLE KEYS */;
INSERT INTO `sedes` VALUES (1,'Lima sur','imagen en proceso','Av. 123'),(2,'Lima norte','en proceso','Av. 123'),(3,'Lima Centro','en proceso','Av. 123'),(4,'Al Sur de Lima','en proceso','Av. 123');
/*!40000 ALTER TABLE `sedes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stockasientos`
--

DROP TABLE IF EXISTS `stockasientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stockasientos` (
  `idStockAsiento` int(11) NOT NULL,
  `CantiDisponible` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idStockAsiento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stockasientos`
--

LOCK TABLES `stockasientos` WRITE;
/*!40000 ALTER TABLE `stockasientos` DISABLE KEYS */;
/*!40000 ALTER TABLE `stockasientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subnorma`
--

DROP TABLE IF EXISTS `subnorma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subnorma` (
  `idSubNor` int(11) NOT NULL AUTO_INCREMENT,
  `numSubNor` char(255) NOT NULL,
  `contSubNor` text NOT NULL,
  `normaFK` int(11) NOT NULL,
  PRIMARY KEY (`idSubNor`),
  KEY `FK_SubNorma_Norma` (`normaFK`),
  CONSTRAINT `FK_SubNorma_Norma` FOREIGN KEY (`normaFK`) REFERENCES `norma` (`idNormaPK`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subnorma`
--

LOCK TABLES `subnorma` WRITE;
/*!40000 ALTER TABLE `subnorma` DISABLE KEYS */;
INSERT INTO `subnorma` VALUES (1,'3.1','3.1  La totalidad de deportes, disciplinas y pruebas incluidos en el Programa de los siguientes Juegos Olímpicos.',3),(2,'3.2','3.2  Los deportes que consideran los Juegos Panamericanos como evento de calificación	olímpica.	El	Comité	Ejecutivo	de	la	Odepa,	en	coordinación	con	la Federación Internacional y/o Confederación Deportiva Panamericana correspondiente, podrá establecer otras alternativas, a través de las cuales se vinculen los resultados de los atletas y equipos en los Juegos Panamericanos con su participación en los siguientes Juegos Olímpicos.',3),(3,'3.3','3.3  Aquellos deportes, disciplinas y pruebas cuya Federación Internacional y/o Confederación Deportiva Panamericana hayan alcanzado un nivel adecuado en el desarrollo de sus actividades en América. ',3),(4,'3.4','3.4  Los deportes y eventos con mayor participación y popularidad en América',3),(5,'3.5','3.5  Los deportes en que participen hombres y mujeres.',3),(6,'4.1','4.1  Deportes del Programa Olímpico (28 deportes): ATLETISMO Masculino y Femenino, - BÁDMINTON Masculino y	Femenino - BALONMANO Masculino y Femenino - BALONCESTO Masculino y Femenino - BÉISBOL Masculino - BOXEO Masculino - CANOTAJE Masculino y Femenino -	CICLISMO	Masculino y Femenino - ECUESTRE Masculino y Femenino - ESGRIMA Masculino y Femenino -	FÚTBOL Masculino y Femenino - GIMNASIA Masculino y Femenino - HOCKEY SOBRE CÉSPED Masculino	y Femenino - JUDO Masculino	y Femenino - LEVANTAMIENTO DE PESAS	Masculino	y Femenino - LUCHA Masculino y Femenino - NATACIÓN Masculino y Femenino - PENTATLÓN MODERNO Masculino y Femenino - REMO Masculino y Femenino - SOFTBOL Femenino - TAE KWON DO Masculino y Femenino - TENIS Masculino y Femenino - TENIS	DE MESA Masculino	y Femenino - TIRO Masculino y	Femenino - TIRO CON ARCO Masculino y	Femenino - TRIATLÓN Masculino y Femenino - VELA Masculino y Femenino - VOLEIBOL Masculino y Femenino.',10),(7,'4.2','4.2 Las disciplinas y pruebas de cada deporte olímpico serán, sin excepción, las aprobadas por el Comité Olímpico Internacional para los Juegos Olímpicos inmediatamente posteriores a los Juegos Panamericanos.',10),(8,'4.3','4.3 Los deportes, disciplinas y pruebas pueden ser modificados	por el Comité Olímpico Internacional. Si este fuera el caso, la lista de deportes señalada en el Acápite 4.1 precedente, se ajustará a lo establecido por el COI.',10),(9,'1.1','1.1 Para deportes individuales, un mínimo de ocho (8) comités olímpicos nacionales (CON) deben haber presentado inscripciones.',12),(10,'1.2','1.2  Para deportes de equipo, hombres o mujeres, un mínimo de cinco (5) CON deben haber presentado inscripciones.',12),(11,'1.3','1.3  Para deportes individuales, en los que hay más de una prueba, individual y por equipos, un mínimo de cinco (5) CON deben haber presentado inscripciones.',12),(12,'1.1','1.1  Si una protesta o reclamación es presentada antes del inicio de los Juegos Panamericanos y la decisión es adversa para el atleta involucrado, este no podrá participar en los Juegos.',19),(13,'1.2','1.2  Si una decisión adversa es adoptada después del inicio de los Juegos Panamericanos, el atleta deberá ser descalificado de los Juegos Panamericanos.',19),(14,'1.3','1.3  En las competencias de deporte de equipo, el retiro del atleta o los atletas afectados por la decisión adversa, puede resultar en la pérdida del partido o los partidos en los que haya o hayan participado dichos atletas.',19),(15,'1.1','1.1  Todos los competidores en los Juegos Panamericanos serán alojados en la Villa Panamericana, a menos que otra decisión haya sido tomada por el Comité Ejecutivo de la Odepa.',26),(16,'1.2','1.2  La Villa estará abierta al menos diez (10) días antes de la ceremonia de inauguración y permanecerá abierta al menos durante tres (3) días posteriores a la ceremonia de clausura de los Juegos Panamericanos. La Villa Panamericana debe satisfacer las exigencias mínimas, similares a las establecidas por el COI para la organización de la Villa de los atletas en unos Juegos Olímpicos.',26);
/*!40000 ALTER TABLE `subnorma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysdiagrams`
--

DROP TABLE IF EXISTS `sysdiagrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysdiagrams` (
  `diagram_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 NOT NULL,
  `principal_id` int(11) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `definition` longblob,
  PRIMARY KEY (`diagram_id`),
  UNIQUE KEY `UK_principal_name` (`principal_id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysdiagrams`
--

LOCK TABLES `sysdiagrams` WRITE;
/*!40000 ALTER TABLE `sysdiagrams` DISABLE KEYS */;
INSERT INTO `sysdiagrams` VALUES (6,'Diagram_final',1,1,'\�\�ࡱ\Z\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0>\0\0��	\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0]\0\0\0\0\0\0����\0\0\0\0\0\0\0\0`\0\0\0������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������_\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0����\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0\0!\0\0\0\"\0\0\0#\0\0\0$\0\0\0%\0\0\0&\0\0\0\'\0\0\0(\0\0\0)\0\0\0*\0\0\0+\0\0\0,\0\0\0-\0\0\0.\0\0\0/\0\0\00\0\0\01\0\0\02\0\0\03\0\0\04\0\0\05\0\0\06\0\0\07\0\0\08\0\0\09\0\0\0:\0\0\0;\0\0\0<\0\0\0=\0\0\0>\0\0\0?\0\0\0@\0\0\0A\0\0\0B\0\0\0C\0\0\0D\0\0\0E\0\0\0F\0\0\0G\0\0\0H\0\0\0I\0\0\0J\0\0\0K\0\0\0L\0\0\0M\0\0\0N\0\0\0O\0\0\0P\0\0\0Q\0\0\0R\0\0\0S\0\0\0T\0\0\0U\0\0\0V\0\0\0W\0\0\0X\0\0\0Y\0\0\0Z\0\0\0[\0\0\0\\\0\0\0���������\0\0\0��������b\0\0\0c\0\0\0d\0\0\0e\0\0\0f\0\0\0g\0\0\0h\0\0\0i\0\0\0j\0\0\0k\0\0\0l\0\0\0m\0\0\0n\0\0\0o\0\0\0p\0\0\0q\0\0\0r\0\0\0s\0\0\0t\0\0\0u\0\0\0v\0\0\0w\0\0\0x\0\0\0y\0\0\0z\0\0\0{\0\0\0|\0\0\0}\0\0\0~\0\0\0\0\0\0�\0\0\0R\0o\0o\0t\0 \0E\0n\0t\0r\0y\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��������\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0p\�4��\�^\0\0\0�\n\0\0\0\0\0\0f\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0������������\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�&\0\0\0\0\0\0o\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0����\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\09�\0\0\0\0\0\0\0C\0o\0m\0p\0O\0b\0j\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0������������\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0_\0\0\0\0\0\0\0\04\0\nP\0\0��\0\0\0\0��\0\0\0�\0\0\0\0}\0\0��\0\0�D\0\0�\0i�\0\0N���M\0\0ހ[�\���\0�\0�\�\\\0\0\00\0\0\0\0\0\0\0\0\0<\0k\0\0\0	\0\0\0\0\0\0\0\�\�\��\��Q\0�\�W9�;�a\�C�5)�\�\�R��2}�\�b�B��\'<%�\�-\0\0(\0C\0\0\0\0\0\0\0SDM\�\��c\0`�\�\�H4\�\�wyw\��p\0[�\r�\0\0(\0C\0\0\0\0\0\0\0QDM\�\��c\0`�\�\�H4\�\�wyw\��p\0[�\r��\0\0\0�%\0\0\0�\0�\�\0\00\0�	\0\0\0\0�\0\0\0�\0\0\0�\0\0\0\0�SchGrid\0\�\0\0\�d\0\0Asientos\0\08\0�	\0\0\0\0�\0\0\0�\0\0\0�\0\0\r\0\0�SchGrid\0(�\0\06\�\0\0Auspiciadores\0\0\0\08\0�	\0\0\0\0�\0\0\0�\0\0\0�\0\0\0\0�SchGrid\0x�\0\0ފ\0\0CategoriaAsiento\0\0x\0�	\0\0\0\0�\0\0\0b\0\0\0�\0\0M\0\0�Control\0_�\0\0\�}\0\0Relaci�n \'FK_Asientos_CategoriaAsiento\' entre \'CategoriaAsiento\' y \'Asientos\'\0\0\0\0\0(\0�\0\0\0\0�\0\0\01\0\0\0k\0\0\0�\0\0Control\0�\0\0L�\0\0\0\04\0�	\0\0\0\0�\0\0\0�\0\0\0�\0\0\n\0\0�SchGrid\0Lh\0\0P\�\0\0Ceremonias\0\0\0\0<\0�	\0\0\0\0�\0\0\0�\0\0\0�\0\0\0\0�SchGrid\0�%\0\08\0ComiteOrganizador\0\0\0\0\08\0�	\0\0\0\0�\0\0\0�\0\0\0�\0\0\0\0�SchGrid\00u\0\0Da\0\0Compra_Entradato\0\08\0�	\0\0\0\0�	\0\0\0�\0\0\0�\0\0\0\0�SchGrid\0�+\0\0(n\0\0ComprobantePago\0\0\08\0�	\0\0\0\0�\n\0\0\0�\0\0\0�\0\0\0\0�SchGrid\0\���2�\0\0DeporteDestacado\0\00\0�	\0\0\0\0�\0\0\0�\0\0\0�\0\0\0\0�SchGrid\0.���^�\0\0Deportes\0\04\0�	\0\0\0\0�\0\0\0�\0\0\0�\0\0\0\0�SchGrid\0�\n\0\0F\�\0\0Deportistasa\0\08\0�	\0\0\0\0�\r\0\0\0�\0\0\0�\0\0\0\0�SchGrid\0^\���6�\0\0DetalleDeporte\0\0\0\08\0�	\0\0\0\0�\0\0\0�\0\0\0�\0\0\0\0�SchGrids\"\0\0R\�\0\0DetalleEventos\0\0\0\08\0�	\0\0\0\0�\0\0\0�\0\0\0�\0\0\r\0\0�SchGrids��\0\0 g\0\0EstadoAsiento\0\0\0\0p\0�	\0\0\0\0�\0\0\0R\0\0\0�\0\0G\0\0�Control\0R�\0\0�i\0\0Relaci�n \'FK_Asientos_EstadoAsiento\' entre \'EstadoAsiento\' y \'Asientos\'V\0\0(\0�\0\0\0\0�\0\0\01\0\0\0e\0\0\0�\0\0Control\05�\0\08i\0\0\0\00\0�	\0\0\0\0�\0\0\0�\0\0\0�\0\0\0\0�SchGrid\0`	\0\0��\0\0Eventos\0\0\04\0�	\0\0\0\0�\0\0\0�\0\0\0�\0\0\0\0�SchGrid\0�2\0\0��\0\0FechaEventot\0\00\0�	\0\0\0\0�\0\0\0�\0\0\0�\0\0\0\0�SchGrids\�k\0\0\��\0\0Galerias\0\08\0�	\0\0\0\0�\0\0\0�\0\0\0�\0\0\0\0�SchGrid\0zX\0\0\�\0\0HorarioEventosdo\0\0x\0�	\0\0\0\0�\0\0\0Z\0\0\0�\0\0O\0\0�Controls]M\0\0��\0\0Relaci�n \'FK_HorarioEventos_FechaEvento\' entre \'FechaEvento\' y \'HorarioEventos\'\0\0(\0�\0\0\0\0�\0\0\01\0\0\0m\0\0\0�\0\0Control\0\�P\0\0�\0\0\0\08\0�	\0\0\0\0�\0\0\0�\0\0\0�\0\0\r\0\0�SchGridsԔ\0\0n�\0\0Institucionale\0\0\0\00\0�	\0\0\0\0�\0\0\0�\0\0\0�\0\0\0\0�SchGrid\0����6\�\0\0Medallas\0\08\0�	\0\0\0\0�\Z\0\0\0�\0\0\0�\0\0\r\0\0�SchGrids�\0\0b\�\0\0MenuPrincipalsdo\0\00\0�	\0\0\0\0�\0\0\0�\0\0\0�\0\0\0\0�SchGrid\0H�\0\0ފ\0\0Monedad\0\0\0<\0�	\0\0\0\0�\0\0\0�\0\0\0�\0\0\0\0�SchGrid\0r�\0\0x�\0\0PreguntasFrecuentes\0\0\00\0�	\0\0\0\0�\0\0\0�\0\0\0�\0\0\0\0�SchGrid\0�\���Z\�\0\0Ranking\0\0\04\0�	\0\0\0\0�\0\0\0�\0\0\0�\0\0\n\0\0�SchGridsT\���<�\0\0Reglamentont\0\08\0�	\0\0\0\0�\0\0\0�\0\0\0�\0\0\0\0�SchGrid\0���\�a\0\0ReporteEntrada\0\0\0\08\0�	\0\0\0\0� \0\0\0�\0\0\0�\0\0\0\0�SchGrid\0\�P\0\0\0Representantesdo\0\08\0�	\0\0\0\0�!\0\0\0�\0\0\0�\0\0\r\0\0�SchGrids8\�\0\0t\0\0StockAsientosgo\0\0\0p\0�	\0\0\0\0�\"\0\0\0R\0\0\0�\0\0G\0\0�ControlsR�\0\0�v\0\0Relaci�n \'FK_Asientos_StockAsientos\' entre \'StockAsientos\' y \'Asientos\'\0\0\0(\0�\0\0\0\0�#\0\0\01\0\0\0e\0\0\0�\0\0Control\0Ӷ\0\0\�x\0\0\0\0<\0�	\0\0\0\0�$\0\0\0�\0\0\0�\0\0\0\0�SchGrid\0��\0\0��\0\0TipoAuspiciadores\0\0\0\0\08\0�	\0\0\0\0�%\0\0\0�\0\0\0�\0\0\0\0�SchGrid\0Lh\0\0�\0\0TipoCeremoniasdo\0\0x\0�	\0\0\0\0�&\0\0\0R\0\0\0�\0\0M\0\0�Control\0Kg\0\0m\�\0\0Relaci�n \'FK_Ceremonias_TipoCeremonias\' entre \'TipoCeremonias\' y \'Ceremonias\'s\'\0\0(\0�\0\0\0\0�\'\0\0\01\0\0\0k\0\0\0�\0\0Controls�i\0\0\��\0\0\0\0<\0�	\0\0\0\0�(\0\0\0�\0\0\0�\0\0\0\0�SchGrid\0��\0\0v\�\0\0TipoInstitucionales\0\0\04\0�	\0\0\0\0�)\0\0\0�\0\0\0�\0\0\0\0�SchGrid\0�����\0\0TipoMedallai\0\0l\0�	\0\0\0\0�*\0\0\0R\0\0\0�\0\0C\0\0�Control\0#���\�\0\0Relaci�n \'FK_Medallas_TipoMedalla\' entre \'TipoMedalla\' y \'Medallas\'t\0\0(\0�\0\0\0\0�+\0\0\01\0\0\0a\0\0\0�\0\0Control\0i���x\�\0\0\0\04\0�	\0\0\0\0�,\0\0\0�\0\0\0�\0\0\n\0\0�SchGrid\0ފ\0\0�\0\0TipoMonedara\0\04\0�	\0\0\0\0�-\0\0\0�\0\0\0�\0\0\0\0�SchGridsܛ\0\0@\0TipoPregunta\0\0<\0�	\0\0\0\0�.\0\0\0�\0\0\0�\0\0\0\0�SchGrid\0����b$\0TipoRepresentante\0\0\0\0\04\0�	\0\0\0\0�/\0\0\0�\0\0\0�\0\0	\0\0�SchGrid\0r\0\0�v\0\0TipoSedeslai\0\04\0�	\0\0\0\0�0\0\0\0�\0\0\0�\0\0\0\0�SchGridsH?\0\0L�\0\0TipoUsuarioo\0\00\0�	\0\0\0\0�1\0\0\0�\0\0\0�\0\0\0\0�SchGrids7\0\0�\�\0\0Usuarios\0\0,\0�	\0\0\0\0�2\0\0\0�\0\0\0�\0\0\0\0�SchGrids�+\0\0\\�\0\0Hora\0\0d\0�	\0\0\0\0�3\0\0\0R\0\0\0�\0\0;\0\0�Control\0s?\0\0\n�\0\0Relaci�n \'FK_FechaEvento_Hora\' entre \'Hora\' y \'FechaEvento\'\0\0\0(\0�\0\0\0\0�4\0\0\01\0\0\0Y\0\0\0�\0\0Control\0�A\0\0Y�\0\0\0\0,\0�	\0\0\0\0�5\0\0\0�\0\0\0�\0\0\0\0�SchGrid\0\�����\0Pais\0\00\0�	\0\0\0\0�6\0\0\0�\0\0\0�\0\0\0\0�SchGrid\0�	\0\0\�\0\0Sedesid\0\0\0d\0�	\0\0\0\0�7\0\0\0R\0\0\0�\0\09\0\0�Controlso\0\0G�\0\0Relaci�n \'FK_Sedes_TipoSedes\' entre \'TipoSedes\' y \'Sedes\'o\'\0\0\0(\0�\0\0\0\0�8\0\0\01\0\0\0W\0\0\0�\0\0Control\0A\0\0ȍ\0\0\0\0�\0�	\0\0\0\0�9\0\0\0R\0\0\0�\0\0[\0\0�Control\0M�\0\0�\0Relaci�n \'FK_PreguntasFrecuentes_TipoPregunta\' entre \'TipoPregunta\' y \'PreguntasFrecuentes\'\0\0\0(\0�\0\0\0\0�:\0\0\01\0\0\0y\0\0\0�\0\0Control\0��\0\0\�\0\0\0�\0�	\0\0\0\0�;\0\0\0R\0\0\0�\0\0Y\0\0�Controlsu\�\0\0�\�\0\0Relaci�n \'FK_Auspiciadores_TipoAuspiciadores\' entre \'TipoAuspiciadores\' y \'Auspiciadores\'s\'\0\0\0(\0�\0\0\0\0�<\0\0\01\0\0\0w\0\0\0�\0\0Control\0�\�\0\0A�\0\0\0\0�\0�	\0\0\0\0�=\0\0\0R\0\0\0�\0\0W\0\0�Control\0VF\0\0\'m\0\0Relaci�n \'FK_ComprobantePago_Compra_Entrada\' entre \'Compra_Entrada\' y \'ComprobantePago\'\0\0\0(\0�\0\0\0\0�>\0\0\01\0\0\0u\0\0\0�\0\0ControlsP\0\0�l\0\0\0\0l\0�	\0\0\0\0�?\0\0\0R\0\0\0�\0\0C\0\0�Controls�G\0\0�\0\0Relaci�n \'FK_Usuarios_TipoUsuario\' entre \'TipoUsuario\' y \'Usuarios\'\0\0\0(\0�\0\0\0\0�@\0\0\01\0\0\0a\0\0\0�\0\0Controls\�I\0\0\��\0\0\0\0d\0�	\0\0\0\0�A\0\0\0b\0\0\0�\0\0;\0\0�Controls\�U\0\0k\�\0\0Relaci�n \'FK_Usuarios_Galeria\' entre \'Galeria\' y \'Usuarios\'\0\0\0(\0�\0\0\0\0�B\0\0\01\0\0\0Y\0\0\0�\0\0Control\0�W\0\0N\�\0\0\0\0p\0�	\0\0\0\0�C\0\0\0R\0\0\0�\0\0G\0\0�Control\0C\0\0\�\0\0Relaci�n \'FK_DetalleEventos_Eventos\' entre \'Eventos\' y \'DetalleEventos\'V\0\0(\0�\0\0\0\0�D\0\0\01\0\0\0e\0\0\0�\0\0Control\03\0\0e\�\0\0\0\0�\0�	\0\0\0\0�E\0\0\0R\0\0\0�\0\0a\0\0�Controls\0\0a#\0Relaci�n \'FK_ComiteOrganizador_TipoRepresentante\' entre \'TipoRepresentante\' y \'ComiteOrganizador\'\0\0\0\0\0(\0�\0\0\0\0�F\0\0\01\0\0\0\0\0\0�\0\0ControlsC\0\0�%\0\0\0�\0�	\0\0\0\0�G\0\0\0R\0\0\0�\0\0[\0\0�Controls\�?\0\0Y\0Relaci�n \'FK_ComiteOrganizador_Representantes\' entre \'Representantes\' y \'ComiteOrganizador\'\0\0\0(\0�\0\0\0\0�H\0\0\01\0\0\0y\0\0\0�\0\0Control\0�@\0\0\�\0\0\0�\0�	\0\0\0\0�I\0\0\0R\0\0\0�\0\0Y\0\0�Control\0E�\0\0u\�\0\0Relaci�n \'FK_Institucional_TipoInstitucional\' entre \'TipoInstitucional\' y \'Institucional\'r\'\0\0\0(\0�\0\0\0\0�J\0\0\01\0\0\0w\0\0\0�\0\0Controlsm�\0\0\n\�\0\0\0\0�\0�	\0\0\0\0�K\0\0\0R\0\0\0�\0\0]\0\0�Control\03�\0\0\��\0\0Relaci�n \'FK_MenuPrincipal_PreguntasFrecuentes\' entre \'PreguntasFrecuentes\' y \'MenuPrincipal\'\0\0\0\0(\0�\0\0\0\0�L\0\0\01\0\0\0{\0\0\0�\0\0Control\0��\0\0U�\0\0\0\0p\0�	\0\0\0\0�M\0\0\0r\0\0\0�\0\0G\0\0�Controls$%\0\0}�\0\0Relaci�n \'FK_Eventos_HorarioEventos\' entre \'HorarioEventos\' y \'Eventos\'V\0\0(\0�\0\0\0\0�N\0\0\01\0\0\0e\0\0\0�\0\0Control\0\�7\0\0��\0\0\0\0p\0�	\0\0\0\0�O\0\0\0b\0\0\0�\0\0E\0\0�Control\0j\����\0Relaci�n \'FK_DeporteDestacado_Pais\' entre \'Pais\' y \'DeporteDestacado\'\0\0\0\0\0(\0�\0\0\0\0�P\0\0\01\0\0\0c\0\0\0�\0\0Control\0\�\���x	\0\0\0p\0�	\0\0\0\0�Q\0\0\0b\0\0\0�\0\0E\0\0�Control\04�\0\0}\�\0\0Relaci�n \'FK_MenuPrincipal_Galeria\' entre \'Galeria\' y \'MenuPrincipal\'s\'V\0\0(\0�\0\0\0\0�R\0\0\01\0\0\0c\0\0\0�\0\0Control\0ڍ\0\0�\�\0\0\0\0l\0�	\0\0\0\0�S\0\0\0R\0\0\0�\0\0C\0\0�Controls�$\0\0\�\�\0\0Relaci�n \'FK_Deportistas_Usuarios\' entre \'Usuarios\' y \'Deportistas\'t\0\0(\0�\0\0\0\0�T\0\0\01\0\0\0a\0\0\0�\0\0Control\0i(\0\0x\�\0\0\0\0d\0�	\0\0\0\0�U\0\0\0R\0\0\0�\0\0;\0\0�Control\0�\0\0k�\0\0Relaci�n \'FK_Deportistas_Pais\' entre \'Pais\' y \'Deportistas\'\0\0\0(\0�\0\0\0\0�V\0\0\01\0\0\0Y\0\0\0�\0\0ControlsC\0\0y\0\0\0l\0�	\0\0\0\0�W\0\0\0b\0\0\0�\0\0C\0\0�Control\0������\0\0Relaci�n \'FK_Deportistas_Deportes\' entre \'Deportes\' y \'Deportistas\'o\0\0(\0�\0\0\0\0�X\0\0\01\0\0\0a\0\0\0�\0\0Control\0\����@�\0\0\0\0t\0�	\0\0\0\0�Y\0\0\0b\0\0\0�\0\0I\0\0�Control\05���P�\0\0Relaci�n \'FK_Deportes_DetalleDeporte\' entre \'DetalleDeporte\' y \'Deportes\'tos\0\0(\0�\0\0\0\0�Z\0\0\01\0\0\0g\0\0\0�\0\0Controls����c�\0\0\0\0|\0�	\0\0\0\0�\\\0\0\0R\0\0\0�\0\0Q\0\0�Control\0u�\0\0\�\0\0Relaci�n \'FK_MenuPrincipal_Auspiciadores\' entre \'Auspiciadores\' y \'MenuPrincipal\'ePa\0\0(\0�\0\0\0\0�]\0\0\01\0\0\0o\0\0\0�\0\0Controls~�\0\0�\�\0\0\0\0|\0�	\0\0\0\0�^\0\0\0R\0\0\0�\0\0Q\0\0�Controls��\0\0\�\�\0\0Relaci�n \'FK_MenuPrincipal_Institucional\' entre \'Institucional\' y \'MenuPrincipal\'ePa\0\0(\0�\0\0\0\0�_\0\0\01\0\0\0o\0\0\0�\0\0Controls��\0\0S\�\0\0\0\0t\0�	\0\0\0\0�`\0\0\0R\0\0\0�\0\0I\0\0�Control\0��\0\0�i\0\0Relaci�n \'FK_Compra_Entrada_Asientos\' entre \'Asientos\' y \'Compra_Entrada\'\0\0\0\0\0(\0�\0\0\0\0�a\0\0\01\0\0\0g\0\0\0�\0\0Controls�\0\08i\0\0\0\0�\0�	\0\0\0\0�b\0\0\0b\0\0\0�\0\0Y\0\0�Controlsc1\0\0\��\0\0Relaci�n \'FK_MenuPrincipal_ComiteOrganizador\' entre \'ComiteOrganizador\' y \'MenuPrincipal\'\0\0\0\0\0(\0�\0\0\0\0�c\0\0\01\0\0\0w\0\0\0�\0\0Control\0��\0\0�\0\0\0l\0�	\0\0\0\0�d\0\0\0b\0\0\0�\0\0A\0\0�Control\0����]�\0\0Relaci�n \'FK_Deportes_Reglamento\' entre \'Reglamento\' y \'Deportes\'\0\0\0\0\0(\0�\0\0\0\0�e\0\0\01\0\0\0_\0\0\0�\0\0Control\0E����\0\0\0\0t\0�	\0\0\0\0�f\0\0\0R\0\0\0�\0\0I\0\0�Control\0ݨ��\�l\0\0Relaci�n \'FK_ReporteEntrada_Deportes\' entre \'Deportes\' y \'ReporteEntrada\'\0\0\0\0\0(\0�\0\0\0\0�g\0\0\01\0\0\0g\0\0\0�\0\0Control\0#����\0\0\0\0t\0�	\0\0\0\0�h\0\0\0R\0\0\0�\0\0K\0\0�Controls��\0\0\�\0\0Relaci�n \'FK_MenuPrincipal_Ceremonias\' entre \'Ceremonias\' y \'MenuPrincipal\'\0\0\0(\0�\0\0\0\0�i\0\0\01\0\0\0i\0\0\0�\0\0Control\0��\0\0_\�\0\0\0\0l\0�	\0\0\0\0�j\0\0\0j\0\0\0�\0\0C\0\0�Control\0S#\0\0\�w\0\0Relaci�n \'FK_Compra_Entrada_Sedes\' entre \'Sedes\' y \'Compra_Entrada\'l\0\0(\0�\0\0\0\0�k\0\0\01\0\0\0a\0\0\0�\0\0Control\0\�)\0\0\�\0\0\0\0`\0�	\0\0\0\0�l\0\0\0R\0\0\0�\0\05\0\0�Control\0�\n\0\0��\0\0Relaci�n \'FK_Eventos_Sedes\' entre \'Sedes\' y \'Eventos\'\0\0\0\0\0(\0�\0\0\0\0�m\0\0\01\0\0\0S\0\0\0�\0\0Controls�\0\0��\0\0\0\0d\0�	\0\0\0\0�t\0\0\0R\0\0\0�\0\0;\0\0�Controls\����5\�\0\0Relaci�n \'FK_Ranking_Medallas\' entre \'Medallas\' y \'Ranking\'\0\0\0(\0�\0\0\0\0�u\0\0\01\0\0\0Y\0\0\0�\0\0Control\0~\���\�\�\0\0\0\0t\0�	\0\0\0\0�v\0\0\0R\0\0\0�\0\0K\0\0�Control\0�\���O\�\0\0Relaci�n \'FK_DeporteDestacado_Ranking\' entre \'Ranking\' y \'DeporteDestacado\'\0\0\0(\0�\0\0\0\0�w\0\0\01\0\0\0i\0\0\0�\0\0Control\0\�\����\�\0\0\0\0h\0�	\0\0\0\0�x\0\0\0b\0\0\0�\0\0?\0\0�Control\0������\0\0Relaci�n \'FK_TipoSedes_Deportes\' entre \'Deportes\' y \'TipoSedes\'\0\0\0(\0�\0\0\0\0�y\0\0\01\0\0\0]\0\0\0�\0\0Controls\�����\0\0\0\0h\0�	\0\0\0\0�z\0\0\0�\0\0\0�\0\0=\0\0�Control\0��\0\0^�\0\0Relaci�n \'FK_Moneda_TipoMoneda\' entre \'TipoMoneda\' y \'Moneda\'s\'\0\0\0(\0�\0\0\0\0�{\0\0\01\0\0\0[\0\0\0�\0\0Control\0��\0\0x�\0\0\0\0t\0�	\0\0\0\0�|\0\0\0b\0\0\0�\0\0I\0\0�Control\0qP\0\0��\0\0Relaci�n \'FK_Compra_Entrada_Usuarios\' entre \'Usuarios\' y \'Compra_Entrada\'\0\0\0\0\0(\0�\0\0\0\0�}\0\0\01\0\0\0g\0\0\0�\0\0Control\0�_\0\05�\0\0\0\0�\0�	\0\0\0\0�~\0\0\0b\0\0\0�\0\0U\0\0�Control\0wh\0\0��\0\0Relaci�n \'FK_Compra_Entrada_HorarioEventos\' entre \'HorarioEventos\' y \'Compra_Entrada\'\0\0\0\0\0(\0�\0\0\0\0�\0\0\01\0\0\0s\0\0\0�\0\0Controls	o\0\0?�\0\0\0\0p\0�	\0\0\0\0��\0\0\0R\0\0\0�\0\0E\0\0�Controls��\0\0��\0\0Relaci�n \'FK_Compra_Entrada_Moneda\' entre \'Moneda\' y \'Compra_Entrada\'\0#V\0\0(\0�\0\0\0\0��\0\0\01\0\0\0c\0\0\0�\0\0Control\0Ӑ\0\0~�\0\0\0\0�\0�	\0\0\0\0��\0\0\0R\0\0\0�\0\0U\0\0�Controlsw���1c\0\0Relaci�n \'FK_Compra_Entrada_ReporteEntrada\' entre \'ReporteEntrada\' y \'Compra_Entrada\'o\'\0\0\0(\0�\0\0\0\0��\0\0\01\0\0\0s\0\0\0�\0\0Control\0 \0\0\�b\0\0\0\0d\0�	\0\0\0\0��\0\0\0Z\0\0\0�\0\0;\0\0�Control\0����/�\0\0Relaci�n \'FK_Ranking_Deportes\' entre \'Deportes\' y \'Ranking\'a\0\0(\0�\0\0\0\0��\0\0\01\0\0\0Y\0\0\0�\0\0Controls�\���u�\0\0\0\0l\0�	\0\0\0\0��\0\0\0b\0\0\0�\0\0A\0\0�Control\0���\�\�\0\0Relaci�n \'FK_Ranking_Deportistas\' entre \'Deportistas\' y \'Ranking\'s\'o\0\0(\0�\0\0\0\0��\0\0\01\0\0\0_\0\0\0�\0\0Control\0����\�\0\0\0\0x\0�	\0\0\0\0��\0\0\0R\0\0\0�\0\0O\0\0�Controls�\0\0�\�\0\0Relaci�n \'FK_DetalleEventos_Deportistas\' entre \'Deportistas\' y \'DetalleEventos\'\0\0\0(\0�\0\0\0\0��\0\0\01\0\0\0m\0\0\0�\0\0Control\09\0\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0!C4\0\0\0�\0\0\�\0\0xV4\0\0\0\0\0A\0s\0i\0e\0n\0t\0o\0s\0\0\0P\0r\0o\0g\0r\0a\0m\0 \0F\0i\0l\0e\0s\0 \0(\0x\08\06\0)\0/\0M\0i\0c\0r\0o\0s\0o\0f\0t\0 \0S\0Q\0L\0 \0S\0e\0r\0v\0e\0r\0/\01\02\00\0/\0T\0o\0o\0l\0s\0/\0B\0i\0n\0n\0/\0M\0a\0n\0a\0g\0e\0m\0e\0n\0t\0S\0t\0u\0d\0i\0o\0/\0I\0D\0E\0/\0P\0r\0i\0v\0a\0t\0e\0A\0s\0s\0e\0m\0b\0l\0i\0e\0s\0/\0e\0s\0/\0M\0i\0c\0r\0o\0s\0o\0f\0t\0.\0S\0q\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0\�\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0l	\0\08\0\0�\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0+?\0\0�\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0�\0\0�\r\0\0X\0\0xV4\0\0\0Z\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0	\0\0\0A\0s\0i\0e\0n\0t\0o\0s\0\0\0!C4\0\0\0I\0\0\0\0xV4\0\0\0\0\0A\0u\0s\0p\0i\0c\0i\0a\0d\0o\0r\0e\0s\0\0\0P\�7\\\�7\\\�7h\�7h\�7t\�7t\�7�\�7�\�7\�\�7\�\�7\�\�7\�\�7\�\�7\�\�7�\�7�\�7\�7\�7\\\�7\\\�7h\�7h\�7t\�7t\�7�\�7�\�7�\�7�\�7�\�7�\�7\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\09y�\0\0�M\0i\0c\0r\0o\0s\0o\0f\0t\0.\0S\0q\0l\0S\0e\0r\0v\0e\0r\0.\0E\0x\0p\0r\0e\0s\0s\0.\0O\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0�\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0l	\0\08\0\0�\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0I\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0+?\0\0�\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0�\0\0�\r\0\0X\0\0xV4\0\0\0d\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0A\0u\0s\0p\0i\0c\0i\0a\0d\0o\0r\0e\0s\0\0\0!C4\0\0\0~\0\0�\0\0xV4\0\0\0\0\0C\0a\0t\0e\0g\0o\0r\0i\0a\0A\0s\0i\0e\0n\0t\0o\0\0\01\03\01\00\00\00\04\00\00\00\00\00\01\00\00\00\01\00\00\02\07\02\07\03\06\0a\0d\06\0e\05\0f\09\05\08\06\0b\0a\0c\02\0d\05\03\01\0e\0a\0b\0c\03\0a\0c\0c\06\06\06\0c\02\0f\08\0e\0c\08\07\09\0f\0a\09\04\0f\08\0f\07\0b\00\03\02\07\0d\02\0f\0f\02\0e\0d\05\02\03\04\04\08\0iy�3\0��	t\0\0\0\0\�#s\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0�\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0l	\0\08\0\0�\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0~\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0+?\0\0�\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0�\0\0�\r\0\0X\0\0xV4\0\0\0j\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0C\0a\0t\0e\0g\0o\0r\0i\0a\0A\0s\0i\0e\0n\0t\0o\0\0\0\0\0�\0\0ފ\0\0�\0\0N�\0\0ڬ\0\0N�\0\0ڬ\0\0��\0\0\0\0\0\0\0\0\0���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0L�\0\0�\0\0S\0\02\0\0\0\0\0\0\0�\0\0S\0\0\0\0\0\0\0\0\0�\0\0�\0\0\0\0\0\0\0��0\0Tahoma\0F\0K\0_\0A\0s\0i\0e\0n\0t\0o\0s\0_\0C\0a\0t\0e\0g\0o\0r\0i\0a\0A\0s\0i\0e\0n\0t\0o\0!C4\0\0\0�\0\0\�\0\0xV4\0\0\0\0\0C\0e\0r\0e\0m\0o\0n\0i\0a\0s\0\0\0o\0n\0s\0_\0S\0c\0r\0i\0p\0t\0X\0m\0l\0I\0n\0d\0e\0x\0e\0s\0_\01\03\01\02\05\02\0,\0 \0P\0u\0b\0l\0i\0c\0K\0e\0y\0=\00\00\02\04\00\00\00\00\00\04\08\00\00\00\00\00\09\04\00\00\00\00\00\00\00\06\00\02\00\00\00\00\00\00\02\04\00\00\00\00\05\02\05\03\04\01\03\01\00\00\00\04\00\00\00\00\00\01\00\00\00\01\00\00\02\07\02\07\03\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0�\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0l	\0\08\0\0�\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\0\0:\0\00\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0+?\0\0�\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0�\0\0�\r\0\0X\0\0xV4\0\0\0^\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0C\0e\0r\0e\0m\0o\0n\0i\0a\0s\0\0\0!C4\0\0\0�\0\0Q\0\0xV4\0\0\0\0\0C\0o\0m\0i\0t\0e\0O\0r\0g\0a\0n\0i\0z\0a\0d\0o\0r\0\0\0H�\�rT�\�rT�\�r`�\�r`�\�rl�\�rl�\�rx�\�rx�\�r��\�r��\�r��\�r��\�r��\�r��\�r��\�r��\�r��\�r��\�r��\�r��\�rм\�rм\�r\�\�r\�\�r\�\�r\�\�r\0�\�r\0�\�r�\�r�\�r �\�r �\�r,�\�r,�\�r8�\�r8�\�rL�\�rL�\�rX�\�rX�\�rd�\�rd�\�rp�\�rp�\�r|�\�r|�\�r��\�r��\�r��\�r��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0\Z\0\0\0\0\0\0-\0\0	\0\0\0\0\0\0\0\0\0\0\0�\0\0l	\0\08\0\0�\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0Q\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0+?\0\0�\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0�\0\0�\r\0\0X\0\0xV4\0\0\0l\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0C\0o\0m\0i\0t\0e\0O\0r\0g\0a\0n\0i\0z\0a\0d\0o\0r\0\0\0!C4\0\0\0�\0\0-\"\0\0xV4\0\0\0\0\0C\0o\0m\0p\0r\0a\0_\0E\0n\0t\0r\0a\0d\0a\0\0\0�`5	\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0F�|r\�r��\�r�~�r\�r\�\�sD\0\0\0\0\0\0D\0\0�\0\0\�\0\0\0\0\0\0\�\0\0�\0\0p\0\0\0\0\0\0p\0\0�\0\0\0\0\0\0�\0\0\0:\0\0�\0\0\0\0\0\0\0,\0\0:\0\0,\0\0\0\0\0\0\�\0\0:\0\0\�\0\0\0\0\0\0X\0\0:\0\0X\0\0\0\0\0\0\�\0\0:\0\0\�\0\0\0\0\0\0�\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0G\0\0\0\0\0\0-\0\0\n\0\0\0\0\0\0\0\0\0\0\0�\0\0l	\0\08\0\0�\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0-\"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0+?\0\0�\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0�\0\0�\r\0\0X\0\0xV4\0\0\0f\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0C\0o\0m\0p\0r\0a\0_\0E\0n\0t\0r\0a\0d\0a\0\0\0!C4\0\0\0�\0\0U\0\0xV4\0\0\0\0\0C\0o\0m\0p\0r\0o\0b\0a\0n\0t\0e\0P\0a\0g\0o\0\0\03\0d\05\0c\05\0d\0d\02\0d\0f\0c\07\0b\0c\09\09\0c\05\02\08\06\0b\02\0c\01\02\05\01\01\07\0b\0f\05\0c\0b\0e\02\04\02\0b\09\0d\04\01\07\05\00\07\03\02\0b\02\0b\0d\0f\0f\0e\06\04\09\0c\06\0e\0f\0b\08\0e\05\05\02\06\0d\05\02\06\0f\0d\0d\01\03\00\00\09\05\0e\0c\0d\0b\07\0b\0f\02\01\00\08\00\09\0c\06\0c\0d\0a\0d\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0�\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0l	\0\08\0\0�\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0U\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0+?\0\0�\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0�\0\0�\r\0\0X\0\0xV4\0\0\0h\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0C\0o\0m\0p\0r\0o\0b\0a\0n\0t\0e\0P\0a\0g\0o\0\0\0!C4\0\0\0�\0\0\�\0\0xV4\0\0\0\0\0D\0e\0p\0o\0r\0t\0e\0D\0e\0s\0t\0a\0c\0a\0d\0o\0\0\0d\03\0b\02\08\0f\01\0f\06\0e\04\0c\08\0\0\0c\08\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�zR\r\0\0��	t\0\0\0\0�\�7\0\0\0\0\0\0\0t��rt��r|��r|��r���r���r���r���r�\�7�\�7�\�7�\�7�\�7�\�7�\�7�\�7\�\�7\�\�7\�\�7\�\�7\�\�7\�\�7�\�7�\�7\�7\�7\�7\�7$\�7$\�74\�74\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0�\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0l	\0\08\0\0�\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0+?\0\0�\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0�\0\0�\r\0\0X\0\0xV4\0\0\0j\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0D\0e\0p\0o\0r\0t\0e\0D\0e\0s\0t\0a\0c\0a\0d\0o\0\0\0!C4\0\0\0�\0\08\0\0xV4\0\0\0\0\0D\0e\0p\0o\0r\0t\0e\0s\0\0\0d\05\02\03\04\04\08\0f\08\03\0c\03\0d\05\0c\05\0d\0d\02\0d\0f\0c\07\0b\0c\09\09\0c\05\02\08\06\0b\02\0c\01\02\05\01\01\07\0b\0f\05\0c\0b\0e\02\04\02\0b\09\0d\04\01\07\05\00\07\03\02\0b\02\0b\0d\0f\0f\0e\06\04\09\0c\06\0e\0f\0b\08\0e\05\05\02\06\0d\05\02\06\0f\0d\0d\01\03\00\00\09\05\0e\0c\0d\0b\07\0b\0f\02\01\00\08\00\09\0c\06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0�\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0l	\0\08\0\0�\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\08\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0+?\0\0�\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0�\0\0�\r\0\0X\0\0xV4\0\0\0Z\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0	\0\0\0D\0e\0p\0o\0r\0t\0e\0s\0\0\0!C4\0\0\0�\0\0\�\0\0xV4\0\0\0\0\0D\0e\0p\0o\0r\0t\0i\0s\0t\0a\0s\0\0\0L\�7L\�7X\�7X\�7d\�7d\�7p\�7p\�7|\�7�z��\0��\�7�\�7�\�7�\�7�\�7�\�7�\�7�\�7�\�7\�\�7\�\�7\�\�7\�\�7\�\�7\�\�7\�\�7\�\�7�\�7�\�7\0\�7\0\�7\�7\�7\�7\�7$\�7$\�70\�70\�7<\�7<\�7H\�7H\�7T\�7T\�7`\�7`\�7l\�7l\�7x\�7x\�7�\�7�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0�\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0l	\0\08\0\0�\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0+?\0\0�\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0�\0\0�\r\0\0X\0\0xV4\0\0\0`\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0D\0e\0p\0o\0r\0t\0i\0s\0t\0a\0s\0\0\0!C4\0\0\0~\0\0\�\0\0xV4\0\0\0\0\0D\0e\0t\0a\0l\0l\0e\0D\0e\0p\0o\0r\0t\0e\0\0\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�~�r\�r\�\�s�~�r\�r\�\�sD\0\0\0\0\0\0D\0\0�\0\0\�\0\0\0\0\0\0\�\0\0�\0\0p\0\0\0\0\0\0p\0\0�\0\0\0\0\0\0�\0\0\0:\0\0�\0\0\0\0\0\0\0,\0\0:\0\0,\0\0\0\0\0\0\�\0\0:\0\0\�\0\0\0\0\0\0X\0\0:\0\0X\0\0\0\0\0\0\�\0\0:\0\0\�\0\0\0\0\0\0�\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0�\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0l	\0\08\0\0�\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0~\0\0\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0+?\0\0�\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0�\0\0�\r\0\0X\0\0xV4\0\0\0f\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0D\0e\0t\0a\0l\0l\0e\0D\0e\0p\0o\0r\0t\0e\0\0\0!C4\0\0\0}\0\0(\0\0xV4\0\0\0\0\0D\0e\0t\0a\0l\0l\0e\0E\0v\0e\0n\0t\0o\0s\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0�\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0l	\0\08\0\0�\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0}\0\0(\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0+?\0\0�\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0�\0\0�\r\0\0X\0\0xV4\0\0\0f\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0D\0e\0t\0a\0l\0l\0e\0E\0v\0e\0n\0t\0o\0s\0\0\0!C4\0\0\0�\0\0\�	\0\0xV4\0\0\0\0\0E\0s\0t\0a\0d\0o\0A\0s\0i\0e\0n\0t\0o\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�7�\�7�\�7�\�7�\�7�\�7�\�7�\�7\�\�7\�\�7\�\�7\�\�7\�\�7\�\�7�\�7�\�7\�7\�7\�7\�7$\�7$\�74\�74\�7D\�7D\�7T\�7T\�7d\�7d\�7t\�7t\�7�\�7�\�7�\�7�\�7�\�7�\�7�\�7�\�7\�\�7\�\�7 \�7 \�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0�\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0l	\0\08\0\0�\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\�	\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�	\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0+?\0\0�\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0�\0\0�\r\0\0X\0\0xV4\0\0\0d\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0E\0s\0t\0a\0d\0o\0A\0s\0i\0e\0n\0t\0o\0\0\0\0\0��\0\0:k\0\0~�\0\0:k\0\0\0\0\0\0\0\0\0���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\05�\0\08i\0\0\0\0S\0\05\0\0\0\0\0\0\0\0\0S\0\0\0\0\0\0\0\0\0�\0\0�\0\0\0\0\0\0\0��0\0Tahoma\0F\0K\0_\0A\0s\0i\0e\0n\0t\0o\0s\0_\0E\0s\0t\0a\0d\0o\0A\0s\0i\0e\0n\0t\0o\0!C4\0\0\0�\0\0\�\0\0xV4\0\0\0\0\0E\0v\0e\0n\0t\0o\0s\0\0\0�\�7�\�7\�\�7\�\�7\�\�7\�\�7\�\�7\�\�7\�\�7\�\�7�\�7�\�7\0\�7\0\�7\�7\�7\�7\�7$\�7$\�70\�70\�7<\�7<\�7H\�7H\�7T\�7T\�7`\�7`\�7l\�7l\�7x\�7x\�7�\�7�\�7�\�7�\�7�\�7?x��\0��\�7�\�7�\�7�\�7�\�7\�\�7\�\�7\�\�7\�\�7\�\�7\�\�7�\�7�\�7�\�7�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0�\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0l	\0\08\0\0�\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\r\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0+?\0\0�\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0�\0\0�\r\0\0X\0\0xV4\0\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0E\0v\0e\0n\0t\0o\0s\0\0\0!C4\0\0\0�\0\0C\0\0xV4\0\0\0\0\0F\0e\0c\0h\0a\0E\0v\0e\0n\0t\0o\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0�\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0l	\0\08\0\0�\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0C\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\0\0:\0\00\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0+?\0\0�\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0�\0\0�\r\0\0X\0\0xV4\0\0\0`\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0F\0e\0c\0h\0a\0E\0v\0e\0n\0t\0o\0\0\0!C4\0\0\0�\0\0\0\0xV4\0\0\0\0\0G\0a\0l\0e\0r\0i\0a\0\0\0��\�r��\�r��\�r��\�r��\�r��\�r��\�r��\�rм\�rм\�r\�\�r\�\�r\�\�r\�\�r\0�\�r\0�\�r�\�r�\�r �\�r �\�r,�\�r,�\�r8�\�r8�\�rL�\�rL�\�rX�\�rX�\�rd�\�rd�\�rp�\�rp�\�r|�\�r|�\�r��\�r��\�r��\�r��\�r��\�r��\�r��\�r��\�r��\�r��\�rĽ\�rĽ\�rн\�rн\�rܽ\�rܽ\�r\�\�r\�\�r��\�r��\�r\0�\�r\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0�\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0l	\0\08\0\0�\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0+?\0\0�\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0�\0\0�\r\0\0X\0\0xV4\0\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0G\0a\0l\0e\0r\0i\0a\0\0\0!C4\0\0\0�\0\0w\0\0xV4\0\0\0\0\0H\0o\0r\0a\0r\0i\0o\0E\0v\0e\0n\0t\0o\0s\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0,z�\r\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0�\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0l	\0\08\0\0�\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0w\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\0\0:\0\00\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0+?\0\0�\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0�\0\0�\r\0\0X\0\0xV4\0\0\0f\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0H\0o\0r\0a\0r\0i\0o\0E\0v\0e\0n\0t\0o\0s\0\0\0\0\0�N\0\0�\0\0�c\0\0�\0\0�c\0\0]�\0\0\0\0\0\0\0\0\0���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�P\0\0�\0\0\�\0\0S\0\02\0\0\0\0\0\0\0\�\0\0S\0\0\0\0\0\0\0\0\0�\0\0�\0\0\0\0\0\0\0��0\0Tahoma\0F\0K\0_\0H\0o\0r\0a\0r\0i\0o\0E\0v\0e\0n\0t\0o\0s\0_\0F\0e\0c\0h\0a\0E\0v\0e\0n\0t\0o\0!C4\0\0\0�\0\0,\0\0xV4\0\0\0\0\0I\0n\0s\0t\0i\0t\0u\0c\0i\0o\0n\0a\0l\0\0\0Ծ\�r\�\�r\�\�r\�\�r\�\�r\0�\�r\0�\�r�\�r�\�r�\�r�\�r$�\�r$�\�r8�\�r8�\�rD�\�rD�\�rP�\�rP�\�r\\�\�r\\�\�rh�\�rh�\�rt�\�rt�\�r��\�r��\�r��\�r��\�r��\�r��\�r��\�r��\�r��\�r��\�rȿ\�rȿ\�rԿ\�rԿ\�r\�\�r\�\�r\�\�r\�\�r��\�r��\�r�\�r�\�r�\�r�\�r�\�r�\�r(�\�r(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0�\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0l	\0\08\0\0�\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0,\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0+?\0\0�\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0�\0\0�\r\0\0X\0\0xV4\0\0\0d\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0I\0n\0s\0t\0i\0t\0u\0c\0i\0o\0n\0a\0l\0\0\0!C4\0\0\0�\0\0�\0\0xV4\0\0\0\0\0M\0e\0d\0a\0l\0l\0a\0s\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0�\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0l	\0\08\0\0�\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\0\0:\0\00\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0+?\0\0�\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0�\0\0�\r\0\0X\0\0xV4\0\0\0Z\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0	\0\0\0M\0e\0d\0a\0l\0l\0a\0s\0\0\0!C4\0\0\0�\0\0$\0\0xV4\0\0\0\0\0M\0e\0n\0u\0P\0r\0i\0n\0c\0i\0p\0a\0l\0\0\0l\0S\0e\0r\0v\0e\0r\0.\0E\0x\0p\0r\0e\0s\0s\0.\0S\0q\0l\0M\0a\0n\0a\0g\0e\0r\0U\0I\0,\0 \0P\0u\0b\0l\0i\0c\0K\0e\0y\0=\00\00\02\04\00\00\00\00\00\04\08\00\00\00\00\00\09\04\00\00\00\00\00\00\00\06\00\02\00\00\00\00\00\00\02\04\00\00\00\00\05\02\05\03\04\01\03\01\00\00\00\04\00\00\00\00\00\01\00\00\00\01\00\00\02\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0\Z\0\0\0\0\0\0-\0\0	\0\0\0\0\0\0\0\0\0\0\0�\0\0l	\0\08\0\0�\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0$\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0+?\0\0�\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0�\0\0�\r\0\0X\0\0xV4\0\0\0d\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0M\0e\0n\0u\0P\0r\0i\0n\0c\0i\0p\0a\0l\0\0\0!C4\0\0\0t\0\0;\r\0\0xV4\0\0\0\0\0M\0o\0n\0e\0d\0a\0\0\0�\�ә\�ә ԙ,ԙ8ԙ�ԙ�ԙ�ԙ\�ՙ\�ՙ�֙�֙\�֙י0י�י�י0ؙ<ؙ|ؙ�ؙ�ؙٙٙPٙ ڙ,ڙ�ڙ�ڙ�ڙۙ ۙ�ۙ�ۙ\�ۙ�ܙ�ܙXF��F��F��ݙ�ޙ�\��\�F�O�$O��F��F�(\�lG�xG��G�\�P\�\��\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0�\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0l	\0\08\0\0�\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0t\0\0;\r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0+?\0\0�\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0�\0\0�\r\0\0X\0\0xV4\0\0\0V\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0M\0o\0n\0e\0d\0a\0\0\0!C4\0\0\0~\0\0B\0\0xV4\0\0\0\0\0P\0r\0e\0g\0u\0n\0t\0a\0s\0F\0r\0e\0c\0u\0e\0n\0t\0e\0s\0\0\0`<\Z0=\Z<=\Z����d�\�F\Z\�F\ZG\Z\�G\Z�G\ZإЧ��<�H���d�� �t�0�\�\�p�|�ȭp�(�����\�����\���D�P�l�ܳ\�L�X�����̴<�H�h�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0�\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0l	\0\08\0\0�\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0~\0\0B\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0+?\0\0�\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0�\0\0�\r\0\0X\0\0xV4\0\0\0p\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0P\0r\0e\0g\0u\0n\0t\0a\0s\0F\0r\0e\0c\0u\0e\0n\0t\0e\0s\0\0\0!C4\0\0\0I\0\0�\0\0xV4\0\0\0\0\0R\0a\0n\0k\0i\0n\0g\0\0\0,@\Zx\�p\�,\�\�\�\�\�H\�\��\��\�\�\�\��\��\�\�\�h\�\�\�\�8\�D\��\�T\�`\��\��\�\�\��\�\�|\��\�\�\��\�8\�D\�l\�\�\�\�\�\��\��\�\�\�\�\�\�\�$\�`\�|\�\�\��\���P�����`�l�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0�\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0l	\0\08\0\0�\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0I\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0+?\0\0�\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0�\0\0�\r\0\0X\0\0xV4\0\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0R\0a\0n\0k\0i\0n\0g\0\0\0!C4\0\0\0�\0\0�\0\0xV4\0\0\0\0\0R\0e\0g\0l\0a\0m\0e\0n\0t\0o\0\0\0�@J��J�$�0�����\�����t���������X�d�����\��\\�h�\����8�D�P���\���\��\��X�d�����\��<\Z�H\Z��\Z�X�d��J�\�J�8K�����`�DK�\�K�\�K�L� L�\��,L\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0�\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0l	\0\08\0\0�\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0+?\0\0�\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0�\0\0�\r\0\0X\0\0xV4\0\0\0^\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0R\0e\0g\0l\0a\0m\0e\0n\0t\0o\0\0\0!C4\0\0\0�\0\0�\r\0\0xV4\0\0\0\0\0R\0e\0p\0o\0r\0t\0e\0E\0n\0t\0r\0a\0d\0a\0\0\0�L8�9�|9��9�\��\0�DD�<>�PD�\�D�\�D�E�E�HE�dE�0��E��E�4F�|F��F�G�(G�PM�H�\\M�\�M�\�M��M���0N�HN��N���\�N�4O�@O�\\O���O��O�\�P�TQ�<�X�lQ�\�Q�\�Q�R�\��\��\0	\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0�\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0l	\0\08\0\0�\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0�\r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0+?\0\0�\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0�\0\0�\r\0\0X\0\0xV4\0\0\0f\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0R\0e\0p\0o\0r\0t\0e\0E\0n\0t\0r\0a\0d\0a\0\0\0!C4\0\0\0�\0\0(\0\0xV4\0\0\0\0\0R\0e\0p\0r\0e\0s\0e\0n\0t\0a\0n\0t\0e\0s\0\0\0�ؗ�䗙0��L��x��蘙���x�����ę�Й�ܙ�L��X�����h��t��蛙���@��L��h��؜�䜙$�����\0��HB��B�\�B�8��<�����\�L��M�\�M�C��C�p���C�\�C��D�L�����T������p��,��ܨ�訙<�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0�\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0l	\0\08\0\0�\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0(\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0+?\0\0�\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0�\0\0�\r\0\0X\0\0xV4\0\0\0f\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0R\0e\0p\0r\0e\0s\0e\0n\0t\0a\0n\0t\0e\0s\0\0\0!C4\0\0\0�\0\0\0\0xV4\0\0\0\0\0S\0t\0o\0c\0k\0A\0s\0i\0e\0n\0t\0o\0s\0\0\0�V�<W�$Y�dY� Z�`Z�lZ��Z��[�\�[��[�d\\�p\\����,��>�\\��_�tf����f��f��f�g�\\�Tg��g��j�?��j�k�k�,k�x�hk��k�n�(n�Dn�\����xn��n�\�n�\�o��r�s�\\z��hz�\�z��z\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0�\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0l	\0\08\0\0�\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0+?\0\0�\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0�\0\0�\r\0\0X\0\0xV4\0\0\0d\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0S\0t\0o\0c\0k\0A\0s\0i\0e\0n\0t\0o\0s\0\0\0\0\08\�\0\0x\0\0~�\0\0x\0\0\0\0\0\0\0\0\0���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0#\0\0\0\0\0\0\0Ӷ\0\0\�x\0\0�\r\0\0S\0\03\0\0\0\0\0\0\0�\r\0\0S\0\0\0\0\0\0\0\0\0�\0\0�\0\0\0\0\0\0\0��0\0Tahoma\0F\0K\0_\0A\0s\0i\0e\0n\0t\0o\0s\0_\0S\0t\0o\0c\0k\0A\0s\0i\0e\0n\0t\0o\0s\0!C4\0\0\0~\0\09\0\0xV4\0\0\0\0\0T\0i\0p\0o\0A\0u\0s\0p\0i\0c\0i\0a\0d\0o\0r\0e\0s\0\0\0����\���\�����X��t��\�����������H�����\���X��d��������\�������\0��\0�\�\0�$�@����� �,�l�x������L��������������$�����\���	��	��\n��\n�\�\n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0�\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0l	\0\08\0\0�\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0~\0\09\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0+?\0\0�\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0�\0\0�\r\0\0X\0\0xV4\0\0\0l\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0T\0i\0p\0o\0A\0u\0s\0p\0i\0c\0i\0a\0d\0o\0r\0e\0s\0\0\0!C4\0\0\0\�\0\0�\0\0xV4\0\0\0\0\0T\0i\0p\0o\0C\0e\0r\0e\0m\0o\0n\0i\0a\0s\0\0\0�\\.�h.�P:�l:�\�:��D��:�x;��;��;��D�\�;�(<��=��=�$>��D�0>��>��>�\�>�8E�(?��?�@�\�@�T��`��A�A�l���������0��L��TE�\�E�������ĉ�܉�B�\�B��C�\�C�\�C�\�E��D�\�F�l��x�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0�\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0l	\0\08\0\0�\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \r\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0+?\0\0�\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0�\0\0�\r\0\0X\0\0xV4\0\0\0f\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0T\0i\0p\0o\0C\0e\0r\0e\0m\0o\0n\0i\0a\0s\0\0\0\0\0\�h\0\0�\0\0\�h\0\0(�\0\0\0\0\0\0\0\0\0���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\'\0\0\0\0\0\0\0�i\0\0\��\0\0	\0\0S\0\04\0\0\0\0\0\0\0	\0\0S\0\0\0\0\0\0\0\0\0�\0\0�\0\0\0\0\0\0\0��0\0Tahoma\0F\0K\0_\0C\0e\0r\0e\0m\0o\0n\0i\0a\0s\0_\0T\0i\0p\0o\0C\0e\0r\0e\0m\0o\0n\0i\0a\0s\0!C4\0\0\0�\0\0x\0\0xV4\0\0\0\0\0T\0i\0p\0o\0I\0n\0s\0t\0i\0t\0u\0c\0i\0o\0n\0a\0l\0\0\0<(�(�(\�)\�)*X*�* +,+l+�+�,�,1$1p1�1\�182D2�2�2�2\033|3�4\Z\�4\�45 5<5�5�5�5L687D788D8�8�8l9\�9\�9(:�:;0?<?\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0�\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0l	\0\08\0\0�\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0x\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�	\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0+?\0\0�\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0�\0\0�\r\0\0X\0\0xV4\0\0\0l\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0T\0i\0p\0o\0I\0n\0s\0t\0i\0t\0u\0c\0i\0o\0n\0a\0l\0\0\0!C4\0\0\0�\0\0\�\r\0\0xV4\0\0\0\0\0T\0i\0p\0o\0M\0e\0d\0a\0l\0l\0a\0\0\0���������\r��������\r��\r���d�p�<�H�������,�8�d�p�L����\��$�\�������������\\�h�4�@�dO�4P�@P�t=��=��=�\�������\��\0\0P\0R\0I\0M\0A\0R\0Y\0\0\0��d��d�\�d�$ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0�\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0l	\0\08\0\0�\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\�\r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0+?\0\0�\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0�\0\0�\r\0\0X\0\0xV4\0\0\0`\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0T\0i\0p\0o\0M\0e\0d\0a\0l\0l\0a\0\0\0\0\0������\0\0�����\�\0\0\0\0\0\0\0\0\0���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0+\0\0\0\0\0\0\0i���x\�\0\0@\r\0\0S\0\05\0\0\0\0\0\0\0@\r\0\0S\0\0\0\0\0\0\0\0\0�\0\0�\0\0\0\0\0\0\0��0\0Tahoma\0F\0K\0_\0M\0e\0d\0a\0l\0l\0a\0s\0_\0T\0i\0p\0o\0M\0e\0d\0a\0l\0l\0a\0!C4\0\0\0�\0\0\0\0xV4\0\0\0\0\0T\0i\0p\0o\0M\0o\0n\0e\0d\0a\0\0\0�\�I�\�I�������Ȏ�,��X��Ȑ�0N�Ԑ�D��\\��x��<N�������\\��h���N�\�N�t��䒖���\�N�PO�P��\\��t��쓖���\\O��O������������\�O��J�����P��ԕ�\���\0K�\�K�t��䖖���\�K��L�P��\\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0�\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0l	\0\08\0\0�\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0+?\0\0�\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0�\0\0�\r\0\0X\0\0xV4\0\0\0^\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0T\0i\0p\0o\0M\0o\0n\0e\0d\0a\0\0\0!C4\0\0\0~\0\0\�\0\0xV4\0\0\0\0\0T\0i\0p\0o\0P\0r\0e\0g\0u\0n\0t\0a\0\0\0�\��\�\0\�\�L\�\�(\�\�x\��\�|=\Z\�=\Z�=\Z\�\�H\�T\��\�d\�p\�L\�X\�$>\Z0>\Zp>\Z\�2X3�\�\� \�L\�X\��\��>\Z�>\Z�\�\�\�4\�@\��\��\��\�\�\�T\�$\�0\��\��\�H\�d\��\�\0\�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0�\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0l	\0\08\0\0�\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0~\0\0\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0+?\0\0�\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0�\0\0�\r\0\0X\0\0xV4\0\0\0b\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\r\0\0\0T\0i\0p\0o\0P\0r\0e\0g\0u\0n\0t\0a\0\0\0!C4\0\0\0�\0\0;\r\0\0xV4\0\0\0\0\0T\0i\0p\0o\0R\0e\0p\0r\0e\0s\0e\0n\0t\0a\0n\0t\0e\0\0\0\�a�\�a�ķ�ܷ����� ��,��(b�\�b�8��������\���$c�0c�0l��\0Ö@Ö|Ö\�Ö4ĖLĖ\�Ɩ\�Ɩ�c�Ld�\�Ɩ\\ǖhǖ�ǖ�d��d�\�ǖȖȖ�Ȗ�Ȗ\�d�@e�ɖ�ɖ�ɖ�ɖ,f�8f�\�ɖ�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0�\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0l	\0\08\0\0�\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0;\r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0+?\0\0�\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0�\0\0�\r\0\0X\0\0xV4\0\0\0l\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0T\0i\0p\0o\0R\0e\0p\0r\0e\0s\0e\0n\0t\0a\0n\0t\0e\0\0\0!C4\0\0\0~\0\0\0\0xV4\0\0\0\0\0T\0i\0p\0o\0S\0e\0d\0e\0s\0\0\0\�\�\�\�\0Y�Y�,\�8\��\�\�\�\�\�XY�(Z�\�\�\\\�h\��\�4Z����\�\�\�\��\���l��x��\���\0����|����������D��������,��D��������[�x[�\���<��H��d���[�ԛ�������\���\0\0���d�����h�ȡ�8�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0�\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0l	\0\08\0\0�\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0~\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0+?\0\0�\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0�\0\0�\r\0\0X\0\0xV4\0\0\0\\\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\n\0\0\0T\0i\0p\0o\0S\0e\0d\0e\0s\0\0\0!C4\0\0\0�\0\0g\0\0xV4\0\0\0\0\0T\0i\0p\0o\0U\0s\0u\0a\0r\0i\0o\0\0\0x/��/�\�/�\�/��/�h0�t0��0�1�L1�X1�p5�|5�\�5�6� 6��6��6�\07�7�L7�X7�d7�\�7�\�7� 8�t8�l9�x9��<��<�\�<�\�<�=�I\�2\�,0\Z$1\Z01\Z<4\ZH4\Z8<���\��\0�\ZI>\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0�\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0l	\0\08\0\0�\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0g\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0+?\0\0�\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0�\0\0�\r\0\0X\0\0xV4\0\0\0`\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0T\0i\0p\0o\0U\0s\0u\0a\0r\0i\0o\0\0\0!C4\0\0\0�\0\0\�&\0\0xV4\0\0\0\0\0U\0s\0u\0a\0r\0i\0o\0s\0\0\0�K�L\�L\�O\�O(P4PPPk\0~ZI>\0�\0P+\"\r\�Q\�R\�RSS(S�S�S\�S�T�T�UVV�4\Z�4\Z,5\ZpV\�V\�V,W�WX\�X�X85\Zx5\ZH6\ZT6\Z7\ZDY�Y�Y\�Y�Y8Z(7\Zh7\ZXZdZ\�Z\�Z [\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0�\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0l	\0\08\0\0�\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\�&\0\0\0\0\0\0	\0\0\0	\0\0\0\0\0\0\0\0\0\0\0x\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0+?\0\0�\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0�\0\0�\r\0\0X\0\0xV4\0\0\0Z\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0	\0\0\0U\0s\0u\0a\0r\0i\0o\0s\0\0\0!C4\0\0\0�\0\0�\0\0xV4\0\0\0\0\0H\0o\0r\0a\0\0\0�0ߘ(\��4\��@\�L\��\��\��\�0\�<\�|\�L\�X\�\�(\�h\�t\��\��\��\�<\�\�\��\�h\�t\�`_��_�\\k�\�\�8\�D\��\�T\�`\�$\�0\�m��_�\�_�<`�H`�|\�\�\��\�$\�0\�p\��`��`��\��\�\�\�X\�d\�p\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0�\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0l	\0\08\0\0�\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0+?\0\0�\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0�\0\0�\r\0\0X\0\0xV4\0\0\0R\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0H\0o\0r\0a\0\0\0\0\0\nA\0\0\\�\0\0\nA\0\0ź\0\0\0\0\0\0\0\0\0���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\04\0\0\0\0\0\0\0�A\0\0Y�\0\0q\0\0S\0\03\0\0\0\0\0\0\0q\0\0S\0\0\0\0\0\0\0\0\0�\0\0�\0\0\0\0\0\0\0��0\0Tahoma\0F\0K\0_\0F\0e\0c\0h\0a\0E\0v\0e\0n\0t\0o\0_\0H\0o\0r\0a\0!C4\0\0\0�\0\0^\r\0\0xV4\0\0\0\0\0P\0a\0i\0s\0\0\0�L7�\�7�\�7�(8�\�8�\��T�`�|��9��9�:�D:�;� ;�L=�X=������=���l�\�����8�x��\Z����=�\� ��!�@\"��\"��\"��#�L%�&�(&�\��\��4&��&��&�\�&��\�=�,\'�h\'��\'��\'�(�H(��(��(�)�)\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0�\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0l	\0\08\0\0�\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0^\r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0+?\0\0�\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0�\0\0�\r\0\0X\0\0xV4\0\0\0R\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0P\0a\0i\0s\0\0\0!C4\0\0\0�\0\0�\0\0xV4\0\0\0\0\0S\0e\0d\0e\0s\0\0\0�b�b\�b�c�ct7\Z�7\Z�7\Z\�d\�e�g�7\Z<8\Z9\Z9\Z�9\Zhj\�j|k�k\�k�lTm`m�mpn o,o�o�op�phq\�q\�q$r�r\0s,u8u�u�u�uv(v�v�v\�v\�vw|w�w�w(x`xlx\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0�\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0l	\0\08\0\0�\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0:\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0+?\0\0�\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0�\0\0�\r\0\0X\0\0xV4\0\0\0T\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0S\0e\0d\0e\0s\0\0\0\0\0\0\0��\0\0\0\0\�\0\0\0\0\0\0\0\0\0���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\08\0\0\0\0\0\0\0A\0\0ȍ\0\0\0\0S\0\02\0\0\0\0\0\0\0\0\0S\0\0\0\0\0\0\0\0\0�\0\0�\0\0\0\0\0\0\0��0\0Tahoma\0F\0K\0_\0S\0e\0d\0e\0s\0_\0T\0i\0p\0o\0S\0e\0d\0e\0s\0\0\0\�\0\0@\0\�\0\0�\0\0\0\0\0\0\0\0���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0:\0\0\0\0\0\0\0��\0\0\�\0/\0\0S\0\02\0\0\0\0\0\0\0/\0\0S\0\0\0\0\0\0\0\0\0�\0\0�\0\0\0\0\0\0\0��0\0Tahoma#\0F\0K\0_\0P\0r\0e\0g\0u\0n\0t\0a\0s\0F\0r\0e\0c\0u\0e\0n\0t\0e\0s\0_\0T\0i\0p\0o\0P\0r\0e\0g\0u\0n\0t\0a\0\0\0\�\0\0��\0\0\�\0\0T\�\0\0\0\0\0\0\0\0\0���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0<\0\0\0\0\0\0\0�\�\0\0A�\0\0\0\0S\0\02\0\0\0\0\0\0\0\0\0S\0\0\0\0\0\0\0\0\0�\0\0�\0\0\0\0\0\0\0��0\0Tahoma\"\0F\0K\0_\0A\0u\0s\0p\0i\0c\0i\0a\0d\0o\0r\0e\0s\0_\0T\0i\0p\0o\0A\0u\0s\0p\0i\0c\0i\0a\0d\0o\0r\0e\0s\0\0\00u\0\0�n\0\0�G\0\0�n\0\0\0\0\0\0\0\0\0���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0>\0\0\0\0\0\0\0P\0\0�l\0\0�\0\0S\0\0B\0\0\0\0\0\0\0�\0\0S\0\0\0\0\0\0\0\0\0�\0\0�\0\0\0\0\0\0\0��0\0Tahoma!\0F\0K\0_\0C\0o\0m\0p\0r\0o\0b\0a\0n\0t\0e\0P\0a\0g\0o\0_\0C\0o\0m\0p\0r\0a\0_\0E\0n\0t\0r\0a\0d\0a\0\0\0>I\0\0L�\0\0>I\0\0\��\0\0\0\0\0\0\0\0\0���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\�I\0\0\��\0\0\r\0\0S\0\0d\0\0\0\0\0\0\0\r\0\0S\0\0\0\0\0\0\0\0\0�\0\0�\0\0\0\0\0\0\0��0\0Tahoma\0F\0K\0_\0U\0s\0u\0a\0r\0i\0o\0s\0_\0T\0i\0p\0o\0U\0s\0u\0a\0r\0i\0o\0\0\0\�k\0\0\�\0\0�b\0\0\�\0\0�b\0\0�\�\0\0\rW\0\0�\�\0\0\0\0\0\0\0\0\0���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0B\0\0\0\0\0\0\0�W\0\0N\�\0\0�\n\0\0S\0\02\0\0\0\0\0\0\0�\n\0\0S\0\0\0\0\0\0\0\0\0�\0\0�\0\0\0\0\0\0\0��0\0Tahoma\0F\0K\0_\0U\0s\0u\0a\0r\0i\0o\0s\0_\0G\0a\0l\0e\0r\0i\0a\0\0\0\�\0\0\�\�\0\0\�\0\0R\�\0\0\0\0\0\0\0\0\0���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0D\0\0\0\0\0\0\03\0\0e\�\0\0�\r\0\0S\0\02\0\0\0\0\0\0\0�\r\0\0S\0\0\0\0\0\0\0\0\0�\0\0�\0\0\0\0\0\0\0��0\0Tahoma\0F\0K\0_\0D\0e\0t\0a\0l\0l\0e\0E\0v\0e\0n\0t\0o\0s\0_\0E\0v\0e\0n\0t\0o\0s\0\0\0B\0\0�$\0�%\0\0�$\0\0\0\0\0\0\0\0���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0F\0\0\0\0\0\0\0C\0\0�%\0+\0\0S\0\0	\0\0\0\0\0\0\0+\0\0S\0\0\0\0\0\0\0\0\0�\0\0�\0\0\0\0\0\0\0��0\0Tahoma&\0F\0K\0_\0C\0o\0m\0i\0t\0e\0O\0r\0g\0a\0n\0i\0z\0a\0d\0o\0r\0_\0T\0i\0p\0o\0R\0e\0p\0r\0e\0s\0e\0n\0t\0a\0n\0t\0e\0\0\0\�P\0\0�\0A\0\0�\0\0\0\0\0\0\0\0���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0H\0\0\0\0\0\0\0�@\0\0\�\0u\0\0S\0\0]\0\0\0\0\0\0\0u\0\0S\0\0\0\0\0\0\0\0\0�\0\0�\0\0\0\0\0\0\0��0\0Tahoma#\0F\0K\0_\0C\0o\0m\0i\0t\0e\0O\0r\0g\0a\0n\0i\0z\0a\0d\0o\0r\0_\0R\0e\0p\0r\0e\0s\0e\0n\0t\0a\0n\0t\0e\0s\0\0\0��\0\0\�\0\0q�\0\0\�\0\0\0\0\0\0\0\0\0���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0J\0\0\0\0\0\0\0m�\0\0\n\�\0\0	\0\0S\0\0J\0\0\0\0\0\0\0	\0\0S\0\0\0\0\0\0\0\0\0�\0\0�\0\0\0\0\0\0\0��0\0Tahoma\"\0F\0K\0_\0I\0n\0s\0t\0i\0t\0u\0c\0i\0o\0n\0a\0l\0_\0T\0i\0p\0o\0I\0n\0s\0t\0i\0t\0u\0c\0i\0o\0n\0a\0l\0\0\0ʞ\0\0x�\0\0ʞ\0\0��\0\0\0\0\0\0\0\0\0���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0L\0\0\0\0\0\0\0��\0\0U�\0\0u\0\0S\0\02\0\0\0\0\0\0\0u\0\0S\0\0\0\0\0\0\0\0\0�\0\0�\0\0\0\0\0\0\0��0\0Tahoma$\0F\0K\0_\0M\0e\0n\0u\0P\0r\0i\0n\0c\0i\0p\0a\0l\0_\0P\0r\0e\0g\0u\0n\0t\0a\0s\0F\0r\0e\0c\0u\0e\0n\0t\0e\0s\0\0\0zX\0\0r�\0\0�9\0\0r�\0\0�9\0\0��\0\0�+\0\0��\0\0�+\0\0��\0\0P&\0\0��\0\0\0\0\0\0\0\0\0���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0N\0\0\0\0\0\0\0\�7\0\0��\0\0<\0\0S\0\0-\0\0\0\0\0\0\0<\0\0S\0\0\0\0\0\0\0\0\0�\0\0�\0\0\0\0\0\0\0��0\0Tahoma\0F\0K\0_\0E\0v\0e\0n\0t\0o\0s\0_\0H\0o\0r\0a\0r\0i\0o\0E\0v\0e\0n\0t\0o\0s\0\0\0\����B\04\���B\04\���n	\0�\���n	\0\0\0\0\0\0\0\0���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\0\0\0\0\0\0\0\�\���x	\0�\r\0\0S\0\0E\0\0\0\0\0\0\0�\r\0\0S\0\0\0\0\0\0\0\0\0�\0\0�\0\0\0\0\0\0\0��0\0Tahoma\0F\0K\0_\0D\0e\0p\0o\0r\0t\0e\0D\0e\0s\0t\0a\0c\0a\0d\0o\0_\0P\0a\0i\0s\0\0\0`�\0\0\�\0\0+�\0\0\�\0\0+�\0\0�\�\0\0�\0\0�\�\0\0\0\0\0\0\0\0\0���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0R\0\0\0\0\0\0\0ڍ\0\0�\�\0\0@\r\0\0S\0\0*\0\0\0\0\0\0\0@\r\0\0S\0\0\0\0\0\0\0\0\0�\0\0�\0\0\0\0\0\0\0��0\0Tahoma\0F\0K\0_\0M\0e\0n\0u\0P\0r\0i\0n\0c\0i\0p\0a\0l\0_\0G\0a\0l\0e\0r\0i\0a\0\0\07\0\0z\�\0\0&\0\0z\�\0\0\0\0\0\0\0\0\0���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0\0\0\0\0i(\0\0x\�\0\0�\0\0S\0\0.\0\0\0\0\0\0\0�\0\0S\0\0\0\0\0\0\0\0\0�\0\0�\0\0\0\0\0\0\0��0\0Tahoma\0F\0K\0_\0D\0e\0p\0o\0r\0t\0i\0s\0t\0a\0s\0_\0U\0s\0u\0a\0r\0i\0o\0s\0\0\0�\0\0�\0�\0\0&�\0\0\0\0\0\0\0\0\0���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0V\0\0\0\0\0\0\0C\0\0y\0]\n\0\0S\0\05\0\0\0\0\0\0\0]\n\0\0S\0\0\0\0\0\0\0\0\0�\0\0�\0\0\0\0\0\0\0��0\0Tahoma\0F\0K\0_\0D\0e\0p\0o\0r\0t\0i\0s\0t\0a\0s\0_\0P\0a\0i\0s\0\0\0����B�\0\0\0\0B�\0\0\0\0z\�\0\0�\n\0\0z\�\0\0\0\0\0\0\0\0\0���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0X\0\0\0\0\0\0\0\����@�\0\0\�\0\0S\0\02\0\0\0\0\0\0\0\�\0\0S\0\0\0\0\0\0\0\0\0�\0\0�\0\0\0\0\0\0\0��0\0Tahoma\0F\0K\0_\0D\0e\0p\0o\0r\0t\0i\0s\0t\0a\0s\0_\0D\0e\0p\0o\0r\0t\0e\0s\0\0\0�\����\0\0�\���e�\0\0����e�\0\0����^�\0\0\0\0\0\0\0\0\0���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Z\0\0\0\0\0\0\0����c�\0\0�\0\0S\0\0 \0\0\0\0\0\0\0�\0\0S\0\0\0\0\0\0\0\0\0�\0\0�\0\0\0\0\0\0\0��0\0Tahoma\Z\0F\0K\0_\0D\0e\0p\0o\0r\0t\0e\0s\0_\0D\0e\0t\0a\0l\0l\0e\0D\0e\0p\0o\0r\0t\0e\0\0\0(�\0\0�\�\0\0��\0\0�\�\0\0\0\0\0\0\0\0\0���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0]\0\0\0\0\0\0\0~�\0\0�\�\0\0\�\0\0S\0\02\0\0\0\0\0\0\0\�\0\0S\0\0\0\0\0\0\0���\0\0\0�\0\0\0\0\0\0\0��0\0Tahoma\0F\0K\0_\0M\0e\0n\0u\0P\0r\0i\0n\0c\0i\0p\0a\0l\0_\0A\0u\0s\0p\0i\0c\0i\0a\0d\0o\0r\0e\0s\0\0\04�\0\0�\�\0\04�\0\0b\�\0\0\0\0\0\0\0\0\0���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0_\0\0\0\0\0\0\0��\0\0S\�\0\0\�\0\0S\0\02\0\0\0\0\0\0\0\�\0\0S\0\0\0\0\0\0\0���\0\0\0�\0\0\0\0\0\0\0��0\0Tahoma\0F\0K\0_\0M\0e\0n\0u\0P\0r\0i\0n\0c\0i\0p\0a\0l\0_\0I\0n\0s\0t\0i\0t\0u\0c\0i\0o\0n\0a\0l\0\0\0\�\0\0:k\0\0��\0\0:k\0\0\0\0\0\0\0\0\0���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0a\0\0\0\0\0\0\0�\0\08i\0\0�\0\0S\0\02\0\0\0\0\0\0\0�\0\0S\0\0\0\0\0\0\0���\0\0\0�\0\0\0\0\0\0\0��0\0Tahoma\Z\0F\0K\0_\0C\0o\0m\0p\0r\0a\0_\0E\0n\0t\0r\0a\0d\0a\0_\0A\0s\0i\0e\0n\0t\0o\0s\0\0\0�2\0\08\0�2\0\0�\0��\0\0�\0��\0\0��\0\0\0\0\0\0\0\0\0���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0c\0\0\0\0\0\0\0��\0\0�\0�\0\0S\0\0I\0\0\0\0\0\0\0�\0\0S\0\0\0\0\0\0\0���\0\0\0�\0\0\0\0\0\0\0��0\0Tahoma\"\0F\0K\0_\0M\0e\0n\0u\0P\0r\0i\0n\0c\0i\0p\0a\0l\0_\0C\0o\0m\0i\0t\0e\0O\0r\0g\0a\0n\0i\0z\0a\0d\0o\0r\0\0\0T\�����\0\0\�\�����\0\0\�\�����\0\0������\0\0\0\0\0\0\0\0\0���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0e\0\0\0\0\0\0\0E����\0\0@\r\0\0S\0\02\0\0\0\0\0\0\0@\r\0\0S\0\0\0\0\0\0\0���\0\0\0�\0\0\0\0\0\0\0��0\0Tahoma\0F\0K\0_\0D\0e\0p\0o\0r\0t\0e\0s\0_\0R\0e\0g\0l\0a\0m\0e\0n\0t\0o\0\0\0t���^�\0\0t���~o\0\0\0\0\0\0\0\0\0���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0g\0\0\0\0\0\0\0#����\0\0$\0\0S\0\0\0\0\0\0\0\0\0$\0\0S\0\0\0\0\0\0\0���\0\0\0�\0\0\0\0\0\0\0��0\0Tahoma\Z\0F\0K\0_\0R\0e\0p\0o\0r\0t\0e\0E\0n\0t\0r\0a\0d\0a\0_\0D\0e\0p\0o\0r\0t\0e\0s\0\0\0܃\0\0�\�\0\0�\0\0�\�\0\0\0\0\0\0\0\0\0���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0i\0\0\0\0\0\0\0��\0\0_\�\0\0\�\0\0S\0\02\0\0\0\0\0\0\0\�\0\0S\0\0\0\0\0\0\0���\0\0\0�\0\0\0\0\0\0\0��0\0Tahoma\0F\0K\0_\0M\0e\0n\0u\0P\0r\0i\0n\0c\0i\0p\0a\0l\0_\0C\0e\0r\0e\0m\0o\0n\0i\0a\0s\0\0\0\�$\0\0\�\0\0\�$\0\0:�\0\0\\\0\0:�\0\0\\\0\0Jy\0\00u\0\0Jy\0\0\0\0\0\0\0\0\0���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0k\0\0\0\0\0\0\0\�)\0\0\�\0\0T\0\0S\0\0\0\0\0\0\0\0\0T\0\0S\0\0\0\0\0\0\0���\0\0\0�\0\0\0\0\0\0\0��0\0Tahoma\0F\0K\0_\0C\0o\0m\0p\0r\0a\0_\0E\0n\0t\0r\0a\0d\0a\0_\0S\0e\0d\0e\0s\0\0\0N\0\0x�\0\0N\0\0��\0\0\0\0\0\0\0\0\0���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0m\0\0\0\0\0\0\0�\0\0��\0\0�	\0\0S\0\02\0\0\0\0\0\0\0�	\0\0S\0\0\0\0\0\0\0���\0\0\0�\0\0\0\0\0\0\0��0\0Tahoma\0F\0K\0_\0E\0v\0e\0n\0t\0o\0s\0_\0S\0e\0d\0e\0s\0\0\0\���\�\�\0\0�\���\�\�\0\0\0\0\0\0\0\0\0���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0u\0\0\0\0\0\0\0~\���\�\�\0\0\0\0S\0\02\0\0\0\0\0\0\0\0\0S\0\0\0\0\0\0\0���\0\0\0�\0\0\0\0\0\0\0��0\0Tahoma\0F\0K\0_\0R\0a\0n\0k\0i\0n\0g\0_\0M\0e\0d\0a\0l\0l\0a\0s\0\0\0�\���\�\0\0�\���2�\0\0\0\0\0\0\0\0\0���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0w\0\0\0\0\0\0\0\�\����\�\0\0�\0\0S\0\02\0\0\0\0\0\0\0�\0\0S\0\0\0\0\0\0\0���\0\0\0�\0\0\0\0\0\0\0��0\0Tahoma\0F\0K\0_\0D\0e\0p\0o\0r\0t\0e\0D\0e\0s\0t\0a\0c\0a\0d\0o\0_\0R\0a\0n\0k\0i\0n\0g\0\0\0����x�\0\02���x�\0\02����\0\0r\0\0�\0\0\0\0\0\0\0\0\0���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0y\0\0\0\0\0\0\0\�����\0\0�\0\0S\0\05\0\0\0\0\0\0\0�\0\0S\0\0\0\0\0\0\0���\0\0\0�\0\0\0\0\0\0\0��0\0Tahoma\0F\0K\0_\0T\0i\0p\0o\0S\0e\0d\0e\0s\0_\0D\0e\0p\0o\0r\0t\0e\0s\0\0\0��\0\0�\0\0��\0\0N�\0\0\�\0\0N�\0\0\�\0\0z�\0\0d�\0\0z�\0\0d�\0\0\'�\0\0��\0\0\'�\0\0��\0\0�\0\0\0\0\0\0\0\0\0���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0{\0\0\0\0\0\0\0��\0\0x�\0\0\�\0\0S\0\02\0\0\0\0\0\0\0\�\0\0S\0\0\0\0\0\0\0���\0\0\0�\0\0\0\0\0\0\0��0\0Tahoma\0F\0K\0_\0M\0o\0n\0e\0d\0a\0_\0T\0i\0p\0o\0M\0o\0n\0e\0d\0a\0\0\0R\0\0�\�\0\0R\0\07�\0\0�\0\07�\0\0�\0\0q�\0\0\0\0\0\0\0\0\0���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0}\0\0\0\0\0\0\0�_\0\05�\0\0�\0\0S\0\02\0\0\0\0\0\0\0�\0\0S\0\0\0\0\0\0\0���\0\0\0�\0\0\0\0\0\0\0��0\0Tahoma\Z\0F\0K\0_\0C\0o\0m\0p\0r\0a\0_\0E\0n\0t\0r\0a\0d\0a\0_\0U\0s\0u\0a\0r\0i\0o\0s\0\0\0j\0\0\�\0\0j\0\0��\0\0\�u\0\0��\0\0\�u\0\0q�\0\0\0\0\0\0\0\0\0���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	o\0\0?�\0\0\�\0\0S\0\0<\0\0\0\0\0\0\0\�\0\0S\0\0\0\0\0\0\0���\0\0\0�\0\0\0\0\0\0\0��0\0Tahoma \0F\0K\0_\0C\0o\0m\0p\0r\0a\0_\0E\0n\0t\0r\0a\0d\0a\0_\0H\0o\0r\0a\0r\0i\0o\0E\0v\0e\0n\0t\0o\0s\0\0\0$�\0\0ފ\0\0$�\0\0q�\0\0\0\0\0\0\0\0\0���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0Ӑ\0\0~�\0\0:\0\0S\0\02\0\0\0\0\0\0\0:\0\0S\0\0\0\0\0\0\0���\0\0\0�\0\0\0\0\0\0\0��0\0Tahoma\0F\0K\0_\0C\0o\0m\0p\0r\0a\0_\0E\0n\0t\0r\0a\0d\0a\0_\0M\0o\0n\0e\0d\0a\0\0\0�\���\�d\0\00u\0\0\�d\0\0\0\0\0\0\0\0\0���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0 \0\0\�b\0\02\0\0S\0\0;\0\0\0\0\0\0\02\0\0S\0\0\0\0\0\0\0���\0\0\0�\0\0\0\0\0\0\0��0\0Tahoma \0F\0K\0_\0C\0o\0m\0p\0r\0a\0_\0E\0n\0t\0r\0a\0d\0a\0_\0R\0e\0p\0o\0r\0t\0e\0E\0n\0t\0r\0a\0d\0a\0\0\0����\��\0\0\���\��\0\0\���Z\�\0\0\0\0\0\0\0\0\0���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0�\���u�\0\0-\0\0S\0\05\0\0\0\0\0\0\0-\0\0S\0\0\0\0\0\0\0���\0\0\0�\0\0\0\0\0\0\0��0\0Tahoma\0F\0K\0_\0R\0a\0n\0k\0i\0n\0g\0_\0D\0e\0p\0o\0r\0t\0e\0s\0\0\0�\n\0\0��\0\0\������\0\0\����>\�\0\0E���>\�\0\0\0\0\0\0\0\0\0���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0����\�\0\0Y\0\0S\0\0.\0\0\0\0\0\0\0Y\0\0S\0\0\0\0\0\0\0���\0\0\0�\0\0\0\0\0\0\0��0\0Tahoma\0F\0K\0_\0R\0a\0n\0k\0i\0n\0g\0_\0D\0e\0p\0o\0r\0t\0i\0s\0t\0a\0s\0\0\0�\0\0F\�\0\0�\0\0z\�\0\0\0\0\0\0\0\0\0���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\09\0\0�\�\0\0\�\0\0S\0\02\0\0\0\0\0\0\0\�\0\0S\0\0\0\0\0\0\0���\0\0\0�\0\0\0\0\0\0\0��0\0Tahoma\0F\0K\0_\0D\0e\0t\0a\0l\0l\0e\0E\0v\0e\0n\0t\0o\0s\0_\0D\0e\0p\0o\0r\0t\0i\0s\0t\0a\0s\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��������\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0\0!\0\0\0\"\0\0\0#\0\0\0$\0\0\0%\0\0\0&\0\0\0\'\0\0\0(\0\0\0����������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\0��\n\0\0����\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Microsoft DDS Form 2.0\0\0\0\0Embedded Object\0\0\0\0\0�9�q\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Na�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\�\��\��Q\0�\�W9\0\0\0�\�2��\�\0\0HE\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0D\0a\0t\0a\0 \0S\0o\0u\0r\0c\0e\0=\0L\0A\0P\0T\0O\0P\0-\0C\0E\0S\0A\0R\0;\0I\0n\0i\0t\0i\0a\0l\0 \0C\0a\0t\0a\0l\0o\0g\0=\0B\0D\0T\0e\0c\0n\0o\0S\0e\0r\0v\0;\0P\0e\0r\0s\0i\0s\0t\0 \0S\0e\0c\0u\0r\0i\0t\0y\0 \0I\0n\0f\0o\0=\0T\0r\0u\0e\0;\0U\0s\0e\0r\0 \0I\0D\0=\0s\0a\0;\0M\0u\0l\0t\0i\0p\0l\0e\0A\0c\0t\0i\0v\0e\0R\0e\0s\0u\0l\0t\0S\0e\0t\0s\0=\0F\0a\0l\0s\0e\0;\0P\0a\0c\0k\0e\0t\0 \0S\0i\0z\0\0D\0d\0s\0S\0t\0r\0e\0a\0m\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0����\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0a\0\0\0�n\0\0\0\0\0\0S\0c\0h\0e\0m\0a\0 \0U\0D\0V\0 \0D\0e\0f\0a\0u\0l\0t\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0&\0\0������������\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0D\0S\0R\0E\0F\0-\0S\0C\0H\0E\0M\0A\0-\0C\0O\0N\0T\0E\0N\0T\0S\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0,\0\0\0\0\0\0\0����\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0^	\0\0\0\0\0\0S\0c\0h\0e\0m\0a\0 \0U\0D\0V\0 \0D\0e\0f\0a\0u\0l\0t\0 \0P\0o\0s\0t\0 \0V\06\0\0\0\0\0\0\0\0\0\0\0\0\06\0\0������������\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0)\0\0\0\0\0\0\0\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�����\0\0\0�\0\0\0�\0\0\0�\0\0\0������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������\0\0\0N���M\0\0\0&\0\0\0s\0c\0h\0_\0l\0a\0b\0e\0l\0s\0_\0v\0i\0s\0i\0b\0l\0e\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0d\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\04\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0\0\0\0\0\0\0\0\0\0\0J\0\0\0joV\0\0\0d\0b\0o\0\0\0F\0K\0_\0A\0s\0i\0e\0n\0t\0o\0s\0_\0C\0a\0t\0e\0g\0o\0r\0i\0a\0A\0s\0i\0e\0n\0t\0o\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�l��l\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0	\0\0\0	\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0\n\0\0\0\n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0\r\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\04\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\04\03\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0\0\0\0\0\0\0\0\0\0\0D\0\0\0\0\'\0\0\0\0d\0b\0o\0\0\0F\0K\0_\0A\0s\0i\0e\0n\0t\0o\0s\0_\0E\0s\0t\0a\0d\0o\0A\0s\0i\0e\0n\0t\0o\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�l�l\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\04\08\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0\0\0\0\0\0\0\0\0\0\0L\0\0\0joV\0\0\0d\0b\0o\0\0\0F\0K\0_\0H\0o\0r\0a\0r\0i\0o\0E\0v\0e\0n\0t\0o\0s\0_\0F\0e\0c\0h\0a\0E\0v\0e\0n\0t\0o\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�l��l\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0\Z\0\0\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\04\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\04\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\04\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0 \0\0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0!\0\0\0!\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0\"\0\0\0\"\0\0\0\0\0\0\0D\0\0\0\0\'\0\0\0\0d\0b\0o\0\0\0F\0K\0_\0A\0s\0i\0e\0n\0t\0o\0s\0_\0S\0t\0o\0c\0k\0A\0s\0i\0e\0n\0t\0o\0s\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0#\0\0\0#\0\0\0\"\0\0\0\0\0\0\�lH\�l\0\0\0\0\0\0\0\0�\0\0\0\0\0$\0\0\0$\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0%\0\0\0%\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\03\06\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0&\0\0\0&\0\0\0\0\0\0\0J\0\0\0joV\0\0\0d\0b\0o\0\0\0F\0K\0_\0C\0e\0r\0e\0m\0o\0n\0i\0a\0s\0_\0T\0i\0p\0o\0C\0e\0r\0e\0m\0o\0n\0i\0a\0s\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0\'\0\0\0\'\0\0\0&\0\0\0\0\0\0\�l�\�l\0\0\0\0\0\0\0\0�\0\0\0\0\0(\0\0\0(\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\04\03\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0)\0\0\0)\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0*\0\0\0*\0\0\0\0\0\0\0@\0\0\0joV\0\0\0d\0b\0o\0\0\0F\0K\0_\0M\0e\0d\0a\0l\0l\0a\0s\0_\0T\0i\0p\0o\0M\0e\0d\0a\0l\0l\0a\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0+\0\0\0+\0\0\0*\0\0\0\0\0\0\�l�\�l\0\0\0\0\0\0\0\0�\0\0\0\0\0,\0\0\0,\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0-\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\04\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0.\0\0\0.\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0/\0\0\0/\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\00\0\0\00\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\01\0\0\01\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\09\06\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\02\0\0\02\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\03\0\0\03\0\0\0\0\0\0\08\0\0\0\�\0\0\0d\0b\0o\0\0\0F\0K\0_\0F\0e\0c\0h\0a\0E\0v\0e\0n\0t\0o\0_\0H\0o\0r\0a\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\04\0\0\04\0\0\03\0\0\0\0\0\0\�lH\�l\0\0\0\0\0\0\0\0�\0\0\0\0\05\0\0\05\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\06\0\0\06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\07\0\0\07\0\0\0\0\0\0\06\0\0\0\0\0\0\0\0\0d\0b\0o\0\0\0F\0K\0_\0S\0e\0d\0e\0s\0_\0T\0i\0p\0o\0S\0e\0d\0e\0s\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\08\0\0\08\0\0\07\0\0\0\0\0\0\rmH\rm\0\0\0\0\0\0\0\0�\0\0\0\0\09\0\0\09\0\0\0\0\0\0\0X\0\0\0\�t\0\0\0d\0b\0o\0\0\0F\0K\0_\0P\0r\0e\0g\0u\0n\0t\0a\0s\0F\0r\0e\0c\0u\0e\0n\0t\0e\0s\0_\0T\0i\0p\0o\0P\0r\0e\0g\0u\0n\0t\0a\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0:\0\0\0:\0\0\09\0\0\0\0\0\0\rm\rm\0\0\0\0\0\0\0\0�\0\0\0\0\0;\0\0\0;\0\0\0\0\0\0\0V\0\0\0\�t\0\0\0d\0b\0o\0\0\0F\0K\0_\0A\0u\0s\0p\0i\0c\0i\0a\0d\0o\0r\0e\0s\0_\0T\0i\0p\0o\0A\0u\0s\0p\0i\0c\0i\0a\0d\0o\0r\0e\0s\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0<\0\0\0<\0\0\0;\0\0\0\0\0\0m\�m\0\0\0\0\0\0\0\0�\0\0\0\0\0=\0\0\0=\0\0\0\0\0\0\0T\0\0\0\�t\0\0\0d\0b\0o\0\0\0F\0K\0_\0C\0o\0m\0p\0r\0o\0b\0a\0n\0t\0e\0P\0a\0g\0o\0_\0C\0o\0m\0p\0r\0a\0_\0E\0n\0t\0r\0a\0d\0a\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0>\0\0\0>\0\0\0=\0\0\0\0\0\0m�m\0\0\0\0\0\0\0\0�\0\0\0\0\0?\0\0\0?\0\0\0\0\0\0\0@\0\0\0joV\0\0\0d\0b\0o\0\0\0F\0K\0_\0U\0s\0u\0a\0r\0i\0o\0s\0_\0T\0i\0p\0o\0U\0s\0u\0a\0r\0i\0o\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0@\0\0\0@\0\0\0?\0\0\0\0\0\0m�m\0\0\0\0\0\0\0\0�\0\0\0\0\0A\0\0\0A\0\0\0\0\0\0\08\0\0\0\0\0\0\0\0\0d\0b\0o\0\0\0F\0K\0_\0U\0s\0u\0a\0r\0i\0o\0s\0_\0G\0a\0l\0e\0r\0i\0a\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0B\0\0\0B\0\0\0A\0\0\0\0\0\0\nmH\nm\0\0\0\0\0\0\0\0�\0\0\0\0\0C\0\0\0C\0\0\0\0\0\0\0D\0\0\0\0\'\0\0\0\0d\0b\0o\0\0\0F\0K\0_\0D\0e\0t\0a\0l\0l\0e\0E\0v\0e\0n\0t\0o\0s\0_\0E\0v\0e\0n\0t\0o\0s\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0D\0\0\0D\0\0\0C\0\0\0\0\0\0mm\0\0\0\0\0\0\0\0�\0\0\0\0\0E\0\0\0E\0\0\0\0\0\0\0^\0\0\0joV\0\0\0d\0b\0o\0\0\0F\0K\0_\0C\0o\0m\0i\0t\0e\0O\0r\0g\0a\0n\0i\0z\0a\0d\0o\0r\0_\0T\0i\0p\0o\0R\0e\0p\0r\0e\0s\0e\0n\0t\0a\0n\0t\0e\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0F\0\0\0F\0\0\0E\0\0\0\0\0\0\nm\�\nm\0\0\0\0\0\0\0\0�\0\0\0\0\0G\0\0\0G\0\0\0\0\0\0\0X\0\0\0\�t\0\0\0d\0b\0o\0\0\0F\0K\0_\0C\0o\0m\0i\0t\0e\0O\0r\0g\0a\0n\0i\0z\0a\0d\0o\0r\0_\0R\0e\0p\0r\0e\0s\0e\0n\0t\0a\0n\0t\0e\0s\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0H\0\0\0H\0\0\0G\0\0\0\0\0\0\nm\nm\0\0\0\0\0\0\0\0�\0\0\0\0\0I\0\0\0I\0\0\0\0\0\0\0V\0\0\0\�t\0\0\0d\0b\0o\0\0\0F\0K\0_\0I\0n\0s\0t\0i\0t\0u\0c\0i\0o\0n\0a\0l\0_\0T\0i\0p\0o\0I\0n\0s\0t\0i\0t\0u\0c\0i\0o\0n\0a\0l\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0J\0\0\0J\0\0\0I\0\0\0\0\0\0m\�m\0\0\0\0\0\0\0\0�\0\0\0\0\0K\0\0\0K\0\0\0\0\0\0\0Z\0\0\0joV\0\0\0d\0b\0o\0\0\0F\0K\0_\0M\0e\0n\0u\0P\0r\0i\0n\0c\0i\0p\0a\0l\0_\0P\0r\0e\0g\0u\0n\0t\0a\0s\0F\0r\0e\0c\0u\0e\0n\0t\0e\0s\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0L\0\0\0L\0\0\0K\0\0\0\0\0\0mHm\0\0\0\0\0\0\0\0�\0\0\0\0\0M\0\0\0M\0\0\0\0\0\0\0D\0\0\0\0\'\0\0\0\0d\0b\0o\0\0\0F\0K\0_\0E\0v\0e\0n\0t\0o\0s\0_\0H\0o\0r\0a\0r\0i\0o\0E\0v\0e\0n\0t\0o\0s\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0N\0\0\0N\0\0\0M\0\0\0\0\0\0m�m\0\0\0\0\0\0\0\0�\0\0\0\0\0O\0\0\0O\0\0\0\0\0\0\0B\0\0\0\0\'\0\0\0\0d\0b\0o\0\0\0F\0K\0_\0D\0e\0p\0o\0r\0t\0e\0D\0e\0s\0t\0a\0c\0a\0d\0o\0_\0P\0a\0i\0s\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0P\0\0\0P\0\0\0O\0\0\0\0\0\0	m\�	m\0\0\0\0\0\0\0\0�\0\0\0\0\0Q\0\0\0Q\0\0\0\0\0\0\0B\0\0\0\0\'\0\0\0\0d\0b\0o\0\0\0F\0K\0_\0M\0e\0n\0u\0P\0r\0i\0n\0c\0i\0p\0a\0l\0_\0G\0a\0l\0e\0r\0i\0a\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0R\0\0\0R\0\0\0Q\0\0\0\0\0\0	mH	m\0\0\0\0\0\0\0\0�\0\0\0\0\0S\0\0\0S\0\0\0\0\0\0\0@\0\0\0joV\0\0\0d\0b\0o\0\0\0F\0K\0_\0D\0e\0p\0o\0r\0t\0i\0s\0t\0a\0s\0_\0U\0s\0u\0a\0r\0i\0o\0s\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0T\0\0\0T\0\0\0S\0\0\0\0\0\0mHm\0\0\0\0\0\0\0\0�\0\0\0\0\0U\0\0\0U\0\0\0\0\0\0\08\0\0\0\0\0\0\0\0\0d\0b\0o\0\0\0F\0K\0_\0D\0e\0p\0o\0r\0t\0i\0s\0t\0a\0s\0_\0P\0a\0i\0s\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0V\0\0\0V\0\0\0U\0\0\0\0\0\0	m�	m\0\0\0\0\0\0\0\0�\0\0\0\0\0W\0\0\0W\0\0\0\0\0\0\0@\0\0\0joV\0\0\0d\0b\0o\0\0\0F\0K\0_\0D\0e\0p\0o\0r\0t\0i\0s\0t\0a\0s\0_\0D\0e\0p\0o\0r\0t\0e\0s\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0X\0\0\0X\0\0\0W\0\0\0\0\0\0m\�m\0\0\0\0\0\0\0\0�\0\0\0\0\0Y\0\0\0Y\0\0\0\0\0\0\0F\0\0\0\0\'\0\0\0\0d\0b\0o\0\0\0F\0K\0_\0D\0e\0p\0o\0r\0t\0e\0s\0_\0D\0e\0t\0a\0l\0l\0e\0D\0e\0p\0o\0r\0t\0e\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0Z\0\0\0Z\0\0\0Y\0\0\0\0\0\0���\0\0\0\0\0\0\0\0�\0\0\0\0\0\\\0\0\0\\\0\0\0\0\0\0\0N\0\0\0joV\0\0\0d\0b\0o\0\0\0F\0K\0_\0M\0e\0n\0u\0P\0r\0i\0n\0c\0i\0p\0a\0l\0_\0A\0u\0s\0p\0i\0c\0i\0a\0d\0o\0r\0e\0s\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0]\0\0\0]\0\0\0\\\0\0\0\0\0\0��X��\0\0\0\0\0\0\0\0�\0\0\0\0^\0\0\0^\0\0\0\0\0\0\0N\0\0\0joV\0\0\0d\0b\0o\0\0\0F\0K\0_\0M\0e\0n\0u\0P\0r\0i\0n\0c\0i\0p\0a\0l\0_\0I\0n\0s\0t\0i\0t\0u\0c\0i\0o\0n\0a\0l\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0_\0\0\0_\0\0\0^\0\0\0\0\0\0\rm\�\rm\0\0\0\0\0\0\0\0�\0\0\0\0`\0\0\0`\0\0\0\0\0\0\0F\0\0\0\0\'\0\0\0\0d\0b\0o\0\0\0F\0K\0_\0C\0o\0m\0p\0r\0a\0_\0E\0n\0t\0r\0a\0d\0a\0_\0A\0s\0i\0e\0n\0t\0o\0s\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0a\0\0\0a\0\0\0`\0\0\0\0\0\0��X��\0\0\0\0\0\0\0\0�\0\0\0\0b\0\0\0b\0\0\0\0\0\0\0V\0\0\0\�t\0\0\0d\0b\0o\0\0\0F\0K\0_\0M\0e\0n\0u\0P\0r\0i\0n\0c\0i\0p\0a\0l\0_\0C\0o\0m\0i\0t\0e\0O\0r\0g\0a\0n\0i\0z\0a\0d\0o\0r\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0c\0\0\0c\0\0\0b\0\0\0\0\0\0��\���\0\0\0\0\0\0\0\0�\0\0\0\0d\0\0\0d\0\0\0\0\0\0\0>\0\0\0joV\0\0\0d\0b\0o\0\0\0F\0K\0_\0D\0e\0p\0o\0r\0t\0e\0s\0_\0R\0e\0g\0l\0a\0m\0e\0n\0t\0o\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0e\0\0\0e\0\0\0d\0\0\0\0\0\0�l\��l\0\0\0\0\0\0\0\0�\0\0\0\0f\0\0\0f\0\0\0\0\0\0\0F\0\0\0\0\'\0\0\0\0d\0b\0o\0\0\0F\0K\0_\0R\0e\0p\0o\0r\0t\0e\0E\0n\0t\0r\0a\0d\0a\0_\0D\0e\0p\0o\0r\0t\0e\0s\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0g\0\0\0g\0\0\0f\0\0\0\0\0\0���\0\0\0\0\0\0\0\0�\0\0\0\0h\0\0\0h\0\0\0\0\0\0\0H\0\0\0\0\'\0\0\0\0d\0b\0o\0\0\0F\0K\0_\0M\0e\0n\0u\0P\0r\0i\0n\0c\0i\0p\0a\0l\0_\0C\0e\0r\0e\0m\0o\0n\0i\0a\0s\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0i\0\0\0i\0\0\0h\0\0\0\0\0\0�\r��\r\0\0\0\0\0\0\0\0�\0\0\0\0j\0\0\0j\0\0\0\0\0\0\0@\0\0\0joV\0\0\0d\0b\0o\0\0\0F\0K\0_\0C\0o\0m\0p\0r\0a\0_\0E\0n\0t\0r\0a\0d\0a\0_\0S\0e\0d\0e\0s\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0k\0\0\0k\0\0\0j\0\0\0\0\0\0޽޽\0\0\0\0\0\0\0\0�\0\0\0\0l\0\0\0l\0\0\0\0\0\0\02\0\0\0\�\0\0\0d\0b\0o\0\0\0F\0K\0_\0E\0v\0e\0n\0t\0o\0s\0_\0S\0e\0d\0e\0s\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0m\0\0\0m\0\0\0l\0\0\0\0\0\0\�\�\0\0\0\0\0\0\0\0�\0\0\0\0t\0\0\0t\0\0\0\0\0\0\08\0\0\0\�\0\0\0d\0b\0o\0\0\0F\0K\0_\0R\0a\0n\0k\0i\0n\0g\0_\0M\0e\0d\0a\0l\0l\0a\0s\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0u\0\0\0u\0\0\0t\0\0\0\0\0\0\��\�\0\0\0\0\0\0\0\0�\0\0\0\0v\0\0\0v\0\0\0\0\0\0\0H\0\0\0\0\'\0\0\0\0d\0b\0o\0\0\0F\0K\0_\0D\0e\0p\0o\0r\0t\0e\0D\0e\0s\0t\0a\0c\0a\0d\0o\0_\0R\0a\0n\0k\0i\0n\0g\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0w\0\0\0w\0\0\0v\0\0\0\0\0\0\�\�\0\0\0\0\0\0\0\0�\0\0\0\0x\0\0\0x\0\0\0\0\0\0\0<\0\0\0joV\0\0\0d\0b\0o\0\0\0F\0K\0_\0T\0i\0p\0o\0S\0e\0d\0e\0s\0_\0D\0e\0p\0o\0r\0t\0e\0s\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0y\0\0\0y\0\0\0x\0\0\0\0\0\0\��\�\0\0\0\0\0\0\0\0�\0\0\0\0z\0\0\0z\0\0\0\0\0\0\0:\0\0\0joV\0\0\0d\0b\0o\0\0\0F\0K\0_\0M\0o\0n\0e\0d\0a\0_\0T\0i\0p\0o\0M\0o\0n\0e\0d\0a\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0{\0\0\0{\0\0\0z\0\0\0\0\0\0\��\�\0\0\0\0\0\0\0\0�\0\0\0\0|\0\0\0|\0\0\0\0\0\0\0F\0\0\0\0\'\0\0\0\0d\0b\0o\0\0\0F\0K\0_\0C\0o\0m\0p\0r\0a\0_\0E\0n\0t\0r\0a\0d\0a\0_\0U\0s\0u\0a\0r\0i\0o\0s\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0}\0\0\0}\0\0\0|\0\0\0\0\0\0\�\�\�\0\0\0\0\0\0\0\0�\0\0\0\0~\0\0\0~\0\0\0\0\0\0\0R\0\0\0\�t\0\0\0d\0b\0o\0\0\0F\0K\0_\0C\0o\0m\0p\0r\0a\0_\0E\0n\0t\0r\0a\0d\0a\0_\0H\0o\0r\0a\0r\0i\0o\0E\0v\0e\0n\0t\0o\0s\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\0\0\0~\0\0\0\0\0\0߽H߽\0\0\0\0\0\0\0\0�\0\0\0\0�\0\0\0�\0\0\0\0\0\0\0B\0\0\0\0\'\0\0\0\0d\0b\0o\0\0\0F\0K\0_\0C\0o\0m\0p\0r\0a\0_\0E\0n\0t\0r\0a\0d\0a\0_\0M\0o\0n\0e\0d\0a\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0�\0\0\0�\0\0\0�\0\0\0\0\0\0\�\�\0\0\0\0\0\0\0\0�\0\0\0\0�\0\0\0�\0\0\0\0\0\0\0R\0\0\0\�t\0\0\0d\0b\0o\0\0\0F\0K\0_\0C\0o\0m\0p\0r\0a\0_\0E\0n\0t\0r\0a\0d\0a\0_\0R\0e\0p\0o\0r\0t\0e\0E\0n\0t\0r\0a\0d\0a\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0�\0\0\0�\0\0\0�\0\0\0\0\0\0\�\�\0\0\0\0\0\0\0\0�\0\0\0\0�\0\0\0�\0\0\0\0\0\0\08\0\0\0\0\0\0\0\0\0d\0b\0o\0\0\0F\0K\0_\0R\0a\0n\0k\0i\0n\0g\0_\0D\0e\0p\0o\0r\0t\0e\0s\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0�\0\0\0�\0\0\0�\0\0\0\0\0\0߽߽\0\0\0\0\0\0\0\0�\0\0\0\0�\0\0\0�\0\0\0\0\0\0\0>\0\0\0joV\0\0\0d\0b\0o\0\0\0F\0K\0_\0R\0a\0n\0k\0i\0n\0g\0_\0D\0e\0p\0o\0r\0t\0i\0s\0t\0a\0s\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0�\0\0\0�\0\0\0�\0\0\0\0\0\0\�\�\�\0\0\0\0\0\0\0\0�\0\0\0\0�\0\0\0�\0\0\0\0\0\0\0L\0\0\0joV\0\0\0d\0b\0o\0\0\0F\0K\0_\0D\0e\0t\0a\0l\0l\0e\0E\0v\0e\0n\0t\0o\0s\0_\0D\0e\0p\0o\0r\0t\0i\0s\0t\0a\0s\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0�\0\0\0�\0\0\0�\0\0\0\0\0\0߽�߽\0\0\0\0\0\0\0\0�\0\0\0\0\�\0\0\0`\0\0\0\0\0\0\0\0\0p\0\0\0}\0\0\0\\\0\0\0\0\0\0\Z\0\0\0n\0\0\0m\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0C\0\0\0h\0\0\0\0\0\0\Z\0\0\0{\0\0\0�\0\0\0b\0\0\0\0\0\0\Z\0\0\0,\0\0\0\0\0\0=\0\0\0\0\0\0	\0\0\0�\0\0\0]\0\0\0�\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0x\0\0\0\0\0\0/\0\0\0i\0\0\0�\0\0\0f\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0W\0\0\0\0\0\0\0\0\0�\0\0\0v\0\0\0�\0\0\0\0\0\0\0\0\08\0\0\07\0\0\0�\0\0\0\0\0\0\0\0\0�\0\0\0�\0\0\0Y\0\0\0\r\0\0\0\0\0\0\0\0\0D\0\0\0\0\0\0\0\0\0\0\0\0h\0\0\0q\0\0\0C\0\0\0\0\0\0\0\0\0-\0\0\0&\0\0\0\0\0\0\0\0\0\0\0\0]\0\0\0%\0\0\0A\0\0\0\0\0\01\0\0\0�\0\0\0k\0\0\0Q\0\0\0\0\0\0\Z\0\0\0�\0\0\0\\\0\0\0~\0\0\0\0\0\0\0\0\0:\0\0\0\0\0\0M\0\0\0\0\0\0\0\0\0~\0\0\0a\0\0\0^\0\0\0\0\0\0\Z\0\0\0\0\0\0$\0\0\0t\0\0\0\0\0\0\0\0\0]\0\0\0n\0\0\0�\0\0\0\0\0\0\0\0\0\0\0\0[\0\0\0K\0\0\0\0\0\0\Z\0\0\0\0\0\0\'\0\0\0v\0\0\0\0\0\0\n\0\0\0\0\0\0\"\0\0\0d\0\0\0\0\0\0\0\0\0�\0\0\0]\0\0\0�\0\0\0\0\0\0\0\0\0e\0\0\0f\0\0\0G\0\0\0 \0\0\0\0\0\0n\0\0\0�\0\0\0\"\0\0\0!\0\0\0\0\0\0h\0\0\0�\0\0\0;\0\0\0$\0\0\0\0\0\0\"\0\0\0+\0\0\0&\0\0\0%\0\0\0\0\0\0\0\0\0\0\0\0\0I\0\0\0(\0\0\0\0\0\0\\\0\0\0u\0\0\0*\0\0\0)\0\0\0\0\0\0\0\0\0\0\0\0z\0\0\0,\0\0\0\0\0\0\0\0\07\0\0\09\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0E\0\0\0.\0\0\0\0\0\0]\0\0\0�\0\0\07\0\0\0/\0\0\06\0\0\0;\0\0\0.\0\0\0?\0\0\00\0\0\01\0\0\0 \0\0\0=\0\0\0|\0\0\01\0\0\0\0\0\0Z\0\0\0#\0\0\0S\0\0\01\0\0\0\0\0\0\�\0\0\0w\0\0\03\0\0\02\0\0\0\0\0\0F\0\0\0/\0\0\0O\0\0\05\0\0\0\n\0\0\0\\\0\0\0�\0\0\0U\0\0\05\0\0\0\0\0\0>\0\0\0\0\0\0l\0\0\06\0\0\0\0\0\0\0\0\0\0\0\0j\0\0\06\0\0\0\0\0\0Z\0\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0e\0=\04\00\09\06\0;\0A\0p\0p\0l\0i\0c\0a\0t\0i\0o\0n\0 \0N\0a\0m\0e\0=\0\"\0M\0i\0c\0r\0o\0s\0o\0f\0t\0 \0S\0Q\0L\0 \0S\0e\0r\0v\0e\0r\0 \0M\0a\0n\0a\0g\0e\0m\0e\0n\0t\0 \0S\0t\0u\0d\0i\0o\0\"\0\0\0\0�\0\0\0\0D\0i\0a\0g\0r\0a\0m\0_\0f\0i\0n\0a\0l\0\0\0\0&\0\0\0\0S\0e\0d\0e\0s\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\n\0\0\0P\0a\0i\0s\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\n\0\0\0H\0o\0r\0a\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0U\0s\0u\0a\0r\0i\0o\0s\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0T\0i\0p\0o\0U\0s\0u\0a\0r\0i\0o\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0T\0i\0p\0o\0S\0e\0d\0e\0s\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0$\0\0\0T\0i\0p\0o\0R\0e\0p\0r\0e\0s\0e\0n\0t\0a\0n\0t\0e\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\Z\0\0\0T\0i\0p\0o\0P\0r\0e\0g\0u\0n\0t\0a\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0T\0i\0p\0o\0M\0o\0n\0e\0d\0a\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0T\0i\0p\0o\0M\0e\0d\0a\0l\0l\0a\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0$\0\0\0T\0i\0p\0o\0I\0n\0s\0t\0i\0t\0u\0c\0i\0o\0n\0a\0l\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0T\0i\0p\0o\0C\0e\0r\0e\0m\0o\0n\0i\0a\0s\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0$\0\0\0T\0i\0p\0o\0A\0u\0s\0p\0i\0c\0i\0a\0d\0o\0r\0e\0s\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0S\0t\0o\0c\0k\0A\0s\0i\0e\0n\0t\0o\0s\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0R\0e\0p\0r\0e\0s\0e\0n\0t\0a\0n\0t\0e\0s\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0R\0e\0p\0o\0r\0t\0e\0E\0n\0t\0r\0a\0d\0a\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0R\0e\0g\0l\0a\0m\0e\0n\0t\0o\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0R\0a\0n\0k\0i\0n\0g\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0(\0\0\0P\0r\0e\0g\0u\0n\0t\0a\0s\0F\0r\0e\0c\0u\0e\0n\0t\0e\0s\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0M\0o\0n\0e\0d\0a\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0M\0e\0n\0u\0P\0r\0i\0n\0c\0i\0p\0a\0l\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0M\0e\0d\0a\0l\0l\0a\0s\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0I\0n\0s\0t\0i\0t\0u\0c\0i\0o\0n\0a\0l\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0H\0o\0r\0a\0r\0i\0o\0E\0v\0e\0n\0t\0o\0s\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0G\0a\0l\0e\0r\0i\0a\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0F\0e\0c\0h\0a\0E\0v\0e\0n\0t\0o\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0E\0v\0e\0n\0t\0o\0s\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0E\0s\0t\0a\0d\0o\0A\0s\0i\0e\0n\0t\0o\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0D\0e\0t\0a\0l\0l\0e\0E\0v\0e\0n\0t\0o\0s\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0D\0e\0t\0a\0l\0l\0e\0D\0e\0p\0o\0r\0t\0e\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0D\0e\0p\0o\0r\0t\0i\0s\0t\0a\0s\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0D\0e\0p\0o\0r\0t\0e\0s\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\"\0\0\0D\0e\0p\0o\0r\0t\0e\0D\0e\0s\0t\0a\0c\0a\0d\0o\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0 \0\0\0C\0o\0m\0p\0r\0o\0b\0a\0n\0t\0e\0P\0a\0g\0o\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0C\0o\0m\0p\0r\0a\0_\0E\0n\0t\0r\0a\0d\0a\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0$\0\0\0C\0o\0m\0i\0t\0e\0O\0r\0g\0a\0n\0i\0z\0a\0d\0o\0r\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0C\0e\0r\0e\0m\0o\0n\0i\0a\0s\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\"\0\0\0C\0a\0t\0e\0g\0o\0r\0i\0a\0A\0s\0i\0e\0n\0t\0o\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0A\0u\0s\0p\0i\0c\0i\0a\0d\0o\0r\0e\0s\0\0\0\0\0\0d\0b\0o\0\0\0\0$\0\0\0\0A\0s\0i\0e\0n\0t\0o\0s\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0օ	��k�E��7d�2p\0N\0\0\0{\01\06\03\04\0C\0D\0D\07\0-\00\08\08\08\0-\04\02\0E\03\0-\09\0F\0A\02\0-\0B\06\0D\03\02\05\06\03\0B\09\01\0D\0}\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0b�R');
/*!40000 ALTER TABLE `sysdiagrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoauspiciadores`
--

DROP TABLE IF EXISTS `tipoauspiciadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoauspiciadores` (
  `idTipoAuspiciador` int(11) NOT NULL,
  `NomAuspiciador` varchar(100) DEFAULT NULL,
  `imgAuspiciador` longblob,
  PRIMARY KEY (`idTipoAuspiciador`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoauspiciadores`
--

LOCK TABLES `tipoauspiciadores` WRITE;
/*!40000 ALTER TABLE `tipoauspiciadores` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipoauspiciadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoceremonias`
--

DROP TABLE IF EXISTS `tipoceremonias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoceremonias` (
  `idTipoCeremonias` int(11) NOT NULL,
  `NombreC` varchar(50) DEFAULT NULL,
  `ImagenTipoCeremonia` longblob,
  `descripcionTipoC` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idTipoCeremonias`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoceremonias`
--

LOCK TABLES `tipoceremonias` WRITE;
/*!40000 ALTER TABLE `tipoceremonias` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipoceremonias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoinstitucional`
--

DROP TABLE IF EXISTS `tipoinstitucional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoinstitucional` (
  `idTipoInstitucional` int(11) NOT NULL,
  `NombreInstitucional` varchar(50) DEFAULT NULL,
  `imgInstitucional` longblob,
  `DescripTipoInstitucional` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idTipoInstitucional`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoinstitucional`
--

LOCK TABLES `tipoinstitucional` WRITE;
/*!40000 ALTER TABLE `tipoinstitucional` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipoinstitucional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipomedalla`
--

DROP TABLE IF EXISTS `tipomedalla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipomedalla` (
  `idTipoMedalla` int(11) NOT NULL,
  `NombreTipoM` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idTipoMedalla`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipomedalla`
--

LOCK TABLES `tipomedalla` WRITE;
/*!40000 ALTER TABLE `tipomedalla` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipomedalla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipomoneda`
--

DROP TABLE IF EXISTS `tipomoneda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipomoneda` (
  `idTipoMoneda` int(11) NOT NULL,
  `DescripcionTipoMoneda` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idTipoMoneda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipomoneda`
--

LOCK TABLES `tipomoneda` WRITE;
/*!40000 ALTER TABLE `tipomoneda` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipomoneda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiporepresentante`
--

DROP TABLE IF EXISTS `tiporepresentante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiporepresentante` (
  `idTipoRepresentante` int(11) NOT NULL,
  `NombreR` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idTipoRepresentante`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiporepresentante`
--

LOCK TABLES `tiporepresentante` WRITE;
/*!40000 ALTER TABLE `tiporepresentante` DISABLE KEYS */;
INSERT INTO `tiporepresentante` VALUES (1,'CARLOS NEUHAUS'),(2,'EDUARDO GONZALES CHAVEZ'),(3,'ALEJANDRO GILBERT MORENO BOCANEGRA'),(4,'FERNANDO PERERA DIAZ'),(5,'DANTE JOSÉ MANDRIATTI CASTRO'),(6,'PEDRO DEL ROSARIO DELGADO'),(7,'JORGE BARRERA ZEGARRA'),(8,'VICTOR ASPILLAGA ALAYZA'),(9,'KARLA AYALA DE LA CASAS'),(10,'JOSÉ MANUEL GIRAU MENDOZA'),(11,'SUSANA VICTORIA CÓRDOVA AVILA'),(12,'THOMAS BACH'),(13,'LUISA VILLAR GÁLVEZ');
/*!40000 ALTER TABLE `tiporepresentante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipousuario`
--

DROP TABLE IF EXISTS `tipousuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipousuario` (
  `idTipoUsuario` int(11) NOT NULL,
  `nombreTipoU` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idTipoUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipousuario`
--

LOCK TABLES `tipousuario` WRITE;
/*!40000 ALTER TABLE `tipousuario` DISABLE KEYS */;
INSERT INTO `tipousuario` VALUES (1,'Usuario'),(2,'Administrador'),(3,'Sponsor');
/*!40000 ALTER TABLE `tipousuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabajaconnosotros`
--

DROP TABLE IF EXISTS `trabajaconnosotros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trabajaconnosotros` (
  `idtrabajaConNosotros` int(11) NOT NULL AUTO_INCREMENT,
  `tra_desc` text NOT NULL,
  `tra_imagen` varchar(50) NOT NULL,
  `tra_fecha` date NOT NULL,
  `bEstPri` bit(1) NOT NULL,
  PRIMARY KEY (`idtrabajaConNosotros`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabajaconnosotros`
--

LOCK TABLES `trabajaconnosotros` WRITE;
/*!40000 ALTER TABLE `trabajaconnosotros` DISABLE KEYS */;
INSERT INTO `trabajaconnosotros` VALUES (1,'TRABAJA CON NOSOTROS: Las personas que cumplan con los requisitos especificados en las bases de la Convocatoria, deberán enviar la documentación de acuerdo a las indicaciones brindadas en el cronograma de los Procesos de Selección, publicados por la Oficina de Personal de los Juegos.','vista/mgc/img/trabaja.jpg','2019-05-17','');
/*!40000 ALTER TABLE `trabajaconnosotros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidadorganizacional`
--

DROP TABLE IF EXISTS `unidadorganizacional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidadorganizacional` (
  `idUnidadOrganizacional` int(11) NOT NULL AUTO_INCREMENT,
  `U_nombre` varchar(100) NOT NULL,
  `idSecUniOrgFK` int(11) NOT NULL,
  PRIMARY KEY (`idUnidadOrganizacional`),
  KEY `idSecUniOrgFK` (`idSecUniOrgFK`),
  CONSTRAINT `unidadorganizacional_ibfk_1` FOREIGN KEY (`idSecUniOrgFK`) REFERENCES `oficinasorganigrama` (`idSecretaria`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidadorganizacional`
--

LOCK TABLES `unidadorganizacional` WRITE;
/*!40000 ALTER TABLE `unidadorganizacional` DISABLE KEYS */;
INSERT INTO `unidadorganizacional` VALUES (1,'Unidad de Enlace y Coordinación del Soporte Internacional',1),(2,'Unidad Logística',2),(3,'Unidad Tesorería',2),(4,'Unidad de Presupuesto',7),(5,'Unidad de Planeamiento y modernización',7),(6,'Subdirección de Implementación Temporal para la Entrega de Sedes',11),(7,'Subdirección de Integración operativa',11),(8,'Subdirección de obras',12),(9,'Subdirección de Recepción, Liquidación y Transferencias de Obras',12),(10,'Subdirección de Deportes',13),(11,'Subdirección de Gestión de Sedes',13),(12,'Subdirección de Relaciones Internacionales y Protocolo Deportivo',13),(13,'Subdirección de Gestión de Villas',13),(14,'Subdirección de Transporte y Seguridad',13),(15,'Subdirección de Servicios a los Juegos y Servicios Médicos',13),(16,'Subdirección de Desarrollo Tecnológico',14),(17,'Subdirección de Transmisiones',14),(18,'Subdirección de Comunicaciones, Prensa y Ceremonias',15),(19,'Subdirección de Comercialización y Mercadotecnia',15);
/*!40000 ALTER TABLE `unidadorganizacional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `NombreU` varchar(50) DEFAULT NULL,
  `ApellidoU` varchar(50) DEFAULT NULL,
  `emailU` varchar(50) DEFAULT NULL,
  `telefonoU` varchar(20) DEFAULT NULL,
  `passwordU` varchar(40) DEFAULT NULL,
  `DocIdentidad` varchar(20) DEFAULT NULL,
  `idTipoUsuario` int(11) DEFAULT NULL,
  `idGaleria` int(11) DEFAULT NULL,
  `idEstadoUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `FK_Usuarios_Galeria` (`idGaleria`),
  KEY `FK_Usuarios_TipoUsuario` (`idTipoUsuario`),
  CONSTRAINT `FK_Usuarios_Galeria` FOREIGN KEY (`idGaleria`) REFERENCES `galeria` (`idGaleria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Usuarios_TipoUsuario` FOREIGN KEY (`idTipoUsuario`) REFERENCES `tipousuario` (`idTipoUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Cesar','Arriola Chuco','46988257@continental.edu.pe','938219839','123456','46988257',2,NULL,0);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vision`
--

DROP TABLE IF EXISTS `vision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vision` (
  `idVision` int(11) NOT NULL AUTO_INCREMENT,
  `vi_desc` text NOT NULL,
  `vi_imagen` varchar(50) NOT NULL,
  `vi_fecha` date NOT NULL,
  `bEstPri` bit(1) NOT NULL,
  PRIMARY KEY (`idVision`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vision`
--

LOCK TABLES `vision` WRITE;
/*!40000 ALTER TABLE `vision` DISABLE KEYS */;
INSERT INTO `vision` VALUES (1,'VISIÓN: Excelente organización de los XVIII Juegos Panamericanos y Juegos Parapanamericanos del 2019, contribuyendo con el desarrollo del deporte nacional y el posicionamiento internacional de la ciudad de Lima.','vista/mgc/img/vision.jpg','2019-05-17','');
/*!40000 ALTER TABLE `vision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_tecnoserv'
--
/*!50003 DROP PROCEDURE IF EXISTS `mgc_conocenos_sp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_conocenos_sp`()
BEGIN
SELECT co_desc AS descripcion, co_imagen AS rutaImagen FROM vision WHERE co_fecha = fechaActual;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mgc_delete_medalleroHistorico_SP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_delete_medalleroHistorico_SP`(idmed INT)
BEGIN
DELETE FROM medallerohistorico
WHERE idmedHis_PK = idmed;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mgc_insertar_confSedeDeporte_SP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_insertar_confSedeDeporte_SP`(sede INT, deporte INT)
BEGIN
INSERT INTO config_sede_deporte(idSedeFK, idDeporteFK)
VALUES(sede, deporte);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mgc_insertar_Equipo_SP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_insertar_Equipo_SP`(codigoPais INT, numeroIntegrantes INT)
BEGIN
INSERT INTO equipo(idPaisFK,totalIntegrantes)
VALUES(codigoPais, numeroIntegrantes);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mgc_insertar_eventos_SP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_insertar_eventos_SP`(sede INT, horario INT, dir VARCHAR(100), depFK INT, confSedeDeporte INT)
BEGIN
INSERT INTO eventos(idSede, idHorarioEventos, direccion, idDeportesFK, idConfig_Sede_DeporteFK)
VALUES(sede, horario, dir, depFK, confSedeDeporte);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mgc_insertar_integrantes_SP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_insertar_integrantes_SP`(equifk INT, depFK INT)
BEGIN
INSERT INTO eventos(idEquipoFK, idDeportistasFK)
VALUES(equifk, depFK);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mgc_insertar_medalleroHistorico_SP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_insertar_medalleroHistorico_SP`(puesto INT, pais INT, oro INT, plata INT, bronce INT, total INT)
BEGIN
INSERT INTO medallerohistorico(medHisPue, pai_FK, medHisOro, medHisPla, medHisBro, medHisTot)
VALUES(puesto, pais, oro, plata, bronce, total);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mgc_insertar_participanteGrupal_SP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_insertar_participanteGrupal_SP`(idEve INT, idEq1 INT, idEq2 INT)
BEGIN
INSERT INTO participantegrupal(idEventoFK, idEquipo1FK, idEquipo2FK)
VALUES(idEve, idEq1, idEq2);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mgc_insertar_participanteIndividual_SP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_insertar_participanteIndividual_SP`(idDepIndividual INT, idPaFK INT, idEvFK INT)
BEGIN
INSERT INTO participanteindividual(idDeportistasFK, idPaisFk, idEventoFK)
VALUES(idDepIndividual, idPaFK, idEvFK);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mgc_insertar_reglamento_SP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_insertar_reglamento_SP`(numSeccion INT, tituloSecc VARCHAR(255), norma INT, subnorma INT)
BEGIN
INSERT INTO seccionreglamento(numSec, titsec, normaFK, subNorFK)
VALUES(numSeccion, tituloSecc, norma, subnorma);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mgc_insertar_resultadoGrupal_SP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_insertar_resultadoGrupal_SP`(idParticipanteGrupal INT, resultadoPuesto VARCHAR(25))
BEGIN
INSERT INTO resultadogrupal(idPartGrupalFK, res_gr_puesto)
VALUES (idParticipanteGrupal, resultadoPuesto);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mgc_insertar_resultadoIndividual_SP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_insertar_resultadoIndividual_SP`(idparticipanteIndividual INT, resultadoPuesto VARCHAR(25))
BEGIN
INSERT INTO resultadoindividual(idPartIndividualFK,fechaResultado,res_in_puesto)
VALUES (idparticipanteIndividual,NOW(),resultadoPuesto);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mgc_listarNorma_SP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_listarNorma_SP`(id INT)
SELECT
N.idNormaPK AS codigo,
N.numNor AS numeroNorma,
N.contNor AS contenido
FROM
norma AS N
WHERE
N.SecRegFK = id ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mgc_listarPais_SP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_listarPais_SP`()
BEGIN
SELECT
P.idPais AS codigo,
P.NombrePais AS pais
FROM
pais AS P;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mgc_listarSeccion_SP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_listarSeccion_SP`()
BEGIN
SELECT
SR.TitSec AS seccion,
SR.idSecRegPK codigo
FROM
seccionreglamento AS SR;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mgc_listarSubnorma_SP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_listarSubnorma_SP`(id INT)
SELECT
SN.idSubNor AS codigo,
SN.numSubNor AS numeroSubnorma,
SN.contSubNor AS contenido
FROM
subnorma AS SN
WHERE
SN.normaFK = id ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mgc_mostrarConocenos_sp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_mostrarConocenos_sp`()
BEGIN
SELECT
C.co_desc AS descripcion,
C.co_imagen AS rutaImagen
FROM
conocenos AS C
WHERE
C.bEstPri = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mgc_mostrarMedalleroPorId_SP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_mostrarMedalleroPorId_SP`(id INT)
BEGIN
SELECT
MH.idmedHis_PK AS codigo,
MH.medHisPue AS puesto,
MH.pai_FK AS pais,
MH.medHisOro AS oro,
MH.medHisPla AS plata,
MH.medHisBro AS bronce,
MH.medHisTot AS total
FROM
medallerohistorico AS MH
WHERE MH.idmedHis_PK = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mgc_mostrarMision_sp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_mostrarMision_sp`()
BEGIN
SELECT
M.mi_desc AS descripcion,
M.mi_imagen AS rutaImagen
FROM
mision AS M
WHERE
M.bEstPri = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mgc_mostrarOficinasOrganigrama_sp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_mostrarOficinasOrganigrama_sp`()
BEGIN
	SELECT
		OO.idSecretaria AS codigo,
		OO.se_nombre AS oficina,
		OO.se_tipo AS tipo
	FROM
		oficinasorganigrama AS OO;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mgc_mostrarParticipantesEvento_SP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_mostrarParticipantesEvento_SP`(idEvento INT)
SELECT
PI.idPartIndividual AS codigo,
D.Nombre_Deportista AS nombreDeportista,
DE.NombDeporte AS deporte
FROM
participanteindividual AS PI
INNER JOIN deportistas AS D ON PI.idDeportistasFK = D.idDeportistas
INNER JOIN deportes AS DE ON D.idDeporte = DE.idDeporte
WHERE
PI.idEventoFK = idEvento ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mgc_mostrarSedeEvento_SP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_mostrarSedeEvento_SP`()
SELECT
E.idEvento AS codigo,
CONCAT(DE.NombDeporte , '-' , S.NombreSede) AS evento
FROM
eventos AS E
INNER JOIN deportes AS DE ON E.idDeportesFK = DE.idDeporte
INNER JOIN sedes AS S ON E.idSede = S.idSede ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mgc_mostrarTrabajaConNosotros_sp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_mostrarTrabajaConNosotros_sp`()
BEGIN
SELECT
T.tra_desc AS descripcion,
T.tra_imagen AS rutaImagen
FROM
trabajaconnosotros AS T
WHERE
T.bEstPri = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mgc_mostrarUnidadesOrganigrama_sp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_mostrarUnidadesOrganigrama_sp`(IN CODIGOOFICINA INT)
BEGIN
	SELECT
		OO.se_tipo AS tipo,
		UO.U_nombre AS unidad
	FROM
		oficinasorganigrama AS OO
	INNER JOIN unidadorganizacional AS UO ON UO.idSecUniOrgFK = OO.idSecretaria
	WHERE
		OO.idSecretaria = CODIGOOFICINA;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mgc_mostrarVision_sp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_mostrarVision_sp`()
BEGIN
SELECT
V.vi_desc AS descripcion,
V.vi_imagen AS rutaImagen
FROM
vision AS V
WHERE
V.bEstPri = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mgc_mostrar_medalleroHistorico_SP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_mostrar_medalleroHistorico_SP`()
SELECT
MH.medHisPue AS puesto,
MH.medHisOro AS medallaOro,
MH.medHisPla AS medallaPlata,
MH.medHisBro AS medallaBronce,
MH.medHisTot AS medallaTotal,
P.BanderaPais AS bandera,
P.NombrePais AS pais,
MH.idmedHis_PK AS codigo
FROM
medallerohistorico AS MH
INNER JOIN pais AS P ON MH.pai_FK = P.idPais ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mgc_mostrar_Reglamento_SP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_mostrar_Reglamento_SP`()
BEGIN
SELECT
SR.TitSec AS tituloSeccion,
N.contNor AS contenidoNorma,
SN.contSubNor AS subContenidoNorma
FROM
seccionreglamento AS SR
INNER JOIN norma AS N ON N.SecRegFK = SR.idSecRegPK
INNER JOIN subnorma AS SN ON SN.normaFK = N.idNormaPK;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mgc_preguntasFrecuentes_SP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_preguntasFrecuentes_SP`()
BEGIN
SELECT
PFA.nomAre,
PF.pregResCont
FROM
pregfrecareas AS PFA
INNER JOIN preguntasfrecuentes AS PF ON PF.idAreaPreFreFK = PFA.idareaPreFrePK;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mgc_registrarMision_sp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_registrarMision_sp`(IN descripcion text(400),imagen nvarchar(50))
BEGIN
insert into mision (mi_desc,mi_imagen,mi_fecha) values(descripcion,imagen,NOW());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mgc_trabajaConNosotros_sp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_trabajaConNosotros_sp`(IN fechaActual DATE)
BEGIN
SELECT tra_desc AS descripcion, tra_imagen AS rutaImagen FROM vision WHERE tra_fecha = fechaActual;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mgc_update_medalleroHistorico_SP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_update_medalleroHistorico_SP`(idmed INT, puesto INT, pais INT, oro INT, plata INT, bronce INT, total INT)
BEGIN
UPDATE medallerohistorico
SET  medHisPue = puesto, pai_FK = pais, medHisOro = oro, medHisPla = plata, medHisBro = bronce, medHisTot = total
WHERE idmedHis_PK = idmed;
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

-- Dump completed on 2019-06-13 23:48:33
