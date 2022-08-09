/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.29 : Database - student
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`student` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `student`;

/*Table structure for table `grade` */

DROP TABLE IF EXISTS `grade`;

CREATE TABLE `grade` (
  `gradeId` int(4) NOT NULL DEFAULT '0' COMMENT '年级编号',
  `gradeName` varchar(50) DEFAULT NULL COMMENT '年级名称',
  PRIMARY KEY (`gradeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `grade` */

insert  into `grade`(`gradeId`,`gradeName`) values (1,'s1'),(2,'s2'),(3,'y2');

/*Table structure for table `result` */

DROP TABLE IF EXISTS `result`;

CREATE TABLE `result` (
  `studentNo` int(4) DEFAULT NULL COMMENT '学号',
  `subjectNo` int(4) DEFAULT NULL COMMENT '课程编号',
  `examDate` datetime DEFAULT NULL COMMENT '考试日期',
  `studentResult` int(4) DEFAULT NULL COMMENT '考试成绩',
  KEY `fk_studentNo_res` (`studentNo`),
  KEY `fk_subjectNO_res` (`subjectNo`),
  CONSTRAINT `fk_studentNo_res` FOREIGN KEY (`studentNo`) REFERENCES `student` (`studentNo`),
  CONSTRAINT `fk_subjectNO_res` FOREIGN KEY (`subjectNo`) REFERENCES `subject` (`subjectNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `result` */

insert  into `result`(`studentNo`,`subjectNo`,`examDate`,`studentResult`) values (10000,1,'2016-02-15 00:00:00',76),(10000,1,'2016-02-17 00:00:00',65),(10001,1,'2016-02-17 00:00:00',46),(10002,1,'2016-02-17 00:00:00',83),(10003,1,'2016-02-17 00:00:00',60),(10004,1,'2016-02-17 00:00:00',60),(10005,1,'2016-02-17 00:00:00',95),(10006,1,'2016-02-17 00:00:00',93),(10007,1,'2016-02-17 00:00:00',23),(20000,3,'2018-05-10 16:04:06',98),(20010,3,'2018-05-10 16:04:35',90);

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `studentNo` int(4) NOT NULL AUTO_INCREMENT COMMENT '学号',
  `loginPwd` varchar(20) DEFAULT NULL COMMENT '密码',
  `studentName` varchar(50) DEFAULT NULL COMMENT '学生姓名',
  `sex` char(2) DEFAULT NULL COMMENT '性别',
  `gradeId` int(4) DEFAULT NULL COMMENT '年级编号',
  `phone` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `bornDate` datetime DEFAULT NULL COMMENT '出生时间',
  `email` varchar(50) DEFAULT NULL COMMENT '邮件账号',
  `identityCard` varchar(18) DEFAULT NULL COMMENT '身份证号',
  PRIMARY KEY (`studentNo`),
  UNIQUE KEY `identityCard` (`identityCard`),
  KEY `fk_grade` (`gradeId`),
  CONSTRAINT `fk_grade` FOREIGN KEY (`gradeId`) REFERENCES `grade` (`gradeId`)
) ENGINE=InnoDB AUTO_INCREMENT=30013 DEFAULT CHARSET=utf8 COMMENT='学生表';

/*Data for the table `student` */

insert  into `student`(`studentNo`,`loginPwd`,`studentName`,`sex`,`gradeId`,`phone`,`address`,`bornDate`,`email`,`identityCard`) values (10000,'123','郭靖','女',1,'13645667783','天津市河西区','1990-09-08 00:00:00',NULL,NULL),(10001,'123','李文才','男',1,'13645667890','地址不详','1994-04-12 00:00:00',NULL,NULL),(10002,'123','李斯文','男',1,'13645556793','河南洛阳','1993-07-23 00:00:00',NULL,NULL),(10003,'123','张萍','女',1,'13642345112','地址不详','1995-06-10 00:00:00',NULL,NULL),(10004,'123','韩秋洁123','女',1,'13812344566','北京市海淀区','1995-07-15 00:00:00',NULL,'10000011'),(10005,'123','张秋丽','女',1,'13567893246','北京市东城区','1994-01-17 00:00:00',NULL,NULL),(10006,'123','肖梅','女',1,'13563456721','河北省石家庄市','1991-02-17 00:00:00',NULL,NULL),(10007,'123','秦洋','男',1,'13056434411','上海市卢湾区','1992-04-18 00:00:00',NULL,NULL),(10008,'123','何睛睛','女',1,'13053445221','广州市天河区','1997-07-23 00:00:00',NULL,NULL),(20000,'111','王宝宝','男',2,'15076552323','地址不详','1996-06-05 00:00:00','stu20000@163.com',NULL),(20010,'000','何小华','女',2,'13318877954','地址不详','1995-09-10 00:00:00','stu20000@163.com',NULL),(30011,'123','陈志强','女',3,'13689965430','地址不详3','1994-09-27 00:00:00',NULL,NULL),(30012,'123','李露露','女',3,'13685678854','地址不详4','1992-09-27 00:00:00',NULL,NULL);

/*Table structure for table `subject` */

DROP TABLE IF EXISTS `subject`;

CREATE TABLE `subject` (
  `subjectNo` int(4) NOT NULL AUTO_INCREMENT COMMENT '课程编号',
  `subjectName` varchar(50) DEFAULT NULL COMMENT '课程名称',
  `classHour` int(4) DEFAULT NULL COMMENT '学时',
  `gradeId` int(4) DEFAULT NULL COMMENT '年级编号',
  PRIMARY KEY (`subjectNo`),
  KEY `fk_grade_sub` (`gradeId`),
  CONSTRAINT `fk_grade_sub` FOREIGN KEY (`gradeId`) REFERENCES `grade` (`gradeId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='课程表';

/*Data for the table `subject` */

insert  into `subject`(`subjectNo`,`subjectName`,`classHour`,`gradeId`) values (1,'java',210,1),(2,'mysql',80,1),(3,'javascript',90,2);

/*Table structure for table `mrzhang` */

DROP TABLE IF EXISTS `mrzhang`;

/*!50001 DROP VIEW IF EXISTS `mrzhang` */;
/*!50001 DROP TABLE IF EXISTS `mrzhang` */;

/*!50001 CREATE TABLE  `mrzhang`(
 `studentNo` int(4) ,
 `studentName` varchar(50) ,
 `studentResult` int(4) ,
 `examDate` datetime 
)*/;

/*Table structure for table `studentview` */

DROP TABLE IF EXISTS `studentview`;

/*!50001 DROP VIEW IF EXISTS `studentview` */;
/*!50001 DROP TABLE IF EXISTS `studentview` */;

/*!50001 CREATE TABLE  `studentview`(
 `studentNo` int(4) ,
 `loginPwd` varchar(20) ,
 `studentName` varchar(50) ,
 `sex` char(2) ,
 `gradeId` int(4) ,
 `phone` varchar(50) ,
 `address` varchar(255) ,
 `bornDate` datetime ,
 `email` varchar(50) ,
 `identityCard` varchar(18) 
)*/;

/*Table structure for table `stuview` */

DROP TABLE IF EXISTS `stuview`;

/*!50001 DROP VIEW IF EXISTS `stuview` */;
/*!50001 DROP TABLE IF EXISTS `stuview` */;

/*!50001 CREATE TABLE  `stuview`(
 `studentNo` int(4) ,
 `studentName` varchar(50) 
)*/;

/*View structure for view mrzhang */

/*!50001 DROP TABLE IF EXISTS `mrzhang` */;
/*!50001 DROP VIEW IF EXISTS `mrzhang` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `mrzhang` AS select `s`.`studentNo` AS `studentNo`,`s`.`studentName` AS `studentName`,`r`.`studentResult` AS `studentResult`,`r`.`examDate` AS `examDate` from (`student` `s` join `result` `r`) where (`s`.`studentNo` = `r`.`studentNo`) */;

/*View structure for view studentview */

/*!50001 DROP TABLE IF EXISTS `studentview` */;
/*!50001 DROP VIEW IF EXISTS `studentview` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `studentview` AS select `student`.`studentNo` AS `studentNo`,`student`.`loginPwd` AS `loginPwd`,`student`.`studentName` AS `studentName`,`student`.`sex` AS `sex`,`student`.`gradeId` AS `gradeId`,`student`.`phone` AS `phone`,`student`.`address` AS `address`,`student`.`bornDate` AS `bornDate`,`student`.`email` AS `email`,`student`.`identityCard` AS `identityCard` from `student` */;

/*View structure for view stuview */

/*!50001 DROP TABLE IF EXISTS `stuview` */;
/*!50001 DROP VIEW IF EXISTS `stuview` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `stuview` AS select `student`.`studentNo` AS `studentNo`,`student`.`studentName` AS `studentName` from `student` */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
