/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.15-log : Database - yonghuxitong
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`yonghuxitong` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `yonghuxitong`;

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `note` text COMMENT '内容',
  `pubtime` varchar(30) DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `book` */

insert  into `book`(`id`,`name`,`uid`,`note`,`pubtime`) values (1,'文章01',18,'文章的内容233',NULL),(2,'文章2',18,'具体的内容问问',NULL),(5,'文章3',18,'内容232',NULL),(6,'文章21',19,'内容erect',NULL),(7,'文章22',19,'内容2323',NULL),(8,'文章31',20,'具体的内容232323232232312312345615',NULL);

/*Table structure for table `sysuser` */

DROP TABLE IF EXISTS `sysuser`;

CREATE TABLE `sysuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(20) DEFAULT NULL COMMENT '用户名',
  `sex` varchar(10) DEFAULT NULL COMMENT '性别',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `pwd` varchar(255) DEFAULT NULL COMMENT '密码',
  `utype` varchar(30) DEFAULT '会员' COMMENT '角色',
  `tel` varchar(20) DEFAULT NULL COMMENT '电话',
  `age` varchar(10) DEFAULT NULL COMMENT '年龄',
  `email` varchar(30) DEFAULT NULL COMMENT '邮箱',
  `pubtime` varchar(30) DEFAULT NULL COMMENT '添加时间',
  `tname` varchar(50) DEFAULT NULL COMMENT '姓名',
  `money` double DEFAULT '0' COMMENT '余额',
  `img` varchar(255) DEFAULT NULL COMMENT '图片',
  `birthday` varchar(100) DEFAULT NULL COMMENT '生日',
  `bnum` int(11) DEFAULT NULL COMMENT '文章数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `sysuser` */

insert  into `sysuser`(`id`,`uname`,`sex`,`address`,`pwd`,`utype`,`tel`,`age`,`email`,`pubtime`,`tname`,`money`,`img`,`birthday`,`bnum`) values (1,'admin','女','lll','123456','管理员','13628796354','29','1545312351@qq.com','2021-11-22 18:46:11','管理员',0,'head.jpg','0',0),(18,'test','男','地址1','123456','用户','15621546325',NULL,'1541241@qq.com','2021-11-22 18:47:32','学生01',100,'20170910095708668.jpg','2000-01-01',3),(19,'test02','男','地址1','123456','用户','15632146532',NULL,'145561478@qq.com','2021-11-22 19:36:38','学生02',100,'head.jpg','2000-05-04',2),(20,'test03','男','地址11','123456','用户','15632145632',NULL,'45215147@qq.com','2021-11-22 19:46:18','学生03',155,'20170915112724145.jpg','2000-09-08',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
