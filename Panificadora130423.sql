-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.31 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para panificadoracentral
DROP DATABASE IF EXISTS `panificadoracentral`;
CREATE DATABASE IF NOT EXISTS `panificadoracentral` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `panificadoracentral`;

-- Copiando estrutura para tabela panificadoracentral.categoria
DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `codCategoria` int NOT NULL AUTO_INCREMENT,
  `nomeCategoria` varchar(45) NOT NULL,
  PRIMARY KEY (`codCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela panificadoracentral.categoria: ~9 rows (aproximadamente)
INSERT INTO `categoria` (`codCategoria`, `nomeCategoria`) VALUES
	(3, 'Refrigerante'),
	(4, 'Chá'),
	(5, 'Chocolate '),
	(6, 'Farinha de Trigo'),
	(7, 'Sal Refinado'),
	(8, 'Óleo de Soja'),
	(9, 'Fermento Fresco Salgado'),
	(10, 'Fermento Fresco Doce'),
	(11, 'Cobertura Cremosa'),
	(12, 'Cereais');

-- Copiando estrutura para view panificadoracentral.clienteordemcrescente
DROP VIEW IF EXISTS `clienteordemcrescente`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `clienteordemcrescente` (
	`nomeCliente` VARCHAR(200) NOT NULL COLLATE 'utf8mb3_general_ci',
	`cpf` VARCHAR(20) NOT NULL COLLATE 'utf8mb3_general_ci',
	`telefone` VARCHAR(20) NOT NULL COLLATE 'utf8mb3_general_ci'
) ENGINE=MyISAM;

-- Copiando estrutura para tabela panificadoracentral.clientes
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `cpf` varchar(20) NOT NULL,
  `nomeCliente` varchar(200) NOT NULL,
  `dataNascimento` date NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `cidadeCliente` varchar(100) NOT NULL,
  `enderecoCliente` varchar(100) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `cep` varchar(20) NOT NULL,
  `uf` varchar(2) NOT NULL,
  PRIMARY KEY (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela panificadoracentral.clientes: ~4 rows (aproximadamente)
INSERT INTO `clientes` (`cpf`, `nomeCliente`, `dataNascimento`, `telefone`, `email`, `cidadeCliente`, `enderecoCliente`, `bairro`, `cep`, `uf`) VALUES
	('07468454789', 'Gustavo Alves Luiz', '2004-05-14', '358888000', 'gustavo@hotmail.com', 'Paraguaçu', 'Rua dos Marolos - 77', 'Centro', '37120000', 'MG'),
	('12983639690', 'Aryane Cassimiro Machado', '2003-09-03', '35997430134', 'aryane.@gmail.com', 'Carvalhópolis', 'Rua Primavera - 89', 'Centro', '37760000', 'MG'),
	('13244750648', 'Guilherme Henrique Alves', '1997-12-27', '3599995555', 'guilhermealves@gmail.com', 'Machado', 'Rua dos Ipês - 78', 'Jardim Primavera', '37750000', 'MG'),
	('45682211100', 'José dos Santos Silva', '1977-05-26', '3599995656', 'josesantos@gmail.com', 'Alfenas ', 'Rua Arnaldo Vieira - 88', 'Vila Nova', '35760000', 'MG');

-- Copiando estrutura para tabela panificadoracentral.fornecedores
DROP TABLE IF EXISTS `fornecedores`;
CREATE TABLE IF NOT EXISTS `fornecedores` (
  `cnpj` varchar(45) NOT NULL,
  `nomeFornecedor` varchar(200) NOT NULL,
  `telefoneFornecedor` varchar(20) NOT NULL,
  `email` varchar(200) NOT NULL,
  `enderecoFornecedor` varchar(200) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `cidadeFornecedor` varchar(200) NOT NULL,
  `cep` varchar(45) NOT NULL,
  `uf` char(2) NOT NULL,
  PRIMARY KEY (`cnpj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela panificadoracentral.fornecedores: ~3 rows (aproximadamente)
INSERT INTO `fornecedores` (`cnpj`, `nomeFornecedor`, `telefoneFornecedor`, `email`, `enderecoFornecedor`, `bairro`, `cidadeFornecedor`, `cep`, `uf`) VALUES
	('02497520000187', 'Herboflora LTDA', '32956330', 'herboflora@herboflora.com', 'Rua industria - 48', 'Industrial 2', 'Paraguaçu', '37750001', 'MG'),
	('23000000', 'Ambev', '354444000', 'ambev03@gmail.com', 'Avenida Dom Pedro - 152', 'Recanto Industrial ', 'Pouso Alegre ', '39560000', 'MG'),
	('35.777.555/0001-33', 'Nestlé', '(11)99999-5555', 'nestle@gmail.com', 'Rua das Produções', 'Avenida Cruzeiro', 'Sumaré', '55000-000', 'SP');

-- Copiando estrutura para procedure panificadoracentral.new_alteraCategoria
DROP PROCEDURE IF EXISTS `new_alteraCategoria`;
DELIMITER //
CREATE PROCEDURE `new_alteraCategoria`(in codCatAlterado int, in nomeCatAlterado varchar(45))
BEGIN
	update categoria set codCategoria=codCatAlterado where nomeCategoria=nomeCatAlterado;
END//
DELIMITER ;

-- Copiando estrutura para procedure panificadoracentral.new_alteraClientes
DROP PROCEDURE IF EXISTS `new_alteraClientes`;
DELIMITER //
CREATE PROCEDURE `new_alteraClientes`(in cpfcodigo varchar(20), in nomeAlt varchar(200), in dataAlt date, in telefoneAlt varchar(20),
 in emailAlt varchar(200), in cidadeClienteAlt varchar(100), in enderecoAlt varchar(200), in bairroAlt varchar(200), in cepAlt varchar(20), in ufAlt varchar (2))
BEGIN
	update clientes set nomeCliente=nomeAlt, dataNascimento=dataAlt, telefone=telefoneAlt, email=emailAlt, 
    cidadeCliente=cidadeClienteAlt, enderecoCliente=enderecoAlt, bairro=bairroAlt, cep=cepAlt, uf=ufAlt where cpf=cpfcodigo;
    
    

END//
DELIMITER ;

-- Copiando estrutura para procedure panificadoracentral.new_alteraFornecedor¹
DROP PROCEDURE IF EXISTS `new_alteraFornecedor¹`;
DELIMITER //
CREATE PROCEDURE `new_alteraFornecedor¹`(in cnpjAlt varchar(45), in nomeFornAlt varchar(200), in telefoneFornAlt varchar(20),
in emailFornAlt varchar(200), in enderecoFornAlt varchar(200), in bairroFornAlt varchar(100), cidadeFornAlt varchar(200), in cepFornAlt varchar(45) ,
 ufFornAlt char(2) )
BEGIN
	update fornecedores set  nomeFornecedor = nomeFornAlt 
		where cnpj = cnpjAlt;
    update fornecedores set  telefoneFornecedor = telefoneFornAlt 
		where cnpj = cnpjAlt;
    update fornecedores set  email = emailFornAlt 
		where cnpj = cnpjAlt;
    update fornecedores set  enderecoFornecedor = enderecoFornAlt 
		where cnpj = cnpjAlt;
	update fornecedores set  bairro = bairroFornAlt 
		where cnpj = cnpjAlt;
	update fornecedores set  cidadeFornecedor = cidadeFornAlt 
		where cnpj = cnpjAlt;
	update fornecedores set  cep = cepFornAlt
		where cnpj = cnpjAlt;
    update fornecedores set  uf = ufFornAlt
		where cnpj = cnpjAlt;    
END//
DELIMITER ;

-- Copiando estrutura para procedure panificadoracentral.new_alteraProduto
DROP PROCEDURE IF EXISTS `new_alteraProduto`;
DELIMITER //
CREATE PROCEDURE `new_alteraProduto`(in codProdAlt int, in nomeProdAlt varchar(200), in precoVendaAlt decimal(10.0),
										in margemLucroAlt decimal(10.0), in dataValidadeAlt date, in marcaProdAlt varchar(100), 
                                        in qtdEstoqueAlt decimal(10.2), in fornecedorAlt varchar(45), in categoriaAlt int)
BEGIN 
	update produtos set nomeProduto=nomeProdAlt, precoVenda=precoVendaAlt, margemLucro=margemLucroAlt, dataValidade=dataValidadeAlt,
    marcaProduto=marcaProdAlt, qtdEstoque=qtdEstoqueAlt, FORNECEDORES_cnpj=fornecedorAlt, CATEGORIA_codcategoria=categoriaAlt where codProduto=codProdAlt;
	

END//
DELIMITER ;

-- Copiando estrutura para procedure panificadoracentral.new_alteraVenda
DROP PROCEDURE IF EXISTS `new_alteraVenda`;
DELIMITER //
CREATE PROCEDURE `new_alteraVenda`(in codVendaGAlt int, in datahoraVendaAlt datetime, in tipoVendaAlt enum ('À Vista','Cartão Débito','Cartão Crédito'), in valorVendaAlt decimal (10.2), in nomeVendedorAlt varchar(200), in cpfClienteConsumidorAlt varchar(20))
BEGIN
	update vendas_geral set datahoraVenda=datahoraVendaAlt, tipoVenda=tipoVendaAlt, valorVenda=valorVendaAlt, nomeVendedor=nomeVendedorAlt, CLIENTES_cpf=cpfClienteConsumidorAlt where codVendaG=codVendaGAlt;

END//
DELIMITER ;

-- Copiando estrutura para procedure panificadoracentral.new_deleteCategoria
DROP PROCEDURE IF EXISTS `new_deleteCategoria`;
DELIMITER //
CREATE PROCEDURE `new_deleteCategoria`(in codCatExcluir int)
BEGIN
	delete from categoria where codCategoria=codCatExcluir;
END//
DELIMITER ;

-- Copiando estrutura para procedure panificadoracentral.new_deleteCliente
DROP PROCEDURE IF EXISTS `new_deleteCliente`;
DELIMITER //
CREATE PROCEDURE `new_deleteCliente`(in cpfcodigo varchar(20))
BEGIN
	delete from clientes where cpf=cpfcodigo;

END//
DELIMITER ;

-- Copiando estrutura para procedure panificadoracentral.new_deleteFornecedor
DROP PROCEDURE IF EXISTS `new_deleteFornecedor`;
DELIMITER //
CREATE PROCEDURE `new_deleteFornecedor`(in cnpjExcluir varchar(45))
BEGIN
	delete from fornecedores where cnpj=cnpjExcluir;
	

END//
DELIMITER ;

-- Copiando estrutura para procedure panificadoracentral.new_deleteProduto
DROP PROCEDURE IF EXISTS `new_deleteProduto`;
DELIMITER //
CREATE PROCEDURE `new_deleteProduto`(in codProdExcluir int)
BEGIN
	delete from produtos where codProduto=codProdExcluir;

END//
DELIMITER ;

-- Copiando estrutura para procedure panificadoracentral.new_deleteVenda
DROP PROCEDURE IF EXISTS `new_deleteVenda`;
DELIMITER //
CREATE PROCEDURE `new_deleteVenda`(in codExcluirVenda int)
BEGIN
	delete from vendas_geral where codVendaG=codExcluirVenda; 

END//
DELIMITER ;

-- Copiando estrutura para procedure panificadoracentral.new_insereCategoria
DROP PROCEDURE IF EXISTS `new_insereCategoria`;
DELIMITER //
CREATE PROCEDURE `new_insereCategoria`(in nomeNovaCat varchar(45))
BEGIN
	insert into categoria(codCategoria,nomeCategoria)
    values (null, nomeNovaCat);
   
END//
DELIMITER ;

-- Copiando estrutura para procedure panificadoracentral.new_insereClientes
DROP PROCEDURE IF EXISTS `new_insereClientes`;
DELIMITER //
CREATE PROCEDURE `new_insereClientes`(in cpfNovo varchar(20), in nomeNovo varchar(100), in dataNova date, 
in telefoneNovo varchar(20), in emailNovo varchar(200),in cidadeClienteNovo varchar (100),  in enderecoNovo varchar(100), in bairroNovo varchar(100),
 in cepNovo varchar(20), in ufNovo varchar(20))
BEGIN

	insert into clientes(cpf, nomeCliente, dataNascimento, telefone, email, cidadeCliente, enderecoCliente, bairro, cep, uf)
    values (cpfNovo, nomeNovo, dataNova, telefoneNovo, emailNovo,cidadeClienteNovo, enderecoNovo, bairroNovo, cepNovo, ufNovo);
   
END//
DELIMITER ;

-- Copiando estrutura para procedure panificadoracentral.new_insereFornecedor
DROP PROCEDURE IF EXISTS `new_insereFornecedor`;
DELIMITER //
CREATE PROCEDURE `new_insereFornecedor`(in cnpjNovo varchar(45), in nomeNovoForn varchar(200), in telefoneNovoForn varchar(20),
										in emailNovoForn varchar(200), in enderecoNovoForn varchar(200), in bairroNovoForn varchar(100), 
                                        in cidadeNovoForn varchar(200), in cepNovoForn varchar(45), in ufNovoForn char(2))
BEGIN
	insert into fornecedores(cnpj,nomeFornecedor, telefoneFornecedor, email,enderecoFornecedor, bairro, cidadeFornecedor, cep, uf)
    values (cnpjNovo, nomeNovoForn, telefoneNovoForn, emailNovoForn, enderecoNovoForn, bairroNovoForn, cidadeNovoForn, cepNovoForn, ufNovoForn);
    

END//
DELIMITER ;

-- Copiando estrutura para procedure panificadoracentral.new_insereProduto
DROP PROCEDURE IF EXISTS `new_insereProduto`;
DELIMITER //
CREATE PROCEDURE `new_insereProduto`(in nomeNovoProd varchar(200),in precoNovoVenda decimal(10.0),
									in margemNovoLucro decimal(10.0), in dataNovoValidade date, 
                                    in marcaNovoProd varchar(100), in qtdNovoEstoque decimal(10.2), in fornecedorProd varchar(45), in categoriaProd int)
BEGIN 
	insert into produtos(codProduto,nomeProduto,precoVenda,margemLucro,dataValidade,marcaProduto,qtdEstoque,FORNECEDORES_cnpj,CATEGORIA_codCategoria) 
    values(null,nomeNovoProd, precoNovoVenda, margemNovoLucro, dataNovoValidade, marcaNovoProd,qtdNovoEstoque, fornecedorProd, categoriaProd);
	

END//
DELIMITER ;

-- Copiando estrutura para procedure panificadoracentral.new_insereVenda
DROP PROCEDURE IF EXISTS `new_insereVenda`;
DELIMITER //
CREATE PROCEDURE `new_insereVenda`(in datahoraNovaVenda datetime, in tipoNovaVenda enum ('À Vista','Cartão Débito','Cartão Crédito'),
									in valorVendaG decimal (10.2) , in nomeVendedorNovaVenda varchar(200), in cpfClienteConsumidor varchar(20))
BEGIN
	insert into vendas_geral(codVendaG, datahoraVenda, tipoVenda, valorVenda, nomeVendedor, CLIENTES_cpf)
    values(null, datahoraNovaVenda, tipoNovaVenda, valorVendaG, nomeVendedorNovaVenda, cpfClienteConsumidor);
	

END//
DELIMITER ;

-- Copiando estrutura para tabela panificadoracentral.produtos
DROP TABLE IF EXISTS `produtos`;
CREATE TABLE IF NOT EXISTS `produtos` (
  `codProduto` int NOT NULL AUTO_INCREMENT,
  `nomeProduto` varchar(200) NOT NULL,
  `precoVenda` decimal(10,0) NOT NULL,
  `margemLucro` decimal(10,0) DEFAULT NULL,
  `dataValidade` date DEFAULT NULL,
  `marcaProduto` varchar(100) NOT NULL,
  `qtdEstoque` decimal(10,2) DEFAULT NULL,
  `FORNECEDORES_cnpj` varchar(45) NOT NULL,
  `CATEGORIA_codCategoria` int NOT NULL,
  PRIMARY KEY (`codProduto`,`FORNECEDORES_cnpj`,`CATEGORIA_codCategoria`),
  KEY `fk_PRODUTOS_FORNECEDORES1_idx` (`FORNECEDORES_cnpj`),
  KEY `fk_PRODUTOS_CATEGORIA1_idx` (`CATEGORIA_codCategoria`),
  CONSTRAINT `fk_PRODUTOS_CATEGORIA1` FOREIGN KEY (`CATEGORIA_codCategoria`) REFERENCES `categoria` (`codCategoria`),
  CONSTRAINT `fk_PRODUTOS_FORNECEDORES1` FOREIGN KEY (`FORNECEDORES_cnpj`) REFERENCES `fornecedores` (`cnpj`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela panificadoracentral.produtos: ~5 rows (aproximadamente)
INSERT INTO `produtos` (`codProduto`, `nomeProduto`, `precoVenda`, `margemLucro`, `dataValidade`, `marcaProduto`, `qtdEstoque`, `FORNECEDORES_cnpj`, `CATEGORIA_codCategoria`) VALUES
	(2, 'Lolo 35g', 4, 35, '2023-12-10', 'Nestlé', 50.00, '35.777.555/0001-33', 5),
	(3, 'Laka 100g', 8, 35, '2023-05-12', 'Nestlé', 60.00, '35.777.555/0001-33', 5),
	(4, 'Diamante Negro 35g', 3, 35, '2023-05-14', 'Nestlé', 30.00, '35.777.555/0001-33', 5),
	(5, 'Guaraná Antártica 2l', 10, 35, '2023-05-14', 'Antártica', 50.00, '23000000', 3),
	(6, 'Sukita Laranja 2l', 7, 35, '2023-05-16', 'Sukita', 25.00, '23000000', 3);

-- Copiando estrutura para tabela panificadoracentral.produtos_venda
DROP TABLE IF EXISTS `produtos_venda`;
CREATE TABLE IF NOT EXISTS `produtos_venda` (
  `VENDAS_GERAL_codVendaG` int NOT NULL,
  `PRODUTOS_codProduto` int NOT NULL,
  `qtdprodutos` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`VENDAS_GERAL_codVendaG`,`PRODUTOS_codProduto`),
  KEY `fk_VENDAS_GERAL_has_PRODUTOS_PRODUTOS1_idx` (`PRODUTOS_codProduto`),
  KEY `fk_VENDAS_GERAL_has_PRODUTOS_VENDAS_GERAL1_idx` (`VENDAS_GERAL_codVendaG`),
  CONSTRAINT `fk_VENDAS_GERAL_has_PRODUTOS_PRODUTOS1` FOREIGN KEY (`PRODUTOS_codProduto`) REFERENCES `produtos` (`codProduto`),
  CONSTRAINT `fk_VENDAS_GERAL_has_PRODUTOS_VENDAS_GERAL1` FOREIGN KEY (`VENDAS_GERAL_codVendaG`) REFERENCES `vendas_geral` (`codVendaG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela panificadoracentral.produtos_venda: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela panificadoracentral.vendas_geral
DROP TABLE IF EXISTS `vendas_geral`;
CREATE TABLE IF NOT EXISTS `vendas_geral` (
  `codVendaG` int NOT NULL AUTO_INCREMENT,
  `datahoraVenda` datetime NOT NULL,
  `tipoVenda` enum('À Vista','Cartão Débito','Cartão Crédito') NOT NULL,
  `nomeVendedor` varchar(200) NOT NULL,
  `CLIENTES_cpf` varchar(20) NOT NULL,
  `valorVenda` decimal(10,0) NOT NULL,
  PRIMARY KEY (`codVendaG`,`CLIENTES_cpf`),
  KEY `fk_VENDAS_GERAL_CLIENTES_idx` (`CLIENTES_cpf`),
  CONSTRAINT `fk_VENDAS_GERAL_CLIENTES` FOREIGN KEY (`CLIENTES_cpf`) REFERENCES `clientes` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela panificadoracentral.vendas_geral: ~4 rows (aproximadamente)
INSERT INTO `vendas_geral` (`codVendaG`, `datahoraVenda`, `tipoVenda`, `nomeVendedor`, `CLIENTES_cpf`, `valorVenda`) VALUES
	(1, '2022-11-16 08:41:00', 'À Vista', 'Suzana', '12983639690', 19),
	(2, '2022-11-21 19:16:00', 'Cartão Débito', 'Aline', '12983639690', 35),
	(3, '2022-11-20 00:00:00', 'Cartão Crédito', 'Aline ', '13244750648', 59),
	(4, '2022-10-14 08:53:00', 'À Vista', 'Suzana', '13244750648', 97);

-- Copiando estrutura para view panificadoracentral.v_clientes_odercrescente
DROP VIEW IF EXISTS `v_clientes_odercrescente`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `v_clientes_odercrescente` (
	`nomeCliente` VARCHAR(200) NOT NULL COLLATE 'utf8mb3_general_ci',
	`cpf` VARCHAR(20) NOT NULL COLLATE 'utf8mb3_general_ci',
	`telefone` VARCHAR(20) NOT NULL COLLATE 'utf8mb3_general_ci'
) ENGINE=MyISAM;

-- Copiando estrutura para view panificadoracentral.v_nascimentoordemcrescente
DROP VIEW IF EXISTS `v_nascimentoordemcrescente`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `v_nascimentoordemcrescente` (
	`nomeCliente` VARCHAR(200) NOT NULL COLLATE 'utf8mb3_general_ci',
	`Nascimento` VARCHAR(10) NULL COLLATE 'utf8mb4_0900_ai_ci'
) ENGINE=MyISAM;

-- Copiando estrutura para view panificadoracentral.v_uf
DROP VIEW IF EXISTS `v_uf`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `v_uf` (
	`cpf` VARCHAR(20) NOT NULL COLLATE 'utf8mb3_general_ci',
	`nomeCliente` VARCHAR(200) NOT NULL COLLATE 'utf8mb3_general_ci',
	`dataNascimento` DATE NOT NULL,
	`telefone` VARCHAR(20) NOT NULL COLLATE 'utf8mb3_general_ci',
	`email` VARCHAR(200) NULL COLLATE 'utf8mb3_general_ci',
	`cidadeCliente` VARCHAR(100) NOT NULL COLLATE 'utf8mb3_general_ci',
	`enderecoCliente` VARCHAR(100) NOT NULL COLLATE 'utf8mb3_general_ci',
	`bairro` VARCHAR(100) NOT NULL COLLATE 'utf8mb3_general_ci',
	`cep` VARCHAR(20) NOT NULL COLLATE 'utf8mb3_general_ci',
	`uf` VARCHAR(2) NOT NULL COLLATE 'utf8mb3_general_ci'
) ENGINE=MyISAM;

-- Copiando estrutura para view panificadoracentral.clienteordemcrescente
DROP VIEW IF EXISTS `clienteordemcrescente`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `clienteordemcrescente`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `clienteordemcrescente` AS select `clientes`.`nomeCliente` AS `nomeCliente`,`clientes`.`cpf` AS `cpf`,`clientes`.`telefone` AS `telefone` from `clientes` order by `clientes`.`nomeCliente`;

-- Copiando estrutura para view panificadoracentral.v_clientes_odercrescente
DROP VIEW IF EXISTS `v_clientes_odercrescente`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `v_clientes_odercrescente`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_clientes_odercrescente` AS select `clientes`.`nomeCliente` AS `nomeCliente`,`clientes`.`cpf` AS `cpf`,`clientes`.`telefone` AS `telefone` from `clientes` order by `clientes`.`nomeCliente`;

-- Copiando estrutura para view panificadoracentral.v_nascimentoordemcrescente
DROP VIEW IF EXISTS `v_nascimentoordemcrescente`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `v_nascimentoordemcrescente`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_nascimentoordemcrescente` AS select `clientes`.`nomeCliente` AS `nomeCliente`,date_format(`clientes`.`dataNascimento`,'%d/%m/%Y') AS `Nascimento` from `clientes`;

-- Copiando estrutura para view panificadoracentral.v_uf
DROP VIEW IF EXISTS `v_uf`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `v_uf`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_uf` AS select `clientes`.`cpf` AS `cpf`,`clientes`.`nomeCliente` AS `nomeCliente`,`clientes`.`dataNascimento` AS `dataNascimento`,`clientes`.`telefone` AS `telefone`,`clientes`.`email` AS `email`,`clientes`.`cidadeCliente` AS `cidadeCliente`,`clientes`.`enderecoCliente` AS `enderecoCliente`,`clientes`.`bairro` AS `bairro`,`clientes`.`cep` AS `cep`,`clientes`.`uf` AS `uf` from `clientes` where (`clientes`.`uf` like '%MG');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
