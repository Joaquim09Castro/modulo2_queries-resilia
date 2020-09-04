CREATE DATABASE `buffer_f1`;
USE `buffer_f1`;

CREATE TABLE `races` (
  `raceId` INT PRIMARY KEY NOT NULL,
  `year` YEAR NOT NULL,
  `round` INT NOT NULL,
  `circuitId` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `date` DATE NOT NULL,
  `time` CHAR(8) NOT NULL
);

CREATE TABLE `drivers` (
  `driverId` INT PRIMARY KEY NOT NULL,
  `driverRef` VARCHAR(20) NOT NULL,
  `number` INT NOT NULL DEFAULT 0,
  `code` CHAR(3),
  `dob` CHAR(10),
  `nationality` VARCHAR(50)
);

CREATE TABLE `pit_stops` (
  `raceId` INT NOT NULL,
  `driverId` INT NOT NULL,
  `stop` INT NOT NULL,
  `lap` INT NOT NULL,
  `time` TIME NOT NULL,
  `seconds` FLOAT NOT NULL
);

CREATE TABLE `constructors` (
  `constructorId` INT PRIMARY KEY NOT NULL,
  `constructorRef` VARCHAR(50),
  `name` VARCHAR(50),
  `nationality` VARCHAR(50)
);

CREATE TABLE `results` (
  `resultId` INT PRIMARY KEY NOT NULL,
  `raceId` INT NOT NULL,
  `driverId` INT NOT NULL,
  `constructorId` INT NOT NULL,
  `number` INT DEFAULT 0 NOT NULL,
  `grid` INT,
  `position` INT,
  `positionOrder` INT,
  `points` INT,
  `laps` INT,
  `time` VARCHAR(10),
  `fastestLap` INT,
  `rank` INT,
  `fastestLapTime` CHAR(7),
  `fastestLapSpeed` FLOAT,
  `statusId` INT NOT NULL
);

CREATE TABLE `status` (
  `statusId` INT PRIMARY KEY NOT NULL,
  `status` VARCHAR(30) NOT NULL
);

CREATE TABLE `circuits` (
  `circuitId` INT PRIMARY KEY NOT NULL,
  `circuitRef` VARCHAR(30) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `location` VARCHAR(50) NOT NULL,
  `country` VARCHAR(30) NOT NULL,
  `lat` FLOAT,
  `long` FLOAT
);

CREATE TABLE `constructorResults` (
  `constructorResultsId` INT PRIMARY KEY NOT NULL,
  `raceId` INT NOT NULL,
  `constructorId` INT NOT NULL,
  `points` INT NOT NULL,
  `status` VARCHAR(10)
);

CREATE TABLE `constructorStandings` (
  `constructorStandingsId` INT PRIMARY KEY NOT NULL,
  `raceId` INT NOT NULL,
  `constructorId` INT NOT NULL,
  `points` INT NOT NULL,
  `position` INT NOT NULL,
  `wins` INT NOT NULL
);

CREATE TABLE `driverStandings` (
  `driverStandingsId` INT PRIMARY KEY NOT NULL,
  `raceId` INT NOT NULL,
  `driverId` INT NOT NULL,
  `points` INT NOT NULL,
  `position` INT NOT NULL,
  `wins` INT NOT NULL
);

CREATE TABLE `lapTimes` (
  `raceId` INT NOT NULL,
  `driverId` INT NOT NULL,
  `lap` INT NOT NULL,
  `position` INT NOT NULL,
  `time` VARCHAR(30) NOT NULL
);

			-- RELACIONAMENTOS FK REFERENCES PK --

-- RESULTS
ALTER TABLE `results` ADD FOREIGN KEY (`raceId`) REFERENCES `races` (`raceId`);
ALTER TABLE `results` ADD FOREIGN KEY (`driverId`) REFERENCES `drivers` (`driverId`);
ALTER TABLE `results` ADD FOREIGN KEY (`constructorId`) REFERENCES `constructors` (`constructorId`);
ALTER TABLE `results` ADD FOREIGN KEY (`statusId`) REFERENCES `status` (`statusId`);

-- RACES
ALTER TABLE `races` ADD FOREIGN KEY (`circuitId`) REFERENCES `circuits` (`circuitId`);

-- PIT_STOPS
ALTER TABLE `pit_stops` ADD FOREIGN KEY (`raceId`) REFERENCES `races` (`raceId`);
ALTER TABLE `pit_stops` ADD FOREIGN KEY (`driverId`) REFERENCES `drivers` (`driverId`);

-- CONST-RES
ALTER TABLE `constructorResults` ADD FOREIGN KEY (`constructorId`) REFERENCES `constructors` (`constructorId`);

-- CONST-STDS
ALTER TABLE `constructorStandings` ADD FOREIGN KEY (`constructorId`) REFERENCES `constructors` (`constructorId`);
ALTER TABLE `constructorStandings` ADD FOREIGN KEY (`raceId`) REFERENCES `races` (`raceId`);

-- DRVRS-STDS
ALTER TABLE `driverStandings` ADD FOREIGN KEY (`raceId`) REFERENCES `races` (`raceId`);
ALTER TABLE `driverStandings` ADD FOREIGN KEY (`driverId`) REFERENCES `drivers` (`driverId`);

-- LAPTIMES
ALTER TABLE `lapTimes` ADD FOREIGN KEY (`raceId`) REFERENCES `races` (`raceId`);
ALTER TABLE `lapTimes` ADD FOREIGN KEY (`driverId`) REFERENCES `drivers` (`driverId`);