SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `yamanote` DEFAULT CHARACTER SET utf8 ;
USE `yamanote` ;

-- -----------------------------------------------------
-- Table `yamanote`.`stations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `yamanote`.`stations` ;

CREATE  TABLE IF NOT EXISTS `yamanote`.`stations` (
  `id` INT NOT NULL COMMENT '駅番号(1～)' ,
  `name` VARCHAR(45) NOT NULL COMMENT '駅名。' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
COMMENT = '駅マスタテーブル。';


-- -----------------------------------------------------
-- Table `yamanote`.`games`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `yamanote`.`games` ;

CREATE  TABLE IF NOT EXISTS `yamanote`.`games` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'ゲーム識別用のID。' ,
  `master` VARCHAR(45) NOT NULL COMMENT 'ゲームマスター（このゲームを作った人）のtwitterID。' ,
  `start_time` DATETIME NOT NULL COMMENT 'すごろくの開始時刻。' ,
  `end_time` DATETIME NULL COMMENT 'すごろくの終了時刻。' ,
  `goal_time` VARCHAR(45) NULL COMMENT 'すごろくの1位ゴール時刻。' ,
  `start_station_id` INT NOT NULL COMMENT '開始駅ID。' ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_games_stations1_idx` (`start_station_id` ASC) ,
  CONSTRAINT `fk_games_stations1`
    FOREIGN KEY (`start_station_id` )
    REFERENCES `yamanote`.`stations` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'すごろくゲームテーブル。すごくシンプル。';


-- -----------------------------------------------------
-- Table `yamanote`.`players`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `yamanote`.`players` ;

CREATE  TABLE IF NOT EXISTS `yamanote`.`players` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `game_id` INT NOT NULL ,
  `name` VARCHAR(45) NOT NULL COMMENT '参加者のTwitterID。' ,
  `current_station_id` INT NOT NULL COMMENT '現在の駅ID。' ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_players_games_idx` (`game_id` ASC) ,
  INDEX `fk_players_stations1_idx` (`current_station_id` ASC) ,
  CONSTRAINT `fk_players_games`
    FOREIGN KEY (`game_id` )
    REFERENCES `yamanote`.`games` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_players_stations1`
    FOREIGN KEY (`current_station_id` )
    REFERENCES `yamanote`.`stations` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `yamanote`.`missions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `yamanote`.`missions` ;

CREATE  TABLE IF NOT EXISTS `yamanote`.`missions` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `station_id` INT NOT NULL COMMENT '駅ID。' ,
  `summary` VARCHAR(100) NOT NULL COMMENT 'ミッションの内容。' ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_missions_stations1_idx` (`station_id` ASC) ,
  CONSTRAINT `fk_missions_stations1`
    FOREIGN KEY (`station_id` )
    REFERENCES `yamanote`.`stations` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'ミッションの内容をまとめたテーブル。';


-- -----------------------------------------------------
-- insert initialize data
-- -----------------------------------------------------

-- stations(http://www.mapion.co.jp/station/ROJ002007/
insert into stations(id, name) values(1, '大崎');
insert into stations(id, name) values(2, '五反田');
insert into stations(id, name) values(3, '目黒');
insert into stations(id, name) values(4, '恵比寿');
insert into stations(id, name) values(5, '渋谷');
insert into stations(id, name) values(6, '原宿');
insert into stations(id, name) values(7, '代々木');
insert into stations(id, name) values(8, '新宿');
insert into stations(id, name) values(9, '新大久保');
insert into stations(id, name) values(10, '高田馬場');
insert into stations(id, name) values(11, '目白');
insert into stations(id, name) values(12, '池袋');
insert into stations(id, name) values(13, '大塚');
insert into stations(id, name) values(14, '巣鴨');
insert into stations(id, name) values(15, '駒込');
insert into stations(id, name) values(16, '田端');
insert into stations(id, name) values(17, '西日暮里');
insert into stations(id, name) values(18, '日暮里');
insert into stations(id, name) values(19, '鶯谷');
insert into stations(id, name) values(20, '上野');
insert into stations(id, name) values(21, '御徒町');
insert into stations(id, name) values(22, '秋葉原');
insert into stations(id, name) values(23, '神田');
insert into stations(id, name) values(24, '東京');
insert into stations(id, name) values(25, '有楽町');
insert into stations(id, name) values(26, '新橋');
insert into stations(id, name) values(27, '浜松町');
insert into stations(id, name) values(28, '田町');
insert into stations(id, name) values(29, '品川');

-- 各駅でやることをどうぞ。
insert into missions(station_id, summary) values(1, 'ダミー');
insert into missions(station_id, summary) values(2, 'ダミー');
insert into missions(station_id, summary) values(3, 'ダミー');
insert into missions(station_id, summary) values(4, 'ダミー');
insert into missions(station_id, summary) values(5, 'ダミー');
insert into missions(station_id, summary) values(6, 'ダミー');
insert into missions(station_id, summary) values(7, 'ダミー');
insert into missions(station_id, summary) values(8, 'ダミー');
insert into missions(station_id, summary) values(9, 'ダミー');
insert into missions(station_id, summary) values(10, 'ダミー');
insert into missions(station_id, summary) values(11, 'ダミー');
insert into missions(station_id, summary) values(12, 'ダミー');
insert into missions(station_id, summary) values(13, 'ダミー');
insert into missions(station_id, summary) values(14, 'ダミー');
insert into missions(station_id, summary) values(15, 'ダミー');
insert into missions(station_id, summary) values(16, 'ダミー');
insert into missions(station_id, summary) values(17, 'ダミー');
insert into missions(station_id, summary) values(18, 'ダミー');
insert into missions(station_id, summary) values(19, 'ダミー');
insert into missions(station_id, summary) values(20, 'ダミー');
insert into missions(station_id, summary) values(21, 'ダミー');
insert into missions(station_id, summary) values(22, 'ダミー');
insert into missions(station_id, summary) values(23, 'ダミー');
insert into missions(station_id, summary) values(24, 'ダミー');
insert into missions(station_id, summary) values(25, 'ダミー');
insert into missions(station_id, summary) values(26, 'ダミー');
insert into missions(station_id, summary) values(27, 'ダミー');
insert into missions(station_id, summary) values(28, 'ダミー');
insert into missions(station_id, summary) values(29, 'ダミー');

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
