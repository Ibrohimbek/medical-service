-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.6.7-rc - MySQL Community Server (GPL)
-- ОС Сервера:                   Win64
-- HeidiSQL Версия:              8.1.0.4545
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Дамп структуры базы данных medical_service
CREATE DATABASE IF NOT EXISTS `medical_service` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `medical_service`;


-- Дамп структуры для таблица medical_service.company
CREATE TABLE IF NOT EXISTS `company` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID организации',
  `name` varchar(255) NOT NULL COMMENT 'Названия организации',
  `description` varchar(255) DEFAULT NULL COMMENT 'Описание',
  `address` varchar(255) NOT NULL COMMENT 'Адрес организации',
  `logoFile` varchar(255) DEFAULT NULL COMMENT 'Адрес файла логотипа организации',
  `SEOID` int(10) unsigned DEFAULT NULL COMMENT 'Руководитель',
  `accountantID` int(10) unsigned DEFAULT NULL COMMENT 'Главный бухгалтер',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_seo_user_ID` (`SEOID`),
  KEY `fk_accountant_user_ID` (`accountantID`),
  CONSTRAINT `fk_accountant_user_ID` FOREIGN KEY (`accountantID`) REFERENCES `user` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_seo_user_ID` FOREIGN KEY (`SEOID`) REFERENCES `user` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Общие данные организации';

-- Дамп данных таблицы medical_service.company: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
/*!40000 ALTER TABLE `company` ENABLE KEYS */;


-- Дамп структуры для таблица medical_service.convenience
CREATE TABLE IF NOT EXISTS `convenience` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID материального удобства',
  `name` varchar(255) NOT NULL COMMENT 'названия материального удобства',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Список материальных удобств';

-- Дамп данных таблицы medical_service.convenience: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `convenience` DISABLE KEYS */;
/*!40000 ALTER TABLE `convenience` ENABLE KEYS */;


-- Дамп структуры для таблица medical_service.department
CREATE TABLE IF NOT EXISTS `department` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID отдела',
  `name` varchar(45) NOT NULL COMMENT 'Названия отдела',
  `description` varchar(255) DEFAULT NULL COMMENT 'Описание',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Отделы организаций';

-- Дамп данных таблицы medical_service.department: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
/*!40000 ALTER TABLE `department` ENABLE KEYS */;


-- Дамп структуры для таблица medical_service.diagnostics
CREATE TABLE IF NOT EXISTS `diagnostics` (
  `UID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ID` int(10) unsigned NOT NULL COMMENT 'ID диагностики',
  `name` varchar(255) NOT NULL COMMENT 'названия диагностики',
  `description` varchar(255) DEFAULT NULL COMMENT 'опсиание',
  `price` varchar(45) NOT NULL COMMENT 'прайс',
  `measureID` int(10) unsigned NOT NULL COMMENT 'ID таблицы единицы измерений',
  `measureAmount` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'число или количество измерений',
  `efctDate` date NOT NULL COMMENT 'дата начало эффективностей записи',
  `expDate` date NOT NULL DEFAULT '9999-12-31' COMMENT 'дата окончание эффективностей записи',
  `version` int(10) unsigned NOT NULL DEFAULT '0',
  `state` enum('archived','active','deleted') NOT NULL DEFAULT 'active' COMMENT 'статус записа',
  PRIMARY KEY (`UID`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_diagnosticsMeasure_ID` (`measureID`),
  CONSTRAINT `fk_diagnosticsMeasure_ID` FOREIGN KEY (`measureID`) REFERENCES `diagnosticsmeasure` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='список диагностиков с ценами';

-- Дамп данных таблицы medical_service.diagnostics: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `diagnostics` DISABLE KEYS */;
/*!40000 ALTER TABLE `diagnostics` ENABLE KEYS */;


-- Дамп структуры для таблица medical_service.diagnosticsmeasure
CREATE TABLE IF NOT EXISTS `diagnosticsmeasure` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID измерений',
  `name` varchar(45) NOT NULL COMMENT 'названия измерений',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='список единицы измерений диагностики';

-- Дамп данных таблицы medical_service.diagnosticsmeasure: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `diagnosticsmeasure` DISABLE KEYS */;
/*!40000 ALTER TABLE `diagnosticsmeasure` ENABLE KEYS */;


-- Дамп структуры для таблица medical_service.medicament
CREATE TABLE IF NOT EXISTS `medicament` (
  `UID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ID` int(10) unsigned NOT NULL COMMENT 'ID лекарств и медицинских инструментов',
  `name` varchar(45) NOT NULL COMMENT 'названия лекарств или инструмента',
  `serialNumber` varchar(45) NOT NULL COMMENT 'серийный номер',
  `expirationDate` date NOT NULL COMMENT 'срок годности',
  `measureID` int(10) unsigned NOT NULL COMMENT 'ID единицы измерений',
  `packCount` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'число или количество измерений',
  `packItemMeasureID` int(10) unsigned NOT NULL COMMENT 'единица измерений внутренного контента упаковки или комплекта',
  `packItemCount` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'число или количество измерений',
  `efctDate` date NOT NULL COMMENT 'дата начало эффективностей записи',
  `expDate` date NOT NULL DEFAULT '9999-12-31' COMMENT 'дата окончание эффективностей записи',
  `version` int(10) unsigned NOT NULL DEFAULT '0',
  `state` enum('active','archived','deleted') NOT NULL DEFAULT 'active' COMMENT 'статус записа',
  PRIMARY KEY (`UID`),
  KEY `fk_mediacamentMeasure_ID` (`measureID`),
  KEY `fk_mediacamentPackItemMeasure_ID` (`packItemMeasureID`),
  CONSTRAINT `fk_mediacamentMeasure_ID` FOREIGN KEY (`measureID`) REFERENCES `medicamentmeasure` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mediacamentPackItemMeasure_ID` FOREIGN KEY (`packItemMeasureID`) REFERENCES `medicamentpackitemmeasure` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='медицинские инструменты или лекарствы';

-- Дамп данных таблицы medical_service.medicament: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `medicament` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicament` ENABLE KEYS */;


-- Дамп структуры для таблица medical_service.medicamentmeasure
CREATE TABLE IF NOT EXISTS `medicamentmeasure` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID измерений',
  `name` varchar(45) NOT NULL COMMENT 'названия измерений',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='список единицы измерений медицинских инструментов или лекарств';

-- Дамп данных таблицы medical_service.medicamentmeasure: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `medicamentmeasure` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicamentmeasure` ENABLE KEYS */;


-- Дамп структуры для таблица medical_service.medicamentpackitemmeasure
CREATE TABLE IF NOT EXISTS `medicamentpackitemmeasure` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID измерений',
  `name` varchar(45) NOT NULL COMMENT 'названия измерений',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='список единиц измерений внутри пакетного или комплектного медицинского интрумента или лекарство';

-- Дамп данных таблицы medical_service.medicamentpackitemmeasure: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `medicamentpackitemmeasure` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicamentpackitemmeasure` ENABLE KEYS */;


-- Дамп структуры для таблица medical_service.operation
CREATE TABLE IF NOT EXISTS `operation` (
  `UID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ID` int(10) unsigned NOT NULL COMMENT 'ID операции',
  `name` varchar(255) NOT NULL COMMENT 'названия операций',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'прайс',
  `measureID` int(10) unsigned NOT NULL COMMENT 'ID таблицы единицы измерений',
  `measureAmount` int(11) NOT NULL DEFAULT '1' COMMENT 'число или количество измерений',
  `efctDate` date NOT NULL COMMENT 'дата начало эффективностей записи',
  `expDate` date NOT NULL DEFAULT '9999-12-31' COMMENT 'дата окончание эффективностей записи',
  `version` int(10) unsigned NOT NULL DEFAULT '0',
  `state` enum('archived','active','deleted') NOT NULL DEFAULT 'active' COMMENT 'статус записи',
  PRIMARY KEY (`UID`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_operationMeasure_ID` (`measureID`),
  CONSTRAINT `fk_operationMeasure_ID` FOREIGN KEY (`measureID`) REFERENCES `operationmeasure` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Список операций с ценами';

-- Дамп данных таблицы medical_service.operation: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `operation` DISABLE KEYS */;
/*!40000 ALTER TABLE `operation` ENABLE KEYS */;


-- Дамп структуры для таблица medical_service.operationmeasure
CREATE TABLE IF NOT EXISTS `operationmeasure` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID измерений',
  `name` varchar(45) NOT NULL COMMENT 'названия измерений',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='список единицы измерений операций';

-- Дамп данных таблицы medical_service.operationmeasure: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `operationmeasure` DISABLE KEYS */;
/*!40000 ALTER TABLE `operationmeasure` ENABLE KEYS */;


-- Дамп структуры для таблица medical_service.patient
CREATE TABLE IF NOT EXISTS `patient` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификационный номер больного',
  `fullName` varchar(255) NOT NULL COMMENT 'ФИО',
  `birthDate` date NOT NULL COMMENT 'Дата рождения',
  `inDate` date NOT NULL COMMENT 'Дата прихода больного на клинику',
  `outDate` date DEFAULT NULL COMMENT 'Дата выхода больного из клиники',
  `order` varchar(255) DEFAULT NULL COMMENT 'Ордер',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы medical_service.patient: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;


-- Дамп структуры для таблица medical_service.patient_diagnostics
CREATE TABLE IF NOT EXISTS `patient_diagnostics` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `patientID` int(10) unsigned NOT NULL COMMENT 'ИН больного',
  `diagnosticsUID` int(10) unsigned NOT NULL COMMENT 'ИН диагностики',
  `date` date NOT NULL COMMENT 'дата проведение диагностики',
  `amount` decimal(10,2) unsigned NOT NULL COMMENT 'объем',
  PRIMARY KEY (`ID`),
  KEY `fk_patient_ID_idx` (`patientID`),
  KEY `fk_diagnostics_ID_idx` (`diagnosticsUID`),
  CONSTRAINT `fk_patient_ID` FOREIGN KEY (`patientID`) REFERENCES `patient` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_diagnostics_UID` FOREIGN KEY (`diagnosticsUID`) REFERENCES `diagnostics` (`UID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы medical_service.patient_diagnostics: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `patient_diagnostics` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_diagnostics` ENABLE KEYS */;


-- Дамп структуры для таблица medical_service.patient_medicament
CREATE TABLE IF NOT EXISTS `patient_medicament` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `patientID` int(10) unsigned NOT NULL COMMENT 'ID проведенного диагностики',
  `medicamentUID` int(10) unsigned NOT NULL COMMENT 'использованные медикаменты',
  `date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL COMMENT 'объем',
  PRIMARY KEY (`ID`),
  KEY `fk_medicament_UID_idx` (`medicamentUID`),
  KEY `fk_patient_ID_idx` (`patientID`),
  CONSTRAINT `fk_patient_medicament_patient_ID` FOREIGN KEY (`patientID`) REFERENCES `patient` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_patient_medicament_medicament_UID` FOREIGN KEY (`medicamentUID`) REFERENCES `medicament` (`UID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы medical_service.patient_medicament: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `patient_medicament` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_medicament` ENABLE KEYS */;


-- Дамп структуры для таблица medical_service.patient_operartion
CREATE TABLE IF NOT EXISTS `patient_operartion` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `patientID` int(10) unsigned NOT NULL COMMENT 'ИН больного',
  `operationUID` int(10) unsigned NOT NULL COMMENT 'операция больного',
  `date` date NOT NULL COMMENT 'дата проведение операции',
  `amount` decimal(10,2) unsigned NOT NULL COMMENT 'объём работы',
  PRIMARY KEY (`ID`),
  KEY `fk_patient_ID_idx` (`patientID`),
  KEY `fk_operation_UID_idx` (`operationUID`),
  CONSTRAINT `fk_patient_operation_patient_ID` FOREIGN KEY (`patientID`) REFERENCES `patient` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_patient_operation_operation_UID` FOREIGN KEY (`operationUID`) REFERENCES `operation` (`UID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы medical_service.patient_operartion: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `patient_operartion` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_operartion` ENABLE KEYS */;


-- Дамп структуры для таблица medical_service.patient_ward
CREATE TABLE IF NOT EXISTS `patient_ward` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `patientID` int(10) unsigned NOT NULL COMMENT 'ИН больного',
  `wardUID` int(10) unsigned NOT NULL COMMENT 'палата больного',
  `date` date NOT NULL COMMENT 'дата переведение больного к палату',
  `amount` decimal(10,2) unsigned NOT NULL COMMENT 'на сколько дней перевели к палату',
  PRIMARY KEY (`ID`),
  KEY `fk_patient_ID_idx` (`patientID`),
  KEY `fk_ward_UID_idx` (`wardUID`),
  CONSTRAINT `fk_patient_ward_patient_ID` FOREIGN KEY (`patientID`) REFERENCES `patient` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_patient_ward_ward_UID` FOREIGN KEY (`wardUID`) REFERENCES `ward` (`UID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы medical_service.patient_ward: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `patient_ward` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_ward` ENABLE KEYS */;


-- Дамп структуры для таблица medical_service.user
CREATE TABLE IF NOT EXISTS `user` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID пользователя',
  `lastName` varchar(45) NOT NULL COMMENT 'Фамилия',
  `firstName` varchar(45) NOT NULL COMMENT 'Имя',
  `patronymic` varchar(45) DEFAULT NULL COMMENT 'Отчество',
  `birthDate` date NOT NULL COMMENT 'Дата рождения',
  `workPhoneNumber` varchar(45) DEFAULT NULL,
  `homePhoneNumber` varchar(45) DEFAULT NULL,
  `mobilePhoneNumber` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL COMMENT 'Логин пользователя',
  `password` varchar(200) DEFAULT NULL,
  `salt` varchar(45) DEFAULT NULL,
  `photoFileName` varchar(255) DEFAULT NULL COMMENT 'Названия файла фото пользователя',
  `accessForLogin` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Доступ на авторизации',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Пользователи';

-- Дамп данных таблицы medical_service.user: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


-- Дамп структуры для таблица medical_service.ward
CREATE TABLE IF NOT EXISTS `ward` (
  `UID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ID` int(10) unsigned NOT NULL COMMENT 'ID палаты',
  `number` varchar(45) NOT NULL COMMENT 'номер палаты',
  `placeCount` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'число койки',
  `roomCount` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'число комнат',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'прайс',
  `efctDate` date NOT NULL COMMENT 'дата начало эффективностей записи',
  `expDate` date NOT NULL DEFAULT '9999-12-31' COMMENT 'дата окончание эффективностей записи',
  `version` int(11) NOT NULL DEFAULT '0',
  `state` enum('archived','active','deleted') NOT NULL DEFAULT 'active' COMMENT 'статус записи',
  PRIMARY KEY (`UID`),
  UNIQUE KEY `number_UNIQUE` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Список палат с ценами';

-- Дамп данных таблицы medical_service.ward: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `ward` DISABLE KEYS */;
/*!40000 ALTER TABLE `ward` ENABLE KEYS */;


-- Дамп структуры для таблица medical_service.ward_convenience
CREATE TABLE IF NOT EXISTS `ward_convenience` (
  `wardUID` int(10) unsigned NOT NULL COMMENT 'UID палаты',
  `convenienceID` int(10) unsigned NOT NULL COMMENT 'ID материального удобства',
  KEY `fk_ward_UID` (`wardUID`),
  KEY `fk_convenience_ID` (`convenienceID`),
  CONSTRAINT `fk_convenience_ID` FOREIGN KEY (`convenienceID`) REFERENCES `convenience` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ward_UID` FOREIGN KEY (`wardUID`) REFERENCES `ward` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='таблица соединяющий двух таблиц ward и convenience';

-- Дамп данных таблицы medical_service.ward_convenience: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `ward_convenience` DISABLE KEYS */;
/*!40000 ALTER TABLE `ward_convenience` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
