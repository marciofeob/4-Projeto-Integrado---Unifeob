-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema quoteflex
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema quoteflex
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `quoteflex` DEFAULT CHARACTER SET utf8 ;
USE `quoteflex` ;

-- -----------------------------------------------------
-- Table `quoteflex`.`empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quoteflex`.`empresa` (
  `empresa_id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(300) NOT NULL,
  `nome_fant` VARCHAR(150) NULL,
  `cnpj_raiz` INT(8) NOT NULL,
  `cnpj_filial` INT(4) NOT NULL,
  `cnpj_dv` INT(2) NOT NULL,
  `sit` INT(1) NOT NULL,
  `url_logo` VARCHAR(4000) NULL,
  PRIMARY KEY (`empresa_id`),
  UNIQUE INDEX `cnpj_raiz_UNIQUE` (`cnpj_raiz` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quoteflex`.`seguradora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quoteflex`.`seguradora` (
  `seguradora_id` INT NOT NULL AUTO_INCREMENT,
  `sit` INT(1) NOT NULL,
  `empresa_id` INT NOT NULL,
  PRIMARY KEY (`seguradora_id`),
  INDEX `fk_seguradora_empresa_idx` (`empresa_id` ASC) VISIBLE,
  CONSTRAINT `fk_seguradora_empresa`
    FOREIGN KEY (`empresa_id`)
    REFERENCES `quoteflex`.`empresa` (`empresa_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quoteflex`.`dominio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quoteflex`.`dominio` (
  `dominio_id` INT NOT NULL AUTO_INCREMENT,
  `descr` VARCHAR(300) NOT NULL,
  `dominio` VARCHAR(300) NOT NULL,
  `vlr` INT(10) NOT NULL,
  PRIMARY KEY (`dominio_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quoteflex`.`pessoa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quoteflex`.`pessoa` (
  `pessoa_id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(300) NOT NULL,
  PRIMARY KEY (`pessoa_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quoteflex`.`pf`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quoteflex`.`pf` (
  `pf_id` INT NOT NULL AUTO_INCREMENT,
  `cpf` INT(11) NOT NULL,
  `rg` VARCHAR(9) NULL,
  `cnh` VARCHAR(9) NULL,
  `pessoa_id` INT NOT NULL,
  PRIMARY KEY (`pf_id`),
  INDEX `fk_pf_pessoa1_idx` (`pessoa_id` ASC) VISIBLE,
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE,
  UNIQUE INDEX `rg_UNIQUE` (`rg` ASC) VISIBLE,
  UNIQUE INDEX `cnh_UNIQUE` (`cnh` ASC) VISIBLE,
  CONSTRAINT `fk_pf_pessoa1`
    FOREIGN KEY (`pessoa_id`)
    REFERENCES `quoteflex`.`pessoa` (`pessoa_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quoteflex`.`pj`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quoteflex`.`pj` (
  `pj_id` INT NOT NULL AUTO_INCREMENT,
  `cnpj_raiz` INT(8) NOT NULL,
  `cnpj_filial` INT(4) NOT NULL,
  `cnpj_dv` INT(2) NOT NULL,
  `pessoa_id` INT NOT NULL,
  PRIMARY KEY (`pj_id`),
  INDEX `fk_pj_pessoa1_idx` (`pessoa_id` ASC) VISIBLE,
  UNIQUE INDEX `cnpj_raiz_UNIQUE` (`cnpj_raiz` ASC) VISIBLE,
  CONSTRAINT `fk_pj_pessoa1`
    FOREIGN KEY (`pessoa_id`)
    REFERENCES `quoteflex`.`pessoa` (`pessoa_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quoteflex`.`tp_acesso_usu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quoteflex`.`tp_acesso_usu` (
  `tpacessusu_id` INT NOT NULL AUTO_INCREMENT,
  `descr` VARCHAR(100) NOT NULL,
  `cd` INT(2) NOT NULL,
  `sit` INT(1) NOT NULL,
  PRIMARY KEY (`tpacessusu_id`),
  UNIQUE INDEX `cd_UNIQUE` (`cd` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quoteflex`.`funcao_usu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quoteflex`.`funcao_usu` (
  `funcaousu_id` INT NOT NULL AUTO_INCREMENT,
  `descr` VARCHAR(100) NOT NULL,
  `cd` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`funcaousu_id`),
  UNIQUE INDEX `cd_UNIQUE` (`cd` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quoteflex`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quoteflex`.`usuario` (
  `usuario_id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(300) NOT NULL,
  `cd_usu_bd` VARCHAR(100) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `sit` INT(1) NOT NULL,
  `tpacessusu_id` INT NOT NULL,
  `funcaousu_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`),
  INDEX `fk_usuario_tpacessousu` (`tpacessusu_id` ASC) VISIBLE,
  INDEX `fk_usuario_funcao_usu1_idx` (`funcaousu_id` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_tpacessusu`
    FOREIGN KEY (`tpacessusu_id`)
    REFERENCES `quoteflex`.`tp_acesso_usu` (`tpacessusu_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_funcaousu`
    FOREIGN KEY (`funcaousu_id`)
    REFERENCES `quoteflex`.`funcao_usu` (`funcaousu_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quoteflex`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quoteflex`.`cliente` (
  `cliente_id` INT NOT NULL AUTO_INCREMENT,
  `dt_incl` DATETIME NOT NULL,
  `sit` INT(1) NOT NULL,
  `pessoa_id` INT NOT NULL,
  PRIMARY KEY (`cliente_id`),
  INDEX `fk_cliente_pessoa1_idx` (`pessoa_id` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_pessoa`
    FOREIGN KEY (`pessoa_id`)
    REFERENCES `quoteflex`.`pessoa` (`pessoa_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quoteflex`.`meio_comunic`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quoteflex`.`meio_comunic` (
  `meiocomunic_id` INT NOT NULL AUTO_INCREMENT,
  `descr` VARCHAR(100) NOT NULL,
  `tp` INT(1) NOT NULL,
  `pessoa_id` INT NOT NULL,
  PRIMARY KEY (`meiocomunic_id`),
  INDEX `fk_meio_comunic_pessoa1_idx` (`pessoa_id` ASC) VISIBLE,
  CONSTRAINT `fk_meio_comunic_pessoa1`
    FOREIGN KEY (`pessoa_id`)
    REFERENCES `quoteflex`.`pessoa` (`pessoa_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quoteflex`.`marca_veic`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quoteflex`.`marca_veic` (
  `marcaveic_id` INT NOT NULL AUTO_INCREMENT,
  `descr` VARCHAR(300) NOT NULL,
  `cd` INT(3) NOT NULL,
  PRIMARY KEY (`marcaveic_id`),
  UNIQUE INDEX `cd_UNIQUE` (`cd` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quoteflex`.`modelo_veic`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quoteflex`.`modelo_veic` (
  `modelveic_id` INT NOT NULL AUTO_INCREMENT,
  `descr` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`modelveic_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quoteflex`.`marcaveic_modeloveic`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quoteflex`.`marcaveic_modeloveic` (
  `mrcmdveic_id` INT NOT NULL AUTO_INCREMENT,
  `marcaveic_id` INT NOT NULL,
  `modeloveic_id` INT NOT NULL,
  PRIMARY KEY (`mrcmdveic_id`),
  INDEX `fk_marca_veic_has_modelo_veic_modelo_veic1_idx` (`modeloveic_id` ASC) VISIBLE,
  INDEX `fk_marca_veic_has_modelo_veic_marca_veic1_idx` (`marcaveic_id` ASC) VISIBLE,
  CONSTRAINT `fk_mrcmodveic_marcaveic`
    FOREIGN KEY (`marcaveic_id`)
    REFERENCES `quoteflex`.`marca_veic` (`marcaveic_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_mrcmodveic_modelveic`
    FOREIGN KEY (`modeloveic_id`)
    REFERENCES `quoteflex`.`modelo_veic` (`modelveic_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quoteflex`.`veiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quoteflex`.`veiculo` (
  `veiculo_id` INT NOT NULL AUTO_INCREMENT,
  `placa` VARCHAR(7) NULL,
  `ano_fab` YEAR NOT NULL,
  `km` FLOAT NOT NULL,
  `chassi` VARCHAR(17) NULL,
  `tp_combust` INT(1) NOT NULL,
  `cliente_id` INT NOT NULL,
  `rmrcmdveic_id` INT NOT NULL,
  PRIMARY KEY (`veiculo_id`),
  UNIQUE INDEX `placa_UNIQUE` (`placa` ASC) VISIBLE,
  INDEX `fk_veiculo_cliente1_idx` (`cliente_id` ASC) VISIBLE,
  UNIQUE INDEX `chassi_UNIQUE` (`chassi` ASC) VISIBLE,
  INDEX `fk_veiculo_r_marcaveic_modeloveic1_idx` (`rmrcmdveic_id` ASC) VISIBLE,
  CONSTRAINT `fk_veiculo_cliente`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `quoteflex`.`cliente` (`cliente_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_veiculo_r_marcaveic_modeloveic1`
    FOREIGN KEY (`rmrcmdveic_id`)
    REFERENCES `quoteflex`.`marcaveic_modeloveic` (`mrcmdveic_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quoteflex`.`cidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quoteflex`.`cidade` (
  `cidade_id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `estado` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`cidade_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quoteflex`.`endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quoteflex`.`endereco` (
  `endereco_id` INT NOT NULL AUTO_INCREMENT,
  `descr` VARCHAR(300) NOT NULL,
  `bairro` VARCHAR(300) NOT NULL,
  `nro` INT NOT NULL,
  `cep` INT(8) NOT NULL,
  `cidade_id` INT NOT NULL,
  `pessoa_id` INT NOT NULL,
  PRIMARY KEY (`endereco_id`),
  INDEX `fk_endereco_cidade1_idx` (`cidade_id` ASC) VISIBLE,
  INDEX `fk_endereco_pessoa1_idx` (`pessoa_id` ASC) VISIBLE,
  CONSTRAINT `fk_endereco_cidade`
    FOREIGN KEY (`cidade_id`)
    REFERENCES `quoteflex`.`cidade` (`cidade_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_endereco_pessoa`
    FOREIGN KEY (`pessoa_id`)
    REFERENCES `quoteflex`.`pessoa` (`pessoa_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quoteflex`.`tipo_pag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quoteflex`.`tipo_pag` (
  `tppag_id` INT NOT NULL AUTO_INCREMENT,
  `descr` VARCHAR(100) NOT NULL,
  `cd` INT(10) NOT NULL,
  PRIMARY KEY (`tppag_id`),
  UNIQUE INDEX `cd_UNIQUE` (`cd` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quoteflex`.`tipo_apolice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quoteflex`.`tipo_apolice` (
  `tpapolice_id` INT NOT NULL AUTO_INCREMENT,
  `descr` VARCHAR(100) NOT NULL,
  `cd` INT(2) NOT NULL,
  PRIMARY KEY (`tpapolice_id`),
  UNIQUE INDEX `cd_UNIQUE` (`cd` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quoteflex`.`ramo_apolice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quoteflex`.`ramo_apolice` (
  `ramoapolic_id` INT NOT NULL AUTO_INCREMENT,
  `descr` VARCHAR(100) NOT NULL,
  `cd` INT(2) NOT NULL,
  PRIMARY KEY (`ramoapolic_id`),
  UNIQUE INDEX `cd_UNIQUE` (`cd` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quoteflex`.`item_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quoteflex`.`item_cliente` (
  `itemclie_id` INT NOT NULL AUTO_INCREMENT,
  `cliente_id` INT NOT NULL,
  `veiculo_id` INT NOT NULL,
  `endereco_id` INT NOT NULL,
  PRIMARY KEY (`itemclie_id`),
  INDEX `fk_item_cliente_cliente1_idx` (`cliente_id` ASC) VISIBLE,
  INDEX `fk_item_cliente_veiculo1_idx` (`veiculo_id` ASC) VISIBLE,
  INDEX `fk_item_cliente_endereco1_idx` (`endereco_id` ASC) VISIBLE,
  CONSTRAINT `fk_itemclie_cliente`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `quoteflex`.`cliente` (`cliente_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_itemclie_veiculo`
    FOREIGN KEY (`veiculo_id`)
    REFERENCES `quoteflex`.`veiculo` (`veiculo_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_itemclie_endereco`
    FOREIGN KEY (`endereco_id`)
    REFERENCES `quoteflex`.`endereco` (`endereco_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quoteflex`.`tipo_orcamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quoteflex`.`tipo_orcamento` (
  `tporcamento_id` INT NOT NULL AUTO_INCREMENT,
  `descr` VARCHAR(45) NOT NULL,
  `cd` INT NOT NULL,
  PRIMARY KEY (`tporcamento_id`),
  UNIQUE INDEX `cd_UNIQUE` (`cd` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quoteflex`.`ramo_orcamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quoteflex`.`ramo_orcamento` (
  `ramorcament_id` INT NOT NULL AUTO_INCREMENT,
  `descr` VARCHAR(100) NOT NULL,
  `cd` INT NOT NULL,
  PRIMARY KEY (`ramorcament_id`),
  UNIQUE INDEX `cd_UNIQUE` (`cd` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quoteflex`.`orcamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quoteflex`.`orcamento` (
  `orcamento_id` INT NOT NULL AUTO_INCREMENT,
  `dt_incl` TIMESTAMP NOT NULL,
  `nro` INT NOT NULL,
  `itemclie_id` INT NOT NULL,
  `tporcamento_id` INT NOT NULL,
  `ramorcament_id` INT NOT NULL,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`orcamento_id`),
  INDEX `fk_orcamento_item_cliente1_idx` (`itemclie_id` ASC) VISIBLE,
  INDEX `fk_orcamento_tipo_orcamento1_idx` (`tporcamento_id` ASC) VISIBLE,
  INDEX `fk_orcamento_ramo_orcamento1_idx` (`ramorcament_id` ASC) VISIBLE,
  INDEX `fk_orcamento_usuario1_idx` (`usuario_id` ASC) VISIBLE,
  UNIQUE INDEX `nro_UNIQUE` (`nro` ASC) VISIBLE,
  CONSTRAINT `fk_orcamento_itemclie`
    FOREIGN KEY (`itemclie_id`)
    REFERENCES `quoteflex`.`item_cliente` (`itemclie_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orcamento_tipo_orcamento1`
    FOREIGN KEY (`tporcamento_id`)
    REFERENCES `quoteflex`.`tipo_orcamento` (`tporcamento_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orcamento_ramo_orcamento1`
    FOREIGN KEY (`ramorcament_id`)
    REFERENCES `quoteflex`.`ramo_orcamento` (`ramorcament_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orcamento_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `quoteflex`.`usuario` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quoteflex`.`proposta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quoteflex`.`proposta` (
  `proposta_id` INT NOT NULL AUTO_INCREMENT,
  `dt_incl` TIMESTAMP NOT NULL,
  `nro` INT NOT NULL,
  `qtde_parc` INT NULL,
  `orcamento_id` INT NOT NULL,
  PRIMARY KEY (`proposta_id`),
  INDEX `fk_proposta_orcamento1_idx` (`orcamento_id` ASC) VISIBLE,
  CONSTRAINT `fk_proposta_orcamento`
    FOREIGN KEY (`orcamento_id`)
    REFERENCES `quoteflex`.`orcamento` (`orcamento_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quoteflex`.`apolice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quoteflex`.`apolice` (
  `apolice_id` INT NOT NULL AUTO_INCREMENT,
  `dt_incl` TIMESTAMP NOT NULL,
  `nro` INT(16) NOT NULL,
  `premio_total` FLOAT NOT NULL,
  `qtde_parc` INT(10) NULL,
  `dt_inic` TIMESTAMP NOT NULL,
  `dt_fim` TIMESTAMP NOT NULL,
  `cliente_id` INT NOT NULL,
  `tppag_id` INT NOT NULL,
  `tpapolice_id` INT NOT NULL,
  `seguradora_id` INT NOT NULL,
  `ramoapolic_id` INT NOT NULL,
  `usuario_id` INT NOT NULL,
  `proposta_id` INT NULL,
  PRIMARY KEY (`apolice_id`),
  UNIQUE INDEX `nro_UNIQUE` (`nro` ASC) VISIBLE,
  INDEX `fk_apolice_cliente1_idx` (`cliente_id` ASC) VISIBLE,
  INDEX `fk_apolice_tipo_pag1_idx` (`tppag_id` ASC) VISIBLE,
  INDEX `fk_apolice_tipo_apolice1_idx` (`tpapolice_id` ASC) VISIBLE,
  INDEX `fk_apolice_seguradora1_idx` (`seguradora_id` ASC) VISIBLE,
  INDEX `fk_apolice_ramo_apolice1_idx` (`ramoapolic_id` ASC) VISIBLE,
  INDEX `fk_apolice_usuario1_idx` (`usuario_id` ASC) VISIBLE,
  INDEX `fk_apolice_proposta1_idx` (`proposta_id` ASC) VISIBLE,
  CONSTRAINT `fk_apolice_cliente`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `quoteflex`.`cliente` (`cliente_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_apolice_tppag`
    FOREIGN KEY (`tppag_id`)
    REFERENCES `quoteflex`.`tipo_pag` (`tppag_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_apolice_tpapolice`
    FOREIGN KEY (`tpapolice_id`)
    REFERENCES `quoteflex`.`tipo_apolice` (`tpapolice_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_apolice_seguradora`
    FOREIGN KEY (`seguradora_id`)
    REFERENCES `quoteflex`.`seguradora` (`seguradora_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_apolice_ramoapolic`
    FOREIGN KEY (`ramoapolic_id`)
    REFERENCES `quoteflex`.`ramo_apolice` (`ramoapolic_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_apolice_usuario`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `quoteflex`.`usuario` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_apolice_proposta1`
    FOREIGN KEY (`proposta_id`)
    REFERENCES `quoteflex`.`proposta` (`proposta_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quoteflex`.`apolice_comiss_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quoteflex`.`apolice_comiss_usuario` (
  `apolcomusu_id` INT NOT NULL,
  `usuario_id` INT NOT NULL,
  `apolice_id` INT NOT NULL,
  `comissao` FLOAT NOT NULL,
  INDEX `fk_usuario_has_apolice_apolice1_idx` (`apolice_id` ASC) VISIBLE,
  INDEX `fk_usuario_has_apolice_usuario1_idx` (`usuario_id` ASC) VISIBLE,
  PRIMARY KEY (`apolcomusu_id`),
  CONSTRAINT `fk_apolcomusu_usuario`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `quoteflex`.`usuario` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_apolcomusu_apolice`
    FOREIGN KEY (`apolice_id`)
    REFERENCES `quoteflex`.`apolice` (`apolice_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quoteflex`.`grupo_economico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quoteflex`.`grupo_economico` (
  `greconomico_id` INT NOT NULL,
  `descr` VARCHAR(100) NOT NULL,
  `cd` INT NOT NULL,
  `empresa_id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`greconomico_id`),
  UNIQUE INDEX `cd_UNIQUE` (`cd` ASC) VISIBLE,
  INDEX `fk_grupo_economico_empresa1_idx` (`empresa_id` ASC) VISIBLE,
  CONSTRAINT `fk_greconomico_empresa`
    FOREIGN KEY (`empresa_id`)
    REFERENCES `quoteflex`.`empresa` (`empresa_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quoteflex`.`tipo_endosso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quoteflex`.`tipo_endosso` (
  `tpendoss_id` INT NOT NULL AUTO_INCREMENT,
  `descr` VARCHAR(100) NOT NULL,
  `cd` INT NOT NULL,
  PRIMARY KEY (`tpendoss_id`),
  UNIQUE INDEX `cd_UNIQUE` (`cd` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quoteflex`.`endosso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quoteflex`.`endosso` (
  `endosso_id` INT NOT NULL AUTO_INCREMENT,
  `nro` INT NOT NULL,
  `dt_inic` TIMESTAMP NOT NULL,
  `valor` FLOAT NOT NULL,
  `descr` VARCHAR(500) NULL,
  `tipo_alt` INT NOT NULL,
  `apolice_id` INT NOT NULL,
  `tpendoss_id` INT NOT NULL,
  PRIMARY KEY (`endosso_id`),
  UNIQUE INDEX `nro_UNIQUE` (`nro` ASC) VISIBLE,
  INDEX `fk_endosso_apolice1_idx` (`apolice_id` ASC) VISIBLE,
  INDEX `fk_endosso_tipo_endosso1_idx` (`tpendoss_id` ASC) VISIBLE,
  CONSTRAINT `fk_endosso_apolice`
    FOREIGN KEY (`apolice_id`)
    REFERENCES `quoteflex`.`apolice` (`apolice_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_endosso_tipo_endosso1`
    FOREIGN KEY (`tpendoss_id`)
    REFERENCES `quoteflex`.`tipo_endosso` (`tpendoss_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
