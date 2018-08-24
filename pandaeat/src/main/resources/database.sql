/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50723
Source Host           : localhost:3306
Source Database       : pandaeat

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2018-08-23 10:56:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cms_admin
-- ----------------------------
DROP TABLE IF EXISTS `cms_admin`;
CREATE TABLE `cms_admin` (
  `adminid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `storeid` int(10) unsigned NOT NULL COMMENT '商店id',
  `name` varchar(255) NOT NULL COMMENT '账号',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `createtime` varchar(255) NOT NULL COMMENT '发起时间',
  PRIMARY KEY (`adminid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of cms_admin
-- ----------------------------

-- ----------------------------
-- Table structure for pe_cat
-- ----------------------------
DROP TABLE IF EXISTS `pe_cat`;
CREATE TABLE `pe_cat` (
  `catid` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品类别',
  `storeid` int(10) unsigned NOT NULL COMMENT '商店id',
  `createtime` int(10) unsigned NOT NULL COMMENT '注册时间',
  `catname` varchar(20) NOT NULL COMMENT '类别名',
  PRIMARY KEY (`catid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of pe_cat
-- ----------------------------

-- ----------------------------
-- Table structure for pe_food
-- ----------------------------
DROP TABLE IF EXISTS `pe_food`;
CREATE TABLE `pe_food` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storeid` int(10) unsigned NOT NULL COMMENT '商店id',
  `name` varchar(255) NOT NULL COMMENT '商品名称',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '售价',
  `originalprice` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '原价（只做显示用）',
  `detail` longtext NOT NULL COMMENT '商品详情，图文',
  `catid` int(11) NOT NULL DEFAULT '0' COMMENT '商品类别',
  `status` smallint(1) NOT NULL DEFAULT '0' COMMENT '上架状态：0=下架，1=上架',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `score` int(3) NOT NULL DEFAULT '0',
  `isdelete` smallint(1) NOT NULL DEFAULT '0',
  `virtualsales` int(11) DEFAULT '0' COMMENT '虚拟销量',
  `compressimg` longtext COMMENT '商品缩略图',
  `img` longtext COMMENT '商品原图',
  `videourl` longtext COMMENT '视频',
  `realsales` int(11) DEFAULT '0' COMMENT '真实销量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of pe_food
-- ----------------------------

-- ----------------------------
-- Table structure for pe_order
-- ----------------------------
DROP TABLE IF EXISTS `pe_order`;
CREATE TABLE `pe_order` (
  `storeid` int(10) unsigned NOT NULL COMMENT '商店id',
  `seatid` int(10) unsigned NOT NULL COMMENT '座位id',
  `orderid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `usrid` int(10) unsigned NOT NULL COMMENT '订单id',
  `createtime` varchar(255) NOT NULL COMMENT '发起时间',
  `ordercontent` json NOT NULL COMMENT '订单内容',
  `orderprice` varchar(255) NOT NULL COMMENT '订单价格',
  `customernum` int(11) NOT NULL DEFAULT '0',
  `orderstatue` smallint(1) NOT NULL DEFAULT '0' COMMENT '订单状态 0--待确认  1--已确认  2--未付款  3--订单结束',
  `endtime` varchar(255) NOT NULL COMMENT '结束时间',
  `payway` smallint(1) NOT NULL DEFAULT '0' COMMENT '支付方式 0--微信支付  1--支付宝  2--银行卡  3--现金',
  PRIMARY KEY (`orderid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of pe_order
-- ----------------------------

-- ----------------------------
-- Table structure for pe_store
-- ----------------------------
DROP TABLE IF EXISTS `pe_store`;
CREATE TABLE `pe_store` (
  `storeid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商店id',
  `createtime` int(10) unsigned NOT NULL COMMENT '注册时间',
  `nickname` varchar(20) NOT NULL COMMENT '商店名字',
  `avatar` longtext COMMENT '商店头像',
  `mobile` varchar(11) NOT NULL COMMENT '商店电话',
  `ordernum` int(10) unsigned NOT NULL COMMENT '营业订单数量',
  `orderprice` varchar(11) NOT NULL COMMENT '营业订单总额',
  `usernum` int(10) unsigned NOT NULL COMMENT '活跃量 即人数',
  PRIMARY KEY (`storeid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of pe_store
-- ----------------------------

-- ----------------------------
-- Table structure for pe_user
-- ----------------------------
DROP TABLE IF EXISTS `pe_user`;
CREATE TABLE `pe_user` (
  `storeid` int(10) unsigned NOT NULL COMMENT '商店id',
  `userid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `openid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户openid',
  `createtime` int(10) unsigned NOT NULL COMMENT '注册时间',
  `nickname` varchar(20) NOT NULL COMMENT '用户名',
  `avatar` longtext COMMENT '用户头像',
  `mobile` varchar(11) NOT NULL COMMENT '用户电话',
  `gender` tinyint(1) NOT NULL COMMENT '用户性别',
  `ordernum` int(10) unsigned NOT NULL COMMENT '订单数量',
  `orderprice` varchar(11) NOT NULL COMMENT '订单总价值',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of pe_user
-- ----------------------------