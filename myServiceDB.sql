DROP database MyDB_test;
CREATE database MyDB_test;
use MyDB_test;

CREATE TABLE `Service` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`id_car` varchar(50) NOT NULL,
	`id_work_type` smallint NOT NULL,
	`id_worker` smallint NOT NULL,
	`Date` DATETIME NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Clients` (
	`id` int NOT NULL AUTO_INCREMENT,
	`first_name` varchar(100) NOT NULL,
    `second_name` varchar(100) NOT NULL,
	`phone_number` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Cars` (
	`id_WIN` varchar(50) NOT NULL,
	`id_client` int NOT NULL,
	`brand` varchar(50) NOT NULL,
	`model` varchar(50) NOT NULL,
	`year_of_manufacture` date NOT NULL,
	`restyling` tinyint,
	PRIMARY KEY (`id_WIN`)
);

CREATE TABLE `Work type` (
	`id` smallint NOT NULL AUTO_INCREMENT,
	`price` int NOT NULL,
	`name` varchar(100) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Spare parts storage` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(100) NOT NULL,
    `price` INT NOT NULL,
	`Status` boolean NOT NULL,
	`id_service` int NOT NULL,
	PRIMARY KEY (`id`)
);


CREATE TABLE `Worker` (
	`id` smallint NOT NULL AUTO_INCREMENT,
	`box` smallint NOT NULL UNIQUE,
	`id_work_type` smallint NOT NULL,
	`first_name` varchar(100) NOT NULL,
    `second_name` varchar(100) NOT NULL,
	`phone_number` INT NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `Service` ADD CONSTRAINT `Service1` FOREIGN KEY (`id_car`) REFERENCES `Cars`(`id_WIN`);

ALTER TABLE `Service` ADD CONSTRAINT `Service2` FOREIGN KEY (`id_work_type`) REFERENCES `Work type`(`id`);

ALTER TABLE `Service` ADD CONSTRAINT `Service3` FOREIGN KEY (`id_worker`) REFERENCES `Worker`(`id`);

ALTER TABLE `Cars` ADD CONSTRAINT `Cars1` FOREIGN KEY (`id_client`) REFERENCES `Clients`(`id`);

ALTER TABLE `Spare parts storage` ADD CONSTRAINT `Spare1` FOREIGN KEY (`id_service`) REFERENCES `Service`(`id`);

ALTER TABLE `Worker` ADD CONSTRAINT `Worker1` FOREIGN KEY (`id_work_type`) REFERENCES `Work type`(`id`);

