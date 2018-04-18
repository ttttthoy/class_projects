-- 회원정보
ALTER TABLE `MY_SCHEMA`.`MMBR_INF`
	DROP PRIMARY KEY; -- 회원정보 기본키

-- 회원정보
DROP TABLE IF EXISTS `MY_SCHEMA`.`MMBR_INF` RESTRICT;

-- 회원정보
CREATE TABLE `MY_SCHEMA`.`MMBR_INF` (
	`MMBR_NMBR`  INT          NOT NULL, -- 회원번호
	`MMBR_ID`    VARCHAR(16)  NOT NULL, -- 회원아이디
	`MMBR_EMAIL` VARCHAR(40)  NOT NULL, -- 회원이메일
	`MMBR_NM`    VARCHAR(50)  NOT NULL, -- 회원이름
	`MMBR_PHOTO` VARCHAR(120) NULL      -- 회원사진
);

-- 회원정보
ALTER TABLE `MY_SCHEMA`.`MMBR_INF`
	ADD CONSTRAINT `PK_MMBR_INF` -- 회원정보 기본키
		PRIMARY KEY (
			`MMBR_NMBR` -- 회원번호
		);

ALTER TABLE `MY_SCHEMA`.`MMBR_INF`
	MODIFY COLUMN `MMBR_NMBR` INT NOT NULL AUTO_INCREMENT;
    
===================================================================

-- 친구정보 
ALTER TABLE `MY_SCHEMA`.`FREN_INF`
	DROP FOREIGN KEY `FK_MMBR_INF_TO_FREN_INF`; -- 회원정보 -> 친구정보

-- 친구정보 
ALTER TABLE `MY_SCHEMA`.`FREN_INF`
	DROP FOREIGN KEY `FK_UNIV_INF_TO_FREN_INF`; -- 학교정보 -> 친구정보

-- 친구정보 
ALTER TABLE `MY_SCHEMA`.`FREN_INF`
	DROP FOREIGN KEY `FK_COMP_INF_TO_FREN_INF`; -- 회사정보 -> 친구정보

-- 친구정보 
ALTER TABLE `MY_SCHEMA`.`FREN_INF`
	DROP PRIMARY KEY; -- 친구정보  기본키

-- 친구정보 
DROP TABLE IF EXISTS `MY_SCHEMA`.`FREN_INF` RESTRICT;

-- 친구정보 
CREATE TABLE `MY_SCHEMA`.`FREN_INF` (
	`FREN_NMBR`     INT          NOT NULL, -- 친구번호
	`FREN_NM`       VARCHAR(50)  NOT NULL, -- 친구이름
	`FREN_PHN_NMBR` VARCHAR(30)  NOT NULL, -- 친구전화번호
	`FREN_EMAIL`    VARCHAR(40)  NULL,     -- 친구이메일
	`FREN_ADDR`     VARCHAR(255) NULL,     -- 친구주소
	`FREN_PHOTO`    VARCHAR(120) NULL,     -- 친구사진
	`MMBR_NMBR`     INT          NOT NULL, -- 회원번호
	`id`            INT          NULL,     -- 학교정보번호
	`id2`           INT          NULL      -- 회사정보번호
);

-- 친구정보 
ALTER TABLE `MY_SCHEMA`.`FREN_INF`
	ADD CONSTRAINT `PK_FREN_INF` -- 친구정보  기본키
		PRIMARY KEY (
			`FREN_NMBR` -- 친구번호
		);

ALTER TABLE `MY_SCHEMA`.`FREN_INF`
	MODIFY COLUMN `FREN_NMBR` INT NOT NULL AUTO_INCREMENT;

-- 친구정보 
ALTER TABLE `MY_SCHEMA`.`FREN_INF`
	ADD CONSTRAINT `FK_MMBR_INF_TO_FREN_INF` -- 회원정보 -> 친구정보 
		FOREIGN KEY (
			`MMBR_NMBR` -- 회원번호
		)
		REFERENCES `MY_SCHEMA`.`MMBR_INF` ( -- 회원정보
			`MMBR_NMBR` -- 회원번호
		);

-- 친구정보 
ALTER TABLE `MY_SCHEMA`.`FREN_INF`
	ADD CONSTRAINT `FK_UNIV_INF_TO_FREN_INF` -- 학교정보 -> 친구정보 
		FOREIGN KEY (
			`id` -- 학교정보번호
		)
		REFERENCES `MY_SCHEMA`.`UNIV_INF` ( -- 학교정보
			`UNIV_NMBR` -- 학교정보번호
		);

-- 친구정보 
ALTER TABLE `MY_SCHEMA`.`FREN_INF`
	ADD CONSTRAINT `FK_COMP_INF_TO_FREN_INF` -- 회사정보 -> 친구정보 
		FOREIGN KEY (
			`id2` -- 회사정보번호
		)
		REFERENCES `MY_SCHEMA`.`COMP_INF` ( -- 회사정보
			`COMP_NMBR` -- 회사정보번호
		);
        
        
========================================================================

-- 학교정보
ALTER TABLE `MY_SCHEMA`.`UNIV_INF`
	DROP PRIMARY KEY; -- 학교정보 기본키

-- 학교정보
DROP TABLE IF EXISTS `MY_SCHEMA`.`UNIV_INF` RESTRICT;

-- 학교정보
CREATE TABLE `MY_SCHEMA`.`UNIV_INF` (
	`UNIV_NMBR` INT NOT NULL, -- 학교정보번호
	`MAJ`       INT NOT NULL, -- 전공명
	`GRD`       INT NOT NULL  -- 학년
);

-- 학교정보
ALTER TABLE `MY_SCHEMA`.`UNIV_INF`
	ADD CONSTRAINT `PK_UNIV_INF` -- 학교정보 기본키
		PRIMARY KEY (
			`UNIV_NMBR` -- 학교정보번호
		);

ALTER TABLE `MY_SCHEMA`.`UNIV_INF`
	MODIFY COLUMN `UNIV_NMBR` INT NOT NULL AUTO_INCREMENT;
    
====================================================================

-- 회사정보
ALTER TABLE `MY_SCHEMA`.`COMP_INF`
	DROP PRIMARY KEY; -- 회사정보 기본키

-- 회사정보
DROP TABLE IF EXISTS `MY_SCHEMA`.`COMP_INF` RESTRICT;

-- 회사정보
CREATE TABLE `MY_SCHEMA`.`COMP_INF` (
	`COMP_NMBR` INT         NOT NULL, -- 회사정보번호
	`COMP_NM`   VARCHAR(50) NOT NULL  -- 회사이름
);

-- 회사정보
ALTER TABLE `MY_SCHEMA`.`COMP_INF`
	ADD CONSTRAINT `PK_COMP_INF` -- 회사정보 기본키
		PRIMARY KEY (
			`COMP_NMBR` -- 회사정보번호
		);

ALTER TABLE `MY_SCHEMA`.`COMP_INF`
	MODIFY COLUMN `COMP_NMBR` INT NOT NULL AUTO_INCREMENT;