-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `acessorio`
--

DROP TABLE IF EXISTS `acessorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `acessorio` (
  `idAcessorio` int(11) NOT NULL AUTO_INCREMENT,
  `idTipo_Veiculo` int(11) NOT NULL,
  `nomeAcessorio` varchar(45) NOT NULL,
  PRIMARY KEY (`idAcessorio`),
  KEY `idTipo_Veiculo` (`idTipo_Veiculo`),
  CONSTRAINT `acessorio_ibfk_1` FOREIGN KEY (`idTipo_Veiculo`) REFERENCES `tipo_veiculo` (`idtipo_veiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acessorio`
--

LOCK TABLES `acessorio` WRITE;
/*!40000 ALTER TABLE `acessorio` DISABLE KEYS */;
/*!40000 ALTER TABLE `acessorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acessorio_veiculo`
--

DROP TABLE IF EXISTS `acessorio_veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `acessorio_veiculo` (
  `idAcessorio_Veiculo` int(11) NOT NULL AUTO_INCREMENT,
  `idVeiculo` int(11) NOT NULL,
  `idAcessorio` int(11) NOT NULL,
  `qtdAcessorio` int(11) DEFAULT '0',
  `obs` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idAcessorio_Veiculo`),
  KEY `idVeiculo` (`idVeiculo`),
  KEY `idAcessorio` (`idAcessorio`),
  CONSTRAINT `acessorio_veiculo_ibfk_1` FOREIGN KEY (`idVeiculo`) REFERENCES `veiculo` (`idveiculo`) ON DELETE CASCADE,
  CONSTRAINT `acessorio_veiculo_ibfk_2` FOREIGN KEY (`idAcessorio`) REFERENCES `acessorio` (`idacessorio`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acessorio_veiculo`
--

LOCK TABLES `acessorio_veiculo` WRITE;
/*!40000 ALTER TABLE `acessorio_veiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `acessorio_veiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anuncio_venda_veiculo`
--

DROP TABLE IF EXISTS `anuncio_venda_veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `anuncio_venda_veiculo` (
  `idAnuncio_Venda_Veiculo` int(11) NOT NULL AUTO_INCREMENT,
  `idVeiculo` int(11) NOT NULL,
  `aprovado` tinyint(4) DEFAULT '0',
  `observacao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idAnuncio_Venda_Veiculo`),
  KEY `idVeiculo` (`idVeiculo`),
  CONSTRAINT `anuncio_venda_veiculo_ibfk_1` FOREIGN KEY (`idVeiculo`) REFERENCES `veiculo` (`idveiculo`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anuncio_venda_veiculo`
--

LOCK TABLES `anuncio_venda_veiculo` WRITE;
/*!40000 ALTER TABLE `anuncio_venda_veiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `anuncio_venda_veiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assunto`
--

DROP TABLE IF EXISTS `assunto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `assunto` (
  `idAssunto` int(11) NOT NULL AUTO_INCREMENT,
  `assunto` varchar(45) NOT NULL,
  PRIMARY KEY (`idAssunto`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assunto`
--

LOCK TABLES `assunto` WRITE;
/*!40000 ALTER TABLE `assunto` DISABLE KEYS */;
INSERT INTO `assunto` VALUES (1,'Promoção'),(2,'Vendas'),(3,'Aluguel'),(4,'Cadastro de Veiculos');
/*!40000 ALTER TABLE `assunto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avaliacao`
--

DROP TABLE IF EXISTS `avaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `avaliacao` (
  `idAvaliacao` int(11) NOT NULL AUTO_INCREMENT,
  `nota` tinyint(4) NOT NULL,
  `depoimento` text,
  `idLocacao` int(11) NOT NULL,
  PRIMARY KEY (`idAvaliacao`),
  KEY `idLocacao` (`idLocacao`),
  CONSTRAINT `avaliacao_ibfk_1` FOREIGN KEY (`idLocacao`) REFERENCES `locacao` (`idlocacao`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacao`
--

LOCK TABLES `avaliacao` WRITE;
/*!40000 ALTER TABLE `avaliacao` DISABLE KEYS */;
INSERT INTO `avaliacao` VALUES (1,4,'gostei mt',1),(2,2,'legal',1),(3,5,'amei',2),(4,3,'ruim',2),(5,4,'uoou',1);
/*!40000 ALTER TABLE `avaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avaliacao_cliente`
--

DROP TABLE IF EXISTS `avaliacao_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `avaliacao_cliente` (
  `idAvaliacao_Cliente` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL,
  `idAvaliacao` int(11) NOT NULL,
  PRIMARY KEY (`idAvaliacao_Cliente`),
  KEY `idCliente` (`idCliente`),
  KEY `idAvaliacao` (`idAvaliacao`),
  CONSTRAINT `avaliacao_cliente_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idcliente`) ON DELETE CASCADE,
  CONSTRAINT `avaliacao_cliente_ibfk_2` FOREIGN KEY (`idAvaliacao`) REFERENCES `avaliacao` (`idavaliacao`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacao_cliente`
--

LOCK TABLES `avaliacao_cliente` WRITE;
/*!40000 ALTER TABLE `avaliacao_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `avaliacao_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avaliacao_veiculo`
--

DROP TABLE IF EXISTS `avaliacao_veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `avaliacao_veiculo` (
  `idAvaliacao_Veiculo` int(11) NOT NULL AUTO_INCREMENT,
  `idVeiculo` int(11) NOT NULL,
  `idAvaliacao` int(11) NOT NULL,
  PRIMARY KEY (`idAvaliacao_Veiculo`),
  KEY `idVeiculo` (`idVeiculo`),
  KEY `idAvaliacao` (`idAvaliacao`),
  CONSTRAINT `avaliacao_veiculo_ibfk_1` FOREIGN KEY (`idVeiculo`) REFERENCES `veiculo` (`idveiculo`),
  CONSTRAINT `avaliacao_veiculo_ibfk_2` FOREIGN KEY (`idAvaliacao`) REFERENCES `avaliacao` (`idavaliacao`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacao_veiculo`
--

LOCK TABLES `avaliacao_veiculo` WRITE;
/*!40000 ALTER TABLE `avaliacao_veiculo` DISABLE KEYS */;
INSERT INTO `avaliacao_veiculo` VALUES (1,1,1),(2,1,2),(3,2,3),(4,2,4),(5,1,5);
/*!40000 ALTER TABLE `avaliacao_veiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baixa_conta_pagar`
--

DROP TABLE IF EXISTS `baixa_conta_pagar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `baixa_conta_pagar` (
  `idBaixa_Conta_Pagar` int(11) NOT NULL AUTO_INCREMENT,
  `idFuncionario` int(11) NOT NULL,
  `idConta_Pagar` int(11) NOT NULL,
  PRIMARY KEY (`idBaixa_Conta_Pagar`),
  KEY `idConta_Pagar` (`idConta_Pagar`),
  KEY `idFuncionario` (`idFuncionario`),
  CONSTRAINT `baixa_conta_pagar_ibfk_1` FOREIGN KEY (`idConta_Pagar`) REFERENCES `conta_pagar` (`idconta_pagar`),
  CONSTRAINT `baixa_conta_pagar_ibfk_2` FOREIGN KEY (`idFuncionario`) REFERENCES `funcionario` (`idfuncionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baixa_conta_pagar`
--

LOCK TABLES `baixa_conta_pagar` WRITE;
/*!40000 ALTER TABLE `baixa_conta_pagar` DISABLE KEYS */;
/*!40000 ALTER TABLE `baixa_conta_pagar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baixa_conta_receber`
--

DROP TABLE IF EXISTS `baixa_conta_receber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `baixa_conta_receber` (
  `idBaixa_Conta_Receber` int(11) NOT NULL AUTO_INCREMENT,
  `idConta_Receber` int(11) NOT NULL,
  `idFuncionario` int(11) NOT NULL,
  PRIMARY KEY (`idBaixa_Conta_Receber`),
  KEY `idFuncionario` (`idFuncionario`),
  KEY `idConta_Receber` (`idConta_Receber`),
  CONSTRAINT `baixa_conta_receber_ibfk_1` FOREIGN KEY (`idFuncionario`) REFERENCES `funcionario` (`idfuncionario`),
  CONSTRAINT `baixa_conta_receber_ibfk_2` FOREIGN KEY (`idConta_Receber`) REFERENCES `conta_receber` (`idconta_receber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baixa_conta_receber`
--

LOCK TABLES `baixa_conta_receber` WRITE;
/*!40000 ALTER TABLE `baixa_conta_receber` DISABLE KEYS */;
/*!40000 ALTER TABLE `baixa_conta_receber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banco`
--

DROP TABLE IF EXISTS `banco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `banco` (
  `idBanco` int(11) NOT NULL AUTO_INCREMENT,
  `numeroBanco` varchar(5) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `agencia` varchar(45) NOT NULL,
  `conta` varchar(45) NOT NULL,
  `saldo` float NOT NULL,
  PRIMARY KEY (`idBanco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banco`
--

LOCK TABLES `banco` WRITE;
/*!40000 ALTER TABLE `banco` DISABLE KEYS */;
/*!40000 ALTER TABLE `banco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banner`
--

DROP TABLE IF EXISTS `banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `banner` (
  `idBanner` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) NOT NULL,
  `imagem` varchar(100) NOT NULL,
  `texto` text NOT NULL,
  `href` varchar(100) NOT NULL,
  `nomeBotao` varchar(45) NOT NULL,
  `ativo` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`idBanner`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner`
--

LOCK TABLES `banner` WRITE;
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;
INSERT INTO `banner` VALUES (4,'teste','8a510334d2a0a572eca9574a45e7d867.png','bnjkbasdasssssssssssssssssssssssssssssssssssssssssssssssssssasdddddddddddddddddddddddddddddddddddddddddddddddddddsssaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwfaEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEs','kjbjk','jkbjkb',1),(5,'qaaa','4f0b6edcec6c00b35c7a7a791602f425.png','dasasasas','sdfsdf','aaaa',1);
/*!40000 ALTER TABLE `banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cancelamento`
--

DROP TABLE IF EXISTS `cancelamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cancelamento` (
  `idCancelamento` int(11) NOT NULL AUTO_INCREMENT,
  `idLocacao` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `confirmacao` tinyint(4) DEFAULT NULL,
  `motivo` text NOT NULL,
  PRIMARY KEY (`idCancelamento`),
  KEY `idLocacao` (`idLocacao`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `cancelamento_ibfk_1` FOREIGN KEY (`idLocacao`) REFERENCES `locacao` (`idlocacao`),
  CONSTRAINT `cancelamento_ibfk_2` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cancelamento`
--

LOCK TABLES `cancelamento` WRITE;
/*!40000 ALTER TABLE `cancelamento` DISABLE KEYS */;
INSERT INTO `cancelamento` VALUES (1,1,4,1,'A inteligência artificial é um ramo de pesquisa da ciência da computação que busca, através de símbolos computacionais, construir mecanismos e/ou dispositivos que simulem a capacidade do ser humano de pensar, resolver problemas, ou seja, de ser inteligente. O estudo e desenvolvimento desse ramo de pesquisa tiveram início na Segunda Guerra Mundial.');
/*!40000 ALTER TABLE `cancelamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cargo` (
  `idCargo` int(11) NOT NULL AUTO_INCREMENT,
  `idSetor` int(11) NOT NULL,
  `nomeSetor` varchar(45) NOT NULL,
  `descricaoCargo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idCargo`),
  KEY `idSetor` (`idSetor`),
  CONSTRAINT `cargo_ibfk_1` FOREIGN KEY (`idSetor`) REFERENCES `setor` (`idsetor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartao`
--

DROP TABLE IF EXISTS `cartao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cartao` (
  `idCartao` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL,
  `bandeira` varchar(45) NOT NULL,
  `agencia` varchar(45) NOT NULL,
  `conta` varchar(45) NOT NULL,
  PRIMARY KEY (`idCartao`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `cartao_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartao`
--

LOCK TABLES `cartao` WRITE;
/*!40000 ALTER TABLE `cartao` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_veiculo`
--

DROP TABLE IF EXISTS `categoria_veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `categoria_veiculo` (
  `idCategoria_Veiculo` int(11) NOT NULL AUTO_INCREMENT,
  `idTipo_Veiculo` int(11) NOT NULL,
  `nomeCategoria` varchar(45) NOT NULL,
  `porcentagemGanhoEmpresa` float NOT NULL,
  PRIMARY KEY (`idCategoria_Veiculo`),
  KEY `idTipo_Veiculo` (`idTipo_Veiculo`),
  CONSTRAINT `categoria_veiculo_ibfk_1` FOREIGN KEY (`idTipo_Veiculo`) REFERENCES `tipo_veiculo` (`idtipo_veiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_veiculo`
--

LOCK TABLES `categoria_veiculo` WRITE;
/*!40000 ALTER TABLE `categoria_veiculo` DISABLE KEYS */;
INSERT INTO `categoria_veiculo` VALUES (1,1,'Carro de passeio',10),(2,1,'Carro de luxo',20),(3,2,'Moto esportiva',10);
/*!40000 ALTER TABLE `categoria_veiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `cpf` varchar(45) NOT NULL,
  `dtNasc` date DEFAULT NULL,
  `cnh` varchar(45) DEFAULT NULL,
  `categoriaCnh` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `senha` varchar(10) NOT NULL,
  `fotoPerfil` varchar(45) DEFAULT NULL,
  `dataCadastro` date NOT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE KEY `cpf_UNIQUE` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Leonardo','49875265','1970-01-01','54645','A e B','leonardo_cavalcante.07@hotmail.com','123',NULL,'2019-04-02'),(4,'Maria','aaaa','1970-01-01','asda','dada','kaio.wesley074@gmail.com','ada',NULL,'1970-01-01'),(5,'João','5413',NULL,'25452','A','joao@uol','321',NULL,'2019-04-02'),(19,'teste','teste',NULL,'TESTE','a','teste','teste',NULL,'2019-04-02'),(20,'TESTE','TEST',NULL,'TES','A','TEST','TESTE',NULL,'2019-04-02'),(21,'MARIO','jhnvgjh',NULL,'nbv nb ','hnvhn','MARIO','123',NULL,'2019-04-02');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tg_cadastro_cliente_pendencia` AFTER INSERT ON `cliente` FOR EACH ROW begin
	insert into pendencia_cliente(idCliente, motivo) values(NEW.idCliente, 'Aguardando aprovação');
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cliente_endereco`
--

DROP TABLE IF EXISTS `cliente_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cliente_endereco` (
  `idCliente_Endereco` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL,
  `idEndereco` int(11) NOT NULL,
  PRIMARY KEY (`idCliente_Endereco`),
  KEY `idCliente` (`idCliente`),
  KEY `idEndereco` (`idEndereco`),
  CONSTRAINT `cliente_endereco_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idcliente`) ON DELETE CASCADE,
  CONSTRAINT `cliente_endereco_ibfk_2` FOREIGN KEY (`idEndereco`) REFERENCES `endereco` (`idendereco`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_endereco`
--

LOCK TABLES `cliente_endereco` WRITE;
/*!40000 ALTER TABLE `cliente_endereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_telefone`
--

DROP TABLE IF EXISTS `cliente_telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cliente_telefone` (
  `idCliente_Telefone` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL,
  `idTelefone` int(11) NOT NULL,
  PRIMARY KEY (`idCliente_Telefone`),
  KEY `idTelefone` (`idTelefone`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `cliente_telefone_ibfk_1` FOREIGN KEY (`idTelefone`) REFERENCES `telefone` (`idtelefone`) ON DELETE CASCADE,
  CONSTRAINT `cliente_telefone_ibfk_2` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idcliente`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_telefone`
--

LOCK TABLES `cliente_telefone` WRITE;
/*!40000 ALTER TABLE `cliente_telefone` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_telefone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `compra` (
  `idCompra` int(11) NOT NULL AUTO_INCREMENT,
  `valorCompra` float NOT NULL,
  `observacao` varchar(100) NOT NULL,
  `idFuncionario` int(11) NOT NULL,
  `notaFiscal` varchar(45) DEFAULT NULL,
  `dataEntrega` date NOT NULL,
  PRIMARY KEY (`idCompra`),
  KEY `idFuncionario` (`idFuncionario`),
  CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`idFuncionario`) REFERENCES `funcionario` (`idfuncionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_pedido`
--

DROP TABLE IF EXISTS `compra_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `compra_pedido` (
  `idCompra_Pedido` int(11) NOT NULL AUTO_INCREMENT,
  `idCompra` int(11) NOT NULL,
  `idPedido` int(11) NOT NULL,
  PRIMARY KEY (`idCompra_Pedido`),
  KEY `idCompra` (`idCompra`),
  KEY `idPedido` (`idPedido`),
  CONSTRAINT `compra_pedido_ibfk_1` FOREIGN KEY (`idCompra`) REFERENCES `compra` (`idcompra`),
  CONSTRAINT `compra_pedido_ibfk_2` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`idpedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_pedido`
--

LOCK TABLES `compra_pedido` WRITE;
/*!40000 ALTER TABLE `compra_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_produto_fornecedor`
--

DROP TABLE IF EXISTS `compra_produto_fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `compra_produto_fornecedor` (
  `idCompra_Produto_Fornecedor` int(11) NOT NULL AUTO_INCREMENT,
  `idCompra` int(11) NOT NULL,
  `idProduto_Fornecedor` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  PRIMARY KEY (`idCompra_Produto_Fornecedor`),
  KEY `idCompra` (`idCompra`),
  KEY `idProduto_Fornecedor` (`idProduto_Fornecedor`),
  CONSTRAINT `compra_produto_fornecedor_ibfk_1` FOREIGN KEY (`idCompra`) REFERENCES `compra` (`idcompra`),
  CONSTRAINT `compra_produto_fornecedor_ibfk_2` FOREIGN KEY (`idProduto_Fornecedor`) REFERENCES `produto_fornecedor` (`idproduto_fornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_produto_fornecedor`
--

LOCK TABLES `compra_produto_fornecedor` WRITE;
/*!40000 ALTER TABLE `compra_produto_fornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra_produto_fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conta_pagar`
--

DROP TABLE IF EXISTS `conta_pagar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `conta_pagar` (
  `idConta_Pagar` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) DEFAULT NULL,
  `valor` float NOT NULL,
  `vencimento` int(11) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `idBanco` int(11) NOT NULL,
  PRIMARY KEY (`idConta_Pagar`),
  KEY `idBanco` (`idBanco`),
  CONSTRAINT `conta_pagar_ibfk_1` FOREIGN KEY (`idBanco`) REFERENCES `banco` (`idbanco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conta_pagar`
--

LOCK TABLES `conta_pagar` WRITE;
/*!40000 ALTER TABLE `conta_pagar` DISABLE KEYS */;
/*!40000 ALTER TABLE `conta_pagar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conta_pagar_compra`
--

DROP TABLE IF EXISTS `conta_pagar_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `conta_pagar_compra` (
  `idConta_Pagar_Compra` int(11) NOT NULL AUTO_INCREMENT,
  `idCompra` int(11) NOT NULL,
  `idConta_Pagar` int(11) NOT NULL,
  PRIMARY KEY (`idConta_Pagar_Compra`),
  KEY `idCompra` (`idCompra`),
  KEY `idConta_Pagar` (`idConta_Pagar`),
  CONSTRAINT `conta_pagar_compra_ibfk_1` FOREIGN KEY (`idCompra`) REFERENCES `compra` (`idcompra`),
  CONSTRAINT `conta_pagar_compra_ibfk_2` FOREIGN KEY (`idConta_Pagar`) REFERENCES `conta_pagar` (`idconta_pagar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conta_pagar_compra`
--

LOCK TABLES `conta_pagar_compra` WRITE;
/*!40000 ALTER TABLE `conta_pagar_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `conta_pagar_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conta_pagar_funcionario`
--

DROP TABLE IF EXISTS `conta_pagar_funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `conta_pagar_funcionario` (
  `idConta_Pagar_Funcionario` int(11) NOT NULL AUTO_INCREMENT,
  `idFuncionario` int(11) NOT NULL,
  `idConta_Pagar` int(11) NOT NULL,
  PRIMARY KEY (`idConta_Pagar_Funcionario`),
  KEY `idFuncionario` (`idFuncionario`),
  KEY `idConta_Pagar` (`idConta_Pagar`),
  CONSTRAINT `conta_pagar_funcionario_ibfk_1` FOREIGN KEY (`idFuncionario`) REFERENCES `funcionario` (`idfuncionario`),
  CONSTRAINT `conta_pagar_funcionario_ibfk_2` FOREIGN KEY (`idConta_Pagar`) REFERENCES `conta_pagar` (`idconta_pagar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conta_pagar_funcionario`
--

LOCK TABLES `conta_pagar_funcionario` WRITE;
/*!40000 ALTER TABLE `conta_pagar_funcionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `conta_pagar_funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conta_pagar_locacao`
--

DROP TABLE IF EXISTS `conta_pagar_locacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `conta_pagar_locacao` (
  `idConta_Pagar_Locacao` int(11) NOT NULL AUTO_INCREMENT,
  `idConta_Pagar` int(11) NOT NULL,
  `idLocacao` int(11) NOT NULL,
  `extorno` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`idConta_Pagar_Locacao`),
  KEY `idConta_Pagar` (`idConta_Pagar`),
  KEY `idLocacao` (`idLocacao`),
  CONSTRAINT `conta_pagar_locacao_ibfk_1` FOREIGN KEY (`idConta_Pagar`) REFERENCES `conta_pagar` (`idconta_pagar`),
  CONSTRAINT `conta_pagar_locacao_ibfk_2` FOREIGN KEY (`idLocacao`) REFERENCES `locacao` (`idlocacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conta_pagar_locacao`
--

LOCK TABLES `conta_pagar_locacao` WRITE;
/*!40000 ALTER TABLE `conta_pagar_locacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `conta_pagar_locacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conta_receber`
--

DROP TABLE IF EXISTS `conta_receber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `conta_receber` (
  `idConta_Receber` int(11) NOT NULL AUTO_INCREMENT,
  `vencimento` date NOT NULL,
  `idBanco` int(11) NOT NULL,
  `valor` float NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `paga` tinyint(4) DEFAULT NULL,
  `idLocacao` int(11) NOT NULL,
  PRIMARY KEY (`idConta_Receber`),
  KEY `idBanco` (`idBanco`),
  KEY `idLocacao` (`idLocacao`),
  CONSTRAINT `conta_receber_ibfk_1` FOREIGN KEY (`idBanco`) REFERENCES `banco` (`idbanco`),
  CONSTRAINT `conta_receber_ibfk_2` FOREIGN KEY (`idLocacao`) REFERENCES `locacao` (`idlocacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conta_receber`
--

LOCK TABLES `conta_receber` WRITE;
/*!40000 ALTER TABLE `conta_receber` DISABLE KEYS */;
/*!40000 ALTER TABLE `conta_receber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cupom`
--

DROP TABLE IF EXISTS `cupom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cupom` (
  `idCupom` int(11) NOT NULL AUTO_INCREMENT,
  `cupom` varchar(10) NOT NULL,
  `ativo` tinyint(4) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `desconto` float NOT NULL,
  PRIMARY KEY (`idCupom`),
  UNIQUE KEY `cupom_UNIQUE` (`cupom`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `cupom_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupom`
--

LOCK TABLES `cupom` WRITE;
/*!40000 ALTER TABLE `cupom` DISABLE KEYS */;
/*!40000 ALTER TABLE `cupom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devolucaoveiculo`
--

DROP TABLE IF EXISTS `devolucaoveiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `devolucaoveiculo` (
  `idDevolucaoVeiculo` int(11) NOT NULL AUTO_INCREMENT,
  `idLocacao` int(11) NOT NULL,
  `horarioDevolvido` datetime NOT NULL,
  `confirmLocador` tinyint(4) DEFAULT NULL,
  `confirmLocatario` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`idDevolucaoVeiculo`),
  KEY `idLocacao` (`idLocacao`),
  CONSTRAINT `devolucaoveiculo_ibfk_1` FOREIGN KEY (`idLocacao`) REFERENCES `locacao` (`idlocacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devolucaoveiculo`
--

LOCK TABLES `devolucaoveiculo` WRITE;
/*!40000 ALTER TABLE `devolucaoveiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `devolucaoveiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_marketing`
--

DROP TABLE IF EXISTS `email_marketing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `email_marketing` (
  `idEmail_Marketing` int(11) NOT NULL AUTO_INCREMENT,
  `assunto` varchar(100) DEFAULT NULL,
  `corpo` text NOT NULL,
  PRIMARY KEY (`idEmail_Marketing`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_marketing`
--

LOCK TABLES `email_marketing` WRITE;
/*!40000 ALTER TABLE `email_marketing` DISABLE KEYS */;
INSERT INTO `email_marketing` VALUES (1,'Envio de Email para testes','Quer que funcione\r\nVai la ver no Posto Ipiranga'),(2,'321321','321'),(3,'1','1');
/*!40000 ALTER TABLE `email_marketing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_marketing_cliente`
--

DROP TABLE IF EXISTS `email_marketing_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `email_marketing_cliente` (
  `idEmai_Marketing_Cliente` int(11) NOT NULL AUTO_INCREMENT,
  `idEmail_Marketing` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  PRIMARY KEY (`idEmai_Marketing_Cliente`),
  KEY `idEmail_Marketing` (`idEmail_Marketing`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `email_marketing_cliente_ibfk_1` FOREIGN KEY (`idEmail_Marketing`) REFERENCES `email_marketing` (`idemail_marketing`),
  CONSTRAINT `email_marketing_cliente_ibfk_2` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_marketing_cliente`
--

LOCK TABLES `email_marketing_cliente` WRITE;
/*!40000 ALTER TABLE `email_marketing_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_marketing_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_marketing_fale_conosco`
--

DROP TABLE IF EXISTS `email_marketing_fale_conosco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `email_marketing_fale_conosco` (
  `idEmail_Marketing_Fale_Conosco` int(11) NOT NULL AUTO_INCREMENT,
  `idEmail_Marketing` int(11) NOT NULL,
  `idFale_Conosco` int(11) NOT NULL,
  PRIMARY KEY (`idEmail_Marketing_Fale_Conosco`),
  KEY `idEmail_Marketing` (`idEmail_Marketing`),
  KEY `idFale_Conosco` (`idFale_Conosco`),
  CONSTRAINT `email_marketing_fale_conosco_ibfk_1` FOREIGN KEY (`idEmail_Marketing`) REFERENCES `email_marketing` (`idemail_marketing`),
  CONSTRAINT `email_marketing_fale_conosco_ibfk_2` FOREIGN KEY (`idFale_Conosco`) REFERENCES `fale_conosco` (`idfale_conosco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_marketing_fale_conosco`
--

LOCK TABLES `email_marketing_fale_conosco` WRITE;
/*!40000 ALTER TABLE `email_marketing_fale_conosco` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_marketing_fale_conosco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_marketing_parceiro`
--

DROP TABLE IF EXISTS `email_marketing_parceiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `email_marketing_parceiro` (
  `idEmail_Marketing_Parceiro` int(11) NOT NULL AUTO_INCREMENT,
  `idEmail_Marketing` int(11) NOT NULL,
  `idParceiro` int(11) NOT NULL,
  PRIMARY KEY (`idEmail_Marketing_Parceiro`),
  KEY `idEmail_Marketing` (`idEmail_Marketing`),
  KEY `idParceiro` (`idParceiro`),
  CONSTRAINT `email_marketing_parceiro_ibfk_1` FOREIGN KEY (`idEmail_Marketing`) REFERENCES `email_marketing` (`idemail_marketing`),
  CONSTRAINT `email_marketing_parceiro_ibfk_2` FOREIGN KEY (`idParceiro`) REFERENCES `parceiro` (`idparceiro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_marketing_parceiro`
--

LOCK TABLES `email_marketing_parceiro` WRITE;
/*!40000 ALTER TABLE `email_marketing_parceiro` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_marketing_parceiro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `endereco` (
  `idEndereco` int(11) NOT NULL AUTO_INCREMENT,
  `cidade` varchar(45) NOT NULL,
  `UF` varchar(2) NOT NULL,
  `numero` varchar(4) NOT NULL,
  `complemento` varchar(20) DEFAULT NULL,
  `rua` varchar(45) NOT NULL,
  PRIMARY KEY (`idEndereco`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (1,'Jandira','SP','22',NULL,'Rua das Rosas');
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especificacao_cupom`
--

DROP TABLE IF EXISTS `especificacao_cupom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `especificacao_cupom` (
  `idEspecificacao_Cupom` int(11) NOT NULL AUTO_INCREMENT,
  `notaMinimaAvaliacao` int(11) NOT NULL,
  `sequenciaAvaliacao` tinyint(4) NOT NULL,
  `desconto` int(11) NOT NULL,
  PRIMARY KEY (`idEspecificacao_Cupom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especificacao_cupom`
--

LOCK TABLES `especificacao_cupom` WRITE;
/*!40000 ALTER TABLE `especificacao_cupom` DISABLE KEYS */;
/*!40000 ALTER TABLE `especificacao_cupom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fale_conosco`
--

DROP TABLE IF EXISTS `fale_conosco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `fale_conosco` (
  `idFale_Conosco` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `assunto` varchar(100) NOT NULL,
  `mensagem` text NOT NULL,
  PRIMARY KEY (`idFale_Conosco`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fale_conosco`
--

LOCK TABLES `fale_conosco` WRITE;
/*!40000 ALTER TABLE `fale_conosco` DISABLE KEYS */;
INSERT INTO `fale_conosco` VALUES (15,'Kaio','Kaio@gmail.com','Critíca','Vocês deveriam tirar o Tcc\r\n'),(16,'Leonardo ','Leo@Outlook.com','Sugestão','Vocês deveriam tirar o Tcc Por Favor!\r\n'),(17,'Igor','igor@hotmail.com','Sugestão','Vocês deveriam tirar o Tcc Por Favor!\r\nEu quero muito isso !!'),(18,'Emanuelly','emanuelly@bol.com.br','Sugestão','Quero mais Tcc! :)\r\n#ÉVerdadeEsseBilhete'),(19,'Sarah','kaio.algo@gmail.com','Sugestão','sdghfkduyhfli'),(20,'Leonardo ','Leo@Outlook.com','Sugestão','dddddddddd');
/*!40000 ALTER TABLE `fale_conosco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `fornecedor` (
  `idFornecedor` int(11) NOT NULL AUTO_INCREMENT,
  `nomeFantasia` varchar(45) NOT NULL,
  `cnpj` varchar(20) NOT NULL,
  `razaoSocial` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `site` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idFornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor_endereco`
--

DROP TABLE IF EXISTS `fornecedor_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `fornecedor_endereco` (
  `idFornecedor_Endereco` int(11) NOT NULL AUTO_INCREMENT,
  `idFornecedor` int(11) NOT NULL,
  `idEndereco` int(11) NOT NULL,
  PRIMARY KEY (`idFornecedor_Endereco`),
  KEY `idFornecedor` (`idFornecedor`),
  KEY `idEndereco` (`idEndereco`),
  CONSTRAINT `fornecedor_endereco_ibfk_1` FOREIGN KEY (`idFornecedor`) REFERENCES `fornecedor` (`idfornecedor`),
  CONSTRAINT `fornecedor_endereco_ibfk_2` FOREIGN KEY (`idEndereco`) REFERENCES `endereco` (`idendereco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor_endereco`
--

LOCK TABLES `fornecedor_endereco` WRITE;
/*!40000 ALTER TABLE `fornecedor_endereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `fornecedor_endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor_telefone`
--

DROP TABLE IF EXISTS `fornecedor_telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `fornecedor_telefone` (
  `idFornecedor_Telefone` int(11) NOT NULL AUTO_INCREMENT,
  `idfornecedor` int(11) NOT NULL,
  `idTelefone` int(11) NOT NULL,
  PRIMARY KEY (`idFornecedor_Telefone`),
  KEY `idfornecedor` (`idfornecedor`),
  KEY `idTelefone` (`idTelefone`),
  CONSTRAINT `fornecedor_telefone_ibfk_1` FOREIGN KEY (`idfornecedor`) REFERENCES `fornecedor` (`idfornecedor`),
  CONSTRAINT `fornecedor_telefone_ibfk_2` FOREIGN KEY (`idTelefone`) REFERENCES `telefone` (`idtelefone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor_telefone`
--

LOCK TABLES `fornecedor_telefone` WRITE;
/*!40000 ALTER TABLE `fornecedor_telefone` DISABLE KEYS */;
/*!40000 ALTER TABLE `fornecedor_telefone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foto_veiculo`
--

DROP TABLE IF EXISTS `foto_veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `foto_veiculo` (
  `idFoto_Veiculo` int(11) NOT NULL AUTO_INCREMENT,
  `idVeiculo` int(11) NOT NULL,
  `fotoVeiculo` varchar(100) NOT NULL,
  `perfil` varchar(20) NOT NULL,
  PRIMARY KEY (`idFoto_Veiculo`),
  KEY `idVeiculo` (`idVeiculo`),
  CONSTRAINT `foto_veiculo_ibfk_1` FOREIGN KEY (`idVeiculo`) REFERENCES `veiculo` (`idveiculo`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foto_veiculo`
--

LOCK TABLES `foto_veiculo` WRITE;
/*!40000 ALTER TABLE `foto_veiculo` DISABLE KEYS */;
INSERT INTO `foto_veiculo` VALUES (1,2,'carro.jpeg','frontal'),(2,3,'motoHonda.jpg','frontal'),(4,1,'carroUno.jpg','frontal');
/*!40000 ALTER TABLE `foto_veiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionamento`
--

DROP TABLE IF EXISTS `funcionamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `funcionamento` (
  `idFuncionamento` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) NOT NULL,
  `descricao` text NOT NULL,
  `foto` varchar(45) NOT NULL,
  `ativo` int(11) NOT NULL,
  PRIMARY KEY (`idFuncionamento`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionamento`
--

LOCK TABLES `funcionamento` WRITE;
/*!40000 ALTER TABLE `funcionamento` DISABLE KEYS */;
INSERT INTO `funcionamento` VALUES (6,'Como Faço uma Locação','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','69c2bfc3c0e9ec62928cb87394acbcc3.png',1),(7,'Como eu me Cadastro','ooooooooooooooo','c82ceb1f8c44127e6f31ca5db94fae5d.png',1);
/*!40000 ALTER TABLE `funcionamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `funcionario` (
  `idFuncionario` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `rg` varchar(10) NOT NULL,
  `senha` varchar(10) NOT NULL,
  `dataAdmissao` date NOT NULL,
  `dataDemissao` date DEFAULT NULL,
  `salario` float NOT NULL,
  `idCargo` int(11) NOT NULL,
  `permissoesDesktop` int(11) DEFAULT NULL,
  PRIMARY KEY (`idFuncionario`),
  KEY `idCargo` (`idCargo`),
  CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`idCargo`) REFERENCES `cargo` (`idcargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario_telefone`
--

DROP TABLE IF EXISTS `funcionario_telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `funcionario_telefone` (
  `idFuncionario_Telefone` int(11) NOT NULL AUTO_INCREMENT,
  `idFuncionario` int(11) NOT NULL,
  `idTelefone` int(11) NOT NULL,
  PRIMARY KEY (`idFuncionario_Telefone`),
  KEY `idFuncionario` (`idFuncionario`),
  KEY `idTelefone` (`idTelefone`),
  CONSTRAINT `funcionario_telefone_ibfk_1` FOREIGN KEY (`idFuncionario`) REFERENCES `funcionario` (`idfuncionario`),
  CONSTRAINT `funcionario_telefone_ibfk_2` FOREIGN KEY (`idTelefone`) REFERENCES `telefone` (`idtelefone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario_telefone`
--

LOCK TABLES `funcionario_telefone` WRITE;
/*!40000 ALTER TABLE `funcionario_telefone` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionario_telefone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario_veiculo`
--

DROP TABLE IF EXISTS `horario_veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `horario_veiculo` (
  `idHorario_Veiculo` int(11) NOT NULL AUTO_INCREMENT,
  `idVeiculo` int(11) NOT NULL,
  `dia` date NOT NULL,
  `inicioHorario` time DEFAULT NULL,
  `fimHorario` time DEFAULT NULL,
  PRIMARY KEY (`idHorario_Veiculo`),
  KEY `idVeiculo` (`idVeiculo`),
  CONSTRAINT `horario_veiculo_ibfk_1` FOREIGN KEY (`idVeiculo`) REFERENCES `veiculo` (`idveiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario_veiculo`
--

LOCK TABLES `horario_veiculo` WRITE;
/*!40000 ALTER TABLE `horario_veiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `horario_veiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locacao`
--

DROP TABLE IF EXISTS `locacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `locacao` (
  `idLocacao` int(11) NOT NULL AUTO_INCREMENT,
  `idSolicitacao_Locacao` int(11) NOT NULL,
  PRIMARY KEY (`idLocacao`),
  KEY `idSolicitacao_Locador` (`idSolicitacao_Locacao`),
  CONSTRAINT `locacao_ibfk_1` FOREIGN KEY (`idSolicitacao_Locacao`) REFERENCES `solicitacao_locacao` (`idsolicitacao_locacao`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locacao`
--

LOCK TABLES `locacao` WRITE;
/*!40000 ALTER TABLE `locacao` DISABLE KEYS */;
INSERT INTO `locacao` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `locacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `marca` (
  `idMarca` int(11) NOT NULL AUTO_INCREMENT,
  `nomeMarca` varchar(45) NOT NULL,
  PRIMARY KEY (`idMarca`),
  UNIQUE KEY `nomeMarca` (`nomeMarca`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'BMW'),(3,'FIAT'),(2,'HONDA');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensagem_chat`
--

DROP TABLE IF EXISTS `mensagem_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mensagem_chat` (
  `idMensagem_Chat` int(11) NOT NULL AUTO_INCREMENT,
  `idRemetente` int(11) NOT NULL,
  `idDestinatario` int(11) NOT NULL,
  `mensagem` text NOT NULL,
  PRIMARY KEY (`idMensagem_Chat`),
  KEY `idRemetente` (`idRemetente`),
  KEY `idDestinatario` (`idDestinatario`),
  CONSTRAINT `mensagem_chat_ibfk_1` FOREIGN KEY (`idRemetente`) REFERENCES `cliente` (`idcliente`),
  CONSTRAINT `mensagem_chat_ibfk_2` FOREIGN KEY (`idDestinatario`) REFERENCES `cliente` (`idcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensagem_chat`
--

LOCK TABLES `mensagem_chat` WRITE;
/*!40000 ALTER TABLE `mensagem_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `mensagem_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelo`
--

DROP TABLE IF EXISTS `modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `modelo` (
  `idModelo` int(11) NOT NULL AUTO_INCREMENT,
  `idMarca` int(11) NOT NULL,
  `nomeModelo` varchar(45) NOT NULL,
  PRIMARY KEY (`idModelo`),
  UNIQUE KEY `nomeModelo` (`nomeModelo`),
  KEY `idMarca` (`idMarca`),
  CONSTRAINT `modelo_ibfk_1` FOREIGN KEY (`idMarca`) REFERENCES `marca` (`idmarca`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo`
--

LOCK TABLES `modelo` WRITE;
/*!40000 ALTER TABLE `modelo` DISABLE KEYS */;
INSERT INTO `modelo` VALUES (1,3,'UNO'),(2,2,'MOTONA'),(3,2,'MOTINHA');
/*!40000 ALTER TABLE `modelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nivel`
--

DROP TABLE IF EXISTS `nivel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `nivel` (
  `idNivel` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) NOT NULL,
  `descricao` varchar(80) NOT NULL,
  `permissoes` int(11) DEFAULT NULL,
  PRIMARY KEY (`idNivel`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivel`
--

LOCK TABLES `nivel` WRITE;
/*!40000 ALTER TABLE `nivel` DISABLE KEYS */;
INSERT INTO `nivel` VALUES (1,'Administrador','Controla tudo',127),(2,'Marketing','Controla e-mail',127),(4,'teste','123456',80);
/*!40000 ALTER TABLE `nivel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parceiro`
--

DROP TABLE IF EXISTS `parceiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `parceiro` (
  `idParceiro` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `site` varchar(45) DEFAULT NULL,
  `foto` varchar(45) DEFAULT NULL,
  `descricaoParceiro` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `ativo` int(11) NOT NULL,
  PRIMARY KEY (`idParceiro`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parceiro`
--

LOCK TABLES `parceiro` WRITE;
/*!40000 ALTER TABLE `parceiro` DISABLE KEYS */;
INSERT INTO `parceiro` VALUES (42,'Ford','https://www.ford.com.br/','d841c82596337ffd7589d04010abd7e8.png','Ford Motor Company é uma fabricante de automóveis multinacional estadunidense sediada em Dearborn, Michigan, um subúrbio de Detroit. Foi fundada por Henry Ford e incorporada em 16 de junho de 1903.','kaio.wesley074@gmail.com',1),(43,'Sarah Alguma coisa','kakakaakjjjjjjjjjjjjjjjjjjjj','1c8deede837fdbbf163f672d1255eb1c.png','teste','kaio.algo@gmail.com',1);
/*!40000 ALTER TABLE `parceiro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parceiro_endereco`
--

DROP TABLE IF EXISTS `parceiro_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `parceiro_endereco` (
  `idParceiro_Endereco` int(11) NOT NULL AUTO_INCREMENT,
  `idParceiro` int(11) NOT NULL,
  `idEndereco` int(11) NOT NULL,
  PRIMARY KEY (`idParceiro_Endereco`),
  KEY `idEndereco` (`idEndereco`),
  KEY `idParceiro` (`idParceiro`),
  CONSTRAINT `parceiro_endereco_ibfk_1` FOREIGN KEY (`idEndereco`) REFERENCES `endereco` (`idendereco`),
  CONSTRAINT `parceiro_endereco_ibfk_2` FOREIGN KEY (`idParceiro`) REFERENCES `parceiro` (`idparceiro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parceiro_endereco`
--

LOCK TABLES `parceiro_endereco` WRITE;
/*!40000 ALTER TABLE `parceiro_endereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `parceiro_endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parceiro_telefone`
--

DROP TABLE IF EXISTS `parceiro_telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `parceiro_telefone` (
  `idParceiro_Telefone` int(11) NOT NULL AUTO_INCREMENT,
  `idParceiro` int(11) NOT NULL,
  `idTelefone` int(11) NOT NULL,
  PRIMARY KEY (`idParceiro_Telefone`),
  KEY `idParceiro` (`idParceiro`),
  KEY `idTelefone` (`idTelefone`),
  CONSTRAINT `parceiro_telefone_ibfk_1` FOREIGN KEY (`idParceiro`) REFERENCES `parceiro` (`idparceiro`),
  CONSTRAINT `parceiro_telefone_ibfk_2` FOREIGN KEY (`idTelefone`) REFERENCES `telefone` (`idtelefone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parceiro_telefone`
--

LOCK TABLES `parceiro_telefone` WRITE;
/*!40000 ALTER TABLE `parceiro_telefone` DISABLE KEYS */;
/*!40000 ALTER TABLE `parceiro_telefone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pedido` (
  `idPedido` int(11) NOT NULL AUTO_INCREMENT,
  `observacao` varchar(100) DEFAULT NULL,
  `idFuncionario` int(11) NOT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `idFuncionario` (`idFuncionario`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`idFuncionario`) REFERENCES `funcionario` (`idfuncionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_produto_fornecedor`
--

DROP TABLE IF EXISTS `pedido_produto_fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pedido_produto_fornecedor` (
  `idPedido_Produto_Fornecedor` int(11) NOT NULL AUTO_INCREMENT,
  `idPedido` int(11) NOT NULL,
  `idProduto_Fornecedor` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  PRIMARY KEY (`idPedido_Produto_Fornecedor`),
  KEY `idPedido` (`idPedido`),
  KEY `idProduto_Fornecedor` (`idProduto_Fornecedor`),
  CONSTRAINT `pedido_produto_fornecedor_ibfk_1` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`idpedido`),
  CONSTRAINT `pedido_produto_fornecedor_ibfk_2` FOREIGN KEY (`idProduto_Fornecedor`) REFERENCES `produto_fornecedor` (`idproduto_fornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_produto_fornecedor`
--

LOCK TABLES `pedido_produto_fornecedor` WRITE;
/*!40000 ALTER TABLE `pedido_produto_fornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_produto_fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pendencia`
--

DROP TABLE IF EXISTS `pendencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pendencia` (
  `idPendencia` int(11) NOT NULL AUTO_INCREMENT,
  `motivo` text NOT NULL,
  `aberto` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`idPendencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pendencia`
--

LOCK TABLES `pendencia` WRITE;
/*!40000 ALTER TABLE `pendencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `pendencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pendencia_cliente`
--

DROP TABLE IF EXISTS `pendencia_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pendencia_cliente` (
  `idPendencia_Cliente` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL,
  `motivo` text,
  `aberto` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`idPendencia_Cliente`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `pendencia_cliente_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idcliente`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pendencia_cliente`
--

LOCK TABLES `pendencia_cliente` WRITE;
/*!40000 ALTER TABLE `pendencia_cliente` DISABLE KEYS */;
INSERT INTO `pendencia_cliente` VALUES (1,4,'Aguardando aprovação',1),(2,5,'Aguardando aprovação',1),(12,19,'Aguardando aprovação',1),(13,20,'Aguardando aprovação',1),(14,21,'Aguardando aprovação',1);
/*!40000 ALTER TABLE `pendencia_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pendencia_veiculo`
--

DROP TABLE IF EXISTS `pendencia_veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pendencia_veiculo` (
  `idPendencia_Veiculo` int(11) NOT NULL AUTO_INCREMENT,
  `idVeiculo` int(11) NOT NULL,
  `motivo` text NOT NULL,
  `aberto` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`idPendencia_Veiculo`),
  KEY `idVeiculo` (`idVeiculo`),
  CONSTRAINT `pendencia_veiculo_ibfk_1` FOREIGN KEY (`idVeiculo`) REFERENCES `veiculo` (`idveiculo`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pendencia_veiculo`
--

LOCK TABLES `pendencia_veiculo` WRITE;
/*!40000 ALTER TABLE `pendencia_veiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `pendencia_veiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pergunta_frequente`
--

DROP TABLE IF EXISTS `pergunta_frequente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pergunta_frequente` (
  `idPergunta` int(11) NOT NULL AUTO_INCREMENT,
  `pergunta` text NOT NULL,
  `resposta` text,
  `ativo` tinyint(4) NOT NULL,
  PRIMARY KEY (`idPergunta`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pergunta_frequente`
--

LOCK TABLES `pergunta_frequente` WRITE;
/*!40000 ALTER TABLE `pergunta_frequente` DISABLE KEYS */;
INSERT INTO `pergunta_frequente` VALUES (30,'Para Alugar tenho que Ter um cadastro?','Claro que Sim!',1),(31,'Esse Site Funciona ?','Deveria, tudo depende do usuário. ',1);
/*!40000 ALTER TABLE `pergunta_frequente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `produto` (
  `idProduto` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_fornecedor`
--

DROP TABLE IF EXISTS `produto_fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `produto_fornecedor` (
  `idProduto_Fornecedor` int(11) NOT NULL AUTO_INCREMENT,
  `idProduto` int(11) NOT NULL,
  `idFornecedor` int(11) NOT NULL,
  `valor` float NOT NULL,
  PRIMARY KEY (`idProduto_Fornecedor`),
  KEY `idProduto` (`idProduto`),
  KEY `idFornecedor` (`idFornecedor`),
  CONSTRAINT `produto_fornecedor_ibfk_1` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idproduto`),
  CONSTRAINT `produto_fornecedor_ibfk_2` FOREIGN KEY (`idFornecedor`) REFERENCES `fornecedor` (`idfornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_fornecedor`
--

LOCK TABLES `produto_fornecedor` WRITE;
/*!40000 ALTER TABLE `produto_fornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto_fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_fornecedor_unidade_medida`
--

DROP TABLE IF EXISTS `produto_fornecedor_unidade_medida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `produto_fornecedor_unidade_medida` (
  `idProduto_Fornecedor_Unidade_Medida` int(11) NOT NULL AUTO_INCREMENT,
  `idProduto_Fornecedor` int(11) NOT NULL,
  `idUnidade_Medida` int(11) NOT NULL,
  `quantidade` float NOT NULL,
  PRIMARY KEY (`idProduto_Fornecedor_Unidade_Medida`),
  KEY `idProduto_Fornecedor` (`idProduto_Fornecedor`),
  KEY `idUnidade_Medida` (`idUnidade_Medida`),
  CONSTRAINT `produto_fornecedor_unidade_medida_ibfk_1` FOREIGN KEY (`idProduto_Fornecedor`) REFERENCES `produto_fornecedor` (`idproduto_fornecedor`),
  CONSTRAINT `produto_fornecedor_unidade_medida_ibfk_2` FOREIGN KEY (`idUnidade_Medida`) REFERENCES `unidade_medida` (`idunidade_medida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_fornecedor_unidade_medida`
--

LOCK TABLES `produto_fornecedor_unidade_medida` WRITE;
/*!40000 ALTER TABLE `produto_fornecedor_unidade_medida` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto_fornecedor_unidade_medida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setor`
--

DROP TABLE IF EXISTS `setor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `setor` (
  `idSetor` int(11) NOT NULL AUTO_INCREMENT,
  `nomeSetor` varchar(45) NOT NULL,
  PRIMARY KEY (`idSetor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setor`
--

LOCK TABLES `setor` WRITE;
/*!40000 ALTER TABLE `setor` DISABLE KEYS */;
/*!40000 ALTER TABLE `setor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sobre_empresa`
--

DROP TABLE IF EXISTS `sobre_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sobre_empresa` (
  `idSobre_Empresa` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) NOT NULL,
  `texto` text NOT NULL,
  `ativo` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`idSobre_Empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sobre_empresa`
--

LOCK TABLES `sobre_empresa` WRITE;
/*!40000 ALTER TABLE `sobre_empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `sobre_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitacao_locacao`
--

DROP TABLE IF EXISTS `solicitacao_locacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `solicitacao_locacao` (
  `idSolicitacao_Locacao` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL,
  `idVeiculo` int(11) NOT NULL,
  `confirmLocador` tinyint(4) DEFAULT NULL,
  `horarioInicio` datetime NOT NULL,
  `horarioFim` datetime NOT NULL,
  `motivoRecusa` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idSolicitacao_Locacao`),
  KEY `idCliente` (`idCliente`),
  KEY `idVeiculo` (`idVeiculo`),
  CONSTRAINT `solicitacao_locacao_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idcliente`),
  CONSTRAINT `solicitacao_locacao_ibfk_2` FOREIGN KEY (`idVeiculo`) REFERENCES `veiculo` (`idveiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitacao_locacao`
--

LOCK TABLES `solicitacao_locacao` WRITE;
/*!40000 ALTER TABLE `solicitacao_locacao` DISABLE KEYS */;
INSERT INTO `solicitacao_locacao` VALUES (1,4,1,1,'2019-04-15 10:00:00','2019-04-15 16:00:00',NULL),(2,4,2,1,'2019-05-05 10:00:00','2019-05-05 15:00:00',NULL);
/*!40000 ALTER TABLE `solicitacao_locacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefone`
--

DROP TABLE IF EXISTS `telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `telefone` (
  `idTelefone` int(11) NOT NULL AUTO_INCREMENT,
  `idTipoTelefone` int(11) NOT NULL,
  `numero` varchar(12) NOT NULL,
  PRIMARY KEY (`idTelefone`),
  KEY `idTipoTelefone` (`idTipoTelefone`),
  CONSTRAINT `telefone_ibfk_1` FOREIGN KEY (`idTipoTelefone`) REFERENCES `tipotelefone` (`idtipotelefone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefone`
--

LOCK TABLES `telefone` WRITE;
/*!40000 ALTER TABLE `telefone` DISABLE KEYS */;
/*!40000 ALTER TABLE `telefone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `termo`
--

DROP TABLE IF EXISTS `termo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `termo` (
  `idTermo` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) NOT NULL,
  `texto` text NOT NULL,
  `ativo` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`idTermo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `termo`
--

LOCK TABLES `termo` WRITE;
/*!40000 ALTER TABLE `termo` DISABLE KEYS */;
INSERT INTO `termo` VALUES (2,'Termo 1','Talvez você precise registrar-se com a The Coca-Cola Company para obter acesso a determinadas áreas do Site. Com relação a esse registro, nós podemos nos recusar a fornecer a você, ou permitir o uso de, um nome de usuário (ou endereço de e-mail) que já esteja sendo usado por outro usuário; que seja usado para se fazer passar por outra pessoa; que pertença a outra pessoa; que viole a propriedade intelectual ou outros direitos de uma pessoa; que seja ofensivo; ou por outro motivo a nosso critério.',1);
/*!40000 ALTER TABLE `termo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_veiculo`
--

DROP TABLE IF EXISTS `tipo_veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tipo_veiculo` (
  `idTipo_Veiculo` int(11) NOT NULL AUTO_INCREMENT,
  `nomeTipo` varchar(20) NOT NULL,
  PRIMARY KEY (`idTipo_Veiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_veiculo`
--

LOCK TABLES `tipo_veiculo` WRITE;
/*!40000 ALTER TABLE `tipo_veiculo` DISABLE KEYS */;
INSERT INTO `tipo_veiculo` VALUES (1,'Carro'),(2,'Moto'),(3,'Bicicleta');
/*!40000 ALTER TABLE `tipo_veiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipotelefone`
--

DROP TABLE IF EXISTS `tipotelefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tipotelefone` (
  `idtipoTelefone` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipoTelefone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipotelefone`
--

LOCK TABLES `tipotelefone` WRITE;
/*!40000 ALTER TABLE `tipotelefone` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipotelefone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidade_medida`
--

DROP TABLE IF EXISTS `unidade_medida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `unidade_medida` (
  `idUnidade_Medida` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`idUnidade_Medida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidade_medida`
--

LOCK TABLES `unidade_medida` WRITE;
/*!40000 ALTER TABLE `unidade_medida` DISABLE KEYS */;
/*!40000 ALTER TABLE `unidade_medida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_web`
--

DROP TABLE IF EXISTS `usuario_web`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `usuario_web` (
  `idUsuario_Web` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `senha` varchar(10) NOT NULL,
  `idNivel` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`idUsuario_Web`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `idNivel` (`idNivel`),
  CONSTRAINT `usuario_web_ibfk_1` FOREIGN KEY (`idNivel`) REFERENCES `nivel` (`idnivel`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_web`
--

LOCK TABLES `usuario_web` WRITE;
/*!40000 ALTER TABLE `usuario_web` DISABLE KEYS */;
INSERT INTO `usuario_web` VALUES (1,'teste@teste','teste',1,'teste'),(2,'sdasd@dsad','igor',2,'igor'),(12,'kaio.wesley074@gmail.com','teste',1,'Kaio'),(13,'marcao@marc','a',1,'marcao');
/*!40000 ALTER TABLE `usuario_web` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_detalhes_locacao`
--

DROP TABLE IF EXISTS `v_detalhes_locacao`;
/*!50001 DROP VIEW IF EXISTS `v_detalhes_locacao`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `v_detalhes_locacao` AS SELECT 
 1 AS `ID locação`,
 1 AS `Locatário`,
 1 AS `Locador`,
 1 AS `Veiculo`,
 1 AS `Inicio`,
 1 AS `Fim`,
 1 AS `Valor total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vanuncios_mobile`
--

DROP TABLE IF EXISTS `vanuncios_mobile`;
/*!50001 DROP VIEW IF EXISTS `vanuncios_mobile`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `vanuncios_mobile` AS SELECT 
 1 AS `idVeiculo`,
 1 AS `nomeModelo`,
 1 AS `nomeMarca`,
 1 AS `fotoVeiculo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vavaliacao_veiculo`
--

DROP TABLE IF EXISTS `vavaliacao_veiculo`;
/*!50001 DROP VIEW IF EXISTS `vavaliacao_veiculo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `vavaliacao_veiculo` AS SELECT 
 1 AS `idVeiculo`,
 1 AS `nomeModelo`,
 1 AS `nomeMarca`,
 1 AS `depoimento`,
 1 AS `nota`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `veiculo`
--

DROP TABLE IF EXISTS `veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `veiculo` (
  `idVeiculo` int(11) NOT NULL AUTO_INCREMENT,
  `idCategoria_Veiculo` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `cor` varchar(45) NOT NULL,
  `altura` float NOT NULL,
  `comprimento` float NOT NULL,
  `largura` float NOT NULL,
  `valorHora` float DEFAULT NULL,
  `ano` int(11) NOT NULL,
  `quilometragem` int(11) DEFAULT NULL,
  `valorVenda` float DEFAULT NULL,
  `idEndereco` int(11) NOT NULL,
  `idModelo` int(11) NOT NULL,
  PRIMARY KEY (`idVeiculo`),
  KEY `idCategoria_Veiculo` (`idCategoria_Veiculo`),
  KEY `idCliente` (`idCliente`),
  KEY `idEndereco` (`idEndereco`),
  KEY `idModelo_idx` (`idModelo`),
  CONSTRAINT `veiculo_ibfk_1` FOREIGN KEY (`idCategoria_Veiculo`) REFERENCES `categoria_veiculo` (`idcategoria_veiculo`),
  CONSTRAINT `veiculo_ibfk_2` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idcliente`),
  CONSTRAINT `veiculo_ibfk_3` FOREIGN KEY (`idEndereco`) REFERENCES `endereco` (`idendereco`),
  CONSTRAINT `veiculo_ibfk_4` FOREIGN KEY (`idModelo`) REFERENCES `modelo` (`idmodelo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculo`
--

LOCK TABLES `veiculo` WRITE;
/*!40000 ALTER TABLE `veiculo` DISABLE KEYS */;
INSERT INTO `veiculo` VALUES (1,1,1,'vermelho',2,1,1,5,1999,50000,80000,1,1),(2,2,1,'preto',2,1,2,10,2000,0,100000,1,3),(3,3,1,'vermelho',2,1,1,50,2017,0,800000,1,1);
/*!40000 ALTER TABLE `veiculo` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tg_cadastro_veiculo_pendencia` AFTER INSERT ON `veiculo` FOR EACH ROW begin
	insert into pendencia_veiculo(idVeiculo, motivo) values(NEW.idVeiculo, 'Aguardando aprovação do cadastro');
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `vpendencia_cliente`
--

DROP TABLE IF EXISTS `vpendencia_cliente`;
/*!50001 DROP VIEW IF EXISTS `vpendencia_cliente`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `vpendencia_cliente` AS SELECT 
 1 AS `idPendencia`,
 1 AS `nome`,
 1 AS `id`,
 1 AS `motivo`,
 1 AS `aberto`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vpendencia_veiculo`
--

DROP TABLE IF EXISTS `vpendencia_veiculo`;
/*!50001 DROP VIEW IF EXISTS `vpendencia_veiculo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `vpendencia_veiculo` AS SELECT 
 1 AS `idPendencia`,
 1 AS `nome`,
 1 AS `id`,
 1 AS `motivo`,
 1 AS `aberto`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vvisualizacao_cancelamento`
--

DROP TABLE IF EXISTS `vvisualizacao_cancelamento`;
/*!50001 DROP VIEW IF EXISTS `vvisualizacao_cancelamento`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `vvisualizacao_cancelamento` AS SELECT 
 1 AS `idCancelamento`,
 1 AS `idLocacao`,
 1 AS `nome`,
 1 AS `idCliente`,
 1 AS `confirmacao`,
 1 AS `motivo`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'mydb'
--

--
-- Dumping routines for database 'mydb'
--

--
-- Final view structure for view `v_detalhes_locacao`
--

/*!50001 DROP VIEW IF EXISTS `v_detalhes_locacao`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_detalhes_locacao` AS select `l`.`idLocacao` AS `ID locação`,`cl`.`nome` AS `Locatário`,`cl2`.`nome` AS `Locador`,concat(`ma`.`nomeMarca`,' ',`mo`.`nomeModelo`) AS `Veiculo`,`sl`.`horarioInicio` AS `Inicio`,`sl`.`horarioFim` AS `Fim`,(`v`.`valorHora` * ceiling(((select timestampdiff(MINUTE,`solicitacao_locacao`.`horarioInicio`,`solicitacao_locacao`.`horarioFim`) from `solicitacao_locacao` where (`solicitacao_locacao`.`idSolicitacao_Locacao` = 1)) / 60))) AS `Valor total` from ((((((`solicitacao_locacao` `sl` join `cliente` `cl` on((`sl`.`idCliente` = `cl`.`idCliente`))) join `veiculo` `v` on((`v`.`idVeiculo` = `sl`.`idVeiculo`))) join `cliente` `cl2` on((`cl2`.`idCliente` = `v`.`idCliente`))) join `locacao` `l` on((`l`.`idSolicitacao_Locacao` = `sl`.`idSolicitacao_Locacao`))) join `modelo` `mo` on((`mo`.`idModelo` = `v`.`idModelo`))) join `marca` `ma` on((`ma`.`idMarca` = `mo`.`idMarca`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vanuncios_mobile`
--

/*!50001 DROP VIEW IF EXISTS `vanuncios_mobile`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vanuncios_mobile` AS select `v`.`idVeiculo` AS `idVeiculo`,`mo`.`nomeModelo` AS `nomeModelo`,`ma`.`nomeMarca` AS `nomeMarca`,`ft`.`fotoVeiculo` AS `fotoVeiculo` from (((`veiculo` `v` join `modelo` `mo` on((`v`.`idModelo` = `mo`.`idModelo`))) join `marca` `ma` on((`ma`.`idMarca` = `mo`.`idMarca`))) join `foto_veiculo` `ft` on((`ft`.`idVeiculo` = `v`.`idVeiculo`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vavaliacao_veiculo`
--

/*!50001 DROP VIEW IF EXISTS `vavaliacao_veiculo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vavaliacao_veiculo` AS select distinct `v`.`idVeiculo` AS `idVeiculo`,`mo`.`nomeModelo` AS `nomeModelo`,`ma`.`nomeMarca` AS `nomeMarca`,`a`.`depoimento` AS `depoimento`,`a`.`nota` AS `nota` from ((((`avaliacao_veiculo` `av` join `veiculo` `v` on((`v`.`idVeiculo` = `av`.`idVeiculo`))) join `modelo` `mo` on((`v`.`idModelo` = `mo`.`idModelo`))) join `marca` `ma` on((`mo`.`idMarca` = `ma`.`idMarca`))) join `avaliacao` `a` on((`a`.`idAvaliacao` = `av`.`idAvaliacao`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vpendencia_cliente`
--

/*!50001 DROP VIEW IF EXISTS `vpendencia_cliente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vpendencia_cliente` AS select `p`.`idPendencia_Cliente` AS `idPendencia`,`c`.`nome` AS `nome`,`c`.`idCliente` AS `id`,`p`.`motivo` AS `motivo`,`p`.`aberto` AS `aberto` from (`pendencia_cliente` `p` join `cliente` `c` on((`p`.`idCliente` = `c`.`idCliente`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vpendencia_veiculo`
--

/*!50001 DROP VIEW IF EXISTS `vpendencia_veiculo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vpendencia_veiculo` AS select `pv`.`idPendencia_Veiculo` AS `idPendencia`,concat(`mar`.`nomeMarca`,' ',`m`.`nomeModelo`) AS `nome`,`v`.`idVeiculo` AS `id`,`pv`.`motivo` AS `motivo`,`pv`.`aberto` AS `aberto` from (((`pendencia_veiculo` `pv` join `veiculo` `v` on((`pv`.`idVeiculo` = `v`.`idVeiculo`))) join `modelo` `m` on((`m`.`idModelo` = `v`.`idModelo`))) join `marca` `mar` on((`m`.`idMarca` = `mar`.`idMarca`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vvisualizacao_cancelamento`
--

/*!50001 DROP VIEW IF EXISTS `vvisualizacao_cancelamento`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vvisualizacao_cancelamento` AS select `c`.`idCancelamento` AS `idCancelamento`,`l`.`idLocacao` AS `idLocacao`,`cl`.`nome` AS `nome`,`cl`.`idCliente` AS `idCliente`,`c`.`confirmacao` AS `confirmacao`,`c`.`motivo` AS `motivo` from (((`cancelamento` `c` join `locacao` `l` on(`l`.`idLocacao`)) join `solicitacao_locacao` `sl` on((`sl`.`idSolicitacao_Locacao` = `l`.`idSolicitacao_Locacao`))) join `cliente` `cl` on((`cl`.`idCliente` = `sl`.`idCliente`))) where isnull(`c`.`confirmacao`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-05 19:35:32
