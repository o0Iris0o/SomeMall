# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.10)
# Database: somemall
# Generation Time: 2016-08-10 15:03:05 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table mall_addr
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mall_addr`;

CREATE TABLE `mall_addr` (
  `addrid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `userid` int(20) NOT NULL COMMENT '用户ID',
  `receivername` varchar(80) NOT NULL COMMENT '收货人',
  `city` varchar(255) DEFAULT 'DEFAULTSTRING' COMMENT '城市地区',
  `addr` varchar(400) NOT NULL DEFAULT 'DEFAULTSTRING' COMMENT '收货地址',
  `phone` varchar(60) NOT NULL COMMENT '手机号或是固定电话号',
  `isdef` char(1) NOT NULL DEFAULT '0' COMMENT '是否默认',
  `isdel` char(1) NOT NULL DEFAULT '0' COMMENT '是否被删除，默认0，0正常／1已删除',
  PRIMARY KEY (`addrid`),
  KEY `userid` (`userid`),
  CONSTRAINT `mall_addr_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `mall_user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收货地址';



# Dump of table mall_cart
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mall_cart`;

CREATE TABLE `mall_cart` (
  `cartid` int(11) NOT NULL AUTO_INCREMENT,
  `itemid` int(11) DEFAULT NULL COMMENT '购物车中的某商品的id',
  `amount` int(11) DEFAULT NULL COMMENT '购物车在中的某商品数量',
  `userid` int(11) DEFAULT NULL COMMENT '这条记录所属的账户userid',
  `isdel` char(1) NOT NULL DEFAULT '0' COMMENT '是否被删除，默认0，0正常／1已删除',
  PRIMARY KEY (`cartid`),
  KEY `FK_ITEM_CART_ITEMID` (`itemid`),
  KEY `FK_USER_CART_USERID` (`userid`),
  CONSTRAINT `mall_cart_ibfk_1` FOREIGN KEY (`itemid`) REFERENCES `mall_item` (`itemid`) ON UPDATE CASCADE,
  CONSTRAINT `mall_cart_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `mall_user` (`userid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车';



# Dump of table mall_city
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mall_city`;

CREATE TABLE `mall_city` (
  `cityid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` char(6) NOT NULL COMMENT '城市编码',
  `name` varchar(40) NOT NULL COMMENT '城市名称',
  `province` char(6) NOT NULL COMMENT '所属省份编码',
  PRIMARY KEY (`cityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='城市信息表';



# Dump of table mall_collect
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mall_collect`;

CREATE TABLE `mall_collect` (
  `collectid` int(20) NOT NULL AUTO_INCREMENT,
  `itemid` int(20) NOT NULL COMMENT '商品ID',
  `userid` int(20) NOT NULL COMMENT '用户ID',
  `isdel` char(1) NOT NULL DEFAULT '0' COMMENT '是否被删除，默认0，0正常／1已删除',
  `rate` double NOT NULL DEFAULT '3',
  PRIMARY KEY (`collectid`),
  KEY `FK_ITEM_COLLECT_ITEMID` (`itemid`),
  KEY `FK_USER_COLLECT_USERID` (`userid`),
  CONSTRAINT `mall_collect_ibfk_1` FOREIGN KEY (`itemid`) REFERENCES `mall_item` (`itemid`),
  CONSTRAINT `mall_collect_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `mall_user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品收藏表';



# Dump of table mall_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mall_item`;

CREATE TABLE `mall_item` (
  `itemid` int(20) NOT NULL AUTO_INCREMENT,
  `itemname` varchar(108) DEFAULT NULL COMMENT '某项商品的名字',
  `catid` int(11) DEFAULT NULL COMMENT '这件商品所属的商品种类id',
  `price` double DEFAULT NULL COMMENT '单价，单位元',
  `num` int(10) NOT NULL COMMENT '库存数量',
  `status` char(1) NOT NULL DEFAULT '1' COMMENT '商品状态，1-正常，2-下架，3-删除',
  `datajson` text COMMENT '此商品所具有的参数值，格式为json格式',
  `sellpoint` varchar(500) DEFAULT NULL COMMENT '商品卖点, 简短描述，商品简介',
  `image` varchar(500) DEFAULT 'images/item/itemG/itemmain.png' COMMENT '商品图片',
  `itemdescrip` text COMMENT '商品描述,商品详细介绍，HTML格式',
  `isdel` char(1) NOT NULL DEFAULT '0' COMMENT '是否被删除，默认0，0正常／1已删除',
  `displayname` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`itemid`),
  KEY `FK_ITEMCAT_ITEM_CATID` (`catid`),
  CONSTRAINT `mall_item_ibfk_1` FOREIGN KEY (`catid`) REFERENCES `mall_itemcat` (`catid`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品项表';



# Dump of table mall_itemcat
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mall_itemcat`;

CREATE TABLE `mall_itemcat` (
  `catid` int(11) NOT NULL AUTO_INCREMENT,
  `catname` varchar(36) DEFAULT NULL COMMENT '商品种类名',
  `parentid` int(11) DEFAULT NULL COMMENT '商品parentid=catid时，代表的是一级的类目',
  `paramjson` text COMMENT '此种商品所具有的参数键,格式为json格式',
  `isparent` char(1) DEFAULT '0' COMMENT '该类目是否为父类目，1为true，0为false',
  `isdel` char(1) NOT NULL DEFAULT '0' COMMENT '是否被删除，默认0，0正常／1已删除',
  PRIMARY KEY (`catid`),
  KEY `FK_ITEMCAT_ITEMCAT_PARENTID` (`parentid`),
  CONSTRAINT `mall_itemcat_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `mall_itemcat` (`catid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品种类表';



# Dump of table mall_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mall_order`;

CREATE TABLE `mall_order` (
  `orderid` int(11) NOT NULL AUTO_INCREMENT,
  `ordershowid` varchar(36) DEFAULT NULL COMMENT '将创建订单的17位UNIX时间作为订单id',
  `userid` int(11) DEFAULT NULL COMMENT '订单所属的账户id',
  `ordertotalprice` double DEFAULT NULL COMMENT '订单的总价值',
  `addrid` int(11) DEFAULT NULL COMMENT '此订单的收货地址id',
  `ispay` char(1) DEFAULT '1' COMMENT '订单是否已付款;0、未付款，1、已付款',
  `state` char(1) DEFAULT '4' COMMENT '0待确认/1待发货/2已发货/3到货/4已签收/5退货申请中/6退货中/7已退货',
  `isdel` char(1) NOT NULL DEFAULT '0' COMMENT '是否被删除，默认0，0正常／1已删除',
  `orderdate` date DEFAULT NULL,
  PRIMARY KEY (`orderid`),
  KEY `FK_ADDR_ORDER_ADDRID` (`addrid`),
  KEY `FK_USER_ORDER_USERID` (`userid`),
  CONSTRAINT `mall_order_ibfk_1` FOREIGN KEY (`addrid`) REFERENCES `mall_addr` (`addrid`),
  CONSTRAINT `mall_order_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `mall_user` (`userid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';



# Dump of table mall_orderitem
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mall_orderitem`;

CREATE TABLE `mall_orderitem` (
  `orderitemid` int(11) NOT NULL AUTO_INCREMENT,
  `itemid` int(11) NOT NULL COMMENT '订单中的商品id',
  `itemname` varchar(108) NOT NULL,
  `displayname` varchar(20) NOT NULL,
  `price` double NOT NULL COMMENT '单价',
  `amount` int(11) NOT NULL DEFAULT '1' COMMENT '数量',
  `itemtotalprice` bigint(50) NOT NULL COMMENT '商品总金额',
  `orderid` int(11) NOT NULL COMMENT '所属订单id',
  `isdel` char(1) NOT NULL DEFAULT '0' COMMENT '是否被删除，默认0，0正常／1已删除',
  `rate` double NOT NULL DEFAULT '3.5',
  `userid` int(20) NOT NULL,
  PRIMARY KEY (`orderitemid`),
  KEY `FK_ORDER_ORDERITEM_ORDERID` (`orderid`),
  KEY `FK_ITEM_ORDERITEM_ITEMID` (`itemid`),
  CONSTRAINT `mall_orderitem_ibfk_1` FOREIGN KEY (`itemid`) REFERENCES `mall_item` (`itemid`) ON UPDATE CASCADE,
  CONSTRAINT `mall_orderitem_ibfk_2` FOREIGN KEY (`orderid`) REFERENCES `mall_order` (`orderid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单中包含的商品项目表';



# Dump of table mall_pic
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mall_pic`;

CREATE TABLE `mall_pic` (
  `picid` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL COMMENT '图片的地址',
  `itemid` int(11) DEFAULT NULL COMMENT '图片所属的商品id',
  `isdefault` char(1) DEFAULT NULL COMMENT '是否是默认展示的图片',
  PRIMARY KEY (`picid`),
  KEY `FK_ITEM_PIC_ITEMID` (`itemid`),
  CONSTRAINT `mall_pic_ibfk_1` FOREIGN KEY (`itemid`) REFERENCES `mall_item` (`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品图片';



# Dump of table mall_province
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mall_province`;

CREATE TABLE `mall_province` (
  `province` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` char(6) NOT NULL COMMENT '省份编码',
  `name` varchar(40) NOT NULL COMMENT '省份名称',
  PRIMARY KEY (`province`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='省份信息表';



# Dump of table mall_town
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mall_town`;

CREATE TABLE `mall_town` (
  `townid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` char(6) NOT NULL COMMENT '区县编码',
  `name` varchar(40) NOT NULL COMMENT '区县名称',
  `city` char(6) NOT NULL COMMENT '所属城市编码',
  PRIMARY KEY (`townid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区县信息表';



# Dump of table mall_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mall_user`;

CREATE TABLE `mall_user` (
  `userid` int(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码，加密存储',
  `phone` varchar(20) DEFAULT '*********' COMMENT '注册手机号',
  `email` varchar(50) DEFAULT '*********' COMMENT '注册邮箱',
  `role` char(1) NOT NULL DEFAULT '0' COMMENT '角色，1管理员 0普通用户',
  `isdel` char(1) NOT NULL DEFAULT '0' COMMENT '是否被删除，默认0，0正常／1已删除',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
