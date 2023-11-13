/*
create_prip_kurz.sql
Zakladaci SQL skript DB prip_kurz.

changelog:
2023-09-25 - jmarianek - v1 z forward engineer;
                       - zmena DB z mydb na prip_kurz;
                       - odstraneni prefixovani `mydb`.
					   - pridano kurzy.kapacita,
                       - zm. kurzy.pocet na kurzy.pocet_lekci;
2023-10-02 - ocacek - zakomentovany prik. drop
					- pridano uchazeci.ulice
*/

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


-- -----------------------------------------------------
-- Schema prip_kurz (ekv. database)
-- -----------------------------------------------------
-- DROP DATABASE IF EXISTS prip_kurz; -- likvidace schematu prip_kurz

CREATE DATABASE IF NOT EXISTS prip_kurz
DEFAULT CHARACTER SET utf8
COLLATE utf8_czech_ci; -- ceske razeni vc. CH

USE prip_kurz;  -- abych porad nemusel psat prip_kurz.

-- -----------------------------------------------------
-- Table `uzivatele`
-- -----------------------------------------------------
-- drop table if exists uzivatele;

CREATE TABLE IF NOT EXISTS uzivatele (
-- nasleduje seznam sloupcu nazev typ oddelenych ,
  id INT NOT NULL primary key, -- not null zn. neprazdny,
							   -- primary key zn. prim. klic (PK)
  email VARCHAR(50) not null,
  heslo VARCHAR(50) not null,
  `role` ENUM('admin', "user") not null default 'user',
  telefon VARCHAR(20)
  );

-- ENGINE = InnoDB; -- InnoDB neni nutno uvadet (vychozi)

alter table uzivatele
modify email varchar(50) not null unique;

alter table uzivatele
drop primary key;

-- -----------------------------------------------------
-- Table `kurzy`
-- -----------------------------------------------------
-- DROP TABLE IF EXISTS kurzy; -- smazeme tab. kurzy


CREATE TABLE IF NOT EXISTS kurzy (
  id INT NOT NULL primary key,
  predmet ENUM("M", "CJ") not null,
  pocet_lekci INT NOT NULL,
  kapacita INT NOT NULL, -- max. pocet ucastniku
  cena INT NOT NULL
  );
-- ENGINE = InnoDB;

show index from kurzy;

alter table kurzy
drop primary key;

alter table kurzy
modify id int not null primary key auto_increment;

alter table kurzy
modify predmet enum('M', 'CJ', 'ECDL') not null;

alter table kurzy
modify predmet enum('M', 'CJ', 'ECDL') not null unique;

-- -----------------------------------------------------
-- Table `uchazeci`
-- -----------------------------------------------------
drop table uchazeci;

CREATE TABLE IF NOT EXISTS uchazeci (
  id INT NOT NULL primary key,
  jmeno VARCHAR(20) NULL,
  prijmeni VARCHAR(45) NOT NULL,
  uzivatele_id INT NOT NULL, -- cizi klic na uzivatele.id (rodic)
  kurzy_id INT NOT NULL -- cizi klic na kurzy.id (kurz)
  -- nize jsou def. cizich klicu, bude probrano pozdeji

) ENGINE = InnoDB;

show index from uchazeci;

-- znovuvytvoreni cizich klicu (ref. integrity)
alter table uchazeci
add constraint uchazeci_fk1 foreign key(uzivatele_id)
references uzivatele(id);

-- pridame ulice, psc, mesto
alter table uchazeci
add column ulice varchar(50);

alter table uchazeci
add column psc int(5);

alter table uchazeci
add column mesto varchar(20);

-- protazeni mesto z 20 na 50 zn.
alter table uchazeci
modify column mesto varchar(50);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
