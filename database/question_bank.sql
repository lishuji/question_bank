/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : 127.0.0.1:3306
 Source Schema         : question_bank

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 09/11/2020 17:42:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for answer_record
-- ----------------------------
DROP TABLE IF EXISTS `answer_record`;
CREATE TABLE `answer_record` (
  `id` int NOT NULL,
  `user_id` int NOT NULL COMMENT '考生ID',
  `question_id` int NOT NULL COMMENT '考题ID',
  `user_answer` char(1) NOT NULL COMMENT '考生答案（A；B；C；D）',
  `created_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0' COMMENT '状态（0：正常；1：无效）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='答题记录表';

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `pass_word` varchar(50) NOT NULL COMMENT '密码',
  `created_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL COMMENT '状态（0：正常；1：拉黑）',
  PRIMARY KEY (`id`),
  KEY `idx_name_email_password` (`name`,`email`,`pass_word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台管理员表';

-- ----------------------------
-- Table structure for question_ paper
-- ----------------------------
DROP TABLE IF EXISTS `question_ paper`;
CREATE TABLE `question_ paper` (
  `id` int NOT NULL,
  `question` varchar(255) NOT NULL COMMENT '题目',
  `type` tinyint unsigned NOT NULL COMMENT '考题类型（1：单选；2：多选）',
  `option1` varchar(255) NOT NULL COMMENT 'A选项',
  `option2` varchar(255) NOT NULL COMMENT 'B选项',
  `option3` varchar(255) NOT NULL COMMENT 'C选项',
  `option4` varchar(255) NOT NULL COMMENT 'D选项',
  `right_answer` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '答案（A；B；C；D），多选用英文逗号隔开',
  `explain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '答案解析',
  `score` tinyint(3) unsigned zerofill NOT NULL COMMENT '分数',
  `manager_id` int unsigned NOT NULL COMMENT '考题创建者ID',
  `is_deleted` tinyint(1) unsigned zerofill NOT NULL COMMENT '状态（0：正常；1：删除）',
  `created_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_manager` (`manager_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考题表';

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nick_name` varchar(50) NOT NULL COMMENT '昵称',
  `head_url` varchar(255) DEFAULT NULL COMMENT '头像',
  `open_id` int NOT NULL COMMENT '小程序open_id',
  `phone_no` int(15) unsigned zerofill NOT NULL COMMENT '用户手机号',
  `is_deleted` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '用户状态(0：正常；1：拉黑)',
  `created_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '变更时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

SET FOREIGN_KEY_CHECKS = 1;
