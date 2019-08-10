/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : grogshop

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 18/01/2019 19:20:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for attribute
-- ----------------------------
DROP TABLE IF EXISTS `attribute`;
CREATE TABLE `attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '属性ID',
  `attributeName` varchar(30) DEFAULT NULL COMMENT '属性名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='状态表';

-- ----------------------------
-- Records of attribute
-- ----------------------------
BEGIN;
INSERT INTO `attribute` VALUES (1, '房态');
INSERT INTO `attribute` VALUES (2, '客房等级');
INSERT INTO `attribute` VALUES (3, '商品类别');
INSERT INTO `attribute` VALUES (4, '支付方式');
INSERT INTO `attribute` VALUES (5, '出租方式');
INSERT INTO `attribute` VALUES (6, '结账单位');
INSERT INTO `attribute` VALUES (7, '旅客类别');
INSERT INTO `attribute` VALUES (8, '性别');
INSERT INTO `attribute` VALUES (9, '民族');
INSERT INTO `attribute` VALUES (10, '证件');
INSERT INTO `attribute` VALUES (11, '文化程度');
INSERT INTO `attribute` VALUES (12, '事由');
INSERT INTO `attribute` VALUES (13, '旅客级别');
INSERT INTO `attribute` VALUES (14, '对象类别');
INSERT INTO `attribute` VALUES (15, '计量单位');
INSERT INTO `attribute` VALUES (16, '预定状态');
INSERT INTO `attribute` VALUES (17, '结账');
COMMIT;

-- ----------------------------
-- Table structure for attributedetails
-- ----------------------------
DROP TABLE IF EXISTS `attributedetails`;
CREATE TABLE `attributedetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '属性明细ID',
  `attributeID` int(11) DEFAULT NULL COMMENT '属性ID',
  `attributeDetailsName` varchar(30) DEFAULT NULL COMMENT '属性明细名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COMMENT='属性明细表';

-- ----------------------------
-- Records of attributedetails
-- ----------------------------
BEGIN;
INSERT INTO `attributedetails` VALUES (1, 1, '空房');
INSERT INTO `attributedetails` VALUES (2, 1, '自用房');
INSERT INTO `attributedetails` VALUES (4, 1, '预定');
INSERT INTO `attributedetails` VALUES (5, 1, '待清洁');
INSERT INTO `attributedetails` VALUES (6, 1, '待维修');
INSERT INTO `attributedetails` VALUES (7, 1, '不可用');
INSERT INTO `attributedetails` VALUES (8, 2, '单人普通房');
INSERT INTO `attributedetails` VALUES (9, 2, '单人标准间');
INSERT INTO `attributedetails` VALUES (10, 2, '二人普通房');
INSERT INTO `attributedetails` VALUES (11, 2, '二人标准间');
INSERT INTO `attributedetails` VALUES (12, 2, '豪华间');
INSERT INTO `attributedetails` VALUES (13, 2, '会议室');
INSERT INTO `attributedetails` VALUES (14, 2, '总统套房');
INSERT INTO `attributedetails` VALUES (15, 3, '餐饮类');
INSERT INTO `attributedetails` VALUES (16, 3, '饮料类');
INSERT INTO `attributedetails` VALUES (17, 3, '食品类');
INSERT INTO `attributedetails` VALUES (18, 3, '烟酒类');
INSERT INTO `attributedetails` VALUES (19, 3, '人为损坏类');
INSERT INTO `attributedetails` VALUES (20, 3, '其他');
INSERT INTO `attributedetails` VALUES (21, 4, '现金');
INSERT INTO `attributedetails` VALUES (22, 4, '转账');
INSERT INTO `attributedetails` VALUES (23, 4, '信用卡');
INSERT INTO `attributedetails` VALUES (24, 4, '其他');
INSERT INTO `attributedetails` VALUES (25, 5, '钟点');
INSERT INTO `attributedetails` VALUES (26, 5, '全日');
INSERT INTO `attributedetails` VALUES (27, 6, '旅客自付');
INSERT INTO `attributedetails` VALUES (28, 6, '团队付款');
INSERT INTO `attributedetails` VALUES (29, 7, '国内旅客');
INSERT INTO `attributedetails` VALUES (30, 7, '国外旅客');
INSERT INTO `attributedetails` VALUES (31, 8, '男');
INSERT INTO `attributedetails` VALUES (32, 8, '女');
INSERT INTO `attributedetails` VALUES (33, 9, '汉');
INSERT INTO `attributedetails` VALUES (34, 9, '苗');
INSERT INTO `attributedetails` VALUES (35, 9, '壮');
INSERT INTO `attributedetails` VALUES (36, 9, '其他');
INSERT INTO `attributedetails` VALUES (37, 10, '二代身份证');
INSERT INTO `attributedetails` VALUES (38, 10, '护照');
INSERT INTO `attributedetails` VALUES (39, 10, '其他');
INSERT INTO `attributedetails` VALUES (40, 11, '无');
INSERT INTO `attributedetails` VALUES (41, 11, '小学');
INSERT INTO `attributedetails` VALUES (42, 11, '初中');
INSERT INTO `attributedetails` VALUES (43, 11, '高中');
INSERT INTO `attributedetails` VALUES (44, 11, '大专');
INSERT INTO `attributedetails` VALUES (45, 11, '本科');
INSERT INTO `attributedetails` VALUES (46, 11, '研究生');
INSERT INTO `attributedetails` VALUES (47, 11, '硕士');
INSERT INTO `attributedetails` VALUES (48, 11, '博士');
INSERT INTO `attributedetails` VALUES (49, 11, '其他');
INSERT INTO `attributedetails` VALUES (50, 12, '公务出差');
INSERT INTO `attributedetails` VALUES (51, 12, '个人旅行');
INSERT INTO `attributedetails` VALUES (52, 13, '首次');
INSERT INTO `attributedetails` VALUES (53, 13, '熟客');
INSERT INTO `attributedetails` VALUES (54, 13, 'VIP');
INSERT INTO `attributedetails` VALUES (55, 14, '散客');
INSERT INTO `attributedetails` VALUES (56, 14, '团队');
INSERT INTO `attributedetails` VALUES (57, 15, '瓶');
INSERT INTO `attributedetails` VALUES (58, 15, '台');
INSERT INTO `attributedetails` VALUES (59, 15, '条');
INSERT INTO `attributedetails` VALUES (60, 15, '支');
INSERT INTO `attributedetails` VALUES (61, 15, '个');
INSERT INTO `attributedetails` VALUES (62, 15, '只');
INSERT INTO `attributedetails` VALUES (63, 15, '包');
INSERT INTO `attributedetails` VALUES (65, 1, '满');
INSERT INTO `attributedetails` VALUES (66, 16, '未安排');
INSERT INTO `attributedetails` VALUES (67, 16, '已安排');
INSERT INTO `attributedetails` VALUES (68, 17, '未结账');
INSERT INTO `attributedetails` VALUES (69, 17, '已结账');
INSERT INTO `attributedetails` VALUES (70, 15, '份');
INSERT INTO `attributedetails` VALUES (71, 15, '碟');
COMMIT;

-- ----------------------------
-- Table structure for commodity
-- ----------------------------
DROP TABLE IF EXISTS `commodity`;
CREATE TABLE `commodity` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `commodityTypeID` int(11) DEFAULT NULL COMMENT '商品类别ID',
  `uOMID` int(11) DEFAULT NULL COMMENT '计量单位ID',
  `commodityName` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `salePrice` decimal(8,2) DEFAULT NULL COMMENT '销售价格',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='商品表';

-- ----------------------------
-- Records of commodity
-- ----------------------------
BEGIN;
INSERT INTO `commodity` VALUES (1, 15, 62, '北京烤鸭', 500.00);
INSERT INTO `commodity` VALUES (2, 16, 57, '雪碧', 7.00);
INSERT INTO `commodity` VALUES (3, 16, 57, '可乐', 7.00);
INSERT INTO `commodity` VALUES (4, 19, 58, '空调', 3000.00);
INSERT INTO `commodity` VALUES (5, 17, 63, '薯片王', 21.00);
INSERT INTO `commodity` VALUES (6, 15, 62, '红烧猪蹄', 201.00);
INSERT INTO `commodity` VALUES (8, 16, 57, '哇哈哈', 5.00);
INSERT INTO `commodity` VALUES (9, 18, 63, '经典双喜', 20.00);
INSERT INTO `commodity` VALUES (10, 15, 70, '红色排骨', 129.00);
INSERT INTO `commodity` VALUES (13, 16, 57, '红牛', 6.00);
COMMIT;

-- ----------------------------
-- Table structure for consumptiondetails
-- ----------------------------
DROP TABLE IF EXISTS `consumptiondetails`;
CREATE TABLE `consumptiondetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消费明细ID',
  `stayRegisterID` int(11) DEFAULT NULL COMMENT '住宿登记ID',
  `commodityID` int(11) DEFAULT NULL COMMENT '商品ID',
  `consumptionNumber` varchar(10) DEFAULT NULL COMMENT '消费数量',
  `consumptionMoney` decimal(8,2) DEFAULT NULL COMMENT '消费金额',
  `consumptionTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '消费时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='消费明细表';

-- ----------------------------
-- Records of consumptiondetails
-- ----------------------------
BEGIN;
INSERT INTO `consumptiondetails` VALUES (6, 1, 3, '3', 21.00, '2016-12-05 11:38:21');
INSERT INTO `consumptiondetails` VALUES (8, 6, 1, '2', 1000.00, '2016-12-06 17:02:37');
INSERT INTO `consumptiondetails` VALUES (9, 18, 2, '2', 14.00, '2017-01-10 11:24:40');
INSERT INTO `consumptiondetails` VALUES (10, 18, 3, '1', 7.00, '2017-01-10 11:25:12');
INSERT INTO `consumptiondetails` VALUES (11, 18, 8, '1', 5.00, '2017-01-10 21:22:23');
INSERT INTO `consumptiondetails` VALUES (12, 16, 2, '1', 7.00, '2017-01-10 21:22:50');
INSERT INTO `consumptiondetails` VALUES (13, 16, 3, '1', 7.00, '2017-01-10 21:22:50');
INSERT INTO `consumptiondetails` VALUES (14, 16, 8, '1', 5.00, '2017-01-10 21:22:50');
INSERT INTO `consumptiondetails` VALUES (15, 17, 2, '2', 14.00, '2017-01-11 08:40:36');
INSERT INTO `consumptiondetails` VALUES (16, 17, 3, '1', 7.00, '2017-01-11 08:40:36');
INSERT INTO `consumptiondetails` VALUES (17, 22, 2, '2', 14.00, '2017-01-11 21:08:57');
INSERT INTO `consumptiondetails` VALUES (18, 25, 2, '2', 14.00, '2017-02-21 09:12:05');
INSERT INTO `consumptiondetails` VALUES (20, 26, 2, '1', 7.00, '2017-02-21 15:04:26');
INSERT INTO `consumptiondetails` VALUES (21, 26, 8, '1', 5.00, '2017-02-21 15:04:26');
INSERT INTO `consumptiondetails` VALUES (22, 27, 2, '1', 7.00, '2017-02-21 15:08:36');
INSERT INTO `consumptiondetails` VALUES (23, 28, 5, '2', 42.00, '2017-02-21 16:01:09');
INSERT INTO `consumptiondetails` VALUES (24, 31, 2, '1', 7.00, '2017-02-21 16:12:48');
INSERT INTO `consumptiondetails` VALUES (25, 33, 2, '1', 7.00, '2017-02-22 11:23:40');
INSERT INTO `consumptiondetails` VALUES (26, 32, 5, '1', 21.00, '2017-02-22 11:24:02');
INSERT INTO `consumptiondetails` VALUES (27, 34, 1, '1', 500.00, '2017-02-23 11:15:28');
INSERT INTO `consumptiondetails` VALUES (29, 35, 2, '1', 7.00, '2017-02-23 11:21:37');
INSERT INTO `consumptiondetails` VALUES (30, 36, 4, '1', 3000.00, '2017-02-23 11:22:06');
INSERT INTO `consumptiondetails` VALUES (31, 37, 5, '1', 21.00, '2017-02-23 11:30:19');
INSERT INTO `consumptiondetails` VALUES (32, 42, 2, '1', 7.00, '2017-02-27 09:27:38');
INSERT INTO `consumptiondetails` VALUES (33, 42, 8, '2', 10.00, '2017-02-27 09:27:38');
INSERT INTO `consumptiondetails` VALUES (34, 43, 2, '1', 7.00, '2017-02-28 09:44:46');
INSERT INTO `consumptiondetails` VALUES (35, 41, 8, '2', 10.00, '2017-02-28 09:45:00');
INSERT INTO `consumptiondetails` VALUES (36, 40, 3, '1', 7.00, '2017-02-28 09:45:18');
COMMIT;

-- ----------------------------
-- Table structure for depoit
-- ----------------------------
DROP TABLE IF EXISTS `depoit`;
CREATE TABLE `depoit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stayRegisterID` int(11) DEFAULT NULL COMMENT '住宿登记ID',
  `payWayID` int(11) DEFAULT NULL COMMENT '支付方式ID',
  `registerTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '登记时间',
  `deposit` decimal(8,2) DEFAULT NULL COMMENT '押金',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of depoit
-- ----------------------------
BEGIN;
INSERT INTO `depoit` VALUES (1, 1, 21, '2018-12-02 16:44:48', 300.00);
INSERT INTO `depoit` VALUES (3, 3, 21, '2018-12-03 20:12:56', 200.00);
INSERT INTO `depoit` VALUES (5, 1, 21, '2016-12-04 11:20:59', 145.00);
INSERT INTO `depoit` VALUES (6, 3, 21, '2016-12-04 11:20:59', 2.00);
INSERT INTO `depoit` VALUES (7, 1, 21, '2016-12-04 11:24:36', 22.00);
INSERT INTO `depoit` VALUES (8, 3, 21, '2016-12-04 11:35:33', 2.00);
INSERT INTO `depoit` VALUES (9, 1, 21, '2016-12-04 14:41:02', 32.00);
INSERT INTO `depoit` VALUES (10, 1, 21, '2016-12-04 14:41:21', 2.00);
INSERT INTO `depoit` VALUES (11, 1, 21, '2016-12-04 14:48:38', 33.00);
INSERT INTO `depoit` VALUES (12, 1, 21, '2016-12-04 15:06:07', 99.00);
INSERT INTO `depoit` VALUES (13, 1, 21, '2016-12-04 15:07:55', 88.00);
INSERT INTO `depoit` VALUES (14, 4, 21, '2016-12-05 15:34:33', 200.00);
INSERT INTO `depoit` VALUES (15, 4, 21, '2016-12-05 16:48:58', 100.00);
INSERT INTO `depoit` VALUES (16, 5, 21, '2016-12-06 16:30:45', 2.00);
INSERT INTO `depoit` VALUES (17, 6, 21, '2016-12-06 16:59:53', 200.00);
INSERT INTO `depoit` VALUES (18, 6, 21, '2016-12-06 17:01:42', 10.00);
INSERT INTO `depoit` VALUES (19, 6, 21, '2016-12-06 17:01:49', 200.00);
INSERT INTO `depoit` VALUES (20, 1, 21, '2017-01-09 16:37:03', 100.00);
INSERT INTO `depoit` VALUES (21, 1, 21, '2017-01-09 16:37:03', 100.00);
INSERT INTO `depoit` VALUES (22, 1, 21, '2017-01-09 16:37:03', 100.00);
INSERT INTO `depoit` VALUES (23, 10, 21, '2017-01-09 16:41:38', 100.00);
INSERT INTO `depoit` VALUES (24, 11, 21, '2017-01-09 16:41:38', 100.00);
INSERT INTO `depoit` VALUES (25, 12, 21, '2017-01-09 16:46:54', 100.00);
INSERT INTO `depoit` VALUES (26, 13, 21, '2017-01-09 16:49:16', 100.00);
INSERT INTO `depoit` VALUES (27, 14, 21, '2017-01-09 20:04:47', 100.00);
INSERT INTO `depoit` VALUES (28, 15, 21, '2017-01-09 20:04:47', 100.00);
INSERT INTO `depoit` VALUES (29, 16, 21, '2017-01-09 20:15:12', 20.00);
INSERT INTO `depoit` VALUES (30, 17, 21, '2017-01-10 10:12:44', 200.00);
INSERT INTO `depoit` VALUES (31, 18, 21, '2017-01-10 11:23:03', 100.00);
INSERT INTO `depoit` VALUES (32, 19, 21, '2017-01-10 11:23:03', 100.00);
INSERT INTO `depoit` VALUES (33, 19, 21, '2017-01-10 11:23:49', 50.00);
INSERT INTO `depoit` VALUES (34, 18, 21, '2017-01-10 11:27:52', 1.00);
INSERT INTO `depoit` VALUES (35, 18, 21, '2017-01-10 21:12:13', 1.00);
INSERT INTO `depoit` VALUES (36, 20, 21, '2017-01-11 09:17:52', 1.00);
INSERT INTO `depoit` VALUES (37, 21, 21, '2017-01-11 09:17:52', 1.00);
INSERT INTO `depoit` VALUES (38, 22, 21, '2017-01-11 15:33:59', 100.00);
INSERT INTO `depoit` VALUES (39, 22, 21, '2017-01-11 21:08:33', 2.00);
INSERT INTO `depoit` VALUES (40, 23, 21, '2017-02-21 08:26:14', 100.00);
INSERT INTO `depoit` VALUES (41, 24, 21, '2017-02-21 08:26:14', 100.00);
INSERT INTO `depoit` VALUES (42, 25, 21, '2017-02-21 09:11:16', 200.00);
INSERT INTO `depoit` VALUES (43, 26, 21, '2017-02-21 15:01:03', 200.00);
INSERT INTO `depoit` VALUES (44, 26, 21, '2017-02-21 15:03:42', 100.00);
INSERT INTO `depoit` VALUES (45, 27, 21, '2017-02-21 15:07:54', 1.00);
INSERT INTO `depoit` VALUES (46, 27, 21, '2017-02-21 15:08:24', 1.00);
INSERT INTO `depoit` VALUES (47, 28, 21, '2017-02-21 15:58:29', 33.33);
INSERT INTO `depoit` VALUES (48, 29, 21, '2017-02-21 15:58:29', 33.33);
INSERT INTO `depoit` VALUES (49, 30, 21, '2017-02-21 15:58:29', 33.33);
INSERT INTO `depoit` VALUES (50, 31, 21, '2017-02-21 16:12:08', 200.00);
INSERT INTO `depoit` VALUES (51, 32, 21, '2017-02-22 11:22:36', 100.00);
INSERT INTO `depoit` VALUES (52, 33, 21, '2017-02-22 11:22:36', 100.00);
INSERT INTO `depoit` VALUES (53, 33, 21, '2017-02-22 11:23:13', 1.00);
INSERT INTO `depoit` VALUES (54, 32, 21, '2017-02-22 11:23:20', 2.00);
INSERT INTO `depoit` VALUES (55, 34, 21, '2017-02-23 11:12:16', 100.00);
INSERT INTO `depoit` VALUES (56, 34, 21, '2017-02-23 11:14:57', 1.00);
INSERT INTO `depoit` VALUES (57, 35, 21, '2017-02-23 11:19:38', 100.00);
INSERT INTO `depoit` VALUES (58, 36, 21, '2017-02-23 11:19:38', 100.00);
INSERT INTO `depoit` VALUES (59, 35, 21, '2017-02-23 11:20:52', 1.00);
INSERT INTO `depoit` VALUES (60, 36, 21, '2017-02-23 11:21:11', 2.00);
INSERT INTO `depoit` VALUES (61, 37, 21, '2017-02-23 11:28:56', 100.00);
INSERT INTO `depoit` VALUES (62, 38, 21, '2017-02-23 11:29:08', 100.00);
INSERT INTO `depoit` VALUES (63, 39, 21, '2017-02-23 11:29:08', 100.00);
INSERT INTO `depoit` VALUES (64, 37, 21, '2017-02-23 11:30:05', 10.00);
INSERT INTO `depoit` VALUES (65, 40, 21, '2017-02-24 15:39:57', 100.00);
INSERT INTO `depoit` VALUES (66, 41, 21, '2017-02-24 15:39:57', 100.00);
INSERT INTO `depoit` VALUES (67, 42, 21, '2017-02-26 21:23:51', 100.00);
INSERT INTO `depoit` VALUES (68, 42, 21, '2017-02-27 11:14:27', 2.00);
INSERT INTO `depoit` VALUES (69, 43, 21, '2017-02-27 20:22:31', 100.00);
INSERT INTO `depoit` VALUES (70, 41, 21, '2017-02-28 09:44:02', 2.00);
INSERT INTO `depoit` VALUES (71, 43, 21, '2017-02-28 09:44:19', 2.00);
INSERT INTO `depoit` VALUES (72, 40, 21, '2017-02-28 09:44:31', 3.00);
INSERT INTO `depoit` VALUES (73, 44, 21, '2017-03-01 08:53:35', 200.00);
INSERT INTO `depoit` VALUES (74, 45, 22, '2019-01-15 10:57:23', 100.00);
INSERT INTO `depoit` VALUES (75, 46, 22, '2019-01-15 11:03:26', 100.00);
INSERT INTO `depoit` VALUES (76, 47, 22, '2019-01-15 11:09:22', 100.00);
INSERT INTO `depoit` VALUES (77, 48, 21, '2019-01-15 11:11:49', 100.00);
INSERT INTO `depoit` VALUES (78, 49, 21, '2019-01-15 11:16:34', 100.00);
INSERT INTO `depoit` VALUES (80, 51, 21, '2019-01-16 09:44:08', 200.00);
COMMIT;

-- ----------------------------
-- Table structure for passenger
-- ----------------------------
DROP TABLE IF EXISTS `passenger`;
CREATE TABLE `passenger` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '旅客ID',
  `papersID` int(11) DEFAULT NULL COMMENT '证件ID',
  `educationDegreeID` int(11) DEFAULT NULL COMMENT '文化程度ID',
  `genderID` int(11) DEFAULT NULL COMMENT '性别ID',
  `passengerLevelID` int(11) DEFAULT NULL COMMENT '旅客级别ID',
  `nationID` int(11) DEFAULT NULL COMMENT '民族ID',
  `thingReasonID` int(11) DEFAULT NULL COMMENT '事由',
  `name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `papersNumber` varchar(30) DEFAULT NULL COMMENT '证件号码',
  `birthDate` varchar(30) DEFAULT NULL COMMENT '出生日期',
  `licenceIssuingAuthorty` varchar(50) DEFAULT NULL COMMENT '发证机关',
  `unitsOrAddress` varchar(50) DEFAULT NULL COMMENT '单位或住址',
  `papersValidity` varchar(50) DEFAULT NULL COMMENT '证件有效期',
  `profession` varchar(20) DEFAULT NULL COMMENT '职业',
  `whereAreFrom` varchar(100) DEFAULT NULL COMMENT '从何处来',
  `whereToGo` varchar(100) DEFAULT NULL COMMENT '到哪里去',
  `contactPhoneNumber` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='旅客信息表';

-- ----------------------------
-- Records of passenger
-- ----------------------------
BEGIN;
INSERT INTO `passenger` VALUES (1, 37, 44, 31, 52, 33, 51, '黄旭林', '310103198202080411', '1994-05-21', '广东省高州市', '广东省高州市荷花镇', '2010-01-01 至 2020-01-01', '学生', '广东省高州市荷花镇', '海南省三亚市大东海', '13800138001', '哈啊哈');
INSERT INTO `passenger` VALUES (2, 37, 44, 31, 52, 33, 51, '黄大海', '440981198807214211', '1988-07-21', '广东省高州市', '广东省高州市荷花镇', '2010-01-01 至 2020-01-01', '学生', '广东省高州市荷花镇', '海南省三亚市大东海', '18312636707', '哈啊哈');
INSERT INTO `passenger` VALUES (3, 39, 40, 32, 53, 36, 51, '刘朝武', '310103199202080412', '1992-02-08', '上海徐汇区', '天桥下', '1921-02-29 至 2921-02-29', '流浪者', '屎坑', '尿坑', '13800138002', '666');
INSERT INTO `passenger` VALUES (4, 37, 47, 31, 52, 33, 51, '范伟', '440981198809094211', '1988-09-09', '广东省高州市', '广东省高州市荷花镇', '2010-01-01 至 2020-01-01', '学生', '广东省高州市荷花镇', '海南省三亚市大东海', '13800138003', '哈啊哈');
INSERT INTO `passenger` VALUES (5, 37, 44, 31, 52, 33, 51, '程小伟', '440981199212213211', '1992-12-21', '广东省高州市', '广东省高州市荷花镇', '2010-01-01 至 2020-01-01', '学生', '广东省高州市荷花镇', '海南省三亚市大东海', '13800138007', '哈啊哈');
INSERT INTO `passenger` VALUES (6, 37, 44, 31, 52, 33, 51, '孙阳', '440981199405214211', '1994-05-21', '广东省高州市', '广东省高州市荷花镇', '2010-01-01 至 2020-01-01', '学生', '广东省高州市荷花镇', '海南省三亚市大东海', '13800138005', '哈啊哈');
INSERT INTO `passenger` VALUES (7, 37, 45, 32, 52, 33, 51, '李小萌', '440981199506083218', '1995-06-08', '广东省高州市', '广东省广州市', '2010-01-01 至 2020-01-01', '学生', '广东省高州市', '广东省广州市', '13800138000', '美女一枚');
INSERT INTO `passenger` VALUES (12, 39, 42, 32, 53, 36, 51, '周海风', '210103196202080411', '1962-02-08', '哈连', '天桥下', '1921-02-29 至 2921-02-29', '工人', '哈连', '杭州', '13800138009', '三无市民');
INSERT INTO `passenger` VALUES (15, 37, 44, 31, 52, 33, 51, '黄海涛', '440981199509113211', '1995-09-11', '广东省高州市', '广东省高州市荷花镇', '2010-01-01 至 2020-01-01', '学生', '广东省高州市荷花镇', '海南省三亚市大东海', '13800138010', '哈啊哈');
INSERT INTO `passenger` VALUES (16, 37, 43, 31, 52, 33, 51, '黄海量', '440981198803014218', '1988-03-01', '广东省高州市', '广东省高州市荷花镇', '2010-01-01 至 2020-01-01', '摄影师', '广东省高州市荷花镇', '海南省三亚市大东海', '13800138011', '哈啊哈');
INSERT INTO `passenger` VALUES (17, 37, 44, 32, 52, 33, 51, '白爱美', '440981199505054205', '1995-05-05', '广东省高州市', '广东省高州市荷花镇', '2010-01-01 至 2020-01-01', '学生', '广东省高州市荷花镇', '海南省三亚市大东海', '13800138013', '哈啊哈');
INSERT INTO `passenger` VALUES (18, 39, 41, 31, 53, 36, 51, '何海林', '110103196202080411', '1962-02-08', '哈连', '天桥下', '1921-02-29 至 2921-02-29', '流浪者', '哈连', '不知道', '13800138018', '好牛');
INSERT INTO `passenger` VALUES (19, 37, 44, 32, 52, 33, 51, '黄旭玲', '440981199405214211', '1994-05-21', '广东省高州市', '广东省高州市荷花镇', '2010-01-01 至 2020-01-01', '化妆师', '广东省高州市荷花镇', '海南省三亚市大东海', '13800138015', '哈啊哈');
INSERT INTO `passenger` VALUES (20, 37, 43, 32, 52, 33, 51, '刘爱爱', '440981199202204213', '1992-02-20', '上海市徐汇区', '广东省广州市', '2010-01-01 至 2020-01-01', '公务员', '上海市徐汇区', '广东省广州市南沙区', '13800138016', '美女');
INSERT INTO `passenger` VALUES (21, 37, 44, 31, 52, 33, 51, '周鸿弟', '310103196202080411', '1962-02-08', '上海市徐汇区', '上海市徐汇区桂林西街15巷72号204室', '2010-01-01 至 2020-01-01', '老师', '上海市徐汇区桂林西街15巷72号204室', '广东省广州市南沙区北大技工学校', '13800138019', '好老师');
INSERT INTO `passenger` VALUES (22, 37, 43, 31, 52, 33, 51, '小美', '440981199206080020', '1992-06-08', '', '', '', '', '', '', NULL, '');
INSERT INTO `passenger` VALUES (23, 37, 43, 31, 52, 33, 51, '胡杰友', '440981198809094218', '1988-09-09', '', '', '', '', '', '', NULL, '');
INSERT INTO `passenger` VALUES (25, 37, 43, 32, 52, 33, 51, '杨思雯', '440981199606053214', '1996-06-05', '高州', '', '', '学生', '高州', '广州', NULL, '美女');
INSERT INTO `passenger` VALUES (26, 37, 43, 32, 52, 33, 51, '胖妞', '440981198807214202', '1988-07-21', '', '', '', '', '', '', NULL, '');
INSERT INTO `passenger` VALUES (28, 37, 43, 31, 52, 33, 51, '顾伟', '440981198307214202', '1983-07-21', '', '', '', '', '', '', NULL, '');
INSERT INTO `passenger` VALUES (29, 37, 45, 31, 52, 33, 51, 'zyq1996', '372323199610092392', '1996-10-09', '', '', '', '学生', '', '', '', '');
INSERT INTO `passenger` VALUES (30, 37, 43, 31, 52, 33, 51, '刘朝武', '372323199208293424', '1992-08-29', '', '', '', '', '', '', NULL, '');
INSERT INTO `passenger` VALUES (31, 37, 45, 31, 52, 33, 51, '小明', '372323199809183422', '1998-09-18', '', '', '2010-01-01 至 2020-01-01', '', '', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for predetermine
-- ----------------------------
DROP TABLE IF EXISTS `predetermine`;
CREATE TABLE `predetermine` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '预定ID',
  `roomID` int(11) DEFAULT NULL COMMENT '房间ID',
  `predetermineTargetID` int(11) DEFAULT NULL COMMENT '预定对象ID',
  `passengerID` int(11) DEFAULT NULL COMMENT '旅客ID',
  `payWayID` int(11) DEFAULT NULL COMMENT '支付方式 ID',
  `predetermineStateID` int(11) DEFAULT NULL COMMENT '预定状态ID',
  `arriveTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '抵达时间',
  `deposit` decimal(8,2) DEFAULT NULL COMMENT '押金',
  `predetermineDay` varchar(10) DEFAULT NULL COMMENT '预定天数',
  `remind` int(11) DEFAULT '0' COMMENT '到时提示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='房间预定表';

-- ----------------------------
-- Records of predetermine
-- ----------------------------
BEGIN;
INSERT INTO `predetermine` VALUES (1, 13, 11, 0, 21, 67, '2017-01-09 16:41:12', 100.00, '2', 1);
INSERT INTO `predetermine` VALUES (2, 14, 11, 0, 21, 67, '2017-01-09 16:41:12', 100.00, '2', 1);
INSERT INTO `predetermine` VALUES (3, 16, 11, 0, 21, 67, '2017-01-09 16:41:12', 100.00, '2', 1);
INSERT INTO `predetermine` VALUES (4, 17, 11, 0, 21, 67, '2017-01-09 16:45:05', 100.00, '2', 1);
INSERT INTO `predetermine` VALUES (5, 18, 11, 0, 21, 67, '2017-01-09 16:45:05', 100.00, '2', 1);
INSERT INTO `predetermine` VALUES (6, 13, 2, 3, 21, 67, '2017-01-09 16:46:54', 100.00, '1', 1);
INSERT INTO `predetermine` VALUES (7, 13, 2, 3, 21, 67, '2017-01-09 16:49:16', 100.00, '1', 1);
INSERT INTO `predetermine` VALUES (9, 19, 2, 3, 21, 67, '2017-01-10 11:21:50', 200.00, '2', 1);
INSERT INTO `predetermine` VALUES (10, 13, 12, 0, 21, 67, '2017-01-10 21:32:53', 100.00, '2', 1);
INSERT INTO `predetermine` VALUES (11, 27, 12, 0, 21, 67, '2017-01-10 21:32:53', 100.00, '2', 1);
INSERT INTO `predetermine` VALUES (12, 18, 2, 2, 21, 67, '2017-03-01 08:53:35', 200.00, '2', 1);
INSERT INTO `predetermine` VALUES (13, 16, 3, 0, 21, 67, '2017-02-21 08:26:14', 100.00, '1', 1);
INSERT INTO `predetermine` VALUES (14, 17, 3, 0, 21, 67, '2017-02-21 08:26:14', 100.00, '1', 1);
INSERT INTO `predetermine` VALUES (15, 13, 2, 1, 21, 67, '2017-02-21 09:14:16', 200.00, '2', 1);
INSERT INTO `predetermine` VALUES (18, 17, 13, 0, 21, 67, '2017-02-23 08:06:53', 200.00, '1', 1);
INSERT INTO `predetermine` VALUES (21, 13, 5, 0, 21, 67, '2017-02-23 11:41:59', 100.00, '1', 1);
INSERT INTO `predetermine` VALUES (22, 14, 5, 0, 21, 67, '2017-02-23 11:41:59', 100.00, '1', 1);
INSERT INTO `predetermine` VALUES (23, 3, 2, 1, 21, 67, '2017-02-23 11:28:56', 100.00, '1', 1);
INSERT INTO `predetermine` VALUES (25, 13, 3, 0, 21, 67, '2017-02-24 16:29:39', 100.00, '1', 1);
INSERT INTO `predetermine` VALUES (26, 27, 3, 0, 21, 67, '2017-02-24 16:29:39', 100.00, '1', 1);
INSERT INTO `predetermine` VALUES (27, 3, 2, 29, 22, 67, '2019-01-15 10:57:23', 100.00, '2', 1);
INSERT INTO `predetermine` VALUES (29, 13, 2, 4, 22, 67, '2019-01-15 11:03:26', 100.00, '2', 1);
INSERT INTO `predetermine` VALUES (30, 24, 2, 3, 22, 67, '2019-01-15 11:09:22', 100.00, '2', 1);
INSERT INTO `predetermine` VALUES (31, 30, 2, 29, 21, 67, '2019-01-15 11:16:34', 100.00, '2', 1);
COMMIT;

-- ----------------------------
-- Table structure for receivetarget
-- ----------------------------
DROP TABLE IF EXISTS `receivetarget`;
CREATE TABLE `receivetarget` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '接待对象ID',
  `targetTypeID` int(11) DEFAULT NULL COMMENT '对象类别ID',
  `principal` varchar(20) DEFAULT NULL COMMENT '负责人',
  `teamName` varchar(30) DEFAULT NULL COMMENT '团队名称',
  `teamCode` varchar(30) DEFAULT NULL COMMENT '团队编号',
  `registerTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '登记时间',
  `contactPhoneNUmber` varchar(20) DEFAULT NULL COMMENT '联系电话',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='接待对象表';

-- ----------------------------
-- Records of receivetarget
-- ----------------------------
BEGIN;
INSERT INTO `receivetarget` VALUES (1, 56, '李亚伟', '深圳市蓝途畅游旅行社有限公司', 'LTC82952', '2016-11-20 20:26:12', '13800138111');
INSERT INTO `receivetarget` VALUES (2, 55, NULL, NULL, NULL, '2016-12-04 08:26:47', '122');
INSERT INTO `receivetarget` VALUES (3, 56, '丽丽', '丽人旅游团', 'LiRen001', '2016-11-20 20:26:18', '13800138112');
INSERT INTO `receivetarget` VALUES (4, 56, '罗斯福', '光大国际旅行社', 'GDGZ001', '2016-11-20 20:33:24', '13800138222');
INSERT INTO `receivetarget` VALUES (5, 56, '周海媚', '北京青年旅行社', 'BJQN005', '2016-11-20 20:33:50', '13800138223');
INSERT INTO `receivetarget` VALUES (9, 56, '周冬梅', '香港天宝旅行社有限公司', 'XGTB0892', '2016-11-27 16:58:09', '13800138225');
INSERT INTO `receivetarget` VALUES (11, 56, '王大卫', '深圳美之程旅游服务有限公司', 'SZM8248', '2016-11-27 16:58:59', '13800138226');
INSERT INTO `receivetarget` VALUES (12, 56, '黄晓敏', '丽江旅游团', 'LJ2088', '2017-01-10 10:08:52', '13800138000');
INSERT INTO `receivetarget` VALUES (13, 56, '海滔', '爱海滔滔有限公司', 'AHTT0058', '2017-02-21 14:59:42', '18312952952');
COMMIT;

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '房间id',
  `guestRoomLevelID` int(11) DEFAULT NULL COMMENT '客房等级ID',
  `roomStateID` int(11) DEFAULT NULL COMMENT '房态ID',
  `roomNumber` varchar(10) DEFAULT NULL COMMENT '房间号',
  `roomAmount` varchar(10) DEFAULT NULL COMMENT '床位数',
  `standardPriceDay` decimal(8,2) DEFAULT NULL COMMENT '标准房价/天',
  `standardPrice` decimal(8,2) DEFAULT NULL COMMENT '标准房价/小时',
  `maxDuration` varchar(10) DEFAULT NULL COMMENT '时长限制（小时）',
  `firstDuration` varchar(10) DEFAULT NULL COMMENT '首段时长（小时）',
  `firstPrice` decimal(8,2) DEFAULT NULL COMMENT '首段价格',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='房间表';

-- ----------------------------
-- Records of room
-- ----------------------------
BEGIN;
INSERT INTO `room` VALUES (3, 8, 1, '101', '1', 100.00, 20.00, '5', '3', 50.00);
INSERT INTO `room` VALUES (4, 14, 2, '501', '3', 10000.00, 1800.00, '5', '3', 5000.00);
INSERT INTO `room` VALUES (5, 8, 3, '404', '1', 1.00, 1.00, '1', '1', 1.00);
INSERT INTO `room` VALUES (9, 8, 4, '102', '1', 100.00, 20.00, '5', '3', 50.00);
INSERT INTO `room` VALUES (10, 8, 5, '103', '1', 100.00, 20.00, '5', '3', 50.00);
INSERT INTO `room` VALUES (11, 8, 6, '104', '1', 100.00, 20.00, '5', '3', 50.00);
INSERT INTO `room` VALUES (12, 9, 7, '105', '1', 150.00, 30.00, '5', '3', 80.00);
INSERT INTO `room` VALUES (13, 8, 1, '106', '1', 150.00, 30.00, '5', '3', 80.00);
INSERT INTO `room` VALUES (14, 10, 1, '107', '2', 200.00, 40.00, '5', '3', 100.00);
INSERT INTO `room` VALUES (16, 10, 65, '201', '2', 180.00, 35.00, '5', '3', 100.00);
INSERT INTO `room` VALUES (17, 10, 1, '202', '2', 180.00, 35.00, '5', '3', 100.00);
INSERT INTO `room` VALUES (18, 11, 1, '203', '2', 300.00, 50.00, '5', '3', 130.00);
INSERT INTO `room` VALUES (19, 11, 1, '204', '3', 300.00, 50.00, '5', '3', 130.00);
INSERT INTO `room` VALUES (20, 13, 1, '301', '1', 800.00, 200.00, '4', '3', 500.00);
INSERT INTO `room` VALUES (21, 8, 65, '3', '23', 2.00, 2.00, '2', '2', 2.00);
INSERT INTO `room` VALUES (22, 13, 1, '302', '1', 1200.00, 99.00, '5', '3', 500.00);
INSERT INTO `room` VALUES (23, 12, 1, '401', '2', 1000.00, 88.00, '5', '3', 700.00);
INSERT INTO `room` VALUES (24, 14, 1, '502', '2', 8000.00, 1500.00, '5', '3', 5000.00);
INSERT INTO `room` VALUES (25, 8, 1, '808', '2', 800000.00, 80000.00, '5', '3', 50000.00);
INSERT INTO `room` VALUES (26, 8, 1, '9999', '99', 999.00, 999.00, '9', '5', 99.00);
INSERT INTO `room` VALUES (27, 10, 1, '108', '2', 200.00, 35.00, '5', '3', 100.00);
INSERT INTO `room` VALUES (28, 8, 1, '109', '2', 200.00, 35.00, '5', '3', 100.00);
INSERT INTO `room` VALUES (29, 11, 1, '205', '2', 500.00, 100.00, '5', '3', 300.00);
INSERT INTO `room` VALUES (30, 11, 1, '206', '2', 600.00, 99.00, '5', '3', 300.00);
INSERT INTO `room` VALUES (31, 11, 1, '207', '2', 800.00, 99.00, '5', '3', 500.00);
INSERT INTO `room` VALUES (32, 8, 1, '208', '2', 800.00, 100.00, '5', '3', 500.00);
INSERT INTO `room` VALUES (34, 11, 1, '307', '2', 2000.00, 2.00, '05', '03', 888.80);
COMMIT;

-- ----------------------------
-- Table structure for stayregister
-- ----------------------------
DROP TABLE IF EXISTS `stayregister`;
CREATE TABLE `stayregister` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '住宿登记ID',
  `predetermineID` int(11) DEFAULT NULL COMMENT '预定ID',
  `rentOutTypeID` int(11) DEFAULT NULL COMMENT '出租方式ID',
  `roomID` int(11) DEFAULT NULL COMMENT '房间ID',
  `payWayID` int(11) DEFAULT NULL COMMENT '结账方式ID',
  `billUnitID` int(11) DEFAULT NULL COMMENT '结账单位ID',
  `passengerTypeID` int(11) DEFAULT NULL COMMENT '旅客类别ID',
  `receiveTargetID` int(11) DEFAULT NULL COMMENT '接待对象ID',
  `deputyID` int(11) DEFAULT NULL COMMENT '副ID',
  `isBillID` int(11) DEFAULT NULL COMMENT '结账否',
  `registerTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登记时间',
  `stayNumber` varchar(20) DEFAULT NULL COMMENT '住店天数/小时',
  `sumConst` decimal(8,2) DEFAULT NULL COMMENT '总费用',
  `ChangingRoomNumber` varchar(10) DEFAULT NULL COMMENT '换房次数',
  `changRoomMoney` decimal(8,2) DEFAULT NULL COMMENT '换房费',
  `remarks` varchar(200) DEFAULT NULL COMMENT '备注',
  `payTime` timestamp NULL DEFAULT NULL COMMENT '结账时间',
  `changRoomTime` timestamp NULL DEFAULT NULL COMMENT '换房时间',
  `remind` int(11) DEFAULT '0' COMMENT '提醒结账',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='住宿登记表';

-- ----------------------------
-- Records of stayregister
-- ----------------------------
BEGIN;
INSERT INTO `stayregister` VALUES (1, 1, 26, 13, 21, 27, 29, 2, NULL, 69, '2016-11-29 15:06:52', '5', 3291.00, '1', 15120.00, '', '2017-02-21 09:23:36', '2017-02-21 09:19:00', 1);
INSERT INTO `stayregister` VALUES (3, 1, 26, 17, 21, 27, 29, 2, NULL, 69, '2016-12-03 20:12:56', '2', 360.00, NULL, NULL, '你好', '2017-01-11 20:55:51', NULL, 1);
INSERT INTO `stayregister` VALUES (4, 10, 26, 3, 21, 27, 29, 2, NULL, 69, '2016-12-05 15:34:33', '5', 500.00, NULL, NULL, '', '2017-01-11 20:55:45', NULL, 1);
INSERT INTO `stayregister` VALUES (5, 11, 26, 18, 21, 27, 29, 2, NULL, 69, '2016-12-06 16:30:45', '1', 300.00, NULL, NULL, '', '2017-01-11 20:55:41', NULL, 1);
INSERT INTO `stayregister` VALUES (6, 12, 26, 20, 21, 27, 29, 2, NULL, 69, '2016-12-06 16:59:53', '5', 5000.00, NULL, NULL, '', '2017-01-11 20:55:36', NULL, 1);
INSERT INTO `stayregister` VALUES (7, NULL, 26, 13, 22, 28, 29, 11, NULL, 69, '2017-01-09 16:37:03', '2', 300.00, NULL, NULL, '', '2017-01-09 16:42:23', NULL, 0);
INSERT INTO `stayregister` VALUES (8, NULL, 26, 14, 22, 28, 29, 11, NULL, 69, '2017-01-09 16:37:03', '2', 400.00, NULL, NULL, '', '2017-01-09 16:42:23', NULL, 0);
INSERT INTO `stayregister` VALUES (9, NULL, 26, 16, 22, 28, 29, 11, NULL, 69, '2017-01-09 16:37:03', '2', 360.00, NULL, NULL, '', '2017-01-09 16:42:23', NULL, 0);
INSERT INTO `stayregister` VALUES (10, NULL, 26, 17, 22, 28, 29, 11, NULL, 69, '2017-01-09 16:41:38', '2', 360.00, NULL, NULL, '', '2017-01-09 16:42:23', NULL, 0);
INSERT INTO `stayregister` VALUES (11, NULL, 26, 18, 22, 28, 29, 11, NULL, 69, '2017-01-09 16:41:38', '2', 600.00, NULL, NULL, '', '2017-01-09 16:42:23', NULL, 0);
INSERT INTO `stayregister` VALUES (12, NULL, 26, 13, 21, 27, 29, 2, NULL, 69, '2017-01-09 16:46:54', '1', 150.00, NULL, NULL, '', '2017-01-09 16:47:06', NULL, 0);
INSERT INTO `stayregister` VALUES (13, 7, 26, 13, 21, 27, 29, 2, NULL, 69, '2017-01-09 16:49:16', '1', 150.00, NULL, NULL, '', '2017-01-09 16:49:28', NULL, 0);
INSERT INTO `stayregister` VALUES (14, NULL, 26, 13, 22, 28, 29, 9, NULL, 69, '2017-01-09 20:04:47', '1', 150.00, NULL, NULL, '', '2017-01-09 20:43:43', NULL, 0);
INSERT INTO `stayregister` VALUES (15, NULL, 26, 14, 22, 28, 29, 9, NULL, 69, '2017-01-09 20:04:47', '1', 200.00, NULL, NULL, '', '2017-02-21 16:09:55', NULL, 1);
INSERT INTO `stayregister` VALUES (16, NULL, 25, 27, 22, 27, 29, 11, NULL, 69, '2017-01-09 20:15:12', '4', 154.00, '1', 0.00, '', '2017-02-22 17:03:48', '2017-02-20 20:42:33', 1);
INSERT INTO `stayregister` VALUES (17, 9, 26, 19, 22, 27, 29, 13, NULL, 69, '2017-01-10 10:12:44', '2', 621.00, NULL, NULL, '', '2017-03-01 10:08:05', NULL, 1);
INSERT INTO `stayregister` VALUES (18, 10, 26, 13, 22, 28, 29, 12, NULL, 69, '2017-01-10 11:23:03', '2', 326.00, NULL, NULL, '', '2017-01-11 10:16:27', NULL, 0);
INSERT INTO `stayregister` VALUES (19, 11, 26, 28, 22, 28, 29, 12, NULL, 69, '2017-01-10 11:23:03', '2', 400.00, '1', 0.00, '', '2017-01-11 10:16:27', '2017-01-10 11:23:34', 0);
INSERT INTO `stayregister` VALUES (20, NULL, 26, 27, 22, 28, 29, 12, NULL, 69, '2017-01-11 09:17:52', '2', 400.00, NULL, NULL, '', '2017-01-11 10:16:27', NULL, 0);
INSERT INTO `stayregister` VALUES (21, NULL, 26, 17, 22, 28, 29, 5, NULL, 69, '2017-01-11 09:17:52', '2', 360.00, NULL, NULL, '', '2017-01-11 10:16:27', NULL, 0);
INSERT INTO `stayregister` VALUES (22, NULL, 26, 3, 21, 27, 29, 2, NULL, 69, '2017-01-11 15:33:59', '1', 114.00, '1', 0.00, '', '2017-02-21 08:29:07', '2017-01-11 21:08:40', 1);
INSERT INTO `stayregister` VALUES (23, 13, 26, 16, 22, 28, 29, 3, NULL, 69, '2017-02-21 08:26:14', '1', 180.00, NULL, NULL, '', '2017-02-21 08:28:37', NULL, 0);
INSERT INTO `stayregister` VALUES (24, 14, 26, 17, 22, 28, 29, 3, NULL, 69, '2017-02-21 08:26:14', '1', 180.00, NULL, NULL, '', '2017-02-21 08:28:37', NULL, 0);
INSERT INTO `stayregister` VALUES (25, 15, 26, 13, 22, 27, 29, 4, NULL, 69, '2017-02-21 09:11:16', '2', 314.00, NULL, NULL, '', '2017-02-21 09:13:53', NULL, 0);
INSERT INTO `stayregister` VALUES (26, NULL, 26, 32, 21, 27, 29, 2, NULL, 69, '2017-02-21 15:01:03', '2', 1612.00, '1', 0.00, '', '2017-02-21 15:57:34', '2017-02-21 15:05:14', 0);
INSERT INTO `stayregister` VALUES (27, NULL, 26, 13, 22, 27, 29, 12, NULL, 69, '2017-02-21 15:07:54', '1', 157.00, '1', 0.00, '', '2017-02-23 11:24:51', '2017-02-21 15:08:14', 1);
INSERT INTO `stayregister` VALUES (28, NULL, 26, 20, 22, 28, 29, 3, NULL, 69, '2017-02-21 15:58:29', '1', 842.00, '1', 0.00, '', '2017-02-21 16:01:57', '2017-02-21 16:01:26', 0);
INSERT INTO `stayregister` VALUES (29, NULL, 26, 29, 22, 28, 29, 3, NULL, 69, '2017-02-21 15:58:29', '1', 500.00, NULL, NULL, '', '2017-02-21 16:01:57', NULL, 0);
INSERT INTO `stayregister` VALUES (30, NULL, 26, 30, 22, 28, 29, 3, NULL, 69, '2017-02-21 15:58:29', '1', 600.00, NULL, NULL, '', '2017-02-21 16:01:57', NULL, 0);
INSERT INTO `stayregister` VALUES (31, 18, 26, 17, 21, 28, 29, 13, NULL, 69, '2017-02-21 16:12:08', '1', 187.00, NULL, NULL, '', '2017-02-21 16:13:12', NULL, 0);
INSERT INTO `stayregister` VALUES (32, NULL, 26, 28, 21, 28, 29, 2, NULL, 69, '2017-02-22 11:22:36', '1', 221.00, NULL, NULL, '', '2019-01-16 09:43:05', NULL, 1);
INSERT INTO `stayregister` VALUES (33, NULL, 26, 16, 22, 28, 29, 11, NULL, 69, '2017-02-22 11:22:36', '1', 187.00, NULL, NULL, '', '2017-02-22 16:35:46', NULL, 0);
INSERT INTO `stayregister` VALUES (34, NULL, 26, 14, 23, 27, 29, 2, NULL, 69, '2017-02-23 11:12:16', '1', 700.00, '1', 0.00, '可填可不填', '2017-02-23 11:17:31', '2017-02-23 11:16:01', 0);
INSERT INTO `stayregister` VALUES (35, NULL, 26, 16, 22, 28, 29, 12, NULL, 69, '2017-02-23 11:19:38', '1', 187.00, NULL, NULL, '', '2017-02-23 11:23:30', NULL, 0);
INSERT INTO `stayregister` VALUES (36, NULL, 26, 14, 22, 28, 29, 12, NULL, 69, '2017-02-23 11:19:38', '1', 3200.00, '1', 0.00, '', '2017-02-23 11:24:51', '2017-02-23 11:22:19', 0);
INSERT INTO `stayregister` VALUES (37, 23, 26, 27, 21, 27, 29, 2, NULL, 69, '2017-02-23 11:28:56', '1', 221.00, '1', 0.00, '', '2017-02-23 11:30:46', '2017-02-23 11:30:25', 0);
INSERT INTO `stayregister` VALUES (38, 21, 26, 13, 22, 28, 29, 5, NULL, 69, '2017-02-23 11:29:08', '1', 150.00, NULL, NULL, '', '2017-02-23 11:32:03', NULL, 0);
INSERT INTO `stayregister` VALUES (39, 22, 26, 14, 22, 28, 29, 5, NULL, 69, '2017-02-23 11:29:08', '1', 200.00, NULL, NULL, '', '2017-02-23 11:32:03', NULL, 0);
INSERT INTO `stayregister` VALUES (40, 25, 26, 13, 22, 28, 29, 3, NULL, 69, '2017-02-24 15:39:57', '5', 757.00, NULL, NULL, '', '2017-03-01 08:07:00', NULL, 0);
INSERT INTO `stayregister` VALUES (41, 26, 26, 17, 22, 28, 29, 3, NULL, 69, '2017-02-24 15:39:57', '5', 990.00, '1', 800.00, '', '2017-03-01 08:07:00', '2017-02-28 14:46:20', 0);
INSERT INTO `stayregister` VALUES (42, NULL, 26, 17, 21, 27, 29, 2, NULL, 69, '2017-02-26 21:23:51', '1', 197.00, '1', 180.00, '', '2017-02-27 16:36:56', '2017-02-27 15:36:17', 0);
INSERT INTO `stayregister` VALUES (43, NULL, 26, 3, 22, 27, 29, 3, NULL, 69, '2017-02-27 20:22:31', '3', 307.00, NULL, NULL, '', '2017-03-01 08:07:00', NULL, 0);
INSERT INTO `stayregister` VALUES (44, 12, 26, 18, 21, 27, 29, 2, NULL, 69, '2017-03-01 08:53:35', '2', 600.00, NULL, NULL, '', '2019-01-17 19:45:02', NULL, 1);
INSERT INTO `stayregister` VALUES (45, 27, 26, 3, 21, 27, 29, 2, NULL, 69, '2019-01-15 10:57:23', '2', 200.00, NULL, NULL, '', '2019-01-15 10:59:09', NULL, 0);
INSERT INTO `stayregister` VALUES (46, 29, 26, 26, 21, 27, 29, 2, NULL, 69, '2019-01-15 11:03:26', '2', 1998.00, '1', 0.00, '', '2019-01-15 11:07:28', '2019-01-15 11:03:36', 0);
INSERT INTO `stayregister` VALUES (47, 30, 26, 24, 21, 27, 29, 2, NULL, 69, '2019-01-15 11:09:22', '2', 16000.00, NULL, NULL, '', '2019-01-17 19:44:27', NULL, 1);
INSERT INTO `stayregister` VALUES (48, 1, 26, 21, NULL, 28, 29, 11, NULL, 68, '2019-01-15 11:11:49', '2', 374.00, '1', 375.00, NULL, NULL, '2019-01-17 19:46:36', 1);
INSERT INTO `stayregister` VALUES (49, 31, 26, 30, 21, 27, 29, 2, NULL, 69, '2019-01-15 11:16:34', '2', 1200.00, NULL, NULL, '', '2019-01-17 19:44:56', NULL, 1);
INSERT INTO `stayregister` VALUES (51, NULL, 26, 31, 21, 27, 29, 2, NULL, 69, '2019-01-16 09:44:08', '2', 1600.00, '1', 0.00, '', '2019-01-17 19:44:51', '2019-01-16 09:45:42', 0);
COMMIT;

-- ----------------------------
-- Table structure for stayregisterdetails
-- ----------------------------
DROP TABLE IF EXISTS `stayregisterdetails`;
CREATE TABLE `stayregisterdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '住宿登记明细id',
  `stayRegisterID` int(11) DEFAULT NULL COMMENT '住宿登记id',
  `passengerID` int(11) DEFAULT NULL COMMENT '旅客id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='住宿登记明细表';

-- ----------------------------
-- Records of stayregisterdetails
-- ----------------------------
BEGIN;
INSERT INTO `stayregisterdetails` VALUES (1, 1, 2);
INSERT INTO `stayregisterdetails` VALUES (2, 3, 3);
INSERT INTO `stayregisterdetails` VALUES (3, 3, 18);
INSERT INTO `stayregisterdetails` VALUES (4, 4, 2);
INSERT INTO `stayregisterdetails` VALUES (5, 5, 2);
INSERT INTO `stayregisterdetails` VALUES (6, 6, 2);
INSERT INTO `stayregisterdetails` VALUES (7, 6, 19);
INSERT INTO `stayregisterdetails` VALUES (8, 10, 1);
INSERT INTO `stayregisterdetails` VALUES (9, 11, 3);
INSERT INTO `stayregisterdetails` VALUES (10, 12, 3);
INSERT INTO `stayregisterdetails` VALUES (11, 13, 3);
INSERT INTO `stayregisterdetails` VALUES (12, 15, 1);
INSERT INTO `stayregisterdetails` VALUES (13, 14, 12);
INSERT INTO `stayregisterdetails` VALUES (14, 16, 5);
INSERT INTO `stayregisterdetails` VALUES (15, 17, 3);
INSERT INTO `stayregisterdetails` VALUES (16, 19, 1);
INSERT INTO `stayregisterdetails` VALUES (17, 18, 3);
INSERT INTO `stayregisterdetails` VALUES (18, 20, 3);
INSERT INTO `stayregisterdetails` VALUES (19, 20, 19);
INSERT INTO `stayregisterdetails` VALUES (20, 21, 19);
INSERT INTO `stayregisterdetails` VALUES (21, 17, 1);
INSERT INTO `stayregisterdetails` VALUES (22, 22, 4);
INSERT INTO `stayregisterdetails` VALUES (23, 23, 4);
INSERT INTO `stayregisterdetails` VALUES (24, 24, 22);
INSERT INTO `stayregisterdetails` VALUES (25, 25, 1);
INSERT INTO `stayregisterdetails` VALUES (26, 1, 23);
INSERT INTO `stayregisterdetails` VALUES (27, 26, 1);
INSERT INTO `stayregisterdetails` VALUES (28, 26, 25);
INSERT INTO `stayregisterdetails` VALUES (29, 27, 7);
INSERT INTO `stayregisterdetails` VALUES (30, 30, 2);
INSERT INTO `stayregisterdetails` VALUES (31, 28, 26);
INSERT INTO `stayregisterdetails` VALUES (32, 29, 5);
INSERT INTO `stayregisterdetails` VALUES (33, 28, 12);
INSERT INTO `stayregisterdetails` VALUES (34, 31, 1);
INSERT INTO `stayregisterdetails` VALUES (35, 33, 1);
INSERT INTO `stayregisterdetails` VALUES (36, 32, 3);
INSERT INTO `stayregisterdetails` VALUES (37, 34, 19);
INSERT INTO `stayregisterdetails` VALUES (38, 34, 28);
INSERT INTO `stayregisterdetails` VALUES (39, 35, 5);
INSERT INTO `stayregisterdetails` VALUES (40, 36, 7);
INSERT INTO `stayregisterdetails` VALUES (41, 37, 1);
INSERT INTO `stayregisterdetails` VALUES (42, 38, 17);
INSERT INTO `stayregisterdetails` VALUES (43, 39, 12);
INSERT INTO `stayregisterdetails` VALUES (44, 42, 1);
INSERT INTO `stayregisterdetails` VALUES (45, 41, 16);
INSERT INTO `stayregisterdetails` VALUES (46, 40, 18);
INSERT INTO `stayregisterdetails` VALUES (47, 43, 1);
INSERT INTO `stayregisterdetails` VALUES (48, 41, 6);
INSERT INTO `stayregisterdetails` VALUES (49, 46, 4);
INSERT INTO `stayregisterdetails` VALUES (50, 32, 30);
INSERT INTO `stayregisterdetails` VALUES (51, 51, 31);
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (1, 'sa', '123');
INSERT INTO `users` VALUES (2, 'zyq', '123456');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
