/*
SQLyog Ultimate v11.42 (64 bit)
MySQL - 5.5.27 : Database - crowd_founding
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`crowd_founding` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `crowd_founding`;

/*Table structure for table `permission` */

DROP TABLE IF EXISTS `permission`;

CREATE TABLE `permission` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `parent` int(10) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;

/*Data for the table `permission` */

insert  into `permission`(`id`,`name`,`parent`,`url`,`icon`) values (96,'系统根菜单',0,'fdsaf','glyphicon glyphicon-cog'),(97,'网站维护',96,'vdagdfg','glyphicon glyphicon-cog'),(98,'用户维护',97,'/user/index','glyphicon glyphicon-user'),(99,'角色维护',97,'/role/index','glyphicon glyphicon-sunglasses'),(100,'权限管理',97,'/permission/index','glyphicon glyphicon-cog'),(102,'业务审核',96,'www.baidu.com','glyphicon glyphicon-wrench'),(103,'实名认证审核',102,'adduser.com','glyphicon glyphicon-object-align-vertical'),(104,'业务管理',96,'testurl','glyphicon glyphicon-folder-close'),(105,'资质维护',104,'testurl','glyphicon glyphicon-leaf'),(106,'代理审核',104,'fdsfadsf','glyphicon glyphicon-hdd'),(107,'出库管理',104,'adduser.com','glyphicon glyphicon-oil'),(108,'入库管理',104,'fdsafadsffdsa','glyphicon glyphicon-th-list'),(109,'校园新闻',96,'delelteuser.com','glyphicon glyphicon-th-list'),(110,'新闻发布',109,'fdsafadsffdsa','glyphicon glyphicon-oil'),(111,'新闻删除',109,'delelteuser.com','glyphicon glyphicon-user'),(112,'热点维护',109,'queryuser.com','glyphicon glyphicon-link'),(113,'校园广播',96,'delelteuser.com','glyphicon glyphicon-text-color'),(114,'内容更新',113,'delelteuser.com','glyphicon glyphicon-music'),(115,'广播歌单',113,'queryuser.com','glyphicon glyphicon-user'),(116,'名师风采',96,'fdsafadsffdsa','glyphicon glyphicon-oil'),(117,'最美导师',116,'fdsafadsffdsa','glyphicon glyphicon-user'),(118,'优秀学子',96,'queryuser.com',' glyphicon glyphicon-knight'),(119,'才子佳人',118,'delelteuser.com','glyphicon glyphicon-user'),(120,'人才就业',118,'fdsafadsffdsa','glyphicon glyphicon-oil'),(121,'校园文化',96,'fdsafadsffdsa','glyphicon glyphicon-th-list'),(122,'学校历史',121,'fdsafadsffdsa','glyphicon glyphicon-th-list');

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(255) DEFAULT NULL,
  `roledesc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`id`,`rolename`,`roledesc`) values (225,'超级管理员','系统的权限拥有者系统的权限拥有者系统的权限拥有者'),(227,'任课老师','任课老师任课老师任课老师任课老师'),(228,'班级导师','班级导师班级导师班级导师班级导师'),(229,'系主任','系主任系主任系主任系主任系主任'),(230,'校长','校长校长校长校长校长'),(231,'学生','学生学生学生学生'),(232,'教务处','教务处教务处教务处教务处教务处'),(233,'安保处','安保处安保处安保处'),(234,'测试','测试测试测试测试测试测试');

/*Table structure for table `role_permission` */

DROP TABLE IF EXISTS `role_permission`;

CREATE TABLE `role_permission` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `role_id` int(10) DEFAULT NULL,
  `permission_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=516 DEFAULT CHARSET=utf8;

/*Data for the table `role_permission` */

insert  into `role_permission`(`id`,`role_id`,`permission_id`) values (305,231,96),(306,231,113),(307,231,114),(308,231,115),(309,231,116),(310,231,117),(311,231,118),(312,231,119),(313,231,120),(314,231,121),(315,231,122),(397,229,96),(398,229,102),(399,229,103),(400,229,124),(401,229,104),(402,229,105),(403,229,106),(404,229,107),(405,229,108),(406,229,109),(407,229,110),(408,229,111),(409,229,112),(410,229,113),(411,229,114),(412,229,115),(413,229,116),(414,229,117),(415,229,118),(416,229,119),(417,229,120),(418,229,121),(419,229,122),(474,225,96),(475,225,97),(476,225,98),(477,225,99),(478,225,100),(479,225,102),(480,225,103),(481,225,104),(482,225,105),(483,225,106),(484,225,107),(485,225,108),(486,225,109),(487,225,110),(488,225,111),(489,225,112),(490,225,113),(491,225,114),(492,225,115),(493,225,116),(494,225,117),(495,225,118),(496,225,119),(497,225,120),(498,225,121),(499,225,122),(500,225,128),(501,227,96),(502,227,109),(503,227,110),(504,227,111),(505,227,112),(506,227,113),(507,227,114),(508,227,115),(509,227,116),(510,227,117),(511,227,118),(512,227,119),(513,227,120),(514,227,121),(515,227,122);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `age` int(10) DEFAULT NULL,
  `loginid` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phonenumber` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=522 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`age`,`loginid`,`password`,`email`,`phonenumber`) values (422,'root',14,'3053161401','123456','42e6c@qq.com','12121110'),(423,'杨老师',15,'8e4c','123456','9542a@qq.com','12121111'),(424,'1e95',16,'ec37','123456','a69ae@qq.com','12121112'),(425,'5a6d',17,'130e','123456','2c431@qq.com','12121113'),(426,'bbb6',18,'7508','123456','d5f94@qq.com','12121114'),(427,'e00c',19,'a6ab','123456','8fbab@qq.com','12121115'),(428,'a81f',20,'1621','123456','46c9d@qq.com','12121116'),(429,'b6eb',21,'3eea','123456','4b71a@qq.com','12121117'),(430,'934f',22,'fc65','123456','f3cf8@qq.com','12121118'),(431,'b92e',23,'09c1','123456','f5159@qq.com','12121119'),(432,'8a8f',24,'5741','123456','3b3e9@qq.com','121211110'),(433,'4422',25,'144c','123456','a88a9@qq.com','121211111'),(434,'ee75',26,'a36f','123456','a642b@qq.com','121211112'),(435,'bd25',27,'d4ee','123456','a600a@qq.com','121211113'),(436,'5cb5',28,'bd63','123456','3e35f@qq.com','121211114'),(437,'57b5',29,'753c','123456','b9a6e@qq.com','121211115'),(438,'362e',30,'6026','123456','f7fc5@qq.com','121211116'),(439,'e1dc',31,'96e5','123456','15e91@qq.com','121211117'),(440,'f652',32,'dc4b','123456','23e45@qq.com','121211118'),(441,'080b',33,'c777','123456','f3b86@qq.com','121211119'),(442,'32f9',34,'d9c4','123456','fd876@qq.com','121211120'),(443,'34f2',35,'62a3','123456','b4df2@qq.com','121211121'),(444,'c30b',36,'5591','123456','aa8ff@qq.com','121211122'),(445,'0b33',37,'dae1','123456','e4096@qq.com','121211123'),(446,'cc66',38,'f4bb','123456','a489e@qq.com','121211124'),(447,'a608',39,'b171','123456','61e89@qq.com','121211125'),(448,'a0fa',40,'85e6','123456','10815@qq.com','121211126'),(449,'44d7',41,'5006','123456','7c6a5@qq.com','121211127'),(450,'5fb3',42,'686b','123456','a818f@qq.com','121211128'),(451,'91ea',43,'b6e4','123456','739c8@qq.com','121211129'),(452,'2fa8',44,'1e26','123456','00bc6@qq.com','121211130'),(453,'3bd8',45,'ce75','123456','d85b3@qq.com','121211131'),(454,'bd8b',46,'8643','123456','9b397@qq.com','121211132'),(455,'3e7a',47,'a02f','123456','b5ba2@qq.com','121211133'),(456,'71c4',48,'c37c','123456','d3453@qq.com','121211134'),(457,'0637',49,'4540','123456','7c3ae@qq.com','121211135'),(458,'5c4d',50,'b476','123456','a047c@qq.com','121211136'),(459,'b9ac',51,'79fe','123456','05187@qq.com','121211137'),(460,'9394',52,'2379','123456','9b486@qq.com','121211138'),(462,'ef15',54,'93b5','123456','001e5@qq.com','121211140'),(463,'55ea',55,'3dc5','123456','2d2fd@qq.com','121211141'),(464,'9738',56,'fefa','123456','ba8ee@qq.com','121211142'),(465,'49eb',57,'a06d','123456','51113@qq.com','121211143'),(466,'23f6',58,'f408','123456','2fad7@qq.com','121211144'),(467,'1370',59,'d6d6','123456','ea7ee@qq.com','121211145'),(468,'f409',60,'6469','123456','9f269@qq.com','121211146'),(469,'79bf',61,'f3f2','123456','b1195@qq.com','121211147'),(470,'940d',62,'d419','123456','c052d@qq.com','121211148'),(471,'76df',63,'4eaa','123456','41eb0@qq.com','121211149'),(472,'789f',64,'5f6b','123456','d8fbc@qq.com','121211150'),(473,'a1bc',65,'9b4e','123456','3a333@qq.com','121211151'),(474,'7f41',66,'4dba','123456','86e8c@qq.com','121211152'),(475,'d7d5',67,'5f40','123456','4117d@qq.com','121211153'),(476,'5fe3',68,'deec','123456','b8933@qq.com','121211154'),(477,'18ad',69,'0e63','123456','194b5@qq.com','121211155'),(478,'d7a7',70,'4879','123456','cdcf7@qq.com','121211156'),(479,'cc9c',71,'d059','123456','3519a@qq.com','121211157'),(480,'a5bb',72,'0cfe','123456','f3c5e@qq.com','121211158'),(481,'a2c0',73,'811e','123456','ee696@qq.com','121211159'),(482,'cb4f',74,'af7c','123456','7e631@qq.com','121211160'),(483,'2c07',75,'2f70','123456','1bed4@qq.com','121211161'),(484,'df82',76,'59d6','123456','81862@qq.com','121211162'),(485,'51b5',77,'a172','123456','64209@qq.com','121211163'),(486,'5251',78,'d53c','123456','9436f@qq.com','121211164'),(487,'6bcd',79,'dcc6','123456','e0a5a@qq.com','121211165'),(488,'c197',80,'a960','123456','21ff4@qq.com','121211166'),(489,'1ac2',81,'fd49','123456','7acc2@qq.com','121211167'),(490,'8d93',82,'fb20','123456','0f1de@qq.com','121211168'),(491,'0067',83,'7257','123456','267ab@qq.com','121211169'),(492,'f830',84,'c151','123456','5d43e@qq.com','121211170'),(493,'72eb',85,'f0f7','123456','e719e@qq.com','121211171'),(494,'56a3',86,'bb98','123456','4740f@qq.com','121211172'),(495,'fc04',87,'bbd9','123456','c02b4@qq.com','121211173'),(496,'658a',88,'f365','123456','902bf@qq.com','121211174'),(497,'1aea',89,'57ea','123456','99155@qq.com','121211175'),(498,'3c0d',90,'0245','123456','b308e@qq.com','121211176'),(499,'997d',91,'d036','123456','d3b9f@qq.com','121211177'),(500,'3ff0',92,'b97a','123456','1ec7e@qq.com','121211178'),(501,'893d',93,'26f3','123456','6de74@qq.com','121211179'),(502,'c8b1',94,'055f','123456','11712@qq.com','121211180'),(503,'c51d',95,'4b18','123456','6fa0e@qq.com','121211181'),(504,'8e11',96,'35ea','123456','09993@qq.com','121211182'),(505,'6abe',97,'a6a0','123456','a3949@qq.com','121211183'),(506,'5d8f',98,'9cc3','123456','41e6d@qq.com','121211184'),(507,'07ec',99,'b9ee','123456','5ff34@qq.com','121211185'),(508,'5b23',100,'72de','123456','bfa86@qq.com','121211186'),(509,'b850',101,'2726','123456','c2486@qq.com','121211187'),(510,'ffa8',102,'8ffb','123456','88cc6@qq.com','121211188'),(511,'f45a',103,'1bd5','123456','251b3@qq.com','121211189'),(512,'d155',104,'5390','123456','95617@qq.com','121211190'),(513,'fb39',105,'c964','123456','d0c24@qq.com','121211191'),(514,'063a',106,'9dfe','123456','f9b06@qq.com','121211192'),(515,'1185',107,'f26a','123456','75b2c@qq.com','121211193'),(516,'6ad8',108,'31bf','123456','c5f87@qq.com','121211194'),(517,'4ea1',109,'7195','123456','0803e@qq.com','121211195'),(518,'822a',110,'c3f8','123456','94ac5@qq.com','121211196'),(519,'f5bc',111,'89e1','123456','fb587@qq.com','121211197'),(520,'f09d',112,'f06e','123456','e9665@qq.com','121211198'),(521,'c9c4',113,'3af7','123456','6583e@qq.com','121211199');

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `role_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=282 DEFAULT CHARSET=utf8;

/*Data for the table `user_role` */

insert  into `user_role`(`id`,`user_id`,`role_id`) values (253,422,225),(272,424,230),(273,424,233),(277,422,225),(278,422,226),(279,422,225),(280,422,226),(281,423,227);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
