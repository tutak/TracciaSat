-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generato il: 25 lug, 2011 at 02:52 
-- Versione MySQL: 5.5.8
-- Versione PHP: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tracciasat`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `dispositivo`
--

CREATE TABLE IF NOT EXISTS `dispositivo` (
  `IMEI` varchar(50) NOT NULL,
  PRIMARY KEY (`IMEI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `dispositivo`
--

INSERT INTO `dispositivo` (`IMEI`) VALUES
('0435345345'),
('355840024333346'),
('385840024333346'),
('386840024333346'),
('39684'),
('3968400'),
('396840024333346'),
('3968400243333488'),
('3968400243333489'),
('39684002433334899'),
('3968400243334869'),
('3968400243334899'),
('396840043324869'),
('396840043334869'),
('39684077243334869'),
('45345435'),
('500840024333346'),
('576775'),
('576776775'),
('576776775676'),
('57677775'),
('700840024333346'),
('800840024333346'),
('abv');

-- --------------------------------------------------------

--
-- Struttura della tabella `sessione`
--

CREATE TABLE IF NOT EXISTS `sessione` (
  `Dat` date NOT NULL,
  `Ora` time NOT NULL,
  `Longitudine` float(10,6) NOT NULL,
  `Latitudine` float(10,6) NOT NULL,
  `IMEI` varchar(50) NOT NULL,
  `Velocity` float NOT NULL,
  PRIMARY KEY (`Dat`,`Ora`,`IMEI`),
  KEY `IMEI` (`IMEI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `sessione`
--

INSERT INTO `sessione` (`Dat`, `Ora`, `Longitudine`, `Latitudine`, `IMEI`, `Velocity`) VALUES
('2010-08-23', '04:14:44', 15.385088, 41.114010, '700840024333346', 90),
('2011-04-14', '04:14:23', 14.385088, 41.116009, '355840024333346', 0),
('2011-04-14', '04:14:23', 17.385088, 45.116009, '39684', 50.05),
('2011-08-23', '04:14:44', 16.385088, 41.114010, '700840024333346', 90),
('2012-08-23', '04:14:44', 17.385088, 41.114010, '700840024333346', 90),
('2012-08-23', '15:14:44', 45.116009, 15.385088, '3968400243333488', 0),
('2012-08-23', '15:14:44', 45.116009, 15.385088, '3968400243334899', 0),
('2012-08-23', '15:14:44', 15.385088, 45.116009, '500840024333346', 0),
('2012-08-23', '16:14:44', 45.116009, 15.385088, '3968400243333488', 0),
('2013-08-23', '04:14:44', 18.385088, 41.114010, '700840024333346', 90),
('2014-08-23', '01:14:44', 14.385088, 41.114010, '800840024333346', 90),
('2014-08-23', '02:14:44', 15.385088, 41.114010, '800840024333346', 90),
('2014-08-23', '03:14:44', 16.385088, 41.114010, '800840024333346', 90),
('2014-08-23', '03:15:44', 17.385088, 41.114010, '800840024333346', 90),
('2014-08-23', '04:14:44', 14.385088, 41.114010, '700840024333346', 90),
('2018-08-23', '08:14:44', 18.385088, 81.114014, '800840024333346', 80),
('2051-04-14', '23:14:23', 12.385088, 43.116009, '3968400243333489', 0);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `sessione`
--
ALTER TABLE `sessione`
  ADD CONSTRAINT `sessione_ibfk_1` FOREIGN KEY (`IMEI`) REFERENCES `dispositivo` (`IMEI`) ON DELETE CASCADE ON UPDATE CASCADE;
