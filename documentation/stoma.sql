SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `licenta` ;
CREATE SCHEMA IF NOT EXISTS `licenta` DEFAULT CHARACTER SET utf8 ;
USE `licenta` ;

-- -----------------------------------------------------
-- Table `licenta`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `licenta`.`users` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` CHAR(128) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `created_date` DATETIME NULL DEFAULT NULL,
  `updated_date` DATETIME NULL DEFAULT NULL,
  `first_name` VARCHAR(20) NULL DEFAULT NULL,
  `last_name` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `licenta`.`questions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `licenta`.`questions` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `content` VARCHAR(200) NOT NULL,
  `created_date` DATETIME NULL DEFAULT NULL,
  `updated_date` DATETIME NULL DEFAULT NULL,
  `user_id` INT(10) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_idx` (`user_id` ASC),
  CONSTRAINT `fk_q_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `licenta`.`users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `licenta`.`answers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `licenta`.`answers` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `content` VARCHAR(200) NULL DEFAULT NULL,
  `created_date` DATETIME NULL DEFAULT NULL,
  `updated_date` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) NOT NULL,
  `id_question` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_a_user_idx` (`id_user` ASC),
  INDEX `fk_a_question` (`id_question` ASC),
  CONSTRAINT `fk_a_question`
    FOREIGN KEY (`id_question`)
    REFERENCES `licenta`.`questions` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_a_user`
    FOREIGN KEY (`id_user`)
    REFERENCES `licenta`.`users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `licenta`.`articles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `licenta`.`articles` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(200) NOT NULL,
  `content` LONGTEXT NOT NULL,
  `created_date` DATETIME NULL DEFAULT NULL,
  `updated_date` DATETIME NULL DEFAULT NULL,
  `viewed` BIGINT(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `licenta`.`news`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `licenta`.`news` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(200) NOT NULL,
  `content` LONGTEXT NOT NULL,
  `created_date` DATETIME NULL DEFAULT NULL,
  `updated_date` DATETIME NULL DEFAULT NULL,
  `viewed` BIGINT(20) NULL DEFAULT NULL,
  `locale` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `licenta`.`comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `licenta`.`comments` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `content` VARCHAR(200) NOT NULL,
  `created_date` DATETIME NULL DEFAULT NULL,
  `updated_date` DATETIME NULL DEFAULT NULL,
  `id_user` INT(20) NOT NULL,
  `id_article` BIGINT(20) NULL DEFAULT NULL,
  `id_news` BIGINT(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_c_user_idx` (`id_user` ASC),
  INDEX `fk_c_news_idx` (`id_news` ASC),
  INDEX `fk_c_article_idx` (`id_article` ASC),
  CONSTRAINT `fk_c_article`
    FOREIGN KEY (`id_article`)
    REFERENCES `licenta`.`articles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_c_news`
    FOREIGN KEY (`id_news`)
    REFERENCES `licenta`.`news` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_c_user`
    FOREIGN KEY (`id_user`)
    REFERENCES `licenta`.`users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `licenta`.`domains`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `licenta`.`domains` (
  `id` INT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `details` LONGTEXT NULL DEFAULT NULL,
  `created_date` DATETIME NULL DEFAULT NULL,
  `updated_date` DATETIME NULL DEFAULT NULL,
  `locale` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `licenta`.`domains_articles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `licenta`.`domains_articles` (
  `domain_id` INT(20) NOT NULL,
  `article_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`domain_id`, `article_id`),
  INDEX `fk_da_article_idx` (`article_id` ASC),
  CONSTRAINT `fk_da_article`
    FOREIGN KEY (`article_id`)
    REFERENCES `licenta`.`articles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_da_domain`
    FOREIGN KEY (`domain_id`)
    REFERENCES `licenta`.`domains` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `licenta`.`events`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `licenta`.`events` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  `details` LONGTEXT NULL DEFAULT NULL,
  `created_date` DATETIME NULL DEFAULT NULL,
  `updated_date` DATETIME NULL DEFAULT NULL,
  `viewed` BIGINT(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `licenta`.`events_domains`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `licenta`.`events_domains` (
  `event_id` BIGINT(20) NOT NULL,
  `domain_id` INT(20) NOT NULL,
  PRIMARY KEY (`event_id`, `domain_id`),
  INDEX `fk_ed_domain_idx` (`domain_id` ASC),
  CONSTRAINT `fk_ed_domain`
    FOREIGN KEY (`domain_id`)
    REFERENCES `licenta`.`domains` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ed_event`
    FOREIGN KEY (`event_id`)
    REFERENCES `licenta`.`events` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `licenta`.`pictures`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `licenta`.`pictures` (
  `id` INT(20) NOT NULL AUTO_INCREMENT,
  `path` VARCHAR(45) NOT NULL,
  `id_event` BIGINT(20) NULL DEFAULT NULL,
  `id_article` BIGINT(20) NULL DEFAULT NULL,
  `id_news` BIGINT(20) NULL DEFAULT NULL,
  `primary` TINYINT(1) NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  INDEX `fk_p_event_idx` (`id_event` ASC),
  INDEX `fk_p_article_idx` (`id_article` ASC),
  INDEX `fk_p_news_idx` (`id_news` ASC),
  CONSTRAINT `fk_p_article`
    FOREIGN KEY (`id_article`)
    REFERENCES `licenta`.`articles` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_p_event`
    FOREIGN KEY (`id_event`)
    REFERENCES `licenta`.`events` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_p_news`
    FOREIGN KEY (`id_news`)
    REFERENCES `licenta`.`news` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `licenta`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `licenta`.`roles` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `authority` VARCHAR(45) NOT NULL,
  `created_date` DATETIME NULL DEFAULT NULL,
  `updated_date` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `licenta`.`users_roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `licenta`.`users_roles` (
  `user_id` INT(11) NOT NULL,
  `role_id` INT(11) NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`),
  INDEX `fx_role_idx` (`role_id` ASC),
  CONSTRAINT `fk_ur_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `licenta`.`users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fx_ur_role`
    FOREIGN KEY (`role_id`)
    REFERENCES `licenta`.`roles` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
