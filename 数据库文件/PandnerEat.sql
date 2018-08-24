/*
 Navicat Premium Data Transfer

 Source Server         : pandaeat
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : 120.78.174.107:3306
 Source Schema         : pandaeat

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 25/08/2018 01:22:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cms_admin
-- ----------------------------
DROP TABLE IF EXISTS `cms_admin`;
CREATE TABLE `cms_admin`  (
  `adminid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `storeid` int(10) UNSIGNED NOT NULL COMMENT '商店id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `createtime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发起时间',
  PRIMARY KEY (`adminid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1000 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pe_cat
-- ----------------------------
DROP TABLE IF EXISTS `pe_cat`;
CREATE TABLE `pe_cat`  (
  `catid` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品类别',
  `storeid` int(10) UNSIGNED NOT NULL COMMENT '商店id',
  `createtime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '注册时间',
  `catname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类别名',
  PRIMARY KEY (`catid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1000 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pe_food
-- ----------------------------
DROP TABLE IF EXISTS `pe_food`;
CREATE TABLE `pe_food`  (
  `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `storeid` int(10) UNSIGNED NOT NULL COMMENT '商店id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '售价',
  `originalprice` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '原价（只做显示用）',
  `detail` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品详情，图文',
  `catid` int(11) NOT NULL DEFAULT 0 COMMENT '商品类别',
  `status` smallint(1) NOT NULL DEFAULT 0 COMMENT '上架状态：0=下架，1=上架',
  `addtime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `score` int(3) NOT NULL DEFAULT 0,
  `isdelete` smallint(1) NOT NULL DEFAULT 0,
  `virtualsales` int(11) NULL DEFAULT 0 COMMENT '虚拟销量',
  `compressimg` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品缩略图',
  `img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品原图',
  `videourl` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '视频',
  `realsales` int(11) NULL DEFAULT 0 COMMENT '真实销量',
  `goodsnums` int(11) NOT NULL DEFAULT 0 COMMENT '商品剩余量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1000 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pe_order
-- ----------------------------
DROP TABLE IF EXISTS `pe_order`;
CREATE TABLE `pe_order`  (
  `storeid` int(10) UNSIGNED NOT NULL COMMENT '商店id',
  `seatid` int(10) UNSIGNED NOT NULL COMMENT '座位id',
  `orderid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `usrid` int(10) UNSIGNED NOT NULL COMMENT '订单id',
  `createtime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发起时间',
  `ordercontent` json NOT NULL COMMENT '订单内容',
  `orderprice` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单价格',
  `customernum` int(11) NOT NULL DEFAULT 0,
  `orderstatue` smallint(1) NOT NULL DEFAULT 0 COMMENT '订单状态 0--待确认  1--已确认  2--未付款  3--订单结束',
  `endtime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '结束时间',
  `payway` smallint(1) NOT NULL DEFAULT 0 COMMENT '支付方式 0--微信支付  1--支付宝  2--银行卡  3--现金',
  `tips` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '用户评论',
  PRIMARY KEY (`orderid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1000 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pe_store
-- ----------------------------
DROP TABLE IF EXISTS `pe_store`;
CREATE TABLE `pe_store`  (
  `storeid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商店id',
  `createtime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '注册时间',
  `nickname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商店名字',
  `avatar` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商店头像',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商店电话',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商家地址',
  `selltime` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '营业时间',
  `foodscore` int(4) NOT NULL DEFAULT 100 COMMENT '食物评分',
  `severscore` int(4) NOT NULL DEFAULT 100 COMMENT '服务品分',
  `avescore` int(4) NOT NULL DEFAULT 100 COMMENT '平均评分',
  `notice` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商家优惠/提醒',
  `ordernum` int(10) UNSIGNED NOT NULL COMMENT '营业订单数量',
  `orderprice` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '营业订单总额',
  `usernum` int(10) UNSIGNED NOT NULL COMMENT '活跃量 即人数',
  PRIMARY KEY (`storeid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1000 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pe_user
-- ----------------------------
DROP TABLE IF EXISTS `pe_user`;
CREATE TABLE `pe_user`  (
  `storeid` int(10) UNSIGNED NOT NULL COMMENT '商店id',
  `userid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '用户openid',
  `createtime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '注册时间',
  `nickname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `avatar` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '用户头像',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户电话',
  `gender` tinyint(1) NOT NULL COMMENT '用户性别',
  `ordernum` int(10) UNSIGNED NOT NULL COMMENT '订单数量',
  `orderprice` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单总价值',
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1009 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pe_user
-- ----------------------------
INSERT INTO `pe_user` VALUES (11223, 1000, 'o4zMU0ftzt7k5LbToxYHnI3qiNDU', '\"2018-08-23 17:06:24\"', '简单DI年华', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLXE94zOq4ZNZ4p8Z35cnj5xKEBGXoOaccO5orgJFaAZe7SffaiaObDeO4mBL37zhEfG0eWJ5libL2A/132', '18642316507', 0, 0, '0');
INSERT INTO `pe_user` VALUES (11223, 1001, 'o4zMU0ftzt7k5LbToxYHnI3qiNDU', '\"2018-08-23 17:20:56\"', '简单DI年华', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLXE94zOq4ZNZ4p8Z35cnj5xKEBGXoOaccO5orgJFaAZe7SffaiaObDeO4mBL37zhEfG0eWJ5libL2A/132', '18642316507', 0, 0, '0');
INSERT INTO `pe_user` VALUES (11223, 1002, 'o4zMU0ftzt7k5LbToxYHnI3qiNDU', '\"2018-08-23 17:55:36\"', '简单DI年华', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLXE94zOq4ZNZ4p8Z35cnj5xKEBGXoOaccO5orgJFaAZe7SffaiaObDeO4mBL37zhEfG0eWJ5libL2A/132', '18642316507', 0, 0, '0');
INSERT INTO `pe_user` VALUES (11223, 1003, 'oGUyP4qjjipvK7_0wNx4KDHs_k8Q', '\"2018-08-23 19:52:04\"', '110', '111', '18642316507', 0, 0, '0');
INSERT INTO `pe_user` VALUES (11223, 1004, 'oGUyP4qjjipvK7_0wNx4KDHs_k8Q', '\"2018-08-23 19:55:52\"', '110', '111', '18642316507', 0, 0, '0');
INSERT INTO `pe_user` VALUES (11223, 1005, 'oGUyP4qjjipvK7_0wNx4KDHs_k8Q', '\"2018-08-23 19:56:23\"', '110', '111', '18642316507', 0, 0, '0');
INSERT INTO `pe_user` VALUES (11223, 1006, 'oGUyP4qjjipvK7_0wNx4KDHs_k8Q', '\"2018-08-23 19:56:35\"', '110', '111', '18642316507', 0, 0, '0');
INSERT INTO `pe_user` VALUES (11223, 1007, 'oGUyP4qjjipvK7_0wNx4KDHs_k8Q', '\"2018-08-23 19:56:44\"', '110', '111', '18642316507', 0, 0, '0');
INSERT INTO `pe_user` VALUES (11223, 1008, 'oGUyP4qjjipvK7_0wNx4KDHs_k8Q', '\"2018-08-23 19:56:53\"', '110', '111', '18642316507', 0, 0, '0');

SET FOREIGN_KEY_CHECKS = 1;
