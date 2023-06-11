CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`food`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`food` (
  `food_id` INT NOT NULL,
  `food_name` VARCHAR(45) NOT NULL,
  `carbo` FLOAT NULL DEFAULT '0',
  `protein` FLOAT NULL DEFAULT '0',
  `fat` FLOAT NULL DEFAULT '0',
  PRIMARY KEY (`food_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `user_id` VARCHAR(20) NOT NULL,
  `user_password` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `gender` VARCHAR(30) NULL DEFAULT NULL,
  `height` FLOAT NULL DEFAULT '0',
  `weight` FLOAT NULL DEFAULT '0',
  `career` FLOAT NULL DEFAULT '0',
  `goal` VARCHAR(45) NULL DEFAULT NULL,
  `growpart` VARCHAR(45) NULL DEFAULT NULL,
  `smm` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`meal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`meal` (
  `meal_id` INT NOT NULL,
  `user_id` VARCHAR(20) NULL DEFAULT NULL,
  `created_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `meal_carbo` FLOAT NULL DEFAULT '0',
  `meal_protein` FLOAT NULL DEFAULT '0',
  `meal_fat` FLOAT NULL DEFAULT '0',
  PRIMARY KEY (`meal_id`),
  INDEX `fk_user_meal_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_meal`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`amountfood`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`amountfood` (
  `food_id` INT NOT NULL,
  `meal_id` INT NOT NULL,
  `amount` FLOAT NULL DEFAULT '1',
  PRIMARY KEY (`food_id`, `meal_id`),
  INDEX `fk_Food_has_Meal_Meal1_idx` (`meal_id` ASC) VISIBLE,
  INDEX `fk_Food_has_Meal_Food1_idx` (`food_id` ASC) VISIBLE,
  CONSTRAINT `fk_Food_has_Meal_Food1`
    FOREIGN KEY (`food_id`)
    REFERENCES `mydb`.`food` (`food_id`),
  CONSTRAINT `fk_Food_has_Meal_Meal1`
    FOREIGN KEY (`meal_id`)
    REFERENCES `mydb`.`meal` (`meal_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`workpage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`workpage` (
  `workpage_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` VARCHAR(20) NULL DEFAULT NULL,
  `created_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `memo` VARCHAR(150) NULL DEFAULT NULL,
  PRIMARY KEY (`workpage_id`),
  INDEX `fk_user_workpage_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_workpage`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`post` (
  `post_id` INT NOT NULL,
  `user_id` VARCHAR(20) NULL DEFAULT NULL,
  `post_content` VARCHAR(200) NULL DEFAULT NULL,
  `post_img` VARCHAR(100) NULL DEFAULT NULL,
  `workpage_id` INT NOT NULL,
  PRIMARY KEY (`post_id`),
  INDEX `fk_Post_WorkPage1_idx` (`workpage_id` ASC) VISIBLE,
  INDEX `fk_user_post_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_Post_WorkPage1`
    FOREIGN KEY (`workpage_id`)
    REFERENCES `mydb`.`workpage` (`workpage_id`),
  CONSTRAINT `fk_user_post`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`comment` (
  `comment_id` INT NOT NULL,
  `user_id` VARCHAR(20) NULL DEFAULT NULL,
  `post_id` INT NULL DEFAULT NULL,
  `comment_content` VARCHAR(100) NULL DEFAULT NULL,
  `created_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id`),
  INDEX `fk_post_comment_idx` (`post_id` ASC) VISIBLE,
  INDEX `fk_user_comment_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_post_comment`
    FOREIGN KEY (`post_id`)
    REFERENCES `mydb`.`post` (`post_id`),
  CONSTRAINT `fk_user_comment`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`dietpost`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`dietpost` (
  `diet_post_id` INT NOT NULL,
  `diet_post_content` VARCHAR(200) NULL DEFAULT NULL,
  `diet_post_img` VARCHAR(45) NULL DEFAULT NULL,
  `meal_id` INT NOT NULL,
  PRIMARY KEY (`diet_post_id`),
  INDEX `fk_Diet_Meal1_idx` (`meal_id` ASC) VISIBLE,
  CONSTRAINT `fk_Diet_Meal1`
    FOREIGN KEY (`meal_id`)
    REFERENCES `mydb`.`meal` (`meal_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`dietcomment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`dietcomment` (
  `diet_comment_id` INT NOT NULL,
  `user_id` VARCHAR(20) NULL DEFAULT NULL,
  `diet_post_id` INT NULL DEFAULT NULL,
  `created_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`diet_comment_id`),
  INDEX `fk_DP_DC_idx` (`diet_post_id` ASC) VISIBLE,
  INDEX `fk_user_d_comment_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_DP_DC`
    FOREIGN KEY (`diet_post_id`)
    REFERENCES `mydb`.`dietpost` (`diet_post_id`),
  CONSTRAINT `fk_user_d_comment`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`diet_comment_like`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`diet_comment_like` (
  `diet_comment_id` INT NOT NULL,
  `user_id` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`diet_comment_id`, `user_id`),
  INDEX `fk_DietComment_has_User_User1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_DietComment_has_User_DietComment1_idx` (`diet_comment_id` ASC) VISIBLE,
  CONSTRAINT `fk_DietComment_has_User_DietComment1`
    FOREIGN KEY (`diet_comment_id`)
    REFERENCES `mydb`.`dietcomment` (`diet_comment_id`),
  CONSTRAINT `fk_DietComment_has_User_User1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`part`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`part` (
  `part_id` INT NOT NULL,
  `part_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`part_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`excercise`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`excercise` (
  `exercise_id` INT NOT NULL,
  `exercise_name` VARCHAR(45) NULL DEFAULT NULL,
  `part_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`exercise_id`),
  INDEX `fk_part_work_idx` (`part_id` ASC) VISIBLE,
  CONSTRAINT `fk_part_work`
    FOREIGN KEY (`part_id`)
    REFERENCES `mydb`.`part` (`part_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`follow`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`follow` (
  `following` VARCHAR(20) NOT NULL,
  `follower` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`following`, `follower`),
  INDEX `fk_User_has_User_User2_idx` (`follower` ASC) VISIBLE,
  INDEX `fk_User_has_User_User1_idx` (`following` ASC) VISIBLE,
  CONSTRAINT `fk_User_has_User_User1`
    FOREIGN KEY (`following`)
    REFERENCES `mydb`.`user` (`user_id`),
  CONSTRAINT `fk_User_has_User_User2`
    FOREIGN KEY (`follower`)
    REFERENCES `mydb`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`likecomment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`likecomment` (
  `user_id` VARCHAR(20) NOT NULL,
  `comment_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `comment_id`),
  INDEX `fk_User_has_Commet_Commet1_idx` (`comment_id` ASC) VISIBLE,
  CONSTRAINT `fk_udrt_has_comment_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`user_id`),
  CONSTRAINT `fk_User_has_Commet_Commet1`
    FOREIGN KEY (`comment_id`)
    REFERENCES `mydb`.`comment` (`comment_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`likedietpost`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`likedietpost` (
  `user_id` VARCHAR(20) NOT NULL,
  `diet_post_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `diet_post_id`),
  INDEX `fk_User_has_DietPost_DietPost1_idx` (`diet_post_id` ASC) VISIBLE,
  CONSTRAINT `fk_User_has_DietPost_DietPost1`
    FOREIGN KEY (`diet_post_id`)
    REFERENCES `mydb`.`dietpost` (`diet_post_id`),
  CONSTRAINT `fk_User_has_DietPost_User1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`likepost`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`likepost` (
  `user_id` VARCHAR(20) NOT NULL,
  `post_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `post_id`),
  INDEX `fk_User_has_Post_Post1_idx` (`post_id` ASC) VISIBLE,
  CONSTRAINT `fk_User_has_Post_Post1`
    FOREIGN KEY (`post_id`)
    REFERENCES `mydb`.`post` (`post_id`),
  CONSTRAINT `fk_User_has_Post_User1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`video` (
  `video_id` VARCHAR(45) NOT NULL,
  `video_title` VARCHAR(45) NULL DEFAULT NULL,
  `channel_name` VARCHAR(45) NULL DEFAULT NULL,
  `view_cnt` INT NULL DEFAULT '0',
  `category` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`video_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`likevideo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`likevideo` (
  `video_id` VARCHAR(45) NOT NULL,
  `user_id` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`video_id`, `user_id`),
  INDEX `fk_Video_has_User_User1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_Video_has_User_Video1_idx` (`video_id` ASC) VISIBLE,
  CONSTRAINT `fk_Video_has_User_User1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`user_id`),
  CONSTRAINT `fk_Video_has_User_Video1`
    FOREIGN KEY (`video_id`)
    REFERENCES `mydb`.`video` (`video_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`partworkpage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`partworkpage` (
  `part_id` INT NOT NULL,
  `workpage_id` INT NOT NULL,
  PRIMARY KEY (`part_id`, `workpage_id`),
  INDEX `fk_Part_has_WorkPage_WorkPage1_idx` (`workpage_id` ASC) VISIBLE,
  INDEX `fk_Part_has_WorkPage_Part1_idx` (`part_id` ASC) VISIBLE,
  CONSTRAINT `fk_Part_has_WorkPage_Part1`
    FOREIGN KEY (`part_id`)
    REFERENCES `mydb`.`part` (`part_id`),
  CONSTRAINT `fk_Part_has_WorkPage_WorkPage1`
    FOREIGN KEY (`workpage_id`)
    REFERENCES `mydb`.`workpage` (`workpage_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`review` (
  `review_id` INT NOT NULL AUTO_INCREMENT,
  `review_content` VARCHAR(100) NULL DEFAULT NULL,
  `user_id` VARCHAR(20) NOT NULL,
  `video_id` VARCHAR(50) NOT NULL,
  `created_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`review_id`),
  INDEX `fk_user_review_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_video_review_idx` (`video_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_review`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`user_id`),
  CONSTRAINT `fk_video_review`
    FOREIGN KEY (`video_id`)
    REFERENCES `mydb`.`video` (`video_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`set`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`set` (
  `page_id` INT NOT NULL,
  `exercise_id` INT NOT NULL,
  `reps` INT NULL DEFAULT '0',
  `weight` FLOAT NULL DEFAULT '0',
  PRIMARY KEY (`page_id`, `exercise_id`),
  INDEX `fk_exercise_set_idx` (`exercise_id` ASC) VISIBLE,
  CONSTRAINT `fk_exercise_set`
    FOREIGN KEY (`exercise_id`)
    REFERENCES `mydb`.`excercise` (`exercise_id`),
  CONSTRAINT `fk_workpage_set`
    FOREIGN KEY (`page_id`)
    REFERENCES `mydb`.`workpage` (`workpage_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`weighttracker`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`weighttracker` (
  `weightTracker_id` INT NOT NULL AUTO_INCREMENT,
  `weight` INT NULL DEFAULT NULL,
  `created_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`weightTracker_id`),
  INDEX `fk_user_weighttracker_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_weighttracker`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`user_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;