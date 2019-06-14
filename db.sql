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
INSERT INTO `deportes` VALUES (1,'Futbol',NULL,NULL),(2,'Atletismo',NULL,NULL),(3,'B√°dminton',NULL,NULL),(4,'Baloncesto',NULL,NULL),(5,'Boxeo',NULL,NULL),(6,'Ciclismo de Pista',NULL,NULL),(7,'Ciclismo de Ruta',NULL,NULL),(8,'Gimnasia Ritmica',NULL,NULL),(9,'Golf',NULL,NULL),(10,'Judo',NULL,NULL);
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
INSERT INTO `norma` VALUES (1,1,'1.  Establecer las reglas a trav√©s de las cuales se cumpla, estrictamente, todo lo relativo a la organizaci√≥n de los Juegos Panamericanos.',1),(2,2,'2.  Definir los aspectos organizativos, t√©cnicos y de log√≠stica general que debe cumplirse, tanto en la etapa preparatoria como durante el desarrollo de los Juegos Panamericanos.',1),(3,3,'3.  Controlar y asegurar que el Comit√© Organizador cumpla sus obligaciones y garantice las condiciones adecuadas, desde el punto de vista material, organizativo y t√©cnico, para que los Juegos Panamericanos se desarrollen exitosamente,	en	beneficio	de	los	atletas	y	de	los	Miembros	de	la	Odepa.\r\n',1),(4,4,'4.  Establecer un marco adecuado para la coordinaci√≥n entre todos los factores que	participan	en	la	organizaci√≥n	de	los	Juegos,	definiendo	y	armonizando	las	responsabilidades	de	cada	una	de	las	partes,	en	inter√©s	y	en	beneficio	de	los	propios Juegos, de los atletas y dem√°s participantes.\r\n',1),(5,5,'5.  Respetar los principios generales establecidos por el Comit√© Ol√≠mpico Internacional para la organizaci√≥n de los Juegos Ol√≠mpicos y adoptar su aplicaci√≥n, cuando resulte conveniente, en el √°mbito de los Juegos Panamericanos, particularmente	lo	que	se	refiere	al	concepto	organizativo,	las	reglas	t√©cnicas	para cada deporte, la lucha contra el dopaje, el juego limpio, el esp√≠ritu humanista y solidario, el respeto al medio ambiente y la promoci√≥n de la imagen ol√≠mpica que debe caracterizar a los Juegos Panamericanos, reconociendo, en todo momento, que la Organizaci√≥n Deportiva Panamericana es la m√°xima autoridad sobre cualquier cuesti√≥n relativa a los Juegos Panamericanos.',1),(6,6,'6.  Asegurar que el Reglamento sea respetado por los Miembros de la Odepa, sus atletas	y	oficiales	representantes	y	por	el	Comit√©	Organizador;	as√≠	como,	por	las Federaciones Internacionales y/o Confederaciones Deportivas Panamericanas u organizaciones deportivas con similares funciones y cualquier otro participante debidamente acreditado en los Juegos Panamericanos. ',1),(7,1,'1.  La Comisi√≥n T√©cnica de la Odepa preparar√° un Proyecto de Programa Deportivo de los Juegos para su aprobaci√≥n por el Comit√© Ejecutivo de la Odepa, a	fin	de	que	sea	entregado	a	las	ciudades	candidatas	a	organizar	los	Juegos	Panamericanos,	una	vez	que	comience	el	proceso	de	candidatura,	con el fin de que dichas ciudades puedan evaluar las posibilidades de llevarlo a cabo en su totalidad.',2),(8,2,'2.  Una vez que la Odepa haya elegido la ciudad que organizar√° los Juegos, la Comisi√≥n T√©cnica de la Odepa tendr√° la responsabilidad de presentar una propuesta al Comit√© Ejecutivo de la Odepa sobre los deportes, disciplinas y eventos que se recomienda incluir en el Programa de los Juegos Panamericanos. Dicha propuesta ser√° elaborada en coordinaci√≥n con el Comit√© Organizador, el Miembro de la Odepa sede de los Juegos y las Confederaciones Deportivas Panamericanas y/o Federaciones Internacionales. La Comisi√≥n T√©cnica someter√° el Proyecto del Programa de los Juegos Panamericanos al Comit√© Ejecutivo de la Odepa para su aprobaci√≥n',2),(9,3,'3.  El Proyecto de Programa de los Juegos Panamericanos tendr√° como base los siguientes aspectos:',2),(10,4,'4.  El Programa incluir√° los deportes considerados en el Programa de los siguientes Juegos Ol√≠mpicos y que actualmente son:',2),(11,5,'5.  Para que un deporte no ol√≠mpico sea elegible para formar parte del Programa de los Juegos Panamericanos, su Federaci√≥n Internacional debe ser reconocida por la Odepa; al menos veinte (20) Miembros de la Odepa deber√°n reconocer a su correspondiente Federaci√≥n Nacional y el Estatuto de la Confederaci√≥n Deportiva Panamericana y la Federaci√≥n Internacional deben presentarse a la Comisi√≥n T√©cnica de la Odepa, junto con una descripci√≥n detallada de las actividades de su deporte en Am√©rica. La Comisi√≥n T√©cnica de la Odepa revisar√° estos documentos y har√° una recomendaci√≥n al Comit√© Ejecutivo de la Odepa.',2),(12,1,'1.  Las competencias deportivas de los Juegos Panamericanos ser√°n consideradas oficiales siempre que, al	menos noventa (90)	d√≠as	antes	del	comienzo	de	los	Juegos	Panamericanos, las inscripciones num√©ricas finales hayan sido hechas y se cumplan las siguientes condiciones:',3),(13,2,'2.  Si las condiciones m√≠nimas establecidas en el numeral (1) no han sido cumplidas	al momento en que las inscripciones finales sean requeridas por nombre (de 15 a 21 d√≠as antes de la inauguraci√≥n de los Juegos), el deporte, la disciplina o la prueba no se realizar√° y el Comit√© Organizador, previa consulta con la Odepa, notificar√°	la decisi√≥n a los CON inscritos, dentro de las 4 horas posteriores a la toma de la decisi√≥n.',3),(14,1,'1.  Para participar en los Juegos Panamericanos, un competidor es elegible si est√° dispuesto a observar, acatar y cumplir el Estatuto de la Odepa y el Reglamento de los Juegos Panamericanos; as√≠ como, los reglamentos de su Comit√© Ol√≠mpico Nacional y de la Federaci√≥n Internacional y/o Confederaci√≥n Deportiva Panamericana del deporte que representa.',4),(15,2,'2.  No existen l√≠mites de edad para los competidores en los Juegos Panamericanos, excepto cuando haya sido previamente aprobado y notificado a la	 Odepa por la Federaci√≥n Internacional y/o Confederaci√≥n Panamericana que gobierna un deporte espec√≠fico.',4),(16,3,'3.  El Estatuto de la Odepa en su Art√≠culo XXII, ac√°pites 4 y 5, sobre la nacionalidad de los atletas participantes en los Juegos Panamericanos, establece que: (4) ‚ÄúTodo competidor que posea simult√°neamente la nacionalidad de dos o m√°s pa√≠ses podr√° representar a uno de ellos de su elecci√≥n. Sin embargo, despu√©s de haber representado a un pa√≠s en los Juegos Panamericanos, en campeonatos mundiales o regionales reconocidos por una Confederaci√≥n Deportiva Panamericana competente, no podr√° representar a otro pa√≠s, a menos que satisfaga las condiciones previstas en el p√°rrafo 5 m√°s abajo, aplicables a las personas que hayan cambiado de nacionalidad o adquirido una nueva.',4),(17,1,'1.  Sobre la inscripci√≥n de los atletas en los Juegos Panamericanos el Estatuto de la Odepa, en su Art√≠culo XXII, ac√°pites 6, 7 y 8, establece lo siguiente: (6) ‚ÄúSolo los Miembros de la Odepa podr√°n inscribir competidores en los Juegos	Panamericanos.	El	derecho	de	aceptar	definitivamente	las	inscripciones	corresponde al Comit√© Ejecutivo de la Odepa.‚Äù (7) ‚ÄúLos miembros de la Odepa solo ejercer√°n este derecho sobre la base de las recomendaciones de inscripci√≥n formuladas por sus federaciones nacionales. Si el Miembro de la Odepa las aprueba, transmitir√° estas inscripciones al Comit√© Organizador, que tendr√° la obligaci√≥n de acusar recibo. Cada Miembro de la Odepa deber√° investigar la validez de las inscripciones propuestas por las federaciones nacionales y asegurarse de que ning√∫n candidato ha sido rechazado por razones raciales, religiosas o pol√≠ticas o como consecuencia de cualquier otra forma de discriminaci√≥n.‚Äù (8) ‚ÄúLa participaci√≥n en los Juegos Panamericanos implica para todo competidor, el compromiso de respetar las disposiciones contenidas en el Estatuto de la Odepa, el Reglamento de los Juegos Panamericanos y los Reglamentos T√©cnicos de cada deporte. El Miembro de la Odepa que inscribe a un competidor asegura, bajo su responsabilidad, que dicho competidor tiene plena conciencia de su compromiso de respetar el Estatuto de la Odepa, el Reglamento de los Juegos Panamericanos y el C√≥digo Mundial Antidopaje.',5),(18,2,'2.  El Comit√© Organizador de los Juegos Panamericanos enviar√° los formularios oficiales	de	inscripci√≥n,	a	los	Miembros	de	la	Odepa,	como	m√≠nimo	seis	(6)	meses antes de la fecha de inauguraci√≥n de los Juegos Panamericanos. Los formularios de inscripci√≥n deber√°n especificar todas las disciplinas y prueba de cada deporte que han sido incluidas en el Programa de los Juegos Panamericanos.',5),(19,1,'1.  Las protestas o reclamaciones relacionadas con la elegibilidad de un competidor, deber√°n ser presentadas, por su Jefe de Misi√≥n o el representante de este, junto con un dep√≥sito de $100.00 USD (cien d√≥lares), al Comit√© Ejecutivo de la Odepa, el que decidir√° sobre el asunto. El Comit√© Ejecutivo de la Odepa podr√° actuar con la presencia de un m√≠nimo de tres de sus miembros. El an√°lisis de los casos tendr√° en cuenta lo siguiente:',6),(20,2,'2.  Las protestas sobre asuntos t√©cnicos realizadas, de acuerdo a las Reglas de las Federaciones Internacionales, ser√°n dirigidas a la autoridad actuante, Juez o √Årbitro, de acuerdo a la nomenclatura utilizada en cada deporte, quien, en coordinaci√≥n con la Federaci√≥n Internacional y/o Confederaci√≥n Deportiva Panamericana, decidir√° en primera instancia. La decisi√≥n puede ser recurrida ante el Jurado de Apelaciones, actuante en el deporte en cuesti√≥n, de acuerdo a las reglas del deporte correspondiente.',6),(21,1,'1.  Solo los competidores, as√≠ como el personal m√©dico y param√©dico y oficiales de equipo, de acuerdo a las cuotas aprobadas y que realicen servicios esenciales para los competidores, inscritos por su correspondiente CON, ser√°n alojados en la Villa Panamericana.',7),(22,2,'2.  Las cuotas para oficiales de equipo alojados en la Villa Panamericana, para cada Miembro de la Odepa, son fijadas por el Comit√© Ejecutivo de la Odepa y no podr√°n exceder el cuarenta por ciento (40%) del n√∫mero de competidores inscritos por cada Miembro de la Odepa.',7),(25,3,'3.  Los oficiales de competencia	(√°rbitros,	jueces, cronometristas, inspectores y otro personal t√©cnico reglamentario) deber√°n ser designados por la Federaci√≥n Internacional y/o Confederaci√≥n Deportiva Panamericana respectiva, seg√∫n sus reglamentos y de acuerdo con la retroalimentaci√≥n y transporte local durante los Juegos Panamericanos y, en el caso que est√© establecido, honorarios para dichos	oficiales	de	competencia,	son	responsabilidad	del	Comit√©	Organizador.',7),(26,1,'1.  Villa Panamericana:',8);
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
INSERT INTO `oficinasorganigrama` VALUES (1,'Secreterar√≠a Ejecutiva',''),(2,'Oficina de Administraci√≥n',''),(3,'Oficina de Recursos Humanos',''),(4,'Oficina de Voluntariado',''),(5,'Oficina de Acreditaci√≥n',''),(6,'Oficina de Asesor√≠a Jur√≠dica',''),(7,'Oficina de Planeamiento, Presupuesto y Modernizaci√≥n',''),(8,'Oficina de Coordinaci√≥n de Riesgos y Legado',''),(10,'Direcci√≥n Ejecutiva','\0'),(11,'Direcci√≥n de Integraci√≥n','\0'),(12,'Direcci√≥n de Proyectos e Infraestructura Definitiva','\0'),(13,'Direcci√≥n de Operaciones','\0'),(14,'Direcci√≥n de Desarrollo Tecnol√≥gico y Transmisiones','\0'),(15,'Direcci√≥n de Comunicaciones','\0');
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
INSERT INTO `pais` VALUES (1,'Estados Unidos','C:\\xampp\\htdocs\\WEPLAY\\vista\\mgc\\img\\banderas\\estadosUnidos.jpg'),(2,'Cuba','C:\\xampp\\htdocs\\WEPLAY\\vista\\mgc\\img\\banderas\\cuba.jpg'),(3,'Canad√°','C:\\xampp\\htdocs\\WEPLAY\\vista\\mgc\\img\\banderas\\canada.jpg'),(4,'Brasil','C:\\xampp\\htdocs\\WEPLAY\\vista\\mgc\\img\\banderas\\brasil.jpg'),(5,'Argentina','C:\\xampp\\htdocs\\WEPLAY\\vista\\mgc\\img\\banderas\\argentina.jpg'),(6,'Mexico','C:\\xampp\\htdocs\\WEPLAY\\vista\\mgc\\img\\banderas\\mexico.jpg'),(7,'Colombia',' C:\\xampp\\htdocs\\WEPLAY\\vista\\mgc\\img\\banderas\\colombia.jpg'),(8,'Venezuela','C:\\xampp\\htdocs\\WEPLAY\\vista\\mgc\\img\\banderas\\venezuela.jpg'),(9,'Chile','C:\\xampp\\htdocs\\WEPLAY\\vista\\mgc\\img\\banderas\\chile.jpg'),(10,'Rep√∫blica Dominicana','C:\\xampp\\htdocs\\WEPLAY\\vista\\mgc\\img\\banderas\\republicaDominicana.jpg'),(11,'Puerto Rico','C:\\xampp\\htdocs\\WEPLAY\\vista\\mgc\\img\\banderas\\puertoRico.jpg'),(12,'Ecuador',NULL),(13,'Jamaica',NULL),(14,'Guatemala',NULL),(15,'Uruguay',NULL),(16,'Trinidad y Tobago',NULL),(17,'Bahamas',NULL),(18,'Per√∫',NULL),(19,'Antillas Neerlandesas',NULL),(20,'Costa Rica',NULL),(21,'Panam√°',NULL),(22,'Surinam',NULL),(23,'Guyana',NULL),(24,'El Salvador',NULL),(25,'Bermudas',NULL),(26,'Islas Caim√°n',NULL),(27,'Antigua y Barbuda',NULL),(28,'Santa Luc√≠a',NULL),(29,'Nicaragua',NULL),(30,'Islas Virgenes de los Estados Unidos',NULL),(31,'Barbados',NULL),(32,'Hait√≠',NULL),(33,'Dominica',NULL),(34,'San Crist√≥bal Y Nieves',NULL),(35,'Paraguay',NULL),(36,'Bolivia',NULL),(37,'Honduras',NULL),(38,'Granada',NULL),(39,'Belice',NULL),(40,'San Vicente y las Granadinas',NULL),(41,'Aruba',NULL),(42,'Islas Virgenes Brit√°nicas',NULL);
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
INSERT INTO `preguntasfrecuentes` VALUES (1,'1. ¬øCu√°ndo se llevar√°n a cabo los Juegos Panamericanos?\r\nLos Juegos se llevar√°n a cabo desde el 26 de julio al 11 de agosto. ',1),(2,'2. ¬øCu√°ntos deportes y disciplinas tendr√°n los Juegos Panamericanos? Los Juegos Panamericanos contar√°n con 39 deportes y 61 disciplinas. ',1),(3,'3. ¬øCu√°ntos deportistas participar√°n en los Juegos Panamericanos?\r\nEn los Juegos Panamericanos participar√°n 6680 deportistas. ',1),(4,'4. ¬øCu√°ntas delegaciones participar√°n en los Juegos Panamericanos?\r\nParticipar√°n 41 delegaciones en los Juegos Panamericanos.',1),(5,'1. ¬øCu√°ntos voluntarios podr√°n participar en los jeugos Panamericanos Lima 2019? Necesitamos 12mil voluntarios y voluntarias para los XVIII Juegos Panamericanos. La convocatoria de voluntarios y voluntarias estar√° abierta a nivel ancional e internacional.',2),(6,'2. ¬øHay un l√≠mite de edad?\r\nLos l√≠mites los pones t√∫. Solo debes ser mayor de 16 a√±os al 01 de abril de 2019, d√≠a en el cual se da inicio a las actividades previas de los Juegos Panamericanos. ',2),(7,'3. ¬øLas personas con discapacidad pueden participar en el programa de Voluntariado?\r\n¬°Te necesitamos! Esperamos que las personas con discapacidad participen en los Juegos Panamericanos y/o en los Juegos Parapanamericanos. ',2),(8,'4. Si soy extranjero, ¬øtambi√©n puedo ser voluntario o voluntaria de los Juegos Panamericanos Lima 2019?\r\n¬°Por supuesto! Las inscripciones del Programa de Voluntariado se lanzar√°n a nivel nacional como internacional. ',2),(9,'1. ¬øC√≥mo puedo postular a las convocatorias de Lima2019?\r\nPuedes conocer las convocatorias laborales en la secci√≥n Trabaja con Nosotros ',3),(10,'2. ¬øC√≥mo me puedo contactar con el √°rea de selecci√≥n de personal?\r\nSi tienes una consulta sobre un proceso puedes escribir a consultascas@lima2019.pe ',3),(11,'3. He postulado a una convocatoria y tengo dudas sobre el proceso ¬øC√≥mo puedo contactarlos?\r\nPuedes escribir a convocatorias@lima2019.pe ',3),(12,'4. Si soy extranjero, ¬øpuedo postular a una convocatoria?\r\nTodos pueden postular siempre y cuando cumplan con los requisitos y la correcta presentaci√≥n de los formatos y/o anexos seg√∫n lo indican las bases. ',3),(13,'1. ¬øCu√°l es el n√∫mero de obras listas para los Juegos Lima 2019?\r\nActualmente contamos con 10 sedes entregadas para la realizaci√≥n de los juegos Lima 2019. ',4),(14,'2. ¬øCu√°ndo estar√°n listas las dem√°s obras?\r\nLa infraestructura en construcci√≥n estar√° lista en marzo de 2019, fecha en la que estar√° ejecutada el 100% de las obras. ',4),(15,'3. ¬øCu√°l es la sede de inauguraci√≥n y clausura de los Juegos Lima 2019?\r\nLa inauguraci√≥n y clausura de los Juegos Lima 2019 ser√° en el Estadio Nacional. ',4),(16,'4. ¬øCu√°ntas sedes de competencia tiene Lima 2019?\r\nContamos con 19 sedes de competencia para la realizaci√≥n de los Juegos Panamericanos y Parapanamericanos. ',4),(17,'1. ¬øEst√° lista la programaci√≥n de las competencias?\r\nLa programaci√≥n final est√° lista, los detalles los puedes ver a trav√©s de nuestros canales oficiales. ',5),(19,'2. ¬øC√≥mo puedo competir en los Juegos Panamericanos?\r\nPara participar en los Juegos Panamericanos debes ser un atleta de alto rendimiento y ser seleccionado por la federaci√≥n nacional de tu deporte. ',5),(20,'3. ¬øC√≥mo puedo saber el sistema de clasificaci√≥n a Lima 2019?\r\nPuedes conocer el manual de clasificaci√≥n a nuestros juegos aqu√≠ http://www.panamsports.org/downloads/pdf/manual-de-sistemas-de-clasificacion-lima-2019.pdf ',5),(21,'4. ¬øCu√°ntas delegaciones participar√°n en los Juegos Panamericanos?\r\nParticipar√°n 41 delegaciones en los Juegos Panamericanos. ',5),(22,'1. ¬øCu√°ndo inicia la venta de tickets?\r\nLa venta de tickets iniciar√° el 27 de mayo. Estaremos informando todos los detalles a trav√©s de nuestros canales oficiales. ',6),(23,'1. ¬øC√≥mo puedo ser proveedor de los Juegos?\r\nPuedes conocer los procesos de contrataciones que se llevaron o se est√°n llevando en la secci√≥n de Contrataciones. ',7),(24,'1. ¬øA qu√© tel√©fono me puedo comunicar?\r\nEl n√∫mero de nuestra central telef√≥nica es 4105500. Si est√°s fuera de Per√∫ deber√°s anteponerle el c√≥digo (511). ',8),(25,'2. Quisi√©ramos compartir una nota de prensa con ustedes, ¬øa qu√© correo la podemos compartir?\r\nPuedes escribir a prensa@lima2019.pe para compartir tu informaci√≥n. ',8);
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
INSERT INTO `representantes` VALUES (1,'Representante del Ministerio de Transportes y Comunicaciones.'),(2,'Representante del Ministerio de Trasportes y Comunicaciones.'),(3,'Representante de la Municipalidad Metropolitana de Lima.'),(4,'Representante de la Municipalidad Metropolitana de Lima.'),(5,'Representante del Gobierno Regional del Callao.'),(6,'Presidente del comite Ol√≠mpico Peruano.'),(7,'Representante del comite Olimpico Peruano.'),(8,'Representante del Instituto Peruano del Deporte.'),(9,'Representante del Ministerio de Economia y Finanzas.'),(10,'Representante del Ministerio de Vivienda y Contrucci√≥n.'),(11,'Representante del Ministerio de Educaci√≥n.'),(12,'Representate del Comite Ol√≠mpico Internacional.'),(13,'Presidente de la Asociaci√≥n Nacional Paral√≠mpica del Per√∫.');
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
INSERT INTO `seccionreglamento` VALUES (1,1,'SECCION I OBJETIVOS'),(2,2,'SECCI√ìN II PROGRAMA DE LOS JUEGOS PANAMERICANOS'),(3,3,'SECCI√ìN III COMPETENCIAS DE LOS JUEGOS PANAMERICANOS\r\n'),(4,4,'SECCI√ìN IV ELEGIBILIDAD DE LOS ATLETAS PARA PARTICIPAR EN LOS JUEGOS PANAMERICANOS\r\n'),(5,5,'SECCI√ìN V INSCRIPCIONES DE LOS PARTICIPANTES EN LOS JUEGOS PANAMERICANOS\r\n'),(6,6,'SECCI√ìN VI PROTESTAS Y RECLAMACIONES DURANTE LOS JUEGOS PANAMERICANOS\r\n'),(7,7,'SECCI√ìN VII OFICIALES, PERSONAL M√âDICO Y PARAM√âDICO, OFICIALES T√âCNICOS, JUECES Y √ÅRBITROS QUE ACTUAR√ÅN EN LOS JUEGOS PANAMERICANOS\r\n'),(8,8,'SECCI√ìN VIII ALOJAMIENTO DE LOS PARTICIPANTES EN LOS JUEGOS PANAMERICANOS\r\n'),(9,9,'SECCI√ìN IX ACREDITACI√ìN DE LOS PARTICIPANTES EN LOS JUEGOS PANAMERICANOS\r\n'),(10,10,'SECCI√ìN X REUNI√ìN DE JEFES DE MISI√ìN\r\nSECCI√ìN X REUNI√ìN DE JEFES DE MISI√ìN\r\n');
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
INSERT INTO `subnorma` VALUES (1,'3.1','3.1  La totalidad de deportes, disciplinas y pruebas incluidos en el Programa de los siguientes Juegos Ol√≠mpicos.',3),(2,'3.2','3.2  Los deportes que consideran los Juegos Panamericanos como evento de calificaci√≥n	ol√≠mpica.	El	Comit√©	Ejecutivo	de	la	Odepa,	en	coordinaci√≥n	con	la Federaci√≥n Internacional y/o Confederaci√≥n Deportiva Panamericana correspondiente, podr√° establecer otras alternativas, a trav√©s de las cuales se vinculen los resultados de los atletas y equipos en los Juegos Panamericanos con su participaci√≥n en los siguientes Juegos Ol√≠mpicos.',3),(3,'3.3','3.3  Aquellos deportes, disciplinas y pruebas cuya Federaci√≥n Internacional y/o Confederaci√≥n Deportiva Panamericana hayan alcanzado un nivel adecuado en el desarrollo de sus actividades en Am√©rica. ',3),(4,'3.4','3.4  Los deportes y eventos con mayor participaci√≥n y popularidad en Am√©rica',3),(5,'3.5','3.5  Los deportes en que participen hombres y mujeres.',3),(6,'4.1','4.1  Deportes del Programa Ol√≠mpico (28 deportes): ATLETISMO Masculino y Femenino, - B√ÅDMINTON Masculino y	Femenino - BALONMANO Masculino y Femenino - BALONCESTO Masculino y Femenino - B√âISBOL Masculino - BOXEO Masculino - CANOTAJE Masculino y Femenino -	CICLISMO	Masculino y Femenino - ECUESTRE Masculino y Femenino - ESGRIMA Masculino y Femenino -	F√öTBOL Masculino y Femenino - GIMNASIA Masculino y Femenino - HOCKEY SOBRE C√âSPED Masculino	y Femenino - JUDO Masculino	y Femenino - LEVANTAMIENTO DE PESAS	Masculino	y Femenino - LUCHA Masculino y Femenino - NATACI√ìN Masculino y Femenino - PENTATL√ìN MODERNO Masculino y Femenino - REMO Masculino y Femenino - SOFTBOL Femenino - TAE KWON DO Masculino y Femenino - TENIS Masculino y Femenino - TENIS	DE MESA Masculino	y Femenino - TIRO Masculino y	Femenino - TIRO CON ARCO Masculino y	Femenino - TRIATL√ìN Masculino y Femenino - VELA Masculino y Femenino - VOLEIBOL Masculino y Femenino.',10),(7,'4.2','4.2 Las disciplinas y pruebas de cada deporte ol√≠mpico ser√°n, sin excepci√≥n, las aprobadas por el Comit√© Ol√≠mpico Internacional para los Juegos Ol√≠mpicos inmediatamente posteriores a los Juegos Panamericanos.',10),(8,'4.3','4.3 Los deportes, disciplinas y pruebas pueden ser modificados	por el Comit√© Ol√≠mpico Internacional. Si este fuera el caso, la lista de deportes se√±alada en el Ac√°pite 4.1 precedente, se ajustar√° a lo establecido por el COI.',10),(9,'1.1','1.1 Para deportes individuales, un m√≠nimo de ocho (8) comit√©s ol√≠mpicos nacionales (CON) deben haber presentado inscripciones.',12),(10,'1.2','1.2  Para deportes de equipo, hombres o mujeres, un m√≠nimo de cinco (5) CON deben haber presentado inscripciones.',12),(11,'1.3','1.3  Para deportes individuales, en los que hay m√°s de una prueba, individual y por equipos, un m√≠nimo de cinco (5) CON deben haber presentado inscripciones.',12),(12,'1.1','1.1  Si una protesta o reclamaci√≥n es presentada antes del inicio de los Juegos Panamericanos y la decisi√≥n es adversa para el atleta involucrado, este no podr√° participar en los Juegos.',19),(13,'1.2','1.2  Si una decisi√≥n adversa es adoptada despu√©s del inicio de los Juegos Panamericanos, el atleta deber√° ser descalificado de los Juegos Panamericanos.',19),(14,'1.3','1.3  En las competencias de deporte de equipo, el retiro del atleta o los atletas afectados por la decisi√≥n adversa, puede resultar en la p√©rdida del partido o los partidos en los que haya o hayan participado dichos atletas.',19),(15,'1.1','1.1  Todos los competidores en los Juegos Panamericanos ser√°n alojados en la Villa Panamericana, a menos que otra decisi√≥n haya sido tomada por el Comit√© Ejecutivo de la Odepa.',26),(16,'1.2','1.2  La Villa estar√° abierta al menos diez (10) d√≠as antes de la ceremonia de inauguraci√≥n y permanecer√° abierta al menos durante tres (3) d√≠as posteriores a la ceremonia de clausura de los Juegos Panamericanos. La Villa Panamericana debe satisfacer las exigencias m√≠nimas, similares a las establecidas por el COI para la organizaci√≥n de la Villa de los atletas en unos Juegos Ol√≠mpicos.',26);
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
INSERT INTO `sysdiagrams` VALUES (6,'Diagram_final',1,1,'\–\œ‡°±\Z\·\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0>\0\0˛ˇ	\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0]\0\0\0\0\0\0˛ˇˇˇ\0\0\0\0\0\0\0\0`\0\0\0ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ˝ˇˇˇ_\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0˛ˇˇˇ\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0\0!\0\0\0\"\0\0\0#\0\0\0$\0\0\0%\0\0\0&\0\0\0\'\0\0\0(\0\0\0)\0\0\0*\0\0\0+\0\0\0,\0\0\0-\0\0\0.\0\0\0/\0\0\00\0\0\01\0\0\02\0\0\03\0\0\04\0\0\05\0\0\06\0\0\07\0\0\08\0\0\09\0\0\0:\0\0\0;\0\0\0<\0\0\0=\0\0\0>\0\0\0?\0\0\0@\0\0\0A\0\0\0B\0\0\0C\0\0\0D\0\0\0E\0\0\0F\0\0\0G\0\0\0H\0\0\0I\0\0\0J\0\0\0K\0\0\0L\0\0\0M\0\0\0N\0\0\0O\0\0\0P\0\0\0Q\0\0\0R\0\0\0S\0\0\0T\0\0\0U\0\0\0V\0\0\0W\0\0\0X\0\0\0Y\0\0\0Z\0\0\0[\0\0\0\\\0\0\0˛ˇˇˇ˛ˇˇˇô\0\0\0˛ˇˇˇ˝ˇˇˇb\0\0\0c\0\0\0d\0\0\0e\0\0\0f\0\0\0g\0\0\0h\0\0\0i\0\0\0j\0\0\0k\0\0\0l\0\0\0m\0\0\0n\0\0\0o\0\0\0p\0\0\0q\0\0\0r\0\0\0s\0\0\0t\0\0\0u\0\0\0v\0\0\0w\0\0\0x\0\0\0y\0\0\0z\0\0\0{\0\0\0|\0\0\0}\0\0\0~\0\0\0\0\0\0Ä\0\0\0R\0o\0o\0t\0 \0E\0n\0t\0r\0y\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ˇˇˇˇˇˇˇˇ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0p\Ì4˙©\’^\0\0\0Ä\n\0\0\0\0\0\0f\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ˇˇˇˇˇˇˇˇˇˇˇˇ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¢&\0\0\0\0\0\0o\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ˇˇˇˇ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\09å\0\0\0\0\0\0\0C\0o\0m\0p\0O\0b\0j\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ˇˇˇˇˇˇˇˇˇˇˇˇ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0_\0\0\0\0\0\0\0\04\0\nP\0\0Äâ\0\0\0\0ˇˇ\0\0\0â\0\0\0\0}\0\0πÇ\0\0†D\0\0Û≠\0i˜\0\0NˇˇºM\0\0ﬁÄ[Òï\–∞†\0™\0Ω\À\\\0\0\00\0\0\0\0\0\0\0\0\0<\0k\0\0\0	\0\0\0\0\0\0\0\Ÿ\Ê∞\ÈÅ\–≠Q\0†\…W9Ù;Ña\«CÖ5)Ü\·\’R¯†2}≤\ÿbïBçò\'<%¢\⁄-\0\0(\0C\0\0\0\0\0\0\0SDM\“\—éc\0`ó\“\ﬂH4\…\“wyw\ÿêp\0[Ñ\rú\0\0(\0C\0\0\0\0\0\0\0QDM\“\—éc\0`ó\“\ﬂH4\…\“wyw\ÿêp\0[Ñ\rúÇ\0\0\0¨%\0\0\0ˇ\0É\√\0\00\0•	\0\0\0\0Ä\0\0\0¢\0\0\0Ä\0\0\0\0ÄSchGrid\0\Óò\0\0\»d\0\0Asientos\0\08\0•	\0\0\0\0Ä\0\0\0¨\0\0\0Ä\0\0\r\0\0ÄSchGrid\0(π\0\06\ÿ\0\0Auspiciadores\0\0\0\08\0•	\0\0\0\0Ä\0\0\0≤\0\0\0Ä\0\0\0\0ÄSchGrid\0x¥\0\0ﬁä\0\0CategoriaAsiento\0\0x\0•	\0\0\0\0Ä\0\0\0b\0\0\0Ä\0\0M\0\0ÄControl\0_´\0\0\„}\0\0RelaciÛn \'FK_Asientos_CategoriaAsiento\' entre \'CategoriaAsiento\' y \'Asientos\'\0\0\0\0\0(\0µ\0\0\0\0Ä\0\0\01\0\0\0k\0\0\0Ä\0\0Control\0Æ\0\0Lá\0\0\0\04\0•	\0\0\0\0Ä\0\0\0¶\0\0\0Ä\0\0\n\0\0ÄSchGrid\0Lh\0\0P\‹\0\0Ceremonias\0\0\0\0<\0•	\0\0\0\0Ä\0\0\0¥\0\0\0Ä\0\0\0\0ÄSchGrid\0Ä%\0\08\0ComiteOrganizador\0\0\0\0\08\0•	\0\0\0\0Ä\0\0\0Æ\0\0\0Ä\0\0\0\0ÄSchGrid\00u\0\0Da\0\0Compra_Entradato\0\08\0•	\0\0\0\0Ä	\0\0\0∞\0\0\0Ä\0\0\0\0ÄSchGrid\0Ú+\0\0(n\0\0ComprobantePago\0\0\08\0•	\0\0\0\0Ä\n\0\0\0≤\0\0\0Ä\0\0\0\0ÄSchGrid\0\Õˇˇ2˙\0\0DeporteDestacado\0\00\0•	\0\0\0\0Ä\0\0\0¢\0\0\0Ä\0\0\0\0ÄSchGrid\0.•ˇˇ^∞\0\0Deportes\0\04\0•	\0\0\0\0Ä\0\0\0®\0\0\0Ä\0\0\0\0ÄSchGrid\0å\n\0\0F\Ê\0\0Deportistasa\0\08\0•	\0\0\0\0Ä\r\0\0\0Æ\0\0\0Ä\0\0\0\0ÄSchGrid\0^\œˇˇ6ç\0\0DetalleDeporte\0\0\0\08\0•	\0\0\0\0Ä\0\0\0Æ\0\0\0Ä\0\0\0\0ÄSchGrids\"\0\0R\À\0\0DetalleEventos\0\0\0\08\0•	\0\0\0\0Ä\0\0\0¨\0\0\0Ä\0\0\r\0\0ÄSchGridsÚ¡\0\0 g\0\0EstadoAsiento\0\0\0\0p\0•	\0\0\0\0Ä\0\0\0R\0\0\0Ä\0\0G\0\0ÄControl\0R≥\0\0£i\0\0RelaciÛn \'FK_Asientos_EstadoAsiento\' entre \'EstadoAsiento\' y \'Asientos\'V\0\0(\0µ\0\0\0\0Ä\0\0\01\0\0\0e\0\0\0Ä\0\0Control\05¥\0\08i\0\0\0\00\0•	\0\0\0\0Ä\0\0\0†\0\0\0Ä\0\0\0\0ÄSchGrid\0`	\0\0Ù∞\0\0Eventos\0\0\04\0•	\0\0\0\0Ä\0\0\0®\0\0\0Ä\0\0\0\0ÄSchGrid\0˙2\0\0Ç™\0\0FechaEventot\0\00\0•	\0\0\0\0Ä\0\0\0†\0\0\0Ä\0\0\0\0ÄSchGrids\–k\0\0\∆¿\0\0Galerias\0\08\0•	\0\0\0\0Ä\0\0\0Æ\0\0\0Ä\0\0\0\0ÄSchGrid\0zX\0\0\Êë\0\0HorarioEventosdo\0\0x\0•	\0\0\0\0Ä\0\0\0Z\0\0\0Ä\0\0O\0\0ÄControls]M\0\0¢°\0\0RelaciÛn \'FK_HorarioEventos_FechaEvento\' entre \'FechaEvento\' y \'HorarioEventos\'\0\0(\0µ\0\0\0\0Ä\0\0\01\0\0\0m\0\0\0Ä\0\0Control\0\ÌP\0\0©\0\0\0\08\0•	\0\0\0\0Ä\0\0\0¨\0\0\0Ä\0\0\r\0\0ÄSchGrids‘î\0\0næ\0\0Institucionale\0\0\0\00\0•	\0\0\0\0Ä\0\0\0¢\0\0\0Ä\0\0\0\0ÄSchGrid\0Üßˇˇ6\ÿ\0\0Medallas\0\08\0•	\0\0\0\0Ä\Z\0\0\0¨\0\0\0Ä\0\0\r\0\0ÄSchGridsì\0\0b\Ÿ\0\0MenuPrincipalsdo\0\00\0•	\0\0\0\0Ä\0\0\0û\0\0\0Ä\0\0\0\0ÄSchGrid\0Hä\0\0ﬁä\0\0Monedad\0\0\0<\0•	\0\0\0\0Ä\0\0\0∏\0\0\0Ä\0\0\0\0ÄSchGrid\0rú\0\0xˇ\0\0PreguntasFrecuentes\0\0\00\0•	\0\0\0\0Ä\0\0\0†\0\0\0Ä\0\0\0\0ÄSchGrid\0¸\÷ˇˇZ\“\0\0Ranking\0\0\04\0•	\0\0\0\0Ä\0\0\0¶\0\0\0Ä\0\0\n\0\0ÄSchGridsT\Ÿˇˇ<•\0\0Reglamentont\0\08\0•	\0\0\0\0Ä\0\0\0Æ\0\0\0Ä\0\0\0\0ÄSchGrid\0¶ˇˇ\⁄a\0\0ReporteEntrada\0\0\0\08\0•	\0\0\0\0Ä \0\0\0Æ\0\0\0Ä\0\0\0\0ÄSchGrid\0\‹P\0\0\0Representantesdo\0\08\0•	\0\0\0\0Ä!\0\0\0¨\0\0\0Ä\0\0\r\0\0ÄSchGrids8\«\0\0t\0\0StockAsientosgo\0\0\0p\0•	\0\0\0\0Ä\"\0\0\0R\0\0\0Ä\0\0G\0\0ÄControlsR≥\0\0áv\0\0RelaciÛn \'FK_Asientos_StockAsientos\' entre \'StockAsientos\' y \'Asientos\'\0\0\0(\0µ\0\0\0\0Ä#\0\0\01\0\0\0e\0\0\0Ä\0\0Control\0”∂\0\0\Õx\0\0\0\0<\0•	\0\0\0\0Ä$\0\0\0¥\0\0\0Ä\0\0\0\0ÄSchGrid\0Äª\0\0Çı\0\0TipoAuspiciadores\0\0\0\0\08\0•	\0\0\0\0Ä%\0\0\0Æ\0\0\0Ä\0\0\0\0ÄSchGrid\0Lh\0\0˘\0\0TipoCeremoniasdo\0\0x\0•	\0\0\0\0Ä&\0\0\0R\0\0\0Ä\0\0M\0\0ÄControl\0Kg\0\0m\Ì\0\0RelaciÛn \'FK_Ceremonias_TipoCeremonias\' entre \'TipoCeremonias\' y \'Ceremonias\'s\'\0\0(\0µ\0\0\0\0Ä\'\0\0\01\0\0\0k\0\0\0Ä\0\0Controlsëi\0\0\«Û\0\0\0\0<\0•	\0\0\0\0Ä(\0\0\0¥\0\0\0Ä\0\0\0\0ÄSchGrid\0æπ\0\0v\≈\0\0TipoInstitucionales\0\0\04\0•	\0\0\0\0Ä)\0\0\0®\0\0\0Ä\0\0\0\0ÄSchGrid\0®ˇˇ˛Ò\0\0TipoMedallai\0\0l\0•	\0\0\0\0Ä*\0\0\0R\0\0\0Ä\0\0C\0\0ÄControl\0#Æˇˇ\Ê\0\0RelaciÛn \'FK_Medallas_TipoMedalla\' entre \'TipoMedalla\' y \'Medallas\'t\0\0(\0µ\0\0\0\0Ä+\0\0\01\0\0\0a\0\0\0Ä\0\0Control\0i∞ˇˇx\Ï\0\0\0\04\0•	\0\0\0\0Ä,\0\0\0¶\0\0\0Ä\0\0\n\0\0ÄSchGrid\0ﬁä\0\0§\0\0TipoMonedara\0\04\0•	\0\0\0\0Ä-\0\0\0™\0\0\0Ä\0\0\0\0ÄSchGrids‹õ\0\0@\0TipoPregunta\0\0<\0•	\0\0\0\0Ä.\0\0\0¥\0\0\0Ä\0\0\0\0ÄSchGrid\0≤Ûˇˇb$\0TipoRepresentante\0\0\0\0\04\0•	\0\0\0\0Ä/\0\0\0§\0\0\0Ä\0\0	\0\0ÄSchGrid\0r\0\0Úv\0\0TipoSedeslai\0\04\0•	\0\0\0\0Ä0\0\0\0®\0\0\0Ä\0\0\0\0ÄSchGridsH?\0\0L˛\0\0TipoUsuarioo\0\00\0•	\0\0\0\0Ä1\0\0\0¢\0\0\0Ä\0\0\0\0ÄSchGrids7\0\0\“\0\0Usuarios\0\0,\0•	\0\0\0\0Ä2\0\0\0ö\0\0\0Ä\0\0\0\0ÄSchGridsÚ+\0\0\\¡\0\0Hora\0\0d\0•	\0\0\0\0Ä3\0\0\0R\0\0\0Ä\0\0;\0\0ÄControl\0s?\0\0\n∏\0\0RelaciÛn \'FK_FechaEvento_Hora\' entre \'Hora\' y \'FechaEvento\'\0\0\0(\0µ\0\0\0\0Ä4\0\0\01\0\0\0Y\0\0\0Ä\0\0Control\0πA\0\0YΩ\0\0\0\0,\0•	\0\0\0\0Ä5\0\0\0ö\0\0\0Ä\0\0\0\0ÄSchGrid\0\‘˛ˇˇ¨\0Pais\0\00\0•	\0\0\0\0Ä6\0\0\0ú\0\0\0Ä\0\0\0\0ÄSchGrid\0ˆ	\0\0\Êë\0\0Sedesid\0\0\0d\0•	\0\0\0\0Ä7\0\0\0R\0\0\0Ä\0\09\0\0ÄControlso\0\0Gà\0\0RelaciÛn \'FK_Sedes_TipoSedes\' entre \'TipoSedes\' y \'Sedes\'o\'\0\0\0(\0µ\0\0\0\0Ä8\0\0\01\0\0\0W\0\0\0Ä\0\0Control\0A\0\0»ç\0\0\0\0Ñ\0•	\0\0\0\0Ä9\0\0\0R\0\0\0Ä\0\0[\0\0ÄControl\0M°\0\0ˇ\0RelaciÛn \'FK_PreguntasFrecuentes_TipoPregunta\' entre \'TipoPregunta\' y \'PreguntasFrecuentes\'\0\0\0(\0µ\0\0\0\0Ä:\0\0\01\0\0\0y\0\0\0Ä\0\0Control\0ì£\0\0\”\0\0\0Ñ\0•	\0\0\0\0Ä;\0\0\0R\0\0\0Ä\0\0Y\0\0ÄControlsu\ƒ\0\0ô\Î\0\0RelaciÛn \'FK_Auspiciadores_TipoAuspiciadores\' entre \'TipoAuspiciadores\' y \'Auspiciadores\'s\'\0\0\0(\0µ\0\0\0\0Ä<\0\0\01\0\0\0w\0\0\0Ä\0\0Control\0ª\∆\0\0AÒ\0\0\0\0Ä\0•	\0\0\0\0Ä=\0\0\0R\0\0\0Ä\0\0W\0\0ÄControl\0VF\0\0\'m\0\0RelaciÛn \'FK_ComprobantePago_Compra_Entrada\' entre \'Compra_Entrada\' y \'ComprobantePago\'\0\0\0(\0µ\0\0\0\0Ä>\0\0\01\0\0\0u\0\0\0Ä\0\0ControlsP\0\0ºl\0\0\0\0l\0•	\0\0\0\0Ä?\0\0\0R\0\0\0Ä\0\0C\0\0ÄControlsßG\0\0˜\0\0RelaciÛn \'FK_Usuarios_TipoUsuario\' entre \'TipoUsuario\' y \'Usuarios\'\0\0\0(\0µ\0\0\0\0Ä@\0\0\01\0\0\0a\0\0\0Ä\0\0Controls\ÌI\0\0\Ã˘\0\0\0\0d\0•	\0\0\0\0ÄA\0\0\0b\0\0\0Ä\0\0;\0\0ÄControls\·U\0\0k\Œ\0\0RelaciÛn \'FK_Usuarios_Galeria\' entre \'Galeria\' y \'Usuarios\'\0\0\0(\0µ\0\0\0\0ÄB\0\0\01\0\0\0Y\0\0\0Ä\0\0Control\0¡W\0\0N\—\0\0\0\0p\0•	\0\0\0\0ÄC\0\0\0R\0\0\0Ä\0\0G\0\0ÄControl\0C\0\0\¬\0\0RelaciÛn \'FK_DetalleEventos_Eventos\' entre \'Eventos\' y \'DetalleEventos\'V\0\0(\0µ\0\0\0\0ÄD\0\0\01\0\0\0e\0\0\0Ä\0\0Control\03\0\0e\«\0\0\0\0å\0•	\0\0\0\0ÄE\0\0\0R\0\0\0Ä\0\0a\0\0ÄControls\0\0a#\0RelaciÛn \'FK_ComiteOrganizador_TipoRepresentante\' entre \'TipoRepresentante\' y \'ComiteOrganizador\'\0\0\0\0\0(\0µ\0\0\0\0ÄF\0\0\01\0\0\0\0\0\0Ä\0\0ControlsC\0\0ß%\0\0\0Ñ\0•	\0\0\0\0ÄG\0\0\0R\0\0\0Ä\0\0[\0\0ÄControls\„?\0\0Y\0RelaciÛn \'FK_ComiteOrganizador_Representantes\' entre \'Representantes\' y \'ComiteOrganizador\'\0\0\0(\0µ\0\0\0\0ÄH\0\0\01\0\0\0y\0\0\0Ä\0\0Control\0ª@\0\0\Ó\0\0\0Ñ\0•	\0\0\0\0ÄI\0\0\0R\0\0\0Ä\0\0Y\0\0ÄControl\0EØ\0\0u\ƒ\0\0RelaciÛn \'FK_Institucional_TipoInstitucional\' entre \'TipoInstitucional\' y \'Institucional\'r\'\0\0\0(\0µ\0\0\0\0ÄJ\0\0\01\0\0\0w\0\0\0Ä\0\0ControlsmÆ\0\0\n\ƒ\0\0\0\0à\0•	\0\0\0\0ÄK\0\0\0R\0\0\0Ä\0\0]\0\0ÄControl\03ù\0\0\Àı\0\0RelaciÛn \'FK_MenuPrincipal_PreguntasFrecuentes\' entre \'PreguntasFrecuentes\' y \'MenuPrincipal\'\0\0\0\0(\0µ\0\0\0\0ÄL\0\0\01\0\0\0{\0\0\0Ä\0\0Control\0¶â\0\0U˚\0\0\0\0p\0•	\0\0\0\0ÄM\0\0\0r\0\0\0Ä\0\0G\0\0ÄControls$%\0\0}ö\0\0RelaciÛn \'FK_Eventos_HorarioEventos\' entre \'HorarioEventos\' y \'Eventos\'V\0\0(\0µ\0\0\0\0ÄN\0\0\01\0\0\0e\0\0\0Ä\0\0Control\0\Í7\0\0ßô\0\0\0\0p\0•	\0\0\0\0ÄO\0\0\0b\0\0\0Ä\0\0E\0\0ÄControl\0j\Áˇˇ´\0RelaciÛn \'FK_DeporteDestacado_Pais\' entre \'Pais\' y \'DeporteDestacado\'\0\0\0\0\0(\0µ\0\0\0\0ÄP\0\0\01\0\0\0c\0\0\0Ä\0\0Control\0\„\Ôˇˇx	\0\0\0p\0•	\0\0\0\0ÄQ\0\0\0b\0\0\0Ä\0\0E\0\0ÄControl\04Ü\0\0}\À\0\0RelaciÛn \'FK_MenuPrincipal_Galeria\' entre \'Galeria\' y \'MenuPrincipal\'s\'V\0\0(\0µ\0\0\0\0ÄR\0\0\01\0\0\0c\0\0\0Ä\0\0Control\0⁄ç\0\0ö\œ\0\0\0\0l\0•	\0\0\0\0ÄS\0\0\0R\0\0\0Ä\0\0C\0\0ÄControls$\0\0\„\Ï\0\0RelaciÛn \'FK_Deportistas_Usuarios\' entre \'Usuarios\' y \'Deportistas\'t\0\0(\0µ\0\0\0\0ÄT\0\0\01\0\0\0a\0\0\0Ä\0\0Control\0i(\0\0x\Ï\0\0\0\0d\0•	\0\0\0\0ÄU\0\0\0R\0\0\0Ä\0\0;\0\0ÄControl\0˝\0\0k˙\0\0RelaciÛn \'FK_Deportistas_Pais\' entre \'Pais\' y \'Deportistas\'\0\0\0(\0µ\0\0\0\0ÄV\0\0\01\0\0\0Y\0\0\0Ä\0\0ControlsC\0\0y\0\0\0l\0•	\0\0\0\0ÄW\0\0\0b\0\0\0Ä\0\0C\0\0ÄControl\0íøˇˇ´ª\0\0RelaciÛn \'FK_Deportistas_Deportes\' entre \'Deportes\' y \'Deportistas\'o\0\0(\0µ\0\0\0\0ÄX\0\0\01\0\0\0a\0\0\0Ä\0\0Control\0\‰˛ˇˇ@ª\0\0\0\0t\0•	\0\0\0\0ÄY\0\0\0b\0\0\0Ä\0\0I\0\0ÄControl\05∏ˇˇPó\0\0RelaciÛn \'FK_Deportes_DetalleDeporte\' entre \'DetalleDeporte\' y \'Deportes\'tos\0\0(\0µ\0\0\0\0ÄZ\0\0\01\0\0\0g\0\0\0Ä\0\0Controls≠ºˇˇc¢\0\0\0\0|\0•	\0\0\0\0Ä\\\0\0\0R\0\0\0Ä\0\0Q\0\0ÄControl\0u≠\0\0\›\0\0RelaciÛn \'FK_MenuPrincipal_Auspiciadores\' entre \'Auspiciadores\' y \'MenuPrincipal\'ePa\0\0(\0µ\0\0\0\0Ä]\0\0\01\0\0\0o\0\0\0Ä\0\0Controls~´\0\0¶\‹\0\0\0\0|\0•	\0\0\0\0Ä^\0\0\0R\0\0\0Ä\0\0Q\0\0ÄControlsùú\0\0\„\œ\0\0RelaciÛn \'FK_MenuPrincipal_Institucional\' entre \'Institucional\' y \'MenuPrincipal\'ePa\0\0(\0µ\0\0\0\0Ä_\0\0\01\0\0\0o\0\0\0Ä\0\0Controls¿ç\0\0S\’\0\0\0\0t\0•	\0\0\0\0Ä`\0\0\0R\0\0\0Ä\0\0I\0\0ÄControl\0îè\0\0£i\0\0RelaciÛn \'FK_Compra_Entrada_Asientos\' entre \'Asientos\' y \'Compra_Entrada\'\0\0\0\0\0(\0µ\0\0\0\0Äa\0\0\01\0\0\0g\0\0\0Ä\0\0Controlsç\0\08i\0\0\0\0Ñ\0•	\0\0\0\0Äb\0\0\0b\0\0\0Ä\0\0Y\0\0ÄControlsc1\0\0\Àı\0\0RelaciÛn \'FK_MenuPrincipal_ComiteOrganizador\' entre \'ComiteOrganizador\' y \'MenuPrincipal\'\0\0\0\0\0(\0µ\0\0\0\0Äc\0\0\01\0\0\0w\0\0\0Ä\0\0Control\0úâ\0\0ß\0\0\0l\0•	\0\0\0\0Äd\0\0\0b\0\0\0Ä\0\0A\0\0ÄControl\0íøˇˇ]Ø\0\0RelaciÛn \'FK_Deportes_Reglamento\' entre \'Reglamento\' y \'Deportes\'\0\0\0\0\0(\0µ\0\0\0\0Äe\0\0\01\0\0\0_\0\0\0Ä\0\0Control\0EøˇˇÚÆ\0\0\0\0t\0•	\0\0\0\0Äf\0\0\0R\0\0\0Ä\0\0I\0\0ÄControl\0›®ˇˇ\√l\0\0RelaciÛn \'FK_ReporteEntrada_Deportes\' entre \'Deportes\' y \'ReporteEntrada\'\0\0\0\0\0(\0µ\0\0\0\0Äg\0\0\01\0\0\0g\0\0\0Ä\0\0Control\0#´ˇˇù\0\0\0\0t\0•	\0\0\0\0Äh\0\0\0R\0\0\0Ä\0\0K\0\0ÄControls∞Ç\0\0\‰\0\0RelaciÛn \'FK_MenuPrincipal_Ceremonias\' entre \'Ceremonias\' y \'MenuPrincipal\'\0\0\0(\0µ\0\0\0\0Äi\0\0\01\0\0\0i\0\0\0Ä\0\0Control\0îÉ\0\0_\Ê\0\0\0\0l\0•	\0\0\0\0Äj\0\0\0j\0\0\0Ä\0\0C\0\0ÄControl\0S#\0\0\œw\0\0RelaciÛn \'FK_Compra_Entrada_Sedes\' entre \'Sedes\' y \'Compra_Entrada\'l\0\0(\0µ\0\0\0\0Äk\0\0\01\0\0\0a\0\0\0Ä\0\0Control\0\√)\0\0\ÈÑ\0\0\0\0`\0•	\0\0\0\0Äl\0\0\0R\0\0\0Ä\0\05\0\0ÄControl\0∑\n\0\0¡¢\0\0RelaciÛn \'FK_Eventos_Sedes\' entre \'Sedes\' y \'Eventos\'\0\0\0\0\0(\0µ\0\0\0\0Äm\0\0\01\0\0\0S\0\0\0Ä\0\0Controls˚\0\0å™\0\0\0\0d\0•	\0\0\0\0Ät\0\0\0R\0\0\0Ä\0\0;\0\0ÄControls\Í¡ˇˇ5\◊\0\0RelaciÛn \'FK_Ranking_Medallas\' entre \'Medallas\' y \'Ranking\'\0\0\0(\0µ\0\0\0\0Äu\0\0\01\0\0\0Y\0\0\0Ä\0\0Control\0~\«ˇˇ\ \÷\0\0\0\0t\0•	\0\0\0\0Äv\0\0\0R\0\0\0Ä\0\0K\0\0ÄControl\0˚\’ˇˇO\‰\0\0RelaciÛn \'FK_DeporteDestacado_Ranking\' entre \'Ranking\' y \'DeporteDestacado\'\0\0\0(\0µ\0\0\0\0Äw\0\0\01\0\0\0i\0\0\0Ä\0\0Control\0\Ô\∆ˇˇÚ\Ô\0\0\0\0h\0•	\0\0\0\0Äx\0\0\0b\0\0\0Ä\0\0?\0\0ÄControl\0íøˇˇáÉ\0\0RelaciÛn \'FK_TipoSedes_Deportes\' entre \'Deportes\' y \'TipoSedes\'\0\0\0(\0µ\0\0\0\0Äy\0\0\01\0\0\0]\0\0\0Ä\0\0Controls\·˚ˇˇ≤\0\0\0\0h\0•	\0\0\0\0Äz\0\0\0Ç\0\0\0Ä\0\0=\0\0ÄControl\0˜ç\0\0^ï\0\0RelaciÛn \'FK_Moneda_TipoMoneda\' entre \'TipoMoneda\' y \'Moneda\'s\'\0\0\0(\0µ\0\0\0\0Ä{\0\0\01\0\0\0[\0\0\0Ä\0\0Control\0Öï\0\0xú\0\0\0\0t\0•	\0\0\0\0Ä|\0\0\0b\0\0\0Ä\0\0I\0\0ÄControl\0qP\0\0∂Ä\0\0RelaciÛn \'FK_Compra_Entrada_Usuarios\' entre \'Usuarios\' y \'Compra_Entrada\'\0\0\0\0\0(\0µ\0\0\0\0Ä}\0\0\01\0\0\0g\0\0\0Ä\0\0Control\0ü_\0\05∞\0\0\0\0Ä\0•	\0\0\0\0Ä~\0\0\0b\0\0\0Ä\0\0U\0\0ÄControl\0wh\0\0∂Ä\0\0RelaciÛn \'FK_Compra_Entrada_HorarioEventos\' entre \'HorarioEventos\' y \'Compra_Entrada\'\0\0\0\0\0(\0µ\0\0\0\0Ä\0\0\01\0\0\0s\0\0\0Ä\0\0Controls	o\0\0?á\0\0\0\0p\0•	\0\0\0\0ÄÄ\0\0\0R\0\0\0Ä\0\0E\0\0ÄControlsçé\0\0∂Ä\0\0RelaciÛn \'FK_Compra_Entrada_Moneda\' entre \'Moneda\' y \'Compra_Entrada\'\0#V\0\0(\0µ\0\0\0\0ÄÅ\0\0\01\0\0\0c\0\0\0Ä\0\0Control\0”ê\0\0~Ü\0\0\0\0Ä\0•	\0\0\0\0ÄÇ\0\0\0R\0\0\0Ä\0\0U\0\0ÄControlsw¡ˇˇ1c\0\0RelaciÛn \'FK_Compra_Entrada_ReporteEntrada\' entre \'ReporteEntrada\' y \'Compra_Entrada\'o\'\0\0\0(\0µ\0\0\0\0ÄÉ\0\0\01\0\0\0s\0\0\0Ä\0\0Control\0 \0\0\∆b\0\0\0\0d\0•	\0\0\0\0ÄÑ\0\0\0Z\0\0\0Ä\0\0;\0\0ÄControl\0íøˇˇ/ø\0\0RelaciÛn \'FK_Ranking_Deportes\' entre \'Deportes\' y \'Ranking\'a\0\0(\0µ\0\0\0\0ÄÖ\0\0\01\0\0\0Y\0\0\0Ä\0\0Controlsã\œˇˇu¡\0\0\0\0l\0•	\0\0\0\0ÄÜ\0\0\0b\0\0\0Ä\0\0A\0\0ÄControl\0Òˇˇ\√\›\0\0RelaciÛn \'FK_Ranking_Deportistas\' entre \'Deportistas\' y \'Ranking\'s\'o\0\0(\0µ\0\0\0\0Äá\0\0\01\0\0\0_\0\0\0Ä\0\0Control\0ä¸ˇˇ\Î\0\0\0\0x\0•	\0\0\0\0Äà\0\0\0R\0\0\0Ä\0\0O\0\0ÄControlsÛ\0\0ø\Ÿ\0\0RelaciÛn \'FK_DetalleEventos_Deportistas\' entre \'Deportistas\' y \'DetalleEventos\'\0\0\0(\0µ\0\0\0\0Äâ\0\0\01\0\0\0m\0\0\0Ä\0\0Control\09\0\0∑\‡\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0!C4\0\0\0ê\0\0\÷\0\0xV4\0\0\0\0\0A\0s\0i\0e\0n\0t\0o\0s\0\0\0P\0r\0o\0g\0r\0a\0m\0 \0F\0i\0l\0e\0s\0 \0(\0x\08\06\0)\0/\0M\0i\0c\0r\0o\0s\0o\0f\0t\0 \0S\0Q\0L\0 \0S\0e\0r\0v\0e\0r\0/\01\02\00\0/\0T\0o\0o\0l\0s\0/\0B\0i\0n\0n\0/\0M\0a\0n\0a\0g\0e\0m\0e\0n\0t\0S\0t\0u\0d\0i\0o\0/\0I\0D\0E\0/\0P\0r\0i\0v\0a\0t\0e\0A\0s\0s\0e\0m\0b\0l\0i\0e\0s\0/\0e\0s\0/\0M\0i\0c\0r\0o\0s\0o\0f\0t\0.\0S\0q\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0\–\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0l	\0\08\0\0å\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0ê\0\0\÷\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ã\0\0\0\0\0\0\0\0\0:\0\0ß\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0:\0\0π\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0\0+?\0\0˙\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0à\0\0§\r\0\0X\0\0xV4\0\0\0Z\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0	\0\0\0A\0s\0i\0e\0n\0t\0o\0s\0\0\0!C4\0\0\0I\0\0\0\0xV4\0\0\0\0\0A\0u\0s\0p\0i\0c\0i\0a\0d\0o\0r\0e\0s\0\0\0P\Ê7\\\Ê7\\\Ê7h\Ê7h\Ê7t\Ê7t\Ê7Ä\Ê7Ä\Ê7\‘\Á7\‘\Á7\‡\Á7\‡\Á7\Ï\Á7\Ï\Á7¯\Á7¯\Á7\Ë7\Ë7\\\Ë7\\\Ë7h\Ë7h\Ë7t\Ë7t\Ë7Ä\Ë7Ä\Ë7å\Ë7å\Ë7ò\Ë7ò\Ë7\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\09yÒ\0\0ÄM\0i\0c\0r\0o\0s\0o\0f\0t\0.\0S\0q\0l\0S\0e\0r\0v\0e\0r\0.\0E\0x\0p\0r\0e\0s\0s\0.\0O\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0ï\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0l	\0\08\0\0å\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0I\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0®\0\0\0\0\0\0\0\0\0:\0\0Ù\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0:\0\0π\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0\0+?\0\0˙\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0à\0\0§\r\0\0X\0\0xV4\0\0\0d\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0A\0u\0s\0p\0i\0c\0i\0a\0d\0o\0r\0e\0s\0\0\0!C4\0\0\0~\0\0µ\0\0xV4\0\0\0\0\0C\0a\0t\0e\0g\0o\0r\0i\0a\0A\0s\0i\0e\0n\0t\0o\0\0\01\03\01\00\00\00\04\00\00\00\00\00\01\00\00\00\01\00\00\02\07\02\07\03\06\0a\0d\06\0e\05\0f\09\05\08\06\0b\0a\0c\02\0d\05\03\01\0e\0a\0b\0c\03\0a\0c\0c\06\06\06\0c\02\0f\08\0e\0c\08\07\09\0f\0a\09\04\0f\08\0f\07\0b\00\03\02\07\0d\02\0f\0f\02\0e\0d\05\02\03\04\04\08\0iy¡3\0Äî	t\0\0\0\0\–#s\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0ï\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0l	\0\08\0\0å\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0~\0\0µ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ã\0\0\0\0\0\0\0\0\0:\0\0Ù\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0:\0\0π\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0\0+?\0\0˙\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0à\0\0§\r\0\0X\0\0xV4\0\0\0j\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0C\0a\0t\0e\0g\0o\0r\0i\0a\0A\0s\0i\0e\0n\0t\0o\0\0\0\0\0µ\0\0ﬁä\0\0µ\0\0Nâ\0\0⁄¨\0\0Nâ\0\0⁄¨\0\0ûÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Æ\0\0Lá\0\0ó\0\0S\0\02\0\0\0\0\0\0\0ó\0\0S\0\0\0\0\0\0\0\0\0Ä\0\0Ä\0\0\0\0\0\0\0ê∞0\0Tahoma\0F\0K\0_\0A\0s\0i\0e\0n\0t\0o\0s\0_\0C\0a\0t\0e\0g\0o\0r\0i\0a\0A\0s\0i\0e\0n\0t\0o\0!C4\0\0\0ê\0\0\ÿ\0\0xV4\0\0\0\0\0C\0e\0r\0e\0m\0o\0n\0i\0a\0s\0\0\0o\0n\0s\0_\0S\0c\0r\0i\0p\0t\0X\0m\0l\0I\0n\0d\0e\0x\0e\0s\0_\01\03\01\02\05\02\0,\0 \0P\0u\0b\0l\0i\0c\0K\0e\0y\0=\00\00\02\04\00\00\00\00\00\04\08\00\00\00\00\00\09\04\00\00\00\00\00\00\00\06\00\02\00\00\00\00\00\00\02\04\00\00\00\00\05\02\05\03\04\01\03\01\00\00\00\04\00\00\00\00\00\01\00\00\00\01\00\00\02\07\02\07\03\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0ï\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0l	\0\08\0\0å\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0ê\0\0\ÿ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ã\0\0\0\0\0\0\0\0\0:\0\00\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0:\0\0π\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0\0+?\0\0˙\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0à\0\0§\r\0\0X\0\0xV4\0\0\0^\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0C\0e\0r\0e\0m\0o\0n\0i\0a\0s\0\0\0!C4\0\0\0è\0\0Q\0\0xV4\0\0\0\0\0C\0o\0m\0i\0t\0e\0O\0r\0g\0a\0n\0i\0z\0a\0d\0o\0r\0\0\0Hº\»rTº\»rTº\»r`º\»r`º\»rlº\»rlº\»rxº\»rxº\»rÑº\»rÑº\»rêº\»rêº\»rúº\»rúº\»r®º\»r®º\»r¥º\»r¥º\»r¿º\»r¿º\»r–º\»r–º\»r\‡º\»r\‡º\»r\Ïº\»r\Ïº\»r\0Ω\»r\0Ω\»rΩ\»rΩ\»r Ω\»r Ω\»r,Ω\»r,Ω\»r8Ω\»r8Ω\»rLΩ\»rLΩ\»rXΩ\»rXΩ\»rdΩ\»rdΩ\»rpΩ\»rpΩ\»r|Ω\»r|Ω\»ràΩ\»ràΩ\»rîΩ\»rîΩ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0\Z\0\0\0\0\0\0-\0\0	\0\0\0\0\0\0\0\0\0\0\0à\0\0l	\0\08\0\0å\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0è\0\0Q\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ã\0\0\0\0\0\0\0\0\0:\0\0Ù\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0:\0\0π\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0\0+?\0\0˙\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0à\0\0§\r\0\0X\0\0xV4\0\0\0l\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0C\0o\0m\0i\0t\0e\0O\0r\0g\0a\0n\0i\0z\0a\0d\0o\0r\0\0\0!C4\0\0\0ê\0\0-\"\0\0xV4\0\0\0\0\0C\0o\0m\0p\0r\0a\0_\0E\0n\0t\0r\0a\0d\0a\0\0\0â`5	\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Fà|r\»r¨˛\…r†~Ωr\…r\‡\ÓsD\0\0\0\0\0\0D\0\0É\0\0\⁄\0\0\0\0\0\0\⁄\0\0É\0\0p\0\0\0\0\0\0p\0\0É\0\0\0\0\0\0ñ\0\0\0:\0\0ñ\0\0\0\0\0\0\0,\0\0:\0\0,\0\0\0\0\0\0\¬\0\0:\0\0\¬\0\0\0\0\0\0X\0\0:\0\0X\0\0\0\0\0\0\Ó\0\0:\0\0\Ó\0\0\0\0\0\0Ñ\0\0:\0\0Ñ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0G\0\0\0\0\0\0-\0\0\n\0\0\0\0\0\0\0\0\0\0\0à\0\0l	\0\08\0\0å\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0ê\0\0-\"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ã\0\0\0\0\0\0\0\0\0:\0\0Ù\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0:\0\0π\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0\0+?\0\0˙\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0à\0\0§\r\0\0X\0\0xV4\0\0\0f\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0C\0o\0m\0p\0r\0a\0_\0E\0n\0t\0r\0a\0d\0a\0\0\0!C4\0\0\0ê\0\0U\0\0xV4\0\0\0\0\0C\0o\0m\0p\0r\0o\0b\0a\0n\0t\0e\0P\0a\0g\0o\0\0\03\0d\05\0c\05\0d\0d\02\0d\0f\0c\07\0b\0c\09\09\0c\05\02\08\06\0b\02\0c\01\02\05\01\01\07\0b\0f\05\0c\0b\0e\02\04\02\0b\09\0d\04\01\07\05\00\07\03\02\0b\02\0b\0d\0f\0f\0e\06\04\09\0c\06\0e\0f\0b\08\0e\05\05\02\06\0d\05\02\06\0f\0d\0d\01\03\00\00\09\05\0e\0c\0d\0b\07\0b\0f\02\01\00\08\00\09\0c\06\0c\0d\0a\0d\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0ï\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0l	\0\08\0\0å\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0ê\0\0U\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ã\0\0\0\0\0\0\0\0\0:\0\0Ù\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0:\0\0π\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0\0+?\0\0˙\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0à\0\0§\r\0\0X\0\0xV4\0\0\0h\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0C\0o\0m\0p\0r\0o\0b\0a\0n\0t\0e\0P\0a\0g\0o\0\0\0!C4\0\0\0ê\0\0\ÿ\0\0xV4\0\0\0\0\0D\0e\0p\0o\0r\0t\0e\0D\0e\0s\0t\0a\0c\0a\0d\0o\0\0\0d\03\0b\02\08\0f\01\0f\06\0e\04\0c\08\0\0\0c\08\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0özR\r\0\0Äî	t\0\0\0\0∞\Ë7\0\0\0\0\0\0\0tÄΩrtÄΩr|ÄΩr|ÄΩrúÄΩrúÄΩr∞ÄΩr∞ÄΩrå\Ê7å\Ê7î\Ê7î\Ê7§\Ê7§\Ê7¥\Ê7¥\Ê7\ƒ\Ê7\ƒ\Ê7\‘\Ê7\‘\Ê7\‰\Ê7\‰\Ê7Ù\Ê7Ù\Ê7\Á7\Á7\Á7\Á7$\Á7$\Á74\Á74\Á\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0ï\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0l	\0\08\0\0å\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0ê\0\0\ÿ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ã\0\0\0\0\0\0\0\0\0:\0\0Ù\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0:\0\0π\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0\0+?\0\0˙\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0à\0\0§\r\0\0X\0\0xV4\0\0\0j\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0D\0e\0p\0o\0r\0t\0e\0D\0e\0s\0t\0a\0c\0a\0d\0o\0\0\0!C4\0\0\0ê\0\08\0\0xV4\0\0\0\0\0D\0e\0p\0o\0r\0t\0e\0s\0\0\0d\05\02\03\04\04\08\0f\08\03\0c\03\0d\05\0c\05\0d\0d\02\0d\0f\0c\07\0b\0c\09\09\0c\05\02\08\06\0b\02\0c\01\02\05\01\01\07\0b\0f\05\0c\0b\0e\02\04\02\0b\09\0d\04\01\07\05\00\07\03\02\0b\02\0b\0d\0f\0f\0e\06\04\09\0c\06\0e\0f\0b\08\0e\05\05\02\06\0d\05\02\06\0f\0d\0d\01\03\00\00\09\05\0e\0c\0d\0b\07\0b\0f\02\01\00\08\00\09\0c\06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0ï\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0l	\0\08\0\0å\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0ê\0\08\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ã\0\0\0\0\0\0\0\0\0:\0\0Ù\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0:\0\0π\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0\0+?\0\0˙\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0à\0\0§\r\0\0X\0\0xV4\0\0\0Z\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0	\0\0\0D\0e\0p\0o\0r\0t\0e\0s\0\0\0!C4\0\0\0ê\0\0\‡\0\0xV4\0\0\0\0\0D\0e\0p\0o\0r\0t\0i\0s\0t\0a\0s\0\0\0L\‰7L\‰7X\‰7X\‰7d\‰7d\‰7p\‰7p\‰7|\‰7Úz™à\0Äà\‰7î\‰7î\‰7†\‰7†\‰7¨\‰7¨\‰7∏\‰7∏\‰7\ƒ\‰7\ƒ\‰7\–\‰7\–\‰7\‹\‰7\‹\‰7\Ë\‰7\Ë\‰7Ù\‰7Ù\‰7\0\Â7\0\Â7\Â7\Â7\Â7\Â7$\Â7$\Â70\Â70\Â7<\Â7<\Â7H\Â7H\Â7T\Â7T\Â7`\Â7`\Â7l\Â7l\Â7x\Â7x\Â7Ñ\Â7Ñ\Â\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0ï\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0l	\0\08\0\0å\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0ê\0\0\‡\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ã\0\0\0\0\0\0\0\0\0:\0\0Ù\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0:\0\0π\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0\0+?\0\0˙\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0à\0\0§\r\0\0X\0\0xV4\0\0\0`\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0D\0e\0p\0o\0r\0t\0i\0s\0t\0a\0s\0\0\0!C4\0\0\0~\0\0\—\0\0xV4\0\0\0\0\0D\0e\0t\0a\0l\0l\0e\0D\0e\0p\0o\0r\0t\0e\0\0\0Ü∫Ü\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0†~Ωr\…r\‡\Ós†~Ωr\…r\‡\ÓsD\0\0\0\0\0\0D\0\0É\0\0\⁄\0\0\0\0\0\0\⁄\0\0É\0\0p\0\0\0\0\0\0p\0\0É\0\0\0\0\0\0ñ\0\0\0:\0\0ñ\0\0\0\0\0\0\0,\0\0:\0\0,\0\0\0\0\0\0\¬\0\0:\0\0\¬\0\0\0\0\0\0X\0\0:\0\0X\0\0\0\0\0\0\Ó\0\0:\0\0\Ó\0\0\0\0\0\0Ñ\0\0:\0\0Ñ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0ï\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0l	\0\08\0\0å\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0~\0\0\—\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0®\0\0\0\0\0\0\0\0\0:\0\0Ù\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0:\0\0π\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0\0+?\0\0˙\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0à\0\0§\r\0\0X\0\0xV4\0\0\0f\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0D\0e\0t\0a\0l\0l\0e\0D\0e\0p\0o\0r\0t\0e\0\0\0!C4\0\0\0}\0\0(\0\0xV4\0\0\0\0\0D\0e\0t\0a\0l\0l\0e\0E\0v\0e\0n\0t\0o\0s\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0ï\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0l	\0\08\0\0å\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0}\0\0(\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ã\0\0\0\0\0\0\0\0\0:\0\0Ù\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0:\0\0π\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0\0+?\0\0˙\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0à\0\0§\r\0\0X\0\0xV4\0\0\0f\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0D\0e\0t\0a\0l\0l\0e\0E\0v\0e\0n\0t\0o\0s\0\0\0!C4\0\0\0â\0\0\◊	\0\0xV4\0\0\0\0\0E\0s\0t\0a\0d\0o\0A\0s\0i\0e\0n\0t\0o\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0å\Ê7å\Ê7î\Ê7î\Ê7§\Ê7§\Ê7¥\Ê7¥\Ê7\ƒ\Ê7\ƒ\Ê7\‘\Ê7\‘\Ê7\‰\Ê7\‰\Ê7Ù\Ê7Ù\Ê7\Á7\Á7\Á7\Á7$\Á7$\Á74\Á74\Á7D\Á7D\Á7T\Á7T\Á7d\Á7d\Á7t\Á7t\Á7Ñ\Á7Ñ\Á7î\Á7î\Á7§\Á7§\Á7¥\Á7¥\Á7\ƒ\Á7\ƒ\Á7 \Ë7 \Ë\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0ï\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0l	\0\08\0\0å\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0â\0\0\◊	\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ñ	\0\0\0\0\0\0\0\0\0:\0\0Ù\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0:\0\0π\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0\0+?\0\0˙\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0à\0\0§\r\0\0X\0\0xV4\0\0\0d\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0E\0s\0t\0a\0d\0o\0A\0s\0i\0e\0n\0t\0o\0\0\0\0\0Ú¡\0\0:k\0\0~¥\0\0:k\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\05¥\0\08i\0\0\0\0S\0\05\0\0\0\0\0\0\0\0\0S\0\0\0\0\0\0\0\0\0Ä\0\0Ä\0\0\0\0\0\0\0ê∞0\0Tahoma\0F\0K\0_\0A\0s\0i\0e\0n\0t\0o\0s\0_\0E\0s\0t\0a\0d\0o\0A\0s\0i\0e\0n\0t\0o\0!C4\0\0\0\0\0\ÿ\0\0xV4\0\0\0\0\0E\0v\0e\0n\0t\0o\0s\0\0\0∏\‰7∏\‰7\ƒ\‰7\ƒ\‰7\–\‰7\–\‰7\‹\‰7\‹\‰7\Ë\‰7\Ë\‰7Ù\‰7Ù\‰7\0\Â7\0\Â7\Â7\Â7\Â7\Â7$\Â7$\Â70\Â70\Â7<\Â7<\Â7H\Â7H\Â7T\Â7T\Â7`\Â7`\Â7l\Â7l\Â7x\Â7x\Â7Ñ\Â7Ñ\Â7ê\Â7ê\Â7ú\Â7?x˜®\0Ä®\Â7¥\Â7¥\Â7¿\Â7¿\Â7\Ã\Â7\Ã\Â7\ÿ\Â7\ÿ\Â7\‰\Â7\‰\Â7\Â7\Â7¸\Â7¸\Â\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0ï\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0l	\0\08\0\0å\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ÿ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ò\r\0\0\0\0\0\0\0\0\0:\0\0Ù\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0:\0\0π\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0\0+?\0\0˙\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0à\0\0§\r\0\0X\0\0xV4\0\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0E\0v\0e\0n\0t\0o\0s\0\0\0!C4\0\0\0è\0\0C\0\0xV4\0\0\0\0\0F\0e\0c\0h\0a\0E\0v\0e\0n\0t\0o\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0ï\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0l	\0\08\0\0å\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0è\0\0C\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ã\0\0\0\0\0\0\0\0\0:\0\00\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0:\0\0π\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0\0+?\0\0˙\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0à\0\0§\r\0\0X\0\0xV4\0\0\0`\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0F\0e\0c\0h\0a\0E\0v\0e\0n\0t\0o\0\0\0!C4\0\0\0ê\0\0\0\0xV4\0\0\0\0\0G\0a\0l\0e\0r\0i\0a\0\0\0úº\»rúº\»r®º\»r®º\»r¥º\»r¥º\»r¿º\»r¿º\»r–º\»r–º\»r\‡º\»r\‡º\»r\Ïº\»r\Ïº\»r\0Ω\»r\0Ω\»rΩ\»rΩ\»r Ω\»r Ω\»r,Ω\»r,Ω\»r8Ω\»r8Ω\»rLΩ\»rLΩ\»rXΩ\»rXΩ\»rdΩ\»rdΩ\»rpΩ\»rpΩ\»r|Ω\»r|Ω\»ràΩ\»ràΩ\»rîΩ\»rîΩ\»r†Ω\»r†Ω\»r¨Ω\»r¨Ω\»r∏Ω\»r∏Ω\»rƒΩ\»rƒΩ\»r–Ω\»r–Ω\»r‹Ω\»r‹Ω\»r\ËΩ\»r\ËΩ\»rÙΩ\»rÙΩ\»r\0æ\»r\0æ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0ï\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0l	\0\08\0\0å\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0ê\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ã\0\0\0\0\0\0\0\0\0:\0\0Ù\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0:\0\0π\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0\0+?\0\0˙\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0à\0\0§\r\0\0X\0\0xV4\0\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0G\0a\0l\0e\0r\0i\0a\0\0\0!C4\0\0\0ê\0\0w\0\0xV4\0\0\0\0\0H\0o\0r\0a\0r\0i\0o\0E\0v\0e\0n\0t\0o\0s\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0,zÑ\r\0\0Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0ï\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0l	\0\08\0\0å\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0ê\0\0w\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ã\0\0\0\0\0\0\0\0\0:\0\00\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0:\0\0π\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0\0+?\0\0˙\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0à\0\0§\r\0\0X\0\0xV4\0\0\0f\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0H\0o\0r\0a\0r\0i\0o\0E\0v\0e\0n\0t\0o\0s\0\0\0\0\0âN\0\0´\0\0úc\0\0´\0\0úc\0\0]§\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ÌP\0\0©\0\0\√\0\0S\0\02\0\0\0\0\0\0\0\√\0\0S\0\0\0\0\0\0\0\0\0Ä\0\0Ä\0\0\0\0\0\0\0ê∞0\0Tahoma\0F\0K\0_\0H\0o\0r\0a\0r\0i\0o\0E\0v\0e\0n\0t\0o\0s\0_\0F\0e\0c\0h\0a\0E\0v\0e\0n\0t\0o\0!C4\0\0\0ù\0\0,\0\0xV4\0\0\0\0\0I\0n\0s\0t\0i\0t\0u\0c\0i\0o\0n\0a\0l\0\0\0‘æ\»r\‡æ\»r\‡æ\»r\Ïæ\»r\Ïæ\»r\0ø\»r\0ø\»rø\»rø\»rø\»rø\»r$ø\»r$ø\»r8ø\»r8ø\»rDø\»rDø\»rPø\»rPø\»r\\ø\»r\\ø\»rhø\»rhø\»rtø\»rtø\»rÄø\»rÄø\»råø\»råø\»r§ø\»r§ø\»r∞ø\»r∞ø\»rºø\»rºø\»r»ø\»r»ø\»r‘ø\»r‘ø\»r\‡ø\»r\‡ø\»r\Ïø\»r\Ïø\»r¯ø\»r¯ø\»r¿\»r¿\»r¿\»r¿\»r¿\»r¿\»r(¿\»r(¿\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0ï\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0l	\0\08\0\0å\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0ù\0\0,\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ã\0\0\0\0\0\0\0\0\0:\0\0Ù\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0:\0\0π\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0\0+?\0\0˙\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0à\0\0§\r\0\0X\0\0xV4\0\0\0d\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0I\0n\0s\0t\0i\0t\0u\0c\0i\0o\0n\0a\0l\0\0\0!C4\0\0\0ê\0\0â\0\0xV4\0\0\0\0\0M\0e\0d\0a\0l\0l\0a\0s\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0ï\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0l	\0\08\0\0å\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0ê\0\0â\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ã\0\0\0\0\0\0\0\0\0:\0\00\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0:\0\0π\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0\0+?\0\0˙\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0à\0\0§\r\0\0X\0\0xV4\0\0\0Z\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0	\0\0\0M\0e\0d\0a\0l\0l\0a\0s\0\0\0!C4\0\0\0è\0\0$\0\0xV4\0\0\0\0\0M\0e\0n\0u\0P\0r\0i\0n\0c\0i\0p\0a\0l\0\0\0l\0S\0e\0r\0v\0e\0r\0.\0E\0x\0p\0r\0e\0s\0s\0.\0S\0q\0l\0M\0a\0n\0a\0g\0e\0r\0U\0I\0,\0 \0P\0u\0b\0l\0i\0c\0K\0e\0y\0=\00\00\02\04\00\00\00\00\00\04\08\00\00\00\00\00\09\04\00\00\00\00\00\00\00\06\00\02\00\00\00\00\00\00\02\04\00\00\00\00\05\02\05\03\04\01\03\01\00\00\00\04\00\00\00\00\00\01\00\00\00\01\00\00\02\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0\Z\0\0\0\0\0\0-\0\0	\0\0\0\0\0\0\0\0\0\0\0à\0\0l	\0\08\0\0å\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0è\0\0$\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ã\0\0\0\0\0\0\0\0\0:\0\0Ù\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0:\0\0π\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0\0+?\0\0˙\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0à\0\0§\r\0\0X\0\0xV4\0\0\0d\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0M\0e\0n\0u\0P\0r\0i\0n\0c\0i\0p\0a\0l\0\0\0!C4\0\0\0t\0\0;\r\0\0xV4\0\0\0\0\0M\0o\0n\0e\0d\0a\0\0\0ô\‘”ô\‡”ô ‘ô,‘ô8‘ô®‘ô¥‘ôÙ‘ô\ƒ’ô\–’ôú÷ô®÷ô\Ë÷ô◊ô0◊ô†◊ô¨◊ô0ÿô<ÿô|ÿôàÿôîÿôŸôŸôPŸô ⁄ô,⁄ô¨⁄ô∏⁄ô¯⁄ô€ô €ôê€ôú€ô\‹€ô¨‹ô∏‹ôXFöÑFöêFö›ôÙﬁô¥\‡ô\–FöOö$OöFö¸Fö(\·ôlGöxGö∏Gö\‰ôP\‰ô\Âôº\Â\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0ï\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0l	\0\08\0\0å\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0t\0\0;\r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0®\0\0\0\0\0\0\0\0\0:\0\0Ù\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0:\0\0π\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0\0+?\0\0˙\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0à\0\0§\r\0\0X\0\0xV4\0\0\0V\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0M\0o\0n\0e\0d\0a\0\0\0!C4\0\0\0~\0\0B\0\0xV4\0\0\0\0\0P\0r\0e\0g\0u\0n\0t\0a\0s\0F\0r\0e\0c\0u\0e\0n\0t\0e\0s\0\0\0`<\Z0=\Z<=\Z†¢§£d•\»F\Z\‘F\ZG\Z\‰G\ZG\Zÿ•–ßå®<©H©®©d™´ ´t´0¨\‡¨\Ï¨p≠|≠»≠pÆ(ØòØ§Ø\‰Ø¥∞¿∞\Ï≤¯≤D≥P≥l≥‹≥\Ë≥L¥X¥ò¥§¥Ã¥<µHµhµ\Ëµ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0ï\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0l	\0\08\0\0å\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0~\0\0B\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0®\0\0\0\0\0\0\0\0\0:\0\0Ù\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0:\0\0π\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0\0+?\0\0˙\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0à\0\0§\r\0\0X\0\0xV4\0\0\0p\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0P\0r\0e\0g\0u\0n\0t\0a\0s\0F\0r\0e\0c\0u\0e\0n\0t\0e\0s\0\0\0!C4\0\0\0I\0\0¨\0\0xV4\0\0\0\0\0R\0a\0n\0k\0i\0n\0g\0\0\0,@\Zx\Ÿp\€,\‹\‹\‹\Ë\‹H\›\ﬁ¥\ﬁ¿\ﬁ\ﬂ\–\ﬂÄ\‡å\‡\·\·h\·\‚\»\‚8\„D\„Ñ\„T\‰`\‰å\Êò\Ê\‰\Ê\Ê\Á|\Áà\Á\Ï\Á¯\Á8\ËD\Ël\Ë\‹\Ë\Ë\Ë\Èà\È¿\È\Ã\È\Ã\Ì\ÿ\Ì$\Ó`\Ó|\Ó\Ï\Ó¯\ÓPò`ÒlÒ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0ï\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0l	\0\08\0\0å\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0I\0\0¨\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0®\0\0\0\0\0\0\0\0\0:\0\0Ù\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0:\0\0π\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0\0+?\0\0˙\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0à\0\0§\r\0\0X\0\0xV4\0\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0R\0a\0n\0k\0i\0n\0g\0\0\0!C4\0\0\0ê\0\0≠\0\0xV4\0\0\0\0\0R\0e\0g\0l\0a\0m\0e\0n\0t\0o\0\0\0ö@JöÄJö$ö0ö†ö¨ö\Ïö¯öötöÄö¿öêöúöXödö§ö¿ö\Ïö\\öhö\Ïö¯ö8öDöPö¿ö\Ãöö\‹ö\ËöXödö§ö∞ö\Ãö<\ZöH\Zöà\ZöXödöúJö\»Jö8Köúö†ö`öDKö\»Kö\‘KöLö Lö\‘ö,L\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0ï\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0l	\0\08\0\0å\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0ê\0\0≠\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ã\0\0\0\0\0\0\0\0\0:\0\0Ù\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0:\0\0π\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0\0+?\0\0˙\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0à\0\0§\r\0\0X\0\0xV4\0\0\0^\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0R\0e\0g\0l\0a\0m\0e\0n\0t\0o\0\0\0!C4\0\0\0≥\0\0§\r\0\0xV4\0\0\0\0\0R\0e\0p\0o\0r\0t\0e\0E\0n\0t\0r\0a\0d\0a\0\0\0ñL8ñ9ñ|9ñà9ñ\‰ò\0òDDñ<>ôPDñ\‘Dñ\‡DñEñEñHEñdEñ0òîEñ†Eñ4Fñ|Fñ¨FñGñ(GñPMñHò\\Mñ\ÃMñ\ÿMñÙMñêò0NñHNñ∏Nñúò\ƒNñ4Oñ@Oñ\\OñòåOñ§Oñ\–PñTQñ<òXòlQñ\‹Qñ\ËQñRñ\»ò\‘ò\0	\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0ï\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0l	\0\08\0\0å\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0≥\0\0§\r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ã\0\0\0\0\0\0\0\0\0:\0\0Ù\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0:\0\0π\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0\0+?\0\0˙\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0à\0\0§\r\0\0X\0\0xV4\0\0\0f\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0R\0e\0p\0o\0r\0t\0e\0E\0n\0t\0r\0a\0d\0a\0\0\0!C4\0\0\0è\0\0(\0\0xV4\0\0\0\0\0R\0e\0p\0r\0e\0s\0e\0n\0t\0a\0n\0t\0e\0s\0\0\0ôÿóô‰óô0òôLòôxòôËòôÙòôxôôÑôôƒôô–ôô‹ôôLöôXöôòöôhõôtõôËõôÙõô@úôLúôhúôÿúô‰úô$ùôÙùô\0ûôHBöºBö\»Bö8üô<†ô¸°ô\ËLö∏Mö\ƒMöCöåCöp¢ôòCö\ÿCö®DöL•ôò•ôT¶ôßôßôpßô,®ô‹®ôË®ô<©\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0ï\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0l	\0\08\0\0å\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0è\0\0(\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ã\0\0\0\0\0\0\0\0\0:\0\0Ù\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0:\0\0π\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0\0+?\0\0˙\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0à\0\0§\r\0\0X\0\0xV4\0\0\0f\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0R\0e\0p\0r\0e\0s\0e\0n\0t\0a\0n\0t\0e\0s\0\0\0!C4\0\0\0≤\0\0\0\0xV4\0\0\0\0\0S\0t\0o\0c\0k\0A\0s\0i\0e\0n\0t\0o\0s\0\0\0¯Vñ<Wñ$YñdYñ Zñ`ZñlZñZñ†[ñ\–[ñÙ[ñd\\ñp\\ñ¯òò,ò¯>ô\\òò_ñtfñòòÄfñfñ¸fñgñ\\òTgñ®gñàjñ?ôîjñkñkñ,kñxòhkñºkñnñ(nñDnñ\ËòÙòxnñênñ\Ãnñ\ƒoñ¿rñsñ\\zñòhzñ\Ïzñ¯z\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0ï\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0l	\0\08\0\0å\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0≤\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ã\0\0\0\0\0\0\0\0\0:\0\0Ù\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0:\0\0π\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0\0+?\0\0˙\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0à\0\0§\r\0\0X\0\0xV4\0\0\0d\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0S\0t\0o\0c\0k\0A\0s\0i\0e\0n\0t\0o\0s\0\0\0\0\08\«\0\0x\0\0~¥\0\0x\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0#\0\0\0\0\0\0\0”∂\0\0\Õx\0\0¯\r\0\0S\0\03\0\0\0\0\0\0\0¯\r\0\0S\0\0\0\0\0\0\0\0\0Ä\0\0Ä\0\0\0\0\0\0\0ê∞0\0Tahoma\0F\0K\0_\0A\0s\0i\0e\0n\0t\0o\0s\0_\0S\0t\0o\0c\0k\0A\0s\0i\0e\0n\0t\0o\0s\0!C4\0\0\0~\0\09\0\0xV4\0\0\0\0\0T\0i\0p\0o\0A\0u\0s\0p\0i\0c\0i\0a\0d\0o\0r\0e\0s\0\0\0†Úô¨Úô\ƒˆô\–ˆô˜ôX˜ôt˜ô\‰˜ô˜ô¸¯ô˘ôH˘ôê˘ô\Ë˘ôX˙ôd˙ô§˙ô¯˙ô\‰˚ô˚ôê\0öú\0ö\Ë\0ö$ö@ö∞öºö ö,ölöxöÑöÙööLö†öåöòö∞öºö¸öö$öîö†ö\‡ö∞	öº	öî\nö†\nö\‡\n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0ï\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0l	\0\08\0\0å\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0~\0\09\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ã\0\0\0\0\0\0\0\0\0:\0\0Ù\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0:\0\0π\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0\0+?\0\0˙\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0à\0\0§\r\0\0X\0\0xV4\0\0\0l\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0T\0i\0p\0o\0A\0u\0s\0p\0i\0c\0i\0a\0d\0o\0r\0e\0s\0\0\0!C4\0\0\0\÷\0\0¨\0\0xV4\0\0\0\0\0T\0i\0p\0o\0C\0e\0r\0e\0m\0o\0n\0i\0a\0s\0\0\0ò\\.òh.òP:òl:ò\ÿ:ò§DôÙ:òx;òÑ;ò†;ò∞Dô\Ï;ò(<òÑ=ò∞=ò$>ò¸Dô0>ò¥>ò¿>ò\‹>ò8Eô(?òà?ò@ò\»@òTàñ`àñAòAòlàñàñâñâñ0âñLâñTEô\ƒEô†âñ¨âñƒâñ‹âñBò\»BòÑCò\ƒCò\–Cò\–EôÑDò\‹Fôläñxä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0ï\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0l	\0\08\0\0å\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0\÷\0\0¨\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \r\0\0\0\0\0\0\0\0\0:\0\0Ù\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0:\0\0π\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0\0+?\0\0˙\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0à\0\0§\r\0\0X\0\0xV4\0\0\0f\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0T\0i\0p\0o\0C\0e\0r\0e\0m\0o\0n\0i\0a\0s\0\0\0\0\0\‚h\0\0˘\0\0\‚h\0\0(\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\'\0\0\0\0\0\0\0ëi\0\0\«Û\0\0	\0\0S\0\04\0\0\0\0\0\0\0	\0\0S\0\0\0\0\0\0\0\0\0Ä\0\0Ä\0\0\0\0\0\0\0ê∞0\0Tahoma\0F\0K\0_\0C\0e\0r\0e\0m\0o\0n\0i\0a\0s\0_\0T\0i\0p\0o\0C\0e\0r\0e\0m\0o\0n\0i\0a\0s\0!C4\0\0\0â\0\0x\0\0xV4\0\0\0\0\0T\0i\0p\0o\0I\0n\0s\0t\0i\0t\0u\0c\0i\0o\0n\0a\0l\0\0\0<(¨(∏(\ƒ)\–)*X*∞* +,+l+¿+¨,∏,1$1p1¨1\»182D2®2¥2Ù2\033|3î4\Z\»4\‘45 5<5¨5∏5¯5L687D788D8ê88l9\‹9\Ë9(:¯:;0?<?\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0ï\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0l	\0\08\0\0å\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0â\0\0x\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ñ	\0\0\0\0\0\0\0\0\0:\0\0Ù\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0:\0\0π\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0\0+?\0\0˙\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0à\0\0§\r\0\0X\0\0xV4\0\0\0l\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0T\0i\0p\0o\0I\0n\0s\0t\0i\0t\0u\0c\0i\0o\0n\0a\0l\0\0\0!C4\0\0\0è\0\0\»\r\0\0xV4\0\0\0\0\0T\0i\0p\0o\0M\0e\0d\0a\0l\0l\0a\0\0\0ÙªéÑºéΩéò\rìòäíºäí§\rì¯\rì¥ìdìpì<ìHìàìîìºì,ì8ìdìpìLìì∏ì\ƒì$ì\‡ìîãíêìúìì¨ì\\ìhì4ì@ìdOö4Pö@Pöt=öÄ=ö¿=ö\‡ôøï¯øï\Ïô\0\0P\0R\0I\0M\0A\0R\0Y\0\0\0ôòdô§dô\‰dô$ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0ï\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0l	\0\08\0\0å\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0è\0\0\»\r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ã\0\0\0\0\0\0\0\0\0:\0\0Ù\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0:\0\0π\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0\0+?\0\0˙\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0à\0\0§\r\0\0X\0\0xV4\0\0\0`\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0T\0i\0p\0o\0M\0e\0d\0a\0l\0l\0a\0\0\0\0\0∫Øˇˇ˛Ò\0\0∫Øˇˇø\Ë\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0+\0\0\0\0\0\0\0i∞ˇˇx\Ï\0\0@\r\0\0S\0\05\0\0\0\0\0\0\0@\r\0\0S\0\0\0\0\0\0\0\0\0Ä\0\0Ä\0\0\0\0\0\0\0ê∞0\0Tahoma\0F\0K\0_\0M\0e\0d\0a\0l\0l\0a\0s\0_\0T\0i\0p\0o\0M\0e\0d\0a\0l\0l\0a\0!C4\0\0\0ê\0\0\0\0xV4\0\0\0\0\0T\0i\0p\0o\0M\0o\0n\0e\0d\0a\0\0\0ñ\ƒIô\–Iô∞éñºéñ»éñ,êñXêñ»êñ0Nô‘êñDëñ\\ëñxëñ<Nô®ëñ¿ëñ\\íñhíñàNô\ƒNôtíñ‰íñíñìñ\‡NôPOôPìñ\\ìñtìñÏìñ¯ìñ\\Oô¿OôîñÑîñêîñ¨îñ\ÃOô¿Jòîñ¸îñPïñ‘ïñ\‡ïñ\0Kò\–Kòtññ‰ññññóñ\‹Kò∞LòPóñ\\ó\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0ï\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0l	\0\08\0\0å\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0ê\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ã\0\0\0\0\0\0\0\0\0:\0\0Ù\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0:\0\0π\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0\0+?\0\0˙\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0à\0\0§\r\0\0X\0\0xV4\0\0\0^\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0T\0i\0p\0o\0M\0o\0n\0e\0d\0a\0\0\0!C4\0\0\0~\0\0\œ\0\0xV4\0\0\0\0\0T\0i\0p\0o\0P\0r\0e\0g\0u\0n\0t\0a\0\0\0Ñ\ƒê\ƒ\0\≈\≈L\≈\∆(\∆\«x\«Ñ\«|=\Z\Ï=\Z¯=\Z\ÿ\«H\»T\»î\»d\…p\…L\ X\ $>\Z0>\Zp>\Z\Ë2X3§\ \À \ÀL\ÀX\Àò\Àê>\Zú>\Z∏\À\ƒ\À4\Ã@\ÃÄ\Ãå\Ãò\Ã\Õ\ÕT\Õ$\Œ0\Œ\Œ¸\ŒH\œd\œê\œ\0\–\–\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0ï\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0l	\0\08\0\0å\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0~\0\0\œ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0®\0\0\0\0\0\0\0\0\0:\0\0Ù\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0:\0\0π\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0\0+?\0\0˙\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0à\0\0§\r\0\0X\0\0xV4\0\0\0b\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\r\0\0\0T\0i\0p\0o\0P\0r\0e\0g\0u\0n\0t\0a\0\0\0!C4\0\0\0ê\0\0;\r\0\0xV4\0\0\0\0\0T\0i\0p\0o\0R\0e\0p\0r\0e\0s\0e\0n\0t\0a\0n\0t\0e\0\0\0\»aò\‘aòƒ∑ñ‹∑ñ∏ñ¿ñ ¡ñ,¡ñ(bò\‰bò8¡ñ®¡ñ¥¡ñ\‡¡ñ$cò0cò0¬ñl¬ñÑ¬ñÙ¬ñ\0√ñ@√ñ|√ñ\ƒ√ñ4ƒñLƒñ\‘∆ñ\‡∆ñêcòLdò\Ï∆ñ\\«ñh«ñÑ«ñådòòdò\‘«ñ»ñ»ñò»ñ§»ñ\Ïdò@eò…ñÄ…ñå…ñ®…ñ,fò8fò\Ï…ñ¯\…\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0ï\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0l	\0\08\0\0å\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0ê\0\0;\r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ã\0\0\0\0\0\0\0\0\0:\0\0Ù\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0:\0\0π\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0\0+?\0\0˙\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0à\0\0§\r\0\0X\0\0xV4\0\0\0l\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0T\0i\0p\0o\0R\0e\0p\0r\0e\0s\0e\0n\0t\0a\0n\0t\0e\0\0\0!C4\0\0\0~\0\0\0\0xV4\0\0\0\0\0T\0i\0p\0o\0S\0e\0d\0e\0s\0\0\0\Ã\Ëñ\Ë\Ëñ\0YôYô,\Èñ8\Èñ¥\Èñ\‘\Îñ\‡\ÎñXYô(Zô\Ï\Îñ\\\Ïñh\ÏñÑ\Ïñ4Zôîõò\»\Ïñ\‘\Ïñ¯\Ïñ¯ñl˘ñx˘ñ\ƒ˘ñ\0˙ñ˙ñ|˙ñà˙ñ¯˙ñ˚ñD˚ñÄ˚ñº˚ñ,¸ñD¸ñ¥¸ñ¿¸ñ[ôx[ô\Ã¸ñ<˝ñH˝ñd˝ñÑ[ô‘õò®˝ñ¥˝ñ\Ã˝ñ\0\0óúòdúòê†òhô»°ò8¢\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0ï\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0l	\0\08\0\0å\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0~\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ã\0\0\0\0\0\0\0\0\0:\0\0Ù\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0:\0\0π\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0\0+?\0\0˙\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0à\0\0§\r\0\0X\0\0xV4\0\0\0\\\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\n\0\0\0T\0i\0p\0o\0S\0e\0d\0e\0s\0\0\0!C4\0\0\0è\0\0g\0\0xV4\0\0\0\0\0T\0i\0p\0o\0U\0s\0u\0a\0r\0i\0o\0\0\0x/öÑ/ö\ƒ/ö\–/ö¯/öh0öt0öî0ö1öL1öX1öp5ö|5ö\»5ö6ö 6öê6öú6ö\07ö7öL7öX7öd7ö\‘7ö\‡7ö 8öt8öl9öx9öÑ<öê<ö\‹<ö\Ë<ö=öI\Ã2\–,0\Z$1\Z01\Z<4\ZH4\Z8<¯®¥\ƒ´\0æ\ZI>\0¿\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0ï\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0l	\0\08\0\0å\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0è\0\0g\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ã\0\0\0\0\0\0\0\0\0:\0\0Ù\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0:\0\0π\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0\0+?\0\0˙\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0à\0\0§\r\0\0X\0\0xV4\0\0\0`\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0T\0i\0p\0o\0U\0s\0u\0a\0r\0i\0o\0\0\0!C4\0\0\0˘\0\0\‹&\0\0xV4\0\0\0\0\0U\0s\0u\0a\0r\0i\0o\0s\0\0\0¿K∏L\ƒL\–O\‹O(P4PPPk\0~ZI>\0¿\0P+\"\r\ËQ\ƒR\–RSS(SòS§S\‰S¥T¿TúUVV†4\Zº4\Z,5\ZpV\‡V\ÏV,W¸WX\ÏX¯X85\Zx5\ZH6\ZT6\Z7\ZDY¥Y¿Y\ÏY¯Y8Z(7\Zh7\ZXZdZ\‘Z\‡Z [\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0É\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0l	\0\08\0\0å\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0˘\0\0\‹&\0\0\0\0\0\0	\0\0\0	\0\0\0\0\0\0\0\0\0\0\0x\0\0\0\0\0\0\0\0\0:\0\0Ù\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0:\0\0π\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0\0+?\0\0˙\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0à\0\0§\r\0\0X\0\0xV4\0\0\0Z\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0	\0\0\0U\0s\0u\0a\0r\0i\0o\0s\0\0\0!C4\0\0\0ê\0\0∂\0\0xV4\0\0\0\0\0H\0o\0r\0a\0\0\0ò0ﬂò(\‡ò4\‡ò@\„òL\„òò\„ò§\„ò¿\„ò0\‰ò<\‰ò|\‰òL\ÂòX\Âò\Êò(\Êòh\Êòt\ÊòÄ\Êò\Êò¸\Êò<\Áò\Ëò\ËòÙ\Ëòh\Èòt\Èò`_ô†_ô\\kô\»\Èò8\ÍòD\ÍòÑ\ÍòT\Îò`\Îò$\Ïò0\Ïòmô¿_ô\Ã_ô<`ôH`ô|\Ïò\Ï\Ïò¯\Ïò$\Ìò0\Ìòp\Ìòà`ôî`ôê\Ìòú\Ìò\Óò\ÓòX\Óòd\Óòp\Ó\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0ï\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0l	\0\08\0\0å\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0ê\0\0∂\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ã\0\0\0\0\0\0\0\0\0:\0\0Ù\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0:\0\0π\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0\0+?\0\0˙\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0à\0\0§\r\0\0X\0\0xV4\0\0\0R\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0H\0o\0r\0a\0\0\0\0\0\nA\0\0\\¡\0\0\nA\0\0≈∫\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\04\0\0\0\0\0\0\0πA\0\0YΩ\0\0q\0\0S\0\03\0\0\0\0\0\0\0q\0\0S\0\0\0\0\0\0\0\0\0Ä\0\0Ä\0\0\0\0\0\0\0ê∞0\0Tahoma\0F\0K\0_\0F\0e\0c\0h\0a\0E\0v\0e\0n\0t\0o\0_\0H\0o\0r\0a\0!C4\0\0\0ê\0\0^\r\0\0xV4\0\0\0\0\0P\0a\0i\0s\0\0\0ôL7ô\–7ô\‹7ô(8ô\–8ô\‰ñTñ`ñ|ñà9ô¯9ô:ôD:ô;ô ;ôL=ôX=ôºñò§=ô¸òlò\‰ñññ8ñxò∞\Zñîò∞=ô\» ñÑ!ñ@\"ñÄ\"ñå\"ñà#ñL%ñ&ñ(&ñ\–ò\Ëò4&ñ§&ñ∞&ñ\‹&ñò\Ã=ô,\'ñh\'ñÄ\'ñ¸\'ñ(ñH(ñê(ñú(ñ)ñ)\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0ï\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0l	\0\08\0\0å\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0ê\0\0^\r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ã\0\0\0\0\0\0\0\0\0:\0\0Ù\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0:\0\0π\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0\0+?\0\0˙\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0à\0\0§\r\0\0X\0\0xV4\0\0\0R\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0P\0a\0i\0s\0\0\0!C4\0\0\0ê\0\0í\0\0xV4\0\0\0\0\0S\0e\0d\0e\0s\0\0\0Äbåb\Ãbúc®ct7\ZÄ7\Z7\Z\‡d\‰e§g¸7\Z<8\Z9\Z9\ZÙ9\Zhj\Ãj|kàk\Ëk§lTm`m¥mpn o,o∞oºop∞phq\ÿq\‰q$rÙr\0s,u8uÑuêu¨uv(våvòv\ÿv\‰vw|wàw®w(x`xlx\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\04\0\0ï\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0l	\0\08\0\0å\0\0\0\0<\0\0X\0\0h\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0ê\0\0í\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ã\0\0\0\0\0\0\0\0\0:\0\0Ù\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0:\0\0π\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0\0+?\0\0˙\"\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0à\0\0§\r\0\0X\0\0xV4\0\0\0T\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0S\0e\0d\0e\0s\0\0\0\0\0\0\0˛ä\0\0\0\0\Êë\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\08\0\0\0\0\0\0\0A\0\0»ç\0\0\0\0S\0\02\0\0\0\0\0\0\0\0\0S\0\0\0\0\0\0\0\0\0Ä\0\0Ä\0\0\0\0\0\0\0ê∞0\0Tahoma\0F\0K\0_\0S\0e\0d\0e\0s\0_\0T\0i\0p\0o\0S\0e\0d\0e\0s\0\0\0\‰¢\0\0@\0\‰¢\0\0∫\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0:\0\0\0\0\0\0\0ì£\0\0\”\0/\0\0S\0\02\0\0\0\0\0\0\0/\0\0S\0\0\0\0\0\0\0\0\0Ä\0\0Ä\0\0\0\0\0\0\0ê∞0\0Tahoma#\0F\0K\0_\0P\0r\0e\0g\0u\0n\0t\0a\0s\0F\0r\0e\0c\0u\0e\0n\0t\0e\0s\0_\0T\0i\0p\0o\0P\0r\0e\0g\0u\0n\0t\0a\0\0\0\∆\0\0Çı\0\0\∆\0\0T\Ó\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0<\0\0\0\0\0\0\0ª\∆\0\0AÒ\0\0\0\0S\0\02\0\0\0\0\0\0\0\0\0S\0\0\0\0\0\0\0\0\0Ä\0\0Ä\0\0\0\0\0\0\0ê∞0\0Tahoma\"\0F\0K\0_\0A\0u\0s\0p\0i\0c\0i\0a\0d\0o\0r\0e\0s\0_\0T\0i\0p\0o\0A\0u\0s\0p\0i\0c\0i\0a\0d\0o\0r\0e\0s\0\0\00u\0\0æn\0\0ÇG\0\0æn\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0>\0\0\0\0\0\0\0P\0\0ºl\0\0£\0\0S\0\0B\0\0\0\0\0\0\0£\0\0S\0\0\0\0\0\0\0\0\0Ä\0\0Ä\0\0\0\0\0\0\0ê∞0\0Tahoma!\0F\0K\0_\0C\0o\0m\0p\0r\0o\0b\0a\0n\0t\0e\0P\0a\0g\0o\0_\0C\0o\0m\0p\0r\0a\0_\0E\0n\0t\0r\0a\0d\0a\0\0\0>I\0\0L˛\0\0>I\0\0\Ã˘\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0\0\ÌI\0\0\Ã˘\0\0\r\0\0S\0\0d\0\0\0\0\0\0\0\r\0\0S\0\0\0\0\0\0\0\0\0Ä\0\0Ä\0\0\0\0\0\0\0ê∞0\0Tahoma\0F\0K\0_\0U\0s\0u\0a\0r\0i\0o\0s\0_\0T\0i\0p\0o\0U\0s\0u\0a\0r\0i\0o\0\0\0\–k\0\0\–\0\0˚b\0\0\–\0\0˚b\0\0Ü\”\0\0\rW\0\0Ü\”\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0B\0\0\0\0\0\0\0¡W\0\0N\—\0\0ã\n\0\0S\0\02\0\0\0\0\0\0\0ã\n\0\0S\0\0\0\0\0\0\0\0\0Ä\0\0Ä\0\0\0\0\0\0\0ê∞0\0Tahoma\0F\0K\0_\0U\0s\0u\0a\0r\0i\0o\0s\0_\0G\0a\0l\0e\0r\0i\0a\0\0\0\⁄\0\0\Ã\ƒ\0\0\⁄\0\0R\À\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0D\0\0\0\0\0\0\03\0\0e\«\0\0¯\r\0\0S\0\02\0\0\0\0\0\0\0¯\r\0\0S\0\0\0\0\0\0\0\0\0Ä\0\0Ä\0\0\0\0\0\0\0ê∞0\0Tahoma\0F\0K\0_\0D\0e\0t\0a\0l\0l\0e\0E\0v\0e\0n\0t\0o\0s\0_\0E\0v\0e\0n\0t\0o\0s\0\0\0B\0\0¯$\0Ä%\0\0¯$\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0F\0\0\0\0\0\0\0C\0\0ß%\0+\0\0S\0\0	\0\0\0\0\0\0\0+\0\0S\0\0\0\0\0\0\0\0\0Ä\0\0Ä\0\0\0\0\0\0\0ê∞0\0Tahoma&\0F\0K\0_\0C\0o\0m\0i\0t\0e\0O\0r\0g\0a\0n\0i\0z\0a\0d\0o\0r\0_\0T\0i\0p\0o\0R\0e\0p\0r\0e\0s\0e\0n\0t\0a\0n\0t\0e\0\0\0\‹P\0\0\0A\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0H\0\0\0\0\0\0\0ª@\0\0\Ó\0u\0\0S\0\0]\0\0\0\0\0\0\0u\0\0S\0\0\0\0\0\0\0\0\0Ä\0\0Ä\0\0\0\0\0\0\0ê∞0\0Tahoma#\0F\0K\0_\0C\0o\0m\0i\0t\0e\0O\0r\0g\0a\0n\0i\0z\0a\0d\0o\0r\0_\0R\0e\0p\0r\0e\0s\0e\0n\0t\0a\0n\0t\0e\0s\0\0\0æπ\0\0\∆\0\0q∞\0\0\∆\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0J\0\0\0\0\0\0\0mÆ\0\0\n\ƒ\0\0	\0\0S\0\0J\0\0\0\0\0\0\0	\0\0S\0\0\0\0\0\0\0\0\0Ä\0\0Ä\0\0\0\0\0\0\0ê∞0\0Tahoma\"\0F\0K\0_\0I\0n\0s\0t\0i\0t\0u\0c\0i\0o\0n\0a\0l\0_\0T\0i\0p\0o\0I\0n\0s\0t\0i\0t\0u\0c\0i\0o\0n\0a\0l\0\0\0 û\0\0xˇ\0\0 û\0\0Ü¯\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0L\0\0\0\0\0\0\0¶â\0\0U˚\0\0u\0\0S\0\02\0\0\0\0\0\0\0u\0\0S\0\0\0\0\0\0\0\0\0Ä\0\0Ä\0\0\0\0\0\0\0ê∞0\0Tahoma$\0F\0K\0_\0M\0e\0n\0u\0P\0r\0i\0n\0c\0i\0p\0a\0l\0_\0P\0r\0e\0g\0u\0n\0t\0a\0s\0F\0r\0e\0c\0u\0e\0n\0t\0e\0s\0\0\0zX\0\0rú\0\0¢9\0\0rú\0\0¢9\0\0©õ\0\0Å+\0\0©õ\0\0Å+\0\0ä±\0\0P&\0\0ä±\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0N\0\0\0\0\0\0\0\Í7\0\0ßô\0\0<\0\0S\0\0-\0\0\0\0\0\0\0<\0\0S\0\0\0\0\0\0\0\0\0Ä\0\0Ä\0\0\0\0\0\0\0ê∞0\0Tahoma\0F\0K\0_\0E\0v\0e\0n\0t\0o\0s\0_\0H\0o\0r\0a\0r\0i\0o\0E\0v\0e\0n\0t\0o\0s\0\0\0\‘˛ˇˇB\04\ÔˇˇB\04\Ôˇˇn	\0ñ\Ëˇˇn	\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\0\0\0\0\0\0\0\„\Ôˇˇx	\0¯\r\0\0S\0\0E\0\0\0\0\0\0\0¯\r\0\0S\0\0\0\0\0\0\0\0\0Ä\0\0Ä\0\0\0\0\0\0\0ê∞0\0Tahoma\0F\0K\0_\0D\0e\0p\0o\0r\0t\0e\0D\0e\0s\0t\0a\0c\0a\0d\0o\0_\0P\0a\0i\0s\0\0\0`á\0\0\Õ\0\0+ç\0\0\Õ\0\0+ç\0\0¯\Ÿ\0\0ì\0\0¯\Ÿ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0R\0\0\0\0\0\0\0⁄ç\0\0ö\œ\0\0@\r\0\0S\0\0*\0\0\0\0\0\0\0@\r\0\0S\0\0\0\0\0\0\0\0\0Ä\0\0Ä\0\0\0\0\0\0\0ê∞0\0Tahoma\0F\0K\0_\0M\0e\0n\0u\0P\0r\0i\0n\0c\0i\0p\0a\0l\0_\0G\0a\0l\0e\0r\0i\0a\0\0\07\0\0z\Ó\0\0&\0\0z\Ó\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0\0\0\0\0i(\0\0x\Ï\0\0µ\0\0S\0\0.\0\0\0\0\0\0\0µ\0\0S\0\0\0\0\0\0\0\0\0Ä\0\0Ä\0\0\0\0\0\0\0ê∞0\0Tahoma\0F\0K\0_\0D\0e\0p\0o\0r\0t\0i\0s\0t\0a\0s\0_\0U\0s\0u\0a\0r\0i\0o\0s\0\0\0î\0\0¨\0î\0\0&˝\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0V\0\0\0\0\0\0\0C\0\0y\0]\n\0\0S\0\05\0\0\0\0\0\0\0]\n\0\0S\0\0\0\0\0\0\0\0\0Ä\0\0Ä\0\0\0\0\0\0\0ê∞0\0Tahoma\0F\0K\0_\0D\0e\0p\0o\0r\0t\0i\0s\0t\0a\0s\0_\0P\0a\0i\0s\0\0\0æ¿ˇˇBΩ\0\0\0\0BΩ\0\0\0\0z\Ó\0\0å\n\0\0z\Ó\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0X\0\0\0\0\0\0\0\‰˛ˇˇ@ª\0\0\„\0\0S\0\02\0\0\0\0\0\0\0\„\0\0S\0\0\0\0\0\0\0\0\0Ä\0\0Ä\0\0\0\0\0\0\0ê∞0\0Tahoma\0F\0K\0_\0D\0e\0p\0o\0r\0t\0i\0s\0t\0a\0s\0_\0D\0e\0p\0o\0r\0t\0e\0s\0\0\0Ù\œˇˇö\0\0Ù\œˇˇe§\0\0∞πˇˇe§\0\0∞πˇˇ^∞\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Z\0\0\0\0\0\0\0≠ºˇˇc¢\0\0∞\0\0S\0\0 \0\0\0\0\0\0\0∞\0\0S\0\0\0\0\0\0\0\0\0Ä\0\0Ä\0\0\0\0\0\0\0ê∞0\0Tahoma\Z\0F\0K\0_\0D\0e\0p\0o\0r\0t\0e\0s\0_\0D\0e\0t\0a\0l\0l\0e\0D\0e\0p\0o\0r\0t\0e\0\0\0(π\0\0®\ﬁ\0\0°Æ\0\0®\ﬁ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0]\0\0\0\0\0\0\0~´\0\0¶\‹\0\0\√\0\0S\0\02\0\0\0\0\0\0\0\√\0\0S\0\0\0\0\0\0\0ˇˇˇ\0\0\0Ä\0\0\0\0\0\0\0ê∞0\0Tahoma\0F\0K\0_\0M\0e\0n\0u\0P\0r\0i\0n\0c\0i\0p\0a\0l\0_\0A\0u\0s\0p\0i\0c\0i\0a\0d\0o\0r\0e\0s\0\0\04û\0\0ö\“\0\04û\0\0b\Ÿ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0_\0\0\0\0\0\0\0¿ç\0\0S\’\0\0\≈\0\0S\0\02\0\0\0\0\0\0\0\≈\0\0S\0\0\0\0\0\0\0ˇˇˇ\0\0\0Ä\0\0\0\0\0\0\0ê∞0\0Tahoma\0F\0K\0_\0M\0e\0n\0u\0P\0r\0i\0n\0c\0i\0p\0a\0l\0_\0I\0n\0s\0t\0i\0t\0u\0c\0i\0o\0n\0a\0l\0\0\0\Óò\0\0:k\0\0¿ê\0\0:k\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0a\0\0\0\0\0\0\0ç\0\08i\0\0Ä\0\0S\0\02\0\0\0\0\0\0\0Ä\0\0S\0\0\0\0\0\0\0ˇˇˇ\0\0\0Ä\0\0\0\0\0\0\0ê∞0\0Tahoma\Z\0F\0K\0_\0C\0o\0m\0p\0r\0a\0_\0E\0n\0t\0r\0a\0d\0a\0_\0A\0s\0i\0e\0n\0t\0o\0s\0\0\0˙2\0\08\0˙2\0\0¯\0®ì\0\0¯\0®ì\0\0Ü¯\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0c\0\0\0\0\0\0\0úâ\0\0ß\0é\0\0S\0\0I\0\0\0\0\0\0\0é\0\0S\0\0\0\0\0\0\0ˇˇˇ\0\0\0Ä\0\0\0\0\0\0\0ê∞0\0Tahoma\"\0F\0K\0_\0M\0e\0n\0u\0P\0r\0i\0n\0c\0i\0p\0a\0l\0_\0C\0o\0m\0i\0t\0e\0O\0r\0g\0a\0n\0i\0z\0a\0d\0o\0r\0\0\0T\ŸˇˇÙ∞\0\0\¬\…ˇˇÙ∞\0\0\¬\…ˇˇÙ∞\0\0æ¿ˇˇÙ∞\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0e\0\0\0\0\0\0\0EøˇˇÚÆ\0\0@\r\0\0S\0\02\0\0\0\0\0\0\0@\r\0\0S\0\0\0\0\0\0\0ˇˇˇ\0\0\0Ä\0\0\0\0\0\0\0ê∞0\0Tahoma\0F\0K\0_\0D\0e\0p\0o\0r\0t\0e\0s\0_\0R\0e\0g\0l\0a\0m\0e\0n\0t\0o\0\0\0t™ˇˇ^∞\0\0t™ˇˇ~o\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0g\0\0\0\0\0\0\0#´ˇˇù\0\0$\0\0S\0\0\0\0\0\0\0\0\0$\0\0S\0\0\0\0\0\0\0ˇˇˇ\0\0\0Ä\0\0\0\0\0\0\0ê∞0\0Tahoma\Z\0F\0K\0_\0R\0e\0p\0o\0r\0t\0e\0E\0n\0t\0r\0a\0d\0a\0_\0D\0e\0p\0o\0r\0t\0e\0s\0\0\0‹É\0\0∞\Â\0\0ì\0\0∞\Â\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0i\0\0\0\0\0\0\0îÉ\0\0_\Ê\0\0\≈\0\0S\0\02\0\0\0\0\0\0\0\≈\0\0S\0\0\0\0\0\0\0ˇˇˇ\0\0\0Ä\0\0\0\0\0\0\0ê∞0\0Tahoma\0F\0K\0_\0M\0e\0n\0u\0P\0r\0i\0n\0c\0i\0p\0a\0l\0_\0C\0e\0r\0e\0m\0o\0n\0i\0a\0s\0\0\0\Í$\0\0\Êë\0\0\Í$\0\0:Ñ\0\0\\\0\0:Ñ\0\0\\\0\0Jy\0\00u\0\0Jy\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0k\0\0\0\0\0\0\0\√)\0\0\ÈÑ\0\0T\0\0S\0\0\0\0\0\0\0\0\0T\0\0S\0\0\0\0\0\0\0ˇˇˇ\0\0\0Ä\0\0\0\0\0\0\0ê∞0\0Tahoma\0F\0K\0_\0C\0o\0m\0p\0r\0a\0_\0E\0n\0t\0r\0a\0d\0a\0_\0S\0e\0d\0e\0s\0\0\0N\0\0x•\0\0N\0\0Ù∞\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0m\0\0\0\0\0\0\0˚\0\0å™\0\0§	\0\0S\0\02\0\0\0\0\0\0\0§	\0\0S\0\0\0\0\0\0\0ˇˇˇ\0\0\0Ä\0\0\0\0\0\0\0ê∞0\0Tahoma\0F\0K\0_\0E\0v\0e\0n\0t\0o\0s\0_\0S\0e\0d\0e\0s\0\0\0\√ˇˇ\Ã\ÿ\0\0¸\÷ˇˇ\Ã\ÿ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0u\0\0\0\0\0\0\0~\«ˇˇ\ \÷\0\0\0\0S\0\02\0\0\0\0\0\0\0\0\0S\0\0\0\0\0\0\0ˇˇˇ\0\0\0Ä\0\0\0\0\0\0\0ê∞0\0Tahoma\0F\0K\0_\0R\0a\0n\0k\0i\0n\0g\0_\0M\0e\0d\0a\0l\0l\0a\0s\0\0\0í\◊ˇˇ\Á\0\0í\◊ˇˇ2˙\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0w\0\0\0\0\0\0\0\Ô\∆ˇˇÚ\Ô\0\0Ù\0\0S\0\02\0\0\0\0\0\0\0Ù\0\0S\0\0\0\0\0\0\0ˇˇˇ\0\0\0Ä\0\0\0\0\0\0\0ê∞0\0Tahoma\0F\0K\0_\0D\0e\0p\0o\0r\0t\0e\0D\0e\0s\0t\0a\0c\0a\0d\0o\0_\0R\0a\0n\0k\0i\0n\0g\0\0\0æ¿ˇˇx¥\0\02˚ˇˇx¥\0\02˚ˇˇÖ\0\0r\0\0Ö\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0y\0\0\0\0\0\0\0\·˚ˇˇ≤\0\0Ü\0\0S\0\05\0\0\0\0\0\0\0Ü\0\0S\0\0\0\0\0\0\0ˇˇˇ\0\0\0Ä\0\0\0\0\0\0\0ê∞0\0Tahoma\0F\0K\0_\0T\0i\0p\0o\0S\0e\0d\0e\0s\0_\0D\0e\0p\0o\0r\0t\0e\0s\0\0\0éè\0\0§\0\0éè\0\0N¢\0\0\‚ö\0\0N¢\0\0\‚ö\0\0zû\0\0dè\0\0zû\0\0dè\0\0\'ö\0\0∞ö\0\0\'ö\0\0∞ö\0\0ò\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0{\0\0\0\0\0\0\0Öï\0\0xú\0\0\„\0\0S\0\02\0\0\0\0\0\0\0\„\0\0S\0\0\0\0\0\0\0ˇˇˇ\0\0\0Ä\0\0\0\0\0\0\0ê∞0\0Tahoma\0F\0K\0_\0M\0o\0n\0e\0d\0a\0_\0T\0i\0p\0o\0M\0o\0n\0e\0d\0a\0\0\0R\0\0\“\0\0R\0\07≤\0\0º\0\07≤\0\0º\0\0qÉ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0}\0\0\0\0\0\0\0ü_\0\05∞\0\0ó\0\0S\0\02\0\0\0\0\0\0\0ó\0\0S\0\0\0\0\0\0\0ˇˇˇ\0\0\0Ä\0\0\0\0\0\0\0ê∞0\0Tahoma\Z\0F\0K\0_\0C\0o\0m\0p\0r\0a\0_\0E\0n\0t\0r\0a\0d\0a\0_\0U\0s\0u\0a\0r\0i\0o\0s\0\0\0j\0\0\Êë\0\0j\0\0êÜ\0\0\∆u\0\0êÜ\0\0\∆u\0\0qÉ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	o\0\0?á\0\0\Ì\0\0S\0\0<\0\0\0\0\0\0\0\Ì\0\0S\0\0\0\0\0\0\0ˇˇˇ\0\0\0Ä\0\0\0\0\0\0\0ê∞0\0Tahoma \0F\0K\0_\0C\0o\0m\0p\0r\0a\0_\0E\0n\0t\0r\0a\0d\0a\0_\0H\0o\0r\0a\0r\0i\0o\0E\0v\0e\0n\0t\0o\0s\0\0\0$ê\0\0ﬁä\0\0$ê\0\0qÉ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Å\0\0\0\0\0\0\0”ê\0\0~Ü\0\0:\0\0S\0\02\0\0\0\0\0\0\0:\0\0S\0\0\0\0\0\0\0ˇˇˇ\0\0\0Ä\0\0\0\0\0\0\0ê∞0\0Tahoma\0F\0K\0_\0C\0o\0m\0p\0r\0a\0_\0E\0n\0t\0r\0a\0d\0a\0_\0M\0o\0n\0e\0d\0a\0\0\0£\¬ˇˇ\»d\0\00u\0\0\»d\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0É\0\0\0\0\0\0\0 \0\0\∆b\0\02\0\0S\0\0;\0\0\0\0\0\0\02\0\0S\0\0\0\0\0\0\0ˇˇˇ\0\0\0Ä\0\0\0\0\0\0\0ê∞0\0Tahoma \0F\0K\0_\0C\0o\0m\0p\0r\0a\0_\0E\0n\0t\0r\0a\0d\0a\0_\0R\0e\0p\0o\0r\0t\0e\0E\0n\0t\0r\0a\0d\0a\0\0\0æ¿ˇˇ\∆¿\0\0\ﬁˇˇ\∆¿\0\0\ﬁˇˇZ\“\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ö\0\0\0\0\0\0\0ã\œˇˇu¡\0\0-\0\0S\0\05\0\0\0\0\0\0\0-\0\0S\0\0\0\0\0\0\0ˇˇˇ\0\0\0Ä\0\0\0\0\0\0\0ê∞0\0Tahoma\0F\0K\0_\0R\0a\0n\0k\0i\0n\0g\0_\0D\0e\0p\0o\0r\0t\0e\0s\0\0\0å\n\0\0˛Ò\0\0\€˚ˇˇ˛Ò\0\0\€˚ˇˇ>\ﬂ\0\0EÚˇˇ>\ﬂ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0á\0\0\0\0\0\0\0ä¸ˇˇ\Î\0\0Y\0\0S\0\0.\0\0\0\0\0\0\0Y\0\0S\0\0\0\0\0\0\0ˇˇˇ\0\0\0Ä\0\0\0\0\0\0\0ê∞0\0Tahoma\0F\0K\0_\0R\0a\0n\0k\0i\0n\0g\0_\0D\0e\0p\0o\0r\0t\0i\0s\0t\0a\0s\0\0\0ä\0\0F\Ê\0\0ä\0\0z\‹\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0â\0\0\0\0\0\0\09\0\0∑\‡\0\0\≈\0\0S\0\02\0\0\0\0\0\0\0\≈\0\0S\0\0\0\0\0\0\0ˇˇˇ\0\0\0Ä\0\0\0\0\0\0\0ê∞0\0Tahoma\0F\0K\0_\0D\0e\0t\0a\0l\0l\0e\0E\0v\0e\0n\0t\0o\0s\0_\0D\0e\0p\0o\0r\0t\0i\0s\0t\0a\0s\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0˛ˇˇˇ˛ˇˇˇ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0\0!\0\0\0\"\0\0\0#\0\0\0$\0\0\0%\0\0\0&\0\0\0\'\0\0\0(\0\0\0˛ˇˇˇ˛ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ\0˛ˇ\n\0\0ˇˇˇˇ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Microsoft DDS Form 2.0\0\0\0\0Embedded Object\0\0\0\0\0Ù9≤q\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Naº\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\€\Ê∞\ÈÅ\–≠Q\0†\…W9\0\0\0ê\ 2˙©\’\0\0HE\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ä\0\0D\0a\0t\0a\0 \0S\0o\0u\0r\0c\0e\0=\0L\0A\0P\0T\0O\0P\0-\0C\0E\0S\0A\0R\0;\0I\0n\0i\0t\0i\0a\0l\0 \0C\0a\0t\0a\0l\0o\0g\0=\0B\0D\0T\0e\0c\0n\0o\0S\0e\0r\0v\0;\0P\0e\0r\0s\0i\0s\0t\0 \0S\0e\0c\0u\0r\0i\0t\0y\0 \0I\0n\0f\0o\0=\0T\0r\0u\0e\0;\0U\0s\0e\0r\0 \0I\0D\0=\0s\0a\0;\0M\0u\0l\0t\0i\0p\0l\0e\0A\0c\0t\0i\0v\0e\0R\0e\0s\0u\0l\0t\0S\0e\0t\0s\0=\0F\0a\0l\0s\0e\0;\0P\0a\0c\0k\0e\0t\0 \0S\0i\0z\0\0D\0d\0s\0S\0t\0r\0e\0a\0m\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ˇˇˇˇ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0a\0\0\0Òn\0\0\0\0\0\0S\0c\0h\0e\0m\0a\0 \0U\0D\0V\0 \0D\0e\0f\0a\0u\0l\0t\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0&\0\0ˇˇˇˇˇˇˇˇˇˇˇˇ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0D\0S\0R\0E\0F\0-\0S\0C\0H\0E\0M\0A\0-\0C\0O\0N\0T\0E\0N\0T\0S\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0,\0\0\0\0\0\0\0ˇˇˇˇ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0^	\0\0\0\0\0\0S\0c\0h\0e\0m\0a\0 \0U\0D\0V\0 \0D\0e\0f\0a\0u\0l\0t\0 \0P\0o\0s\0t\0 \0V\06\0\0\0\0\0\0\0\0\0\0\0\0\06\0\0ˇˇˇˇˇˇˇˇˇˇˇˇ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0)\0\0\0\0\0\0\0\0\0\0Å\0\0\0Ç\0\0\0É\0\0\0Ñ\0\0\0Ö\0\0\0Ü\0\0\0á\0\0\0à\0\0\0â\0\0\0ä\0\0\0ã\0\0\0å\0\0\0ç\0\0\0é\0\0\0è\0\0\0ê\0\0\0ë\0\0\0í\0\0\0ì\0\0\0î\0\0\0ï\0\0\0ñ\0\0\0ó\0\0\0ò\0\0\0˛ˇˇˇö\0\0\0õ\0\0\0ú\0\0\0ù\0\0\0˛ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ\0\0\0NˇˇºM\0\0\0&\0\0\0s\0c\0h\0_\0l\0a\0b\0e\0l\0s\0_\0v\0i\0s\0i\0b\0l\0e\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0d\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\–\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\–\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\04\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\–\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0\0\0\0\0\0\0\0\0\0\0J\0\0\0joV\0\0\0d\0b\0o\0\0\0F\0K\0_\0A\0s\0i\0e\0n\0t\0o\0s\0_\0C\0a\0t\0e\0g\0o\0r\0i\0a\0A\0s\0i\0e\0n\0t\0o\0\0\0\0\0\0\0\0\0\0\0\ƒ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ˆlàˆl\0\0\0\0\0\0\0\0≠\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\–\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\–\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\–\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0	\0\0\0	\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\–\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0\n\0\0\0\n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\–\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\–\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\–\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0\r\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\–\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\04\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\–\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\–\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\04\03\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0\0\0\0\0\0\0\0\0\0\0D\0\0\0\0\'\0\0\0\0d\0b\0o\0\0\0F\0K\0_\0A\0s\0i\0e\0n\0t\0o\0s\0_\0E\0s\0t\0a\0d\0o\0A\0s\0i\0e\0n\0t\0o\0\0\0\0\0\0\0\0\0\0\0\ƒ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ılıl\0\0\0\0\0\0\0\0≠\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\–\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\04\08\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\–\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\–\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\–\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0\0\0\0\0\0\0\0\0\0\0L\0\0\0joV\0\0\0d\0b\0o\0\0\0F\0K\0_\0H\0o\0r\0a\0r\0i\0o\0E\0v\0e\0n\0t\0o\0s\0_\0F\0e\0c\0h\0a\0E\0v\0e\0n\0t\0o\0\0\0\0\0\0\0\0\0\0\0\ƒ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÚlàÚl\0\0\0\0\0\0\0\0≠\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\–\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\–\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0\Z\0\0\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\–\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\–\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\04\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\–\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\04\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\–\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\04\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\–\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\–\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0 \0\0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\–\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0!\0\0\0!\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\–\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0\"\0\0\0\"\0\0\0\0\0\0\0D\0\0\0\0\'\0\0\0\0d\0b\0o\0\0\0F\0K\0_\0A\0s\0i\0e\0n\0t\0o\0s\0_\0S\0t\0o\0c\0k\0A\0s\0i\0e\0n\0t\0o\0s\0\0\0\0\0\0\0\0\0\0\0\ƒ\0\0\0\0#\0\0\0#\0\0\0\"\0\0\0\0\0\0\ÁlH\Ál\0\0\0\0\0\0\0\0≠\0\0\0\0\0$\0\0\0$\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\–\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0%\0\0\0%\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\–\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\03\06\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0&\0\0\0&\0\0\0\0\0\0\0J\0\0\0joV\0\0\0d\0b\0o\0\0\0F\0K\0_\0C\0e\0r\0e\0m\0o\0n\0i\0a\0s\0_\0T\0i\0p\0o\0C\0e\0r\0e\0m\0o\0n\0i\0a\0s\0\0\0\0\0\0\0\0\0\0\0\ƒ\0\0\0\0\'\0\0\0\'\0\0\0&\0\0\0\0\0\0\‰là\‰l\0\0\0\0\0\0\0\0≠\0\0\0\0\0(\0\0\0(\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\–\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\04\03\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0)\0\0\0)\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\–\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0*\0\0\0*\0\0\0\0\0\0\0@\0\0\0joV\0\0\0d\0b\0o\0\0\0F\0K\0_\0M\0e\0d\0a\0l\0l\0a\0s\0_\0T\0i\0p\0o\0M\0e\0d\0a\0l\0l\0a\0\0\0\0\0\0\0\0\0\0\0\ƒ\0\0\0\0+\0\0\0+\0\0\0*\0\0\0\0\0\0\Ÿlà\Ÿl\0\0\0\0\0\0\0\0≠\0\0\0\0\0,\0\0\0,\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\–\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0-\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\–\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\04\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0.\0\0\0.\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\–\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\0/\0\0\0/\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\–\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\00\0\0\00\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\–\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\01\0\0\01\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\–\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\09\06\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\02\0\0\02\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\–\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\03\0\0\03\0\0\0\0\0\0\08\0\0\0\‚Ω\0\0\0d\0b\0o\0\0\0F\0K\0_\0F\0e\0c\0h\0a\0E\0v\0e\0n\0t\0o\0_\0H\0o\0r\0a\0\0\0\0\0\0\0\0\0\0\0\ƒ\0\0\0\04\0\0\04\0\0\03\0\0\0\0\0\0\ﬁlH\ﬁl\0\0\0\0\0\0\0\0≠\0\0\0\0\05\0\0\05\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\–\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\06\0\0\06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\–\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\0,\02\04\01\02\0,\05\0,\01\05\09\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\03\02\07\06\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\02\09\05\02\0,\01\02\0,\03\04\09\02\0,\01\01\0,\02\01\03\06\0\0\07\0\0\07\0\0\0\0\0\0\06\0\0\0\0\0\0\0\0\0d\0b\0o\0\0\0F\0K\0_\0S\0e\0d\0e\0s\0_\0T\0i\0p\0o\0S\0e\0d\0e\0s\0\0\0\0\0\0\0\0\0\0\0\ƒ\0\0\0\08\0\0\08\0\0\07\0\0\0\0\0\0\rmH\rm\0\0\0\0\0\0\0\0≠\0\0\0\0\09\0\0\09\0\0\0\0\0\0\0X\0\0\0\∆t\0\0\0d\0b\0o\0\0\0F\0K\0_\0P\0r\0e\0g\0u\0n\0t\0a\0s\0F\0r\0e\0c\0u\0e\0n\0t\0e\0s\0_\0T\0i\0p\0o\0P\0r\0e\0g\0u\0n\0t\0a\0\0\0\0\0\0\0\0\0\0\0\ƒ\0\0\0\0:\0\0\0:\0\0\09\0\0\0\0\0\0\rm\rm\0\0\0\0\0\0\0\0≠\0\0\0\0\0;\0\0\0;\0\0\0\0\0\0\0V\0\0\0\∆t\0\0\0d\0b\0o\0\0\0F\0K\0_\0A\0u\0s\0p\0i\0c\0i\0a\0d\0o\0r\0e\0s\0_\0T\0i\0p\0o\0A\0u\0s\0p\0i\0c\0i\0a\0d\0o\0r\0e\0s\0\0\0\0\0\0\0\0\0\0\0\ƒ\0\0\0\0<\0\0\0<\0\0\0;\0\0\0\0\0\0m\»m\0\0\0\0\0\0\0\0≠\0\0\0\0\0=\0\0\0=\0\0\0\0\0\0\0T\0\0\0\∆t\0\0\0d\0b\0o\0\0\0F\0K\0_\0C\0o\0m\0p\0r\0o\0b\0a\0n\0t\0e\0P\0a\0g\0o\0_\0C\0o\0m\0p\0r\0a\0_\0E\0n\0t\0r\0a\0d\0a\0\0\0\0\0\0\0\0\0\0\0\ƒ\0\0\0\0>\0\0\0>\0\0\0=\0\0\0\0\0\0màm\0\0\0\0\0\0\0\0≠\0\0\0\0\0?\0\0\0?\0\0\0\0\0\0\0@\0\0\0joV\0\0\0d\0b\0o\0\0\0F\0K\0_\0U\0s\0u\0a\0r\0i\0o\0s\0_\0T\0i\0p\0o\0U\0s\0u\0a\0r\0i\0o\0\0\0\0\0\0\0\0\0\0\0\ƒ\0\0\0\0@\0\0\0@\0\0\0?\0\0\0\0\0\0màm\0\0\0\0\0\0\0\0≠\0\0\0\0\0A\0\0\0A\0\0\0\0\0\0\08\0\0\0\0\0\0\0\0\0d\0b\0o\0\0\0F\0K\0_\0U\0s\0u\0a\0r\0i\0o\0s\0_\0G\0a\0l\0e\0r\0i\0a\0\0\0\0\0\0\0\0\0\0\0\ƒ\0\0\0\0B\0\0\0B\0\0\0A\0\0\0\0\0\0\nmH\nm\0\0\0\0\0\0\0\0≠\0\0\0\0\0C\0\0\0C\0\0\0\0\0\0\0D\0\0\0\0\'\0\0\0\0d\0b\0o\0\0\0F\0K\0_\0D\0e\0t\0a\0l\0l\0e\0E\0v\0e\0n\0t\0o\0s\0_\0E\0v\0e\0n\0t\0o\0s\0\0\0\0\0\0\0\0\0\0\0\ƒ\0\0\0\0D\0\0\0D\0\0\0C\0\0\0\0\0\0mm\0\0\0\0\0\0\0\0≠\0\0\0\0\0E\0\0\0E\0\0\0\0\0\0\0^\0\0\0joV\0\0\0d\0b\0o\0\0\0F\0K\0_\0C\0o\0m\0i\0t\0e\0O\0r\0g\0a\0n\0i\0z\0a\0d\0o\0r\0_\0T\0i\0p\0o\0R\0e\0p\0r\0e\0s\0e\0n\0t\0a\0n\0t\0e\0\0\0\0\0\0\0\0\0\0\0\ƒ\0\0\0\0F\0\0\0F\0\0\0E\0\0\0\0\0\0\nm\»\nm\0\0\0\0\0\0\0\0≠\0\0\0\0\0G\0\0\0G\0\0\0\0\0\0\0X\0\0\0\∆t\0\0\0d\0b\0o\0\0\0F\0K\0_\0C\0o\0m\0i\0t\0e\0O\0r\0g\0a\0n\0i\0z\0a\0d\0o\0r\0_\0R\0e\0p\0r\0e\0s\0e\0n\0t\0a\0n\0t\0e\0s\0\0\0\0\0\0\0\0\0\0\0\ƒ\0\0\0\0H\0\0\0H\0\0\0G\0\0\0\0\0\0\nm\nm\0\0\0\0\0\0\0\0≠\0\0\0\0\0I\0\0\0I\0\0\0\0\0\0\0V\0\0\0\∆t\0\0\0d\0b\0o\0\0\0F\0K\0_\0I\0n\0s\0t\0i\0t\0u\0c\0i\0o\0n\0a\0l\0_\0T\0i\0p\0o\0I\0n\0s\0t\0i\0t\0u\0c\0i\0o\0n\0a\0l\0\0\0\0\0\0\0\0\0\0\0\ƒ\0\0\0\0J\0\0\0J\0\0\0I\0\0\0\0\0\0m\»m\0\0\0\0\0\0\0\0≠\0\0\0\0\0K\0\0\0K\0\0\0\0\0\0\0Z\0\0\0joV\0\0\0d\0b\0o\0\0\0F\0K\0_\0M\0e\0n\0u\0P\0r\0i\0n\0c\0i\0p\0a\0l\0_\0P\0r\0e\0g\0u\0n\0t\0a\0s\0F\0r\0e\0c\0u\0e\0n\0t\0e\0s\0\0\0\0\0\0\0\0\0\0\0\ƒ\0\0\0\0L\0\0\0L\0\0\0K\0\0\0\0\0\0mHm\0\0\0\0\0\0\0\0≠\0\0\0\0\0M\0\0\0M\0\0\0\0\0\0\0D\0\0\0\0\'\0\0\0\0d\0b\0o\0\0\0F\0K\0_\0E\0v\0e\0n\0t\0o\0s\0_\0H\0o\0r\0a\0r\0i\0o\0E\0v\0e\0n\0t\0o\0s\0\0\0\0\0\0\0\0\0\0\0\ƒ\0\0\0\0N\0\0\0N\0\0\0M\0\0\0\0\0\0màm\0\0\0\0\0\0\0\0≠\0\0\0\0\0O\0\0\0O\0\0\0\0\0\0\0B\0\0\0\0\'\0\0\0\0d\0b\0o\0\0\0F\0K\0_\0D\0e\0p\0o\0r\0t\0e\0D\0e\0s\0t\0a\0c\0a\0d\0o\0_\0P\0a\0i\0s\0\0\0\0\0\0\0\0\0\0\0\ƒ\0\0\0\0P\0\0\0P\0\0\0O\0\0\0\0\0\0	m\»	m\0\0\0\0\0\0\0\0≠\0\0\0\0\0Q\0\0\0Q\0\0\0\0\0\0\0B\0\0\0\0\'\0\0\0\0d\0b\0o\0\0\0F\0K\0_\0M\0e\0n\0u\0P\0r\0i\0n\0c\0i\0p\0a\0l\0_\0G\0a\0l\0e\0r\0i\0a\0\0\0\0\0\0\0\0\0\0\0\ƒ\0\0\0\0R\0\0\0R\0\0\0Q\0\0\0\0\0\0	mH	m\0\0\0\0\0\0\0\0≠\0\0\0\0\0S\0\0\0S\0\0\0\0\0\0\0@\0\0\0joV\0\0\0d\0b\0o\0\0\0F\0K\0_\0D\0e\0p\0o\0r\0t\0i\0s\0t\0a\0s\0_\0U\0s\0u\0a\0r\0i\0o\0s\0\0\0\0\0\0\0\0\0\0\0\ƒ\0\0\0\0T\0\0\0T\0\0\0S\0\0\0\0\0\0mHm\0\0\0\0\0\0\0\0≠\0\0\0\0\0U\0\0\0U\0\0\0\0\0\0\08\0\0\0\0\0\0\0\0\0d\0b\0o\0\0\0F\0K\0_\0D\0e\0p\0o\0r\0t\0i\0s\0t\0a\0s\0_\0P\0a\0i\0s\0\0\0\0\0\0\0\0\0\0\0\ƒ\0\0\0\0V\0\0\0V\0\0\0U\0\0\0\0\0\0	mà	m\0\0\0\0\0\0\0\0≠\0\0\0\0\0W\0\0\0W\0\0\0\0\0\0\0@\0\0\0joV\0\0\0d\0b\0o\0\0\0F\0K\0_\0D\0e\0p\0o\0r\0t\0i\0s\0t\0a\0s\0_\0D\0e\0p\0o\0r\0t\0e\0s\0\0\0\0\0\0\0\0\0\0\0\ƒ\0\0\0\0X\0\0\0X\0\0\0W\0\0\0\0\0\0m\»m\0\0\0\0\0\0\0\0≠\0\0\0\0\0Y\0\0\0Y\0\0\0\0\0\0\0F\0\0\0\0\'\0\0\0\0d\0b\0o\0\0\0F\0K\0_\0D\0e\0p\0o\0r\0t\0e\0s\0_\0D\0e\0t\0a\0l\0l\0e\0D\0e\0p\0o\0r\0t\0e\0\0\0\0\0\0\0\0\0\0\0\ƒ\0\0\0\0Z\0\0\0Z\0\0\0Y\0\0\0\0\0\0áòá\0\0\0\0\0\0\0\0≠\0\0\0\0\0\\\0\0\0\\\0\0\0\0\0\0\0N\0\0\0joV\0\0\0d\0b\0o\0\0\0F\0K\0_\0M\0e\0n\0u\0P\0r\0i\0n\0c\0i\0p\0a\0l\0_\0A\0u\0s\0p\0i\0c\0i\0a\0d\0o\0r\0e\0s\0\0\0\0\0\0\0\0\0\0\0\ƒ\0\0\0\0]\0\0\0]\0\0\0\\\0\0\0\0\0\0˚ÜX˚Ü\0\0\0\0\0\0\0\0≠\0\0\0\0^\0\0\0^\0\0\0\0\0\0\0N\0\0\0joV\0\0\0d\0b\0o\0\0\0F\0K\0_\0M\0e\0n\0u\0P\0r\0i\0n\0c\0i\0p\0a\0l\0_\0I\0n\0s\0t\0i\0t\0u\0c\0i\0o\0n\0a\0l\0\0\0\0\0\0\0\0\0\0\0\ƒ\0\0\0\0_\0\0\0_\0\0\0^\0\0\0\0\0\0\rm\»\rm\0\0\0\0\0\0\0\0≠\0\0\0\0`\0\0\0`\0\0\0\0\0\0\0F\0\0\0\0\'\0\0\0\0d\0b\0o\0\0\0F\0K\0_\0C\0o\0m\0p\0r\0a\0_\0E\0n\0t\0r\0a\0d\0a\0_\0A\0s\0i\0e\0n\0t\0o\0s\0\0\0\0\0\0\0\0\0\0\0\ƒ\0\0\0\0a\0\0\0a\0\0\0`\0\0\0\0\0\0ˇÜXˇÜ\0\0\0\0\0\0\0\0≠\0\0\0\0b\0\0\0b\0\0\0\0\0\0\0V\0\0\0\∆t\0\0\0d\0b\0o\0\0\0F\0K\0_\0M\0e\0n\0u\0P\0r\0i\0n\0c\0i\0p\0a\0l\0_\0C\0o\0m\0i\0t\0e\0O\0r\0g\0a\0n\0i\0z\0a\0d\0o\0r\0\0\0\0\0\0\0\0\0\0\0\ƒ\0\0\0\0c\0\0\0c\0\0\0b\0\0\0\0\0\0ˇÜ\ÿˇÜ\0\0\0\0\0\0\0\0≠\0\0\0\0d\0\0\0d\0\0\0\0\0\0\0>\0\0\0joV\0\0\0d\0b\0o\0\0\0F\0K\0_\0D\0e\0p\0o\0r\0t\0e\0s\0_\0R\0e\0g\0l\0a\0m\0e\0n\0t\0o\0\0\0\0\0\0\0\0\0\0\0\ƒ\0\0\0\0e\0\0\0e\0\0\0d\0\0\0\0\0\0¯l\»¯l\0\0\0\0\0\0\0\0≠\0\0\0\0f\0\0\0f\0\0\0\0\0\0\0F\0\0\0\0\'\0\0\0\0d\0b\0o\0\0\0F\0K\0_\0R\0e\0p\0o\0r\0t\0e\0E\0n\0t\0r\0a\0d\0a\0_\0D\0e\0p\0o\0r\0t\0e\0s\0\0\0\0\0\0\0\0\0\0\0\ƒ\0\0\0\0g\0\0\0g\0\0\0f\0\0\0\0\0\0áòá\0\0\0\0\0\0\0\0≠\0\0\0\0h\0\0\0h\0\0\0\0\0\0\0H\0\0\0\0\'\0\0\0\0d\0b\0o\0\0\0F\0K\0_\0M\0e\0n\0u\0P\0r\0i\0n\0c\0i\0p\0a\0l\0_\0C\0e\0r\0e\0m\0o\0n\0i\0a\0s\0\0\0\0\0\0\0\0\0\0\0\ƒ\0\0\0\0i\0\0\0i\0\0\0h\0\0\0\0\0\0ˆ\ràˆ\r\0\0\0\0\0\0\0\0≠\0\0\0\0j\0\0\0j\0\0\0\0\0\0\0@\0\0\0joV\0\0\0d\0b\0o\0\0\0F\0K\0_\0C\0o\0m\0p\0r\0a\0_\0E\0n\0t\0r\0a\0d\0a\0_\0S\0e\0d\0e\0s\0\0\0\0\0\0\0\0\0\0\0\ƒ\0\0\0\0k\0\0\0k\0\0\0j\0\0\0\0\0\0ﬁΩﬁΩ\0\0\0\0\0\0\0\0≠\0\0\0\0l\0\0\0l\0\0\0\0\0\0\02\0\0\0\‰Ω\0\0\0d\0b\0o\0\0\0F\0K\0_\0E\0v\0e\0n\0t\0o\0s\0_\0S\0e\0d\0e\0s\0\0\0\0\0\0\0\0\0\0\0\ƒ\0\0\0\0m\0\0\0m\0\0\0l\0\0\0\0\0\0\·Ω\·Ω\0\0\0\0\0\0\0\0≠\0\0\0\0t\0\0\0t\0\0\0\0\0\0\08\0\0\0\‚Ω\0\0\0d\0b\0o\0\0\0F\0K\0_\0R\0a\0n\0k\0i\0n\0g\0_\0M\0e\0d\0a\0l\0l\0a\0s\0\0\0\0\0\0\0\0\0\0\0\ƒ\0\0\0\0u\0\0\0u\0\0\0t\0\0\0\0\0\0\ÂΩà\ÂΩ\0\0\0\0\0\0\0\0≠\0\0\0\0v\0\0\0v\0\0\0\0\0\0\0H\0\0\0\0\'\0\0\0\0d\0b\0o\0\0\0F\0K\0_\0D\0e\0p\0o\0r\0t\0e\0D\0e\0s\0t\0a\0c\0a\0d\0o\0_\0R\0a\0n\0k\0i\0n\0g\0\0\0\0\0\0\0\0\0\0\0\ƒ\0\0\0\0w\0\0\0w\0\0\0v\0\0\0\0\0\0\„Ω\„Ω\0\0\0\0\0\0\0\0≠\0\0\0\0x\0\0\0x\0\0\0\0\0\0\0<\0\0\0joV\0\0\0d\0b\0o\0\0\0F\0K\0_\0T\0i\0p\0o\0S\0e\0d\0e\0s\0_\0D\0e\0p\0o\0r\0t\0e\0s\0\0\0\0\0\0\0\0\0\0\0\ƒ\0\0\0\0y\0\0\0y\0\0\0x\0\0\0\0\0\0\‰Ωà\‰Ω\0\0\0\0\0\0\0\0≠\0\0\0\0z\0\0\0z\0\0\0\0\0\0\0:\0\0\0joV\0\0\0d\0b\0o\0\0\0F\0K\0_\0M\0o\0n\0e\0d\0a\0_\0T\0i\0p\0o\0M\0o\0n\0e\0d\0a\0\0\0\0\0\0\0\0\0\0\0\ƒ\0\0\0\0{\0\0\0{\0\0\0z\0\0\0\0\0\0\·Ωà\·Ω\0\0\0\0\0\0\0\0≠\0\0\0\0|\0\0\0|\0\0\0\0\0\0\0F\0\0\0\0\'\0\0\0\0d\0b\0o\0\0\0F\0K\0_\0C\0o\0m\0p\0r\0a\0_\0E\0n\0t\0r\0a\0d\0a\0_\0U\0s\0u\0a\0r\0i\0o\0s\0\0\0\0\0\0\0\0\0\0\0\ƒ\0\0\0\0}\0\0\0}\0\0\0|\0\0\0\0\0\0\‚Ω\»\‚Ω\0\0\0\0\0\0\0\0≠\0\0\0\0~\0\0\0~\0\0\0\0\0\0\0R\0\0\0\∆t\0\0\0d\0b\0o\0\0\0F\0K\0_\0C\0o\0m\0p\0r\0a\0_\0E\0n\0t\0r\0a\0d\0a\0_\0H\0o\0r\0a\0r\0i\0o\0E\0v\0e\0n\0t\0o\0s\0\0\0\0\0\0\0\0\0\0\0\ƒ\0\0\0\0\0\0\0\0\0\0~\0\0\0\0\0\0ﬂΩHﬂΩ\0\0\0\0\0\0\0\0≠\0\0\0\0Ä\0\0\0Ä\0\0\0\0\0\0\0B\0\0\0\0\'\0\0\0\0d\0b\0o\0\0\0F\0K\0_\0C\0o\0m\0p\0r\0a\0_\0E\0n\0t\0r\0a\0d\0a\0_\0M\0o\0n\0e\0d\0a\0\0\0\0\0\0\0\0\0\0\0\ƒ\0\0\0\0Å\0\0\0Å\0\0\0Ä\0\0\0\0\0\0\‚Ω\‚Ω\0\0\0\0\0\0\0\0≠\0\0\0\0Ç\0\0\0Ç\0\0\0\0\0\0\0R\0\0\0\∆t\0\0\0d\0b\0o\0\0\0F\0K\0_\0C\0o\0m\0p\0r\0a\0_\0E\0n\0t\0r\0a\0d\0a\0_\0R\0e\0p\0o\0r\0t\0e\0E\0n\0t\0r\0a\0d\0a\0\0\0\0\0\0\0\0\0\0\0\ƒ\0\0\0\0É\0\0\0É\0\0\0Ç\0\0\0\0\0\0\ÁΩ\ÁΩ\0\0\0\0\0\0\0\0≠\0\0\0\0Ñ\0\0\0Ñ\0\0\0\0\0\0\08\0\0\0\0\0\0\0\0\0d\0b\0o\0\0\0F\0K\0_\0R\0a\0n\0k\0i\0n\0g\0_\0D\0e\0p\0o\0r\0t\0e\0s\0\0\0\0\0\0\0\0\0\0\0\ƒ\0\0\0\0Ö\0\0\0Ö\0\0\0Ñ\0\0\0\0\0\0ﬂΩﬂΩ\0\0\0\0\0\0\0\0≠\0\0\0\0Ü\0\0\0Ü\0\0\0\0\0\0\0>\0\0\0joV\0\0\0d\0b\0o\0\0\0F\0K\0_\0R\0a\0n\0k\0i\0n\0g\0_\0D\0e\0p\0o\0r\0t\0i\0s\0t\0a\0s\0\0\0\0\0\0\0\0\0\0\0\ƒ\0\0\0\0á\0\0\0á\0\0\0Ü\0\0\0\0\0\0\„Ω\»\„Ω\0\0\0\0\0\0\0\0≠\0\0\0\0à\0\0\0à\0\0\0\0\0\0\0L\0\0\0joV\0\0\0d\0b\0o\0\0\0F\0K\0_\0D\0e\0t\0a\0l\0l\0e\0E\0v\0e\0n\0t\0o\0s\0_\0D\0e\0p\0o\0r\0t\0i\0s\0t\0a\0s\0\0\0\0\0\0\0\0\0\0\0\ƒ\0\0\0\0â\0\0\0â\0\0\0à\0\0\0\0\0\0ﬂΩàﬂΩ\0\0\0\0\0\0\0\0≠\0\0\0\0\·\0\0\0`\0\0\0\0\0\0\0\0\0p\0\0\0}\0\0\0\\\0\0\0\0\0\0\Z\0\0\0n\0\0\0m\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0C\0\0\0h\0\0\0\0\0\0\Z\0\0\0{\0\0\0Ñ\0\0\0b\0\0\0\0\0\0\Z\0\0\0,\0\0\0\0\0\0=\0\0\0\0\0\0	\0\0\0à\0\0\0]\0\0\0Ñ\0\0\0\0\0\0\0\0\0ì\0\0\0\0\0\0x\0\0\0\0\0\0/\0\0\0i\0\0\0ä\0\0\0f\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0W\0\0\0\0\0\0\0\0\0á\0\0\0v\0\0\0à\0\0\0\0\0\0\0\0\08\0\0\07\0\0\0Ü\0\0\0\0\0\0\0\0\0Ç\0\0\0Ö\0\0\0Y\0\0\0\r\0\0\0\0\0\0\0\0\0D\0\0\0\0\0\0\0\0\0\0\0\0h\0\0\0q\0\0\0C\0\0\0\0\0\0\0\0\0-\0\0\0&\0\0\0\0\0\0\0\0\0\0\0\0]\0\0\0%\0\0\0A\0\0\0\0\0\01\0\0\0é\0\0\0k\0\0\0Q\0\0\0\0\0\0\Z\0\0\0Ö\0\0\0\\\0\0\0~\0\0\0\0\0\0\0\0\0:\0\0\0\0\0\0M\0\0\0\0\0\0\0\0\0~\0\0\0a\0\0\0^\0\0\0\0\0\0\Z\0\0\0\0\0\0$\0\0\0t\0\0\0\0\0\0\0\0\0]\0\0\0n\0\0\0Ä\0\0\0\0\0\0\0\0\0\0\0\0[\0\0\0K\0\0\0\0\0\0\Z\0\0\0\0\0\0\'\0\0\0v\0\0\0\0\0\0\n\0\0\0\0\0\0\"\0\0\0d\0\0\0\0\0\0\0\0\0Ç\0\0\0]\0\0\0Ç\0\0\0\0\0\0\0\0\0e\0\0\0f\0\0\0G\0\0\0 \0\0\0\0\0\0n\0\0\0É\0\0\0\"\0\0\0!\0\0\0\0\0\0h\0\0\0ù\0\0\0;\0\0\0$\0\0\0\0\0\0\"\0\0\0+\0\0\0&\0\0\0%\0\0\0\0\0\0\0\0\0\0\0\0\0I\0\0\0(\0\0\0\0\0\0\\\0\0\0u\0\0\0*\0\0\0)\0\0\0\0\0\0\0\0\0\0\0\0z\0\0\0,\0\0\0\0\0\0\0\0\07\0\0\09\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0E\0\0\0.\0\0\0\0\0\0]\0\0\0ö\0\0\07\0\0\0/\0\0\06\0\0\0;\0\0\0.\0\0\0?\0\0\00\0\0\01\0\0\0 \0\0\0=\0\0\0|\0\0\01\0\0\0\0\0\0Z\0\0\0#\0\0\0S\0\0\01\0\0\0\0\0\0\∆\0\0\0w\0\0\03\0\0\02\0\0\0\0\0\0F\0\0\0/\0\0\0O\0\0\05\0\0\0\n\0\0\0\\\0\0\0è\0\0\0U\0\0\05\0\0\0\0\0\0>\0\0\0\0\0\0l\0\0\06\0\0\0\0\0\0\0\0\0\0\0\0j\0\0\06\0\0\0\0\0\0Z\0\0\0¨\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0e\0=\04\00\09\06\0;\0A\0p\0p\0l\0i\0c\0a\0t\0i\0o\0n\0 \0N\0a\0m\0e\0=\0\"\0M\0i\0c\0r\0o\0s\0o\0f\0t\0 \0S\0Q\0L\0 \0S\0e\0r\0v\0e\0r\0 \0M\0a\0n\0a\0g\0e\0m\0e\0n\0t\0 \0S\0t\0u\0d\0i\0o\0\"\0\0\0\0Ä\0\0\0\0D\0i\0a\0g\0r\0a\0m\0_\0f\0i\0n\0a\0l\0\0\0\0&\0\0\0\0S\0e\0d\0e\0s\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\n\0\0\0P\0a\0i\0s\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\n\0\0\0H\0o\0r\0a\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0U\0s\0u\0a\0r\0i\0o\0s\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0T\0i\0p\0o\0U\0s\0u\0a\0r\0i\0o\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0T\0i\0p\0o\0S\0e\0d\0e\0s\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0$\0\0\0T\0i\0p\0o\0R\0e\0p\0r\0e\0s\0e\0n\0t\0a\0n\0t\0e\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\Z\0\0\0T\0i\0p\0o\0P\0r\0e\0g\0u\0n\0t\0a\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0T\0i\0p\0o\0M\0o\0n\0e\0d\0a\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0T\0i\0p\0o\0M\0e\0d\0a\0l\0l\0a\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0$\0\0\0T\0i\0p\0o\0I\0n\0s\0t\0i\0t\0u\0c\0i\0o\0n\0a\0l\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0T\0i\0p\0o\0C\0e\0r\0e\0m\0o\0n\0i\0a\0s\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0$\0\0\0T\0i\0p\0o\0A\0u\0s\0p\0i\0c\0i\0a\0d\0o\0r\0e\0s\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0S\0t\0o\0c\0k\0A\0s\0i\0e\0n\0t\0o\0s\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0R\0e\0p\0r\0e\0s\0e\0n\0t\0a\0n\0t\0e\0s\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0R\0e\0p\0o\0r\0t\0e\0E\0n\0t\0r\0a\0d\0a\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0R\0e\0g\0l\0a\0m\0e\0n\0t\0o\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0R\0a\0n\0k\0i\0n\0g\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0(\0\0\0P\0r\0e\0g\0u\0n\0t\0a\0s\0F\0r\0e\0c\0u\0e\0n\0t\0e\0s\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0M\0o\0n\0e\0d\0a\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0M\0e\0n\0u\0P\0r\0i\0n\0c\0i\0p\0a\0l\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0M\0e\0d\0a\0l\0l\0a\0s\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0I\0n\0s\0t\0i\0t\0u\0c\0i\0o\0n\0a\0l\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0H\0o\0r\0a\0r\0i\0o\0E\0v\0e\0n\0t\0o\0s\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0G\0a\0l\0e\0r\0i\0a\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0F\0e\0c\0h\0a\0E\0v\0e\0n\0t\0o\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0E\0v\0e\0n\0t\0o\0s\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0E\0s\0t\0a\0d\0o\0A\0s\0i\0e\0n\0t\0o\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0D\0e\0t\0a\0l\0l\0e\0E\0v\0e\0n\0t\0o\0s\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0D\0e\0t\0a\0l\0l\0e\0D\0e\0p\0o\0r\0t\0e\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0D\0e\0p\0o\0r\0t\0i\0s\0t\0a\0s\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0D\0e\0p\0o\0r\0t\0e\0s\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\"\0\0\0D\0e\0p\0o\0r\0t\0e\0D\0e\0s\0t\0a\0c\0a\0d\0o\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0 \0\0\0C\0o\0m\0p\0r\0o\0b\0a\0n\0t\0e\0P\0a\0g\0o\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0C\0o\0m\0p\0r\0a\0_\0E\0n\0t\0r\0a\0d\0a\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0$\0\0\0C\0o\0m\0i\0t\0e\0O\0r\0g\0a\0n\0i\0z\0a\0d\0o\0r\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0C\0e\0r\0e\0m\0o\0n\0i\0a\0s\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\"\0\0\0C\0a\0t\0e\0g\0o\0r\0i\0a\0A\0s\0i\0e\0n\0t\0o\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0A\0u\0s\0p\0i\0c\0i\0a\0d\0o\0r\0e\0s\0\0\0\0\0\0d\0b\0o\0\0\0\0$\0\0\0\0A\0s\0i\0e\0n\0t\0o\0s\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0÷Ö	≥ªkÚEö∏7d2p\0N\0\0\0{\01\06\03\04\0C\0D\0D\07\0-\00\08\08\08\0-\04\02\0E\03\0-\09\0F\0A\02\0-\0B\06\0D\03\02\05\06\03\0B\09\01\0D\0}\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0bàR');
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
INSERT INTO `tiporepresentante` VALUES (1,'CARLOS NEUHAUS'),(2,'EDUARDO GONZALES CHAVEZ'),(3,'ALEJANDRO GILBERT MORENO BOCANEGRA'),(4,'FERNANDO PERERA DIAZ'),(5,'DANTE JOS√â MANDRIATTI CASTRO'),(6,'PEDRO DEL ROSARIO DELGADO'),(7,'JORGE BARRERA ZEGARRA'),(8,'VICTOR ASPILLAGA ALAYZA'),(9,'KARLA AYALA DE LA CASAS'),(10,'JOS√â MANUEL GIRAU MENDOZA'),(11,'SUSANA VICTORIA C√ìRDOVA AVILA'),(12,'THOMAS BACH'),(13,'LUISA VILLAR G√ÅLVEZ');
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
INSERT INTO `trabajaconnosotros` VALUES (1,'TRABAJA CON NOSOTROS: Las personas que cumplan con los requisitos especificados en las bases de la Convocatoria, deber√°n enviar la documentaci√≥n de acuerdo a las indicaciones brindadas en el cronograma de los Procesos de Selecci√≥n, publicados por la Oficina de Personal de los Juegos.','vista/mgc/img/trabaja.jpg','2019-05-17','');
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
INSERT INTO `unidadorganizacional` VALUES (1,'Unidad de Enlace y Coordinaci√≥n del Soporte Internacional',1),(2,'Unidad Log√≠stica',2),(3,'Unidad Tesorer√≠a',2),(4,'Unidad de Presupuesto',7),(5,'Unidad de Planeamiento y modernizaci√≥n',7),(6,'Subdirecci√≥n de Implementaci√≥n Temporal para la Entrega de Sedes',11),(7,'Subdirecci√≥n de Integraci√≥n operativa',11),(8,'Subdirecci√≥n de obras',12),(9,'Subdirecci√≥n de Recepci√≥n, Liquidaci√≥n y Transferencias de Obras',12),(10,'Subdirecci√≥n de Deportes',13),(11,'Subdirecci√≥n de Gesti√≥n de Sedes',13),(12,'Subdirecci√≥n de Relaciones Internacionales y Protocolo Deportivo',13),(13,'Subdirecci√≥n de Gesti√≥n de Villas',13),(14,'Subdirecci√≥n de Transporte y Seguridad',13),(15,'Subdirecci√≥n de Servicios a los Juegos y Servicios M√©dicos',13),(16,'Subdirecci√≥n de Desarrollo Tecnol√≥gico',14),(17,'Subdirecci√≥n de Transmisiones',14),(18,'Subdirecci√≥n de Comunicaciones, Prensa y Ceremonias',15),(19,'Subdirecci√≥n de Comercializaci√≥n y Mercadotecnia',15);
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
INSERT INTO `vision` VALUES (1,'VISI√ìN: Excelente organizaci√≥n de los XVIII Juegos Panamericanos y Juegos Parapanamericanos del 2019, contribuyendo con el desarrollo del deporte nacional y el posicionamiento internacional de la ciudad de Lima.','vista/mgc/img/vision.jpg','2019-05-17','');
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
