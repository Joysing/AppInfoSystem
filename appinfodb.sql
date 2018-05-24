/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.40 : Database - appinfodb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`appinfodb` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `appinfodb`;

/*Table structure for table `ad_promotion` */

DROP TABLE IF EXISTS `ad_promotion`;

CREATE TABLE `ad_promotion` (
  `id` bigint(30) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `appId` bigint(30) DEFAULT NULL COMMENT 'appId（来源于：app_info表的主键id）',
  `adPicPath` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '广告图片存储路径',
  `adPV` bigint(50) DEFAULT NULL COMMENT '广告点击量',
  `carouselPosition` int(30) DEFAULT NULL COMMENT '轮播位（1-n）',
  `startTime` datetime DEFAULT NULL COMMENT '起效时间',
  `endTime` datetime DEFAULT NULL COMMENT '失效时间',
  `createdBy` bigint(30) DEFAULT NULL COMMENT '创建者（来源于backend_user用户表的用户id）',
  `creationDate` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyBy` bigint(30) DEFAULT NULL COMMENT '更新者（来源于backend_user用户表的用户id）',
  `modifyDate` datetime DEFAULT NULL COMMENT '最新更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `ad_promotion` */

/*Table structure for table `app_category` */

DROP TABLE IF EXISTS `app_category`;

CREATE TABLE `app_category` (
  `id` bigint(30) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `categoryCode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '分类编码',
  `categoryName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '分类名称',
  `parentId` bigint(30) DEFAULT NULL COMMENT '父级节点id',
  `createdBy` bigint(30) DEFAULT NULL COMMENT '创建者（来源于backend_user用户表的用户id）',
  `creationTime` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyBy` bigint(30) DEFAULT NULL COMMENT '更新者（来源于backend_user用户表的用户id）',
  `modifyDate` datetime DEFAULT NULL COMMENT '最新更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `app_category` */

insert  into `app_category`(`id`,`categoryCode`,`categoryName`,`parentId`,`createdBy`,`creationTime`,`modifyBy`,`modifyDate`) values (1,'ALL_APP','全部应用',NULL,1,'2016-08-12 18:11:47',NULL,NULL),(2,'ALL_GAME','全部游戏',NULL,1,'2016-08-12 18:11:47',NULL,NULL),(3,'APP_001','系统工具',1,1,'2016-08-12 18:11:47',NULL,NULL),(4,'APP_002','桌面插件',1,1,'2016-08-12 18:11:47',NULL,NULL),(5,'APP_003','主题美化',1,1,'2016-08-12 18:11:47',NULL,NULL),(6,'APP_004','社交聊天',1,1,'2016-08-12 18:11:47',NULL,NULL),(7,'APP_005','资讯阅读',1,1,'2016-08-12 18:11:47',NULL,NULL),(8,'APP_006','通讯网络',1,1,'2016-08-12 18:11:47',NULL,NULL),(9,'APP_007','影音娱乐',1,1,'2016-08-12 18:11:47',NULL,NULL),(10,'APP_008','摄影图片 ',1,1,'2016-08-12 18:11:47',NULL,NULL),(11,'APP_009','生活服务',1,1,'2016-08-12 18:11:47',NULL,NULL),(12,'APP_010','实用工具 ',1,1,'2016-08-12 18:11:47',NULL,NULL),(13,'APP_011','文档商务',1,1,'2016-08-12 18:11:47',NULL,NULL),(14,'APP_012','金融财经',1,1,'2016-08-12 18:11:47',NULL,NULL),(15,'APP_013','运动健康',1,1,'2016-08-12 18:11:47',NULL,NULL),(16,'APP_014','学习教育 ',1,1,'2016-08-12 18:11:47',NULL,NULL),(17,'APP_015','旅行交通',1,1,'2016-08-12 18:11:47',NULL,NULL),(18,'APP_016','购物',1,1,'2016-08-12 18:11:47',NULL,NULL),(19,'GAME_001','休闲游戏',2,1,'2016-08-12 18:11:47',NULL,NULL),(20,'GAME_002','益智游戏',2,1,'2016-08-12 18:11:47',NULL,NULL),(21,'GAME_003','棋牌游戏',2,1,'2016-08-12 18:11:47',NULL,NULL),(22,'GAME_004','体育赛车',2,1,'2016-08-12 18:11:47',NULL,NULL),(23,'GAME_005','动作射击',2,1,'2016-08-12 18:11:47',NULL,NULL),(24,'GAME_006','掌上网游',2,1,'2016-08-12 18:11:47',NULL,NULL),(25,'GAME_007','策略塔防',2,1,'2016-08-12 18:11:47',NULL,NULL),(26,'GAME_008','角色扮演',2,1,'2016-08-12 18:11:47',NULL,NULL),(27,'GAME_009','模拟经营 ',2,1,'2016-08-12 18:11:47',NULL,NULL),(28,'GAME_010','音乐游戏 ',2,1,'2016-08-12 18:11:47',NULL,NULL),(29,'APP_001_01','输入法',3,1,'2016-08-12 18:11:47',NULL,NULL),(30,'APP_001_02','文件管理',3,1,'2016-08-12 18:11:47',NULL,NULL),(31,'APP_001_03','清理优化',3,1,'2016-08-12 18:11:47',NULL,NULL),(32,'APP_001_04','安全防护',3,1,'2016-08-12 18:11:47',NULL,NULL),(33,'APP_001_05','备份还原',3,1,'2016-08-12 18:11:47',NULL,NULL),(34,'APP_001_06','辅助加强',3,1,'2016-08-12 18:11:47',NULL,NULL),(35,'APP_002_01','桌面',4,1,'2016-08-12 18:11:47',NULL,NULL),(36,'APP_002_02','插件',4,1,'2016-08-12 18:11:47',NULL,NULL),(37,'APP_002_03','锁屏',4,1,'2016-08-12 18:11:47',NULL,NULL),(38,'GAME_001_01','跳舞',19,1,'2016-08-12 18:11:47',NULL,NULL),(39,'GAME_001_02','涂鸦',19,1,'2016-08-12 18:11:47',NULL,NULL),(40,'GAME_001_03','虐心',19,1,'2016-08-12 18:11:47',NULL,NULL),(41,'GAME_001_04','冒险',19,1,'2016-08-12 18:11:47',NULL,NULL),(42,'GAME_002_01','消除',20,1,'2016-08-12 18:11:47',NULL,NULL),(43,'GAME_001_02','解谜',20,1,'2016-08-12 18:11:47',NULL,NULL),(44,'GAME_001_03','物理',20,1,'2016-08-12 18:11:47',NULL,NULL),(45,'GAME_003_01','麻将',21,1,'2016-08-12 18:11:47',NULL,NULL),(46,'GAME_003_02','扑克',21,1,'2016-08-12 18:11:47',NULL,NULL),(47,'GAME_004_01','赛车',22,1,'2016-08-12 18:11:47',NULL,NULL),(48,'GAME_004_02','足球',22,1,'2016-08-12 18:11:47',NULL,NULL),(49,'GAME_004_03','篮球',22,1,'2016-08-12 18:11:47',NULL,NULL),(50,'GAME_004_04','摩托',22,1,'2016-08-12 18:11:47',NULL,NULL);

/*Table structure for table `app_info` */

DROP TABLE IF EXISTS `app_info`;

CREATE TABLE `app_info` (
  `id` bigint(30) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `softwareName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '软件名称',
  `APKName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'APK名称（唯一）',
  `supportROM` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '支持ROM',
  `interfaceLanguage` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '界面语言',
  `softwareSize` decimal(20,2) DEFAULT NULL COMMENT '软件大小（单位：M）',
  `updateDate` date DEFAULT NULL COMMENT '更新日期',
  `devId` bigint(30) DEFAULT NULL COMMENT '开发者id（来源于：dev_user表的开发者id）',
  `appInfo` varchar(5000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '应用简介',
  `status` bigint(30) DEFAULT NULL COMMENT '状态（来源于：data_dictionary，1 待审核 2 审核通过 3 审核不通过 4 已上架 5 已下架）',
  `onSaleDate` datetime DEFAULT NULL COMMENT '上架时间',
  `offSaleDate` datetime DEFAULT NULL COMMENT '下架时间',
  `flatformId` bigint(30) DEFAULT NULL COMMENT '所属平台（来源于：data_dictionary，1 手机 2 平板 3 通用）',
  `categoryLevel3` bigint(30) DEFAULT NULL COMMENT '所属三级分类（来源于：data_dictionary）',
  `downloads` bigint(30) DEFAULT NULL COMMENT '下载量（单位：次）',
  `createdBy` bigint(30) DEFAULT NULL COMMENT '创建者（来源于dev_user开发者信息表的用户id）',
  `creationDate` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyBy` bigint(30) DEFAULT NULL COMMENT '更新者（来源于dev_user开发者信息表的用户id）',
  `modifyDate` datetime DEFAULT NULL COMMENT '最新更新时间',
  `categoryLevel1` bigint(30) DEFAULT NULL COMMENT '所属一级分类（来源于：data_dictionary）',
  `categoryLevel2` bigint(30) DEFAULT NULL COMMENT '所属二级分类（来源于：data_dictionary）',
  `logoPicPath` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'LOGO图片url路径',
  `logoLocPath` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'LOGO图片的服务器存储路径',
  `versionId` bigint(30) DEFAULT NULL COMMENT '最新的版本id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `app_info` */

insert  into `app_info`(`id`,`softwareName`,`APKName`,`supportROM`,`interfaceLanguage`,`softwareSize`,`updateDate`,`devId`,`appInfo`,`status`,`onSaleDate`,`offSaleDate`,`flatformId`,`categoryLevel3`,`downloads`,`createdBy`,`creationDate`,`modifyBy`,`modifyDate`,`categoryLevel1`,`categoryLevel2`,`logoPicPath`,`logoLocPath`,`versionId`) values (48,'劲乐团U:O2Jam U','com.momocorp.o2jamu','2.3及更高版本','英文软件','56.00',NULL,1,'劲乐团U O2Jam U是一款音乐节拍游戏，跟着音乐的节奏点击屏幕即可，就是跳舞机，需要网络支持。\r\n注意：部分机型会卡死在启动界面或fc，结束进程后重新开启游戏就正常了。',1,NULL,NULL,3,38,1000,1,'2016-08-22 11:43:02',NULL,NULL,2,19,'/AppInfoSystem/statics/uploadfiles/com.momocorp.o2jamu.jpg','D:\\soft\\apache-tomcat-7.0.41\\webapps\\AppInfoSystem\\statics\\uploadfiles\\com.momocorp.o2jamu.jpg',NULL),(49,'LBE安全大师','com.lbe.security','2.2及更高版本','简体中文','9.00',NULL,1,'欢迎您使用LBE安全大师，Android平台上首款主动式防御软件，第一款具备实时监控与拦截能力的安全软件。\r\n安全大师基于业界首创的API拦截技术，能够实时监控与拦截系统中的敏感操作，动态拦截来自已知和未知的各种威胁。避免各类吸费软件，广告软件乃至木马病毒窃取您手机内的隐私信息以及可能产生的经济损失。\r\n安全大师同时提供了强大的定制功能与完善的提示机制，您更可以精确控制系统中每一个应用的权限，同时不放过任何一次可疑的操作。对于没有获取root权限的用户，您依旧可以使用我们的流量控制，电话短信防火墙，系统优化清理等功能。',1,NULL,NULL,1,32,2000,1,'2016-08-22 11:47:11',NULL,NULL,1,3,'/AppInfoSystem/statics/uploadfiles/com.lbe.security.jpg','D:\\soft\\apache-tomcat-7.0.41\\webapps\\AppInfoSystem\\statics\\uploadfiles\\com.lbe.security.jpg',NULL),(50,'应用锁:Smart App Protector','com.sp.protector.free','2.3及更高版本','简体中文','3.00',NULL,1,'Smart App Protector是一款应用锁定程序，可以实现当您打开某个应用时进行密码保护，从而保护用户的隐私问题。',1,NULL,NULL,1,32,5000,1,'2016-08-22 11:49:12',NULL,NULL,1,3,'/AppInfoSystem/statics/uploadfiles/com.sp.protector.free.jpg','D:\\soft\\apache-tomcat-7.0.41\\webapps\\AppInfoSystem\\statics\\uploadfiles\\com.sp.protector.free.jpg',NULL),(51,'谷歌拼音输入法','com.google.android.inputmethod.pinyin','4.2及更高版本','简体中文','16.00',NULL,1,'谷歌拼音输入法是一款专门用于输入中文的输入法，提供了多种方便的输入方式：\r\n- 全键盘拼音支持中文滑行输入和智能纠错\r\n- 9键键盘拼音支持中文滑行输入\r\n- 笔画键盘\r\n- 全屏和半屏手写键盘\r\n- 英文键盘\r\n- 模糊拼音\r\n- 双拼\r\n- 针对各种不同屏幕尺寸优化的UI布局\r\n- 语音输入\r\n不仅支持输入简体中文、繁体中文，还支持标点符号、表情符号、拉丁字符和数字。语音输入法使用基于互联网的语音识别服务，以提供高精度的输入匹配。\r\n\r\n注意：要在你的Android设备上使用该输入法，请在 “设置”→“语言和输入法”中开启。\r\n\r\n如需输入粤语，请下载谷歌粤语输入法\r\nhttps://play.google.com/store/apps/details?id=com.google.android.apps.inputmethod.cantonese\r\n\r\n如需使用注音或者倉頡输入繁体中文，请下载谷歌注音输入法\r\nhttps://play.google.com/store/apps/details?id=com.google.android.apps.inputmethod.zhuyin',1,NULL,NULL,3,29,8000,1,'2016-08-22 11:53:23',NULL,NULL,1,3,'/AppInfoSystem/statics/uploadfiles/com.google.android.inputmethod.pinyin.jpg','D:\\soft\\apache-tomcat-7.0.41\\webapps\\AppInfoSystem\\statics\\uploadfiles\\com.google.android.inputmethod.pinyin.jpg',37),(52,'RE管理器:Root Explorer','com.speedsoftware.rootexplorer','2.3及更高版本','简体中文','3.00',NULL,1,'RootExplorer 需要 ROOT 权限，新建文件夹，查看 / 编辑文件，软件安装，RootExplorer 具备普通文件管理器的各项基本功能，另外还添加了搜索功能，在手机上找东西变得更加方便。此外，RootExplorer 最大的特点在于它能够删除手机中自带的应用程序，如 GOOGLEMAP,CONTACTS,MARKET,GTALK 等等。',1,NULL,NULL,1,30,2340,1,'2016-08-22 11:55:14',NULL,NULL,1,3,'/AppInfoSystem/statics/uploadfiles/com.speedsoftware.rootexplorer.jpg','D:\\soft\\apache-tomcat-7.0.41\\webapps\\AppInfoSystem\\statics\\uploadfiles\\com.speedsoftware.rootexplorer.jpg',38),(53,'关屏锁定:Screen Off and Lock','com.katecca.screenofflockdonate','2.2及更高版本','简体中文','1.00',NULL,1,'关屏锁定Screen Off and Lock能实现只需点击一下即可关闭屏幕及锁定手机，支持设定关屏动画及音效 ，不是widget，可以放在任何地方，同时支持通知栏激活或者长按搜索键激活。',1,NULL,NULL,1,37,20,1,'2016-08-22 13:07:11',NULL,NULL,1,4,'/AppInfoSystem/statics/uploadfiles/com.katecca.screenofflockdonate.jpg','D:\\soft\\apache-tomcat-7.0.41\\webapps\\AppInfoSystem\\statics\\uploadfiles\\com.katecca.screenofflockdonate.jpg',NULL),(54,'重力锁屏:Gravity Screen Off Pro','com.plexnor.gravityscreenoffpro','2.2及更高版本','英文软件','1.00',NULL,1,'重力锁屏Gravity Screen Off Pro可以让手机在特定的条件下自动开启/关闭屏幕（例如放入口袋、放在桌面上、在传感器前挥手、移动手机等），而且识别度相当准确，你可以在设置中随意设置任意角度，当你把手机按这个角度（或者比这个角度小）放入口袋、桌面上时，屏幕就会自动关闭。日常使用起来节省了不少手动开屏/关屏的时间，这个才是真正的与科技接轨！\r\n功能说明：\r\n* 支持识别手机是否在口袋中，可以自定义在口袋中识别设备放置的角度、方向；\r\n* 支持识别手机是否在桌面上，可以自定义在桌面上识别设备放置的角度；\r\n* 识别设备正面、反面放置；\r\n* 可以是使用距离传感器、重力传感器进行识别；\r\n* 可以通过识别动作（例如挥手、移动手机等）来开启/关闭屏幕）；\r\n* 可以自定识别灵敏度；\r\n* 支持在插入而且后启用传感器来自动开启/关闭屏幕；\r\n* 支持开机自动启用服务；\r\n* 可以在通知栏显示启用/停用服务的快捷方式。',1,NULL,NULL,1,37,23,1,'2016-08-22 13:08:24',NULL,NULL,1,4,'/AppInfoSystem/statics/uploadfiles/com.plexnor.gravityscreenoffpro.jpg','D:\\soft\\apache-tomcat-7.0.41\\webapps\\AppInfoSystem\\statics\\uploadfiles\\com.plexnor.gravityscreenoffpro.jpg',NULL),(55,'机械迷城:Machinarium','air.net.machinarium.Machinarium.GP','2.3及更高版本','英文软件','11.00',NULL,1,'机械迷城Machinarium是一款解密冒险游戏，玩家可以在城市里随意的走动，跟场景或是其他同样是机器人互动，了解他们的需求以及帮忙他们，一步一步往事件的核心探索。 ',3,NULL,NULL,1,43,277,1,'2016-08-22 13:09:44',NULL,NULL,2,20,'/AppInfoSystem/statics/uploadfiles/air.net.machinarium.Machinarium.GP.jpg','D:\\soft\\apache-tomcat-7.0.41\\webapps\\AppInfoSystem\\statics\\uploadfiles\\air.net.machinarium.Machinarium.GP.jpg',36),(56,'Dont Starve饥荒','com.kleientertainment.doNotStarvePocket','4.0.3及更高版本','英文软件','4.00',NULL,1,'Don`t Starve: Pocket Edition移动版将深受超过4百万玩家喜爱的热门PC游戏移植到了安卓平台。现在你可以随时随地进入充满科学和魔法元素的世界，体验原汁原味的荒野生存游戏！\r\n你扮演威尔逊，一位被困住并传送到神秘荒野世界的勇敢无畏的绅士科学家。如果威尔逊希望逃出生天并找到回家的路，他必须充分利用所处的环境及这里的各种生物。\r\n进入一个光怪陆离而未经探索的世界，这里充满了奇怪的生物以及形形色色的危险和意外。收集资源以制作符合你的生存风格的物品和建筑。一路解开这块奇怪大陆上的各种谜团。',5,NULL,'2016-08-22 13:28:16',2,41,390,1,'2016-08-22 13:11:51',1,NULL,2,19,'/AppInfoSystem/statics/uploadfiles/com.kleientertainment.doNotStarvePocket.jpg','D:\\soft\\apache-tomcat-7.0.41\\webapps\\AppInfoSystem\\statics\\uploadfiles\\com.kleientertainment.doNotStarvePocket.jpg',42),(57,'机械世界:Apparatus','com.bithack.apparatus','1.6及更高版本','英文软件','11.00',NULL,1,'在机械世界Apparatus游戏中你需要利用木板、钉子、绳索、圆轮等等各种道具搭建从简单到复杂的机械结构，使得小球可以最终滚落到蓝色方框中。可以利用的可不止重力，包括杠杆原理、滑轮等等，尤其是后面的关卡，你需要足够灵活的头脑才能解决问题，可玩性还是非常高的。',3,NULL,NULL,1,44,255,1,'2016-08-22 13:13:27',NULL,NULL,2,20,'/AppInfoSystem/statics/uploadfiles/com.bithack.apparatus.jpg','D:\\soft\\apache-tomcat-7.0.41\\webapps\\AppInfoSystem\\statics\\uploadfiles\\com.bithack.apparatus.jpg',41),(58,'沙盘玩具:The Powder Toy','com.doodleapps.powdertoy','2.2及更高版本','英文软件','1.00',NULL,1,'沙盘玩具The Powder Toy是一款模拟类游戏。想过自己建造核电站吗？或者自己做一个CPU？你甚至可以创建一个虚拟网络。沙盘玩具可以模拟空气的压力，速度，热，重力和无数的不同物质之间的相互作用，游戏提供各种形态的建材，用以构建复杂的机器或是电子元件，你可以模拟超酷的爆炸或是布线出复杂的机器人。欢迎提交您的作品。',4,NULL,'2016-08-22 13:27:42',3,44,2000,1,'2016-08-22 13:14:56',1,NULL,2,20,'/AppInfoSystem/statics/uploadfiles/com.doodleapps.powdertoy.jpg','D:\\soft\\apache-tomcat-7.0.41\\webapps\\AppInfoSystem\\statics\\uploadfiles\\com.doodleapps.powdertoy.jpg',40);

/*Table structure for table `app_version` */

DROP TABLE IF EXISTS `app_version`;

CREATE TABLE `app_version` (
  `id` bigint(30) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `appId` bigint(30) DEFAULT NULL COMMENT 'appId（来源于：app_info表的主键id）',
  `versionNo` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '版本号',
  `versionInfo` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '版本介绍',
  `publishStatus` bigint(30) DEFAULT NULL COMMENT '发布状态（来源于：data_dictionary，1 不发布 2 已发布 3 预发布）',
  `downloadLink` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '下载链接',
  `versionSize` decimal(20,2) DEFAULT NULL COMMENT '版本大小（单位：M）',
  `createdBy` bigint(30) DEFAULT NULL COMMENT '创建者（来源于dev_user开发者信息表的用户id）',
  `creationDate` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyBy` bigint(30) DEFAULT NULL COMMENT '更新者（来源于dev_user开发者信息表的用户id）',
  `modifyDate` datetime DEFAULT NULL COMMENT '最新更新时间',
  `apkLocPath` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'apk文件的服务器存储路径',
  `apkFileName` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '上传的apk文件名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `app_version` */

insert  into `app_version`(`id`,`appId`,`versionNo`,`versionInfo`,`publishStatus`,`downloadLink`,`versionSize`,`createdBy`,`creationDate`,`modifyBy`,`modifyDate`,`apkLocPath`,`apkFileName`) values (33,58,'V1.1.1','V1.1.1版本简介',3,'/AppInfoSystem/statics/uploadfiles/com.doodleapps.powdertoy-V1.1.31.apk','1.00',1,'2016-08-22 13:17:47',NULL,NULL,'D:\\soft\\apache-tomcat-7.0.41\\webapps\\AppInfoSystem\\statics\\uploadfiles\\com.doodleapps.powdertoy-V1.1.31.apk','com.doodleapps.powdertoy-V1.1.31.apk'),(34,57,'V1.1.1','              V1.1.1版本简介',3,'/AppInfoSystem/statics/uploadfiles/com.bithack.apparatus-V1.1.1.apk','11.00',1,'2016-08-22 13:19:42',1,'2016-08-22 13:19:54','D:\\soft\\apache-tomcat-7.0.41\\webapps\\AppInfoSystem\\statics\\uploadfiles\\com.bithack.apparatus-V1.1.1.apk','com.bithack.apparatus-V1.1.1.apk'),(35,56,'V1.1.1','              V1.1.1简介',2,'/AppInfoSystem/statics/uploadfiles/com.kleientertainment.doNotStarvePocket-V1.1.1.apk','4.00',1,'2016-08-22 13:21:12',1,'2016-08-22 13:28:07','D:\\soft\\apache-tomcat-7.0.41\\webapps\\AppInfoSystem\\statics\\uploadfiles\\com.kleientertainment.doNotStarvePocket-V1.1.1.apk','com.kleientertainment.doNotStarvePocket-V1.1.1.apk'),(36,55,'V1.1.1','              V1.1.1简介',3,'/AppInfoSystem/statics/uploadfiles/air.net.machinarium.Machinarium.GP-V1.1.1.apk','11.00',1,'2016-08-22 13:21:40',1,'2016-08-22 13:21:57','D:\\soft\\apache-tomcat-7.0.41\\webapps\\AppInfoSystem\\statics\\uploadfiles\\air.net.machinarium.Machinarium.GP-V1.1.1.apk','air.net.machinarium.Machinarium.GP-V1.1.1.apk'),(37,51,'V1.1.1','V1.1.1简介',3,'/AppInfoSystem/statics/uploadfiles/com.google.android.inputmethod.pinyin-V1.1.1.apk','16.00',1,'2016-08-22 13:24:07',NULL,NULL,'D:\\soft\\apache-tomcat-7.0.41\\webapps\\AppInfoSystem\\statics\\uploadfiles\\com.google.android.inputmethod.pinyin-V1.1.1.apk','com.google.android.inputmethod.pinyin-V1.1.1.apk'),(38,52,'V1.1.1','V1.1.1简介',3,'/AppInfoSystem/statics/uploadfiles/com.speedsoftware.rootexplorer-V1.1.1.apk','3.00',1,'2016-08-22 13:24:35',NULL,NULL,'D:\\soft\\apache-tomcat-7.0.41\\webapps\\AppInfoSystem\\statics\\uploadfiles\\com.speedsoftware.rootexplorer-V1.1.1.apk','com.speedsoftware.rootexplorer-V1.1.1.apk'),(39,58,'V1.1.2','V1.1.2',3,'/AppInfoSystem/statics/uploadfiles/com.doodleapps.powdertoy-V1.1.2.apk','2.00',1,'2016-08-22 13:26:15',NULL,NULL,'D:\\soft\\apache-tomcat-7.0.41\\webapps\\AppInfoSystem\\statics\\uploadfiles\\com.doodleapps.powdertoy-V1.1.2.apk','com.doodleapps.powdertoy-V1.1.2.apk'),(40,58,'V1.1.3','V1.1.3简介',2,'/AppInfoSystem/statics/uploadfiles/com.doodleapps.powdertoy-V1.1.3.apk','2.00',1,'2016-08-22 13:26:47',1,'2016-08-22 13:27:42','D:\\soft\\apache-tomcat-7.0.41\\webapps\\AppInfoSystem\\statics\\uploadfiles\\com.doodleapps.powdertoy-V1.1.3.apk','com.doodleapps.powdertoy-V1.1.3.apk'),(41,57,'V1.1.2','              V1.1.2简介',3,'/AppInfoSystem/statics/uploadfiles/com.bithack.apparatus-V1.1.2.apk','11.00',1,'2016-08-22 13:27:32',1,'2016-08-22 15:08:04','D:\\soft\\apache-tomcat-7.0.41\\webapps\\AppInfoSystem\\statics\\uploadfiles\\com.bithack.apparatus-V1.1.2.apk','com.bithack.apparatus-V1.1.2.apk'),(42,56,'V1.1.2','V1.1.2简介',3,'/AppInfoSystem/statics/uploadfiles/com.kleientertainment.doNotStarvePocket-V1.1.2.apk','4.00',1,'2016-08-22 15:00:32',NULL,NULL,'D:\\soft\\apache-tomcat-7.0.41\\webapps\\AppInfoSystem\\statics\\uploadfiles\\com.kleientertainment.doNotStarvePocket-V1.1.2.apk','com.kleientertainment.doNotStarvePocket-V1.1.2.apk');

/*Table structure for table `backend_user` */

DROP TABLE IF EXISTS `backend_user`;

CREATE TABLE `backend_user` (
  `id` bigint(30) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `userCode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户编码',
  `userName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户名称',
  `userType` bigint(30) DEFAULT NULL COMMENT '用户角色类型（来源于数据字典表，分为：超管、财务、市场、运营、销售）',
  `createdBy` bigint(30) DEFAULT NULL COMMENT '创建者（来源于backend_user用户表的用户id）',
  `creationDate` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyBy` bigint(30) DEFAULT NULL COMMENT '更新者（来源于backend_user用户表的用户id）',
  `modifyDate` datetime DEFAULT NULL COMMENT '最新更新时间',
  `userPassword` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `backend_user` */

insert  into `backend_user`(`id`,`userCode`,`userName`,`userType`,`createdBy`,`creationDate`,`modifyBy`,`modifyDate`,`userPassword`) values (1,'admin','系统管理员',1,1,'2016-08-20 00:13:41',NULL,NULL,'123456');

/*Table structure for table `data_dictionary` */

DROP TABLE IF EXISTS `data_dictionary`;

CREATE TABLE `data_dictionary` (
  `id` bigint(30) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `typeCode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '类型编码',
  `typeName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '类型名称',
  `valueId` bigint(30) DEFAULT NULL COMMENT '类型值ID',
  `valueName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '类型值Name',
  `createdBy` bigint(30) DEFAULT NULL COMMENT '创建者（来源于backend_user用户表的用户id）',
  `creationDate` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyBy` bigint(30) DEFAULT NULL COMMENT '更新者（来源于backend_user用户表的用户id）',
  `modifyDate` datetime DEFAULT NULL COMMENT '最新更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `data_dictionary` */

insert  into `data_dictionary`(`id`,`typeCode`,`typeName`,`valueId`,`valueName`,`createdBy`,`creationDate`,`modifyBy`,`modifyDate`) values (1,'USER_TYPE','用户类型',1,'超级管理员',1,'2016-08-12 18:11:47',NULL,NULL),(2,'USER_TYPE','用户类型',2,'财务',1,'2016-08-12 18:11:47',NULL,NULL),(3,'USER_TYPE','用户类型',3,'市场',1,'2016-08-12 18:11:47',NULL,NULL),(4,'USER_TYPE','用户类型',4,'运营',1,'2016-08-12 18:11:47',NULL,NULL),(5,'USER_TYPE','用户类型',5,'销售',1,'2016-08-12 18:11:47',NULL,NULL),(6,'APP_STATUS','APP状态',1,'待审核',1,'2016-08-12 18:11:47',NULL,NULL),(7,'APP_STATUS','APP状态',2,'审核通过',1,'2016-08-12 18:11:47',NULL,NULL),(8,'APP_STATUS','APP状态',3,'审核未通过',1,'2016-08-12 18:11:47',NULL,NULL),(9,'APP_STATUS','APP状态',4,'已上架',1,'2016-08-12 18:11:47',NULL,NULL),(10,'APP_STATUS','APP状态',5,'已下架',1,'2016-08-12 18:11:47',NULL,NULL),(11,'APP_FLATFORM','所属平台',1,'手机',1,'2016-08-12 18:11:47',NULL,NULL),(12,'APP_FLATFORM','所属平台',2,'平板',1,'2016-08-12 18:11:47',NULL,NULL),(14,'PUBLISH_STATUS','发布状态',1,'不发布',1,'2016-08-12 18:11:47',NULL,NULL),(15,'PUBLISH_STATUS','发布状态',2,'已发布',1,'2016-08-12 18:11:47',NULL,NULL),(16,'PUBLISH_STATUS','发布状态',3,'预发布',1,'2016-08-12 18:11:47',NULL,NULL),(13,'APP_FLATFORM','所属平台',3,'通用',1,'2016-08-12 18:11:47',NULL,NULL);

/*Table structure for table `dev_user` */

DROP TABLE IF EXISTS `dev_user`;

CREATE TABLE `dev_user` (
  `id` bigint(30) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `devCode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '开发者帐号',
  `devName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '开发者名称',
  `devPassword` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '开发者密码',
  `devEmail` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '开发者电子邮箱',
  `devInfo` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '开发者简介',
  `createdBy` bigint(30) DEFAULT NULL COMMENT '创建者（来源于backend_user用户表的用户id）',
  `creationDate` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyBy` bigint(30) DEFAULT NULL COMMENT '更新者（来源于backend_user用户表的用户id）',
  `modifyDate` datetime DEFAULT NULL COMMENT '最新更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `dev_user` */

insert  into `dev_user`(`id`,`devCode`,`devName`,`devPassword`,`devEmail`,`devInfo`,`createdBy`,`creationDate`,`modifyBy`,`modifyDate`) values (1,'test001','测试账户001','123456',NULL,NULL,1,'2016-08-20 00:13:41',NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
