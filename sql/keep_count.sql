/*
 Navicat MySQL Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : keep_count

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 06/06/2021 21:20:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for keep_billing_records
-- ----------------------------
DROP TABLE IF EXISTS `keep_billing_records`;
CREATE TABLE `keep_billing_records`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type_dir_id` int(11) NULL DEFAULT NULL COMMENT '账单类型id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `bill_money` double(10, 2) NOT NULL COMMENT '账单金额',
  `bill_time` int(11) NOT NULL COMMENT '账单时间',
  `bill_note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账单备注',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `last_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账单类型',
  `now_format` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前日期',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type_dir_id`(`type_dir_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `keep_billing_records_ibfk_1` FOREIGN KEY (`type_dir_id`) REFERENCES `keep_type_directory` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `keep_billing_records_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `keep_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of keep_billing_records
-- ----------------------------
INSERT INTO `keep_billing_records` VALUES (19, 9, 2, 1.00, 1622505600, '', 1622902767, 1622902767, 'pay', '2021-06-01');
INSERT INTO `keep_billing_records` VALUES (20, 9, 2, 2.00, 1622592000, '', 1622902773, 1622902773, 'pay', '2021-06-02');
INSERT INTO `keep_billing_records` VALUES (21, 1, 2, 2.00, 1622678400, '', 1622902780, 1622902780, 'income', '2021-06-03');
INSERT INTO `keep_billing_records` VALUES (22, 3, 2, 2.00, 1622764800, '', 1622902790, 1622902790, 'income', '2021-06-04');
INSERT INTO `keep_billing_records` VALUES (23, 10, 2, 5.00, 1622902791, '', 1622902795, 1622902795, 'pay', '2021-06-05');
INSERT INTO `keep_billing_records` VALUES (24, 9, 2, 7.00, 1622902795, '', 1622902834, 1622902834, 'pay', '2021-06-05');
INSERT INTO `keep_billing_records` VALUES (25, 1, 2, 25.00, 1622902834, '', 1622903135, 1622903135, 'income', '2021-06-05');
INSERT INTO `keep_billing_records` VALUES (26, 1, 2, 28.00, 1622903136, '', 1622903164, 1622903164, 'income', '2021-06-05');
INSERT INTO `keep_billing_records` VALUES (27, 1, 2, 12.85, 1622903165, '', 1622903320, 1622903320, 'income', '2021-06-05');

-- ----------------------------
-- Table structure for keep_tally_type
-- ----------------------------
DROP TABLE IF EXISTS `keep_tally_type`;
CREATE TABLE `keep_tally_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型名称',
  `type_en` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型英文名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of keep_tally_type
-- ----------------------------
INSERT INTO `keep_tally_type` VALUES (1, '收入', 'income');
INSERT INTO `keep_tally_type` VALUES (2, '支出', 'pay');

-- ----------------------------
-- Table structure for keep_type_directory
-- ----------------------------
DROP TABLE IF EXISTS `keep_type_directory`;
CREATE TABLE `keep_type_directory`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type_id` int(11) NULL DEFAULT NULL COMMENT '类型id',
  `type_dir_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型目录名称',
  `type_dir_icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型目录icon',
  `type_dir_user` int(11) NULL DEFAULT 0 COMMENT '所属用户',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `last_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type_id`(`type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of keep_type_directory
-- ----------------------------
INSERT INTO `keep_type_directory` VALUES (1, 1, '人情', 'icon-renqing', 0, 1622737931, 1622737931);
INSERT INTO `keep_type_directory` VALUES (2, 1, '生意', 'icon-shengyie', 0, 1622737931, 1622737931);
INSERT INTO `keep_type_directory` VALUES (3, 1, '退款', 'icon-tuikuan', 0, 1622737931, 1622737931);
INSERT INTO `keep_type_directory` VALUES (4, 1, '工资', 'icon-gongzi', 0, 1622737931, 1622737931);
INSERT INTO `keep_type_directory` VALUES (5, 1, '奖金', 'icon-jiangjin', 0, 1622737931, 1622737931);
INSERT INTO `keep_type_directory` VALUES (6, 1, '其他', 'icon-qita1', 0, 1622737931, 1622737931);
INSERT INTO `keep_type_directory` VALUES (7, 1, '红包', 'icon-hongbao', 0, 1622737931, 1622737931);
INSERT INTO `keep_type_directory` VALUES (8, 1, '转账', 'icon-zhuanzhang1', 0, 1622737931, 1622737931);
INSERT INTO `keep_type_directory` VALUES (9, 2, '服饰美容', 'icon-fushi', 0, 1622737931, 1622737931);
INSERT INTO `keep_type_directory` VALUES (10, 2, '餐饮', 'icon-canyin', 0, 1622737931, 1622737931);
INSERT INTO `keep_type_directory` VALUES (11, 2, '交通', 'icon-jiaotong', 0, 1622737931, 1622737931);
INSERT INTO `keep_type_directory` VALUES (12, 2, '住房缴费', 'icon-zhufang', 0, 1622737931, 1622737931);
INSERT INTO `keep_type_directory` VALUES (13, 2, '购物', 'icon-mall-normal', 0, 1622737931, 1622737931);
INSERT INTO `keep_type_directory` VALUES (14, 2, '生活服务', 'icon-shenghuofuwu', 0, 1622737931, 1622737931);
INSERT INTO `keep_type_directory` VALUES (15, 2, '学习', 'icon-icon-test', 0, 1622737931, 1622737931);
INSERT INTO `keep_type_directory` VALUES (16, 2, '娱乐', 'icon-yule', 0, 1622737931, 1622737931);
INSERT INTO `keep_type_directory` VALUES (17, 2, '运动', 'icon-yundong', 0, 1622737931, 1622737931);
INSERT INTO `keep_type_directory` VALUES (18, 2, '旅游', 'icon-lvyou', 0, 1622737931, 1622737931);
INSERT INTO `keep_type_directory` VALUES (19, 2, '酒店', 'icon-jiudian', 0, 1622737931, 1622737931);
INSERT INTO `keep_type_directory` VALUES (20, 2, '亲子', 'icon-qinzi', 0, 1622737931, 1622737931);
INSERT INTO `keep_type_directory` VALUES (21, 2, '宠物', 'icon-chongwu', 0, 1622737931, 1622737931);
INSERT INTO `keep_type_directory` VALUES (22, 2, '医疗', 'icon-yiliao', 0, 1622737931, 1622737931);
INSERT INTO `keep_type_directory` VALUES (23, 2, '其他人情', 'icon-renqingwanglai', 0, 1622737931, 1622737931);
INSERT INTO `keep_type_directory` VALUES (24, 2, '其他', 'icon-qita', 0, 1622737931, 1622737931);
INSERT INTO `keep_type_directory` VALUES (25, 2, '红包', 'icon-hongbao', 0, 1622737931, 1622737931);
INSERT INTO `keep_type_directory` VALUES (26, 2, '转账', 'icon-zhuanzhang', 0, 1622737931, 1622737931);
INSERT INTO `keep_type_directory` VALUES (27, 2, '亲属卡', 'icon-qinshuka', 0, 1622737931, 1622737931);
INSERT INTO `keep_type_directory` VALUES (28, 2, '爱情', 'icon-hongbao1', 0, 1622737931, 1622737931);

-- ----------------------------
-- Table structure for keep_user
-- ----------------------------
DROP TABLE IF EXISTS `keep_user`;
CREATE TABLE `keep_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `openid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户微信凭证',
  `head_portrait` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `last_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of keep_user
-- ----------------------------
INSERT INTO `keep_user` VALUES (2, '', 'o8Tfn5RjuRwVb1mCEOg-PUahEvSw', '', 1622899205, 1622899205);

SET FOREIGN_KEY_CHECKS = 1;
