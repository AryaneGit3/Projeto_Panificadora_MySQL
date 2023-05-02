-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.20-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para panificadoracentral
DROP DATABASE IF EXISTS `panificadoracentral`;
CREATE DATABASE IF NOT EXISTS `panificadoracentral` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `panificadoracentral`;

-- Copiando estrutura para tabela panificadoracentral.auditoria
DROP TABLE IF EXISTS `auditoria`;
CREATE TABLE IF NOT EXISTS `auditoria` (
  `codAuditoria` int(11) NOT NULL AUTO_INCREMENT,
  `acao` varchar(400) DEFAULT NULL,
  `tabela` varchar(50) DEFAULT NULL,
  `dataHora` datetime DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codAuditoria`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='Registra as principais alterações neste BD.';

-- Copiando dados para a tabela panificadoracentral.auditoria: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `auditoria` DISABLE KEYS */;
INSERT INTO `auditoria` (`codAuditoria`, `acao`, `tabela`, `dataHora`, `usuario`) VALUES
	(1, 'Cliente inserido: 888888888 Nome: teste e sua data de nascimento 2000-05-02', 'nome', '2023-05-02 10:02:04', 'root@localhost'),
	(2, 'Cliente inserido com o CPF: 7777e com o  Nome:  e sua data de nascimento 0000-00-00', 'nome', '2023-05-02 10:04:06', 'root@localhost'),
	(3, 'Cliente inserido com o CPF: 1324 e com o  Nome: teste e sua data de nascimento 2003-05-02', 'nome', '2023-05-02 10:05:39', 'root@localhost'),
	(4, 'Email do cliente: Guilherme Henrique Alves foi alterado para guilherhenrique@gmail.com', 'clientes', '2023-05-02 10:22:50', 'root@localhost'),
	(5, 'Cliente inserido com o CPF: 123 e com o  Nome: testedelete  e sua data de nascimento 2023-05-02', 'nome', '2023-05-02 10:44:41', 'root@localhost'),
	(6, NULL, 'clientes', '2023-05-02 10:44:52', 'root@localhost'),
	(7, 'Exclusão do cliente: testede CPF igual a1324', 'clientes', '2023-05-02 10:45:02', 'root@localhost');
/*!40000 ALTER TABLE `auditoria` ENABLE KEYS */;

-- Copiando estrutura para tabela panificadoracentral.categoria
DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `codCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nomeCategoria` varchar(45) NOT NULL,
  PRIMARY KEY (`codCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela panificadoracentral.categoria: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` (`codCategoria`, `nomeCategoria`) VALUES
	(3, 'Refrigerante'),
	(4, 'Chá'),
	(6, 'Farinha de Trigo'),
	(7, 'Sal Refinado'),
	(8, 'Óleo de Soja'),
	(9, 'Fermento Fresco Salgado'),
	(10, 'Fermento Fresco Doce'),
	(11, 'Cobertura Cremosa'),
	(12, 'Pães');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela panificadoracentral.clientes: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` (`cpf`, `nomeCliente`, `dataNascimento`, `telefone`, `email`, `cidadeCliente`, `enderecoCliente`, `bairro`, `cep`, `uf`) VALUES
	('07468454789', 'Gustavo Alves Luiz', '2004-05-14', '(35)9999-0000', 'gustavoalves3@outlook.com', 'Paraguaçu', 'Rua dos Marolos - 77', 'Centro', '37120000', 'MG'),
	('123', 'testedelete ', '2023-05-02', '123', NULL, 'Alfenas', '', '', '', ''),
	('1234', 'Maria Fernandes ', '1999-02-23', '(35)3295-0000', 'maria@fernandes', 'Varginha', 'Rua Tenório - 23', 'Jardim Aurora', '38000', 'MG'),
	('12983639690', 'Aryane Cassimiro Machado', '2003-09-03', '35997430134', 'aryane.@gmail.com', 'Carvalhópolis', 'Rua Primavera - 89', 'Centro', '37760000', 'MG'),
	('13244750648', 'Guilherme Henrique Alves', '1997-12-27', '3599995555', 'guilherhenrique@gmail.com', 'Machado', 'Rua dos Ipês - 78', 'Jardim Primavera', '37750000', 'SP'),
	('13344455547', 'Gabriel otavio ', '1998-12-30', '359888551505', 'gabiotavio@gmail.com', 'Machado', 'Rua A - 650', 'Jd europa', '37750000', 'MG'),
	('13366677749', 'Pedro Henrique', '1999-05-30', '35988811502', 'pedrohenrique@gmail.com', 'Machado', 'Rua C - 960', 'Jd europa', '37750000', 'MG'),
	('13455566648', 'Luiz Henrique', '1988-10-30', '359888551602', 'luizhenrique@gmail.com', 'Machado', 'Rua B - 850', 'Jd europa', '37750000', 'MG'),
	('45682211100', 'José dos Santos Silva', '1977-05-26', '3599995656', 'josesantos@gmail.com', 'Alfenas ', 'Rua Arnaldo Vieira - 88', 'Vila Nova', '35760000', 'MG');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela panificadoracentral.fornecedores: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `fornecedores` DISABLE KEYS */;
INSERT INTO `fornecedores` (`cnpj`, `nomeFornecedor`, `telefoneFornecedor`, `email`, `enderecoFornecedor`, `bairro`, `cidadeFornecedor`, `cep`, `uf`) VALUES
	('01564520000185', 'Sem limites', '353355-9600', 'semlimites@semlimites.com', 'avenida brasil - 320', 'recanto feliz', 'pouso alegre ', '37800132', 'MG'),
	('02497520000187', 'Herboflora LTDA', '32956330', 'herboflora@herboflora.com', 'Rua industria - 48', 'Industrial 2', 'Paraguaçu', '37750001', 'MG'),
	('23000000', 'Ambev', '354444000', 'ambev03@gmail.com', 'Avenida Dom Pedro - 152', 'Recanto Industrial ', 'Pouso Alegre ', '39560000', 'MG');
/*!40000 ALTER TABLE `fornecedores` ENABLE KEYS */;

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
CREATE PROCEDURE `new_alteraVenda`(in codVendaGAlt int, in datahoraVendaAlt datetime, in tipoVendaAlt enum ('À Vista','Cartão Débito','Cartão Crédito'), in nomeVendedorAlt varchar(200), in cpfClienteConsumidorAlt varchar(20))
BEGIN
	update vendas_geral set datahoraVenda=datahoraVendaAlt, tipoVenda=tipoVendaAlt, nomeVendedor=nomeVendedorAlt, CLIENTES_cpf=cpfClienteConsumidorAlt where codVendaG=codVendaGAlt;

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
									in nomeVendedorNovaVenda varchar(200), in cpfClienteConsumidor varchar(20))
BEGIN
	insert into vendas_geral(codVendaG, datahoraVenda, tipoVenda, nomeVendedor, CLIENTES_cpf)
    values(null, datahoraNovaVenda, tipoNovaVenda, nomeVendedorNovaVenda, cpfClienteConsumidor);
	

END//
DELIMITER ;

-- Copiando estrutura para tabela panificadoracentral.produtos
DROP TABLE IF EXISTS `produtos`;
CREATE TABLE IF NOT EXISTS `produtos` (
  `codProduto` int(11) NOT NULL AUTO_INCREMENT,
  `nomeProduto` varchar(200) NOT NULL,
  `precoVenda` decimal(10,0) NOT NULL,
  `margemLucro` decimal(10,0) DEFAULT NULL,
  `dataValidade` date DEFAULT NULL,
  `marcaProduto` varchar(100) NOT NULL,
  `qtdEstoque` decimal(10,2) DEFAULT NULL,
  `FORNECEDORES_cnpj` varchar(45) NOT NULL,
  `CATEGORIA_codCategoria` int(11) NOT NULL,
  PRIMARY KEY (`codProduto`,`FORNECEDORES_cnpj`,`CATEGORIA_codCategoria`),
  KEY `fk_PRODUTOS_FORNECEDORES1_idx` (`FORNECEDORES_cnpj`),
  KEY `fk_PRODUTOS_CATEGORIA1_idx` (`CATEGORIA_codCategoria`),
  CONSTRAINT `fk_PRODUTOS_CATEGORIA1` FOREIGN KEY (`CATEGORIA_codCategoria`) REFERENCES `categoria` (`codCategoria`),
  CONSTRAINT `fk_PRODUTOS_FORNECEDORES1` FOREIGN KEY (`FORNECEDORES_cnpj`) REFERENCES `fornecedores` (`cnpj`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela panificadoracentral.produtos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;

-- Copiando estrutura para tabela panificadoracentral.produtos_venda
DROP TABLE IF EXISTS `produtos_venda`;
CREATE TABLE IF NOT EXISTS `produtos_venda` (
  `VENDAS_GERAL_codVendaG` int(11) NOT NULL,
  `PRODUTOS_codProduto` int(11) NOT NULL,
  `qtdprodutos` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`VENDAS_GERAL_codVendaG`,`PRODUTOS_codProduto`),
  KEY `fk_VENDAS_GERAL_has_PRODUTOS_PRODUTOS1_idx` (`PRODUTOS_codProduto`),
  KEY `fk_VENDAS_GERAL_has_PRODUTOS_VENDAS_GERAL1_idx` (`VENDAS_GERAL_codVendaG`),
  CONSTRAINT `fk_VENDAS_GERAL_has_PRODUTOS_PRODUTOS1` FOREIGN KEY (`PRODUTOS_codProduto`) REFERENCES `produtos` (`codProduto`),
  CONSTRAINT `fk_VENDAS_GERAL_has_PRODUTOS_VENDAS_GERAL1` FOREIGN KEY (`VENDAS_GERAL_codVendaG`) REFERENCES `vendas_geral` (`codVendaG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela panificadoracentral.produtos_venda: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `produtos_venda` DISABLE KEYS */;
/*!40000 ALTER TABLE `produtos_venda` ENABLE KEYS */;

-- Copiando estrutura para tabela panificadoracentral.vendas_geral
DROP TABLE IF EXISTS `vendas_geral`;
CREATE TABLE IF NOT EXISTS `vendas_geral` (
  `codVendaG` int(11) NOT NULL AUTO_INCREMENT,
  `datahoraVenda` datetime NOT NULL,
  `tipoVenda` enum('À Vista','Cartão Débito','Cartão Crédito') NOT NULL,
  `nomeVendedor` varchar(200) NOT NULL,
  `CLIENTES_cpf` varchar(20) NOT NULL,
  PRIMARY KEY (`codVendaG`,`CLIENTES_cpf`),
  KEY `fk_VENDAS_GERAL_CLIENTES_idx` (`CLIENTES_cpf`),
  CONSTRAINT `fk_VENDAS_GERAL_CLIENTES` FOREIGN KEY (`CLIENTES_cpf`) REFERENCES `clientes` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela panificadoracentral.vendas_geral: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `vendas_geral` DISABLE KEYS */;
INSERT INTO `vendas_geral` (`codVendaG`, `datahoraVenda`, `tipoVenda`, `nomeVendedor`, `CLIENTES_cpf`) VALUES
	(6, '2023-03-20 20:42:02', 'Cartão Crédito', 'Gustavo', '13244750648'),
	(12, '2023-03-20 20:58:06', 'Cartão Débito', 'Suzana', '12983639690'),
	(15, '2023-03-20 20:59:03', 'Cartão Débito', 'Gustavo', '13244750648');
/*!40000 ALTER TABLE `vendas_geral` ENABLE KEYS */;

-- Copiando estrutura para view panificadoracentral.v_clientesordemcrescende
DROP VIEW IF EXISTS `v_clientesordemcrescende`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `v_clientesordemcrescende` (
	`nomeCliente` VARCHAR(200) NOT NULL COLLATE 'utf8_general_ci',
	`cpf` VARCHAR(20) NOT NULL COLLATE 'utf8_general_ci',
	`telefone` VARCHAR(20) NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Copiando estrutura para view panificadoracentral.v_nascimentoordemcrescente
DROP VIEW IF EXISTS `v_nascimentoordemcrescente`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `v_nascimentoordemcrescente` (
	`nomeCliente` VARCHAR(200) NOT NULL COLLATE 'utf8_general_ci',
	`DATE_FORMAT(dataNascimento, "%d/%m/%Y")` VARCHAR(10) NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Copiando estrutura para view panificadoracentral.v_uf
DROP VIEW IF EXISTS `v_uf`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `v_uf` (
	`nomeCliente` VARCHAR(200) NOT NULL COLLATE 'utf8_general_ci',
	`date_format(dataNascimento,"%d/%m/%y")` VARCHAR(8) NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Copiando estrutura para trigger panificadoracentral.tri_insereCliente
DROP TRIGGER IF EXISTS `tri_insereCliente`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_insereCliente` AFTER INSERT ON `clientes` FOR EACH ROW BEGIN 
	SET @mensagem = CONCAT("Cliente inserido com o CPF: ", NEW.cpf, " e com o  Nome: " , NEW.nomeCliente, 
	" e sua data de nascimento ", NEW.dataNascimento);
	INSERT INTO auditoria VALUES (NULL, @mensagem, "nome", NOW(), USER() );
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger panificadoracentral.tri_LogAlteraEmailCli
DROP TRIGGER IF EXISTS `tri_LogAlteraEmailCli`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_LogAlteraEmailCli` BEFORE UPDATE ON `clientes` FOR EACH ROW BEGIN 

	SET @mensagem = CONCAT("Email do cliente: ", NEW.nomeCliente, " foi alterado para " , NEW.email);
	
	INSERT INTO auditoria VALUES (NULL, @mensagem, "clientes", NOW(), USER());
	
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger panificadoracentral.tri_LogDeleteCliente
DROP TRIGGER IF EXISTS `tri_LogDeleteCliente`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_LogDeleteCliente` AFTER DELETE ON `clientes` FOR EACH ROW BEGIN

SELECT cpf INTO @cpfCliente FROM clientes
WHERE cpf = OLD.cpf;

SET @mensagem = CONCAT("Exclusão do cliente: ", OLD.nomeCliente, " de CPF igual a ",  OLD.cpf);
INSERT INTO auditoria
VALUES(NULL, @mensagem, "clientes", NOW(), USER());

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para view panificadoracentral.v_clientesordemcrescende
DROP VIEW IF EXISTS `v_clientesordemcrescende`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `v_clientesordemcrescende`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_clientesordemcrescende` AS (SELECT nomeCliente, cpf, telefone FROM clientes ORDER BY nomeCliente) ;

-- Copiando estrutura para view panificadoracentral.v_nascimentoordemcrescente
DROP VIEW IF EXISTS `v_nascimentoordemcrescente`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `v_nascimentoordemcrescente`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_nascimentoordemcrescente` AS (SELECT nomeCliente, DATE_FORMAT(dataNascimento, "%d/%m/%Y") FROM clientes ORDER BY dataNascimento) ;

-- Copiando estrutura para view panificadoracentral.v_uf
DROP VIEW IF EXISTS `v_uf`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `v_uf`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_uf` AS (SELECT nomeCliente, date_format(dataNascimento,"%d/%m/%y") from clientes WHERE uf LIKE "%MG") ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
