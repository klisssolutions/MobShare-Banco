-- --------------------------------------------------------
-- Servidor:                     192.168.0.2
-- Versão do servidor:           5.5.35-0+wheezy1 - (Debian)
-- OS do Servidor:               debian-linux-gnu
-- HeidiSQL Versão:              10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura para tabela dbmob.acessorio
DROP TABLE IF EXISTS `acessorio`;
CREATE TABLE IF NOT EXISTS `acessorio` (
  `idAcessorio` int(11) NOT NULL AUTO_INCREMENT,
  `idTipo_Veiculo` int(11) NOT NULL,
  `nomeAcessorio` varchar(45) NOT NULL,
  PRIMARY KEY (`idAcessorio`),
  KEY `idTipo_Veiculo` (`idTipo_Veiculo`),
  CONSTRAINT `acessorio_ibfk_1` FOREIGN KEY (`idTipo_Veiculo`) REFERENCES `tipo_veiculo` (`idtipo_veiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.acessorio: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `acessorio` DISABLE KEYS */;
INSERT INTO `acessorio` (`idAcessorio`, `idTipo_Veiculo`, `nomeAcessorio`) VALUES
	(1, 1, 'Cadeirinha de bebê'),
	(2, 1, 'Air bag'),
	(3, 1, 'Alarme'),
	(4, 2, 'Alarme'),
	(5, 2, 'Antena corta pipa'),
	(6, 3, 'Buzina');
/*!40000 ALTER TABLE `acessorio` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.acessorio_veiculo
DROP TABLE IF EXISTS `acessorio_veiculo`;
CREATE TABLE IF NOT EXISTS `acessorio_veiculo` (
  `idAcessorio_Veiculo` int(11) NOT NULL AUTO_INCREMENT,
  `idVeiculo` int(11) NOT NULL,
  `idAcessorio` int(11) NOT NULL,
  `qtdAcessorio` int(11) DEFAULT '0',
  `obs` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idAcessorio_Veiculo`),
  KEY `idVeiculo` (`idVeiculo`),
  KEY `idAcessorio` (`idAcessorio`),
  CONSTRAINT `acessorio_veiculo_ibfk_1` FOREIGN KEY (`idVeiculo`) REFERENCES `veiculo` (`idveiculo`) ON DELETE CASCADE,
  CONSTRAINT `acessorio_veiculo_ibfk_2` FOREIGN KEY (`idAcessorio`) REFERENCES `acessorio` (`idAcessorio`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.acessorio_veiculo: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `acessorio_veiculo` DISABLE KEYS */;
INSERT INTO `acessorio_veiculo` (`idAcessorio_Veiculo`, `idVeiculo`, `idAcessorio`, `qtdAcessorio`, `obs`) VALUES
	(1, 1, 1, 1, NULL),
	(2, 1, 2, 1, NULL);
/*!40000 ALTER TABLE `acessorio_veiculo` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.anuncio_venda_veiculo
DROP TABLE IF EXISTS `anuncio_venda_veiculo`;
CREATE TABLE IF NOT EXISTS `anuncio_venda_veiculo` (
  `idAnuncio_Venda_Veiculo` int(11) NOT NULL AUTO_INCREMENT,
  `idVeiculo` int(11) NOT NULL,
  `aprovado` tinyint(4) DEFAULT '0',
  `observacao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idAnuncio_Venda_Veiculo`),
  KEY `idVeiculo` (`idVeiculo`),
  CONSTRAINT `anuncio_venda_veiculo_ibfk_1` FOREIGN KEY (`idVeiculo`) REFERENCES `veiculo` (`idveiculo`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.anuncio_venda_veiculo: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `anuncio_venda_veiculo` DISABLE KEYS */;
INSERT INTO `anuncio_venda_veiculo` (`idAnuncio_Venda_Veiculo`, `idVeiculo`, `aprovado`, `observacao`) VALUES
	(1, 1, 1, NULL);
/*!40000 ALTER TABLE `anuncio_venda_veiculo` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.assunto
DROP TABLE IF EXISTS `assunto`;
CREATE TABLE IF NOT EXISTS `assunto` (
  `idAssunto` int(11) NOT NULL AUTO_INCREMENT,
  `assunto` varchar(45) NOT NULL,
  PRIMARY KEY (`idAssunto`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.assunto: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `assunto` DISABLE KEYS */;
INSERT INTO `assunto` (`idAssunto`, `assunto`) VALUES
	(1, 'Promoção'),
	(2, 'Vendas'),
	(3, 'Aluguel'),
	(4, 'Cadastro de Veiculos');
/*!40000 ALTER TABLE `assunto` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.avaliacao
DROP TABLE IF EXISTS `avaliacao`;
CREATE TABLE IF NOT EXISTS `avaliacao` (
  `idAvaliacao` int(11) NOT NULL AUTO_INCREMENT,
  `nota` tinyint(4) NOT NULL,
  `depoimento` text,
  `idLocacao` int(11) NOT NULL,
  PRIMARY KEY (`idAvaliacao`),
  KEY `idLocacao` (`idLocacao`),
  CONSTRAINT `avaliacao_ibfk_1` FOREIGN KEY (`idLocacao`) REFERENCES `locacao` (`idlocacao`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.avaliacao: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `avaliacao` DISABLE KEYS */;
INSERT INTO `avaliacao` (`idAvaliacao`, `nota`, `depoimento`, `idLocacao`) VALUES
	(1, 4, 'gostei mt', 1);
/*!40000 ALTER TABLE `avaliacao` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.avaliacao_cliente
DROP TABLE IF EXISTS `avaliacao_cliente`;
CREATE TABLE IF NOT EXISTS `avaliacao_cliente` (
  `idAvaliacao_Cliente` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL,
  `idAvaliacao` int(11) NOT NULL,
  PRIMARY KEY (`idAvaliacao_Cliente`),
  KEY `idCliente` (`idCliente`),
  KEY `idAvaliacao` (`idAvaliacao`),
  CONSTRAINT `avaliacao_cliente_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idcliente`) ON DELETE CASCADE,
  CONSTRAINT `avaliacao_cliente_ibfk_2` FOREIGN KEY (`idAvaliacao`) REFERENCES `avaliacao` (`idAvaliacao`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.avaliacao_cliente: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `avaliacao_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `avaliacao_cliente` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.avaliacao_veiculo
DROP TABLE IF EXISTS `avaliacao_veiculo`;
CREATE TABLE IF NOT EXISTS `avaliacao_veiculo` (
  `idAvaliacao_Veiculo` int(11) NOT NULL AUTO_INCREMENT,
  `idVeiculo` int(11) NOT NULL,
  `idAvaliacao` int(11) NOT NULL,
  PRIMARY KEY (`idAvaliacao_Veiculo`),
  KEY `idVeiculo` (`idVeiculo`),
  KEY `idAvaliacao` (`idAvaliacao`),
  CONSTRAINT `avaliacao_veiculo_ibfk_1` FOREIGN KEY (`idVeiculo`) REFERENCES `veiculo` (`idveiculo`),
  CONSTRAINT `avaliacao_veiculo_ibfk_2` FOREIGN KEY (`idAvaliacao`) REFERENCES `avaliacao` (`idAvaliacao`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.avaliacao_veiculo: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `avaliacao_veiculo` DISABLE KEYS */;
INSERT INTO `avaliacao_veiculo` (`idAvaliacao_Veiculo`, `idVeiculo`, `idAvaliacao`) VALUES
	(1, 1, 1);
/*!40000 ALTER TABLE `avaliacao_veiculo` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.baixa_conta_pagar
DROP TABLE IF EXISTS `baixa_conta_pagar`;
CREATE TABLE IF NOT EXISTS `baixa_conta_pagar` (
  `idBaixa_Conta_Pagar` int(11) NOT NULL AUTO_INCREMENT,
  `idFuncionario` int(11) NOT NULL,
  `idConta_Pagar` int(11) NOT NULL,
  PRIMARY KEY (`idBaixa_Conta_Pagar`),
  KEY `idConta_Pagar` (`idConta_Pagar`),
  KEY `idFuncionario` (`idFuncionario`),
  CONSTRAINT `baixa_conta_pagar_ibfk_1` FOREIGN KEY (`idConta_Pagar`) REFERENCES `conta_pagar` (`idconta_pagar`),
  CONSTRAINT `baixa_conta_pagar_ibfk_2` FOREIGN KEY (`idFuncionario`) REFERENCES `funcionario` (`idfuncionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.baixa_conta_pagar: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `baixa_conta_pagar` DISABLE KEYS */;
/*!40000 ALTER TABLE `baixa_conta_pagar` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.baixa_conta_receber
DROP TABLE IF EXISTS `baixa_conta_receber`;
CREATE TABLE IF NOT EXISTS `baixa_conta_receber` (
  `idBaixa_Conta_Receber` int(11) NOT NULL AUTO_INCREMENT,
  `idConta_Receber` int(11) NOT NULL,
  `idFuncionario` int(11) NOT NULL,
  PRIMARY KEY (`idBaixa_Conta_Receber`),
  KEY `idFuncionario` (`idFuncionario`),
  KEY `idConta_Receber` (`idConta_Receber`),
  CONSTRAINT `baixa_conta_receber_ibfk_1` FOREIGN KEY (`idFuncionario`) REFERENCES `funcionario` (`idfuncionario`),
  CONSTRAINT `baixa_conta_receber_ibfk_2` FOREIGN KEY (`idConta_Receber`) REFERENCES `conta_receber` (`idconta_receber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.baixa_conta_receber: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `baixa_conta_receber` DISABLE KEYS */;
/*!40000 ALTER TABLE `baixa_conta_receber` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.banco
DROP TABLE IF EXISTS `banco`;
CREATE TABLE IF NOT EXISTS `banco` (
  `idBanco` int(11) NOT NULL AUTO_INCREMENT,
  `numeroBanco` varchar(5) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `agencia` varchar(45) NOT NULL,
  `conta` varchar(45) NOT NULL,
  `saldo` float NOT NULL,
  `receiver` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`idBanco`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.banco: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `banco` DISABLE KEYS */;
INSERT INTO `banco` (`idBanco`, `numeroBanco`, `nome`, `agencia`, `conta`, `saldo`, `receiver`) VALUES
	(1, '063', 'Bradesco', '072', '10', 50001, 1);
/*!40000 ALTER TABLE `banco` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.banner
DROP TABLE IF EXISTS `banner`;
CREATE TABLE IF NOT EXISTS `banner` (
  `idBanner` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) NOT NULL,
  `imagem` varchar(100) NOT NULL,
  `texto` text NOT NULL,
  `href` varchar(100) NOT NULL,
  `nomeBotao` varchar(45) NOT NULL,
  `ativo` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`idBanner`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.banner: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;
INSERT INTO `banner` (`idBanner`, `titulo`, `imagem`, `texto`, `href`, `nomeBotao`, `ativo`) VALUES
	(4, 'Ganhe dinheiro!', '724c4d9607e27894f21df14c6be64ef0.png', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'kjbjk', 'jkbjkb', 1),
	(5, 'Baixe o APP!', 'ap.png', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'sdfsdf', 'BAIXAR', 1);
/*!40000 ALTER TABLE `banner` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.cancelamento
DROP TABLE IF EXISTS `cancelamento`;
CREATE TABLE IF NOT EXISTS `cancelamento` (
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

-- Copiando dados para a tabela dbmob.cancelamento: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `cancelamento` DISABLE KEYS */;
INSERT INTO `cancelamento` (`idCancelamento`, `idLocacao`, `idCliente`, `confirmacao`, `motivo`) VALUES
	(1, 1, 4, NULL, 'A inteligência artificial é um ramo de pesquisa da ciência da computação que busca, através de símbolos computacionais, construir mecanismos e/ou dispositivos que simulem a capacidade do ser humano de pensar, resolver problemas, ou seja, de ser inteligente. O estudo e desenvolvimento desse ramo de pesquisa tiveram início na Segunda Guerra Mundial.');
/*!40000 ALTER TABLE `cancelamento` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.cargo
DROP TABLE IF EXISTS `cargo`;
CREATE TABLE IF NOT EXISTS `cargo` (
  `idCargo` int(11) NOT NULL AUTO_INCREMENT,
  `idSetor` int(11) NOT NULL,
  `nomeSetor` varchar(45) NOT NULL,
  `descricaoCargo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idCargo`),
  KEY `idSetor` (`idSetor`),
  CONSTRAINT `cargo_ibfk_1` FOREIGN KEY (`idSetor`) REFERENCES `setor` (`idsetor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.cargo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.cartao
DROP TABLE IF EXISTS `cartao`;
CREATE TABLE IF NOT EXISTS `cartao` (
  `idCartao` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL,
  `bandeira` varchar(45) NOT NULL,
  `agencia` varchar(45) NOT NULL,
  `conta` varchar(45) NOT NULL,
  PRIMARY KEY (`idCartao`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `cartao_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.cartao: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cartao` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartao` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.categoria_veiculo
DROP TABLE IF EXISTS `categoria_veiculo`;
CREATE TABLE IF NOT EXISTS `categoria_veiculo` (
  `idCategoria_Veiculo` int(11) NOT NULL AUTO_INCREMENT,
  `idTipo_Veiculo` int(11) NOT NULL,
  `nomeCategoria` varchar(45) NOT NULL,
  `porcentagemGanhoEmpresa` float NOT NULL,
  PRIMARY KEY (`idCategoria_Veiculo`),
  KEY `idTipo_Veiculo` (`idTipo_Veiculo`),
  CONSTRAINT `categoria_veiculo_ibfk_1` FOREIGN KEY (`idTipo_Veiculo`) REFERENCES `tipo_veiculo` (`idtipo_veiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.categoria_veiculo: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `categoria_veiculo` DISABLE KEYS */;
INSERT INTO `categoria_veiculo` (`idCategoria_Veiculo`, `idTipo_Veiculo`, `nomeCategoria`, `porcentagemGanhoEmpresa`) VALUES
	(1, 1, 'Carro', 10),
	(2, 1, 'Moto', 20),
	(3, 2, 'Bicicleta', 10);
/*!40000 ALTER TABLE `categoria_veiculo` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.cliente
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
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
) ENGINE=InnoDB AUTO_INCREMENT=364 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.cliente: ~13 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`idCliente`, `nome`, `cpf`, `dtNasc`, `cnh`, `categoriaCnh`, `email`, `senha`, `fotoPerfil`, `dataCadastro`) VALUES
	(1, 'Leonardo', '49875265', '1970-01-01', '54645', 'A e B', 'leonardo_cavalcante.07@hotmail.com', '123', NULL, '2019-04-02'),
	(4, 'Maria', 'aaaa', '1970-01-01', 'asda', 'dada', 'kaio.wesley074@gmail.com', 'ada', NULL, '1970-01-01'),
	(5, 'João', '5413', NULL, '25452', 'A', 'joao@uol', '321', NULL, '2019-04-02'),
	(19, 'teste', 'teste', NULL, 'TESTE', 'a', 'teste', 'teste', NULL, '2019-04-02'),
	(20, 'TESTE', 'TEST', NULL, 'TES', 'A', 'TEST', 'TESTE', NULL, '2019-04-02'),
	(21, 'MARIO', 'jhnvgjh', NULL, 'nbv nb ', 'hnvhn', 'MARIO', '123', NULL, '2019-04-02'),
	(22, 'Sarah', '266326', NULL, '1', '1', 'sarah@uol', '123', NULL, '2019-05-15'),
	(23, '32112332112', '', '2332-11-22', '321123321', '', 'anderson@tulio.com', '321123', '', '2019-05-15'),
	(255, 'Anderson Silva Barreto', '32132132132', '2019-04-30', '321321321', 'volvo', 'kaio.wesley074@gmail.com', '321', '', '2019-05-15'),
	(262, 'O Anderson é uma mentira da silva ', '42322578904', '1999-02-11', '123456789', 'saab', 'mentira@andersontulio.com', '123', '', '2019-05-15'),
	(263, 'marcao', '5365', '2019-04-30', '65', 'a', 'sarah@uol', '321', NULL, '2019-05-15'),
	(264, 'Antonieta ', '12345678910', '1999-11-11', '123456789', 'volvo', 'sarah@oliveira.com', '123', '', '2019-05-15'),
	(342, 'Portella', '51', '1999-11-11', '65', 'a', 'a@a', '123', NULL, '2019-05-15');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.cliente_endereco
DROP TABLE IF EXISTS `cliente_endereco`;
CREATE TABLE IF NOT EXISTS `cliente_endereco` (
  `idCliente_Endereco` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL,
  `idEndereco` int(11) NOT NULL,
  PRIMARY KEY (`idCliente_Endereco`),
  KEY `idCliente` (`idCliente`),
  KEY `idEndereco` (`idEndereco`),
  CONSTRAINT `cliente_endereco_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE CASCADE,
  CONSTRAINT `cliente_endereco_ibfk_2` FOREIGN KEY (`idEndereco`) REFERENCES `endereco` (`idendereco`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.cliente_endereco: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente_endereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_endereco` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.cliente_telefone
DROP TABLE IF EXISTS `cliente_telefone`;
CREATE TABLE IF NOT EXISTS `cliente_telefone` (
  `idCliente_Telefone` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL,
  `idTelefone` int(11) NOT NULL,
  PRIMARY KEY (`idCliente_Telefone`),
  KEY `idTelefone` (`idTelefone`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `cliente_telefone_ibfk_1` FOREIGN KEY (`idTelefone`) REFERENCES `telefone` (`idtelefone`) ON DELETE CASCADE,
  CONSTRAINT `cliente_telefone_ibfk_2` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.cliente_telefone: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente_telefone` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_telefone` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.compra
DROP TABLE IF EXISTS `compra`;
CREATE TABLE IF NOT EXISTS `compra` (
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

-- Copiando dados para a tabela dbmob.compra: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.compra_pedido
DROP TABLE IF EXISTS `compra_pedido`;
CREATE TABLE IF NOT EXISTS `compra_pedido` (
  `idCompra_Pedido` int(11) NOT NULL AUTO_INCREMENT,
  `idCompra` int(11) NOT NULL,
  `idPedido` int(11) NOT NULL,
  PRIMARY KEY (`idCompra_Pedido`),
  KEY `idCompra` (`idCompra`),
  KEY `idPedido` (`idPedido`),
  CONSTRAINT `compra_pedido_ibfk_1` FOREIGN KEY (`idCompra`) REFERENCES `compra` (`idCompra`),
  CONSTRAINT `compra_pedido_ibfk_2` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`idpedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.compra_pedido: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `compra_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra_pedido` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.compra_produto_fornecedor
DROP TABLE IF EXISTS `compra_produto_fornecedor`;
CREATE TABLE IF NOT EXISTS `compra_produto_fornecedor` (
  `idCompra_Produto_Fornecedor` int(11) NOT NULL AUTO_INCREMENT,
  `idCompra` int(11) NOT NULL,
  `idProduto_Fornecedor` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  PRIMARY KEY (`idCompra_Produto_Fornecedor`),
  KEY `idCompra` (`idCompra`),
  KEY `idProduto_Fornecedor` (`idProduto_Fornecedor`),
  CONSTRAINT `compra_produto_fornecedor_ibfk_1` FOREIGN KEY (`idCompra`) REFERENCES `compra` (`idCompra`),
  CONSTRAINT `compra_produto_fornecedor_ibfk_2` FOREIGN KEY (`idProduto_Fornecedor`) REFERENCES `produto_fornecedor` (`idproduto_fornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.compra_produto_fornecedor: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `compra_produto_fornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra_produto_fornecedor` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.conta_pagar
DROP TABLE IF EXISTS `conta_pagar`;
CREATE TABLE IF NOT EXISTS `conta_pagar` (
  `idConta_Pagar` int(11) NOT NULL AUTO_INCREMENT,
  `valor` float NOT NULL,
  `vencimento` date NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `idBanco` int(11) NOT NULL,
  `paga` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`idConta_Pagar`),
  KEY `idBanco` (`idBanco`),
  CONSTRAINT `conta_pagar_ibfk_1` FOREIGN KEY (`idBanco`) REFERENCES `banco` (`idBanco`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.conta_pagar: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `conta_pagar` DISABLE KEYS */;
INSERT INTO `conta_pagar` (`idConta_Pagar`, `valor`, `vencimento`, `descricao`, `idBanco`, `paga`) VALUES
	(2, 9, '2019-06-14', NULL, 1, 1);
/*!40000 ALTER TABLE `conta_pagar` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.conta_pagar_compra
DROP TABLE IF EXISTS `conta_pagar_compra`;
CREATE TABLE IF NOT EXISTS `conta_pagar_compra` (
  `idConta_Pagar_Compra` int(11) NOT NULL AUTO_INCREMENT,
  `idCompra` int(11) NOT NULL,
  `idConta_Pagar` int(11) NOT NULL,
  PRIMARY KEY (`idConta_Pagar_Compra`),
  KEY `idCompra` (`idCompra`),
  KEY `idConta_Pagar` (`idConta_Pagar`),
  CONSTRAINT `conta_pagar_compra_ibfk_1` FOREIGN KEY (`idCompra`) REFERENCES `compra` (`idCompra`),
  CONSTRAINT `conta_pagar_compra_ibfk_2` FOREIGN KEY (`idConta_Pagar`) REFERENCES `conta_pagar` (`idConta_Pagar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.conta_pagar_compra: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `conta_pagar_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `conta_pagar_compra` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.conta_pagar_funcionario
DROP TABLE IF EXISTS `conta_pagar_funcionario`;
CREATE TABLE IF NOT EXISTS `conta_pagar_funcionario` (
  `idConta_Pagar_Funcionario` int(11) NOT NULL AUTO_INCREMENT,
  `idFuncionario` int(11) NOT NULL,
  `idConta_Pagar` int(11) NOT NULL,
  PRIMARY KEY (`idConta_Pagar_Funcionario`),
  KEY `idFuncionario` (`idFuncionario`),
  KEY `idConta_Pagar` (`idConta_Pagar`),
  CONSTRAINT `conta_pagar_funcionario_ibfk_1` FOREIGN KEY (`idFuncionario`) REFERENCES `funcionario` (`idfuncionario`),
  CONSTRAINT `conta_pagar_funcionario_ibfk_2` FOREIGN KEY (`idConta_Pagar`) REFERENCES `conta_pagar` (`idConta_Pagar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.conta_pagar_funcionario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `conta_pagar_funcionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `conta_pagar_funcionario` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.conta_pagar_locacao
DROP TABLE IF EXISTS `conta_pagar_locacao`;
CREATE TABLE IF NOT EXISTS `conta_pagar_locacao` (
  `idConta_Pagar_Locacao` int(11) NOT NULL AUTO_INCREMENT,
  `idConta_Pagar` int(11) NOT NULL,
  `idLocacao` int(11) NOT NULL,
  `extorno` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`idConta_Pagar_Locacao`),
  KEY `idConta_Pagar` (`idConta_Pagar`),
  KEY `idLocacao` (`idLocacao`),
  CONSTRAINT `conta_pagar_locacao_ibfk_1` FOREIGN KEY (`idConta_Pagar`) REFERENCES `conta_pagar` (`idConta_Pagar`),
  CONSTRAINT `conta_pagar_locacao_ibfk_2` FOREIGN KEY (`idLocacao`) REFERENCES `locacao` (`idlocacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.conta_pagar_locacao: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `conta_pagar_locacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `conta_pagar_locacao` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.conta_receber
DROP TABLE IF EXISTS `conta_receber`;
CREATE TABLE IF NOT EXISTS `conta_receber` (
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
  CONSTRAINT `conta_receber_ibfk_1` FOREIGN KEY (`idBanco`) REFERENCES `banco` (`idBanco`),
  CONSTRAINT `conta_receber_ibfk_2` FOREIGN KEY (`idLocacao`) REFERENCES `locacao` (`idlocacao`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.conta_receber: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `conta_receber` DISABLE KEYS */;
INSERT INTO `conta_receber` (`idConta_Receber`, `vencimento`, `idBanco`, `valor`, `descricao`, `paga`, `idLocacao`) VALUES
	(6, '2019-06-14', 1, 10, NULL, 1, 27);
/*!40000 ALTER TABLE `conta_receber` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.cupom
DROP TABLE IF EXISTS `cupom`;
CREATE TABLE IF NOT EXISTS `cupom` (
  `idCupom` int(11) NOT NULL AUTO_INCREMENT,
  `cupom` varchar(10) NOT NULL,
  `ativo` tinyint(4) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `desconto` float NOT NULL,
  PRIMARY KEY (`idCupom`),
  UNIQUE KEY `cupom_UNIQUE` (`cupom`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `cupom_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.cupom: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cupom` DISABLE KEYS */;
/*!40000 ALTER TABLE `cupom` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.devolucaoveiculo
DROP TABLE IF EXISTS `devolucaoveiculo`;
CREATE TABLE IF NOT EXISTS `devolucaoveiculo` (
  `idDevolucaoVeiculo` int(11) NOT NULL AUTO_INCREMENT,
  `idLocacao` int(11) NOT NULL,
  `horarioDevolvido` datetime NOT NULL,
  `confirmLocador` tinyint(4) DEFAULT NULL,
  `confirmLocatario` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`idDevolucaoVeiculo`),
  KEY `idLocacao` (`idLocacao`),
  CONSTRAINT `devolucaoveiculo_ibfk_1` FOREIGN KEY (`idLocacao`) REFERENCES `locacao` (`idlocacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.devolucaoveiculo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `devolucaoveiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `devolucaoveiculo` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.email_marketing
DROP TABLE IF EXISTS `email_marketing`;
CREATE TABLE IF NOT EXISTS `email_marketing` (
  `idEmail_Marketing` int(11) NOT NULL AUTO_INCREMENT,
  `assunto` varchar(100) DEFAULT NULL,
  `corpo` text NOT NULL,
  PRIMARY KEY (`idEmail_Marketing`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.email_marketing: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `email_marketing` DISABLE KEYS */;
INSERT INTO `email_marketing` (`idEmail_Marketing`, `assunto`, `corpo`) VALUES
	(1, 'Envio de Email para testes', 'Quer que funcione\r\nVai la ver no Posto Ipiranga'),
	(2, '321321', '321'),
	(3, '1', '1');
/*!40000 ALTER TABLE `email_marketing` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.email_marketing_cliente
DROP TABLE IF EXISTS `email_marketing_cliente`;
CREATE TABLE IF NOT EXISTS `email_marketing_cliente` (
  `idEmai_Marketing_Cliente` int(11) NOT NULL AUTO_INCREMENT,
  `idEmail_Marketing` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  PRIMARY KEY (`idEmai_Marketing_Cliente`),
  KEY `idEmail_Marketing` (`idEmail_Marketing`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `email_marketing_cliente_ibfk_1` FOREIGN KEY (`idEmail_Marketing`) REFERENCES `email_marketing` (`idEmail_Marketing`),
  CONSTRAINT `email_marketing_cliente_ibfk_2` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.email_marketing_cliente: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `email_marketing_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_marketing_cliente` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.email_marketing_fale_conosco
DROP TABLE IF EXISTS `email_marketing_fale_conosco`;
CREATE TABLE IF NOT EXISTS `email_marketing_fale_conosco` (
  `idEmail_Marketing_Fale_Conosco` int(11) NOT NULL AUTO_INCREMENT,
  `idEmail_Marketing` int(11) NOT NULL,
  `idFale_Conosco` int(11) NOT NULL,
  PRIMARY KEY (`idEmail_Marketing_Fale_Conosco`),
  KEY `idEmail_Marketing` (`idEmail_Marketing`),
  KEY `idFale_Conosco` (`idFale_Conosco`),
  CONSTRAINT `email_marketing_fale_conosco_ibfk_1` FOREIGN KEY (`idEmail_Marketing`) REFERENCES `email_marketing` (`idEmail_Marketing`),
  CONSTRAINT `email_marketing_fale_conosco_ibfk_2` FOREIGN KEY (`idFale_Conosco`) REFERENCES `fale_conosco` (`idfale_conosco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.email_marketing_fale_conosco: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `email_marketing_fale_conosco` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_marketing_fale_conosco` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.email_marketing_parceiro
DROP TABLE IF EXISTS `email_marketing_parceiro`;
CREATE TABLE IF NOT EXISTS `email_marketing_parceiro` (
  `idEmail_Marketing_Parceiro` int(11) NOT NULL AUTO_INCREMENT,
  `idEmail_Marketing` int(11) NOT NULL,
  `idParceiro` int(11) NOT NULL,
  PRIMARY KEY (`idEmail_Marketing_Parceiro`),
  KEY `idEmail_Marketing` (`idEmail_Marketing`),
  KEY `idParceiro` (`idParceiro`),
  CONSTRAINT `email_marketing_parceiro_ibfk_1` FOREIGN KEY (`idEmail_Marketing`) REFERENCES `email_marketing` (`idEmail_Marketing`),
  CONSTRAINT `email_marketing_parceiro_ibfk_2` FOREIGN KEY (`idParceiro`) REFERENCES `parceiro` (`idparceiro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.email_marketing_parceiro: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `email_marketing_parceiro` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_marketing_parceiro` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.endereco
DROP TABLE IF EXISTS `endereco`;
CREATE TABLE IF NOT EXISTS `endereco` (
  `idEndereco` int(11) NOT NULL AUTO_INCREMENT,
  `cidade` varchar(45) NOT NULL,
  `UF` varchar(2) NOT NULL,
  `numero` varchar(4) NOT NULL,
  `complemento` varchar(20) DEFAULT NULL,
  `rua` varchar(45) NOT NULL,
  PRIMARY KEY (`idEndereco`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.endereco: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` (`idEndereco`, `cidade`, `UF`, `numero`, `complemento`, `rua`) VALUES
	(1, 'Jandira', 'SP', '22', NULL, 'Rua das Rosas');
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.especificacao_cupom
DROP TABLE IF EXISTS `especificacao_cupom`;
CREATE TABLE IF NOT EXISTS `especificacao_cupom` (
  `idEspecificacao_Cupom` int(11) NOT NULL AUTO_INCREMENT,
  `notaMinimaAvaliacao` int(11) NOT NULL,
  `sequenciaAvaliacao` tinyint(4) NOT NULL,
  `desconto` int(11) NOT NULL,
  PRIMARY KEY (`idEspecificacao_Cupom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.especificacao_cupom: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `especificacao_cupom` DISABLE KEYS */;
/*!40000 ALTER TABLE `especificacao_cupom` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.fale_conosco
DROP TABLE IF EXISTS `fale_conosco`;
CREATE TABLE IF NOT EXISTS `fale_conosco` (
  `idFale_Conosco` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `assunto` varchar(100) NOT NULL,
  `mensagem` text NOT NULL,
  PRIMARY KEY (`idFale_Conosco`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.fale_conosco: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `fale_conosco` DISABLE KEYS */;
INSERT INTO `fale_conosco` (`idFale_Conosco`, `nome`, `email`, `assunto`, `mensagem`) VALUES
	(15, 'Kaio', 'Kaio@gmail.com', 'Critíca', 'Vocês deveriam tirar o Tcc\r\n'),
	(16, 'Leonardo ', 'Leo@Outlook.com', 'Sugestão', 'Vocês deveriam tirar o Tcc Por Favor!\r\n'),
	(17, 'Igor', 'igor@hotmail.com', 'Sugestão', 'Vocês deveriam tirar o Tcc Por Favor!\r\nEu quero muito isso !!'),
	(18, 'Emanuelly', 'emanuelly@bol.com.br', 'Sugestão', 'Quero mais Tcc! :)\r\n#ÉVerdadeEsseBilhete'),
	(19, 'Sarah', 'kaio.algo@gmail.com', 'Sugestão', 'sdghfkduyhfli'),
	(20, 'Leonardo ', 'Leo@Outlook.com', 'Sugestão', 'dddddddddd');
/*!40000 ALTER TABLE `fale_conosco` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.fornecedor
DROP TABLE IF EXISTS `fornecedor`;
CREATE TABLE IF NOT EXISTS `fornecedor` (
  `idFornecedor` int(11) NOT NULL AUTO_INCREMENT,
  `nomeFantasia` varchar(45) NOT NULL,
  `cnpj` varchar(20) NOT NULL,
  `razaoSocial` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `site` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idFornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.fornecedor: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.fornecedor_endereco
DROP TABLE IF EXISTS `fornecedor_endereco`;
CREATE TABLE IF NOT EXISTS `fornecedor_endereco` (
  `idFornecedor_Endereco` int(11) NOT NULL AUTO_INCREMENT,
  `idFornecedor` int(11) NOT NULL,
  `idEndereco` int(11) NOT NULL,
  PRIMARY KEY (`idFornecedor_Endereco`),
  KEY `idFornecedor` (`idFornecedor`),
  KEY `idEndereco` (`idEndereco`),
  CONSTRAINT `fornecedor_endereco_ibfk_1` FOREIGN KEY (`idFornecedor`) REFERENCES `fornecedor` (`idFornecedor`),
  CONSTRAINT `fornecedor_endereco_ibfk_2` FOREIGN KEY (`idEndereco`) REFERENCES `endereco` (`idEndereco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.fornecedor_endereco: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `fornecedor_endereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `fornecedor_endereco` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.fornecedor_telefone
DROP TABLE IF EXISTS `fornecedor_telefone`;
CREATE TABLE IF NOT EXISTS `fornecedor_telefone` (
  `idFornecedor_Telefone` int(11) NOT NULL AUTO_INCREMENT,
  `idfornecedor` int(11) NOT NULL,
  `idTelefone` int(11) NOT NULL,
  PRIMARY KEY (`idFornecedor_Telefone`),
  KEY `idfornecedor` (`idfornecedor`),
  KEY `idTelefone` (`idTelefone`),
  CONSTRAINT `fornecedor_telefone_ibfk_1` FOREIGN KEY (`idfornecedor`) REFERENCES `fornecedor` (`idFornecedor`),
  CONSTRAINT `fornecedor_telefone_ibfk_2` FOREIGN KEY (`idTelefone`) REFERENCES `telefone` (`idtelefone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.fornecedor_telefone: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `fornecedor_telefone` DISABLE KEYS */;
/*!40000 ALTER TABLE `fornecedor_telefone` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.foto_veiculo
DROP TABLE IF EXISTS `foto_veiculo`;
CREATE TABLE IF NOT EXISTS `foto_veiculo` (
  `idFoto_Veiculo` int(11) NOT NULL AUTO_INCREMENT,
  `idVeiculo` int(11) NOT NULL,
  `fotoVeiculo` varchar(100) NOT NULL,
  `perfil` varchar(20) NOT NULL,
  PRIMARY KEY (`idFoto_Veiculo`),
  KEY `idVeiculo` (`idVeiculo`),
  CONSTRAINT `foto_veiculo_ibfk_1` FOREIGN KEY (`idVeiculo`) REFERENCES `veiculo` (`idveiculo`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.foto_veiculo: ~18 rows (aproximadamente)
/*!40000 ALTER TABLE `foto_veiculo` DISABLE KEYS */;
INSERT INTO `foto_veiculo` (`idFoto_Veiculo`, `idVeiculo`, `fotoVeiculo`, `perfil`) VALUES
	(1, 2, 'carro.jpeg', 'frontal'),
	(2, 3, 'motoHonda.jpg', 'frontal'),
	(4, 1, 'carroUno.jpg', 'frontal'),
	(5, 1, 'carro1Dentro.jpg', 'dentro'),
	(26, 20, 'carroUno.jpg', 'frontal'),
	(27, 20, 'carroUno.jpg', 'frontal'),
	(28, 20, 'carroUno.jpg', 'frontal'),
	(29, 20, 'carroUno.jpg', 'frontal'),
	(30, 20, 'carroUno.jpg', 'frontal'),
	(31, 20, 'carroUno.jpg', 'frontal'),
	(32, 21, 'carroUno.jpg', 'frontal'),
	(33, 21, 'carroUno.jpg', 'frontal'),
	(34, 21, 'carroUno.jpg', 'frontal'),
	(35, 21, 'carroUno.jpg', 'frontal'),
	(36, 22, 'carroUno.jpg', 'frontal'),
	(37, 22, 'carroUno.jpg', 'frontal'),
	(38, 22, 'carroUno.jpg', 'frontal'),
	(39, 22, 'carroUno.jpg', 'frontal');
/*!40000 ALTER TABLE `foto_veiculo` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.funcionamento
DROP TABLE IF EXISTS `funcionamento`;
CREATE TABLE IF NOT EXISTS `funcionamento` (
  `idFuncionamento` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) NOT NULL,
  `descricao` text NOT NULL,
  `foto` varchar(45) NOT NULL,
  `ativo` int(11) NOT NULL,
  PRIMARY KEY (`idFuncionamento`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.funcionamento: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `funcionamento` DISABLE KEYS */;
INSERT INTO `funcionamento` (`idFuncionamento`, `titulo`, `descricao`, `foto`, `ativo`) VALUES
	(6, 'Como Faço uma Locação', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '69c2bfc3c0e9ec62928cb87394acbcc3.png', 1),
	(7, 'Como eu me Cadastro', 'ooooooooooooooo', 'c82ceb1f8c44127e6f31ca5db94fae5d.png', 1);
/*!40000 ALTER TABLE `funcionamento` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.funcionario
DROP TABLE IF EXISTS `funcionario`;
CREATE TABLE IF NOT EXISTS `funcionario` (
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
  CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`idCargo`) REFERENCES `cargo` (`idCargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.funcionario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.funcionario_telefone
DROP TABLE IF EXISTS `funcionario_telefone`;
CREATE TABLE IF NOT EXISTS `funcionario_telefone` (
  `idFuncionario_Telefone` int(11) NOT NULL AUTO_INCREMENT,
  `idFuncionario` int(11) NOT NULL,
  `idTelefone` int(11) NOT NULL,
  PRIMARY KEY (`idFuncionario_Telefone`),
  KEY `idFuncionario` (`idFuncionario`),
  KEY `idTelefone` (`idTelefone`),
  CONSTRAINT `funcionario_telefone_ibfk_1` FOREIGN KEY (`idFuncionario`) REFERENCES `funcionario` (`idFuncionario`),
  CONSTRAINT `funcionario_telefone_ibfk_2` FOREIGN KEY (`idTelefone`) REFERENCES `telefone` (`idtelefone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.funcionario_telefone: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `funcionario_telefone` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionario_telefone` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.horario_veiculo
DROP TABLE IF EXISTS `horario_veiculo`;
CREATE TABLE IF NOT EXISTS `horario_veiculo` (
  `idHorario_Veiculo` int(11) NOT NULL AUTO_INCREMENT,
  `idVeiculo` int(11) NOT NULL,
  `dia` date NOT NULL,
  `inicioHorario` time DEFAULT NULL,
  `fimHorario` time DEFAULT NULL,
  PRIMARY KEY (`idHorario_Veiculo`),
  KEY `idVeiculo` (`idVeiculo`),
  CONSTRAINT `horario_veiculo_ibfk_1` FOREIGN KEY (`idVeiculo`) REFERENCES `veiculo` (`idveiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.horario_veiculo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `horario_veiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `horario_veiculo` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.locacao
DROP TABLE IF EXISTS `locacao`;
CREATE TABLE IF NOT EXISTS `locacao` (
  `idLocacao` int(11) NOT NULL AUTO_INCREMENT,
  `idSolicitacao_Locacao` int(11) NOT NULL,
  `valor` float DEFAULT NULL,
  PRIMARY KEY (`idLocacao`),
  KEY `idSolicitacao_Locador` (`idSolicitacao_Locacao`),
  CONSTRAINT `locacao_ibfk_1` FOREIGN KEY (`idSolicitacao_Locacao`) REFERENCES `solicitacao_locacao` (`idsolicitacao_locacao`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.locacao: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `locacao` DISABLE KEYS */;
INSERT INTO `locacao` (`idLocacao`, `idSolicitacao_Locacao`, `valor`) VALUES
	(1, 1, NULL),
	(2, 2, NULL),
	(27, 3, 10);
/*!40000 ALTER TABLE `locacao` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.marca
DROP TABLE IF EXISTS `marca`;
CREATE TABLE IF NOT EXISTS `marca` (
  `idMarca` int(11) NOT NULL AUTO_INCREMENT,
  `nomeMarca` varchar(45) NOT NULL,
  PRIMARY KEY (`idMarca`),
  UNIQUE KEY `nomeMarca` (`nomeMarca`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.marca: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` (`idMarca`, `nomeMarca`) VALUES
	(1, 'BMW'),
	(10, 'CHEVROLET'),
	(6, 'FERRARI'),
	(3, 'FIAT'),
	(9, 'FORD'),
	(8, 'HAYABUSA'),
	(2, 'HONDA'),
	(7, 'LAMBORGHINI'),
	(11, 'PEUGEOT'),
	(12, 'teste'),
	(14, 'teste2'),
	(5, 'YAMAHA');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.mensagem_chat
DROP TABLE IF EXISTS `mensagem_chat`;
CREATE TABLE IF NOT EXISTS `mensagem_chat` (
  `idMensagem_Chat` int(11) NOT NULL AUTO_INCREMENT,
  `idRemetente` int(11) NOT NULL,
  `idDestinatario` int(11) NOT NULL,
  `mensagem` text NOT NULL,
  PRIMARY KEY (`idMensagem_Chat`),
  KEY `idRemetente` (`idRemetente`),
  KEY `idDestinatario` (`idDestinatario`),
  CONSTRAINT `mensagem_chat_ibfk_1` FOREIGN KEY (`idRemetente`) REFERENCES `cliente` (`idCliente`),
  CONSTRAINT `mensagem_chat_ibfk_2` FOREIGN KEY (`idDestinatario`) REFERENCES `cliente` (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.mensagem_chat: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mensagem_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `mensagem_chat` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.modelo
DROP TABLE IF EXISTS `modelo`;
CREATE TABLE IF NOT EXISTS `modelo` (
  `idModelo` int(11) NOT NULL AUTO_INCREMENT,
  `idMarca` int(11) NOT NULL,
  `nomeModelo` varchar(45) NOT NULL,
  PRIMARY KEY (`idModelo`),
  UNIQUE KEY `nomeModelo` (`nomeModelo`),
  KEY `idMarca` (`idMarca`),
  CONSTRAINT `modelo_ibfk_1` FOREIGN KEY (`idMarca`) REFERENCES `marca` (`idMarca`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.modelo: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `modelo` DISABLE KEYS */;
INSERT INTO `modelo` (`idModelo`, `idMarca`, `nomeModelo`) VALUES
	(1, 3, 'Honda CBR 1000RR Fireblade'),
	(2, 2, 'MOTONA'),
	(3, 2, 'Fiat Grand Siena'),
	(13, 5, 'OI'),
	(14, 8, 'OLA'),
	(15, 5, 'CAMARO');
/*!40000 ALTER TABLE `modelo` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.nivel
DROP TABLE IF EXISTS `nivel`;
CREATE TABLE IF NOT EXISTS `nivel` (
  `idNivel` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) NOT NULL,
  `descricao` varchar(80) NOT NULL,
  `permissoes` int(11) DEFAULT NULL,
  PRIMARY KEY (`idNivel`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.nivel: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `nivel` DISABLE KEYS */;
INSERT INTO `nivel` (`idNivel`, `nome`, `descricao`, `permissoes`) VALUES
	(1, 'Administrador', 'Controla tudo', 127),
	(2, 'Marketing', 'Controla e-mail', 127),
	(4, 'teste', '123456', 80);
/*!40000 ALTER TABLE `nivel` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.parceiro
DROP TABLE IF EXISTS `parceiro`;
CREATE TABLE IF NOT EXISTS `parceiro` (
  `idParceiro` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `site` varchar(45) DEFAULT NULL,
  `foto` varchar(45) DEFAULT NULL,
  `descricaoParceiro` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `ativo` int(11) NOT NULL,
  PRIMARY KEY (`idParceiro`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.parceiro: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `parceiro` DISABLE KEYS */;
INSERT INTO `parceiro` (`idParceiro`, `nome`, `site`, `foto`, `descricaoParceiro`, `email`, `ativo`) VALUES
	(42, 'Ford', 'https://www.ford.com.br/', 'd841c82596337ffd7589d04010abd7e8.png', 'Ford Motor Company é uma fabricante de automóveis multinacional estadunidense sediada em Dearborn, Michigan, um subúrbio de Detroit. Foi fundada por Henry Ford e incorporada em 16 de junho de 1903.', 'kaio.wesley074@gmail.com', 1),
	(43, 'Sarah Alguma coisa', 'kakakaakjjjjjjjjjjjjjjjjjjjj', '1c8deede837fdbbf163f672d1255eb1c.png', 'teste', 'kaio.algo@gmail.com', 1);
/*!40000 ALTER TABLE `parceiro` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.parceiro_endereco
DROP TABLE IF EXISTS `parceiro_endereco`;
CREATE TABLE IF NOT EXISTS `parceiro_endereco` (
  `idParceiro_Endereco` int(11) NOT NULL AUTO_INCREMENT,
  `idParceiro` int(11) NOT NULL,
  `idEndereco` int(11) NOT NULL,
  PRIMARY KEY (`idParceiro_Endereco`),
  KEY `idEndereco` (`idEndereco`),
  KEY `idParceiro` (`idParceiro`),
  CONSTRAINT `parceiro_endereco_ibfk_1` FOREIGN KEY (`idEndereco`) REFERENCES `endereco` (`idEndereco`),
  CONSTRAINT `parceiro_endereco_ibfk_2` FOREIGN KEY (`idParceiro`) REFERENCES `parceiro` (`idParceiro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.parceiro_endereco: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `parceiro_endereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `parceiro_endereco` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.parceiro_telefone
DROP TABLE IF EXISTS `parceiro_telefone`;
CREATE TABLE IF NOT EXISTS `parceiro_telefone` (
  `idParceiro_Telefone` int(11) NOT NULL AUTO_INCREMENT,
  `idParceiro` int(11) NOT NULL,
  `idTelefone` int(11) NOT NULL,
  PRIMARY KEY (`idParceiro_Telefone`),
  KEY `idParceiro` (`idParceiro`),
  KEY `idTelefone` (`idTelefone`),
  CONSTRAINT `parceiro_telefone_ibfk_1` FOREIGN KEY (`idParceiro`) REFERENCES `parceiro` (`idParceiro`),
  CONSTRAINT `parceiro_telefone_ibfk_2` FOREIGN KEY (`idTelefone`) REFERENCES `telefone` (`idtelefone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.parceiro_telefone: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `parceiro_telefone` DISABLE KEYS */;
/*!40000 ALTER TABLE `parceiro_telefone` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.pedido
DROP TABLE IF EXISTS `pedido`;
CREATE TABLE IF NOT EXISTS `pedido` (
  `idPedido` int(11) NOT NULL AUTO_INCREMENT,
  `observacao` varchar(100) DEFAULT NULL,
  `idFuncionario` int(11) NOT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `idFuncionario` (`idFuncionario`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`idFuncionario`) REFERENCES `funcionario` (`idFuncionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.pedido: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.pedido_produto_fornecedor
DROP TABLE IF EXISTS `pedido_produto_fornecedor`;
CREATE TABLE IF NOT EXISTS `pedido_produto_fornecedor` (
  `idPedido_Produto_Fornecedor` int(11) NOT NULL AUTO_INCREMENT,
  `idPedido` int(11) NOT NULL,
  `idProduto_Fornecedor` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  PRIMARY KEY (`idPedido_Produto_Fornecedor`),
  KEY `idPedido` (`idPedido`),
  KEY `idProduto_Fornecedor` (`idProduto_Fornecedor`),
  CONSTRAINT `pedido_produto_fornecedor_ibfk_1` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`idPedido`),
  CONSTRAINT `pedido_produto_fornecedor_ibfk_2` FOREIGN KEY (`idProduto_Fornecedor`) REFERENCES `produto_fornecedor` (`idproduto_fornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.pedido_produto_fornecedor: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pedido_produto_fornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_produto_fornecedor` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.pendencia
DROP TABLE IF EXISTS `pendencia`;
CREATE TABLE IF NOT EXISTS `pendencia` (
  `idPendencia` int(11) NOT NULL AUTO_INCREMENT,
  `motivo` text NOT NULL,
  `aberto` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`idPendencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.pendencia: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pendencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `pendencia` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.pendencia_cliente
DROP TABLE IF EXISTS `pendencia_cliente`;
CREATE TABLE IF NOT EXISTS `pendencia_cliente` (
  `idPendencia_Cliente` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL,
  `motivo` text,
  `aberto` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`idPendencia_Cliente`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `pendencia_cliente_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.pendencia_cliente: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `pendencia_cliente` DISABLE KEYS */;
INSERT INTO `pendencia_cliente` (`idPendencia_Cliente`, `idCliente`, `motivo`, `aberto`) VALUES
	(1, 4, 'Aguardando aprovação', 1),
	(2, 5, 'Aguardando aprovação', 1),
	(12, 19, 'Aguardando aprovação', 1),
	(13, 20, 'Aguardando aprovação', 1),
	(14, 21, 'Aguardando aprovação', 1),
	(15, 22, 'Aguardando aprovação', 1),
	(16, 23, 'Aguardando aprovação', 1),
	(17, 255, 'Aguardando aprovação', 1),
	(18, 262, 'Aguardando aprovação', 1),
	(19, 263, 'Aguardando aprovação', 1),
	(20, 264, 'Aguardando aprovação', 1),
	(21, 342, 'Aguardando aprovação', 1);
/*!40000 ALTER TABLE `pendencia_cliente` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.pendencia_veiculo
DROP TABLE IF EXISTS `pendencia_veiculo`;
CREATE TABLE IF NOT EXISTS `pendencia_veiculo` (
  `idPendencia_Veiculo` int(11) NOT NULL AUTO_INCREMENT,
  `idVeiculo` int(11) NOT NULL,
  `motivo` text NOT NULL,
  `aberto` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`idPendencia_Veiculo`),
  KEY `idVeiculo` (`idVeiculo`),
  CONSTRAINT `pendencia_veiculo_ibfk_1` FOREIGN KEY (`idVeiculo`) REFERENCES `veiculo` (`idveiculo`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.pendencia_veiculo: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `pendencia_veiculo` DISABLE KEYS */;
INSERT INTO `pendencia_veiculo` (`idPendencia_Veiculo`, `idVeiculo`, `motivo`, `aberto`) VALUES
	(2, 1, '', 1),
	(16, 20, 'Aguardando aprovação do cadastro', 1),
	(17, 21, 'Aguardando aprovação do cadastro', 1),
	(18, 22, 'Aguardando aprovação do cadastro', 1);
/*!40000 ALTER TABLE `pendencia_veiculo` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.pergunta_frequente
DROP TABLE IF EXISTS `pergunta_frequente`;
CREATE TABLE IF NOT EXISTS `pergunta_frequente` (
  `idPergunta` int(11) NOT NULL AUTO_INCREMENT,
  `pergunta` text NOT NULL,
  `resposta` text,
  `ativo` tinyint(4) NOT NULL,
  PRIMARY KEY (`idPergunta`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.pergunta_frequente: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `pergunta_frequente` DISABLE KEYS */;
INSERT INTO `pergunta_frequente` (`idPergunta`, `pergunta`, `resposta`, `ativo`) VALUES
	(30, 'Para Alugar tenho que Ter um cadastro?', 'Claro que Sim!', 1),
	(31, 'Esse Site Funciona ?', 'Deveria, tudo depende do usuário. ', 1);
/*!40000 ALTER TABLE `pergunta_frequente` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.produto
DROP TABLE IF EXISTS `produto`;
CREATE TABLE IF NOT EXISTS `produto` (
  `idProduto` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.produto: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.produto_fornecedor
DROP TABLE IF EXISTS `produto_fornecedor`;
CREATE TABLE IF NOT EXISTS `produto_fornecedor` (
  `idProduto_Fornecedor` int(11) NOT NULL AUTO_INCREMENT,
  `idProduto` int(11) NOT NULL,
  `idFornecedor` int(11) NOT NULL,
  `valor` float NOT NULL,
  PRIMARY KEY (`idProduto_Fornecedor`),
  KEY `idProduto` (`idProduto`),
  KEY `idFornecedor` (`idFornecedor`),
  CONSTRAINT `produto_fornecedor_ibfk_1` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`),
  CONSTRAINT `produto_fornecedor_ibfk_2` FOREIGN KEY (`idFornecedor`) REFERENCES `fornecedor` (`idFornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.produto_fornecedor: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `produto_fornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto_fornecedor` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.produto_fornecedor_unidade_medida
DROP TABLE IF EXISTS `produto_fornecedor_unidade_medida`;
CREATE TABLE IF NOT EXISTS `produto_fornecedor_unidade_medida` (
  `idProduto_Fornecedor_Unidade_Medida` int(11) NOT NULL AUTO_INCREMENT,
  `idProduto_Fornecedor` int(11) NOT NULL,
  `idUnidade_Medida` int(11) NOT NULL,
  `quantidade` float NOT NULL,
  PRIMARY KEY (`idProduto_Fornecedor_Unidade_Medida`),
  KEY `idProduto_Fornecedor` (`idProduto_Fornecedor`),
  KEY `idUnidade_Medida` (`idUnidade_Medida`),
  CONSTRAINT `produto_fornecedor_unidade_medida_ibfk_1` FOREIGN KEY (`idProduto_Fornecedor`) REFERENCES `produto_fornecedor` (`idProduto_Fornecedor`),
  CONSTRAINT `produto_fornecedor_unidade_medida_ibfk_2` FOREIGN KEY (`idUnidade_Medida`) REFERENCES `unidade_medida` (`idunidade_medida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.produto_fornecedor_unidade_medida: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `produto_fornecedor_unidade_medida` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto_fornecedor_unidade_medida` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.setor
DROP TABLE IF EXISTS `setor`;
CREATE TABLE IF NOT EXISTS `setor` (
  `idSetor` int(11) NOT NULL AUTO_INCREMENT,
  `nomeSetor` varchar(45) NOT NULL,
  PRIMARY KEY (`idSetor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.setor: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `setor` DISABLE KEYS */;
/*!40000 ALTER TABLE `setor` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.sobre_empresa
DROP TABLE IF EXISTS `sobre_empresa`;
CREATE TABLE IF NOT EXISTS `sobre_empresa` (
  `idSobre_Empresa` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) NOT NULL,
  `texto` text NOT NULL,
  `ativo` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`idSobre_Empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.sobre_empresa: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `sobre_empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `sobre_empresa` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.solicitacao_locacao
DROP TABLE IF EXISTS `solicitacao_locacao`;
CREATE TABLE IF NOT EXISTS `solicitacao_locacao` (
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
  CONSTRAINT `solicitacao_locacao_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`),
  CONSTRAINT `solicitacao_locacao_ibfk_2` FOREIGN KEY (`idVeiculo`) REFERENCES `veiculo` (`idveiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.solicitacao_locacao: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `solicitacao_locacao` DISABLE KEYS */;
INSERT INTO `solicitacao_locacao` (`idSolicitacao_Locacao`, `idCliente`, `idVeiculo`, `confirmLocador`, `horarioInicio`, `horarioFim`, `motivoRecusa`) VALUES
	(1, 4, 1, 1, '2019-04-15 10:00:00', '2019-04-15 16:00:00', NULL),
	(2, 4, 2, 1, '2019-05-05 10:00:00', '2019-05-05 15:00:00', NULL),
	(3, 1, 1, 1, '2019-04-15 16:00:00', '2019-04-15 18:00:00', NULL),
	(4, 5, 1, NULL, '2019-04-15 16:20:00', '2019-04-15 12:30:00', NULL),
	(5, 5, 1, NULL, '2019-04-15 02:20:00', '2019-04-15 03:30:00', NULL),
	(6, 5, 1, NULL, '2019-05-29 02:26:00', '2019-05-30 02:26:00', NULL),
	(7, 5, 1, NULL, '2019-05-29 12:30:00', '2019-05-30 18:30:00', NULL),
	(8, 5, 1, NULL, '2019-05-16 18:30:00', '2019-05-08 18:30:00', NULL),
	(9, 5, 1, NULL, '2019-05-15 18:30:00', '2019-05-16 01:18:00', NULL);
/*!40000 ALTER TABLE `solicitacao_locacao` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.telefone
DROP TABLE IF EXISTS `telefone`;
CREATE TABLE IF NOT EXISTS `telefone` (
  `idTelefone` int(11) NOT NULL AUTO_INCREMENT,
  `idTipoTelefone` int(11) NOT NULL,
  `numero` varchar(12) NOT NULL,
  PRIMARY KEY (`idTelefone`),
  KEY `idTipoTelefone` (`idTipoTelefone`),
  CONSTRAINT `telefone_ibfk_1` FOREIGN KEY (`idTipoTelefone`) REFERENCES `tipotelefone` (`idtipotelefone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.telefone: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `telefone` DISABLE KEYS */;
/*!40000 ALTER TABLE `telefone` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.termo
DROP TABLE IF EXISTS `termo`;
CREATE TABLE IF NOT EXISTS `termo` (
  `idTermo` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) NOT NULL,
  `texto` text NOT NULL,
  `ativo` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`idTermo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.termo: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `termo` DISABLE KEYS */;
INSERT INTO `termo` (`idTermo`, `titulo`, `texto`, `ativo`) VALUES
	(2, 'Termo 1', 'Talvez você precise registrar-se com a The Coca-Cola Company para obter acesso a determinadas áreas do Site. Com relação a esse registro, nós podemos nos recusar a fornecer a você, ou permitir o uso de, um nome de usuário (ou endereço de e-mail) que já esteja sendo usado por outro usuário; que seja usado para se fazer passar por outra pessoa; que pertença a outra pessoa; que viole a propriedade intelectual ou outros direitos de uma pessoa; que seja ofensivo; ou por outro motivo a nosso critério.', 1);
/*!40000 ALTER TABLE `termo` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.tipotelefone
DROP TABLE IF EXISTS `tipotelefone`;
CREATE TABLE IF NOT EXISTS `tipotelefone` (
  `idtipoTelefone` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipoTelefone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.tipotelefone: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tipotelefone` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipotelefone` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.tipo_veiculo
DROP TABLE IF EXISTS `tipo_veiculo`;
CREATE TABLE IF NOT EXISTS `tipo_veiculo` (
  `idTipo_Veiculo` int(11) NOT NULL AUTO_INCREMENT,
  `nomeTipo` varchar(20) NOT NULL,
  `foto` int(11) DEFAULT NULL,
  PRIMARY KEY (`idTipo_Veiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.tipo_veiculo: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo_veiculo` DISABLE KEYS */;
INSERT INTO `tipo_veiculo` (`idTipo_Veiculo`, `nomeTipo`, `foto`) VALUES
	(1, 'Carro', 6),
	(2, 'Moto', 4),
	(3, 'Bicicleta', 2);
/*!40000 ALTER TABLE `tipo_veiculo` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.unidade_medida
DROP TABLE IF EXISTS `unidade_medida`;
CREATE TABLE IF NOT EXISTS `unidade_medida` (
  `idUnidade_Medida` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`idUnidade_Medida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.unidade_medida: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `unidade_medida` DISABLE KEYS */;
/*!40000 ALTER TABLE `unidade_medida` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.usuario
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `cpf` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `tentativas` varchar(45) NOT NULL,
  `ativo` tinyint(4) NOT NULL,
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `idusuario_UNIQUE` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela dbmob.usuario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

-- Copiando estrutura para tabela dbmob.usuario_web
DROP TABLE IF EXISTS `usuario_web`;
CREATE TABLE IF NOT EXISTS `usuario_web` (
  `idUsuario_Web` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `senha` varchar(10) NOT NULL,
  `idNivel` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`idUsuario_Web`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `idNivel` (`idNivel`),
  CONSTRAINT `usuario_web_ibfk_1` FOREIGN KEY (`idNivel`) REFERENCES `nivel` (`idNivel`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.usuario_web: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario_web` DISABLE KEYS */;
INSERT INTO `usuario_web` (`idUsuario_Web`, `email`, `senha`, `idNivel`, `nome`) VALUES
	(1, 'teste@teste', 'teste', 1, 'teste'),
	(2, 'sdasd@dsad', 'igor', 2, 'igor'),
	(12, 'kaio.wesley074@gmail.com', 'teste', 1, 'Kaio'),
	(13, 'marcao@marc', 'a', 1, 'marcao');
/*!40000 ALTER TABLE `usuario_web` ENABLE KEYS */;

-- Copiando estrutura para view dbmob.vanuncios_mobile
DROP VIEW IF EXISTS `vanuncios_mobile`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `vanuncios_mobile` (
	`idVeiculo` INT(11) NOT NULL,
	`nomeModelo` VARCHAR(45) NOT NULL COLLATE 'utf8_general_ci',
	`nomeMarca` VARCHAR(45) NOT NULL COLLATE 'utf8_general_ci',
	`fotoVeiculo` VARCHAR(100) NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Copiando estrutura para view dbmob.vavaliacao_veiculo
DROP VIEW IF EXISTS `vavaliacao_veiculo`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `vavaliacao_veiculo` (
	`idVeiculo` INT(11) NOT NULL,
	`nomeModelo` VARCHAR(45) NOT NULL COLLATE 'utf8_general_ci',
	`nomeMarca` VARCHAR(45) NOT NULL COLLATE 'utf8_general_ci',
	`depoimento` TEXT NULL COLLATE 'utf8_general_ci',
	`nota` TINYINT(4) NOT NULL
) ENGINE=MyISAM;

-- Copiando estrutura para view dbmob.vdetalhes_veiculo
DROP VIEW IF EXISTS `vdetalhes_veiculo`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `vdetalhes_veiculo` (
	`idVeiculo` INT(11) NOT NULL,
	`nomeModelo` VARCHAR(45) NOT NULL COLLATE 'utf8_general_ci',
	`nomeMarca` VARCHAR(45) NOT NULL COLLATE 'utf8_general_ci',
	`cor` VARCHAR(45) NOT NULL COLLATE 'utf8_general_ci',
	`valor` FLOAT NULL,
	`ano` INT(11) NOT NULL,
	`nota` DECIMAL(7,4) NULL
) ENGINE=MyISAM;

-- Copiando estrutura para tabela dbmob.veiculo
DROP TABLE IF EXISTS `veiculo`;
CREATE TABLE IF NOT EXISTS `veiculo` (
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
  `idEndereco` int(11) NOT NULL,
  `idModelo` int(11) NOT NULL,
  `ativo` tinyint(4) DEFAULT '1',
  `disponivel` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`idVeiculo`),
  KEY `idCategoria_Veiculo` (`idCategoria_Veiculo`),
  KEY `idCliente` (`idCliente`),
  KEY `idEndereco` (`idEndereco`),
  KEY `idModelo_idx` (`idModelo`),
  CONSTRAINT `veiculo_ibfk_1` FOREIGN KEY (`idCategoria_Veiculo`) REFERENCES `categoria_veiculo` (`idCategoria_Veiculo`),
  CONSTRAINT `veiculo_ibfk_2` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`),
  CONSTRAINT `veiculo_ibfk_3` FOREIGN KEY (`idEndereco`) REFERENCES `endereco` (`idEndereco`),
  CONSTRAINT `veiculo_ibfk_4` FOREIGN KEY (`idModelo`) REFERENCES `modelo` (`idModelo`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela dbmob.veiculo: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `veiculo` DISABLE KEYS */;
INSERT INTO `veiculo` (`idVeiculo`, `idCategoria_Veiculo`, `idCliente`, `cor`, `altura`, `comprimento`, `largura`, `valorHora`, `ano`, `quilometragem`, `idEndereco`, `idModelo`, `ativo`, `disponivel`) VALUES
	(1, 1, 1, 'vermelho', 2, 1, 1, 5, 1999, 50000, 1, 1, 1, 0),
	(2, 2, 1, 'preto', 2, 1, 2, 10, 2000, 0, 1, 3, 1, 0),
	(3, 3, 1, 'vermelho', 2, 1, 1, 50, 2017, 0, 1, 1, 1, 0),
	(20, 2, 4, 'Vermelho', 15, 123, 101, 150, 2012, 2000, 1, 1, 1, 0),
	(21, 3, 4, 'Vermelho', 15, 123, 101, 150, 2012, 2000, 1, 1, 1, 0),
	(22, 3, 4, 'Vermelho', 15, 123, 101, 150, 2012, 2000, 1, 1, 1, 0);
/*!40000 ALTER TABLE `veiculo` ENABLE KEYS */;

-- Copiando estrutura para view dbmob.vpendencia_cliente
DROP VIEW IF EXISTS `vpendencia_cliente`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `vpendencia_cliente` (
	`idPendencia` INT(11) NOT NULL,
	`nome` VARCHAR(45) NOT NULL COLLATE 'utf8_general_ci',
	`id` INT(11) NOT NULL,
	`motivo` TEXT NULL COLLATE 'utf8_general_ci',
	`aberto` TINYINT(4) NULL
) ENGINE=MyISAM;

-- Copiando estrutura para view dbmob.vpendencia_veiculo
DROP VIEW IF EXISTS `vpendencia_veiculo`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `vpendencia_veiculo` (
	`idPendencia` INT(11) NOT NULL,
	`nome` VARCHAR(91) NOT NULL COLLATE 'utf8_general_ci',
	`id` INT(11) NOT NULL,
	`motivo` TEXT NOT NULL COLLATE 'utf8_general_ci',
	`aberto` TINYINT(4) NULL
) ENGINE=MyISAM;

-- Copiando estrutura para view dbmob.vsolicitacao_locacao
DROP VIEW IF EXISTS `vsolicitacao_locacao`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `vsolicitacao_locacao` (
	`idSolicitacao_Locacao` INT(11) NOT NULL,
	`idCliente` INT(11) NOT NULL,
	`nomeCliente` VARCHAR(45) NOT NULL COLLATE 'utf8_general_ci',
	`idDono` BIGINT(11) NULL,
	`veiculo` VARCHAR(91) NOT NULL COLLATE 'utf8_general_ci',
	`horarioInicio` DATETIME NOT NULL,
	`horarioFim` DATETIME NOT NULL,
	`motivoRecusa` VARCHAR(100) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Copiando estrutura para view dbmob.vvisualizacao_cancelamento
DROP VIEW IF EXISTS `vvisualizacao_cancelamento`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `vvisualizacao_cancelamento` (
	`idCancelamento` INT(11) NOT NULL,
	`idLocacao` INT(11) NOT NULL,
	`nome` VARCHAR(45) NOT NULL COLLATE 'utf8_general_ci',
	`idCliente` INT(11) NOT NULL,
	`confirmacao` TINYINT(4) NULL,
	`motivo` TEXT NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Copiando estrutura para view dbmob.v_detalhes_locacao
DROP VIEW IF EXISTS `v_detalhes_locacao`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `v_detalhes_locacao` (
	`Idlocacao` INT(11) NOT NULL,
	`Locatario` VARCHAR(45) NOT NULL COLLATE 'utf8_general_ci',
	`Locador` VARCHAR(45) NOT NULL COLLATE 'utf8_general_ci',
	`Veiculo` VARCHAR(91) NOT NULL COLLATE 'utf8_general_ci',
	`Inicio` DATETIME NOT NULL,
	`Fim` DATETIME NOT NULL,
	`Valor total` DOUBLE NULL
) ENGINE=MyISAM;

-- Copiando estrutura para trigger dbmob.tg_cadastro_cliente_pendencia
DROP TRIGGER IF EXISTS `tg_cadastro_cliente_pendencia`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tg_cadastro_cliente_pendencia` AFTER INSERT ON `cliente` FOR EACH ROW begin
	insert into pendencia_cliente(idCliente, motivo) values(NEW.idCliente, 'Aguardando aprovação');
end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger dbmob.tg_cadastro_veiculo_pendencia
DROP TRIGGER IF EXISTS `tg_cadastro_veiculo_pendencia`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tg_cadastro_veiculo_pendencia` AFTER INSERT ON `veiculo` FOR EACH ROW begin
	insert into pendencia_veiculo(idVeiculo, motivo) values(NEW.idVeiculo, 'Aguardando aprovação do cadastro');
end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger dbmob.t_baixa_conta_pagar
DROP TRIGGER IF EXISTS `t_baixa_conta_pagar`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `t_baixa_conta_pagar` AFTER UPDATE ON `conta_pagar` FOR EACH ROW begin

	
    declare saldo_atual float;
    set saldo_atual = (select saldo from banco where idBanco = new.idBanco);

	if(old.paga is null and new.paga = 1) then
    
		update banco set saldo = (saldo_atual - new.valor) where idBanco = new.idBanco;
    
    end if;
    

	

end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger dbmob.t_baixa_conta_receber
DROP TRIGGER IF EXISTS `t_baixa_conta_receber`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `t_baixa_conta_receber` AFTER UPDATE ON `conta_receber` FOR EACH ROW begin

	
    declare saldo_atual float;
    set saldo_atual = (select saldo from banco where idBanco = new.idBanco);

	if(old.paga is null and new.paga = 1) then
    
		update banco set saldo = (saldo_atual + new.valor) where idBanco = new.idBanco;
    
    end if;
    

	

end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger dbmob.t_criacao_locacao
DROP TRIGGER IF EXISTS `t_criacao_locacao`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `t_criacao_locacao` AFTER UPDATE ON `solicitacao_locacao` FOR EACH ROW begin

	declare valor float;
	set valor = (select ((select v.valorHora from veiculo as v where v.idVeiculo = NEW.idVeiculo) * 
    CEILING(TIMESTAMPDIFF(MINUTE, new.horarioInicio, new.horarioFim)/60)));
    
     

	if(OLD.confirmLocador is null and NEW.confirmLocador = 1) then
		insert into locacao(idSolicitacao_locacao, valor) values(OLD.idSolicitacao_Locacao, valor);
	end if;
		
end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger dbmob.t_geracao_conta_receber_pagar
DROP TRIGGER IF EXISTS `t_geracao_conta_receber_pagar`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `t_geracao_conta_receber_pagar` AFTER INSERT ON `locacao` FOR EACH ROW begin

	
    declare receber float;
    declare pagar float;
    declare banco int;
    declare porcentagem_empresa float;
    
    
    set banco = (select idBanco from banco where receiver = 1);
    
    set porcentagem_empresa = (select distinct cv.porcentagemGanhoEmpresa from solicitacao_locacao as sl join locacao as l 
    on sl.idSolicitacao_locacao = l.idSolicitacao_locacao join veiculo as v on v.idVeiculo = sl.idVeiculo 
    join categoria_veiculo as cv on cv.idCategoria_veiculo = v.idCategoria_veiculo  where v.idVeiculo = 
    (select sl.idVeiculo from solicitacao_locacao as sl join locacao as l on l.idSolicitacao_locacao = sl.idSolicitacao_locacao 
    where l.idLocacao = new.idLocacao));
    
    
    
	set receber =  new.valor;
    
    
    insert into conta_receber(vencimento, idBanco, valor, idLocacao) 
    values(DATE_ADD(CURDATE(), INTERVAL 30 DAY), banco, receber, NEW.idLocacao);
    
    set pagar = receber - ((receber * porcentagem_empresa)/100 );
    
    insert into conta_pagar( valor, vencimento, idBanco) values( pagar, DATE_ADD(CURDATE(), INTERVAL 30 DAY), banco);

end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para view dbmob.vanuncios_mobile
DROP VIEW IF EXISTS `vanuncios_mobile`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `vanuncios_mobile`;
CREATE ALGORITHM=UNDEFINED DEFINER=`mob`@`%` SQL SECURITY DEFINER VIEW `vanuncios_mobile` AS select `v`.`idVeiculo` AS `idVeiculo`,`mo`.`nomeModelo` AS `nomeModelo`,`ma`.`nomeMarca` AS `nomeMarca`,`ft`.`fotoVeiculo` AS `fotoVeiculo` from (((`veiculo` `v` join `modelo` `mo` on((`v`.`idModelo` = `mo`.`idModelo`))) join `marca` `ma` on((`ma`.`idMarca` = `mo`.`idMarca`))) join `foto_veiculo` `ft` on((`ft`.`idVeiculo` = `v`.`idVeiculo`))) where (`ft`.`perfil` = 'frontal');

-- Copiando estrutura para view dbmob.vavaliacao_veiculo
DROP VIEW IF EXISTS `vavaliacao_veiculo`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `vavaliacao_veiculo`;
CREATE ALGORITHM=UNDEFINED DEFINER=`mob`@`%` SQL SECURITY DEFINER VIEW `vavaliacao_veiculo` AS select distinct `v`.`idVeiculo` AS `idVeiculo`,`mo`.`nomeModelo` AS `nomeModelo`,`ma`.`nomeMarca` AS `nomeMarca`,`a`.`depoimento` AS `depoimento`,`a`.`nota` AS `nota` from ((((`avaliacao_veiculo` `av` join `veiculo` `v` on((`v`.`idVeiculo` = `av`.`idVeiculo`))) join `modelo` `mo` on((`v`.`idModelo` = `mo`.`idModelo`))) join `marca` `ma` on((`mo`.`idMarca` = `ma`.`idMarca`))) join `avaliacao` `a` on((`a`.`idAvaliacao` = `av`.`idAvaliacao`)));

-- Copiando estrutura para view dbmob.vdetalhes_veiculo
DROP VIEW IF EXISTS `vdetalhes_veiculo`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `vdetalhes_veiculo`;
CREATE ALGORITHM=UNDEFINED DEFINER=`mob`@`%` SQL SECURITY DEFINER VIEW `vdetalhes_veiculo` AS select `v`.`idVeiculo` AS `idVeiculo`,`mo`.`nomeModelo` AS `nomeModelo`,`ma`.`nomeMarca` AS `nomeMarca`,`v`.`cor` AS `cor`,`v`.`valorHora` AS `valor`,`v`.`ano` AS `ano`,(select avg(`a`.`nota`) from (`avaliacao` `a` join `avaliacao_veiculo` `av` on((`a`.`idAvaliacao` = `av`.`idAvaliacao`))) where (`av`.`idVeiculo` = `v`.`idVeiculo`)) AS `nota` from (((`veiculo` `v` join `modelo` `mo` on((`v`.`idModelo` = `mo`.`idModelo`))) join `marca` `ma` on((`ma`.`idMarca` = `mo`.`idMarca`))) join `foto_veiculo` `ft` on((`ft`.`idVeiculo` = `v`.`idVeiculo`)));

-- Copiando estrutura para view dbmob.vpendencia_cliente
DROP VIEW IF EXISTS `vpendencia_cliente`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `vpendencia_cliente`;
CREATE ALGORITHM=UNDEFINED DEFINER=`mob`@`%` SQL SECURITY DEFINER VIEW `vpendencia_cliente` AS select `p`.`idPendencia_Cliente` AS `idPendencia`,`c`.`nome` AS `nome`,`c`.`idCliente` AS `id`,`p`.`motivo` AS `motivo`,`p`.`aberto` AS `aberto` from (`pendencia_cliente` `p` join `cliente` `c` on((`p`.`idCliente` = `c`.`idCliente`)));

-- Copiando estrutura para view dbmob.vpendencia_veiculo
DROP VIEW IF EXISTS `vpendencia_veiculo`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `vpendencia_veiculo`;
CREATE ALGORITHM=UNDEFINED DEFINER=`mob`@`%` SQL SECURITY DEFINER VIEW `vpendencia_veiculo` AS select `pv`.`idPendencia_Veiculo` AS `idPendencia`,concat(`mar`.`nomeMarca`,' ',`m`.`nomeModelo`) AS `nome`,`v`.`idVeiculo` AS `id`,`pv`.`motivo` AS `motivo`,`pv`.`aberto` AS `aberto` from (((`pendencia_veiculo` `pv` join `veiculo` `v` on((`pv`.`idVeiculo` = `v`.`idVeiculo`))) join `modelo` `m` on((`m`.`idModelo` = `v`.`idModelo`))) join `marca` `mar` on((`m`.`idMarca` = `mar`.`idMarca`)));

-- Copiando estrutura para view dbmob.vsolicitacao_locacao
DROP VIEW IF EXISTS `vsolicitacao_locacao`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `vsolicitacao_locacao`;
CREATE ALGORITHM=UNDEFINED DEFINER=`mob`@`%` SQL SECURITY DEFINER VIEW `vsolicitacao_locacao` AS select `sl`.`idSolicitacao_Locacao` AS `idSolicitacao_Locacao`,`c`.`idCliente` AS `idCliente`,`c`.`nome` AS `nomeCliente`,(select `c`.`idCliente` from (`cliente` `c` join `veiculo` `ve` on((`ve`.`idCliente` = `c`.`idCliente`))) where (`ve`.`idVeiculo` = `v`.`idVeiculo`)) AS `idDono`,concat(`ma`.`nomeMarca`,' ',`mo`.`nomeModelo`) AS `veiculo`,`sl`.`horarioInicio` AS `horarioInicio`,`sl`.`horarioFim` AS `horarioFim`,`sl`.`motivoRecusa` AS `motivoRecusa` from ((((`solicitacao_locacao` `sl` join `cliente` `c` on((`sl`.`idCliente` = `c`.`idCliente`))) join `veiculo` `v` on((`v`.`idVeiculo` = `sl`.`idVeiculo`))) join `modelo` `mo` on((`mo`.`idModelo` = `v`.`idModelo`))) join `marca` `ma` on((`ma`.`idMarca` = `mo`.`idMarca`))) where isnull(`sl`.`confirmLocador`);

-- Copiando estrutura para view dbmob.vvisualizacao_cancelamento
DROP VIEW IF EXISTS `vvisualizacao_cancelamento`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `vvisualizacao_cancelamento`;
CREATE ALGORITHM=UNDEFINED DEFINER=`mob`@`%` SQL SECURITY DEFINER VIEW `vvisualizacao_cancelamento` AS select `c`.`idCancelamento` AS `idCancelamento`,`l`.`idLocacao` AS `idLocacao`,`cl`.`nome` AS `nome`,`c`.`idCliente` AS `idCliente`,`c`.`confirmacao` AS `confirmacao`,`c`.`motivo` AS `motivo` from (((`cancelamento` `c` join `locacao` `l` on((`l`.`idLocacao` = `c`.`idLocacao`))) join `solicitacao_locacao` `sl` on((`sl`.`idSolicitacao_Locacao` = `l`.`idSolicitacao_Locacao`))) join `cliente` `cl` on((`cl`.`idCliente` = `sl`.`idCliente`))) where isnull(`c`.`confirmacao`);

-- Copiando estrutura para view dbmob.v_detalhes_locacao
DROP VIEW IF EXISTS `v_detalhes_locacao`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `v_detalhes_locacao`;
CREATE ALGORITHM=UNDEFINED DEFINER=`mob`@`%` SQL SECURITY DEFINER VIEW `v_detalhes_locacao` AS select `l`.`idLocacao` AS `Idlocacao`,`cl`.`nome` AS `Locatario`,`cl2`.`nome` AS `Locador`,concat(`ma`.`nomeMarca`,' ',`mo`.`nomeModelo`) AS `Veiculo`,`sl`.`horarioInicio` AS `Inicio`,`sl`.`horarioFim` AS `Fim`,(`v`.`valorHora` * ceiling(((select timestampdiff(MINUTE,`solicitacao_locacao`.`horarioInicio`,`solicitacao_locacao`.`horarioFim`) from `solicitacao_locacao` where (`solicitacao_locacao`.`idSolicitacao_Locacao` = 1)) / 60))) AS `Valor total` from ((((((`solicitacao_locacao` `sl` join `cliente` `cl` on((`sl`.`idCliente` = `cl`.`idCliente`))) join `veiculo` `v` on((`v`.`idVeiculo` = `sl`.`idVeiculo`))) join `cliente` `cl2` on((`cl2`.`idCliente` = `v`.`idCliente`))) join `locacao` `l` on((`l`.`idSolicitacao_Locacao` = `sl`.`idSolicitacao_Locacao`))) join `modelo` `mo` on((`mo`.`idModelo` = `v`.`idModelo`))) join `marca` `ma` on((`ma`.`idMarca` = `mo`.`idMarca`)));

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
