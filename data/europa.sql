CREATE DATABASE `europa.noebuerki-services.ch`;
USE `europa.noebuerki-services.ch`;
CREATE TABLE `user`
(
    `id`       INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `username` VARCHAR(50)  NOT NULL UNIQUE,
    `email`    VARCHAR(50)  NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `admin`    BOOLEAN DEFAULT false
);
CREATE TABLE `customer`
(
    `id`             INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `userId`         INT         NOT NULL,
    `customerNumber` INT         NOT NULL,
    `storageSpace`   INT         NOT NULL,
    `title`          VARCHAR(10) NOT NULL,
    `firstName`      VARCHAR(50) NOT NULL,
    `lastName`       VARCHAR(50) NOT NULL,
    `middleName`     VARCHAR(70),
    `street`         VARCHAR(50) NOT NULL,
    `houseNumber`    VARCHAR(5)  NOT NULL,
    `postCode`       VARCHAR(10) NOT NULL,
    `city`           VARCHAR(50) NOT NULL,
    FOREIGN KEY (userId) REFERENCES user (id) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE `item`
(
    `id`            INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `userId`        INT          NOT NULL,
    `customerId`    INT          NOT NULL,
    `storageNumber` VARCHAR(50),
    `inStorage`     BOOLEAN      NOT NULL,
    `name`          VARCHAR(100) NOT NULL,
    `value`         VARCHAR(10)  NOT NULL,
    `price`         VARCHAR(10)  NOT NULL,
    `dropOfDate`    VARCHAR(10),
    `pickupDate`    VARCHAR(10),
    FOREIGN KEY (userId) REFERENCES user (id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (customerId) REFERENCES customer (id) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE valuation
(
    `id`         INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `userId` INT NOT NULL,
    `value`      INT NOT NULL,
    `price`      INT NOT NULL,
    FOREIGN KEY (userId) REFERENCES user (id) ON UPDATE CASCADE ON DELETE CASCADE,
    UNIQUE KEY `unqiueValue` (userId, `value`)
);