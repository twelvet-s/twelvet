/*
Navicat MySQL Data Transfer

Source Server         : twelvet
Source Server Version : 50728
Source Host           : rm-twelvet.mysql.rds.aliyuncs.com:3306
Source Database       : twelvet

Target Server Type    : MYSQL
Target Server Version : 50728
File Encoding         : 65001

Date: 2021-02-19 11:02:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456');
INSERT INTO `sys_config` VALUES ('3', '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '深色主题theme-dark，浅色主题theme-light');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `status` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0,100,101', 'TWT科技', '1', 'twelvet', '15888888888', '2471835953@qq.com', '1', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-12-31 16:49:51');
INSERT INTO `sys_dept` VALUES ('101', '100', '0,100,101,10,100,1010,100,101', '深圳总公司', '1', '若依', '15888888888', 'ry@qq.com', '1', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-10-23 16:03:40');
INSERT INTO `sys_dept` VALUES ('102', '100', '0,100,101,10,100,1010,100,101', '长沙分公司', '2', '若依', '15888888888', 'ry@qq.com', '1', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('103', '101', '0,100,101,10,100,1010,100,101,10,100,1011', '研发部门', '1', '若依', '15888888888', 'ry@qq.com', '1', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-10-23 14:48:44');
INSERT INTO `sys_dept` VALUES ('104', '101', '0,100,101,10,100,1010,100,101,10,100,1011', '市场部门', '2', '若依', '15888888888', 'ry@qq.com', '1', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('105', '101', '0,100,101,10,100,1010,100,101,10,100,1011', '测试部门', '3', '若依', '15888888888', 'ry@qq.com', '1', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('106', '101', '0,100,101,10,100,1010,100,101,10,100,1011', '财务部门', '4', '若依', '15888888888', 'ry@qq.com', '1', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('107', '101', '0,100,101,10,100,1010,100,101,10,100,1011', '运维部门', '5', '若依', '15888888888', 'ry@qq.com', '1', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('108', '102', '0,100,101,10,100,1010,100,101,10,100,1012', '市场部门', '1', '若依', '15888888888', 'ry@qq.com', '1', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('109', '102', '0,100,101,10,100,1010,100,101,10,100,1012', '财务部门', '2', '若依', '15888888888', 'ry@qq.com', '1', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('110', '100', '0,100,101,100', 'asd', '1', 'asd', 'asd', 'asd', '1', '2', 'admin', '2020-10-23 15:56:47', '', null);

-- ----------------------------
-- Table structure for sys_dfs
-- ----------------------------
DROP TABLE IF EXISTS `sys_dfs`;
CREATE TABLE `sys_dfs` (
  `file_id` tinyint(1) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `file_name` varchar(255) NOT NULL COMMENT '文件名称',
  `original_file_name` varchar(255) DEFAULT NULL COMMENT '文件原名称',
  `space_name` varchar(50) NOT NULL COMMENT '文件分组',
  `path` varchar(150) NOT NULL COMMENT '文件路径',
  `size` int(11) NOT NULL COMMENT '文件大小',
  `type` varchar(10) NOT NULL COMMENT '文件类型',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_dfs
-- ----------------------------
INSERT INTO `sys_dfs` VALUES ('35', 'CgAIDV_x5aKAcjuRAADKsRJKCPw655.png', '3a703950-b1ae-4b54-a7ef-d71007f227da_thumb.png', 'group1', 'group1/M00/00/00/CgAIDV_x5aKAcjuRAADKsRJKCPw655.png', '51889', 'png', '2021-01-03 23:41:22');
INSERT INTO `sys_dfs` VALUES ('36', 'CgAIDV_x5aKAQoi5AAFm0IQsEYI209.jpg', '49d0f6c78ce24c32bed7b3500cbacf2.jpg', 'group1', 'group1/M00/00/00/CgAIDV_x5aKAQoi5AAFm0IQsEYI209.jpg', '91856', 'jpg', '2021-01-03 23:41:22');
INSERT INTO `sys_dfs` VALUES ('37', 'CgAIDWAnR4aAXr6IAADKsRJKCPw653.png', '3a703950-b1ae-4b54-a7ef-d71007f227da_thumb.png', 'group1', 'group1/M00/00/00/CgAIDWAnR4aAXr6IAADKsRJKCPw653.png', '51889', 'png', '2021-02-13 11:29:13');
INSERT INTO `sys_dfs` VALUES ('38', 'CgAIDWAnR4iAeYjsAAARecWA2Gc123.PNG', '11fe66ab90cc4328a05a91227add71df.PNG', 'group1', 'group1/M00/00/00/CgAIDWAnR4iAeYjsAAARecWA2Gc123.PNG', '4473', 'PNG', '2021-02-13 11:29:13');
INSERT INTO `sys_dfs` VALUES ('39', 'CgAIDWAnUjmAVnUaAAFm0IQsEYI124.jpg', '49d0f6c78ce24c32bed7b3500cbacf2.jpg', 'group1', 'group1/M00/00/00/CgAIDWAnUjmAVnUaAAFm0IQsEYI124.jpg', '91856', 'jpg', '2021-02-13 12:14:49');
INSERT INTO `sys_dfs` VALUES ('40', 'CgAIDWAnz96AFKydAAFm0IQsEYI011.jpg', '49d0f6c78ce24c32bed7b3500cbacf2.jpg', 'group1', 'group1/M00/00/00/CgAIDWAnz96AFKydAAFm0IQsEYI011.jpg', '91856', 'jpg', '2021-02-13 21:10:54');
INSERT INTO `sys_dfs` VALUES ('41', 'CgAIDWAn0MGAMPJkAAFm0IQsEYI469.jpg', '49d0f6c78ce24c32bed7b3500cbacf2.jpg', 'group1', 'group1/M00/00/00/CgAIDWAn0MGAMPJkAAFm0IQsEYI469.jpg', '91856', 'jpg', '2021-02-13 21:14:41');
INSERT INTO `sys_dfs` VALUES ('42', 'CgAIDWAn0O6ACpWBAAFm0IQsEYI024.jpg', '49d0f6c78ce24c32bed7b3500cbacf2.jpg', 'group1', 'group1/M00/00/00/CgAIDWAn0O6ACpWBAAFm0IQsEYI024.jpg', '91856', 'jpg', '2021-02-13 21:15:27');
INSERT INTO `sys_dfs` VALUES ('43', 'CgAIDWAn0V6AbkLLAAFm0IQsEYI239.jpg', '49d0f6c78ce24c32bed7b3500cbacf2.jpg', 'group1', 'group1/M00/00/00/CgAIDWAn0V6AbkLLAAFm0IQsEYI239.jpg', '91856', 'jpg', '2021-02-13 21:17:18');
INSERT INTO `sys_dfs` VALUES ('44', 'CgAIDWAn0beARp_eAAFm0IQsEYI567.jpg', '49d0f6c78ce24c32bed7b3500cbacf2.jpg', 'group1', 'group1/M00/00/00/CgAIDWAn0beARp_eAAFm0IQsEYI567.jpg', '91856', 'jpg', '2021-02-13 21:18:47');
INSERT INTO `sys_dfs` VALUES ('45', 'CgAIDWAn0dKAVtvmAADKsRJKCPw569.png', '3a703950-b1ae-4b54-a7ef-d71007f227da_thumb.png', 'group1', 'group1/M00/00/00/CgAIDWAn0dKAVtvmAADKsRJKCPw569.png', '51889', 'png', '2021-02-13 21:19:15');
INSERT INTO `sys_dfs` VALUES ('46', 'CgAIDWAn0eOAJu4kAAFm0IQsEYI043.jpg', '49d0f6c78ce24c32bed7b3500cbacf2.jpg', 'group1', 'group1/M00/00/00/CgAIDWAn0eOAJu4kAAFm0IQsEYI043.jpg', '91856', 'jpg', '2021-02-13 21:19:31');
INSERT INTO `sys_dfs` VALUES ('47', 'CgAIDWAn6N2AF1tKAAFm0IQsEYI928.jpg', '49d0f6c78ce24c32bed7b3500cbacf2.jpg', 'group1', 'group1/M00/00/00/CgAIDWAn6N2AF1tKAAFm0IQsEYI928.jpg', '91856', 'jpg', '2021-02-13 22:57:33');
INSERT INTO `sys_dfs` VALUES ('48', 'CgAIDWAn6lqAHN2lAAFm0IQsEYI529.jpg', '49d0f6c78ce24c32bed7b3500cbacf2.jpg', 'group1', 'group1/M00/00/00/CgAIDWAn6lqAHN2lAAFm0IQsEYI529.jpg', '91856', 'jpg', '2021-02-13 23:03:54');
INSERT INTO `sys_dfs` VALUES ('49', 'CgAIDWAn6oiANBlYAAFm0IQsEYI779.jpg', '49d0f6c78ce24c32bed7b3500cbacf2.jpg', 'group1', 'group1/M00/00/00/CgAIDWAn6oiANBlYAAFm0IQsEYI779.jpg', '91856', 'jpg', '2021-02-13 23:04:40');
INSERT INTO `sys_dfs` VALUES ('50', 'CgAIDWAsiqiAYtv1AADKsRJKCPw391.png', '3a703950-b1ae-4b54-a7ef-d71007f227da_thumb.png', 'group1', 'group1/M00/00/00/CgAIDWAsiqiAYtv1AADKsRJKCPw391.png', '51889', 'png', '2021-02-17 11:16:56');
INSERT INTO `sys_dfs` VALUES ('51', 'CgAIDWAsjzmASMjnAADKsRJKCPw975.png', '3a703950-b1ae-4b54-a7ef-d71007f227da_thumb.png', 'group1', 'group1/M00/00/00/CgAIDWAsjzmASMjnAADKsRJKCPw975.png', '51889', 'png', '2021-02-17 11:36:25');
INSERT INTO `sys_dfs` VALUES ('52', 'CgAIDWAslauAFGm6AADKsRJKCPw870.png', '3a703950-b1ae-4b54-a7ef-d71007f227da_thumb.png', 'group1', 'group1/M00/00/00/CgAIDWAslauAFGm6AADKsRJKCPw870.png', '51889', 'png', '2021-02-17 12:03:55');
INSERT INTO `sys_dfs` VALUES ('53', 'CgAIDWAsla-ANaEOAADKsRJKCPw373.png', '3a703950-b1ae-4b54-a7ef-d71007f227da_thumb.png', 'group1', 'group1/M00/00/00/CgAIDWAsla-ANaEOAADKsRJKCPw373.png', '51889', 'png', '2021-02-17 12:03:59');
INSERT INTO `sys_dfs` VALUES ('54', 'CgAIDWAsljOAEMnbAADKsRJKCPw692.png', '3a703950-b1ae-4b54-a7ef-d71007f227da_thumb.png', 'group1', 'group1/M00/00/00/CgAIDWAsljOAEMnbAADKsRJKCPw692.png', '51889', 'png', '2021-02-17 12:06:11');
INSERT INTO `sys_dfs` VALUES ('55', 'CgAIDWAslmiAUllfAADKsRJKCPw176.png', '3a703950-b1ae-4b54-a7ef-d71007f227da_thumb.png', 'group1', 'group1/M00/00/00/CgAIDWAslmiAUllfAADKsRJKCPw176.png', '51889', 'png', '2021-02-17 12:07:04');
INSERT INTO `sys_dfs` VALUES ('56', 'CgAIDWAspNaAaJFjAAFm0IQsEYI491.jpg', '49d0f6c78ce24c32bed7b3500cbacf2.jpg', 'group1', 'group1/M00/00/00/CgAIDWAspNaAaJFjAAFm0IQsEYI491.jpg', '91856', 'jpg', '2021-02-17 13:08:38');
INSERT INTO `sys_dfs` VALUES ('57', 'CgAIDWAs3PiATwMqAADKsRJKCPw827.png', '3a703950-b1ae-4b54-a7ef-d71007f227da_thumb.png', 'group1', 'group1/M00/00/00/CgAIDWAs3PiATwMqAADKsRJKCPw827.png', '51889', 'png', '2021-02-17 17:08:08');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '1', 'admin', '2021-01-12 22:09:15', 'twelvet', '2021-01-12 22:09:27', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '1', 'admin', '2021-01-12 22:09:15', 'twelvet', '2021-01-12 22:09:27', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '1', 'admin', '2021-01-12 22:09:15', 'twelvet', '2021-01-12 22:09:27', '默认分组');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '1', 'admin', '2021-01-12 22:09:15', 'twelvet', '2021-01-12 22:09:27', '系统分组');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '1', 'admin', '2021-01-12 22:09:15', 'twelvet', '2021-01-12 22:09:27', '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '1', 'admin', '2021-01-12 22:09:15', 'twelvet', '2021-01-12 22:09:27', '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('18', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '1', 'admin', '2021-01-12 22:09:15', 'twelvet', '2021-01-12 22:09:27', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('19', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '1', 'admin', '2021-01-12 22:09:15', 'twelvet', '2021-01-12 22:09:27', '修改操作');
INSERT INTO `sys_dict_data` VALUES ('20', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '1', 'admin', '2021-01-12 22:09:15', 'twelvet', '2021-01-12 22:09:27', '删除操作');
INSERT INTO `sys_dict_data` VALUES ('21', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '1', 'admin', '2021-01-12 22:09:15', 'twelvet', '2021-01-12 22:09:27', '授权操作');
INSERT INTO `sys_dict_data` VALUES ('22', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '1', 'admin', '2021-01-12 22:09:15', 'twelvet', '2021-01-12 22:09:27', '导出操作');
INSERT INTO `sys_dict_data` VALUES ('23', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '1', 'admin', '2021-01-12 22:09:15', 'twelvet', '2021-01-12 22:09:27', '导入操作');
INSERT INTO `sys_dict_data` VALUES ('24', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '1', 'admin', '2021-01-12 22:09:15', 'twelvet', '2021-01-12 22:09:27', '强退操作');
INSERT INTO `sys_dict_data` VALUES ('25', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '1', 'admin', '2021-01-12 22:09:15', 'twelvet', '2021-01-12 22:09:27', '生成操作');
INSERT INTO `sys_dict_data` VALUES ('26', '9', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '1', 'admin', '2021-01-12 22:09:15', 'twelvet', '2021-01-12 22:09:27', '清空操作');
INSERT INTO `sys_dict_data` VALUES ('106', '1', '密码模式', 'password', 'sys_oauth_client_details', null, null, 'N', '1', 'admin', '2021-01-12 22:09:15', '', '2021-01-12 22:09:27', null);
INSERT INTO `sys_dict_data` VALUES ('107', '2', '刷新模式', 'refresh_token', 'sys_oauth_client_details', null, null, 'N', '1', 'admin', '2021-01-12 22:09:15', '', '2021-01-12 22:09:27', null);
INSERT INTO `sys_dict_data` VALUES ('108', '3', '手机号码模式', 'phone_password', 'sys_oauth_client_details', null, null, 'N', '1', 'admin', '2021-01-12 22:09:15', '', '2021-01-12 22:09:27', null);
INSERT INTO `sys_dict_data` VALUES ('109', '4', '授权码模式', 'authorization_code', 'sys_oauth_client_details', null, null, 'N', '1', 'admin', '2021-01-12 22:28:56', '', null, null);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '1', 'admin', '2021-01-12 11:33:00', 'twelvet', '2021-01-12 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '任务分组', 'sys_job_group', '1', 'admin', '2021-01-12 11:33:00', 'twelvet', '2021-01-12 11:33:00', '任务分组列表');
INSERT INTO `sys_dict_type` VALUES ('6', '系统是否', 'sys_yes_no', '1', 'admin', '2021-01-12 11:33:00', 'twelvet', '2021-01-12 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('8', '通知状态', 'sys_notice_status', '1', 'admin', '2021-01-12 11:33:00', 'twelvet', '2021-01-12 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('9', '操作类型', 'sys_oper_type', '1', 'admin', '2021-01-12 11:33:00', 'twelvet', '2021-01-12 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('103', 'OAuth2终端', 'sys_oauth_client_details', '1', 'admin', '2021-01-12 11:33:00', '', '2021-01-12 22:07:34', 'OAuth2终端授权模式');

-- ----------------------------
-- Table structure for sys_login_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_info`;
CREATE TABLE `sys_login_info` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '登录IP地址',
  `status` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '提示信息',
  `access_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=731 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_login_info
-- ----------------------------
INSERT INTO `sys_login_info` VALUES ('16', 'admin', '172.18.71.1', '1', '登录成功', '2020-10-07 16:51:00');
INSERT INTO `sys_login_info` VALUES ('17', 'admin', '172.18.71.1', '1', '登录成功', '2020-10-07 17:52:22');
INSERT INTO `sys_login_info` VALUES ('18', 'admin', '172.18.71.1', '1', '登录成功', '2020-10-07 22:39:03');
INSERT INTO `sys_login_info` VALUES ('21', 'admin', '172.18.71.1', '1', '登录成功', '2020-10-08 16:53:09');
INSERT INTO `sys_login_info` VALUES ('22', 'admin', '172.18.71.1', '1', '登录成功', '2020-10-08 22:08:59');
INSERT INTO `sys_login_info` VALUES ('23', 'admin', '172.18.71.1', '1', '登录成功', '2020-10-10 23:09:58');
INSERT INTO `sys_login_info` VALUES ('24', 'admin', '172.18.71.1', '1', '登录成功', '2020-10-10 23:28:52');
INSERT INTO `sys_login_info` VALUES ('25', 'admin', '172.18.71.1', '1', '登录成功', '2020-10-11 00:26:11');
INSERT INTO `sys_login_info` VALUES ('26', 'admin', '172.18.71.1', '1', '登录成功', '2020-10-12 21:46:52');
INSERT INTO `sys_login_info` VALUES ('27', 'admin', '172.18.71.1', '1', '登录成功', '2020-10-12 22:51:18');
INSERT INTO `sys_login_info` VALUES ('28', 'admin', '172.18.71.1', '1', '登录成功', '2020-10-13 21:01:00');
INSERT INTO `sys_login_info` VALUES ('29', 'admin', '172.18.71.1', '1', '登录成功', '2020-10-13 22:10:37');
INSERT INTO `sys_login_info` VALUES ('30', 'admin', '172.18.71.1', '1', '登录成功', '2020-10-13 23:34:04');
INSERT INTO `sys_login_info` VALUES ('31', 'admin', '172.18.71.1', '1', '登录成功', '2020-10-14 21:18:25');
INSERT INTO `sys_login_info` VALUES ('32', 'admin', '172.18.71.1', '1', '登录成功', '2020-10-14 22:56:48');
INSERT INTO `sys_login_info` VALUES ('33', 'admin', '172.18.71.1', '1', '登录成功', '2020-10-18 16:14:31');
INSERT INTO `sys_login_info` VALUES ('34', 'admin', '172.18.71.1', '1', '登录成功', '2020-10-18 17:53:30');
INSERT INTO `sys_login_info` VALUES ('35', 'admin', '172.18.71.1', '1', '登录成功', '2020-10-18 17:57:35');
INSERT INTO `sys_login_info` VALUES ('36', 'admin', '172.18.71.1', '1', '登录成功', '2020-10-18 17:59:45');
INSERT INTO `sys_login_info` VALUES ('37', 'admin', '172.18.71.1', '1', '登录成功', '2020-10-18 18:00:35');
INSERT INTO `sys_login_info` VALUES ('38', 'admin', '172.18.71.1', '1', '登录成功', '2020-10-18 18:04:09');
INSERT INTO `sys_login_info` VALUES ('39', 'admin', '172.18.71.1', '1', '登录成功', '2020-10-18 18:08:51');
INSERT INTO `sys_login_info` VALUES ('42', 'admin', '192.168.3.229', null, '登录成功', '2020-10-20 18:15:43');
INSERT INTO `sys_login_info` VALUES ('43', 'admin', '192.168.3.229', null, '登录成功', '2020-10-20 18:16:15');
INSERT INTO `sys_login_info` VALUES ('44', 'admin', '192.168.3.229', null, '登录成功', '2020-10-20 19:16:42');
INSERT INTO `sys_login_info` VALUES ('45', 'admin', '172.18.71.1', null, '登录成功', '2020-10-20 20:55:40');
INSERT INTO `sys_login_info` VALUES ('46', 'admin', '172.18.71.1', null, '登录成功', '2020-10-20 22:03:38');
INSERT INTO `sys_login_info` VALUES ('47', 'admin', '192.168.3.229', null, '登录成功', '2020-10-21 10:05:32');
INSERT INTO `sys_login_info` VALUES ('48', 'admin', '192.168.3.229', null, '登录成功', '2020-10-21 11:06:55');
INSERT INTO `sys_login_info` VALUES ('49', 'admin', '192.168.3.229', null, '登录成功', '2020-10-21 11:07:57');
INSERT INTO `sys_login_info` VALUES ('50', 'admin', '192.168.3.229', null, '登录成功', '2020-10-21 14:01:13');
INSERT INTO `sys_login_info` VALUES ('51', 'admin', '192.168.3.229', null, '登录成功', '2020-10-21 15:02:05');
INSERT INTO `sys_login_info` VALUES ('52', 'admin', '192.168.3.229', null, '登录成功', '2020-10-21 15:02:32');
INSERT INTO `sys_login_info` VALUES ('53', 'admin', '192.168.3.229', null, '登录成功', '2020-10-21 16:51:37');
INSERT INTO `sys_login_info` VALUES ('54', 'admin', '192.168.3.229', null, '登录成功', '2020-10-21 16:51:56');
INSERT INTO `sys_login_info` VALUES ('55', 'admin', '192.168.3.229', null, '登录成功', '2020-10-21 17:09:41');
INSERT INTO `sys_login_info` VALUES ('56', 'admin', '192.168.3.229', null, '登录成功', '2020-10-21 17:34:43');
INSERT INTO `sys_login_info` VALUES ('57', 'admin', '192.168.3.229', null, '登录成功', '2020-10-21 18:04:36');
INSERT INTO `sys_login_info` VALUES ('58', 'admin', '172.18.71.1', null, '登录成功', '2020-10-21 20:11:15');
INSERT INTO `sys_login_info` VALUES ('59', 'admin', '172.18.71.1', null, '登录成功', '2020-10-21 21:11:47');
INSERT INTO `sys_login_info` VALUES ('60', 'admin', '172.18.71.1', null, '登录成功', '2020-10-21 22:14:32');
INSERT INTO `sys_login_info` VALUES ('61', 'admin', '192.168.3.229', null, '登录成功', '2020-10-22 09:01:00');
INSERT INTO `sys_login_info` VALUES ('62', 'admin', '192.168.3.229', null, '登录成功', '2020-10-22 10:27:11');
INSERT INTO `sys_login_info` VALUES ('63', 'admin', '192.168.3.229', null, '登录成功', '2020-10-22 11:39:21');
INSERT INTO `sys_login_info` VALUES ('64', 'admin', '192.168.3.229', null, '登录成功', '2020-10-22 14:10:35');
INSERT INTO `sys_login_info` VALUES ('65', 'admin', '192.168.3.229', null, '登录成功', '2020-10-22 15:10:48');
INSERT INTO `sys_login_info` VALUES ('66', 'admin', '192.168.3.229', null, '登录成功', '2020-10-23 10:12:14');
INSERT INTO `sys_login_info` VALUES ('67', 'admin', '192.168.3.229', null, '登录成功', '2020-10-23 11:12:19');
INSERT INTO `sys_login_info` VALUES ('68', 'admin', '192.168.3.229', null, '登录成功', '2020-10-23 14:06:09');
INSERT INTO `sys_login_info` VALUES ('69', 'admin', '192.168.3.229', null, '登录成功', '2020-10-23 15:10:24');
INSERT INTO `sys_login_info` VALUES ('70', 'admin', '192.168.3.229', null, '登录成功', '2020-10-23 16:14:32');
INSERT INTO `sys_login_info` VALUES ('71', 'admin', '192.168.3.229', null, '登录成功', '2020-10-23 17:16:59');
INSERT INTO `sys_login_info` VALUES ('72', 'admin', '172.18.71.1', null, '登录成功', '2020-10-23 20:25:38');
INSERT INTO `sys_login_info` VALUES ('73', 'admin', '172.18.71.1', null, '登录成功', '2020-10-23 22:08:39');
INSERT INTO `sys_login_info` VALUES ('74', 'admin', '172.18.71.1', null, '登录成功', '2020-10-23 23:11:33');
INSERT INTO `sys_login_info` VALUES ('75', 'admin', '172.18.71.1', null, '登录成功', '2020-10-24 18:41:12');
INSERT INTO `sys_login_info` VALUES ('76', 'admin', '172.18.71.1', null, '登录成功', '2020-10-24 18:41:37');
INSERT INTO `sys_login_info` VALUES ('77', 'admin', '172.18.71.1', null, '登录成功', '2020-10-24 20:15:12');
INSERT INTO `sys_login_info` VALUES ('78', 'admin', '172.18.71.1', null, '登录成功', '2020-10-24 22:47:20');
INSERT INTO `sys_login_info` VALUES ('79', 'admin', '172.18.71.1', null, '登录成功', '2020-10-25 00:00:45');
INSERT INTO `sys_login_info` VALUES ('80', 'admin', '172.18.71.1', null, '登录成功', '2020-10-25 09:32:25');
INSERT INTO `sys_login_info` VALUES ('81', 'admin', '172.18.71.1', null, '登录成功', '2020-10-25 15:51:29');
INSERT INTO `sys_login_info` VALUES ('82', 'admin', '172.18.71.1', null, '登录成功', '2020-10-25 15:53:04');
INSERT INTO `sys_login_info` VALUES ('83', 'admin', '172.18.71.1', null, '登录成功', '2020-10-25 15:53:25');
INSERT INTO `sys_login_info` VALUES ('84', 'admin', '172.18.71.1', null, '登录成功', '2020-10-25 17:38:50');
INSERT INTO `sys_login_info` VALUES ('85', 'admin', '172.18.71.1', null, '登录成功', '2020-10-25 18:38:56');
INSERT INTO `sys_login_info` VALUES ('86', 'admin', '172.18.71.1', null, '登录成功', '2020-10-25 19:55:25');
INSERT INTO `sys_login_info` VALUES ('87', 'admin', '172.18.71.1', null, '登录成功', '2020-10-25 20:56:22');
INSERT INTO `sys_login_info` VALUES ('88', 'admin', '172.18.71.1', null, '登录成功', '2020-10-25 21:57:35');
INSERT INTO `sys_login_info` VALUES ('89', 'admin', '192.168.3.229', null, '登录成功', '2020-10-26 11:06:35');
INSERT INTO `sys_login_info` VALUES ('90', 'admin', '192.168.3.229', null, '登录成功', '2020-10-26 12:36:19');
INSERT INTO `sys_login_info` VALUES ('91', 'admin', '192.168.3.229', null, '登录成功', '2020-10-26 14:31:51');
INSERT INTO `sys_login_info` VALUES ('92', 'admin', '192.168.3.229', null, '登录成功', '2020-10-26 14:32:10');
INSERT INTO `sys_login_info` VALUES ('93', 'admin', '192.168.3.229', null, '登录成功', '2020-10-26 14:35:13');
INSERT INTO `sys_login_info` VALUES ('94', 'admin', '192.168.3.229', null, '登录成功', '2020-10-26 15:03:34');
INSERT INTO `sys_login_info` VALUES ('95', 'admin', '192.168.3.229', null, '登录成功', '2020-10-26 15:34:44');
INSERT INTO `sys_login_info` VALUES ('96', 'admin', '192.168.3.229', null, '登录成功', '2020-10-26 16:43:04');
INSERT INTO `sys_login_info` VALUES ('97', 'admin', '192.168.3.229', null, '登录成功', '2020-10-26 17:43:26');
INSERT INTO `sys_login_info` VALUES ('98', 'admin', '172.18.71.1', null, '登录成功', '2020-10-26 21:27:57');
INSERT INTO `sys_login_info` VALUES ('99', 'admin', '172.18.71.1', null, '登录成功', '2020-10-26 22:28:54');
INSERT INTO `sys_login_info` VALUES ('100', 'admin', '172.18.71.1', null, '登录成功', '2020-10-26 23:49:49');
INSERT INTO `sys_login_info` VALUES ('101', 'admin', '172.18.71.1', null, '登录成功', '2020-10-27 20:32:59');
INSERT INTO `sys_login_info` VALUES ('102', 'admin', '172.18.71.1', null, '登录成功', '2020-10-27 21:59:55');
INSERT INTO `sys_login_info` VALUES ('103', 'admin', '172.18.71.1', null, '登录成功', '2020-10-27 23:42:25');
INSERT INTO `sys_login_info` VALUES ('104', 'admin', '192.168.3.229', null, '登录成功', '2020-10-28 12:50:50');
INSERT INTO `sys_login_info` VALUES ('105', 'admin', '192.168.3.229', null, '登录成功', '2020-10-28 14:01:07');
INSERT INTO `sys_login_info` VALUES ('106', 'admin', '192.168.3.229', null, '登录成功', '2020-10-28 15:15:33');
INSERT INTO `sys_login_info` VALUES ('107', 'admin', '192.168.3.229', null, '登录成功', '2020-10-28 15:27:32');
INSERT INTO `sys_login_info` VALUES ('108', 'admin', '192.168.3.229', null, '登录成功', '2020-10-28 16:27:50');
INSERT INTO `sys_login_info` VALUES ('109', 'admin', '192.168.3.229', null, '登录成功', '2020-10-28 17:29:54');
INSERT INTO `sys_login_info` VALUES ('110', 'admin', '192.168.3.229', null, '登录成功', '2020-10-28 18:41:01');
INSERT INTO `sys_login_info` VALUES ('111', 'admin', '172.18.71.1', null, '登录成功', '2020-10-29 20:18:06');
INSERT INTO `sys_login_info` VALUES ('112', 'admin', '172.18.71.1', null, '登录成功', '2020-10-29 21:59:52');
INSERT INTO `sys_login_info` VALUES ('113', 'admin', '172.18.71.1', null, '登录成功', '2020-10-29 23:20:52');
INSERT INTO `sys_login_info` VALUES ('114', 'admin', '172.18.71.1', null, '登录成功', '2020-10-30 21:11:54');
INSERT INTO `sys_login_info` VALUES ('115', 'admin', '172.18.71.1', null, '登录成功', '2020-10-30 22:58:11');
INSERT INTO `sys_login_info` VALUES ('116', 'admin', '172.18.71.1', null, '登录成功', '2020-10-31 11:44:29');
INSERT INTO `sys_login_info` VALUES ('117', 'demo', '172.18.71.1', null, '登录成功', '2020-10-31 11:44:56');
INSERT INTO `sys_login_info` VALUES ('118', 'admin', '172.18.71.1', null, '登录成功', '2020-10-31 13:02:16');
INSERT INTO `sys_login_info` VALUES ('119', 'admin', '172.18.71.1', null, '登录成功', '2020-10-31 17:37:28');
INSERT INTO `sys_login_info` VALUES ('120', 'admin', '172.18.71.1', null, '登录成功', '2020-10-31 18:43:15');
INSERT INTO `sys_login_info` VALUES ('121', 'admin', '172.18.71.1', null, '登录成功', '2020-10-31 20:04:11');
INSERT INTO `sys_login_info` VALUES ('122', 'admin', '172.18.71.1', null, '登录成功', '2020-10-31 22:06:39');
INSERT INTO `sys_login_info` VALUES ('123', 'admin', '172.18.71.1', null, '登录成功', '2020-10-31 23:39:26');
INSERT INTO `sys_login_info` VALUES ('124', 'admin', '172.18.71.1', null, '登录成功', '2020-11-01 11:02:16');
INSERT INTO `sys_login_info` VALUES ('125', 'admin', '172.18.71.1', null, '登录成功', '2020-11-01 12:02:30');
INSERT INTO `sys_login_info` VALUES ('126', 'admin', '172.18.71.1', null, '登录成功', '2020-11-01 16:40:22');
INSERT INTO `sys_login_info` VALUES ('127', 'admin', '172.18.71.1', null, '登录成功', '2020-11-01 17:42:53');
INSERT INTO `sys_login_info` VALUES ('128', 'admin', '172.18.71.1', null, '登录成功', '2020-11-01 19:01:57');
INSERT INTO `sys_login_info` VALUES ('129', 'admin', '172.18.71.1', null, '登录成功', '2020-11-01 20:07:04');
INSERT INTO `sys_login_info` VALUES ('130', 'admin', '172.18.71.1', null, '登录成功', '2020-11-01 21:13:12');
INSERT INTO `sys_login_info` VALUES ('131', 'admin', '172.18.71.1', null, '登录成功', '2020-11-01 22:13:42');
INSERT INTO `sys_login_info` VALUES ('132', 'admin', '172.18.71.1', null, '登录成功', '2020-11-01 23:15:48');
INSERT INTO `sys_login_info` VALUES ('133', 'admin', '192.168.3.229', null, '登录成功', '2020-11-03 15:29:10');
INSERT INTO `sys_login_info` VALUES ('134', 'admin', '192.168.3.229', null, '登录成功', '2020-11-03 15:29:24');
INSERT INTO `sys_login_info` VALUES ('135', 'admin', '192.168.3.229', null, '登录成功', '2020-11-03 18:29:41');
INSERT INTO `sys_login_info` VALUES ('136', 'admin', '172.18.71.1', null, '登录成功', '2020-11-03 21:12:44');
INSERT INTO `sys_login_info` VALUES ('137', 'admin', '192.168.3.229', null, '登录成功', '2020-11-04 12:33:55');
INSERT INTO `sys_login_info` VALUES ('138', 'admin', '192.168.3.229', null, '登录成功', '2020-11-04 14:06:09');
INSERT INTO `sys_login_info` VALUES ('139', 'admin', '192.168.3.229', null, '登录成功', '2020-11-04 15:58:29');
INSERT INTO `sys_login_info` VALUES ('140', 'admin', '47.107.77.38', null, '登录成功', '2020-11-04 17:13:16');
INSERT INTO `sys_login_info` VALUES ('141', 'admin', '47.107.77.38', null, '登录成功', '2020-11-04 20:50:15');
INSERT INTO `sys_login_info` VALUES ('142', 'admin', '47.107.77.38', null, '登录成功', '2020-11-04 22:22:13');
INSERT INTO `sys_login_info` VALUES ('143', 'admin', '47.107.77.38', null, '登录成功', '2020-11-04 23:07:51');
INSERT INTO `sys_login_info` VALUES ('144', 'admin', '47.107.77.38', null, '登录成功', '2020-11-04 23:24:24');
INSERT INTO `sys_login_info` VALUES ('145', 'admin', '47.107.77.38', null, '登录成功', '2020-11-05 20:16:12');
INSERT INTO `sys_login_info` VALUES ('146', 'admin', '47.107.77.38', null, '登录成功', '2020-11-05 21:22:23');
INSERT INTO `sys_login_info` VALUES ('147', 'admin', '47.107.77.38', null, '登录成功', '2020-11-05 23:06:39');
INSERT INTO `sys_login_info` VALUES ('148', 'admin', '47.107.77.38', null, '登录成功', '2020-11-06 20:40:25');
INSERT INTO `sys_login_info` VALUES ('149', 'admin', '47.107.77.38', null, '登录成功', '2020-11-06 22:14:27');
INSERT INTO `sys_login_info` VALUES ('150', 'admin', '47.107.77.38', null, '登录成功', '2020-11-07 11:33:02');
INSERT INTO `sys_login_info` VALUES ('151', 'admin', '47.107.77.38', null, '登录成功', '2020-11-07 11:53:55');
INSERT INTO `sys_login_info` VALUES ('152', 'admin', '47.107.77.38', null, '登录成功', '2020-11-07 11:54:44');
INSERT INTO `sys_login_info` VALUES ('153', 'admin', '127.0.0.1', null, '登录成功', '2020-11-07 12:13:46');
INSERT INTO `sys_login_info` VALUES ('154', 'admin', '47.107.77.38', null, '登录成功', '2020-11-07 12:35:39');
INSERT INTO `sys_login_info` VALUES ('155', 'admin', '47.107.77.38', null, '登录成功', '2020-11-07 16:26:00');
INSERT INTO `sys_login_info` VALUES ('156', 'admin', '47.107.77.38', null, '登录成功', '2020-11-07 18:03:51');
INSERT INTO `sys_login_info` VALUES ('157', 'admin', '47.107.77.38', null, '登录成功', '2020-11-07 18:18:25');
INSERT INTO `sys_login_info` VALUES ('158', 'admin', '47.107.77.38', null, '登录成功', '2020-11-07 19:40:30');
INSERT INTO `sys_login_info` VALUES ('159', 'admin', '47.107.77.38', null, '登录成功', '2020-11-07 21:09:49');
INSERT INTO `sys_login_info` VALUES ('160', 'admin', '47.107.77.38', null, '登录成功', '2020-11-07 22:41:23');
INSERT INTO `sys_login_info` VALUES ('161', 'admin', '47.107.77.38', null, '登录成功', '2020-11-08 00:10:42');
INSERT INTO `sys_login_info` VALUES ('162', 'admin', '47.107.77.38', null, '登录成功', '2020-11-08 11:40:59');
INSERT INTO `sys_login_info` VALUES ('163', 'admin', '47.107.77.38', null, '登录成功', '2020-11-08 14:00:15');
INSERT INTO `sys_login_info` VALUES ('164', 'admin', '47.107.77.38', null, '登录成功', '2020-11-08 16:19:38');
INSERT INTO `sys_login_info` VALUES ('165', 'admin', '47.107.77.38', null, '登录成功', '2020-11-08 17:34:04');
INSERT INTO `sys_login_info` VALUES ('166', 'admin', '47.107.77.38', null, '登录成功', '2020-11-08 18:35:56');
INSERT INTO `sys_login_info` VALUES ('167', 'admin', '47.107.77.38', null, '登录成功', '2020-11-08 19:53:26');
INSERT INTO `sys_login_info` VALUES ('168', 'admin', '47.107.77.38', null, '登录成功', '2020-11-08 21:29:44');
INSERT INTO `sys_login_info` VALUES ('169', 'admin', '47.107.77.38', null, '登录成功', '2020-11-08 22:48:26');
INSERT INTO `sys_login_info` VALUES ('170', 'admin', '47.107.77.38', null, '登录成功', '2020-11-09 20:13:09');
INSERT INTO `sys_login_info` VALUES ('171', 'admin', '47.107.77.38', null, '登录成功', '2020-11-09 22:49:51');
INSERT INTO `sys_login_info` VALUES ('172', 'admin', '47.107.77.38', null, '登录成功', '2020-11-10 20:30:55');
INSERT INTO `sys_login_info` VALUES ('173', 'admin', '47.107.77.38', null, '登录成功', '2020-11-10 21:46:25');
INSERT INTO `sys_login_info` VALUES ('174', 'admin', '47.107.77.38', null, '登录成功', '2020-11-10 23:38:35');
INSERT INTO `sys_login_info` VALUES ('175', 'admin', '47.107.77.38', null, '登录成功', '2020-11-11 17:21:31');
INSERT INTO `sys_login_info` VALUES ('176', 'admin', '47.107.77.38', null, '登录成功', '2020-11-11 18:21:34');
INSERT INTO `sys_login_info` VALUES ('177', 'admin', '47.107.77.38', null, '登录成功', '2020-11-11 20:49:37');
INSERT INTO `sys_login_info` VALUES ('178', 'admin', '47.107.77.38', null, '登录成功', '2020-11-11 22:08:45');
INSERT INTO `sys_login_info` VALUES ('179', 'admin', '47.107.77.38', null, '登录成功', '2020-11-11 23:35:21');
INSERT INTO `sys_login_info` VALUES ('180', 'admin', '47.107.77.38', null, '登录成功', '2020-11-12 09:21:37');
INSERT INTO `sys_login_info` VALUES ('181', 'admin', '47.107.77.38', null, '登录成功', '2020-11-12 11:12:33');
INSERT INTO `sys_login_info` VALUES ('182', 'admin', '47.107.77.38', null, '登录成功', '2020-11-12 14:10:57');
INSERT INTO `sys_login_info` VALUES ('183', 'admin', '47.107.77.38', null, '登录成功', '2020-11-12 16:02:25');
INSERT INTO `sys_login_info` VALUES ('184', 'admin', '47.107.77.38', null, '登录成功', '2020-11-12 17:07:48');
INSERT INTO `sys_login_info` VALUES ('185', 'admin', '127.0.0.1', null, '登录成功', '2020-11-12 20:13:31');
INSERT INTO `sys_login_info` VALUES ('186', 'admin', '127.0.0.1', null, '登录成功', '2020-11-12 21:19:40');
INSERT INTO `sys_login_info` VALUES ('187', 'admin', '127.0.0.1', null, '登录成功', '2020-11-12 22:35:49');
INSERT INTO `sys_login_info` VALUES ('188', 'admin', '127.0.0.1', null, '登录成功', '2020-11-12 23:39:34');
INSERT INTO `sys_login_info` VALUES ('189', 'admin', '127.0.0.1', null, '登录成功', '2020-11-13 10:35:49');
INSERT INTO `sys_login_info` VALUES ('190', 'admin', '127.0.0.1', null, '登录成功', '2020-11-13 11:38:35');
INSERT INTO `sys_login_info` VALUES ('191', 'admin', '127.0.0.1', null, '登录成功', '2020-11-13 14:05:28');
INSERT INTO `sys_login_info` VALUES ('192', 'admin', '127.0.0.1', null, '登录成功', '2020-11-13 15:14:41');
INSERT INTO `sys_login_info` VALUES ('193', 'admin', '127.0.0.1', null, '登录成功', '2020-11-13 16:20:34');
INSERT INTO `sys_login_info` VALUES ('194', 'admin', '127.0.0.1', null, '登录成功', '2020-11-13 19:46:58');
INSERT INTO `sys_login_info` VALUES ('195', 'admin', '127.0.0.1', null, '登录成功', '2020-11-13 21:51:36');
INSERT INTO `sys_login_info` VALUES ('196', 'admin', '127.0.0.1', null, '登录成功', '2020-11-13 23:41:30');
INSERT INTO `sys_login_info` VALUES ('197', 'admin', '127.0.0.1', null, '登录成功', '2020-11-13 23:42:05');
INSERT INTO `sys_login_info` VALUES ('198', 'admin', '127.0.0.1', null, '登录成功', '2020-11-13 23:44:54');
INSERT INTO `sys_login_info` VALUES ('199', 'admin', '127.0.0.1', null, '登录成功', '2020-11-13 23:45:10');
INSERT INTO `sys_login_info` VALUES ('200', 'admin', '127.0.0.1', null, '登录成功', '2020-11-13 23:45:49');
INSERT INTO `sys_login_info` VALUES ('201', 'admin', '127.0.0.1', null, '登录成功', '2020-11-13 23:46:22');
INSERT INTO `sys_login_info` VALUES ('202', 'admin', '127.0.0.1', null, '登录成功', '2020-11-13 23:46:38');
INSERT INTO `sys_login_info` VALUES ('203', 'admin', '127.0.0.1', null, '登录成功', '2020-11-13 23:48:07');
INSERT INTO `sys_login_info` VALUES ('204', 'admin', '127.0.0.1', null, '登录成功', '2020-11-14 11:11:08');
INSERT INTO `sys_login_info` VALUES ('205', 'admin', '127.0.0.1', null, '登录成功', '2020-11-14 12:11:28');
INSERT INTO `sys_login_info` VALUES ('206', 'admin', '127.0.0.1', null, '登录成功', '2020-11-14 16:18:08');
INSERT INTO `sys_login_info` VALUES ('207', 'admin', '127.0.0.1', null, '登录成功', '2020-11-14 19:01:43');
INSERT INTO `sys_login_info` VALUES ('208', 'admin', '127.0.0.1', null, '登录成功', '2020-11-14 20:47:45');
INSERT INTO `sys_login_info` VALUES ('209', 'admin', '127.0.0.1', null, '登录成功', '2020-11-14 21:49:30');
INSERT INTO `sys_login_info` VALUES ('210', 'admin', '127.0.0.1', null, '登录成功', '2020-11-14 23:18:44');
INSERT INTO `sys_login_info` VALUES ('211', 'admin', '127.0.0.1', null, '登录成功', '2020-11-15 00:18:58');
INSERT INTO `sys_login_info` VALUES ('212', 'admin', '127.0.0.1', null, '登录成功', '2020-11-15 11:48:30');
INSERT INTO `sys_login_info` VALUES ('213', 'admin', '127.0.0.1', null, '登录成功', '2020-11-15 18:00:03');
INSERT INTO `sys_login_info` VALUES ('214', 'admin', '127.0.0.1', null, '登录成功', '2020-11-15 19:55:26');
INSERT INTO `sys_login_info` VALUES ('215', 'admin', '127.0.0.1', null, '登录成功', '2020-11-16 14:22:01');
INSERT INTO `sys_login_info` VALUES ('216', 'admin', '127.0.0.1', null, '登录成功', '2020-11-16 15:48:37');
INSERT INTO `sys_login_info` VALUES ('217', 'admin', '127.0.0.1', null, '登录成功', '2020-11-16 15:50:21');
INSERT INTO `sys_login_info` VALUES ('218', 'admin', '127.0.0.1', null, '登录成功', '2020-11-16 17:17:42');
INSERT INTO `sys_login_info` VALUES ('219', 'admin', '127.0.0.1', null, '登录成功', '2020-11-16 18:18:03');
INSERT INTO `sys_login_info` VALUES ('220', 'admin', '127.0.0.1', null, '登录成功', '2020-11-16 20:11:40');
INSERT INTO `sys_login_info` VALUES ('221', 'admin', '127.0.0.1', null, '登录成功', '2020-11-16 22:27:52');
INSERT INTO `sys_login_info` VALUES ('222', 'admin', '127.0.0.1', null, '登录成功', '2020-11-16 23:46:15');
INSERT INTO `sys_login_info` VALUES ('223', 'admin', '127.0.0.1', null, '登录成功', '2020-11-18 23:12:13');
INSERT INTO `sys_login_info` VALUES ('224', 'admin', '127.0.0.1', null, '登录成功', '2020-11-19 09:38:05');
INSERT INTO `sys_login_info` VALUES ('225', 'admin', '127.0.0.1', null, '登录成功', '2020-11-19 10:40:42');
INSERT INTO `sys_login_info` VALUES ('226', 'admin', '127.0.0.1', null, '登录成功', '2020-11-19 12:36:44');
INSERT INTO `sys_login_info` VALUES ('227', 'admin', '127.0.0.1', null, '登录成功', '2020-11-19 14:01:17');
INSERT INTO `sys_login_info` VALUES ('228', 'demo', '127.0.0.1', null, '登录成功', '2020-11-19 14:07:20');
INSERT INTO `sys_login_info` VALUES ('229', 'demo', '127.0.0.1', null, '登录成功', '2020-11-19 14:10:58');
INSERT INTO `sys_login_info` VALUES ('230', 'admin', '127.0.0.1', null, '登录成功', '2020-11-19 17:52:16');
INSERT INTO `sys_login_info` VALUES ('231', 'admin', '127.0.0.1', null, '登录成功', '2020-11-19 17:58:49');
INSERT INTO `sys_login_info` VALUES ('232', 'admin', '127.0.0.1', null, '登录成功', '2020-11-19 19:43:04');
INSERT INTO `sys_login_info` VALUES ('233', 'admin', '127.0.0.1', null, '登录成功', '2020-11-19 22:22:46');
INSERT INTO `sys_login_info` VALUES ('234', 'demo', '127.0.0.1', null, '登录成功', '2020-11-19 22:57:25');
INSERT INTO `sys_login_info` VALUES ('235', 'admin', '127.0.0.1', null, '登录成功', '2020-11-19 23:42:59');
INSERT INTO `sys_login_info` VALUES ('236', 'demo', '127.0.0.1', null, '登录成功', '2020-11-19 23:44:52');
INSERT INTO `sys_login_info` VALUES ('237', 'admin', '127.0.0.1', null, '登录成功', '2020-11-19 23:45:08');
INSERT INTO `sys_login_info` VALUES ('238', 'admin', '127.0.0.1', null, '登录成功', '2020-11-19 23:52:33');
INSERT INTO `sys_login_info` VALUES ('239', 'admin', '127.0.0.1', null, '登录成功', '2020-11-19 23:52:55');
INSERT INTO `sys_login_info` VALUES ('240', 'demo', '127.0.0.1', null, '登录成功', '2020-11-19 23:55:31');
INSERT INTO `sys_login_info` VALUES ('241', 'admin', '127.0.0.1', null, '登录成功', '2020-11-21 20:30:02');
INSERT INTO `sys_login_info` VALUES ('242', 'admin', '127.0.0.1', null, '登录成功', '2020-11-21 21:44:16');
INSERT INTO `sys_login_info` VALUES ('243', 'admin', '127.0.0.1', null, '登录成功', '2020-11-21 21:46:13');
INSERT INTO `sys_login_info` VALUES ('244', 'admin', '127.0.0.1', null, '登录成功', '2020-11-21 22:47:53');
INSERT INTO `sys_login_info` VALUES ('245', 'admin', '127.0.0.1', null, '登录成功', '2020-11-22 12:20:50');
INSERT INTO `sys_login_info` VALUES ('246', 'admin', '127.0.0.1', null, '登录成功', '2020-11-22 13:21:14');
INSERT INTO `sys_login_info` VALUES ('247', 'admin', '127.0.0.1', null, '登录成功', '2020-11-22 17:06:19');
INSERT INTO `sys_login_info` VALUES ('248', 'admin', '127.0.0.1', null, '登录成功', '2020-11-22 18:13:10');
INSERT INTO `sys_login_info` VALUES ('249', 'admin', '127.0.0.1', null, '登录成功', '2020-11-22 18:22:22');
INSERT INTO `sys_login_info` VALUES ('250', 'admin', '127.0.0.1', null, '登录成功', '2020-11-22 19:25:33');
INSERT INTO `sys_login_info` VALUES ('251', 'admin', '127.0.0.1', null, '登录成功', '2020-11-22 21:55:12');
INSERT INTO `sys_login_info` VALUES ('252', 'admin', '127.0.0.1', null, '登录成功', '2020-11-29 10:38:00');
INSERT INTO `sys_login_info` VALUES ('253', 'admin', '127.0.0.1', null, '登录成功', '2020-11-29 12:51:23');
INSERT INTO `sys_login_info` VALUES ('254', 'admin', '127.0.0.1', null, '登录成功', '2020-11-29 21:32:24');
INSERT INTO `sys_login_info` VALUES ('255', 'admin', '127.0.0.1', null, '登录成功', '2020-11-29 21:51:23');
INSERT INTO `sys_login_info` VALUES ('256', 'admin', '127.0.0.1', null, '登录成功', '2020-11-29 22:33:34');
INSERT INTO `sys_login_info` VALUES ('257', 'admin', '127.0.0.1', null, '登录成功', '2020-11-29 23:43:50');
INSERT INTO `sys_login_info` VALUES ('258', 'admin', '127.0.0.1', null, '登录成功', '2020-11-30 21:24:34');
INSERT INTO `sys_login_info` VALUES ('259', 'admin', '127.0.0.1', null, '登录成功', '2020-11-30 22:20:00');
INSERT INTO `sys_login_info` VALUES ('260', 'admin', '127.0.0.1', null, '登录成功', '2020-11-30 22:20:21');
INSERT INTO `sys_login_info` VALUES ('261', 'admin', '127.0.0.1', null, '登录成功', '2020-11-30 22:41:37');
INSERT INTO `sys_login_info` VALUES ('262', 'admin', '127.0.0.1', null, '登录成功', '2020-12-01 09:43:44');
INSERT INTO `sys_login_info` VALUES ('263', 'admin', '127.0.0.1', null, '登录成功', '2020-12-01 11:07:08');
INSERT INTO `sys_login_info` VALUES ('264', 'admin', '127.0.0.1', null, '登录成功', '2020-12-01 14:02:16');
INSERT INTO `sys_login_info` VALUES ('265', 'admin', '127.0.0.1', null, '登录成功', '2020-12-01 15:02:59');
INSERT INTO `sys_login_info` VALUES ('266', 'admin', '127.0.0.1', null, '登录成功', '2020-12-01 15:45:34');
INSERT INTO `sys_login_info` VALUES ('267', 'admin', '127.0.0.1', null, '登录成功', '2020-12-01 15:47:06');
INSERT INTO `sys_login_info` VALUES ('268', 'admin', '127.0.0.1', null, '登录成功', '2020-12-01 15:48:02');
INSERT INTO `sys_login_info` VALUES ('269', 'admin', '127.0.0.1', null, '登录成功', '2020-12-01 15:50:18');
INSERT INTO `sys_login_info` VALUES ('270', 'admin', '127.0.0.1', null, '登录成功', '2020-12-01 15:51:36');
INSERT INTO `sys_login_info` VALUES ('271', 'admin', '127.0.0.1', null, '登录成功', '2020-12-01 15:52:00');
INSERT INTO `sys_login_info` VALUES ('272', 'admin', '127.0.0.1', null, '登录成功', '2020-12-01 15:58:07');
INSERT INTO `sys_login_info` VALUES ('273', 'admin', '127.0.0.1', null, '登录成功', '2020-12-01 15:59:45');
INSERT INTO `sys_login_info` VALUES ('274', 'admin', '127.0.0.1', null, '登录成功', '2020-12-01 15:59:52');
INSERT INTO `sys_login_info` VALUES ('275', 'admin', '127.0.0.1', null, '登录成功', '2020-12-01 16:00:08');
INSERT INTO `sys_login_info` VALUES ('276', 'admin', '127.0.0.1', null, '登录成功', '2020-12-01 16:01:12');
INSERT INTO `sys_login_info` VALUES ('277', 'admin', '127.0.0.1', null, '登录成功', '2020-12-01 16:01:57');
INSERT INTO `sys_login_info` VALUES ('278', 'admin', '127.0.0.1', null, '登录成功', '2020-12-01 16:03:22');
INSERT INTO `sys_login_info` VALUES ('279', 'admin', '127.0.0.1', null, '登录成功', '2020-12-01 16:06:30');
INSERT INTO `sys_login_info` VALUES ('280', 'admin', '127.0.0.1', null, '登录成功', '2020-12-01 16:06:53');
INSERT INTO `sys_login_info` VALUES ('281', 'admin', '127.0.0.1', null, '登录成功', '2020-12-01 16:24:23');
INSERT INTO `sys_login_info` VALUES ('282', 'admin', '127.0.0.1', null, '登录成功', '2020-12-01 20:02:37');
INSERT INTO `sys_login_info` VALUES ('283', 'admin', '127.0.0.1', null, '登录成功', '2020-12-01 21:37:52');
INSERT INTO `sys_login_info` VALUES ('284', 'admin', '127.0.0.1', null, '登录成功', '2020-12-01 22:44:32');
INSERT INTO `sys_login_info` VALUES ('285', 'admin', '127.0.0.1', null, '登录成功', '2020-12-02 14:08:18');
INSERT INTO `sys_login_info` VALUES ('286', 'admin', '127.0.0.1', null, '登录成功', '2020-12-02 15:08:53');
INSERT INTO `sys_login_info` VALUES ('287', 'admin', '127.0.0.1', null, '登录成功', '2020-12-02 16:10:40');
INSERT INTO `sys_login_info` VALUES ('288', 'admin', '127.0.0.1', null, '登录成功', '2020-12-02 18:32:34');
INSERT INTO `sys_login_info` VALUES ('289', 'admin', '127.0.0.1', null, '登录成功', '2020-12-02 18:38:50');
INSERT INTO `sys_login_info` VALUES ('290', 'admin', '127.0.0.1', null, '登录成功', '2020-12-02 18:40:08');
INSERT INTO `sys_login_info` VALUES ('291', 'admin', '127.0.0.1', null, '登录成功', '2020-12-02 18:42:58');
INSERT INTO `sys_login_info` VALUES ('292', 'admin', '127.0.0.1', null, '登录成功', '2020-12-02 18:55:08');
INSERT INTO `sys_login_info` VALUES ('293', 'admin', '127.0.0.1', null, '登录成功', '2020-12-02 21:13:45');
INSERT INTO `sys_login_info` VALUES ('294', 'admin', '127.0.0.1', null, '登录成功', '2020-12-02 21:19:07');
INSERT INTO `sys_login_info` VALUES ('295', 'admin', '127.0.0.1', null, '登录成功', '2020-12-02 21:53:24');
INSERT INTO `sys_login_info` VALUES ('296', 'admin', '127.0.0.1', null, '登录成功', '2020-12-02 22:02:03');
INSERT INTO `sys_login_info` VALUES ('297', 'admin', '127.0.0.1', null, '登录成功', '2020-12-02 23:50:14');
INSERT INTO `sys_login_info` VALUES ('298', 'admin', '127.0.0.1', null, '登录成功', '2020-12-02 23:51:41');
INSERT INTO `sys_login_info` VALUES ('299', 'admin', '127.0.0.1', null, '登录成功', '2020-12-02 23:53:25');
INSERT INTO `sys_login_info` VALUES ('300', 'admin', '127.0.0.1', null, '登录成功', '2020-12-03 10:23:00');
INSERT INTO `sys_login_info` VALUES ('301', 'admin', '127.0.0.1', null, '登录成功', '2020-12-03 10:23:58');
INSERT INTO `sys_login_info` VALUES ('302', 'admin', '127.0.0.1', null, '登录成功', '2020-12-03 10:24:02');
INSERT INTO `sys_login_info` VALUES ('303', 'admin', '127.0.0.1', null, '登录成功', '2020-12-03 10:24:03');
INSERT INTO `sys_login_info` VALUES ('304', 'admin', '127.0.0.1', null, '登录成功', '2020-12-03 10:24:05');
INSERT INTO `sys_login_info` VALUES ('305', 'admin', '127.0.0.1', null, '登录成功', '2020-12-03 10:27:07');
INSERT INTO `sys_login_info` VALUES ('306', 'admin', '127.0.0.1', null, '登录成功', '2020-12-03 10:27:29');
INSERT INTO `sys_login_info` VALUES ('307', 'admin', '127.0.0.1', null, '登录成功', '2020-12-03 10:38:38');
INSERT INTO `sys_login_info` VALUES ('308', 'admin', '127.0.0.1', null, '登录成功', '2020-12-03 10:38:42');
INSERT INTO `sys_login_info` VALUES ('309', 'admin', '127.0.0.1', null, '登录成功', '2020-12-03 10:38:48');
INSERT INTO `sys_login_info` VALUES ('310', 'admin', '127.0.0.1', null, '登录成功', '2020-12-03 10:38:50');
INSERT INTO `sys_login_info` VALUES ('311', 'admin', '127.0.0.1', null, '登录成功', '2020-12-03 10:38:52');
INSERT INTO `sys_login_info` VALUES ('312', 'admin', '127.0.0.1', null, '登录成功', '2020-12-03 10:38:53');
INSERT INTO `sys_login_info` VALUES ('313', 'admin', '127.0.0.1', null, '登录成功', '2020-12-03 10:39:01');
INSERT INTO `sys_login_info` VALUES ('314', 'admin', '127.0.0.1', null, '登录成功', '2020-12-03 11:12:30');
INSERT INTO `sys_login_info` VALUES ('315', 'admin', '127.0.0.1', null, '登录成功', '2020-12-03 11:14:13');
INSERT INTO `sys_login_info` VALUES ('316', 'admin', '127.0.0.1', null, '登录成功', '2020-12-03 11:14:51');
INSERT INTO `sys_login_info` VALUES ('317', 'admin', '127.0.0.1', null, '登录成功', '2020-12-03 11:16:14');
INSERT INTO `sys_login_info` VALUES ('318', 'admin', '127.0.0.1', null, '登录成功', '2020-12-03 11:16:18');
INSERT INTO `sys_login_info` VALUES ('319', 'admin', '127.0.0.1', null, '登录成功', '2020-12-03 11:18:04');
INSERT INTO `sys_login_info` VALUES ('320', 'admin', '127.0.0.1', null, '登录成功', '2020-12-03 11:22:21');
INSERT INTO `sys_login_info` VALUES ('321', 'admin', '127.0.0.1', null, '登录成功', '2020-12-03 11:22:34');
INSERT INTO `sys_login_info` VALUES ('322', 'admin', '127.0.0.1', null, '登录成功', '2020-12-03 11:28:51');
INSERT INTO `sys_login_info` VALUES ('323', 'admin', '127.0.0.1', null, '登录成功', '2020-12-03 11:36:19');
INSERT INTO `sys_login_info` VALUES ('324', 'admin', '127.0.0.1', null, '登录成功', '2020-12-03 11:52:12');
INSERT INTO `sys_login_info` VALUES ('325', 'admin', '127.0.0.1', null, '登录成功', '2020-12-03 14:24:06');
INSERT INTO `sys_login_info` VALUES ('326', 'admin', '127.0.0.1', null, '登录成功', '2020-12-03 14:24:12');
INSERT INTO `sys_login_info` VALUES ('327', 'admin', '127.0.0.1', null, '登录成功', '2020-12-03 14:25:01');
INSERT INTO `sys_login_info` VALUES ('328', 'admin', '127.0.0.1', null, '登录成功', '2020-12-03 14:25:57');
INSERT INTO `sys_login_info` VALUES ('329', 'admin', '127.0.0.1', null, '登录成功', '2020-12-03 14:26:22');
INSERT INTO `sys_login_info` VALUES ('330', 'admin', '127.0.0.1', null, '登录成功', '2020-12-03 14:26:27');
INSERT INTO `sys_login_info` VALUES ('331', 'admin', '127.0.0.1', null, '登录成功', '2020-12-03 14:26:35');
INSERT INTO `sys_login_info` VALUES ('332', 'admin', '127.0.0.1', null, '登录成功', '2020-12-03 14:26:45');
INSERT INTO `sys_login_info` VALUES ('333', 'admin', '127.0.0.1', null, '登录成功', '2020-12-03 14:29:35');
INSERT INTO `sys_login_info` VALUES ('334', 'admin', '127.0.0.1', null, '登录成功', '2020-12-03 14:42:54');
INSERT INTO `sys_login_info` VALUES ('335', 'admin', '127.0.0.1', null, '登录成功', '2020-12-03 23:49:35');
INSERT INTO `sys_login_info` VALUES ('336', 'admin', '127.0.0.1', null, '登录成功', '2020-12-03 23:53:11');
INSERT INTO `sys_login_info` VALUES ('337', 'admin', '127.0.0.1', null, '登录成功', '2020-12-03 23:55:30');
INSERT INTO `sys_login_info` VALUES ('338', 'admin', '127.0.0.1', null, '登录成功', '2020-12-06 12:11:09');
INSERT INTO `sys_login_info` VALUES ('339', 'admin', '127.0.0.1', null, '登录成功', '2020-12-06 17:39:33');
INSERT INTO `sys_login_info` VALUES ('340', 'admin', '127.0.0.1', null, '登录成功', '2020-12-06 17:39:58');
INSERT INTO `sys_login_info` VALUES ('341', 'admin', '127.0.0.1', null, '登录成功', '2020-12-06 17:40:12');
INSERT INTO `sys_login_info` VALUES ('342', 'admin', '127.0.0.1', null, '登录成功', '2020-12-06 17:43:39');
INSERT INTO `sys_login_info` VALUES ('343', 'admin', '127.0.0.1', null, '登录成功', '2020-12-06 17:44:36');
INSERT INTO `sys_login_info` VALUES ('344', 'admin', '127.0.0.1', null, '登录成功', '2020-12-06 17:46:20');
INSERT INTO `sys_login_info` VALUES ('345', 'admin', '127.0.0.1', null, '登录成功', '2020-12-06 17:55:11');
INSERT INTO `sys_login_info` VALUES ('346', 'admin', '127.0.0.1', null, '登录成功', '2020-12-06 19:45:33');
INSERT INTO `sys_login_info` VALUES ('347', 'admin', '127.0.0.1', null, '登录成功', '2020-12-06 20:10:24');
INSERT INTO `sys_login_info` VALUES ('348', 'admin', '127.0.0.1', null, '登录成功', '2020-12-06 20:11:00');
INSERT INTO `sys_login_info` VALUES ('349', 'admin', '127.0.0.1', null, '登录成功', '2020-12-06 20:12:39');
INSERT INTO `sys_login_info` VALUES ('350', 'admin', '127.0.0.1', null, '登录成功', '2020-12-06 20:17:50');
INSERT INTO `sys_login_info` VALUES ('351', 'admin', '127.0.0.1', null, '登录成功', '2020-12-06 20:23:32');
INSERT INTO `sys_login_info` VALUES ('352', 'admin', '127.0.0.1', null, '登录成功', '2020-12-06 21:33:18');
INSERT INTO `sys_login_info` VALUES ('353', 'admin', '127.0.0.1', null, '登录成功', '2020-12-06 21:35:02');
INSERT INTO `sys_login_info` VALUES ('354', 'admin', '127.0.0.1', null, '登录成功', '2020-12-06 21:35:52');
INSERT INTO `sys_login_info` VALUES ('355', 'admin', '127.0.0.1', null, '登录成功', '2020-12-06 21:37:17');
INSERT INTO `sys_login_info` VALUES ('356', 'admin', '127.0.0.1', null, '登录成功', '2020-12-06 21:53:18');
INSERT INTO `sys_login_info` VALUES ('357', 'admin', '127.0.0.1', null, '登录成功', '2020-12-06 21:54:08');
INSERT INTO `sys_login_info` VALUES ('358', 'admin', '127.0.0.1', null, '登录成功', '2020-12-06 22:03:28');
INSERT INTO `sys_login_info` VALUES ('359', 'admin', '127.0.0.1', null, '登录成功', '2020-12-06 22:03:48');
INSERT INTO `sys_login_info` VALUES ('360', 'admin', '127.0.0.1', null, '登录成功', '2020-12-06 22:04:11');
INSERT INTO `sys_login_info` VALUES ('361', 'admin', '127.0.0.1', null, '登录成功', '2020-12-06 22:04:38');
INSERT INTO `sys_login_info` VALUES ('362', 'admin', '127.0.0.1', null, '登录成功', '2020-12-06 22:07:56');
INSERT INTO `sys_login_info` VALUES ('363', 'admin', '127.0.0.1', null, '登录成功', '2020-12-06 22:10:42');
INSERT INTO `sys_login_info` VALUES ('364', 'admin', '127.0.0.1', null, '登录成功', '2020-12-06 22:20:37');
INSERT INTO `sys_login_info` VALUES ('365', 'admin', '127.0.0.1', null, '登录成功', '2020-12-06 22:21:35');
INSERT INTO `sys_login_info` VALUES ('366', 'admin', '127.0.0.1', null, '登录成功', '2020-12-06 22:22:43');
INSERT INTO `sys_login_info` VALUES ('367', 'admin', '127.0.0.1', null, '登录成功', '2020-12-06 22:23:33');
INSERT INTO `sys_login_info` VALUES ('368', 'admin', '127.0.0.1', null, '登录成功', '2020-12-06 22:37:49');
INSERT INTO `sys_login_info` VALUES ('369', 'admin', '127.0.0.1', null, '登录成功', '2020-12-06 23:23:35');
INSERT INTO `sys_login_info` VALUES ('370', 'admin', '127.0.0.1', null, '登录成功', '2020-12-06 23:23:51');
INSERT INTO `sys_login_info` VALUES ('371', 'admin', '127.0.0.1', null, '登录成功', '2020-12-06 23:25:13');
INSERT INTO `sys_login_info` VALUES ('372', 'admin', '127.0.0.1', null, '登录成功', '2020-12-07 20:22:18');
INSERT INTO `sys_login_info` VALUES ('373', 'admin', '127.0.0.1', null, '登录成功', '2020-12-07 20:24:19');
INSERT INTO `sys_login_info` VALUES ('374', 'admin', '127.0.0.1', null, '登录成功', '2020-12-07 22:08:33');
INSERT INTO `sys_login_info` VALUES ('375', 'admin', '127.0.0.1', null, '登录成功', '2020-12-07 23:22:49');
INSERT INTO `sys_login_info` VALUES ('376', 'admin', '127.0.0.1', null, '登录成功', '2020-12-07 23:41:30');
INSERT INTO `sys_login_info` VALUES ('377', 'admin', '47.107.77.38', null, '登录成功', '2020-12-10 15:29:20');
INSERT INTO `sys_login_info` VALUES ('378', 'admin', '127.0.0.1', null, '登录成功', '2020-12-10 16:29:27');
INSERT INTO `sys_login_info` VALUES ('379', 'admin', '127.0.0.1', null, '登录成功', '2020-12-10 17:01:42');
INSERT INTO `sys_login_info` VALUES ('380', 'admin', '127.0.0.1', null, '登录成功', '2020-12-10 17:02:32');
INSERT INTO `sys_login_info` VALUES ('381', 'admin', '127.0.0.1', null, '登录成功', '2020-12-10 17:03:13');
INSERT INTO `sys_login_info` VALUES ('382', 'admin', '127.0.0.1', null, '登录成功', '2020-12-10 17:04:16');
INSERT INTO `sys_login_info` VALUES ('383', 'admin', '127.0.0.1', null, '登录成功', '2020-12-10 17:08:49');
INSERT INTO `sys_login_info` VALUES ('384', 'admin', '127.0.0.1', null, '登录成功', '2020-12-10 17:16:43');
INSERT INTO `sys_login_info` VALUES ('385', 'admin', '127.0.0.1', null, '登录成功', '2020-12-10 17:26:08');
INSERT INTO `sys_login_info` VALUES ('386', 'admin', '127.0.0.1', null, '登录成功', '2020-12-10 17:26:23');
INSERT INTO `sys_login_info` VALUES ('387', 'admin', '47.107.77.38', null, '登录成功', '2020-12-10 20:26:49');
INSERT INTO `sys_login_info` VALUES ('388', 'admin', '47.107.77.38', null, '登录成功', '2020-12-10 22:11:43');
INSERT INTO `sys_login_info` VALUES ('389', 'admin', '47.107.77.38', null, '登录成功', '2020-12-10 22:33:46');
INSERT INTO `sys_login_info` VALUES ('390', 'admin', '47.107.77.38', null, '登录成功', '2020-12-10 22:35:26');
INSERT INTO `sys_login_info` VALUES ('391', 'admin', '47.107.77.38', null, '登录成功', '2020-12-10 22:38:08');
INSERT INTO `sys_login_info` VALUES ('392', 'admin', '47.107.77.38', null, '登录成功', '2020-12-10 23:14:19');
INSERT INTO `sys_login_info` VALUES ('393', 'admin', '47.107.77.38', null, '登录成功', '2020-12-11 09:14:21');
INSERT INTO `sys_login_info` VALUES ('394', 'admin', '47.107.77.38', null, '登录成功', '2020-12-11 11:40:59');
INSERT INTO `sys_login_info` VALUES ('395', 'admin', '47.107.77.38', null, '登录成功', '2020-12-11 11:42:03');
INSERT INTO `sys_login_info` VALUES ('396', 'admin', '47.107.77.38', null, '登录成功', '2020-12-11 14:56:33');
INSERT INTO `sys_login_info` VALUES ('397', 'admin', '47.107.77.38', null, '登录成功', '2020-12-11 16:07:37');
INSERT INTO `sys_login_info` VALUES ('398', 'admin', '47.107.77.38', null, '登录成功', '2020-12-11 16:39:03');
INSERT INTO `sys_login_info` VALUES ('399', 'admin', '47.107.77.38', null, '登录成功', '2020-12-11 16:58:20');
INSERT INTO `sys_login_info` VALUES ('400', 'admin', '47.107.77.38', null, '登录成功', '2020-12-11 17:05:15');
INSERT INTO `sys_login_info` VALUES ('401', 'admin', '47.107.77.38', null, '登录成功', '2020-12-11 17:08:10');
INSERT INTO `sys_login_info` VALUES ('402', 'admin', '47.107.77.38', null, '登录成功', '2020-12-11 20:52:12');
INSERT INTO `sys_login_info` VALUES ('403', 'admin', '47.107.77.38', null, '登录成功', '2020-12-11 23:13:11');
INSERT INTO `sys_login_info` VALUES ('404', 'admin', '47.107.77.38', null, '登录成功', '2020-12-12 09:23:01');
INSERT INTO `sys_login_info` VALUES ('405', 'admin', '47.107.77.38', null, '登录成功', '2020-12-12 16:07:08');
INSERT INTO `sys_login_info` VALUES ('406', 'admin', '47.107.77.38', null, '登录成功', '2020-12-12 18:21:51');
INSERT INTO `sys_login_info` VALUES ('407', 'admin', '47.107.77.38', null, '登录成功', '2020-12-13 18:39:20');
INSERT INTO `sys_login_info` VALUES ('408', 'admin', '47.107.77.38', null, '登录成功', '2020-12-15 09:07:33');
INSERT INTO `sys_login_info` VALUES ('409', 'admin', '47.107.77.38', null, '登录成功', '2020-12-16 10:01:27');
INSERT INTO `sys_login_info` VALUES ('410', 'admin', '47.107.77.38', null, '登录成功', '2020-12-16 20:28:36');
INSERT INTO `sys_login_info` VALUES ('411', 'admin', '119.29.118.110', null, '登录成功', '2020-12-16 21:51:15');
INSERT INTO `sys_login_info` VALUES ('412', 'demo', '119.29.118.110', null, '登录成功', '2020-12-16 22:42:44');
INSERT INTO `sys_login_info` VALUES ('413', 'admin', '47.107.77.38', null, '登录成功', '2020-12-16 23:14:08');
INSERT INTO `sys_login_info` VALUES ('414', 'admin', '127.0.0.1', null, '登录成功', '2020-12-16 23:38:26');
INSERT INTO `sys_login_info` VALUES ('415', 'demo', '127.0.0.1', null, '登录成功', '2020-12-16 23:39:06');
INSERT INTO `sys_login_info` VALUES ('416', 'demo', '127.0.0.1', null, '登录成功', '2020-12-17 15:22:47');
INSERT INTO `sys_login_info` VALUES ('417', 'admin', '127.0.0.1', null, '登录成功', '2020-12-17 15:24:51');
INSERT INTO `sys_login_info` VALUES ('418', 'admin', '127.0.0.1', null, '登录成功', '2020-12-17 16:07:47');
INSERT INTO `sys_login_info` VALUES ('419', 'admin', '127.0.0.1', null, '登录成功', '2020-12-17 16:11:02');
INSERT INTO `sys_login_info` VALUES ('420', 'admin', '127.0.0.1', null, '登录成功', '2020-12-17 16:25:23');
INSERT INTO `sys_login_info` VALUES ('421', 'demo', '127.0.0.1', null, '登录成功', '2020-12-17 16:32:14');
INSERT INTO `sys_login_info` VALUES ('422', 'admin', '127.0.0.1', null, '登录成功', '2020-12-17 17:27:53');
INSERT INTO `sys_login_info` VALUES ('423', 'admin', '127.0.0.1', null, '登录成功', '2020-12-17 20:19:29');
INSERT INTO `sys_login_info` VALUES ('424', 'admin', '127.0.0.1', null, '登录成功', '2020-12-17 21:48:07');
INSERT INTO `sys_login_info` VALUES ('425', 'admin', '127.0.0.1', null, '登录成功', '2020-12-18 09:29:56');
INSERT INTO `sys_login_info` VALUES ('426', 'admin', '127.0.0.1', null, '登录成功', '2020-12-18 10:58:13');
INSERT INTO `sys_login_info` VALUES ('427', 'admin', '127.0.0.1', null, '登录成功', '2020-12-18 14:34:19');
INSERT INTO `sys_login_info` VALUES ('428', 'admin', '127.0.0.1', null, '登录成功', '2020-12-19 12:03:19');
INSERT INTO `sys_login_info` VALUES ('429', 'admin', '127.0.0.1', null, '登录成功', '2020-12-19 17:32:07');
INSERT INTO `sys_login_info` VALUES ('430', 'demo', '127.0.0.1', null, '登录成功', '2020-12-19 18:24:01');
INSERT INTO `sys_login_info` VALUES ('431', 'admin', '127.0.0.1', null, '登录成功', '2020-12-19 18:34:11');
INSERT INTO `sys_login_info` VALUES ('432', 'admin', '127.0.0.1', null, '登录成功', '2020-12-19 19:42:01');
INSERT INTO `sys_login_info` VALUES ('433', 'demo', '127.0.0.1', null, '登录成功', '2020-12-19 20:18:12');
INSERT INTO `sys_login_info` VALUES ('434', 'demo', '127.0.0.1', null, '登录成功', '2020-12-19 20:23:38');
INSERT INTO `sys_login_info` VALUES ('435', 'admin', '127.0.0.1', null, '登录成功', '2020-12-19 20:45:36');
INSERT INTO `sys_login_info` VALUES ('436', 'demo', '127.0.0.1', null, '登录成功', '2020-12-19 20:56:37');
INSERT INTO `sys_login_info` VALUES ('437', 'demo', '127.0.0.1', null, '登录成功', '2020-12-19 21:31:44');
INSERT INTO `sys_login_info` VALUES ('438', 'demo', '127.0.0.1', null, '登录成功', '2020-12-19 21:37:12');
INSERT INTO `sys_login_info` VALUES ('439', 'admin', '127.0.0.1', null, '登录成功', '2020-12-19 21:57:11');
INSERT INTO `sys_login_info` VALUES ('440', 'admin', '127.0.0.1', null, '登录成功', '2020-12-19 21:58:40');
INSERT INTO `sys_login_info` VALUES ('441', 'admin', '127.0.0.1', null, '登录成功', '2020-12-19 22:40:37');
INSERT INTO `sys_login_info` VALUES ('442', 'admin', '119.29.118.110', null, '登录成功', '2020-12-20 10:14:33');
INSERT INTO `sys_login_info` VALUES ('443', 'admin', '119.29.118.110', null, '登录成功', '2020-12-20 11:16:35');
INSERT INTO `sys_login_info` VALUES ('444', 'admin', '119.29.118.110', null, '登录成功', '2020-12-20 21:41:08');
INSERT INTO `sys_login_info` VALUES ('445', 'admin', '119.29.118.110', null, '登录成功', '2020-12-20 23:19:44');
INSERT INTO `sys_login_info` VALUES ('446', 'admin', '119.29.118.110', null, '登录成功', '2020-12-21 10:04:44');
INSERT INTO `sys_login_info` VALUES ('447', 'admin', '119.29.118.110', null, '登录成功', '2020-12-21 19:31:14');
INSERT INTO `sys_login_info` VALUES ('448', 'admin', '119.29.118.110', null, '登录成功', '2020-12-23 12:36:35');
INSERT INTO `sys_login_info` VALUES ('449', 'admin', '119.29.118.110', null, '登录成功', '2020-12-24 14:45:27');
INSERT INTO `sys_login_info` VALUES ('450', 'admin', '119.29.118.110', null, '登录成功', '2020-12-31 16:48:14');
INSERT INTO `sys_login_info` VALUES ('451', 'admin', '119.29.118.110', null, '登录成功', '2020-12-31 22:57:38');
INSERT INTO `sys_login_info` VALUES ('452', 'admin', '127.0.0.1', null, '登录成功', '2021-01-01 10:59:04');
INSERT INTO `sys_login_info` VALUES ('453', 'admin', '127.0.0.1', null, '登录成功', '2021-01-02 17:02:55');
INSERT INTO `sys_login_info` VALUES ('454', 'admin', '127.0.0.1', null, '登录成功', '2021-01-02 19:59:27');
INSERT INTO `sys_login_info` VALUES ('455', 'admin', '127.0.0.1', null, '登录成功', '2021-01-02 20:47:03');
INSERT INTO `sys_login_info` VALUES ('456', 'admin', '127.0.0.1', null, '登录成功', '2021-01-02 21:01:44');
INSERT INTO `sys_login_info` VALUES ('457', 'admin', '127.0.0.1', null, '登录成功', '2021-01-02 21:34:23');
INSERT INTO `sys_login_info` VALUES ('458', 'admin', '127.0.0.1', null, '登录成功', '2021-01-02 21:54:48');
INSERT INTO `sys_login_info` VALUES ('459', 'admin', '127.0.0.1', null, '登录成功', '2021-01-02 21:55:51');
INSERT INTO `sys_login_info` VALUES ('460', 'admin', '127.0.0.1', null, '登录成功', '2021-01-02 21:56:14');
INSERT INTO `sys_login_info` VALUES ('461', 'admin', '127.0.0.1', null, '登录成功', '2021-01-02 21:57:56');
INSERT INTO `sys_login_info` VALUES ('462', 'admin', '127.0.0.1', null, '登录成功', '2021-01-02 22:02:37');
INSERT INTO `sys_login_info` VALUES ('463', 'admin', '127.0.0.1', null, '登录成功', '2021-01-02 22:03:03');
INSERT INTO `sys_login_info` VALUES ('464', 'admin', '127.0.0.1', null, '登录成功', '2021-01-02 23:02:51');
INSERT INTO `sys_login_info` VALUES ('465', 'admin', '119.29.118.110', null, '登录成功', '2021-01-03 08:33:25');
INSERT INTO `sys_login_info` VALUES ('466', 'admin', '119.29.118.110', null, '登录成功', '2021-01-03 09:46:12');
INSERT INTO `sys_login_info` VALUES ('467', 'admin', '119.29.118.110', null, '登录成功', '2021-01-03 09:46:45');
INSERT INTO `sys_login_info` VALUES ('468', 'admin', '119.29.118.110', null, '登录成功', '2021-01-03 10:01:00');
INSERT INTO `sys_login_info` VALUES ('469', 'admin', '119.29.118.110', null, '登录成功', '2021-01-03 10:34:14');
INSERT INTO `sys_login_info` VALUES ('470', 'admin', '119.29.118.110', null, '登录成功', '2021-01-03 10:50:11');
INSERT INTO `sys_login_info` VALUES ('471', 'admin', '119.29.118.110', null, '登录成功', '2021-01-03 10:54:11');
INSERT INTO `sys_login_info` VALUES ('472', 'admin', '119.29.118.110', null, '登录成功', '2021-01-03 17:22:31');
INSERT INTO `sys_login_info` VALUES ('473', 'admin', '119.29.118.110', null, '登录成功', '2021-01-03 17:29:16');
INSERT INTO `sys_login_info` VALUES ('474', 'admin', '119.29.118.110', null, '登录成功', '2021-01-03 18:30:39');
INSERT INTO `sys_login_info` VALUES ('475', 'admin', '119.29.118.110', null, '登录成功', '2021-01-03 19:35:36');
INSERT INTO `sys_login_info` VALUES ('476', 'admin', '119.29.118.110', null, '登录成功', '2021-01-03 19:46:22');
INSERT INTO `sys_login_info` VALUES ('477', 'admin', '119.29.118.110', null, '登录成功', '2021-01-03 20:28:26');
INSERT INTO `sys_login_info` VALUES ('478', 'admin', '119.29.118.110', null, '登录成功', '2021-01-03 20:35:50');
INSERT INTO `sys_login_info` VALUES ('479', 'admin', '119.29.118.110', null, '登录成功', '2021-01-03 21:34:16');
INSERT INTO `sys_login_info` VALUES ('480', 'admin', '119.29.118.110', null, '登录成功', '2021-01-03 21:35:58');
INSERT INTO `sys_login_info` VALUES ('481', 'admin', '119.29.118.110', null, '登录成功', '2021-01-03 22:36:02');
INSERT INTO `sys_login_info` VALUES ('482', 'admin', '119.29.118.110', null, '登录成功', '2021-01-03 23:38:38');
INSERT INTO `sys_login_info` VALUES ('483', 'admin', '119.29.118.110', null, '登录成功', '2021-01-06 20:38:20');
INSERT INTO `sys_login_info` VALUES ('484', 'admin', '119.29.118.110', null, '登录成功', '2021-01-06 20:39:07');
INSERT INTO `sys_login_info` VALUES ('485', 'admin', '119.29.118.110', null, '登录成功', '2021-01-10 11:12:54');
INSERT INTO `sys_login_info` VALUES ('486', 'admin', '119.29.118.110', null, '登录成功', '2021-01-10 13:14:48');
INSERT INTO `sys_login_info` VALUES ('487', 'admin', '119.29.118.110', null, '登录成功', '2021-01-10 13:16:36');
INSERT INTO `sys_login_info` VALUES ('488', 'admin', '119.29.118.110', null, '登录成功', '2021-01-10 13:33:17');
INSERT INTO `sys_login_info` VALUES ('489', 'admin', '119.29.118.110', null, '登录成功', '2021-01-10 13:34:15');
INSERT INTO `sys_login_info` VALUES ('490', 'admin', '119.29.118.110', null, '登录成功', '2021-01-10 13:36:51');
INSERT INTO `sys_login_info` VALUES ('491', 'admin', '119.29.118.110', null, '登录成功', '2021-01-10 13:40:54');
INSERT INTO `sys_login_info` VALUES ('492', 'admin', '119.29.118.110', null, '登录成功', '2021-01-10 13:43:15');
INSERT INTO `sys_login_info` VALUES ('493', 'admin', '119.29.118.110', null, '登录成功', '2021-01-10 13:43:22');
INSERT INTO `sys_login_info` VALUES ('494', 'admin', '119.29.118.110', null, '登录成功', '2021-01-10 13:43:26');
INSERT INTO `sys_login_info` VALUES ('495', 'admin', '119.29.118.110', null, '登录成功', '2021-01-10 13:44:12');
INSERT INTO `sys_login_info` VALUES ('496', 'admin', '119.29.118.110', null, '登录成功', '2021-01-10 13:44:14');
INSERT INTO `sys_login_info` VALUES ('497', 'admin', '119.29.118.110', null, '登录成功', '2021-01-10 13:44:15');
INSERT INTO `sys_login_info` VALUES ('498', 'admin', '119.29.118.110', null, '登录成功', '2021-01-10 13:44:16');
INSERT INTO `sys_login_info` VALUES ('499', 'admin', '119.29.118.110', null, '登录成功', '2021-01-10 13:44:16');
INSERT INTO `sys_login_info` VALUES ('500', 'admin', '119.29.118.110', null, '登录成功', '2021-01-10 13:44:17');
INSERT INTO `sys_login_info` VALUES ('501', 'admin', '119.29.118.110', null, '登录成功', '2021-01-10 13:44:17');
INSERT INTO `sys_login_info` VALUES ('502', 'admin', '119.29.118.110', null, '登录成功', '2021-01-10 13:44:18');
INSERT INTO `sys_login_info` VALUES ('503', 'admin', '117.136.31.223', null, '登录成功', '2021-01-10 13:44:20');
INSERT INTO `sys_login_info` VALUES ('504', 'admin', '117.136.31.223', null, '登录成功', '2021-01-10 13:44:53');
INSERT INTO `sys_login_info` VALUES ('505', 'admin', '117.136.31.223', null, '登录成功', '2021-01-10 13:45:13');
INSERT INTO `sys_login_info` VALUES ('506', 'admin', '117.136.31.223', null, '登录成功', '2021-01-10 13:46:06');
INSERT INTO `sys_login_info` VALUES ('507', 'admin', '117.136.31.223', null, '登录成功', '2021-01-10 13:46:13');
INSERT INTO `sys_login_info` VALUES ('508', 'admin', '117.136.31.223', null, '登录成功', '2021-01-10 13:46:21');
INSERT INTO `sys_login_info` VALUES ('509', 'admin', '117.136.31.223', null, '登录成功', '2021-01-10 13:47:21');
INSERT INTO `sys_login_info` VALUES ('510', 'admin', '117.136.31.223', null, '登录成功', '2021-01-10 13:48:19');
INSERT INTO `sys_login_info` VALUES ('511', 'admin', '127.0.0.1', null, '登录成功', '2021-01-10 13:48:58');
INSERT INTO `sys_login_info` VALUES ('512', 'admin', '127.0.0.1', null, '登录成功', '2021-01-10 13:53:24');
INSERT INTO `sys_login_info` VALUES ('513', 'admin', '127.0.0.1', null, '登录成功', '2021-01-10 13:55:17');
INSERT INTO `sys_login_info` VALUES ('514', 'admin', '127.0.0.1', null, '登录成功', '2021-01-10 13:55:29');
INSERT INTO `sys_login_info` VALUES ('515', 'admin', '127.0.0.1', null, '登录成功', '2021-01-10 13:56:38');
INSERT INTO `sys_login_info` VALUES ('516', 'admin', '127.0.0.1', null, '登录成功', '2021-01-10 13:56:51');
INSERT INTO `sys_login_info` VALUES ('517', 'admin', '127.0.0.1', null, '登录成功', '2021-01-10 13:56:58');
INSERT INTO `sys_login_info` VALUES ('518', 'admin', '127.0.0.1', null, '登录成功', '2021-01-10 14:00:19');
INSERT INTO `sys_login_info` VALUES ('519', 'admin', '127.0.0.1', null, '登录成功', '2021-01-10 14:11:40');
INSERT INTO `sys_login_info` VALUES ('520', 'admin', '127.0.0.1', null, '登录成功', '2021-01-10 14:13:05');
INSERT INTO `sys_login_info` VALUES ('521', 'admin', '127.0.0.1', null, '登录成功', '2021-01-10 16:50:22');
INSERT INTO `sys_login_info` VALUES ('522', 'admin', '127.0.0.1', null, '登录成功', '2021-01-10 16:55:49');
INSERT INTO `sys_login_info` VALUES ('523', 'admin', '127.0.0.1', null, '登录成功', '2021-01-10 17:20:31');
INSERT INTO `sys_login_info` VALUES ('524', 'admin', '127.0.0.1', null, '登录成功', '2021-01-10 17:56:26');
INSERT INTO `sys_login_info` VALUES ('525', 'admin', '127.0.0.1', null, '登录成功', '2021-01-10 17:56:47');
INSERT INTO `sys_login_info` VALUES ('526', 'admin', '127.0.0.1', null, '登录成功', '2021-01-10 17:58:13');
INSERT INTO `sys_login_info` VALUES ('527', 'admin', '127.0.0.1', null, '登录成功', '2021-01-10 18:01:19');
INSERT INTO `sys_login_info` VALUES ('528', 'demo', '127.0.0.1', null, '登录成功', '2021-01-10 18:01:50');
INSERT INTO `sys_login_info` VALUES ('529', 'admin', '127.0.0.1', null, '登录成功', '2021-01-10 18:06:38');
INSERT INTO `sys_login_info` VALUES ('530', 'admin', '127.0.0.1', null, '登录成功', '2021-01-10 18:15:36');
INSERT INTO `sys_login_info` VALUES ('531', 'admin', '127.0.0.1', null, '登录成功', '2021-01-10 18:16:16');
INSERT INTO `sys_login_info` VALUES ('532', 'admin', '127.0.0.1', null, '登录成功', '2021-01-10 18:17:46');
INSERT INTO `sys_login_info` VALUES ('533', 'admin', '127.0.0.1', null, '登录成功', '2021-01-10 18:18:41');
INSERT INTO `sys_login_info` VALUES ('534', 'admin', '127.0.0.1', null, '登录成功', '2021-01-10 18:20:32');
INSERT INTO `sys_login_info` VALUES ('535', 'admin', '127.0.0.1', null, '登录成功', '2021-01-10 18:21:55');
INSERT INTO `sys_login_info` VALUES ('536', 'admin', '127.0.0.1', null, '登录成功', '2021-01-10 18:29:17');
INSERT INTO `sys_login_info` VALUES ('537', 'admin', '127.0.0.1', null, '登录成功', '2021-01-10 18:57:37');
INSERT INTO `sys_login_info` VALUES ('538', 'admin', '127.0.0.1', null, '登录成功', '2021-01-10 19:27:08');
INSERT INTO `sys_login_info` VALUES ('539', 'admin', '127.0.0.1', null, '登录成功', '2021-01-10 19:45:49');
INSERT INTO `sys_login_info` VALUES ('540', 'admin', '127.0.0.1', null, '登录成功', '2021-01-10 19:49:35');
INSERT INTO `sys_login_info` VALUES ('541', 'admin', '127.0.0.1', null, '登录成功', '2021-01-10 19:58:33');
INSERT INTO `sys_login_info` VALUES ('542', 'admin', '127.0.0.1', null, '登录成功', '2021-01-10 21:00:20');
INSERT INTO `sys_login_info` VALUES ('543', 'admin', '127.0.0.1', null, '登录成功', '2021-01-10 21:23:56');
INSERT INTO `sys_login_info` VALUES ('544', 'admin', '127.0.0.1', null, '登录成功', '2021-01-10 21:57:13');
INSERT INTO `sys_login_info` VALUES ('545', 'admin', '127.0.0.1', null, '登录成功', '2021-01-10 22:15:57');
INSERT INTO `sys_login_info` VALUES ('546', 'admin', '127.0.0.1', null, '登录成功', '2021-01-10 22:31:09');
INSERT INTO `sys_login_info` VALUES ('547', 'admin', '127.0.0.1', null, '登录成功', '2021-01-10 22:32:53');
INSERT INTO `sys_login_info` VALUES ('548', 'admin', '127.0.0.1', null, '登录成功', '2021-01-10 22:33:40');
INSERT INTO `sys_login_info` VALUES ('549', 'admin', '127.0.0.1', null, '登录成功', '2021-01-10 22:51:18');
INSERT INTO `sys_login_info` VALUES ('550', 'admin', '127.0.0.1', null, '登录成功', '2021-01-10 22:56:27');
INSERT INTO `sys_login_info` VALUES ('551', 'admin', '127.0.0.1', null, '登录成功', '2021-01-10 23:04:17');
INSERT INTO `sys_login_info` VALUES ('552', 'admin', '127.0.0.1', null, '登录成功', '2021-01-10 23:19:58');
INSERT INTO `sys_login_info` VALUES ('553', 'admin', '127.0.0.1', null, '登录成功', '2021-01-10 23:23:43');
INSERT INTO `sys_login_info` VALUES ('554', 'admin', '127.0.0.1', null, '登录成功', '2021-01-11 09:13:00');
INSERT INTO `sys_login_info` VALUES ('555', 'admin', '127.0.0.1', null, '登录成功', '2021-01-11 09:14:58');
INSERT INTO `sys_login_info` VALUES ('556', 'admin', '119.29.118.110', null, '登录成功', '2021-01-11 11:06:22');
INSERT INTO `sys_login_info` VALUES ('557', 'admin', '119.29.118.110', null, '登录成功', '2021-01-11 14:03:01');
INSERT INTO `sys_login_info` VALUES ('558', 'demo', '119.29.118.110', null, '登录成功', '2021-01-11 14:04:34');
INSERT INTO `sys_login_info` VALUES ('559', 'admin', '119.29.118.110', null, '登录成功', '2021-01-11 19:58:24');
INSERT INTO `sys_login_info` VALUES ('560', 'admin', '119.29.118.110', null, '登录成功', '2021-01-11 21:03:04');
INSERT INTO `sys_login_info` VALUES ('561', 'admin', '119.29.118.110', null, '登录成功', '2021-01-11 21:03:13');
INSERT INTO `sys_login_info` VALUES ('562', 'admin', '119.29.118.110', null, '登录成功', '2021-01-11 21:04:04');
INSERT INTO `sys_login_info` VALUES ('563', 'admin', '119.29.118.110', null, '登录成功', '2021-01-11 21:04:15');
INSERT INTO `sys_login_info` VALUES ('564', 'admin', '119.29.118.110', null, '登录成功', '2021-01-11 21:05:52');
INSERT INTO `sys_login_info` VALUES ('565', 'admin', '119.29.118.110', null, '登录成功', '2021-01-11 21:13:49');
INSERT INTO `sys_login_info` VALUES ('566', 'admin', '127.0.0.1', null, '登录成功', '2021-01-11 21:16:12');
INSERT INTO `sys_login_info` VALUES ('567', 'admin', '127.0.0.1', null, '登录成功', '2021-01-11 21:21:20');
INSERT INTO `sys_login_info` VALUES ('568', 'admin', '127.0.0.1', null, '登录成功', '2021-01-11 21:22:26');
INSERT INTO `sys_login_info` VALUES ('569', 'admin', '127.0.0.1', null, '登录成功', '2021-01-11 21:31:12');
INSERT INTO `sys_login_info` VALUES ('570', 'admin', '127.0.0.1', null, '登录成功', '2021-01-11 21:31:35');
INSERT INTO `sys_login_info` VALUES ('571', 'admin', '127.0.0.1', null, '登录成功', '2021-01-11 21:34:51');
INSERT INTO `sys_login_info` VALUES ('572', 'admin', '127.0.0.1', null, '登录成功', '2021-01-11 21:35:33');
INSERT INTO `sys_login_info` VALUES ('573', 'admin', '127.0.0.1', null, '登录成功', '2021-01-11 21:35:41');
INSERT INTO `sys_login_info` VALUES ('574', 'admin', '127.0.0.1', null, '登录成功', '2021-01-11 21:36:49');
INSERT INTO `sys_login_info` VALUES ('575', 'admin', '127.0.0.1', null, '登录成功', '2021-01-11 21:39:10');
INSERT INTO `sys_login_info` VALUES ('576', 'admin', '127.0.0.1', null, '登录成功', '2021-01-11 21:41:47');
INSERT INTO `sys_login_info` VALUES ('577', 'admin', '127.0.0.1', null, '登录成功', '2021-01-11 21:43:21');
INSERT INTO `sys_login_info` VALUES ('578', 'admin', '127.0.0.1', null, '登录成功', '2021-01-11 21:47:30');
INSERT INTO `sys_login_info` VALUES ('579', 'admin', '127.0.0.1', null, '登录成功', '2021-01-11 21:49:12');
INSERT INTO `sys_login_info` VALUES ('580', 'admin', '127.0.0.1', null, '登录成功', '2021-01-11 21:52:46');
INSERT INTO `sys_login_info` VALUES ('581', 'admin', '127.0.0.1', null, '登录成功', '2021-01-11 22:13:04');
INSERT INTO `sys_login_info` VALUES ('582', 'admin', '127.0.0.1', null, '登录成功', '2021-01-11 22:23:15');
INSERT INTO `sys_login_info` VALUES ('583', 'admin', '119.29.118.110', null, '登录成功', '2021-01-12 10:24:57');
INSERT INTO `sys_login_info` VALUES ('584', 'admin', '119.29.118.110', null, '登录成功', '2021-01-12 20:40:13');
INSERT INTO `sys_login_info` VALUES ('585', 'admin', '119.29.118.110', null, '登录成功', '2021-01-13 19:54:16');
INSERT INTO `sys_login_info` VALUES ('586', 'admin', '119.29.118.110', null, '登录成功', '2021-01-14 20:20:18');
INSERT INTO `sys_login_info` VALUES ('587', 'admin', '119.29.118.110', null, '登录成功', '2021-01-15 22:04:57');
INSERT INTO `sys_login_info` VALUES ('588', 'admin', '119.29.118.110', null, '登录成功', '2021-01-16 09:45:10');
INSERT INTO `sys_login_info` VALUES ('589', 'admin', '119.29.118.110', null, '登录成功', '2021-01-29 15:19:26');
INSERT INTO `sys_login_info` VALUES ('590', 'admin', '119.29.118.110', null, '登录成功', '2021-01-29 19:56:40');
INSERT INTO `sys_login_info` VALUES ('591', 'admin', '119.29.118.110', null, '登录成功', '2021-01-29 22:05:35');
INSERT INTO `sys_login_info` VALUES ('592', 'admin', '119.29.118.110', null, '登录成功', '2021-01-31 17:57:00');
INSERT INTO `sys_login_info` VALUES ('593', 'admin', '119.29.118.110', null, '登录成功', '2021-02-01 10:12:56');
INSERT INTO `sys_login_info` VALUES ('594', 'admin', '119.29.118.110', null, '登录成功', '2021-02-01 12:53:54');
INSERT INTO `sys_login_info` VALUES ('595', 'admin', '119.29.118.110', null, '登录成功', '2021-02-01 19:55:07');
INSERT INTO `sys_login_info` VALUES ('596', 'admin', '119.29.118.110', null, '登录成功', '2021-02-06 16:14:32');
INSERT INTO `sys_login_info` VALUES ('597', 'admin', '119.29.118.110', null, '登录成功', '2021-02-06 16:14:54');
INSERT INTO `sys_login_info` VALUES ('598', 'admin', '119.29.118.110', null, '登录成功', '2021-02-06 16:35:51');
INSERT INTO `sys_login_info` VALUES ('599', 'admin', '119.29.118.110', null, '登录成功', '2021-02-06 17:33:08');
INSERT INTO `sys_login_info` VALUES ('600', 'admin', '119.29.118.110', null, '登录成功', '2021-02-07 19:48:43');
INSERT INTO `sys_login_info` VALUES ('601', 'admin', '119.29.118.110', null, '登录成功', '2021-02-07 19:49:27');
INSERT INTO `sys_login_info` VALUES ('602', 'admin', '119.29.118.110', null, '登录成功', '2021-02-07 19:57:56');
INSERT INTO `sys_login_info` VALUES ('603', 'admin', '119.29.118.110', null, '登录成功', '2021-02-07 20:10:06');
INSERT INTO `sys_login_info` VALUES ('604', 'admin', '119.29.118.110', null, '登录成功', '2021-02-07 20:32:51');
INSERT INTO `sys_login_info` VALUES ('605', 'admin', '119.29.118.110', null, '登录成功', '2021-02-11 11:34:30');
INSERT INTO `sys_login_info` VALUES ('606', 'admin', '119.29.118.110', null, '登录成功', '2021-02-11 19:49:19');
INSERT INTO `sys_login_info` VALUES ('607', 'admin', '127.0.0.1', null, '登录成功', '2021-02-11 21:50:48');
INSERT INTO `sys_login_info` VALUES ('608', 'admin', '127.0.0.1', null, '登录成功', '2021-02-12 09:19:54');
INSERT INTO `sys_login_info` VALUES ('609', 'admin', '127.0.0.1', null, '登录成功', '2021-02-12 09:43:25');
INSERT INTO `sys_login_info` VALUES ('610', 'admin', '127.0.0.1', null, '登录成功', '2021-02-12 10:00:07');
INSERT INTO `sys_login_info` VALUES ('611', 'admin', '127.0.0.1', null, '登录成功', '2021-02-12 10:00:17');
INSERT INTO `sys_login_info` VALUES ('612', 'admin', '127.0.0.1', null, '登录成功', '2021-02-12 10:29:45');
INSERT INTO `sys_login_info` VALUES ('613', 'admin', '127.0.0.1', null, '登录成功', '2021-02-12 11:39:37');
INSERT INTO `sys_login_info` VALUES ('614', 'admin', '127.0.0.1', null, '登录成功', '2021-02-12 12:22:10');
INSERT INTO `sys_login_info` VALUES ('615', 'admin', '127.0.0.1', null, '登录成功', '2021-02-12 12:40:57');
INSERT INTO `sys_login_info` VALUES ('616', 'admin', '127.0.0.1', null, '登录成功', '2021-02-12 12:45:27');
INSERT INTO `sys_login_info` VALUES ('617', 'admin', '127.0.0.1', null, '登录成功', '2021-02-12 12:45:31');
INSERT INTO `sys_login_info` VALUES ('618', 'admin', '127.0.0.1', null, '登录成功', '2021-02-12 17:55:17');
INSERT INTO `sys_login_info` VALUES ('619', 'admin', '127.0.0.1', null, '登录成功', '2021-02-12 19:26:44');
INSERT INTO `sys_login_info` VALUES ('620', 'admin', '127.0.0.1', null, '登录成功', '2021-02-12 19:54:04');
INSERT INTO `sys_login_info` VALUES ('621', 'admin', '127.0.0.1', null, '登录成功', '2021-02-12 20:11:10');
INSERT INTO `sys_login_info` VALUES ('622', 'admin', '127.0.0.1', null, '登录成功', '2021-02-12 20:11:20');
INSERT INTO `sys_login_info` VALUES ('623', 'admin', '127.0.0.1', null, '登录成功', '2021-02-12 20:53:42');
INSERT INTO `sys_login_info` VALUES ('624', 'admin', '127.0.0.1', null, '登录成功', '2021-02-12 20:59:59');
INSERT INTO `sys_login_info` VALUES ('625', 'admin', '127.0.0.1', null, '登录成功', '2021-02-12 21:10:53');
INSERT INTO `sys_login_info` VALUES ('626', 'admin', '127.0.0.1', null, '登录成功', '2021-02-12 21:29:45');
INSERT INTO `sys_login_info` VALUES ('627', 'admin', '127.0.0.1', null, '登录成功', '2021-02-12 21:43:21');
INSERT INTO `sys_login_info` VALUES ('628', 'admin', '127.0.0.1', null, '登录成功', '2021-02-12 21:44:57');
INSERT INTO `sys_login_info` VALUES ('629', 'admin', '127.0.0.1', null, '登录成功', '2021-02-12 21:55:55');
INSERT INTO `sys_login_info` VALUES ('630', 'admin', '127.0.0.1', null, '登录成功', '2021-02-12 22:00:38');
INSERT INTO `sys_login_info` VALUES ('631', 'admin', '127.0.0.1', null, '登录成功', '2021-02-12 22:02:14');
INSERT INTO `sys_login_info` VALUES ('632', 'admin', '127.0.0.1', null, '登录成功', '2021-02-12 22:07:51');
INSERT INTO `sys_login_info` VALUES ('633', 'admin', '127.0.0.1', null, '登录成功', '2021-02-12 22:37:44');
INSERT INTO `sys_login_info` VALUES ('634', 'admin', '127.0.0.1', null, '登录成功', '2021-02-12 22:39:13');
INSERT INTO `sys_login_info` VALUES ('635', 'admin', '127.0.0.1', null, '登录成功', '2021-02-12 23:07:57');
INSERT INTO `sys_login_info` VALUES ('636', 'admin', '127.0.0.1', null, '登录成功', '2021-02-12 23:08:07');
INSERT INTO `sys_login_info` VALUES ('637', 'admin', '127.0.0.1', null, '登录成功', '2021-02-12 23:08:36');
INSERT INTO `sys_login_info` VALUES ('638', 'admin', '127.0.0.1', null, '登录成功', '2021-02-13 09:26:44');
INSERT INTO `sys_login_info` VALUES ('639', 'admin', '127.0.0.1', null, '登录成功', '2021-02-13 09:26:56');
INSERT INTO `sys_login_info` VALUES ('640', 'admin', '127.0.0.1', null, '登录成功', '2021-02-13 09:32:33');
INSERT INTO `sys_login_info` VALUES ('641', 'admin', '127.0.0.1', null, '登录成功', '2021-02-13 09:33:10');
INSERT INTO `sys_login_info` VALUES ('642', 'admin', '127.0.0.1', null, '登录成功', '2021-02-13 11:27:48');
INSERT INTO `sys_login_info` VALUES ('643', 'admin', '127.0.0.1', null, '登录成功', '2021-02-13 11:27:57');
INSERT INTO `sys_login_info` VALUES ('644', 'admin', '127.0.0.1', null, '登录成功', '2021-02-13 11:28:39');
INSERT INTO `sys_login_info` VALUES ('645', 'admin', '127.0.0.1', null, '登录成功', '2021-02-13 11:30:43');
INSERT INTO `sys_login_info` VALUES ('646', 'admin', '127.0.0.1', null, '登录成功', '2021-02-13 11:30:43');
INSERT INTO `sys_login_info` VALUES ('647', 'admin', '127.0.0.1', null, '登录成功', '2021-02-13 11:30:56');
INSERT INTO `sys_login_info` VALUES ('648', 'admin', '127.0.0.1', null, '登录成功', '2021-02-13 11:31:37');
INSERT INTO `sys_login_info` VALUES ('649', 'admin', '127.0.0.1', null, '登录成功', '2021-02-13 11:56:31');
INSERT INTO `sys_login_info` VALUES ('650', 'admin', '127.0.0.1', null, '登录成功', '2021-02-13 12:14:21');
INSERT INTO `sys_login_info` VALUES ('651', 'admin', '127.0.0.1', null, '登录成功', '2021-02-13 12:14:35');
INSERT INTO `sys_login_info` VALUES ('652', 'admin', '127.0.0.1', null, '登录成功', '2021-02-13 12:51:41');
INSERT INTO `sys_login_info` VALUES ('653', 'admin', '127.0.0.1', null, '登录成功', '2021-02-13 20:38:46');
INSERT INTO `sys_login_info` VALUES ('654', 'admin', '127.0.0.1', null, '登录成功', '2021-02-13 21:03:02');
INSERT INTO `sys_login_info` VALUES ('655', 'admin', '127.0.0.1', null, '登录成功', '2021-02-13 22:56:57');
INSERT INTO `sys_login_info` VALUES ('656', 'admin', '127.0.0.1', null, '登录成功', '2021-02-13 22:57:13');
INSERT INTO `sys_login_info` VALUES ('657', 'admin', '127.0.0.1', null, '登录成功', '2021-02-13 23:11:15');
INSERT INTO `sys_login_info` VALUES ('658', 'admin', '127.0.0.1', null, '登录成功', '2021-02-13 23:11:48');
INSERT INTO `sys_login_info` VALUES ('659', 'admin', '127.0.0.1', null, '登录成功', '2021-02-13 23:17:27');
INSERT INTO `sys_login_info` VALUES ('660', 'admin', '127.0.0.1', null, '登录成功', '2021-02-13 23:18:17');
INSERT INTO `sys_login_info` VALUES ('661', 'admin', '127.0.0.1', null, '登录成功', '2021-02-14 09:11:00');
INSERT INTO `sys_login_info` VALUES ('662', 'admin', '127.0.0.1', null, '登录成功', '2021-02-14 10:21:29');
INSERT INTO `sys_login_info` VALUES ('663', 'admin', '127.0.0.1', null, '登录成功', '2021-02-14 21:11:03');
INSERT INTO `sys_login_info` VALUES ('664', 'admin', '127.0.0.1', null, '登录成功', '2021-02-14 21:36:53');
INSERT INTO `sys_login_info` VALUES ('665', 'admin', '127.0.0.1', null, '登录成功', '2021-02-14 21:41:39');
INSERT INTO `sys_login_info` VALUES ('666', 'admin', '127.0.0.1', null, '登录成功', '2021-02-14 22:03:13');
INSERT INTO `sys_login_info` VALUES ('667', 'admin', '127.0.0.1', null, '登录成功', '2021-02-14 22:06:03');
INSERT INTO `sys_login_info` VALUES ('668', 'admin', '127.0.0.1', null, '登录成功', '2021-02-14 22:11:13');
INSERT INTO `sys_login_info` VALUES ('669', 'admin', '127.0.0.1', null, '登录成功', '2021-02-14 22:15:53');
INSERT INTO `sys_login_info` VALUES ('670', 'admin', '127.0.0.1', null, '登录成功', '2021-02-14 22:16:05');
INSERT INTO `sys_login_info` VALUES ('671', 'admin', '127.0.0.1', null, '登录成功', '2021-02-14 22:51:41');
INSERT INTO `sys_login_info` VALUES ('672', 'admin', '127.0.0.1', null, '登录成功', '2021-02-14 23:11:26');
INSERT INTO `sys_login_info` VALUES ('673', 'admin', '127.0.0.1', null, '登录成功', '2021-02-14 23:37:11');
INSERT INTO `sys_login_info` VALUES ('674', 'admin', '127.0.0.1', null, '登录成功', '2021-02-14 23:46:27');
INSERT INTO `sys_login_info` VALUES ('675', 'admin', '127.0.0.1', null, '登录成功', '2021-02-14 23:47:46');
INSERT INTO `sys_login_info` VALUES ('676', 'admin', '127.0.0.1', null, '登录成功', '2021-02-14 23:48:29');
INSERT INTO `sys_login_info` VALUES ('677', 'admin', '127.0.0.1', null, '登录成功', '2021-02-14 23:51:01');
INSERT INTO `sys_login_info` VALUES ('678', 'admin', '127.0.0.1', null, '登录成功', '2021-02-15 09:04:32');
INSERT INTO `sys_login_info` VALUES ('679', 'admin', '127.0.0.1', null, '登录成功', '2021-02-15 09:11:33');
INSERT INTO `sys_login_info` VALUES ('680', 'admin', '127.0.0.1', null, '登录成功', '2021-02-15 09:42:04');
INSERT INTO `sys_login_info` VALUES ('681', 'admin', '127.0.0.1', null, '登录成功', '2021-02-15 11:09:39');
INSERT INTO `sys_login_info` VALUES ('682', 'admin', '127.0.0.1', null, '登录成功', '2021-02-15 11:18:20');
INSERT INTO `sys_login_info` VALUES ('683', 'admin', '127.0.0.1', null, '登录成功', '2021-02-15 11:22:56');
INSERT INTO `sys_login_info` VALUES ('684', 'admin', '127.0.0.1', null, '登录成功', '2021-02-15 11:29:08');
INSERT INTO `sys_login_info` VALUES ('685', 'admin', '127.0.0.1', null, '登录成功', '2021-02-15 11:43:55');
INSERT INTO `sys_login_info` VALUES ('686', 'admin', '127.0.0.1', null, '登录成功', '2021-02-15 12:02:14');
INSERT INTO `sys_login_info` VALUES ('687', 'admin', '127.0.0.1', null, '登录成功', '2021-02-15 12:43:45');
INSERT INTO `sys_login_info` VALUES ('688', 'admin', '127.0.0.1', null, '登录成功', '2021-02-15 12:44:04');
INSERT INTO `sys_login_info` VALUES ('689', 'admin', '127.0.0.1', null, '登录成功', '2021-02-16 10:14:27');
INSERT INTO `sys_login_info` VALUES ('690', 'admin', '127.0.0.1', null, '登录成功', '2021-02-16 10:27:23');
INSERT INTO `sys_login_info` VALUES ('691', 'admin', '127.0.0.1', null, '登录成功', '2021-02-16 11:02:32');
INSERT INTO `sys_login_info` VALUES ('692', 'admin', '127.0.0.1', null, '登录成功', '2021-02-16 11:08:54');
INSERT INTO `sys_login_info` VALUES ('693', 'admin', '127.0.0.1', null, '登录成功', '2021-02-16 11:19:36');
INSERT INTO `sys_login_info` VALUES ('694', 'admin', '127.0.0.1', null, '登录成功', '2021-02-16 11:19:50');
INSERT INTO `sys_login_info` VALUES ('695', 'admin', '127.0.0.1', null, '登录成功', '2021-02-16 11:20:48');
INSERT INTO `sys_login_info` VALUES ('696', 'admin', '127.0.0.1', null, '登录成功', '2021-02-16 11:21:22');
INSERT INTO `sys_login_info` VALUES ('697', 'admin', '127.0.0.1', null, '登录成功', '2021-02-16 11:26:15');
INSERT INTO `sys_login_info` VALUES ('698', 'admin', '127.0.0.1', null, '登录成功', '2021-02-16 11:27:13');
INSERT INTO `sys_login_info` VALUES ('699', 'admin', '127.0.0.1', null, '登录成功', '2021-02-16 11:50:11');
INSERT INTO `sys_login_info` VALUES ('700', 'admin', '127.0.0.1', null, '登录成功', '2021-02-16 17:08:14');
INSERT INTO `sys_login_info` VALUES ('701', 'admin', '127.0.0.1', null, '登录成功', '2021-02-16 17:27:12');
INSERT INTO `sys_login_info` VALUES ('702', 'admin', '127.0.0.1', null, '登录成功', '2021-02-16 17:28:01');
INSERT INTO `sys_login_info` VALUES ('703', 'admin', '127.0.0.1', null, '登录成功', '2021-02-16 18:01:23');
INSERT INTO `sys_login_info` VALUES ('704', 'admin', '127.0.0.1', null, '登录成功', '2021-02-16 18:19:53');
INSERT INTO `sys_login_info` VALUES ('705', 'admin', '127.0.0.1', null, '登录成功', '2021-02-16 18:48:10');
INSERT INTO `sys_login_info` VALUES ('706', 'admin', '127.0.0.1', null, '登录成功', '2021-02-16 21:50:23');
INSERT INTO `sys_login_info` VALUES ('707', 'admin', '127.0.0.1', null, '登录成功', '2021-02-16 21:59:19');
INSERT INTO `sys_login_info` VALUES ('708', 'admin', '127.0.0.1', null, '登录成功', '2021-02-16 22:40:49');
INSERT INTO `sys_login_info` VALUES ('709', 'admin', '127.0.0.1', null, '登录成功', '2021-02-16 22:43:23');
INSERT INTO `sys_login_info` VALUES ('710', 'admin', '127.0.0.1', null, '登录成功', '2021-02-16 23:13:55');
INSERT INTO `sys_login_info` VALUES ('711', 'admin', '127.0.0.1', null, '登录成功', '2021-02-16 23:14:34');
INSERT INTO `sys_login_info` VALUES ('712', 'admin', '127.0.0.1', null, '登录成功', '2021-02-16 23:17:26');
INSERT INTO `sys_login_info` VALUES ('713', 'admin', '127.0.0.1', null, '登录成功', '2021-02-17 09:36:09');
INSERT INTO `sys_login_info` VALUES ('714', 'admin', '127.0.0.1', null, '登录成功', '2021-02-17 09:36:17');
INSERT INTO `sys_login_info` VALUES ('715', 'admin', '127.0.0.1', null, '登录成功', '2021-02-17 09:36:51');
INSERT INTO `sys_login_info` VALUES ('716', 'admin', '127.0.0.1', null, '登录成功', '2021-02-17 09:46:36');
INSERT INTO `sys_login_info` VALUES ('717', 'admin', '127.0.0.1', null, '登录成功', '2021-02-17 09:46:57');
INSERT INTO `sys_login_info` VALUES ('718', 'admin', '127.0.0.1', null, '登录成功', '2021-02-17 10:05:59');
INSERT INTO `sys_login_info` VALUES ('719', 'admin', '127.0.0.1', null, '登录成功', '2021-02-17 10:22:23');
INSERT INTO `sys_login_info` VALUES ('720', 'admin', '127.0.0.1', null, '登录成功', '2021-02-17 10:36:36');
INSERT INTO `sys_login_info` VALUES ('721', 'admin', '127.0.0.1', null, '登录成功', '2021-02-17 10:38:30');
INSERT INTO `sys_login_info` VALUES ('722', 'admin', '127.0.0.1', null, '登录成功', '2021-02-17 10:50:38');
INSERT INTO `sys_login_info` VALUES ('723', 'admin', '127.0.0.1', null, '登录成功', '2021-02-17 11:16:42');
INSERT INTO `sys_login_info` VALUES ('724', 'admin', '127.0.0.1', null, '登录成功', '2021-02-17 11:36:15');
INSERT INTO `sys_login_info` VALUES ('725', 'admin', '127.0.0.1', null, '登录成功', '2021-02-17 12:00:19');
INSERT INTO `sys_login_info` VALUES ('726', 'admin', '127.0.0.1', null, '登录成功', '2021-02-17 12:21:06');
INSERT INTO `sys_login_info` VALUES ('727', 'admin', '127.0.0.1', null, '登录成功', '2021-02-17 12:34:04');
INSERT INTO `sys_login_info` VALUES ('728', 'admin', '127.0.0.1', null, '登录成功', '2021-02-17 13:04:43');
INSERT INTO `sys_login_info` VALUES ('729', 'admin', '127.0.0.1', null, '登录成功', '2021-02-17 16:47:20');
INSERT INTO `sys_login_info` VALUES ('730', 'admin', '127.0.0.1', null, '登录成功', '2021-02-17 16:53:14');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '组件路径',
  `is_frame` tinyint(1) DEFAULT '1' COMMENT '是否为外链（1是 0否）',
  `menu_type` char(1) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` tinyint(1) DEFAULT '1' COMMENT '菜单状态（1显示 0隐藏）',
  `status` tinyint(1) DEFAULT '1' COMMENT '菜单状态（1正常 0停用）',
  `perms` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) COLLATE utf8_unicode_ci DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1072 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '1', '/system', null, '0', 'M', '1', '1', '', 'icon-system', 'admin', '2018-03-16 11:33:00', 'admin', '2021-01-02 23:10:26', '系统管理目录');
INSERT INTO `sys_menu` VALUES ('2', '人力管理', '0', '2', '/human', null, '0', 'M', '1', '1', '', 'icon-human-resources', 'admin', '2018-03-16 11:33:00', 'admin', '2020-11-14 11:38:41', '系统监控目录');
INSERT INTO `sys_menu` VALUES ('3', '工具箱', '0', '4', '/tool', null, '0', 'M', '1', '1', '', 'icon-tool-box', 'admin', '2018-03-16 11:33:00', 'admin', '2020-11-14 16:25:19', '系统工具目录');
INSERT INTO `sys_menu` VALUES ('4', '日志管理', '0', '3', '/log', '', '0', 'M', '1', '1', '', 'icon-log', 'admin', '2018-03-16 11:33:00', 'admin', '2020-11-14 20:48:12', '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('5', 'TwelveT', '0', '5', 'https://www.twelvet.cn', null, '1', 'M', '0', '1', '', 'icon-system', 'admin', '2018-03-16 11:33:00', 'admin', '2020-11-30 21:33:04', '若依官网地址');
INSERT INTO `sys_menu` VALUES ('100', '职员管理', '2', '1', '/human/staff', './human/staff', '1', 'C', '1', '1', 'system:user:list', 'icon-team', 'admin', '2018-03-16 11:33:00', 'admin', '2020-11-14 11:47:39', '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '2', '2', '/human/role', './human/role', '0', 'C', '1', '1', 'system:role:list', 'icon-role', 'admin', '2018-03-16 11:33:00', 'admin', '2020-11-14 11:39:15', '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '2', 'menu', 'system/menu', '0', 'C', '1', '1', 'system:menu:list', 'icon-menu', 'admin', '2018-03-16 11:33:00', 'admin', '2020-11-30 22:55:55', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('103', '部门管理', '2', '4', '/human/dept', './human/dept', '0', 'C', '1', '1', 'system:dept:list', 'icon-dept', 'admin', '2018-03-16 11:33:00', 'admin', '2020-11-14 11:39:40', '部门管理菜单');
INSERT INTO `sys_menu` VALUES ('104', '岗位管理', '2', '5', '/human/post', './human/post', '0', 'C', '1', '1', 'system:post:list', 'icon-post', 'admin', '2018-03-16 11:33:00', 'admin', '2020-11-14 11:40:02', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '3', '/system/dictionaries', './system/dictionaries', '1', 'C', '0', '1', 'system:dictionaries:list', 'icon-dictionaries', 'admin', '2018-03-16 11:33:00', 'admin', '2020-11-14 21:46:40', '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('107', 'OAuth2终端', '1', '4', '/system/client', './system/client', '1', 'C', '0', '1', 'system:client:list', 'icon-client', 'admin', '2018-03-16 11:33:00', 'admin', '2020-11-22 12:59:09', '终端设置菜单');
INSERT INTO `sys_menu` VALUES ('110', '定时任务', '1', '5', '/system/job', './system/job', '1', 'C', '0', '1', 'system:job:list', 'icon-job', 'admin', '2018-03-16 11:33:00', 'admin', '2020-11-30 22:55:31', '定时任务菜单');
INSERT INTO `sys_menu` VALUES ('113', '流程编辑器', '1066', '1', '/tool/graphicalEditor/flow', './tool/graphicalEditor/flow', '0', 'C', '1', '1', 'tool:build:list', 'icon-flow-edit', 'admin', '2018-03-16 11:33:00', 'admin', '2020-11-14 16:26:30', '表单构建菜单');
INSERT INTO `sys_menu` VALUES ('114', '拓扑编辑器', '1066', '2', '/tool/graphicalEditor/koni', './tool/graphicalEditor/koni', '0', 'C', '1', '1', 'tool:gen:list', 'icon-koni-edit', 'admin', '2018-03-16 11:33:00', 'admin', '2020-11-14 16:27:43', '代码生成菜单');
INSERT INTO `sys_menu` VALUES ('115', '脑图编辑器', '1066', '3', '/tool/graphicalEditor/mind', './tool/graphicalEditor/mind', '0', 'C', '1', '1', 'tool:swagger:list', 'icon-mind-edit', 'admin', '2018-03-16 11:33:00', 'admin', '2020-11-14 16:26:57', '系统接口菜单');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '4', '1', '/log/operation', './log/operation', '0', 'C', '1', '1', 'monitor:operlog:list', 'icon-log-operation', 'admin', '2018-03-16 11:33:00', 'admin', '2020-11-14 12:03:17', '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '4', '2', '/log/login', './log/login', '0', 'C', '1', '1', 'monitor:logininfor:list', 'icon-log-login', 'admin', '2018-03-16 11:33:00', 'admin', '2020-11-14 12:03:41', '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('1001', '用户查询', '100', '1', '', '', '1', 'F', '0', '1', 'system:user:query', null, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1002', '用户新增', '100', '2', '', '', '1', 'F', '0', '1', 'system:user:insert', null, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1003', '用户修改', '100', '3', '', '', '1', 'F', '0', '1', 'system:user:update', null, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1004', '用户删除', '100', '4', '', '', '1', 'F', '0', '1', 'system:user:remove', null, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1005', '用户导出', '100', '5', '', '', '1', 'F', '0', '1', 'system:user:export', null, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1006', '用户导入', '100', '6', '', '', '1', 'F', '0', '1', 'system:user:import', null, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1007', '重置密码', '100', '7', '', '', '1', 'F', '0', '1', 'system:user:resetPwd', null, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1008', '角色查询', '101', '1', '', '', '0', 'F', '1', '1', 'system:role:query', null, 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1009', '角色新增', '101', '2', '', '', '0', 'F', '1', '1', 'system:role:insert', null, 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1010', '角色修改', '101', '3', '', '', '0', 'F', '1', '1', 'system:role:update', null, 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1011', '角色删除', '101', '4', '', '', '0', 'F', '1', '1', 'system:role:remove', null, 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1012', '角色导出', '101', '5', '', '', '0', 'F', '1', '1', 'system:role:export', null, 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单查询', '102', '1', '', '', '0', 'F', '1', '1', 'system:menu:query', null, 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单新增', '102', '2', '', '', '0', 'F', '1', '1', 'system:menu:insert', null, 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1015', '菜单修改', '102', '3', '', '', '0', 'F', '1', '1', 'system:menu:update', null, 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1016', '菜单删除', '102', '4', '', '', '0', 'F', '1', '1', 'system:menu:remove', null, 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1017', '部门查询', '103', '1', '', '', '0', 'F', '1', '1', 'system:dept:query', null, 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1018', '部门新增', '103', '2', '', '', '0', 'F', '1', '1', 'system:dept:insert', null, 'admin', '2018-03-16 11:33:00', 'admin', '2020-12-01 10:09:29', '');
INSERT INTO `sys_menu` VALUES ('1019', '部门修改', '103', '3', '', '', '0', 'F', '1', '1', 'system:dept:update', null, 'admin', '2018-03-16 11:33:00', 'admin', '2020-12-01 10:09:38', '');
INSERT INTO `sys_menu` VALUES ('1020', '部门删除', '103', '4', '', '', '0', 'F', '1', '1', 'system:dept:remove', null, 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1021', '岗位查询', '104', '1', '', '', '0', 'F', '1', '1', 'system:post:query', null, 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1022', '岗位新增', '104', '2', '', '', '0', 'F', '1', '1', 'system:post:insert', null, 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1023', '岗位修改', '104', '3', '', '', '0', 'F', '1', '1', 'system:post:update', null, 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1024', '岗位删除', '104', '4', '', '', '0', 'F', '1', '1', 'system:post:remove', null, 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1025', '岗位导出', '104', '5', '', '', '0', 'F', '1', '1', 'system:post:export', null, 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1026', '字典查询', '105', '1', '#', '', '1', 'F', '0', '1', 'system:dict:query', null, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1027', '字典新增', '105', '2', '#', '', '1', 'F', '0', '1', 'system:dict:insert', null, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1028', '字典修改', '105', '3', '#', '', '1', 'F', '0', '1', 'system:dict:update', null, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1029', '字典删除', '105', '4', '#', '', '1', 'F', '0', '1', 'system:dict:remove', null, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1030', '字典导出', '105', '5', '#', '', '1', 'F', '0', '1', 'system:dict:export', null, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1036', '终端查询', '107', '1', '#', '', '1', 'F', '0', '1', 'system:client:query', null, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1037', '终端新增', '107', '2', '#', '', '1', 'F', '0', '1', 'system:client:insert', null, 'admin', '2018-03-16 11:33:00', 'admin', '2020-12-01 10:05:20', '');
INSERT INTO `sys_menu` VALUES ('1038', '终端修改', '107', '3', '#', '', '1', 'F', '0', '1', 'system:client:update', null, 'admin', '2018-03-16 11:33:00', 'admin', '2020-12-01 09:52:47', '');
INSERT INTO `sys_menu` VALUES ('1039', '终端删除', '107', '4', '#', '', '1', 'F', '0', '1', 'system:client:remove', null, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1040', '操作查询', '500', '1', '#', '', '0', 'F', '1', '1', 'monitor:operlog:query', null, 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1041', '操作删除', '500', '2', '#', '', '0', 'F', '1', '1', 'monitor:operlog:remove', null, 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1042', '日志导出', '500', '4', '#', '', '0', 'F', '1', '1', 'monitor:operlog:export', null, 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1043', '登录查询', '501', '1', '#', '', '0', 'F', '1', '1', 'monitor:logininfor:query', null, 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1044', '登录删除', '501', '2', '#', '', '0', 'F', '1', '1', 'monitor:logininfor:remove', null, 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1045', '日志导出', '501', '3', '#', '', '0', 'F', '1', '1', 'monitor:logininfor:export', null, 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1051', '任务查询', '110', '1', '#', '', '1', 'F', '0', '1', 'monitor:job:query', null, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1052', '任务新增', '110', '2', '#', '', '1', 'F', '0', '1', 'monitor:job:insert', null, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1053', '任务修改', '110', '3', '#', '', '1', 'F', '0', '1', 'monitor:job:update', null, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1054', '任务删除', '110', '4', '#', '', '1', 'F', '0', '1', 'monitor:job:remove', null, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1061', '定时任务日志', '4', '3', '/log/job', './log/job', '1', 'C', '1', '1', 'system:operlog', 'icon-log-job', 'admin', '2020-11-14 12:10:35', 'admin', '2020-11-14 16:24:38', '');
INSERT INTO `sys_menu` VALUES ('1062', '操作删除', '1061', '2', '#', '', '1', 'F', '1', '1', 'system:operlog:remove', null, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1063', '日志导出', '1061', '4', '#', '', '1', 'F', '1', '1', 'system:operlog:export', null, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1064', '操作查询', '1061', '1', '#', '', '1', 'F', '1', '1', 'system:operlog:query', null, 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1066', '图形化编辑器', '3', '1', '/tool/graphicalEditor', null, '1', 'M', '1', '1', null, 'icon-graphical-edit', 'admin', '2020-11-14 16:25:44', '', null, '');
INSERT INTO `sys_menu` VALUES ('1071', '文件管理', '1', '6', '/system/dfs', '/system/dfs', '1', 'C', '1', '1', 'asd', 'icon-DFS', 'admin', '2020-12-31 17:16:37', 'admin', '2021-01-02 20:03:42', '');

-- ----------------------------
-- Table structure for sys_oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `sys_oauth_client_details`;
CREATE TABLE `sys_oauth_client_details` (
  `client_id` varchar(180) NOT NULL COMMENT '客户端唯一标识',
  `resource_ids` varchar(180) DEFAULT NULL COMMENT '资源ID标识',
  `client_secret` varchar(180) NOT NULL COMMENT '客户端安全码',
  `scope` varchar(180) NOT NULL COMMENT '客户端授权范围',
  `authorized_grant_types` varchar(180) NOT NULL COMMENT '客户端授权类型',
  `web_server_redirect_uri` varchar(180) DEFAULT NULL COMMENT '服务器回调地址',
  `authorities` varchar(180) DEFAULT NULL COMMENT '访问资源所需权限',
  `access_token_validity` int(11) DEFAULT NULL COMMENT '设定客户端的access_token的有效时间值（秒）',
  `refresh_token_validity` int(11) DEFAULT NULL COMMENT '设定客户端的refresh_token的有效时间值（秒）',
  `additional_information` varchar(180) DEFAULT NULL COMMENT '预留字段',
  `autoapprove` tinyint(4) DEFAULT NULL COMMENT '是否登录时跳过授权（默认false）',
  PRIMARY KEY (`client_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='客户端配置表';

-- ----------------------------
-- Records of sys_oauth_client_details
-- ----------------------------
INSERT INTO `sys_oauth_client_details` VALUES ('twelvet', null, '$2a$10$umNBbgAHokePA6cV8eQwPe9s3cEscMjIDRw9XJ4vWCR.ZjkZOxec2', 'server', 'password,phone_password,refresh_token', null, null, '3600', '7200', null, null);

-- ----------------------------
-- Table structure for sys_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_operation_log`;
CREATE TABLE `sys_operation_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `service` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '请求方式',
  `operator_type` tinyint(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '返回参数',
  `status` tinyint(1) DEFAULT '0' COMMENT '操作状态（1正常 0异常）',
  `error_msg` varchar(2000) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=587 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_operation_log
-- ----------------------------
INSERT INTO `sys_operation_log` VALUES ('16', '操作日志', '3', 'com.twelvet.server.system.controller.SysOperationLogController.remove()', 'DELETE', '1', 'admin', null, '/operationLog/15', '127.0.0.1', '', '{operationLogIds=15}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-20 17:13:38');
INSERT INTO `sys_operation_log` VALUES ('17', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 10:13:17');
INSERT INTO `sys_operation_log` VALUES ('18', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 10:13:17');
INSERT INTO `sys_operation_log` VALUES ('19', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 10:13:18');
INSERT INTO `sys_operation_log` VALUES ('20', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 10:13:44');
INSERT INTO `sys_operation_log` VALUES ('21', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 10:16:32');
INSERT INTO `sys_operation_log` VALUES ('22', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 10:16:40');
INSERT INTO `sys_operation_log` VALUES ('23', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 10:17:03');
INSERT INTO `sys_operation_log` VALUES ('24', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 10:22:20');
INSERT INTO `sys_operation_log` VALUES ('25', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 10:22:30');
INSERT INTO `sys_operation_log` VALUES ('26', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 10:22:41');
INSERT INTO `sys_operation_log` VALUES ('27', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 10:28:47');
INSERT INTO `sys_operation_log` VALUES ('28', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 10:32:24');
INSERT INTO `sys_operation_log` VALUES ('29', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 10:40:04');
INSERT INTO `sys_operation_log` VALUES ('30', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 10:40:21');
INSERT INTO `sys_operation_log` VALUES ('31', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 10:40:59');
INSERT INTO `sys_operation_log` VALUES ('32', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 10:42:30');
INSERT INTO `sys_operation_log` VALUES ('33', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 10:42:40');
INSERT INTO `sys_operation_log` VALUES ('34', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 10:42:49');
INSERT INTO `sys_operation_log` VALUES ('35', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 10:43:07');
INSERT INTO `sys_operation_log` VALUES ('36', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 10:43:15');
INSERT INTO `sys_operation_log` VALUES ('37', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 10:44:17');
INSERT INTO `sys_operation_log` VALUES ('38', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 10:45:25');
INSERT INTO `sys_operation_log` VALUES ('39', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 10:46:48');
INSERT INTO `sys_operation_log` VALUES ('40', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 10:47:19');
INSERT INTO `sys_operation_log` VALUES ('41', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 10:57:15');
INSERT INTO `sys_operation_log` VALUES ('42', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 11:09:08');
INSERT INTO `sys_operation_log` VALUES ('43', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 11:10:36');
INSERT INTO `sys_operation_log` VALUES ('44', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 11:15:08');
INSERT INTO `sys_operation_log` VALUES ('45', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 11:17:22');
INSERT INTO `sys_operation_log` VALUES ('46', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 11:18:23');
INSERT INTO `sys_operation_log` VALUES ('47', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 11:21:55');
INSERT INTO `sys_operation_log` VALUES ('48', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 11:22:02');
INSERT INTO `sys_operation_log` VALUES ('49', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 11:22:17');
INSERT INTO `sys_operation_log` VALUES ('50', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 11:31:40');
INSERT INTO `sys_operation_log` VALUES ('51', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 11:32:53');
INSERT INTO `sys_operation_log` VALUES ('52', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 11:34:07');
INSERT INTO `sys_operation_log` VALUES ('53', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 11:35:08');
INSERT INTO `sys_operation_log` VALUES ('54', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 11:35:15');
INSERT INTO `sys_operation_log` VALUES ('55', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 11:35:17');
INSERT INTO `sys_operation_log` VALUES ('56', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 11:35:39');
INSERT INTO `sys_operation_log` VALUES ('57', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 11:36:26');
INSERT INTO `sys_operation_log` VALUES ('58', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 11:36:47');
INSERT INTO `sys_operation_log` VALUES ('59', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 11:41:14');
INSERT INTO `sys_operation_log` VALUES ('60', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'GET', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{}', 'null', '1', null, '2020-10-21 11:43:49');
INSERT INTO `sys_operation_log` VALUES ('61', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'GET', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{}', 'null', '1', null, '2020-10-21 11:43:59');
INSERT INTO `sys_operation_log` VALUES ('62', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 11:45:15');
INSERT INTO `sys_operation_log` VALUES ('63', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 11:45:43');
INSERT INTO `sys_operation_log` VALUES ('64', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 11:47:27');
INSERT INTO `sys_operation_log` VALUES ('65', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 11:49:07');
INSERT INTO `sys_operation_log` VALUES ('66', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 11:51:53');
INSERT INTO `sys_operation_log` VALUES ('67', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 11:54:07');
INSERT INTO `sys_operation_log` VALUES ('68', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 11:57:30');
INSERT INTO `sys_operation_log` VALUES ('69', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 11:59:12');
INSERT INTO `sys_operation_log` VALUES ('70', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 12:00:00');
INSERT INTO `sys_operation_log` VALUES ('71', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 12:00:05');
INSERT INTO `sys_operation_log` VALUES ('72', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 12:00:42');
INSERT INTO `sys_operation_log` VALUES ('73', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 12:00:50');
INSERT INTO `sys_operation_log` VALUES ('74', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 12:00:53');
INSERT INTO `sys_operation_log` VALUES ('75', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 14:07:57');
INSERT INTO `sys_operation_log` VALUES ('76', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 14:08:02');
INSERT INTO `sys_operation_log` VALUES ('77', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 14:09:52');
INSERT INTO `sys_operation_log` VALUES ('78', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 14:10:00');
INSERT INTO `sys_operation_log` VALUES ('79', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 14:10:05');
INSERT INTO `sys_operation_log` VALUES ('80', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 14:10:27');
INSERT INTO `sys_operation_log` VALUES ('81', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 14:12:34');
INSERT INTO `sys_operation_log` VALUES ('82', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 14:12:40');
INSERT INTO `sys_operation_log` VALUES ('83', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 14:14:39');
INSERT INTO `sys_operation_log` VALUES ('84', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 14:18:35');
INSERT INTO `sys_operation_log` VALUES ('85', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 14:18:40');
INSERT INTO `sys_operation_log` VALUES ('86', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 14:19:14');
INSERT INTO `sys_operation_log` VALUES ('87', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 14:47:18');
INSERT INTO `sys_operation_log` VALUES ('88', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 14:48:11');
INSERT INTO `sys_operation_log` VALUES ('89', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 14:49:07');
INSERT INTO `sys_operation_log` VALUES ('90', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 14:52:28');
INSERT INTO `sys_operation_log` VALUES ('91', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 14:52:32');
INSERT INTO `sys_operation_log` VALUES ('92', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 14:53:14');
INSERT INTO `sys_operation_log` VALUES ('93', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 14:54:51');
INSERT INTO `sys_operation_log` VALUES ('94', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 14:55:03');
INSERT INTO `sys_operation_log` VALUES ('95', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 14:55:03');
INSERT INTO `sys_operation_log` VALUES ('96', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 14:55:08');
INSERT INTO `sys_operation_log` VALUES ('97', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 14:57:11');
INSERT INTO `sys_operation_log` VALUES ('98', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 15:02:42');
INSERT INTO `sys_operation_log` VALUES ('99', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 15:03:04');
INSERT INTO `sys_operation_log` VALUES ('100', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 15:05:10');
INSERT INTO `sys_operation_log` VALUES ('101', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 15:07:27');
INSERT INTO `sys_operation_log` VALUES ('102', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 15:08:07');
INSERT INTO `sys_operation_log` VALUES ('103', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 15:08:28');
INSERT INTO `sys_operation_log` VALUES ('104', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 15:09:19');
INSERT INTO `sys_operation_log` VALUES ('105', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 15:11:19');
INSERT INTO `sys_operation_log` VALUES ('106', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 15:11:56');
INSERT INTO `sys_operation_log` VALUES ('107', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 15:13:36');
INSERT INTO `sys_operation_log` VALUES ('108', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 15:15:11');
INSERT INTO `sys_operation_log` VALUES ('109', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 15:16:30');
INSERT INTO `sys_operation_log` VALUES ('110', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 15:16:31');
INSERT INTO `sys_operation_log` VALUES ('111', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 15:17:21');
INSERT INTO `sys_operation_log` VALUES ('112', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 15:18:22');
INSERT INTO `sys_operation_log` VALUES ('113', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 15:18:31');
INSERT INTO `sys_operation_log` VALUES ('114', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 15:21:39');
INSERT INTO `sys_operation_log` VALUES ('115', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 15:22:06');
INSERT INTO `sys_operation_log` VALUES ('116', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 15:22:50');
INSERT INTO `sys_operation_log` VALUES ('117', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 15:24:21');
INSERT INTO `sys_operation_log` VALUES ('118', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 15:24:28');
INSERT INTO `sys_operation_log` VALUES ('119', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 15:45:08');
INSERT INTO `sys_operation_log` VALUES ('120', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 16:52:04');
INSERT INTO `sys_operation_log` VALUES ('121', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 16:57:24');
INSERT INTO `sys_operation_log` VALUES ('122', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 17:04:41');
INSERT INTO `sys_operation_log` VALUES ('123', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 17:05:50');
INSERT INTO `sys_operation_log` VALUES ('124', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 17:09:18');
INSERT INTO `sys_operation_log` VALUES ('125', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 17:10:13');
INSERT INTO `sys_operation_log` VALUES ('126', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 17:10:21');
INSERT INTO `sys_operation_log` VALUES ('127', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 17:17:01');
INSERT INTO `sys_operation_log` VALUES ('128', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 17:19:21');
INSERT INTO `sys_operation_log` VALUES ('129', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 17:19:27');
INSERT INTO `sys_operation_log` VALUES ('130', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 17:20:37');
INSERT INTO `sys_operation_log` VALUES ('131', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 17:20:41');
INSERT INTO `sys_operation_log` VALUES ('132', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 17:23:20');
INSERT INTO `sys_operation_log` VALUES ('133', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 17:23:25');
INSERT INTO `sys_operation_log` VALUES ('134', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 17:24:10');
INSERT INTO `sys_operation_log` VALUES ('135', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 17:29:09');
INSERT INTO `sys_operation_log` VALUES ('136', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 17:29:09');
INSERT INTO `sys_operation_log` VALUES ('137', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 17:29:14');
INSERT INTO `sys_operation_log` VALUES ('138', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 17:30:48');
INSERT INTO `sys_operation_log` VALUES ('139', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 17:33:02');
INSERT INTO `sys_operation_log` VALUES ('140', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 17:34:47');
INSERT INTO `sys_operation_log` VALUES ('141', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 17:35:07');
INSERT INTO `sys_operation_log` VALUES ('142', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 17:35:23');
INSERT INTO `sys_operation_log` VALUES ('143', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 17:41:18');
INSERT INTO `sys_operation_log` VALUES ('144', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 17:43:13');
INSERT INTO `sys_operation_log` VALUES ('145', '操作日志', '5', 'com.twelvet.server.system.controller.SysOperationLogController.exportExcel()', 'POST', '1', 'admin', null, '/operationLog/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 17:49:35');
INSERT INTO `sys_operation_log` VALUES ('146', '操作日志', '5', 'com.twelvet.server.system.controller.SysOperationLogController.exportExcel()', 'POST', '1', 'admin', null, '/operationLog/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 17:51:13');
INSERT INTO `sys_operation_log` VALUES ('147', '操作日志', '5', 'com.twelvet.server.system.controller.SysOperationLogController.exportExcel()', 'POST', '1', 'admin', null, '/operationLog/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 18:09:49');
INSERT INTO `sys_operation_log` VALUES ('148', '操作日志', '5', 'com.twelvet.server.system.controller.SysOperationLogController.exportExcel()', 'POST', '1', 'admin', null, '/operationLog/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 20:11:49');
INSERT INTO `sys_operation_log` VALUES ('149', '操作日志', '5', 'com.twelvet.server.system.controller.SysOperationLogController.exportExcel()', 'POST', '1', 'admin', null, '/operationLog/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 20:12:27');
INSERT INTO `sys_operation_log` VALUES ('150', '操作日志', '5', 'com.twelvet.server.system.controller.SysOperationLogController.exportExcel()', 'POST', '1', 'admin', null, '/operationLog/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 20:20:38');
INSERT INTO `sys_operation_log` VALUES ('151', '操作日志', '5', 'com.twelvet.server.system.controller.SysOperationLogController.exportExcel()', 'POST', '1', 'admin', null, '/operationLog/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 20:28:56');
INSERT INTO `sys_operation_log` VALUES ('152', '操作日志', '5', 'com.twelvet.server.system.controller.SysOperationLogController.exportExcel()', 'POST', '1', 'admin', null, '/operationLog/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 20:30:44');
INSERT INTO `sys_operation_log` VALUES ('153', '操作日志', '5', 'com.twelvet.server.system.controller.SysOperationLogController.exportExcel()', 'POST', '1', 'admin', null, '/operationLog/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 20:31:49');
INSERT INTO `sys_operation_log` VALUES ('154', '操作日志', '5', 'com.twelvet.server.system.controller.SysOperationLogController.exportExcel()', 'POST', '1', 'admin', null, '/operationLog/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 20:32:15');
INSERT INTO `sys_operation_log` VALUES ('155', '操作日志', '5', 'com.twelvet.server.system.controller.SysOperationLogController.exportExcel()', 'POST', '1', 'admin', null, '/operationLog/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 20:42:54');
INSERT INTO `sys_operation_log` VALUES ('156', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 21:11:51');
INSERT INTO `sys_operation_log` VALUES ('157', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 21:22:24');
INSERT INTO `sys_operation_log` VALUES ('158', '登陆日志', '5', 'com.twelvet.server.system.controller.SysLoginInfoController.exportExcel()', 'POST', '1', 'admin', null, '/loginInfo/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 21:23:03');
INSERT INTO `sys_operation_log` VALUES ('159', '操作日志', '5', 'com.twelvet.server.system.controller.SysOperationLogController.exportExcel()', 'POST', '1', 'admin', null, '/operationLog/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-21 22:19:35');
INSERT INTO `sys_operation_log` VALUES ('160', '操作日志', '5', 'com.twelvet.server.system.controller.SysOperationLogController.exportExcel()', 'POST', '1', 'admin', null, '/operationLog/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-22 09:41:34');
INSERT INTO `sys_operation_log` VALUES ('161', '操作日志', '5', 'com.twelvet.server.system.controller.SysOperationLogController.exportExcel()', 'POST', '1', 'admin', null, '/operationLog/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-22 09:41:52');
INSERT INTO `sys_operation_log` VALUES ('162', '操作日志', '5', 'com.twelvet.server.system.controller.SysOperationLogController.exportExcel()', 'POST', '1', 'admin', null, '/operationLog/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-10-22 09:43:41');
INSERT INTO `sys_operation_log` VALUES ('163', '岗位管理', '1', 'com.twelvet.server.system.controller.SysPostController.add()', 'POST', '1', 'admin', null, '/post', '127.0.0.1', '', '{\"postSort\":\"1\",\"flag\":false,\"remark\":\"asdads\",\"postId\":5,\"params\":{},\"createBy\":\"admin\",\"postName\":\"测试新增\",\"postCode\":\"demo\",\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-22 14:59:31');
INSERT INTO `sys_operation_log` VALUES ('164', '岗位管理', '3', 'com.twelvet.server.system.controller.SysPostController.remove()', 'DELETE', '1', 'admin', null, '/post/5', '127.0.0.1', '', '{postIds=5}', 'null', '0', '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Table \'twelvet.sys_user_post\' doesn\'t exist\r\n### The error may exist in file [D:\\我的文档\\桌面\\GitHub\\twelvet\\main\\twelvet-server\\twelvet-server-system\\target\\classes\\mapper\\system\\SysUserPostMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select count(1) from sys_user_post where post_id=?\r\n### Cause: java.sql.SQLSyntaxErrorException: Table \'twelvet.sys_user_post\' doesn\'t exist\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Table \'twelvet.sys_user_post\' doesn\'t exist', '2020-10-22 15:00:09');
INSERT INTO `sys_operation_log` VALUES ('165', '岗位管理', '3', 'com.twelvet.server.system.controller.SysPostController.remove()', 'DELETE', '1', 'admin', null, '/post/5', '127.0.0.1', '', '{postIds=5}', 'null', '0', '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Table \'twelvet.sys_user_post\' doesn\'t exist\r\n### The error may exist in file [D:\\我的文档\\桌面\\GitHub\\twelvet\\main\\twelvet-server\\twelvet-server-system\\target\\classes\\mapper\\system\\SysUserPostMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select count(1) from sys_user_post where post_id=?\r\n### Cause: java.sql.SQLSyntaxErrorException: Table \'twelvet.sys_user_post\' doesn\'t exist\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Table \'twelvet.sys_user_post\' doesn\'t exist', '2020-10-22 15:11:58');
INSERT INTO `sys_operation_log` VALUES ('166', '岗位管理', '3', 'com.twelvet.server.system.controller.SysPostController.remove()', 'DELETE', '1', 'admin', null, '/post/5', '127.0.0.1', '', '{postIds=5}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-22 15:15:36');
INSERT INTO `sys_operation_log` VALUES ('167', '岗位管理', '2', 'com.twelvet.server.system.controller.SysPostController.edit()', 'PUT', '1', 'admin', null, '/post', '127.0.0.1', '', '{\"postSort\":\"1\",\"flag\":false,\"remark\":\"董事长\",\"postId\":1,\"params\":{},\"updateBy\":\"admin\",\"postName\":\"董事长\",\"postCode\":\"ceo\",\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-22 15:18:58');
INSERT INTO `sys_operation_log` VALUES ('168', '岗位管理', '2', 'com.twelvet.server.system.controller.SysPostController.edit()', 'PUT', '1', 'admin', null, '/post', '127.0.0.1', '', '{\"postSort\":\"2\",\"flag\":false,\"remark\":\"项目经理\",\"postId\":2,\"params\":{},\"updateBy\":\"admin\",\"postName\":\"项目经理\",\"postCode\":\"se\",\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-22 15:19:10');
INSERT INTO `sys_operation_log` VALUES ('169', '岗位管理', '2', 'com.twelvet.server.system.controller.SysPostController.edit()', 'PUT', '1', 'admin', null, '/post', '127.0.0.1', '', '{\"postSort\":\"3\",\"flag\":false,\"remark\":\"人力资源\",\"postId\":3,\"params\":{},\"updateBy\":\"admin\",\"postName\":\"人力资源\",\"postCode\":\"hr\",\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-22 15:19:18');
INSERT INTO `sys_operation_log` VALUES ('170', '岗位管理', '2', 'com.twelvet.server.system.controller.SysPostController.edit()', 'PUT', '1', 'admin', null, '/post', '127.0.0.1', '', '{\"postSort\":\"4\",\"flag\":false,\"remark\":\"普通员工\",\"postId\":4,\"params\":{},\"updateBy\":\"admin\",\"postName\":\"普通员工\",\"postCode\":\"staff\",\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-22 15:19:30');
INSERT INTO `sys_operation_log` VALUES ('171', '岗位管理', '1', 'com.twelvet.server.system.controller.SysPostController.add()', 'POST', '1', 'admin', null, '/post', '127.0.0.1', '', '{\"postSort\":\"7\",\"flag\":false,\"remark\":\"asd\",\"postId\":6,\"params\":{},\"createBy\":\"admin\",\"postName\":\"asd\",\"postCode\":\"asd\",\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-22 15:21:15');
INSERT INTO `sys_operation_log` VALUES ('172', '岗位管理', '2', 'com.twelvet.server.system.controller.SysPostController.edit()', 'PUT', '1', 'admin', null, '/post', '127.0.0.1', '', '{\"postSort\":\"7\",\"flag\":false,\"remark\":\"asd\",\"postId\":6,\"params\":{},\"updateBy\":\"admin\",\"postName\":\"我在修改\",\"postCode\":\"asd\",\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-22 15:22:09');
INSERT INTO `sys_operation_log` VALUES ('173', '岗位管理', '2', 'com.twelvet.server.system.controller.SysPostController.edit()', 'PUT', '1', 'admin', null, '/post', '127.0.0.1', '', '{\"postSort\":\"7\",\"flag\":false,\"remark\":\"asd\",\"postId\":6,\"params\":{},\"updateBy\":\"admin\",\"postName\":\"我在修改\",\"postCode\":\"asd\",\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-22 15:22:13');
INSERT INTO `sys_operation_log` VALUES ('174', '岗位管理', '2', 'com.twelvet.server.system.controller.SysPostController.edit()', 'PUT', '1', 'admin', null, '/post', '127.0.0.1', '', '{\"postSort\":\"7\",\"flag\":false,\"remark\":\"asd\",\"postId\":6,\"params\":{},\"updateBy\":\"admin\",\"postName\":\"我在修改\",\"postCode\":\"asd\",\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-22 15:22:17');
INSERT INTO `sys_operation_log` VALUES ('175', '岗位管理', '2', 'com.twelvet.server.system.controller.SysPostController.edit()', 'PUT', '1', 'admin', null, '/post', '127.0.0.1', '', '{\"postSort\":\"7\",\"flag\":false,\"remark\":\"asd\",\"postId\":6,\"params\":{},\"updateBy\":\"admin\",\"postName\":\"我在修改\",\"postCode\":\"asd\",\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-22 15:22:18');
INSERT INTO `sys_operation_log` VALUES ('176', '岗位管理', '3', 'com.twelvet.server.system.controller.SysPostController.remove()', 'DELETE', '1', 'admin', null, '/post/6', '127.0.0.1', '', '{postIds=6}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-22 15:32:07');
INSERT INTO `sys_operation_log` VALUES ('177', '岗位管理', '1', 'com.twelvet.server.system.controller.SysPostController.add()', 'POST', '1', 'admin', null, '/post', '127.0.0.1', '', '{\"postSort\":\"1\",\"flag\":false,\"remark\":\"asdasd\",\"postId\":7,\"params\":{},\"createBy\":\"admin\",\"postName\":\"asd\",\"postCode\":\"asd\",\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-22 15:32:15');
INSERT INTO `sys_operation_log` VALUES ('178', '岗位管理', '2', 'com.twelvet.server.system.controller.SysPostController.edit()', 'PUT', '1', 'admin', null, '/post', '127.0.0.1', '', '{\"postSort\":\"1\",\"flag\":false,\"remark\":\"asdasd\",\"postId\":7,\"params\":{},\"updateBy\":\"admin\",\"postName\":\"asdzxczxc\",\"postCode\":\"asd\",\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-22 15:32:20');
INSERT INTO `sys_operation_log` VALUES ('179', '岗位管理', '2', 'com.twelvet.server.system.controller.SysPostController.edit()', 'PUT', '1', 'admin', null, '/post', '127.0.0.1', '', '{\"postSort\":\"1\",\"flag\":false,\"remark\":\"asdasd\",\"postId\":7,\"params\":{},\"updateBy\":\"admin\",\"postName\":\"asdzxczxc\",\"postCode\":\"asdzxczxc\",\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-22 15:32:29');
INSERT INTO `sys_operation_log` VALUES ('180', '岗位管理', '3', 'com.twelvet.server.system.controller.SysPostController.remove()', 'DELETE', '1', 'admin', null, '/post/7', '127.0.0.1', '', '{postIds=7}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-22 15:33:42');
INSERT INTO `sys_operation_log` VALUES ('181', '菜单管理', '2', 'com.twelvet.server.system.controller.SysMenuController.update()', 'PUT', '1', 'admin', null, '/menu', '127.0.0.1', '', '{\"visible\":true,\"icon\":\"icon-system\",\"orderNum\":\"1\",\"menuName\":\"系统管理\",\"params\":{},\"parentId\":0,\"path\":\"system\",\"children\":[],\"updateBy\":\"admin\",\"isFrame\":false,\"menuId\":1,\"menuType\":\"M\",\"status\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-22 15:34:12');
INSERT INTO `sys_operation_log` VALUES ('182', '岗位管理', '5', 'com.twelvet.server.system.controller.SysPostController.exportExcel()', 'POST', '1', 'admin', null, '/post/exportExcel', '127.0.0.1', '', '{\"flag\":false,\"params\":{}}', 'null', '1', null, '2020-10-22 15:37:37');
INSERT INTO `sys_operation_log` VALUES ('183', '岗位管理', '5', 'com.twelvet.server.system.controller.SysPostController.exportExcel()', 'POST', '1', 'admin', null, '/post/exportExcel', '127.0.0.1', '', '{\"flag\":false,\"params\":{}}', 'null', '1', null, '2020-10-22 15:37:40');
INSERT INTO `sys_operation_log` VALUES ('184', '岗位管理', '5', 'com.twelvet.server.system.controller.SysPostController.exportExcel()', 'POST', '1', 'admin', null, '/post/exportExcel', '127.0.0.1', '', '{\"flag\":false,\"params\":{}}', 'null', '1', null, '2020-10-22 15:58:49');
INSERT INTO `sys_operation_log` VALUES ('185', '岗位管理', '5', 'com.twelvet.server.system.controller.SysPostController.exportExcel()', 'POST', '1', 'admin', null, '/post/exportExcel', '127.0.0.1', '', '{\"flag\":false,\"params\":{}}', 'null', '1', null, '2020-10-22 15:59:20');
INSERT INTO `sys_operation_log` VALUES ('186', '岗位管理', '5', 'com.twelvet.server.system.controller.SysPostController.exportExcel()', 'POST', '1', 'admin', null, '/post/exportExcel', '127.0.0.1', '', '{\"flag\":false,\"params\":{}}', 'null', '1', null, '2020-10-22 16:02:36');
INSERT INTO `sys_operation_log` VALUES ('187', '岗位管理', '1', 'com.twelvet.server.system.controller.SysPostController.add()', 'POST', '1', 'admin', null, '/post', '127.0.0.1', '', '{\"postSort\":\"0\",\"flag\":false,\"remark\":\"asd\",\"postId\":8,\"params\":{},\"createBy\":\"admin\",\"postName\":\"asd\",\"postCode\":\"asd\",\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-23 10:56:37');
INSERT INTO `sys_operation_log` VALUES ('188', '岗位管理', '3', 'com.twelvet.server.system.controller.SysPostController.remove()', 'DELETE', '1', 'admin', null, '/post/8', '127.0.0.1', '', '{postIds=8}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-23 10:56:42');
INSERT INTO `sys_operation_log` VALUES ('189', '部门管理', '2', 'com.twelvet.server.system.controller.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/dept', '127.0.0.1', '', '{\"deptId\":100,\"orderNum\":\"0\",\"params\":{},\"parentId\":100,\"children\":[],\"status\":\"1\"}', '{\"code\":500,\"msg\":\"修改部门\'null\'失败，上级部门不能是自己\"}', '1', null, '2020-10-23 14:30:49');
INSERT INTO `sys_operation_log` VALUES ('190', '部门管理', '2', 'com.twelvet.server.system.controller.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/dept', '127.0.0.1', '', '{\"deptName\":\"深圳总公司\",\"leader\":\"若依\",\"deptId\":101,\"orderNum\":\"3\",\"params\":{},\"parentId\":100,\"children\":[],\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"ry@qq.com\",\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-23 14:47:53');
INSERT INTO `sys_operation_log` VALUES ('191', '部门管理', '2', 'com.twelvet.server.system.controller.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/dept', '127.0.0.1', '', '{\"deptName\":\"深圳总公司\",\"leader\":\"若依\",\"deptId\":101,\"orderNum\":\"1\",\"params\":{},\"parentId\":100,\"children\":[],\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"ry@qq.com\",\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-23 14:48:06');
INSERT INTO `sys_operation_log` VALUES ('192', '部门管理', '2', 'com.twelvet.server.system.controller.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/dept', '127.0.0.1', '', '{\"deptName\":\"研发部门\",\"leader\":\"若依\",\"deptId\":103,\"orderNum\":\"4\",\"params\":{},\"parentId\":101,\"children\":[],\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100,101\",\"email\":\"ry@qq.com\",\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-23 14:48:13');
INSERT INTO `sys_operation_log` VALUES ('193', '部门管理', '2', 'com.twelvet.server.system.controller.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/dept', '127.0.0.1', '', '{\"deptName\":\"研发部门\",\"leader\":\"若依\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100,101\",\"email\":\"ry@qq.com\",\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-23 14:48:44');
INSERT INTO `sys_operation_log` VALUES ('194', '部门管理', '2', 'com.twelvet.server.system.controller.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/dept', '127.0.0.1', '', '{\"deptName\":\"TWT科技\",\"leader\":\"若依\",\"deptId\":100,\"orderNum\":\"1\",\"params\":{},\"parentId\":0,\"children\":[],\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"email\":\"ry@qq.com\",\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-23 15:30:52');
INSERT INTO `sys_operation_log` VALUES ('195', '部门管理', '2', 'com.twelvet.server.system.controller.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/dept', '127.0.0.1', '', '{\"deptName\":\"TWT科技\",\"leader\":\"twelvet\",\"deptId\":100,\"orderNum\":\"1\",\"params\":{},\"parentId\":0,\"children\":[],\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"email\":\"2471835953@qq.com\",\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-23 15:31:08');
INSERT INTO `sys_operation_log` VALUES ('196', '部门管理', '2', 'com.twelvet.server.system.controller.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/dept', '127.0.0.1', '', '{\"deptName\":\"TWT科技\",\"leader\":\"twelvet\",\"deptId\":100,\"orderNum\":\"1\",\"params\":{},\"parentId\":100,\"children\":[],\"phone\":\"15888888888\",\"email\":\"2471835953@qq.com\",\"status\":\"1\"}', '{\"code\":500,\"msg\":\"修改部门\'TWT科技\'失败，上级部门不能是自己\"}', '1', null, '2020-10-23 15:31:17');
INSERT INTO `sys_operation_log` VALUES ('197', '部门管理', '2', 'com.twelvet.server.system.controller.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/dept', '127.0.0.1', '', '{\"deptName\":\"TWT科技\",\"leader\":\"twelvet\",\"deptId\":100,\"orderNum\":\"1\",\"params\":{},\"parentId\":100,\"children\":[],\"phone\":\"15888888888\",\"email\":\"2471835953@qq.com\",\"status\":\"1\"}', '{\"code\":500,\"msg\":\"修改部门\'TWT科技\'失败，上级部门不能是自己\"}', '1', null, '2020-10-23 15:36:09');
INSERT INTO `sys_operation_log` VALUES ('198', '部门管理', '2', 'com.twelvet.server.system.controller.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/dept', '127.0.0.1', '', '{\"deptName\":\"TWT科技\",\"leader\":\"twelvet\",\"deptId\":100,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100,101\",\"email\":\"2471835953@qq.com\",\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-23 15:36:15');
INSERT INTO `sys_operation_log` VALUES ('199', '部门管理', '1', 'com.twelvet.server.system.controller.SysDeptController.add()', 'POST', '1', 'admin', null, '/dept', '127.0.0.1', '', '{\"deptName\":\"测试\",\"leader\":\"213\",\"deptId\":0,\"orderNum\":\"12\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"phone\":\"1231\",\"email\":\"23\",\"status\":\"1\"}', 'null', '0', '部门停用，不允许新增', '2020-10-23 15:39:36');
INSERT INTO `sys_operation_log` VALUES ('200', '部门管理', '1', 'com.twelvet.server.system.controller.SysDeptController.add()', 'POST', '1', 'admin', null, '/dept', '127.0.0.1', '', '{\"deptName\":\"测试\",\"leader\":\"213\",\"deptId\":0,\"orderNum\":\"12\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"phone\":\"1231\",\"email\":\"23\",\"status\":\"1\"}', 'null', '0', '部门停用，不允许新增', '2020-10-23 15:39:41');
INSERT INTO `sys_operation_log` VALUES ('201', '部门管理', '2', 'com.twelvet.server.system.controller.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/dept', '127.0.0.1', '', '{\"deptName\":\"TWT科技\",\"leader\":\"twelvet\",\"deptId\":100,\"orderNum\":\"1\",\"params\":{},\"parentId\":100,\"children\":[],\"phone\":\"15888888888\",\"email\":\"2471835953@qq.com\",\"status\":\"1\"}', '{\"code\":500,\"msg\":\"修改部门\'TWT科技\'失败，上级部门不能是自己\"}', '1', null, '2020-10-23 15:45:44');
INSERT INTO `sys_operation_log` VALUES ('202', '部门管理', '2', 'com.twelvet.server.system.controller.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/dept', '127.0.0.1', '', '{\"deptName\":\"TWT科\",\"leader\":\"twelvet\",\"deptId\":100,\"orderNum\":\"1\",\"params\":{},\"parentId\":0,\"children\":[],\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"email\":\"2471835953@qq.com\",\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-23 15:54:18');
INSERT INTO `sys_operation_log` VALUES ('203', '部门管理', '2', 'com.twelvet.server.system.controller.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/dept', '127.0.0.1', '', '{\"deptName\":\"TWT科技\",\"leader\":\"twelvet\",\"deptId\":100,\"orderNum\":\"1\",\"params\":{},\"parentId\":0,\"children\":[],\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"email\":\"2471835953@qq.com\",\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-23 15:54:25');
INSERT INTO `sys_operation_log` VALUES ('204', '部门管理', '1', 'com.twelvet.server.system.controller.SysDeptController.add()', 'POST', '1', 'admin', null, '/dept', '127.0.0.1', '', '{\"deptName\":\"asd\",\"leader\":\"asd\",\"deptId\":0,\"orderNum\":\"1\",\"params\":{},\"parentId\":0,\"createBy\":\"admin\",\"children\":[],\"phone\":\"asd\",\"email\":\"asd\",\"status\":\"1\"}', 'null', '0', '', '2020-10-23 15:56:28');
INSERT INTO `sys_operation_log` VALUES ('205', '部门管理', '1', 'com.twelvet.server.system.controller.SysDeptController.add()', 'POST', '1', 'admin', null, '/dept', '127.0.0.1', '', '{\"deptName\":\"asd\",\"leader\":\"asd\",\"deptId\":0,\"orderNum\":\"1\",\"params\":{},\"parentId\":0,\"createBy\":\"admin\",\"children\":[],\"phone\":\"asd\",\"email\":\"asd\",\"status\":\"1\"}', 'null', '0', '', '2020-10-23 15:56:38');
INSERT INTO `sys_operation_log` VALUES ('206', '部门管理', '1', 'com.twelvet.server.system.controller.SysDeptController.add()', 'POST', '1', 'admin', null, '/dept', '127.0.0.1', '', '{\"deptName\":\"asd\",\"leader\":\"asd\",\"deptId\":0,\"orderNum\":\"1\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"phone\":\"asd\",\"ancestors\":\"0,100,101,100\",\"email\":\"asd\",\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-23 15:56:47');
INSERT INTO `sys_operation_log` VALUES ('207', '部门管理', '3', 'com.twelvet.server.system.controller.SysDeptController.remove()', 'DELETE', '1', 'admin', null, '/dept/110', '127.0.0.1', '', '{deptId=110}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-23 15:56:52');
INSERT INTO `sys_operation_log` VALUES ('208', '部门管理', '2', 'com.twelvet.server.system.controller.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/dept', '127.0.0.1', '', '{\"deptName\":\"TWT科技\",\"leader\":\"twelvet\",\"deptId\":100,\"orderNum\":\"1\",\"params\":{},\"parentId\":0,\"children\":[],\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"email\":\"2471835953@qq.com\",\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-23 16:03:41');
INSERT INTO `sys_operation_log` VALUES ('209', '部门管理', '2', 'com.twelvet.server.system.controller.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/dept', '127.0.0.1', '', '{\"deptName\":\"TWT科技\",\"leader\":\"twelvet\",\"deptId\":100,\"orderNum\":\"1\",\"params\":{},\"parentId\":100,\"children\":[],\"phone\":\"15888888888\",\"email\":\"2471835953@qq.com\",\"status\":\"1\"}', '{\"code\":500,\"msg\":\"修改部门\'TWT科技\'失败，上级部门不能是自己\"}', '1', null, '2020-10-23 16:03:47');
INSERT INTO `sys_operation_log` VALUES ('210', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":1,\"admin\":true,\"remark\":\"管理员\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"管理员s\",\"status\":\"1\"}', 'null', '0', '不允许操作超级管理员角色', '2020-10-24 18:43:41');
INSERT INTO `sys_operation_log` VALUES ('211', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"params\":{},\"roleSort\":\"2\",\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色s\",\"status\":\"1\"}', 'null', '0', '', '2020-10-24 18:43:48');
INSERT INTO `sys_operation_log` VALUES ('212', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"params\":{},\"roleSort\":\"2\",\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"1\"}', 'null', '0', '', '2020-10-24 19:05:04');
INSERT INTO `sys_operation_log` VALUES ('213', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"params\":{},\"roleSort\":\"2\",\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"1\"}', 'null', '0', '', '2020-10-24 19:09:30');
INSERT INTO `sys_operation_log` VALUES ('214', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"params\":{},\"roleSort\":\"2\",\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"1\"}', 'null', '0', '', '2020-10-24 20:28:52');
INSERT INTO `sys_operation_log` VALUES ('215', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"params\":{},\"roleSort\":\"2\",\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"1\"}', 'null', '0', '', '2020-10-24 20:31:04');
INSERT INTO `sys_operation_log` VALUES ('216', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"params\":{},\"roleSort\":\"2\",\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"1\"}', 'null', '0', '', '2020-10-24 20:31:25');
INSERT INTO `sys_operation_log` VALUES ('217', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"params\":{},\"roleSort\":\"2\",\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"1\"}', 'null', '0', '', '2020-10-24 20:32:29');
INSERT INTO `sys_operation_log` VALUES ('218', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":1,\"admin\":true,\"remark\":\"管理员\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"status\":\"1\"}', 'null', '0', '不允许操作超级管理员角色', '2020-10-24 23:05:54');
INSERT INTO `sys_operation_log` VALUES ('219', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":1,\"admin\":true,\"remark\":\"管理员\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"status\":\"1\"}', 'null', '0', '不允许操作超级管理员角色', '2020-10-25 16:25:44');
INSERT INTO `sys_operation_log` VALUES ('220', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"params\":{},\"roleSort\":\"2\",\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"1\"}', 'null', '0', '', '2020-10-25 16:26:03');
INSERT INTO `sys_operation_log` VALUES ('221', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"params\":{},\"roleSort\":\"2\",\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"1\"}', 'null', '0', '', '2020-10-25 16:27:25');
INSERT INTO `sys_operation_log` VALUES ('222', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"params\":{},\"roleSort\":\"2\",\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"1\"}', 'null', '0', '', '2020-10-25 16:30:39');
INSERT INTO `sys_operation_log` VALUES ('223', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"params\":{},\"roleSort\":\"2\",\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"1\"}', 'null', '0', '', '2020-10-25 16:31:25');
INSERT INTO `sys_operation_log` VALUES ('224', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"params\":{},\"roleSort\":\"2\",\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"1\"}', 'null', '0', '', '2020-10-25 16:35:42');
INSERT INTO `sys_operation_log` VALUES ('225', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"params\":{},\"roleSort\":\"2\",\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"1\"}', 'null', '0', '', '2020-10-25 16:36:40');
INSERT INTO `sys_operation_log` VALUES ('226', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"params\":{},\"roleSort\":\"2\",\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"1\"}', 'null', '0', '', '2020-10-25 16:36:52');
INSERT INTO `sys_operation_log` VALUES ('227', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"params\":{},\"roleSort\":\"2\",\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"1\"}', 'null', '0', '', '2020-10-25 17:43:13');
INSERT INTO `sys_operation_log` VALUES ('228', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"params\":{},\"roleSort\":\"2\",\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"1\"}', 'null', '0', '', '2020-10-25 17:50:04');
INSERT INTO `sys_operation_log` VALUES ('229', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"params\":{},\"roleSort\":\"2\",\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"1\"}', 'null', '0', '', '2020-10-25 18:25:17');
INSERT INTO `sys_operation_log` VALUES ('230', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"params\":{},\"roleSort\":\"2\",\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[4,111,112,113,115,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,1046,1047,1048,1049,1050,1051,1052,1053,1054,1055,1056,1058,1057,1059,1060,1040,1041,1042,1043,1044,1045],\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-25 18:44:56');
INSERT INTO `sys_operation_log` VALUES ('231', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"params\":{},\"roleSort\":\"2\",\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[4,111,112,113,115,1046,1047,1048,1049,1050,1051,1052,1053,1054,1055,1056,1058,1057,1059,1060,109,110,114,2,3],\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-25 18:45:08');
INSERT INTO `sys_operation_log` VALUES ('232', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"params\":{},\"roleSort\":\"2\",\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[4,113,115,1055,1056,1058,1057,1059,1060,114,3,109,1046,1047,1048],\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-25 18:45:17');
INSERT INTO `sys_operation_log` VALUES ('233', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[4,113,115,1046,1047,1048,1055,1056,1058,1057,1059,1060],\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-25 22:01:36');
INSERT INTO `sys_operation_log` VALUES ('234', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"2\",\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[4,113,115,1046,1047,1048,1055,1056,1058,1057,1059,1060],\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-25 22:05:52');
INSERT INTO `sys_operation_log` VALUES ('235', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"2\",\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[4,113,115,1046,1047,1048,1055,1056,1058,1057,1059,1060,109,114,3,1,100,101,102,103,104,105,106,107,108,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,500,501,1040,1041,1042,1043,1044,1045,2,110,111,112,1049,1050,1051,1052,1053,1054],\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-25 22:07:23');
INSERT INTO `sys_operation_log` VALUES ('236', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[4,113,115,1055,1056,1058,1057,1059,1060,114,3],\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-25 22:07:35');
INSERT INTO `sys_operation_log` VALUES ('237', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[1,100,101,102,103,104,105,106,107,108,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,500,501,1040,1041,1042,1043,1044,1045],\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 11:15:13');
INSERT INTO `sys_operation_log` VALUES ('238', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[1,100,101,102,103,104,105,106,107,108,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,500,501,1040,1041,1042,1043,1044,1045],\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 11:16:10');
INSERT INTO `sys_operation_log` VALUES ('239', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[1,100,101,102,103,104,105,106,107,108,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,500,501,1040,1041,1042,1043,1044,1045],\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 11:24:32');
INSERT INTO `sys_operation_log` VALUES ('240', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,1040,1041,1042,1043,1044,1045],\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 11:26:44');
INSERT INTO `sys_operation_log` VALUES ('241', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,1040,1041,1042,1043,1044,1045],\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 11:27:48');
INSERT INTO `sys_operation_log` VALUES ('242', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":0,\"admin\":false,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"3\",\"updateBy\":\"admin\",\"roleKey\":\"demo\",\"roleName\":\"新增角色\",\"menuIds\":[1,100,101,102,103,104,105,106,107,108,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,500,501,1040,1041,1042,1043,1044,1045],\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 15:07:44');
INSERT INTO `sys_operation_log` VALUES ('243', '角色管理', '1', 'com.twelvet.server.system.controller.SysRoleController.add()', 'POST', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":3,\"admin\":false,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"3\",\"createBy\":\"admin\",\"roleKey\":\"demo\",\"roleName\":\"测试\",\"menuIds\":[1,100,101,102,103,104,105,106,107,108,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,500,501,1040,1041,1042,1043,1044,1045],\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 15:08:49');
INSERT INTO `sys_operation_log` VALUES ('244', '角色管理', '3', 'com.twelvet.server.system.controller.SysRoleController.remove()', 'DELETE', '1', 'admin', null, '/role/3', '127.0.0.1', '', '{roleIds=3}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 15:09:52');
INSERT INTO `sys_operation_log` VALUES ('245', '角色管理', '1', 'com.twelvet.server.system.controller.SysRoleController.add()', 'POST', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":0,\"admin\":false,\"remark\":\"asd\",\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"3\",\"roleKey\":\"demo\",\"roleName\":\"测试\",\"menuIds\":[1,100,101,102,103,104,105,106,107,108,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,500,501,1040,1041,1042,1043,1044,1045],\"status\":\"1\"}', '{\"code\":500,\"msg\":\"新增角色\'测试\'失败，角色名称已存在\"}', '1', null, '2020-10-26 15:10:10');
INSERT INTO `sys_operation_log` VALUES ('246', '角色管理', '1', 'com.twelvet.server.system.controller.SysRoleController.add()', 'POST', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"3\",\"createBy\":\"admin\",\"roleKey\":\"demo\",\"roleName\":\"测试角色\",\"menuIds\":[1,100,101,102,103,104,105,106,107,108,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,500,501,1040,1041,1042,1043,1044,1045],\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 15:20:38');
INSERT INTO `sys_operation_log` VALUES ('247', '角色管理', '5', 'com.twelvet.server.system.controller.SysRoleController.exportExcel()', 'POST', '1', 'admin', null, '/role/exportExcel', '127.0.0.1', '', '{\"flag\":false,\"admin\":false,\"params\":{}}', 'null', '1', null, '2020-10-26 15:28:54');
INSERT INTO `sys_operation_log` VALUES ('248', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"3\",\"updateBy\":\"admin\",\"roleKey\":\"demo\",\"roleName\":\"测试角色\",\"menuIds\":[1,100,101,102,103,104,105,106,107,108,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,500,501,1040,1041,1042,1043,1044,1045],\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 15:30:13');
INSERT INTO `sys_operation_log` VALUES ('249', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"3\",\"updateBy\":\"admin\",\"roleKey\":\"demo\",\"roleName\":\"测试角色\",\"menuIds\":[1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,1040,1041,1042,1043,1044,1045,500,501,108,100,101,102,103,104,105,106,107,1,109,1046,1047,1048],\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 15:41:16');
INSERT INTO `sys_operation_log` VALUES ('250', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"3\",\"updateBy\":\"admin\",\"roleKey\":\"demo\",\"roleName\":\"测试角色\",\"menuIds\":[1,100,101,102,103,104,105,106,107,108,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,500,501,1040,1041,1042,1043,1044,1045,2,109,110,111,112,1046,1047,1048,1049,1050,1051,1052,1053,1054],\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 15:41:25');
INSERT INTO `sys_operation_log` VALUES ('251', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"3\",\"updateBy\":\"admin\",\"roleKey\":\"demo\",\"roleName\":\"测试角色\",\"menuIds\":[111,112,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,1046,1047,1048,1049,1050,1051,1052,1053,1054,1040,1041,1042,1043,1044,1045],\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 15:41:38');
INSERT INTO `sys_operation_log` VALUES ('252', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"3\",\"updateBy\":\"admin\",\"roleKey\":\"demo\",\"roleName\":\"测试角色\",\"menuIds\":[111,112,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,1046,1047,1048,1049,1050,1051,1052,1053,1054,1040,1041,1042,1043,1044,1045],\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 15:42:16');
INSERT INTO `sys_operation_log` VALUES ('253', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"3\",\"updateBy\":\"admin\",\"roleKey\":\"demo\",\"roleName\":\"测试角色\",\"menuIds\":[111,112,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,1046,1047,1048,1049,1050,1051,1052,1053,1054,1040,1041,1042,1043,1044,1045],\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 15:42:27');
INSERT INTO `sys_operation_log` VALUES ('254', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"3\",\"updateBy\":\"admin\",\"roleKey\":\"demo\",\"roleName\":\"测试角色\",\"deptIds\":[101,103,104,105,106,107],\"menuIds\":[111,112,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,1046,1047,1048,1049,1050,1051,1052,1053,1054,1040,1041,1042,1043,1044,1045],\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 15:44:13');
INSERT INTO `sys_operation_log` VALUES ('255', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"3\",\"updateBy\":\"admin\",\"roleKey\":\"demo\",\"roleName\":\"测试角色\",\"deptIds\":[100,101,102,103,104,105,106,107,108,109],\"menuIds\":[111,112,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,1046,1047,1048,1049,1050,1051,1052,1053,1054,1040,1041,1042,1043,1044,1045],\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 15:44:33');
INSERT INTO `sys_operation_log` VALUES ('256', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"3\",\"updateBy\":\"admin\",\"roleKey\":\"demo\",\"roleName\":\"测试角色\",\"deptIds\":[100,101,102,103,104,105,106,107,108,109],\"menuIds\":[111,112,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,1046,1047,1048,1049,1050,1051,1052,1053,1054,1040,1041,1042,1043,1044,1045],\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 15:45:30');
INSERT INTO `sys_operation_log` VALUES ('257', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"3\",\"updateBy\":\"admin\",\"roleKey\":\"demo\",\"roleName\":\"测试角色\",\"deptIds\":[100,101,102,103,104,105,106,107,108,109],\"menuIds\":[111,112,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,1046,1047,1048,1049,1050,1051,1052,1053,1054,1040,1041,1042,1043,1044,1045],\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 16:20:30');
INSERT INTO `sys_operation_log` VALUES ('258', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"3\",\"updateBy\":\"admin\",\"roleKey\":\"demo\",\"roleName\":\"测试角色\",\"deptIds\":[],\"menuIds\":[111,112,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,1046,1047,1048,1049,1050,1051,1052,1053,1054,1040,1041,1042,1043,1044,1045,500,501,108,100,101,102,103,104,105,106,107,109,110,1,2,4],\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 16:20:40');
INSERT INTO `sys_operation_log` VALUES ('259', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"3\",\"updateBy\":\"admin\",\"roleKey\":\"demo\",\"roleName\":\"测试角色\",\"deptIds\":[],\"menuIds\":[4,111,112,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,1046,1047,1048,1049,1050,1051,1052,1053,1054,1040,1041,1042,1043,1044,1045,500,501,108,100,101,102,103,104,105,106,107,109,110,1,2,113],\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 16:25:48');
INSERT INTO `sys_operation_log` VALUES ('260', '角色管理', '3', 'com.twelvet.server.system.controller.SysRoleController.remove()', 'DELETE', '1', 'admin', null, '/role/4', '127.0.0.1', '', '{roleIds=4}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 16:30:16');
INSERT INTO `sys_operation_log` VALUES ('261', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"3\",\"updateBy\":\"admin\",\"roleKey\":\"demo\",\"roleName\":\"测试角色\",\"deptIds\":[100,101,102,103,104,105,106,107,108,109],\"menuIds\":[4,111,112,113,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,1046,1047,1048,1049,1050,1051,1052,1053,1054,1040,1041,1042,1043,1044,1045],\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 16:43:15');
INSERT INTO `sys_operation_log` VALUES ('262', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"3\",\"updateBy\":\"admin\",\"roleKey\":\"demo\",\"roleName\":\"测试角色\",\"deptIds\":[103,104,105,106,107,101],\"menuIds\":[4,111,112,113,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,1046,1047,1048,1049,1050,1051,1052,1053,1054,1040,1041,1042,1043,1044,1045],\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 16:43:23');
INSERT INTO `sys_operation_log` VALUES ('263', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"3\",\"updateBy\":\"admin\",\"roleKey\":\"demo\",\"roleName\":\"测试角色\",\"deptIds\":[103,104,105,106,107],\"menuIds\":[4,111,112,113,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,1046,1047,1048,1049,1050,1051,1052,1053,1054,1040,1041,1042,1043,1044,1045],\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 16:46:51');
INSERT INTO `sys_operation_log` VALUES ('264', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.changeStatus()', 'PUT', '1', 'admin', null, '/role/changeStatus', '127.0.0.1', '', '{\"flag\":false,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"code\":500,\"msg\":\"操作失败\"}', '1', null, '2020-10-26 17:12:38');
INSERT INTO `sys_operation_log` VALUES ('265', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.changeStatus()', 'PUT', '1', 'admin', null, '/role/changeStatus', '127.0.0.1', '', '{\"flag\":false,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"code\":500,\"msg\":\"操作失败\"}', '1', null, '2020-10-26 17:12:40');
INSERT INTO `sys_operation_log` VALUES ('266', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.changeStatus()', 'PUT', '1', 'admin', null, '/role/changeStatus', '127.0.0.1', '', '{\"flag\":false,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"code\":500,\"msg\":\"操作失败\"}', '1', null, '2020-10-26 17:13:16');
INSERT INTO `sys_operation_log` VALUES ('267', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.changeStatus()', 'PUT', '1', 'admin', null, '/role/changeStatus', '127.0.0.1', '', '{\"flag\":false,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":\"false\"}', '{\"code\":500,\"msg\":\"操作失败\"}', '1', null, '2020-10-26 17:13:36');
INSERT INTO `sys_operation_log` VALUES ('268', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.changeStatus()', 'PUT', '1', 'admin', null, '/role/changeStatus', '127.0.0.1', '', '{\"flag\":false,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"code\":500,\"msg\":\"操作失败\"}', '1', null, '2020-10-26 17:14:53');
INSERT INTO `sys_operation_log` VALUES ('269', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.changeStatus()', 'PUT', '1', 'admin', null, '/role/changeStatus', '127.0.0.1', '', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 17:15:09');
INSERT INTO `sys_operation_log` VALUES ('270', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.changeStatus()', 'PUT', '1', 'admin', null, '/role/changeStatus', '127.0.0.1', '', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":\"false\"}', 'null', '0', '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'status\' at row 1\r\n### The error may exist in file [D:\\我的文档\\桌面\\GitHub\\twelvet\\main\\twelvet-server\\twelvet-server-system\\target\\classes\\mapper\\system\\SysRoleMapper.xml]\r\n### The error may involve com.twelvet.server.system.mapper.SysRoleMapper.updateRole-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_role          SET status = ?,                          update_by = ?,             update_time = sysdate()          where role_id = ?\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'status\' at row 1\n; Data truncation: Data too long for column \'status\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'status\' at row 1', '2020-10-26 17:15:32');
INSERT INTO `sys_operation_log` VALUES ('271', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.changeStatus()', 'PUT', '1', 'admin', null, '/role/changeStatus', '127.0.0.1', '', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":\"false\"}', 'null', '0', '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'status\' at row 1\r\n### The error may exist in file [D:\\我的文档\\桌面\\GitHub\\twelvet\\main\\twelvet-server\\twelvet-server-system\\target\\classes\\mapper\\system\\SysRoleMapper.xml]\r\n### The error may involve com.twelvet.server.system.mapper.SysRoleMapper.updateRole-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_role          SET status = ?,                          update_by = ?,             update_time = sysdate()          where role_id = ?\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'status\' at row 1\n; Data truncation: Data too long for column \'status\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'status\' at row 1', '2020-10-26 17:15:42');
INSERT INTO `sys_operation_log` VALUES ('272', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.changeStatus()', 'PUT', '1', 'admin', null, '/role/changeStatus', '127.0.0.1', '', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":\"false\"}', 'null', '0', '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'status\' at row 1\r\n### The error may exist in file [D:\\我的文档\\桌面\\GitHub\\twelvet\\main\\twelvet-server\\twelvet-server-system\\target\\classes\\mapper\\system\\SysRoleMapper.xml]\r\n### The error may involve com.twelvet.server.system.mapper.SysRoleMapper.updateRole-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_role          SET status = ?,                          update_by = ?,             update_time = sysdate()          where role_id = ?\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'status\' at row 1\n; Data truncation: Data too long for column \'status\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'status\' at row 1', '2020-10-26 17:15:43');
INSERT INTO `sys_operation_log` VALUES ('273', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.changeStatus()', 'PUT', '1', 'admin', null, '/role/changeStatus', '127.0.0.1', '', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":\"false\"}', 'null', '0', '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'status\' at row 1\r\n### The error may exist in file [D:\\我的文档\\桌面\\GitHub\\twelvet\\main\\twelvet-server\\twelvet-server-system\\target\\classes\\mapper\\system\\SysRoleMapper.xml]\r\n### The error may involve com.twelvet.server.system.mapper.SysRoleMapper.updateRole-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_role          SET status = ?,                          update_by = ?,             update_time = sysdate()          where role_id = ?\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'status\' at row 1\n; Data truncation: Data too long for column \'status\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'status\' at row 1', '2020-10-26 17:21:49');
INSERT INTO `sys_operation_log` VALUES ('274', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.changeStatus()', 'PUT', '1', 'admin', null, '/role/changeStatus', '127.0.0.1', '', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 17:24:44');
INSERT INTO `sys_operation_log` VALUES ('275', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.changeStatus()', 'PUT', '1', 'admin', null, '/role/changeStatus', '127.0.0.1', '', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 17:24:48');
INSERT INTO `sys_operation_log` VALUES ('276', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.changeStatus()', 'PUT', '1', 'admin', null, '/role/changeStatus', '127.0.0.1', '', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 17:24:53');
INSERT INTO `sys_operation_log` VALUES ('277', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.changeStatus()', 'PUT', '1', 'admin', null, '/role/changeStatus', '127.0.0.1', '', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 17:25:00');
INSERT INTO `sys_operation_log` VALUES ('278', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.changeStatus()', 'PUT', '1', 'admin', null, '/role/changeStatus', '127.0.0.1', '', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 17:25:11');
INSERT INTO `sys_operation_log` VALUES ('279', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.changeStatus()', 'PUT', '1', 'admin', null, '/role/changeStatus', '127.0.0.1', '', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 17:42:44');
INSERT INTO `sys_operation_log` VALUES ('280', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.changeStatus()', 'PUT', '1', 'admin', null, '/role/changeStatus', '127.0.0.1', '', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 17:42:47');
INSERT INTO `sys_operation_log` VALUES ('281', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.changeStatus()', 'PUT', '1', 'admin', null, '/role/changeStatus', '127.0.0.1', '', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":0}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 17:43:32');
INSERT INTO `sys_operation_log` VALUES ('282', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.changeStatus()', 'PUT', '1', 'admin', null, '/role/changeStatus', '127.0.0.1', '', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 17:43:36');
INSERT INTO `sys_operation_log` VALUES ('283', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.changeStatus()', 'PUT', '1', 'admin', null, '/role/changeStatus', '127.0.0.1', '', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":0}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 17:43:38');
INSERT INTO `sys_operation_log` VALUES ('284', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.changeStatus()', 'PUT', '1', 'admin', null, '/role/changeStatus', '127.0.0.1', '', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":0}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 17:43:44');
INSERT INTO `sys_operation_log` VALUES ('285', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.changeStatus()', 'PUT', '1', 'admin', null, '/role/changeStatus', '127.0.0.1', '', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":0}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 17:43:57');
INSERT INTO `sys_operation_log` VALUES ('286', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.changeStatus()', 'PUT', '1', 'admin', null, '/role/changeStatus', '127.0.0.1', '', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 17:48:26');
INSERT INTO `sys_operation_log` VALUES ('287', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.changeStatus()', 'PUT', '1', 'admin', null, '/role/changeStatus', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":0}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 17:48:26');
INSERT INTO `sys_operation_log` VALUES ('288', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.changeStatus()', 'PUT', '1', 'admin', null, '/role/changeStatus', '127.0.0.1', '', '{\"flag\":false,\"roleId\":1,\"admin\":true,\"params\":{},\"status\":0}', 'null', '0', '不允许操作超级管理员角色', '2020-10-26 17:48:26');
INSERT INTO `sys_operation_log` VALUES ('289', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.changeStatus()', 'PUT', '1', 'admin', null, '/role/changeStatus', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 17:48:28');
INSERT INTO `sys_operation_log` VALUES ('290', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.changeStatus()', 'PUT', '1', 'admin', null, '/role/changeStatus', '127.0.0.1', '', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":0}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 17:48:29');
INSERT INTO `sys_operation_log` VALUES ('291', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.changeStatus()', 'PUT', '1', 'admin', null, '/role/changeStatus', '127.0.0.1', '', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 17:48:58');
INSERT INTO `sys_operation_log` VALUES ('292', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.changeStatus()', 'PUT', '1', 'admin', null, '/role/changeStatus', '127.0.0.1', '', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":0}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 17:48:59');
INSERT INTO `sys_operation_log` VALUES ('293', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.changeStatus()', 'PUT', '1', 'admin', null, '/role/changeStatus', '127.0.0.1', '', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 17:49:11');
INSERT INTO `sys_operation_log` VALUES ('294', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.changeStatus()', 'PUT', '1', 'admin', null, '/role/changeStatus', '127.0.0.1', '', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":0}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 17:49:16');
INSERT INTO `sys_operation_log` VALUES ('295', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.changeStatus()', 'PUT', '1', 'admin', null, '/role/changeStatus', '127.0.0.1', '', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 17:57:24');
INSERT INTO `sys_operation_log` VALUES ('296', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.changeStatus()', 'PUT', '1', 'admin', null, '/role/changeStatus', '127.0.0.1', '', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":0}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 17:57:27');
INSERT INTO `sys_operation_log` VALUES ('297', '角色管理', '3', 'com.twelvet.server.system.controller.SysRoleController.remove()', 'DELETE', '1', 'admin', null, '/role/4', '127.0.0.1', '', '{roleIds=4}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 17:57:33');
INSERT INTO `sys_operation_log` VALUES ('298', '角色管理', '3', 'com.twelvet.server.system.controller.SysRoleController.remove()', 'DELETE', '1', 'admin', null, '/role/4', '127.0.0.1', '', '{roleIds=4}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 17:57:51');
INSERT INTO `sys_operation_log` VALUES ('299', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":1,\"admin\":true,\"remark\":\"管理员\",\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"deptIds\":[],\"menuIds\":[1,100,101,102,103,104,105,106,107,108,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,500,501,1040,1041,1042,1043,1044,1045,2,109,110,111,112,1046,1047,1048,1049,1050,1051,1052,1053,1054,3,113,114,115,1055,1056,1058,1057,1059,1060,4],\"status\":1}', 'null', '0', '不允许操作超级管理员角色', '2020-10-26 17:58:58');
INSERT INTO `sys_operation_log` VALUES ('300', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.changeStatus()', 'PUT', '1', 'admin', null, '/role/changeStatus', '127.0.0.1', '', '{\"flag\":false,\"roleId\":1,\"admin\":true,\"params\":{},\"status\":0}', 'null', '0', '不允许操作超级管理员角色', '2020-10-26 17:59:26');
INSERT INTO `sys_operation_log` VALUES ('301', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.changeStatus()', 'PUT', '1', 'admin', null, '/role/changeStatus', '127.0.0.1', '', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 21:28:08');
INSERT INTO `sys_operation_log` VALUES ('302', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.changeStatus()', 'PUT', '1', 'admin', null, '/role/changeStatus', '127.0.0.1', '', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":0}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 21:28:09');
INSERT INTO `sys_operation_log` VALUES ('303', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.changeStatus()', 'PUT', '1', 'admin', null, '/role/changeStatus', '127.0.0.1', '', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-26 21:28:10');
INSERT INTO `sys_operation_log` VALUES ('304', '角色管理', '5', 'com.twelvet.server.system.controller.SysRoleController.exportExcel()', 'POST', '1', 'admin', null, '/role/exportExcel', '127.0.0.1', '', '{\"flag\":false,\"admin\":false,\"params\":{}}', 'null', '1', null, '2020-10-26 21:31:12');
INSERT INTO `sys_operation_log` VALUES ('305', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.changeStatus()', 'PUT', '1', 'admin', null, '/role/changeStatus', '127.0.0.1', '', '{\"flag\":false,\"roleId\":1,\"admin\":true,\"params\":{},\"status\":0}', 'null', '0', '不允许操作超级管理员角色', '2020-10-27 22:00:13');
INSERT INTO `sys_operation_log` VALUES ('306', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.changeStatus()', 'PUT', '1', 'admin', null, '/role/changeStatus', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":0}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-27 22:00:13');
INSERT INTO `sys_operation_log` VALUES ('307', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.changeStatus()', 'PUT', '1', 'admin', null, '/role/changeStatus', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-27 22:00:14');
INSERT INTO `sys_operation_log` VALUES ('308', '用户管理', '2', 'com.twelvet.server.system.controller.SysUserController.edit()', 'PUT', '1', 'admin', null, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15888888888\",\"admin\":true,\"remark\":\"管理员\",\"postIds\":[1],\"email\":\"2471835953@qq.com\",\"nickName\":\"twelvet\",\"sex\":0,\"params\":{},\"userId\":1,\"roleIds\":[1,2],\"status\":1}', 'null', '0', '不允许操作超级管理员用户', '2020-10-28 16:42:23');
INSERT INTO `sys_operation_log` VALUES ('309', '用户管理', '2', 'com.twelvet.server.system.controller.SysUserController.edit()', 'PUT', '1', 'admin', null, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15888888888\",\"admin\":true,\"remark\":\"管理员\",\"updateBy\":\"admin\",\"postIds\":[1],\"email\":\"2471835953@qq.com\",\"nickName\":\"twelvet\",\"sex\":0,\"params\":{},\"userId\":1,\"roleIds\":[1,2],\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-28 16:44:10');
INSERT INTO `sys_operation_log` VALUES ('310', '用户管理', '2', 'com.twelvet.server.system.controller.SysUserController.edit()', 'PUT', '1', 'admin', null, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15888888888\",\"admin\":true,\"remark\":\"管理员\",\"updateBy\":\"admin\",\"postIds\":[1,2],\"email\":\"2471835953@qq.com\",\"nickName\":\"twelvet\",\"sex\":0,\"params\":{},\"userId\":1,\"roleIds\":[1],\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-28 16:50:20');
INSERT INTO `sys_operation_log` VALUES ('311', '用户管理', '2', 'com.twelvet.server.system.controller.SysUserController.edit()', 'PUT', '1', 'admin', null, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15888888888\",\"admin\":true,\"remark\":\"管理员\",\"updateBy\":\"admin\",\"postIds\":[1,2],\"email\":\"2471835953@qq.com\",\"nickName\":\"twelvet\",\"sex\":0,\"deptId\":100,\"params\":{},\"userId\":1,\"roleIds\":[1],\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-28 17:12:21');
INSERT INTO `sys_operation_log` VALUES ('312', '用户管理', '2', 'com.twelvet.server.system.controller.SysUserController.edit()', 'PUT', '1', 'admin', null, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15888888888\",\"admin\":true,\"remark\":\"管理员\",\"updateBy\":\"admin\",\"postIds\":[1,2],\"email\":\"2471835953@qq.com\",\"nickName\":\"twelvet\",\"sex\":0,\"deptId\":101,\"params\":{},\"userId\":1,\"roleIds\":[1],\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-28 17:12:28');
INSERT INTO `sys_operation_log` VALUES ('313', '用户管理', '2', 'com.twelvet.server.system.controller.SysUserController.edit()', 'PUT', '1', 'admin', null, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15888888888\",\"admin\":true,\"remark\":\"管理员\",\"updateBy\":\"admin\",\"postIds\":[1,2],\"email\":\"2471835953@qq.com\",\"nickName\":\"twelvet\",\"sex\":0,\"deptId\":101,\"params\":{},\"userId\":1,\"roleIds\":[1],\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-28 17:12:44');
INSERT INTO `sys_operation_log` VALUES ('314', '用户管理', '2', 'com.twelvet.server.system.controller.SysUserController.edit()', 'PUT', '1', 'admin', null, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15888888888\",\"admin\":true,\"remark\":\"管理员\",\"updateBy\":\"admin\",\"postIds\":[1,2],\"email\":\"2471835953@qq.com\",\"nickName\":\"twelvet\",\"sex\":0,\"deptId\":101,\"params\":{},\"userId\":1,\"roleIds\":[1],\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-28 17:22:27');
INSERT INTO `sys_operation_log` VALUES ('315', '用户管理', '1', 'com.twelvet.server.system.controller.SysUserController.add()', 'POST', '1', 'admin', null, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15467897456\",\"admin\":false,\"remark\":\"11321\",\"password\":\"123456\",\"postIds\":[4],\"email\":\"2471835953@qq.com\",\"nickName\":\"测试用户\",\"sex\":0,\"deptId\":100,\"params\":{},\"userId\":0,\"roleIds\":[4],\"status\":1,\"username\":\"demo\"}', '{\"code\":500,\"msg\":\"新增用户\'demo\'失败，邮箱账号已存在\"}', '1', null, '2020-10-28 17:42:07');
INSERT INTO `sys_operation_log` VALUES ('316', '用户管理', '1', 'com.twelvet.server.system.controller.SysUserController.add()', 'POST', '1', 'admin', null, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15768725546\",\"admin\":false,\"password\":\"$2a$10$zbjnq.lsEQWIkazrDPhlW.iBvKa5pahideSNMPIOd18llEIrAzuCq\",\"postIds\":[3],\"email\":\"522554178@qq.com\",\"nickName\":\"测试用户\",\"sex\":0,\"deptId\":100,\"params\":{},\"userId\":2,\"createBy\":\"admin\",\"roleIds\":[4],\"status\":1,\"username\":\"demo\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-28 17:47:43');
INSERT INTO `sys_operation_log` VALUES ('317', '用户管理', '2', 'com.twelvet.server.system.controller.SysUserController.edit()', 'PUT', '1', 'admin', null, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15888888888\",\"admin\":true,\"remark\":\"管理员\",\"updateBy\":\"admin\",\"postIds\":[1,2],\"email\":\"2471835953@qq.com\",\"nickName\":\"twelvet\",\"sex\":0,\"deptId\":101,\"params\":{},\"userId\":1,\"roleIds\":[1],\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-28 18:29:36');
INSERT INTO `sys_operation_log` VALUES ('318', '用户管理', '2', 'com.twelvet.server.system.controller.SysUserController.edit()', 'PUT', '1', 'admin', null, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15768725546\",\"admin\":false,\"updateBy\":\"admin\",\"postIds\":[3,2,1],\"email\":\"522554178@qq.com\",\"nickName\":\"测试用户\",\"sex\":0,\"deptId\":100,\"params\":{},\"userId\":2,\"roleIds\":[2],\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-28 18:48:33');
INSERT INTO `sys_operation_log` VALUES ('319', '用户管理', '2', 'com.twelvet.server.system.controller.SysUserController.edit()', 'PUT', '1', 'admin', null, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15888888888\",\"admin\":true,\"remark\":\"管理员\",\"postIds\":[1,2,3,4],\"email\":\"2471835953@qq.com\",\"nickName\":\"twelvet\",\"sex\":0,\"deptId\":101,\"params\":{},\"userId\":1,\"roleIds\":[1],\"status\":1}', 'null', '0', '不允许操作超级管理员用户', '2020-10-29 20:26:21');
INSERT INTO `sys_operation_log` VALUES ('320', '用户管理', '2', 'com.twelvet.server.system.controller.SysUserController.edit()', 'PUT', '1', 'admin', null, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15768725546\",\"admin\":false,\"updateBy\":\"admin\",\"postIds\":[1,2,3,4],\"email\":\"522554178@qq.com\",\"nickName\":\"测试用户\",\"sex\":0,\"deptId\":100,\"params\":{},\"userId\":2,\"roleIds\":[2],\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-29 20:26:30');
INSERT INTO `sys_operation_log` VALUES ('321', '用户管理', '2', 'com.twelvet.server.system.controller.SysUserController.edit()', 'PUT', '1', 'admin', null, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15768725546\",\"admin\":false,\"updateBy\":\"admin\",\"postIds\":[1,2,3,4],\"email\":\"522554178@qq.com\",\"nickName\":\"测试用户\",\"sex\":0,\"deptId\":100,\"params\":{},\"userId\":2,\"roleIds\":[2],\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-29 20:26:57');
INSERT INTO `sys_operation_log` VALUES ('322', '用户管理', '2', 'com.twelvet.server.system.controller.SysUserController.edit()', 'PUT', '1', 'admin', null, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15768725546\",\"admin\":false,\"updateBy\":\"admin\",\"postIds\":[1,2,3,4],\"email\":\"522554178@qq.com\",\"nickName\":\"测试用户\",\"sex\":0,\"deptId\":100,\"params\":{},\"userId\":2,\"roleIds\":[2],\"status\":0}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-29 20:27:08');
INSERT INTO `sys_operation_log` VALUES ('323', '用户管理', '2', 'com.twelvet.server.system.controller.SysUserController.edit()', 'PUT', '1', 'admin', null, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15768725546\",\"admin\":false,\"updateBy\":\"admin\",\"postIds\":[1,2,3,4],\"email\":\"522554178@qq.com\",\"nickName\":\"测试用户\",\"sex\":0,\"deptId\":100,\"params\":{},\"userId\":2,\"roleIds\":[2],\"status\":0}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-29 20:27:15');
INSERT INTO `sys_operation_log` VALUES ('324', '用户管理', '2', 'com.twelvet.server.system.controller.SysUserController.edit()', 'PUT', '1', 'admin', null, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15768725546\",\"admin\":false,\"updateBy\":\"admin\",\"postIds\":[1,2,3,4],\"email\":\"522554178@qq.com\",\"nickName\":\"测试用户\",\"sex\":1,\"deptId\":100,\"params\":{},\"userId\":2,\"roleIds\":[2],\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-29 20:27:27');
INSERT INTO `sys_operation_log` VALUES ('325', '用户管理', '2', 'com.twelvet.server.system.controller.SysUserController.edit()', 'PUT', '1', 'admin', null, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15768725546\",\"admin\":false,\"remark\":\"sczxczxc\",\"updateBy\":\"admin\",\"postIds\":[1,2,3,4],\"email\":\"522554178@qq.com\",\"nickName\":\"测试用户\",\"sex\":0,\"deptId\":100,\"params\":{},\"userId\":2,\"roleIds\":[2],\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-29 20:27:37');
INSERT INTO `sys_operation_log` VALUES ('326', '用户管理', '2', 'com.twelvet.server.system.controller.SysUserController.edit()', 'PUT', '1', 'admin', null, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15768725546\",\"admin\":false,\"remark\":\"sczxczxc\",\"updateBy\":\"admin\",\"postIds\":[1,2,3,4],\"email\":\"522554178@qq.com\",\"nickName\":\"测试用户\",\"sex\":0,\"deptId\":100,\"params\":{},\"userId\":2,\"roleIds\":[2],\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-29 20:27:44');
INSERT INTO `sys_operation_log` VALUES ('327', '用户管理', '2', 'com.twelvet.server.system.controller.SysUserController.edit()', 'PUT', '1', 'admin', null, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15768725546\",\"admin\":false,\"remark\":\"sczxczxc\",\"updateBy\":\"admin\",\"postIds\":[1,2,3,4],\"email\":\"522554178@qq.com\",\"nickName\":\"测试用户\",\"sex\":1,\"deptId\":100,\"params\":{},\"userId\":2,\"roleIds\":[2,4],\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-29 22:00:06');
INSERT INTO `sys_operation_log` VALUES ('328', '用户管理', '2', 'com.twelvet.server.system.controller.SysUserController.edit()', 'PUT', '1', 'admin', null, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15768725546\",\"admin\":false,\"remark\":\"sczxczxc\",\"updateBy\":\"admin\",\"postIds\":[1,2,3,4],\"email\":\"522554178@qq.com\",\"nickName\":\"测试用户\",\"sex\":1,\"deptId\":100,\"params\":{},\"userId\":2,\"roleIds\":[2],\"status\":0}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-29 22:04:36');
INSERT INTO `sys_operation_log` VALUES ('329', '用户管理', '2', 'com.twelvet.server.system.controller.SysUserController.edit()', 'PUT', '1', 'admin', null, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15768725546\",\"admin\":false,\"remark\":\"sczxczxc\",\"updateBy\":\"admin\",\"postIds\":[1,2,3,4],\"email\":\"522554178@qq.com\",\"nickName\":\"测试用户\",\"sex\":1,\"deptId\":100,\"params\":{},\"userId\":2,\"roleIds\":[2],\"status\":0}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-29 22:10:14');
INSERT INTO `sys_operation_log` VALUES ('330', '用户管理', '2', 'com.twelvet.server.system.controller.SysUserController.edit()', 'PUT', '1', 'admin', null, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15768725546\",\"admin\":false,\"remark\":\"sczxczxc\",\"updateBy\":\"admin\",\"postIds\":[1,2,3,4],\"email\":\"522554178@qq.com\",\"nickName\":\"测试用户\",\"sex\":1,\"deptId\":100,\"params\":{},\"userId\":2,\"roleIds\":[2],\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-29 22:10:31');
INSERT INTO `sys_operation_log` VALUES ('331', '用户管理', '2', 'com.twelvet.server.system.controller.SysUserController.edit()', 'PUT', '1', 'admin', null, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15768725546\",\"admin\":false,\"remark\":\"sczxczxc\",\"updateBy\":\"admin\",\"postIds\":[1,2,3,4],\"email\":\"522554178@qq.com\",\"nickName\":\"测试用户\",\"sex\":1,\"deptId\":100,\"params\":{},\"userId\":2,\"roleIds\":[2],\"status\":0}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-29 22:17:12');
INSERT INTO `sys_operation_log` VALUES ('332', '用户管理', '2', 'com.twelvet.server.system.controller.SysUserController.edit()', 'PUT', '1', 'admin', null, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15768725546\",\"admin\":false,\"remark\":\"sczxczxc\",\"updateBy\":\"admin\",\"postIds\":[1,2,3,4],\"email\":\"522554178@qq.com\",\"nickName\":\"测试用户\",\"sex\":1,\"deptId\":100,\"params\":{},\"userId\":2,\"roleIds\":[2],\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-29 22:17:31');
INSERT INTO `sys_operation_log` VALUES ('333', '用户管理', '2', 'com.twelvet.server.system.controller.SysUserController.edit()', 'PUT', '1', 'admin', null, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15768725546\",\"admin\":false,\"remark\":\"sczxczxc\",\"updateBy\":\"admin\",\"postIds\":[1,2,3,4],\"email\":\"522554178@qq.com\",\"nickName\":\"测试用户\",\"sex\":1,\"deptId\":100,\"params\":{},\"userId\":2,\"roleIds\":[2],\"status\":0}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-29 23:40:01');
INSERT INTO `sys_operation_log` VALUES ('334', '用户管理', '2', 'com.twelvet.server.system.controller.SysUserController.edit()', 'PUT', '1', 'admin', null, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15768725546\",\"admin\":false,\"remark\":\"sczxczxc\",\"updateBy\":\"admin\",\"postIds\":[1,2,3,4],\"email\":\"522554178@qq.com\",\"nickName\":\"测试用户\",\"sex\":1,\"deptId\":100,\"params\":{},\"userId\":2,\"roleIds\":[2],\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-29 23:40:10');
INSERT INTO `sys_operation_log` VALUES ('335', '用户管理', '5', 'com.twelvet.server.system.controller.SysUserController.exportExcel()', 'POST', '1', 'admin', null, '/user/exportExcel', '127.0.0.1', '', '{\"admin\":false,\"params\":{}}', 'null', '1', null, '2020-10-29 23:40:30');
INSERT INTO `sys_operation_log` VALUES ('336', '用户管理', '3', 'com.twelvet.server.system.controller.SysUserController.remove()', 'DELETE', '1', 'admin', null, '/user/2', '127.0.0.1', '', '{userIds=2}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-29 23:41:03');
INSERT INTO `sys_operation_log` VALUES ('337', '用户管理', '3', 'com.twelvet.server.system.controller.SysUserController.remove()', 'DELETE', '1', 'admin', null, '/user/2', '127.0.0.1', '', '{userIds=2}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-29 23:41:22');
INSERT INTO `sys_operation_log` VALUES ('338', '用户管理', '2', 'com.twelvet.server.system.controller.SysUserController.edit()', 'PUT', '1', 'admin', null, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15888888888\",\"admin\":true,\"remark\":\"管理员\",\"postIds\":[1,2],\"email\":\"2471835953@qq.com\",\"nickName\":\"twelvet\",\"sex\":0,\"deptId\":103,\"params\":{},\"userId\":1,\"roleIds\":[1],\"status\":1}', 'null', '0', '不允许操作超级管理员用户', '2020-10-30 23:48:40');
INSERT INTO `sys_operation_log` VALUES ('339', '用户管理', '2', 'com.twelvet.server.system.controller.SysUserController.edit()', 'PUT', '1', 'admin', null, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15768725546\",\"admin\":false,\"remark\":\"sczxczxc\",\"updateBy\":\"admin\",\"postIds\":[1,2,3,4],\"email\":\"522554178@qq.com\",\"nickName\":\"测试用户\",\"sex\":1,\"deptId\":103,\"params\":{},\"userId\":2,\"roleIds\":[2],\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-30 23:48:51');
INSERT INTO `sys_operation_log` VALUES ('340', '用户管理', '2', 'com.twelvet.server.system.controller.SysUserController.edit()', 'PUT', '1', 'demo', null, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15888888888\",\"admin\":true,\"remark\":\"管理员\",\"postIds\":[1,2],\"email\":\"2471835953@qq.com\",\"nickName\":\"twelvet\",\"sex\":0,\"deptId\":101,\"params\":{},\"userId\":1,\"roleIds\":[1],\"status\":1}', 'null', '0', '不允许操作超级管理员用户', '2020-10-31 11:45:08');
INSERT INTO `sys_operation_log` VALUES ('341', '用户管理', '2', 'com.twelvet.server.system.controller.SysUserController.edit()', 'PUT', '1', 'demo', null, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15768725546\",\"admin\":false,\"remark\":\"sczxczxc\",\"updateBy\":\"demo\",\"postIds\":[1,2,3,4],\"email\":\"522554178@qq.com\",\"nickName\":\"测试用户\",\"sex\":1,\"deptId\":103,\"params\":{},\"userId\":2,\"roleIds\":[2],\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-10-31 11:45:12');
INSERT INTO `sys_operation_log` VALUES ('342', '用户管理', '5', 'com.twelvet.server.system.controller.SysUserController.exportExcel()', 'POST', '1', 'admin', null, '/user/exportExcel', '127.0.0.1', '', '{\"admin\":false,\"params\":{}}', 'null', '1', null, '2020-10-31 13:02:28');
INSERT INTO `sys_operation_log` VALUES ('343', '用户管理', '5', 'com.twelvet.server.system.controller.SysUserController.exportExcel()', 'POST', '1', 'admin', null, '/user/exportExcel', '127.0.0.1', '', '{\"admin\":false,\"params\":{}}', 'null', '1', null, '2020-10-31 13:14:16');
INSERT INTO `sys_operation_log` VALUES ('344', '用户管理', '5', 'com.twelvet.server.system.controller.SysUserController.exportExcel()', 'POST', '1', 'admin', null, '/user/exportExcel', '127.0.0.1', '', '{\"admin\":false,\"params\":{}}', 'null', '1', null, '2020-10-31 13:14:51');
INSERT INTO `sys_operation_log` VALUES ('345', '用户管理', '5', 'com.twelvet.server.system.controller.SysUserController.exportExcel()', 'POST', '1', 'admin', null, '/user/exportExcel', '127.0.0.1', '', '{\"admin\":false,\"params\":{}}', 'null', '1', null, '2020-10-31 13:16:38');
INSERT INTO `sys_operation_log` VALUES ('346', '操作日志', '5', 'com.twelvet.server.system.controller.SysOperationLogController.exportExcel()', 'POST', '1', 'admin', null, '/operationLog/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-11-01 11:58:24');
INSERT INTO `sys_operation_log` VALUES ('347', '用户管理', '5', 'com.twelvet.server.system.controller.SysUserController.exportExcel()', 'POST', '1', 'admin', null, '/user/exportExcel', '127.0.0.1', '', '{\"admin\":false,\"params\":{}}', 'null', '1', null, '2020-11-01 16:40:56');
INSERT INTO `sys_operation_log` VALUES ('348', '用户管理', '5', 'com.twelvet.server.system.controller.SysUserController.exportExcel()', 'POST', '1', 'admin', null, '/user/exportExcel', '127.0.0.1', '', '{\"admin\":false,\"params\":{}}', 'null', '1', null, '2020-11-01 17:39:45');
INSERT INTO `sys_operation_log` VALUES ('349', '用户管理', '6', 'com.twelvet.server.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/user/importData', '127.0.0.1', '', '[] false', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-01 18:08:40');
INSERT INTO `sys_operation_log` VALUES ('350', '用户管理', '6', 'com.twelvet.server.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/user/importData', '127.0.0.1', '', '[] false', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-01 18:10:11');
INSERT INTO `sys_operation_log` VALUES ('351', '用户管理', '6', 'com.twelvet.server.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/user/importData', '127.0.0.1', '', '[] false', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-01 18:11:24');
INSERT INTO `sys_operation_log` VALUES ('352', '用户管理', '6', 'com.twelvet.server.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/user/importData', '127.0.0.1', '', '[] false', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-01 18:11:51');
INSERT INTO `sys_operation_log` VALUES ('353', '用户管理', '6', 'com.twelvet.server.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/user/importData', '127.0.0.1', '', '[] false', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-01 18:13:21');
INSERT INTO `sys_operation_log` VALUES ('354', '用户管理', '6', 'com.twelvet.server.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/user/importData', '127.0.0.1', '', '[] false', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-01 18:17:29');
INSERT INTO `sys_operation_log` VALUES ('355', '用户管理', '6', 'com.twelvet.server.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/user/importData', '127.0.0.1', '', '[] false', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-01 18:25:05');
INSERT INTO `sys_operation_log` VALUES ('356', '用户管理', '6', 'com.twelvet.server.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/user/importData', '127.0.0.1', '', '[] false', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-01 18:26:44');
INSERT INTO `sys_operation_log` VALUES ('357', '用户管理', '6', 'com.twelvet.server.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/user/importData', '127.0.0.1', '', '[] false', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-01 18:31:59');
INSERT INTO `sys_operation_log` VALUES ('358', '用户管理', '6', 'com.twelvet.server.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/user/importData', '127.0.0.1', '', '[] false', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-01 18:38:57');
INSERT INTO `sys_operation_log` VALUES ('359', '用户管理', '6', 'com.twelvet.server.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/user/importData', '127.0.0.1', '', '[] false', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-01 18:39:12');
INSERT INTO `sys_operation_log` VALUES ('360', '用户管理', '6', 'com.twelvet.server.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/user/importData', '127.0.0.1', '', '[] false', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-01 18:40:55');
INSERT INTO `sys_operation_log` VALUES ('361', '用户管理', '6', 'com.twelvet.server.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/user/importData', '127.0.0.1', '', 'false', 'null', '0', 'Redis exception; nested exception is io.lettuce.core.RedisException: java.io.IOException: 远程主机强迫关闭了一个现有的连接。', '2020-11-01 19:51:14');
INSERT INTO `sys_operation_log` VALUES ('362', '用户管理', '6', 'com.twelvet.server.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/user/importData', '127.0.0.1', '', 'false', 'null', '0', 'Redis exception; nested exception is io.lettuce.core.RedisException: java.io.IOException: 远程主机强迫关闭了一个现有的连接。', '2020-11-01 22:14:26');
INSERT INTO `sys_operation_log` VALUES ('363', '用户管理', '6', 'com.twelvet.server.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/user/importData', '127.0.0.1', '', 'false', 'null', '0', 'Redis exception; nested exception is io.lettuce.core.RedisException: java.io.IOException: 远程主机强迫关闭了一个现有的连接。', '2020-11-01 22:16:58');
INSERT INTO `sys_operation_log` VALUES ('364', '用户管理', '6', 'com.twelvet.server.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/user/importData', '127.0.0.1', '', 'false', 'null', '0', '', '2020-11-01 22:16:58');
INSERT INTO `sys_operation_log` VALUES ('365', '用户管理', '6', 'com.twelvet.server.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/user/importData', '127.0.0.1', '', 'false', 'null', '0', '', '2020-11-01 22:17:04');
INSERT INTO `sys_operation_log` VALUES ('366', '用户管理', '6', 'com.twelvet.server.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/user/importData', '127.0.0.1', '', 'false', 'null', '0', '', '2020-11-01 22:19:21');
INSERT INTO `sys_operation_log` VALUES ('367', '用户管理', '6', 'com.twelvet.server.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/user/importData', '127.0.0.1', '', 'false', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-01 22:20:06');
INSERT INTO `sys_operation_log` VALUES ('368', '用户管理', '3', 'com.twelvet.server.system.controller.SysUserController.remove()', 'DELETE', '1', 'admin', null, '/user/3', '127.0.0.1', '', '{userIds=3}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-01 22:33:30');
INSERT INTO `sys_operation_log` VALUES ('369', '用户管理', '3', 'com.twelvet.server.system.controller.SysUserController.remove()', 'DELETE', '1', 'admin', null, '/user/3', '127.0.0.1', '', '{userIds=3}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-01 22:35:21');
INSERT INTO `sys_operation_log` VALUES ('370', '用户管理', '6', 'com.twelvet.server.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/user/importData', '127.0.0.1', '', '[] true', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-01 23:58:05');
INSERT INTO `sys_operation_log` VALUES ('371', '用户管理', '6', 'com.twelvet.server.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/user/importData', '127.0.0.1', '', '[] true', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-02 00:09:00');
INSERT INTO `sys_operation_log` VALUES ('372', '岗位管理', '5', 'com.twelvet.server.system.controller.SysPostController.exportExcel()', 'POST', '1', 'admin', null, '/post/exportExcel', '127.0.0.1', '', '{\"flag\":false,\"params\":{}}', 'null', '1', null, '2020-11-04 16:56:35');
INSERT INTO `sys_operation_log` VALUES ('373', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.changeStatus()', 'PUT', '1', 'admin', null, '/role/changeStatus', '127.0.0.1', '', '{\"flag\":false,\"roleId\":1,\"admin\":true,\"params\":{},\"status\":0}', 'null', '0', '不允许操作超级管理员角色', '2020-11-07 17:05:23');
INSERT INTO `sys_operation_log` VALUES ('374', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.changeStatus()', 'PUT', '1', 'admin', null, '/role/changeStatus', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":0}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-07 17:05:26');
INSERT INTO `sys_operation_log` VALUES ('375', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.changeStatus()', 'PUT', '1', 'admin', null, '/role/changeStatus', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-07 17:05:27');
INSERT INTO `sys_operation_log` VALUES ('376', '定时任务', '2', 'com.twelvet.server.job.controller.SysJobController.changeStatus()', 'PUT', '1', 'admin', null, '/cron/changeStatus', '127.0.0.1', '', '{\"params\":{},\"jobId\":3,\"misfirePolicy\":\"0\",\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-07 17:09:42');
INSERT INTO `sys_operation_log` VALUES ('377', '定时任务', '2', 'com.twelvet.server.job.controller.SysJobController.changeStatus()', 'PUT', '1', 'admin', null, '/cron/changeStatus', '127.0.0.1', '', '{\"params\":{},\"jobId\":3,\"misfirePolicy\":\"0\",\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-07 17:09:47');
INSERT INTO `sys_operation_log` VALUES ('378', '定时任务', '2', 'com.twelvet.server.job.controller.SysJobController.changeStatus()', 'PUT', '1', 'admin', null, '/cron/changeStatus', '127.0.0.1', '', '{\"params\":{},\"jobId\":1,\"misfirePolicy\":\"0\",\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-07 19:49:30');
INSERT INTO `sys_operation_log` VALUES ('379', '定时任务', '2', 'com.twelvet.server.job.controller.SysJobController.changeStatus()', 'PUT', '1', 'admin', null, '/cron/changeStatus', '127.0.0.1', '', '{\"params\":{},\"jobId\":1,\"misfirePolicy\":\"0\",\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-07 19:49:31');
INSERT INTO `sys_operation_log` VALUES ('380', '定时任务', '2', 'com.twelvet.server.job.controller.SysJobController.changeStatus()', 'PUT', '1', 'admin', null, '/cron/changeStatus', '127.0.0.1', '', '{\"params\":{},\"jobId\":1,\"misfirePolicy\":\"0\",\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-07 20:04:24');
INSERT INTO `sys_operation_log` VALUES ('381', '定时任务', '2', 'com.twelvet.server.job.controller.SysJobController.changeStatus()', 'PUT', '1', 'admin', null, '/cron/changeStatus', '127.0.0.1', '', '{\"params\":{},\"jobId\":1,\"misfirePolicy\":\"0\",\"status\":\"false\"}', '{\"code\":500,\"msg\":\"操作失败\"}', '1', null, '2020-11-07 20:04:25');
INSERT INTO `sys_operation_log` VALUES ('382', '定时任务', '2', 'com.twelvet.server.job.controller.SysJobController.changeStatus()', 'PUT', '1', 'admin', null, '/cron/changeStatus', '127.0.0.1', '', '{\"params\":{},\"jobId\":1,\"misfirePolicy\":\"0\",\"status\":\"false\"}', '{\"code\":500,\"msg\":\"操作失败\"}', '1', null, '2020-11-07 20:04:27');
INSERT INTO `sys_operation_log` VALUES ('383', '定时任务', '2', 'com.twelvet.server.job.controller.SysJobController.changeStatus()', 'PUT', '1', 'admin', null, '/cron/changeStatus', '127.0.0.1', '', '{\"params\":{},\"jobId\":1,\"misfirePolicy\":\"0\",\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-07 20:05:04');
INSERT INTO `sys_operation_log` VALUES ('384', '定时任务', '2', 'com.twelvet.server.job.controller.SysJobController.changeStatus()', 'PUT', '1', 'admin', null, '/cron/changeStatus', '127.0.0.1', '', '{\"params\":{},\"jobId\":1,\"misfirePolicy\":\"0\",\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-07 20:05:13');
INSERT INTO `sys_operation_log` VALUES ('385', '定时任务', '2', 'com.twelvet.server.job.controller.SysJobController.changeStatus()', 'PUT', '1', 'admin', null, '/cron/changeStatus', '127.0.0.1', '', '{\"params\":{},\"jobId\":1,\"misfirePolicy\":\"0\",\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-07 20:05:14');
INSERT INTO `sys_operation_log` VALUES ('386', '定时任务', '2', 'com.twelvet.server.job.controller.SysJobController.changeStatus()', 'PUT', '1', 'admin', null, '/cron/changeStatus', '127.0.0.1', '', '{\"params\":{},\"jobId\":1,\"misfirePolicy\":\"0\",\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-07 20:05:40');
INSERT INTO `sys_operation_log` VALUES ('387', '定时任务', '2', 'com.twelvet.server.job.controller.SysJobController.changeStatus()', 'PUT', '1', 'admin', null, '/cron/changeStatus', '127.0.0.1', '', '{\"params\":{},\"jobId\":3,\"misfirePolicy\":\"0\",\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-08 14:07:53');
INSERT INTO `sys_operation_log` VALUES ('388', '定时任务', '2', 'com.twelvet.server.job.controller.SysJobController.changeStatus()', 'PUT', '1', 'admin', null, '/cron/changeStatus', '127.0.0.1', '', '{\"params\":{},\"jobId\":3,\"misfirePolicy\":\"0\",\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-08 14:08:00');
INSERT INTO `sys_operation_log` VALUES ('389', '定时任务', '2', 'com.twelvet.server.job.controller.SysJobController.changeStatus()', 'PUT', '1', 'admin', null, '/cron/changeStatus', '127.0.0.1', '', '{\"params\":{},\"jobId\":3,\"misfirePolicy\":\"0\",\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-08 14:08:06');
INSERT INTO `sys_operation_log` VALUES ('390', '定时任务', '2', 'com.twelvet.server.job.controller.SysJobController.edit()', 'PUT', '1', 'admin', null, '/cron', '127.0.0.1', '', '{\"jobName\":\"系统默认（多参）\",\"concurrent\":\"1\",\"remark\":\"\",\"jobGroup\":\"DEFAULT\",\"params\":{},\"cronExpression\":\"0 */15 * * * ?\",\"jobId\":3,\"createBy\":\"admin\",\"nextValidTime\":1604832300000,\"createTime\":1521171180000,\"updateBy\":\"admin\",\"invokeTarget\":\"twtTask.twtMultipleParams(\'ry\', true, 2000L, 316.50D, 100)\",\"misfirePolicy\":\"3\",\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-08 18:36:07');
INSERT INTO `sys_operation_log` VALUES ('391', '定时任务', '2', 'com.twelvet.server.job.controller.SysJobController.edit()', 'PUT', '1', 'admin', null, '/cron', '127.0.0.1', '', '{\"jobName\":\"系统默认（多参）\",\"concurrent\":\"1\",\"remark\":\"\",\"jobGroup\":\"DEFAULT\",\"params\":{},\"cronExpression\":\"0 */15 * * * ?\",\"jobId\":3,\"createBy\":\"admin\",\"nextValidTime\":1604832300000,\"createTime\":1521171180000,\"updateBy\":\"admin\",\"invokeTarget\":\"twtTask.twtMultipleParams(\'ry\', true, 2000L, 316.50D, 100)\",\"misfirePolicy\":\"3\",\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-08 18:36:15');
INSERT INTO `sys_operation_log` VALUES ('392', '定时任务', '2', 'com.twelvet.server.job.controller.SysJobController.run()', 'PUT', '1', 'admin', null, '/cron/run', '127.0.0.1', '', '{\"jobName\":\"系统默认（多参）\",\"concurrent\":\"1\",\"remark\":\"\",\"jobGroup\":\"DEFAULT\",\"params\":{},\"cronExpression\":\"0 */15 * * * ?\",\"jobId\":3,\"createBy\":\"admin\",\"nextValidTime\":1604832300000,\"createTime\":1521171180000,\"invokeTarget\":\"twtTask.twtMultipleParams(\'ry\', true, 2000L, 316.50D, 100)\",\"misfirePolicy\":\"3\",\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-08 18:36:52');
INSERT INTO `sys_operation_log` VALUES ('393', '定时任务', '2', 'com.twelvet.server.job.controller.SysJobController.run()', 'PUT', '1', 'admin', null, '/cron/run', '127.0.0.1', '', '{\"jobName\":\"系统默认（多参）\",\"concurrent\":\"1\",\"remark\":\"\",\"jobGroup\":\"DEFAULT\",\"params\":{},\"cronExpression\":\"0 */15 * * * ?\",\"jobId\":3,\"createBy\":\"admin\",\"nextValidTime\":1604832300000,\"createTime\":1521171180000,\"invokeTarget\":\"twtTask.twtMultipleParams(\'ry\', true, 2000L, 316.50D, 100)\",\"misfirePolicy\":\"3\",\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-08 18:37:49');
INSERT INTO `sys_operation_log` VALUES ('394', '定时任务', '2', 'com.twelvet.server.job.controller.SysJobController.run()', 'PUT', '1', 'admin', null, '/cron/run', '127.0.0.1', '', '{\"jobName\":\"系统默认（无参）\",\"concurrent\":\"1\",\"remark\":\"\",\"jobGroup\":\"DEFAULT\",\"params\":{},\"cronExpression\":\"0 */15 * * * ?\",\"jobId\":1,\"createBy\":\"admin\",\"nextValidTime\":1604832300000,\"createTime\":1521171180000,\"invokeTarget\":\"twtTask.twtNoParams\",\"misfirePolicy\":\"3\",\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-08 18:37:57');
INSERT INTO `sys_operation_log` VALUES ('395', '定时任务', '2', 'com.twelvet.server.job.controller.SysJobController.run()', 'PUT', '1', 'admin', null, '/cron/run', '127.0.0.1', '', '{\"jobGroup\":\"DEFAULT\",\"params\":{},\"jobId\":3,\"misfirePolicy\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-08 18:39:57');
INSERT INTO `sys_operation_log` VALUES ('396', '定时任务', '2', 'com.twelvet.server.job.controller.SysJobController.run()', 'PUT', '1', 'admin', null, '/cron/run', '127.0.0.1', '', '{\"jobGroup\":\"DEFAULT\",\"params\":{},\"jobId\":3,\"misfirePolicy\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-08 18:40:02');
INSERT INTO `sys_operation_log` VALUES ('397', '定时任务', '1', 'com.twelvet.server.job.controller.SysJobController.add()', 'POST', '1', 'admin', null, '/cron', '127.0.0.1', '', '{\"jobName\":\"123\",\"concurrent\":\"0\",\"jobGroup\":\"1\",\"params\":{},\"cronExpression\":\"0 */15 * * * ?\\t\",\"jobId\":100,\"createBy\":\"admin\",\"nextValidTime\":1604934000000,\"invokeTarget\":\"0 */15 * * * ?\\t\",\"misfirePolicy\":\"1\",\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-09 22:53:54');
INSERT INTO `sys_operation_log` VALUES ('398', '定时任务', '3', 'com.twelvet.server.job.controller.SysJobController.remove()', 'DELETE', '1', 'admin', null, '/cron/100', '127.0.0.1', '', '{jobIds=100}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-09 22:58:16');
INSERT INTO `sys_operation_log` VALUES ('399', '定时任务', '3', 'com.twelvet.server.job.controller.SysJobController.remove()', 'DELETE', '1', 'admin', null, '/cron/3', '127.0.0.1', '', '{jobIds=3}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-09 22:59:52');
INSERT INTO `sys_operation_log` VALUES ('400', '定时任务调度日志', '3', 'com.twelvet.server.job.controller.SysJobLogController.remove()', 'DELETE', '1', 'admin', null, '/log/1', '127.0.0.1', '', '{jobLogIds=1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-09 23:14:48');
INSERT INTO `sys_operation_log` VALUES ('401', '定时任务调度日志', '3', 'com.twelvet.server.job.controller.SysJobLogController.remove()', 'DELETE', '1', 'admin', null, '/log/2,3,4,5,6,7,8,9,10,12', '127.0.0.1', '', '{jobLogIds=2,3,4,5,6,7,8,9,10,12}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-09 23:14:58');
INSERT INTO `sys_operation_log` VALUES ('402', '定时任务', '1', 'com.twelvet.server.job.controller.SysJobController.add()', 'POST', '1', 'admin', null, '/cron', '127.0.0.1', '', '{\"jobName\":\"asd\",\"concurrent\":\"0\",\"jobGroup\":\"1\",\"params\":{},\"cronExpression\":\"0 */15 * * * ?\",\"jobId\":101,\"createBy\":\"admin\",\"nextValidTime\":1605017700000,\"invokeTarget\":\"asdasd\",\"misfirePolicy\":\"3\",\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-10 22:08:28');
INSERT INTO `sys_operation_log` VALUES ('403', '定时任务', '2', 'com.twelvet.server.job.controller.SysJobController.changeStatus()', 'PUT', '1', 'admin', null, '/cron/changeStatus', '127.0.0.1', '', '{\"params\":{},\"jobId\":1,\"misfirePolicy\":0,\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-11 18:21:30');
INSERT INTO `sys_operation_log` VALUES ('404', '定时任务', '2', 'com.twelvet.server.job.controller.SysJobController.changeStatus()', 'PUT', '1', 'admin', null, '/cron/changeStatus', '127.0.0.1', '', '{\"params\":{},\"jobId\":1,\"misfirePolicy\":0,\"status\":0}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-11 18:21:40');
INSERT INTO `sys_operation_log` VALUES ('405', '定时任务', '2', 'com.twelvet.server.job.controller.SysJobController.changeStatus()', 'PUT', '1', 'admin', null, '/cron/changeStatus', '127.0.0.1', '', '{\"params\":{},\"jobId\":1,\"misfirePolicy\":0,\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-11 18:21:44');
INSERT INTO `sys_operation_log` VALUES ('406', '定时任务', '1', 'com.twelvet.server.job.controller.SysJobController.add()', 'POST', '1', 'admin', null, '/cron', '127.0.0.1', '', '{\"jobName\":\"asd\",\"concurrent\":1,\"jobGroup\":\"1\",\"params\":{},\"cronExpression\":\"0 */15 * * * ?\",\"jobId\":102,\"createBy\":\"admin\",\"nextValidTime\":1605090600000,\"invokeTarget\":\"asdasd\",\"misfirePolicy\":3,\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-11 18:22:52');
INSERT INTO `sys_operation_log` VALUES ('407', '定时任务', '3', 'com.twelvet.server.job.controller.SysJobController.remove()', 'DELETE', '1', 'admin', null, '/cron/102', '127.0.0.1', '', '{jobIds=102}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-11 18:23:02');
INSERT INTO `sys_operation_log` VALUES ('408', '定时任务', '2', 'com.twelvet.server.job.controller.SysJobController.edit()', 'PUT', '1', 'admin', null, '/cron', '127.0.0.1', '', '{\"jobName\":\"asd\",\"concurrent\":1,\"jobGroup\":\"1\",\"params\":{},\"cronExpression\":\"0 */15 * * * ?\",\"nextValidTime\":1605090600000,\"updateBy\":\"admin\",\"invokeTarget\":\"asdasd\",\"misfirePolicy\":3,\"status\":1}', '{\"code\":500,\"msg\":\"操作失败\"}', '1', null, '2020-11-11 18:23:30');
INSERT INTO `sys_operation_log` VALUES ('409', '定时任务', '2', 'com.twelvet.server.job.controller.SysJobController.edit()', 'PUT', '1', 'admin', null, '/cron', '127.0.0.1', '', '{\"jobName\":\"asd\",\"concurrent\":1,\"jobGroup\":\"1\",\"params\":{},\"cronExpression\":\"0 */15 * * * ?\",\"nextValidTime\":1605090600000,\"updateBy\":\"admin\",\"invokeTarget\":\"asdasd\",\"misfirePolicy\":3,\"status\":1}', '{\"code\":500,\"msg\":\"操作失败\"}', '1', null, '2020-11-11 18:24:32');
INSERT INTO `sys_operation_log` VALUES ('410', '定时任务', '2', 'com.twelvet.server.job.controller.SysJobController.edit()', 'PUT', '1', 'admin', null, '/cron', '127.0.0.1', '', '{\"jobName\":\"asd\",\"concurrent\":1,\"jobGroup\":\"1\",\"params\":{},\"cronExpression\":\"0 */15 * * * ?\",\"jobId\":101,\"nextValidTime\":1605090600000,\"updateBy\":\"admin\",\"invokeTarget\":\"asdasd\",\"misfirePolicy\":3,\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-11 18:26:40');
INSERT INTO `sys_operation_log` VALUES ('411', '定时任务', '2', 'com.twelvet.server.job.controller.SysJobController.edit()', 'PUT', '1', 'admin', null, '/cron', '127.0.0.1', '', '{\"jobName\":\"asd\",\"concurrent\":0,\"jobGroup\":\"1\",\"params\":{},\"cronExpression\":\"0 */15 * * * ?\",\"jobId\":101,\"nextValidTime\":1605090600000,\"updateBy\":\"admin\",\"invokeTarget\":\"asdasd\",\"misfirePolicy\":3,\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-11 18:26:45');
INSERT INTO `sys_operation_log` VALUES ('412', '定时任务', '2', 'com.twelvet.server.job.controller.SysJobController.edit()', 'PUT', '1', 'admin', null, '/cron', '127.0.0.1', '', '{\"jobName\":\"asd\",\"concurrent\":1,\"jobGroup\":\"1\",\"params\":{},\"cronExpression\":\"0 */15 * * * ?\",\"jobId\":101,\"nextValidTime\":1605090600000,\"updateBy\":\"admin\",\"invokeTarget\":\"asdasd\",\"misfirePolicy\":3,\"status\":0}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-11 18:29:55');
INSERT INTO `sys_operation_log` VALUES ('413', '定时任务', '2', 'com.twelvet.server.job.controller.SysJobController.changeStatus()', 'PUT', '1', 'admin', null, '/cron/changeStatus', '127.0.0.1', '', '{\"concurrent\":0,\"params\":{},\"jobId\":101,\"misfirePolicy\":0,\"status\":0}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-11 18:30:02');
INSERT INTO `sys_operation_log` VALUES ('414', '定时任务', '2', 'com.twelvet.server.job.controller.SysJobController.changeStatus()', 'PUT', '1', 'admin', null, '/cron/changeStatus', '127.0.0.1', '', '{\"concurrent\":0,\"params\":{},\"jobId\":101,\"misfirePolicy\":0,\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-11 18:30:08');
INSERT INTO `sys_operation_log` VALUES ('415', '定时任务', '3', 'com.twelvet.server.job.controller.SysJobController.remove()', 'DELETE', '1', 'admin', null, '/cron/101', '127.0.0.1', '', '{jobIds=101}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-11 18:36:10');
INSERT INTO `sys_operation_log` VALUES ('416', '定时任务', '1', 'com.twelvet.server.job.controller.SysJobController.add()', 'POST', '1', 'admin', null, '/cron', '127.0.0.1', '', '{\"jobName\":\"测试任务\",\"concurrent\":0,\"jobGroup\":\"default\",\"params\":{},\"cronExpression\":\"0 */15 * * * ?\",\"jobId\":103,\"createBy\":\"admin\",\"nextValidTime\":1605104100000,\"invokeTarget\":\"twtTask.twtParams(\'twt\')\\t\",\"misfirePolicy\":1,\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-11 22:10:42');
INSERT INTO `sys_operation_log` VALUES ('417', '定时任务', '2', 'com.twelvet.server.job.controller.SysJobController.run()', 'PUT', '1', 'admin', null, '/cron/run', '127.0.0.1', '', '{\"concurrent\":0,\"jobGroup\":\"default\",\"params\":{},\"jobId\":103,\"misfirePolicy\":0,\"status\":0}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-11 22:10:53');
INSERT INTO `sys_operation_log` VALUES ('418', '定时任务', '2', 'com.twelvet.server.job.controller.SysJobController.edit()', 'PUT', '1', 'admin', null, '/cron', '127.0.0.1', '', '{\"jobName\":\"测试任务\",\"concurrent\":0,\"jobGroup\":\"default\",\"params\":{},\"cronExpression\":\"0 */15 * * * ?\",\"jobId\":103,\"nextValidTime\":1605105000000,\"updateBy\":\"admin\",\"invokeTarget\":\"twtTask.twtParams(\'twt\')\\t\",\"misfirePolicy\":3,\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-11 22:15:08');
INSERT INTO `sys_operation_log` VALUES ('419', '用户管理', '2', 'com.twelvet.server.system.controller.SysUserController.edit()', 'PUT', '1', 'admin', null, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15768745687\",\"admin\":false,\"updateBy\":\"admin\",\"postIds\":[1],\"email\":\"247183595@qq.com\",\"nickName\":\"demo\",\"sex\":\"0\",\"deptId\":1,\"params\":{},\"userId\":3,\"roleIds\":[]}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-11 23:37:51');
INSERT INTO `sys_operation_log` VALUES ('420', '定时任务', '2', 'com.twelvet.server.job.controller.SysJobController.run()', 'PUT', '1', 'admin', null, '/cron/run', '127.0.0.1', '', '{\"concurrent\":0,\"jobGroup\":\"default\",\"params\":{},\"jobId\":103,\"misfirePolicy\":0,\"status\":0}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-12 09:21:56');
INSERT INTO `sys_operation_log` VALUES ('421', '定时任务', '2', 'com.twelvet.server.job.controller.SysJobController.edit()', 'PUT', '1', 'admin', null, '/cron', '127.0.0.1', '', '{\"jobName\":\"测试任务\",\"concurrent\":0,\"jobGroup\":\"default\",\"params\":{},\"cronExpression\":\"0 */15 * * * ?\",\"jobId\":103,\"nextValidTime\":1605150900000,\"updateBy\":\"admin\",\"invokeTarget\":\"twtTask.twtParams(\'twt\')\\t\",\"misfirePolicy\":3,\"status\":0}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-12 11:12:44');
INSERT INTO `sys_operation_log` VALUES ('422', '定时任务', '2', 'com.twelvet.server.job.controller.SysJobController.edit()', 'PUT', '1', 'admin', null, '/cron', '127.0.0.1', '', '{\"jobName\":\"测试任务\",\"concurrent\":0,\"jobGroup\":\"default\",\"params\":{},\"cronExpression\":\"0 */15 * * * ?\",\"jobId\":103,\"nextValidTime\":1605150900000,\"updateBy\":\"admin\",\"invokeTarget\":\"twtTask.twtParams(\'twt\')\\t\",\"misfirePolicy\":3,\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-12 11:12:50');
INSERT INTO `sys_operation_log` VALUES ('423', '菜单管理', '2', 'com.twelvet.server.system.controller.SysMenuController.update()', 'PUT', '1', 'admin', null, '/menu', '127.0.0.1', '', '{\"visible\":true,\"icon\":\"icon-system\",\"orderNum\":\"1\",\"menuName\":\"系统管理\",\"params\":{},\"parentId\":0,\"path\":\"/system\",\"children\":[],\"updateBy\":\"admin\",\"isFrame\":false,\"menuId\":1,\"menuType\":\"M\",\"status\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-12 17:16:27');
INSERT INTO `sys_operation_log` VALUES ('424', '菜单管理', '2', 'com.twelvet.server.system.controller.SysMenuController.update()', 'PUT', '1', 'admin', null, '/menu', '127.0.0.1', '', '{\"visible\":true,\"icon\":\"icon-system\",\"orderNum\":\"1\",\"menuName\":\"系统管理\",\"params\":{},\"parentId\":0,\"path\":\"system\",\"routes\":[],\"updateBy\":\"admin\",\"isFrame\":false,\"menuId\":1,\"menuType\":\"M\",\"status\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-12 21:36:41');
INSERT INTO `sys_operation_log` VALUES ('425', '菜单管理', '2', 'com.twelvet.server.system.controller.SysMenuController.update()', 'PUT', '1', 'admin', null, '/menu', '127.0.0.1', '', '{\"visible\":true,\"icon\":\"icon-system\",\"orderNum\":\"1\",\"menuName\":\"系统管理\",\"params\":{},\"parentId\":0,\"path\":\"systemManagement\",\"routes\":[],\"updateBy\":\"admin\",\"isFrame\":false,\"menuId\":1,\"menuType\":\"M\",\"status\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-13 23:49:52');
INSERT INTO `sys_operation_log` VALUES ('426', '菜单管理', '2', 'com.twelvet.server.system.controller.SysMenuController.update()', 'PUT', '1', 'admin', null, '/menu', '127.0.0.1', '', '{\"visible\":true,\"icon\":\"icon-menu\",\"orderNum\":\"3\",\"menuName\":\"菜单管理\",\"params\":{},\"parentId\":1,\"path\":\"menu\",\"routes\":[],\"component\":\"system/menu/index\",\"updateBy\":\"admin\",\"isFrame\":false,\"menuId\":102,\"menuType\":\"C\",\"perms\":\"system:menu:list\",\"status\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 00:04:22');
INSERT INTO `sys_operation_log` VALUES ('427', '菜单管理', '2', 'com.twelvet.server.system.controller.SysMenuController.update()', 'PUT', '1', 'admin', null, '/menu', '127.0.0.1', '', '{\"visible\":true,\"icon\":\"icon-system\",\"orderNum\":\"1\",\"menuName\":\"系统管理\",\"params\":{},\"parentId\":0,\"path\":\"/system\",\"routes\":[],\"updateBy\":\"admin\",\"isFrame\":false,\"menuId\":1,\"menuType\":\"M\",\"status\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 00:16:18');
INSERT INTO `sys_operation_log` VALUES ('428', '菜单管理', '3', 'com.twelvet.server.system.controller.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/menu/108', '127.0.0.1', '', '{menuId=108}', '{\"code\":500,\"msg\":\"存在子菜单,不允许删除\"}', '1', null, '2020-11-14 00:20:09');
INSERT INTO `sys_operation_log` VALUES ('429', '菜单管理', '3', 'com.twelvet.server.system.controller.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/menu/500', '127.0.0.1', '', '{menuId=500}', '{\"code\":500,\"msg\":\"存在子菜单,不允许删除\"}', '1', null, '2020-11-14 00:20:26');
INSERT INTO `sys_operation_log` VALUES ('430', '菜单管理', '2', 'com.twelvet.server.system.controller.SysMenuController.update()', 'PUT', '1', 'admin', null, '/menu', '127.0.0.1', '', '{\"visible\":true,\"icon\":\"icon-menu\",\"orderNum\":\"3\",\"menuName\":\"systemManagement\",\"params\":{},\"parentId\":1,\"path\":\"menu\",\"routes\":[],\"component\":\"system/menu/index\",\"updateBy\":\"admin\",\"isFrame\":false,\"menuId\":102,\"menuType\":\"C\",\"perms\":\"system:menu:list\",\"status\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 11:11:51');
INSERT INTO `sys_operation_log` VALUES ('431', '菜单管理', '2', 'com.twelvet.server.system.controller.SysMenuController.update()', 'PUT', '1', 'admin', null, '/menu', '127.0.0.1', '', '{\"visible\":true,\"icon\":\"icon-system\",\"orderNum\":\"1\",\"menuName\":\"systemManagement\",\"params\":{},\"parentId\":0,\"path\":\"/system\",\"routes\":[],\"updateBy\":\"admin\",\"isFrame\":false,\"menuId\":1,\"menuType\":\"M\",\"status\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 11:12:05');
INSERT INTO `sys_operation_log` VALUES ('432', '菜单管理', '2', 'com.twelvet.server.system.controller.SysMenuController.update()', 'PUT', '1', 'admin', null, '/menu', '127.0.0.1', '', '{\"visible\":true,\"icon\":\"icon-menu\",\"orderNum\":\"3\",\"menuName\":\"menu\",\"params\":{},\"parentId\":1,\"path\":\"menu\",\"routes\":[],\"component\":\"system/menu/index\",\"updateBy\":\"admin\",\"isFrame\":false,\"menuId\":102,\"menuType\":\"C\",\"perms\":\"system:menu:list\",\"status\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 11:13:37');
INSERT INTO `sys_operation_log` VALUES ('433', '菜单管理', '2', 'com.twelvet.server.system.controller.SysMenuController.update()', 'PUT', '1', 'admin', null, '/menu', '127.0.0.1', '', '{\"visible\":true,\"icon\":\"icon-menu\",\"orderNum\":\"3\",\"menuName\":\"菜单管理\",\"params\":{},\"parentId\":1,\"path\":\"menu\",\"routes\":[],\"component\":\"system/menu/index\",\"updateBy\":\"admin\",\"isFrame\":false,\"menuId\":102,\"menuType\":\"C\",\"perms\":\"system:menu:list\",\"status\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 11:16:11');
INSERT INTO `sys_operation_log` VALUES ('434', '菜单管理', '2', 'com.twelvet.server.system.controller.SysMenuController.update()', 'PUT', '1', 'admin', null, '/menu', '127.0.0.1', '', '{\"visible\":true,\"icon\":\"icon-system\",\"orderNum\":\"1\",\"menuName\":\"系统管理\",\"params\":{},\"parentId\":0,\"path\":\"/system\",\"routes\":[],\"updateBy\":\"admin\",\"isFrame\":false,\"menuId\":1,\"menuType\":\"M\",\"status\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 11:16:21');
INSERT INTO `sys_operation_log` VALUES ('435', '菜单管理', '3', 'com.twelvet.server.system.controller.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/menu/1001', '127.0.0.1', '', '{menuId=1001}', '{\"code\":500,\"msg\":\"菜单已分配角色,不允许删除\"}', '1', null, '2020-11-14 11:17:13');
INSERT INTO `sys_operation_log` VALUES ('436', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"deptIds\":[105],\"menuIds\":[],\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 11:18:03');
INSERT INTO `sys_operation_log` VALUES ('437', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"dataScope\":\"5\",\"params\":{},\"roleSort\":\"3\",\"updateBy\":\"admin\",\"roleKey\":\"demo\",\"roleName\":\"测试角色\",\"deptIds\":[103,104,105,106,107],\"menuIds\":[],\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 11:18:20');
INSERT INTO `sys_operation_log` VALUES ('438', '菜单管理', '3', 'com.twelvet.server.system.controller.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/menu/1001', '127.0.0.1', '', '{menuId=1001}', '{\"code\":500,\"msg\":\"菜单已分配角色,不允许删除\"}', '1', null, '2020-11-14 11:18:35');
INSERT INTO `sys_operation_log` VALUES ('439', '用户管理', '3', 'com.twelvet.server.system.controller.SysUserController.remove()', 'DELETE', '1', 'admin', null, '/user/3', '127.0.0.1', '', '{userIds=3}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 11:19:36');
INSERT INTO `sys_operation_log` VALUES ('440', '用户管理', '3', 'com.twelvet.server.system.controller.SysUserController.remove()', 'DELETE', '1', 'admin', null, '/user/2', '127.0.0.1', '', '{userIds=2}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 11:19:42');
INSERT INTO `sys_operation_log` VALUES ('441', '菜单管理', '3', 'com.twelvet.server.system.controller.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/menu/1001', '127.0.0.1', '', '{menuId=1001}', '{\"code\":500,\"msg\":\"菜单已分配角色,不允许删除\"}', '1', null, '2020-11-14 11:19:57');
INSERT INTO `sys_operation_log` VALUES ('442', '角色管理', '3', 'com.twelvet.server.system.controller.SysRoleController.remove()', 'DELETE', '1', 'admin', null, '/role/4', '127.0.0.1', '', '{roleIds=4}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 11:21:59');
INSERT INTO `sys_operation_log` VALUES ('443', '角色管理', '3', 'com.twelvet.server.system.controller.SysRoleController.remove()', 'DELETE', '1', 'admin', null, '/role/2', '127.0.0.1', '', '{roleIds=2}', 'null', '0', '普通角色已分配,不能删除', '2020-11-14 11:22:01');
INSERT INTO `sys_operation_log` VALUES ('444', '菜单管理', '3', 'com.twelvet.server.system.controller.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/menu/1001', '127.0.0.1', '', '{menuId=1001}', '{\"code\":500,\"msg\":\"菜单已分配角色,不允许删除\"}', '1', null, '2020-11-14 11:24:00');
INSERT INTO `sys_operation_log` VALUES ('445', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"5\",\"params\":{},\"roleSort\":\"2\",\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"deptIds\":[],\"menuIds\":[],\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 11:25:06');
INSERT INTO `sys_operation_log` VALUES ('446', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":1,\"admin\":true,\"remark\":\"管理员\",\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"deptIds\":[],\"menuIds\":[1,100,101,102,103,104,105,106,107,108,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,500,501,1040,1041,1042,1043,1044,1045,2,109,110,111,112,1046,1047,1048,1049,1050,1051,1052,1053,1054,3,113,114,115,1055,1056,1058,1057,1059,1060,4],\"status\":1}', 'null', '0', '不允许操作超级管理员角色', '2020-11-14 11:25:33');
INSERT INTO `sys_operation_log` VALUES ('447', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"5\",\"params\":{},\"roleSort\":\"2\",\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"deptIds\":[],\"menuIds\":[1,100,101,102,103,104,105,106,107,108,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,500,501,1040,1041,1042,1043,1044,1045,2,109,110,111,112,1046,1047,1048,1049,1050,1051,1052,1053,1054,3,113,114,115,1055,1056,1058,1057,1059,1060,4],\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 11:25:40');
INSERT INTO `sys_operation_log` VALUES ('448', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"5\",\"params\":{},\"roleSort\":\"2\",\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"deptIds\":[],\"menuIds\":[],\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 11:25:57');
INSERT INTO `sys_operation_log` VALUES ('449', '菜单管理', '3', 'com.twelvet.server.system.controller.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/menu/1001', '127.0.0.1', '', '{menuId=1001}', '{\"code\":500,\"msg\":\"菜单已分配角色,不允许删除\"}', '1', null, '2020-11-14 11:27:39');
INSERT INTO `sys_operation_log` VALUES ('450', '菜单管理', '3', 'com.twelvet.server.system.controller.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/menu/1001', '127.0.0.1', '', '{menuId=1001}', '{\"code\":500,\"msg\":\"菜单已分配角色,不允许删除\"}', '1', null, '2020-11-14 11:27:47');
INSERT INTO `sys_operation_log` VALUES ('451', '菜单管理', '3', 'com.twelvet.server.system.controller.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/menu/1001', '127.0.0.1', '', '{menuId=1001}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 11:28:07');
INSERT INTO `sys_operation_log` VALUES ('452', '菜单管理', '3', 'com.twelvet.server.system.controller.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/menu/1002', '127.0.0.1', '', '{menuId=1002}', '{\"code\":500,\"msg\":\"菜单已分配角色,不允许删除\"}', '1', null, '2020-11-14 11:28:11');
INSERT INTO `sys_operation_log` VALUES ('453', '菜单管理', '3', 'com.twelvet.server.system.controller.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/menu/1002', '127.0.0.1', '', '{menuId=1002}', '{\"code\":500,\"msg\":\"菜单已分配角色,不允许删除\"}', '1', null, '2020-11-14 11:28:15');
INSERT INTO `sys_operation_log` VALUES ('454', '菜单管理', '3', 'com.twelvet.server.system.controller.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/menu/1002', '127.0.0.1', '', '{menuId=1002}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 11:28:42');
INSERT INTO `sys_operation_log` VALUES ('455', '角色管理', '3', 'com.twelvet.server.system.controller.SysRoleController.remove()', 'DELETE', '1', 'admin', null, '/role/2', '127.0.0.1', '', '{roleIds=2}', 'null', '0', '普通角色已分配,不能删除', '2020-11-14 11:29:56');
INSERT INTO `sys_operation_log` VALUES ('456', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":1,\"admin\":true,\"remark\":\"管理员\",\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"deptIds\":[],\"menuIds\":[],\"status\":1}', 'null', '0', '不允许操作超级管理员角色', '2020-11-14 11:30:01');
INSERT INTO `sys_operation_log` VALUES ('457', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":1,\"admin\":true,\"remark\":\"管理员\",\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"deptIds\":[],\"menuIds\":[],\"status\":1}', 'null', '0', '不允许操作超级管理员角色', '2020-11-14 11:32:30');
INSERT INTO `sys_operation_log` VALUES ('458', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":1,\"admin\":true,\"remark\":\"管理员\",\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"deptIds\":[],\"menuIds\":[],\"status\":1}', 'null', '0', '不允许操作超级管理员角色', '2020-11-14 11:32:47');
INSERT INTO `sys_operation_log` VALUES ('459', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":1,\"admin\":true,\"remark\":\"管理员\",\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"deptIds\":[],\"menuIds\":[],\"status\":1}', 'null', '0', '不允许操作超级管理员角色', '2020-11-14 11:32:49');
INSERT INTO `sys_operation_log` VALUES ('460', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":1,\"admin\":true,\"remark\":\"管理员\",\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"updateBy\":\"admin\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"deptIds\":[],\"menuIds\":[],\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 11:34:33');
INSERT INTO `sys_operation_log` VALUES ('461', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":1,\"admin\":true,\"remark\":\"管理员\",\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"updateBy\":\"admin\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"deptIds\":[],\"menuIds\":[1,100,101,102,103,104,105,106,107,108,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,500,501,1040,1041,1042,1043,1044,1045,2,109,110,111,112,1046,1047,1048,1049,1050,1051,1052,1053,1054,3,113,114,115,1055,1056,1058,1057,1059,1060,4],\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 11:35:33');
INSERT INTO `sys_operation_log` VALUES ('462', '菜单管理', '3', 'com.twelvet.server.system.controller.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/menu/1003', '127.0.0.1', '', '{menuId=1003}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 11:35:44');
INSERT INTO `sys_operation_log` VALUES ('463', '菜单管理', '3', 'com.twelvet.server.system.controller.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/menu/1004', '127.0.0.1', '', '{menuId=1004}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 11:35:47');
INSERT INTO `sys_operation_log` VALUES ('464', '菜单管理', '3', 'com.twelvet.server.system.controller.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/menu/1005', '127.0.0.1', '', '{menuId=1005}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 11:35:50');
INSERT INTO `sys_operation_log` VALUES ('465', '菜单管理', '3', 'com.twelvet.server.system.controller.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/menu/1006', '127.0.0.1', '', '{menuId=1006}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 11:35:53');
INSERT INTO `sys_operation_log` VALUES ('466', '菜单管理', '3', 'com.twelvet.server.system.controller.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/menu/1007', '127.0.0.1', '', '{menuId=1007}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 11:35:55');
INSERT INTO `sys_operation_log` VALUES ('467', '菜单管理', '3', 'com.twelvet.server.system.controller.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/menu/100', '127.0.0.1', '', '{menuId=100}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 11:35:59');
INSERT INTO `sys_operation_log` VALUES ('468', '菜单管理', '3', 'com.twelvet.server.system.controller.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/menu/111', '127.0.0.1', '', '{menuId=111}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 11:38:07');
INSERT INTO `sys_operation_log` VALUES ('469', '菜单管理', '3', 'com.twelvet.server.system.controller.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/menu/112', '127.0.0.1', '', '{menuId=112}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 11:38:12');
INSERT INTO `sys_operation_log` VALUES ('470', '菜单管理', '2', 'com.twelvet.server.system.controller.SysMenuController.update()', 'PUT', '1', 'admin', null, '/menu', '127.0.0.1', '', '{\"visible\":true,\"icon\":\"icon-human-resources\",\"orderNum\":\"2\",\"menuName\":\"人力管理\",\"params\":{},\"parentId\":0,\"path\":\"/human\",\"routes\":[],\"updateBy\":\"admin\",\"isFrame\":false,\"menuId\":2,\"menuType\":\"M\",\"status\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 11:38:41');
INSERT INTO `sys_operation_log` VALUES ('471', '菜单管理', '2', 'com.twelvet.server.system.controller.SysMenuController.update()', 'PUT', '1', 'admin', null, '/menu', '127.0.0.1', '', '{\"visible\":true,\"icon\":\"icon-role\",\"orderNum\":\"2\",\"menuName\":\"角色管理\",\"params\":{},\"parentId\":2,\"path\":\"/human/role\",\"routes\":[],\"component\":\"./human/role\",\"updateBy\":\"admin\",\"isFrame\":false,\"menuId\":101,\"menuType\":\"C\",\"perms\":\"system:role:list\",\"status\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 11:39:15');
INSERT INTO `sys_operation_log` VALUES ('472', '菜单管理', '2', 'com.twelvet.server.system.controller.SysMenuController.update()', 'PUT', '1', 'admin', null, '/menu', '127.0.0.1', '', '{\"visible\":true,\"icon\":\"icon-dept\",\"orderNum\":\"4\",\"menuName\":\"部门管理\",\"params\":{},\"parentId\":2,\"path\":\"/human/dept\",\"routes\":[],\"component\":\"./human/dept\",\"updateBy\":\"admin\",\"isFrame\":false,\"menuId\":103,\"menuType\":\"C\",\"perms\":\"system:dept:list\",\"status\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 11:39:40');
INSERT INTO `sys_operation_log` VALUES ('473', '菜单管理', '2', 'com.twelvet.server.system.controller.SysMenuController.update()', 'PUT', '1', 'admin', null, '/menu', '127.0.0.1', '', '{\"visible\":true,\"icon\":\"icon-post\",\"orderNum\":\"5\",\"menuName\":\"岗位管理\",\"params\":{},\"parentId\":2,\"path\":\"/human/post\",\"routes\":[],\"component\":\"./human/post\",\"updateBy\":\"admin\",\"isFrame\":false,\"menuId\":104,\"menuType\":\"C\",\"perms\":\"system:post:list\",\"status\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 11:40:02');
INSERT INTO `sys_operation_log` VALUES ('474', '菜单管理', '2', 'com.twelvet.server.system.controller.SysMenuController.update()', 'PUT', '1', 'admin', null, '/menu', '127.0.0.1', '', '{\"visible\":false,\"icon\":\"icon-team\",\"orderNum\":\"1\",\"menuName\":\"职员管理\",\"params\":{},\"parentId\":2,\"path\":\"/human/staff\",\"routes\":[],\"component\":\"./human/staff\",\"updateBy\":\"admin\",\"isFrame\":true,\"menuId\":100,\"menuType\":\"C\",\"perms\":\"system:user:list\",\"status\":false}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 11:42:57');
INSERT INTO `sys_operation_log` VALUES ('475', '菜单管理', '2', 'com.twelvet.server.system.controller.SysMenuController.update()', 'PUT', '1', 'admin', null, '/menu', '127.0.0.1', '', '{\"visible\":false,\"icon\":\"icon-team\",\"orderNum\":\"1\",\"menuName\":\"职员管理\",\"params\":{},\"parentId\":2,\"path\":\"/human/staff\",\"routes\":[],\"component\":\"./human/staff\",\"updateBy\":\"admin\",\"isFrame\":true,\"menuId\":100,\"menuType\":\"C\",\"perms\":\"system:user:list\",\"status\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 11:47:39');
INSERT INTO `sys_operation_log` VALUES ('476', '菜单管理', '2', 'com.twelvet.server.system.controller.SysMenuController.update()', 'PUT', '1', 'admin', null, '/menu', '127.0.0.1', '', '{\"visible\":true,\"icon\":\"icon-system\",\"orderNum\":\"9\",\"menuName\":\"日志管理\",\"params\":{},\"parentId\":0,\"path\":\"log\",\"routes\":[],\"updateBy\":\"admin\",\"isFrame\":false,\"menuId\":4,\"menuType\":\"M\",\"status\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 12:01:42');
INSERT INTO `sys_operation_log` VALUES ('477', '菜单管理', '2', 'com.twelvet.server.system.controller.SysMenuController.update()', 'PUT', '1', 'admin', null, '/menu', '127.0.0.1', '', '{\"visible\":true,\"icon\":\"icon-system\",\"orderNum\":\"4\",\"menuName\":\"日志管理\",\"params\":{},\"parentId\":0,\"path\":\"log\",\"routes\":[],\"updateBy\":\"admin\",\"isFrame\":false,\"menuId\":4,\"menuType\":\"M\",\"status\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 12:02:02');
INSERT INTO `sys_operation_log` VALUES ('478', '菜单管理', '2', 'com.twelvet.server.system.controller.SysMenuController.update()', 'PUT', '1', 'admin', null, '/menu', '127.0.0.1', '', '{\"visible\":true,\"icon\":\"icon-system\",\"orderNum\":\"5\",\"menuName\":\"TwelveT\",\"params\":{},\"parentId\":0,\"path\":\"https://www.twelvet.com\",\"routes\":[],\"updateBy\":\"admin\",\"isFrame\":true,\"menuId\":5,\"menuType\":\"M\",\"status\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 12:02:11');
INSERT INTO `sys_operation_log` VALUES ('479', '菜单管理', '2', 'com.twelvet.server.system.controller.SysMenuController.update()', 'PUT', '1', 'admin', null, '/menu', '127.0.0.1', '', '{\"visible\":true,\"icon\":\"icon-log\",\"orderNum\":\"4\",\"menuName\":\"日志管理\",\"params\":{},\"parentId\":0,\"path\":\"/log\",\"routes\":[],\"updateBy\":\"admin\",\"isFrame\":false,\"menuId\":4,\"menuType\":\"M\",\"status\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 12:02:55');
INSERT INTO `sys_operation_log` VALUES ('480', '菜单管理', '2', 'com.twelvet.server.system.controller.SysMenuController.update()', 'PUT', '1', 'admin', null, '/menu', '127.0.0.1', '', '{\"visible\":true,\"icon\":\"icon-log-operation\",\"orderNum\":\"1\",\"menuName\":\"操作日志\",\"params\":{},\"parentId\":4,\"path\":\"/log/operation\",\"routes\":[],\"component\":\"./log/operation\",\"updateBy\":\"admin\",\"isFrame\":false,\"menuId\":500,\"menuType\":\"C\",\"perms\":\"monitor:operlog:list\",\"status\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 12:03:17');
INSERT INTO `sys_operation_log` VALUES ('481', '菜单管理', '2', 'com.twelvet.server.system.controller.SysMenuController.update()', 'PUT', '1', 'admin', null, '/menu', '127.0.0.1', '', '{\"visible\":true,\"icon\":\"icon-log-login\",\"orderNum\":\"2\",\"menuName\":\"登录日志\",\"params\":{},\"parentId\":4,\"path\":\"/log/login\",\"routes\":[],\"component\":\"./log/login\",\"updateBy\":\"admin\",\"isFrame\":false,\"menuId\":501,\"menuType\":\"C\",\"perms\":\"monitor:logininfor:list\",\"status\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 12:03:41');
INSERT INTO `sys_operation_log` VALUES ('482', '菜单管理', '2', 'com.twelvet.server.system.controller.SysMenuController.update()', 'PUT', '1', 'admin', null, '/menu', '127.0.0.1', '', '{\"visible\":true,\"icon\":\"icon-system\",\"orderNum\":\"4\",\"menuName\":\"系统工具\",\"params\":{},\"parentId\":0,\"path\":\"tool\",\"routes\":[],\"updateBy\":\"admin\",\"isFrame\":false,\"menuId\":3,\"menuType\":\"M\",\"status\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 12:05:51');
INSERT INTO `sys_operation_log` VALUES ('483', '菜单管理', '2', 'com.twelvet.server.system.controller.SysMenuController.update()', 'PUT', '1', 'admin', null, '/menu', '127.0.0.1', '', '{\"visible\":true,\"icon\":\"icon-log\",\"orderNum\":\"3\",\"menuName\":\"日志管理\",\"params\":{},\"parentId\":0,\"path\":\"/log\",\"routes\":[],\"updateBy\":\"admin\",\"isFrame\":false,\"menuId\":4,\"menuType\":\"M\",\"status\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 12:05:59');
INSERT INTO `sys_operation_log` VALUES ('484', '菜单管理', '1', 'com.twelvet.server.system.controller.SysMenuController.insert()', 'POST', '1', 'admin', null, '/menu', '127.0.0.1', '', '{\"visible\":true,\"icon\":\"icon-log-job\",\"orderNum\":\"3\",\"menuName\":\"定时任务日志\",\"params\":{},\"parentId\":4,\"path\":\"/log/job\",\"routes\":[],\"component\":\"./log/job\",\"createBy\":\"admin\",\"isFrame\":false,\"menuId\":0,\"menuType\":\"C\",\"perms\":\"s\",\"status\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 12:10:35');
INSERT INTO `sys_operation_log` VALUES ('485', '菜单管理', '2', 'com.twelvet.server.system.controller.SysMenuController.update()', 'PUT', '1', 'admin', null, '/menu', '127.0.0.1', '', '{\"visible\":false,\"icon\":\"job\",\"orderNum\":\"1\",\"menuName\":\"定时任务\",\"params\":{},\"parentId\":1,\"path\":\"job\",\"routes\":[],\"component\":\"monitor/job/index\",\"updateBy\":\"admin\",\"isFrame\":true,\"menuId\":110,\"menuType\":\"C\",\"perms\":\"monitor:job:list\",\"status\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 12:13:59');
INSERT INTO `sys_operation_log` VALUES ('486', '菜单管理', '2', 'com.twelvet.server.system.controller.SysMenuController.update()', 'PUT', '1', 'admin', null, '/menu', '127.0.0.1', '', '{\"visible\":false,\"icon\":\"icon-job\",\"orderNum\":\"1\",\"menuName\":\"定时任务\",\"params\":{},\"parentId\":1,\"path\":\"/system/job\",\"routes\":[],\"component\":\"./system/job\",\"updateBy\":\"admin\",\"isFrame\":true,\"menuId\":110,\"menuType\":\"C\",\"perms\":\"monitor:job:list\",\"status\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 12:14:30');
INSERT INTO `sys_operation_log` VALUES ('487', '菜单管理', '2', 'com.twelvet.server.system.controller.SysMenuController.update()', 'PUT', '1', 'admin', null, '/menu', '127.0.0.1', '', '{\"visible\":false,\"icon\":\"icon-job\",\"orderNum\":\"2\",\"menuName\":\"定时任务\",\"params\":{},\"parentId\":1,\"path\":\"/system/job\",\"routes\":[],\"component\":\"./system/job\",\"updateBy\":\"admin\",\"isFrame\":true,\"menuId\":110,\"menuType\":\"C\",\"perms\":\"monitor:job:list\",\"status\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 16:18:27');
INSERT INTO `sys_operation_log` VALUES ('488', '菜单管理', '2', 'com.twelvet.server.system.controller.SysMenuController.update()', 'PUT', '1', 'admin', null, '/menu', '127.0.0.1', '', '{\"visible\":true,\"icon\":\"icon-menu\",\"orderNum\":\"1\",\"menuName\":\"菜单管理\",\"params\":{},\"parentId\":1,\"path\":\"menu\",\"routes\":[],\"component\":\"system/menu/index\",\"updateBy\":\"admin\",\"isFrame\":false,\"menuId\":102,\"menuType\":\"C\",\"perms\":\"system:menu:list\",\"status\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 16:18:36');
INSERT INTO `sys_operation_log` VALUES ('489', '菜单管理', '2', 'com.twelvet.server.system.controller.SysMenuController.update()', 'PUT', '1', 'admin', null, '/menu', '127.0.0.1', '', '{\"visible\":true,\"icon\":\"icon-log-job\",\"orderNum\":\"3\",\"menuName\":\"定时任务日志\",\"params\":{},\"parentId\":4,\"path\":\"/log/job\",\"routes\":[],\"component\":\"./log/job\",\"updateBy\":\"admin\",\"isFrame\":true,\"menuId\":1061,\"menuType\":\"C\",\"perms\":\"system:operlog\",\"status\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 16:24:38');
INSERT INTO `sys_operation_log` VALUES ('490', '菜单管理', '2', 'com.twelvet.server.system.controller.SysMenuController.update()', 'PUT', '1', 'admin', null, '/menu', '127.0.0.1', '', '{\"visible\":true,\"icon\":\"icon-tool-box\",\"orderNum\":\"4\",\"menuName\":\"工具箱\",\"params\":{},\"parentId\":0,\"path\":\"/tool\",\"routes\":[],\"updateBy\":\"admin\",\"isFrame\":false,\"menuId\":3,\"menuType\":\"M\",\"status\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 16:25:19');
INSERT INTO `sys_operation_log` VALUES ('491', '菜单管理', '1', 'com.twelvet.server.system.controller.SysMenuController.insert()', 'POST', '1', 'admin', null, '/menu', '127.0.0.1', '', '{\"visible\":true,\"icon\":\"icon-graphical-edit\",\"orderNum\":\"1\",\"menuName\":\"图形化编辑器\",\"params\":{},\"parentId\":3,\"path\":\"/tool/graphicalEditor\",\"routes\":[],\"createBy\":\"admin\",\"isFrame\":false,\"menuId\":0,\"menuType\":\"M\",\"status\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 16:25:44');
INSERT INTO `sys_operation_log` VALUES ('492', '菜单管理', '2', 'com.twelvet.server.system.controller.SysMenuController.update()', 'PUT', '1', 'admin', null, '/menu', '127.0.0.1', '', '{\"visible\":true,\"icon\":\"icon-flow-edit\",\"orderNum\":\"1\",\"menuName\":\"流程编辑器\",\"params\":{},\"parentId\":3,\"path\":\"/tool/graphicalEditor/flow\",\"routes\":[],\"component\":\"./tool/graphicalEditor/flow\",\"updateBy\":\"admin\",\"isFrame\":false,\"menuId\":113,\"menuType\":\"C\",\"perms\":\"tool:build:list\",\"status\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 16:26:30');
INSERT INTO `sys_operation_log` VALUES ('493', '菜单管理', '2', 'com.twelvet.server.system.controller.SysMenuController.update()', 'PUT', '1', 'admin', null, '/menu', '127.0.0.1', '', '{\"visible\":true,\"icon\":\"icon-mind-edit\",\"orderNum\":\"3\",\"menuName\":\"脑图编辑器\",\"params\":{},\"parentId\":3,\"path\":\"/tool/graphicalEditor/mind\",\"routes\":[],\"component\":\"./tool/graphicalEditor/mind\",\"updateBy\":\"admin\",\"isFrame\":false,\"menuId\":115,\"menuType\":\"C\",\"perms\":\"tool:swagger:list\",\"status\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 16:26:57');
INSERT INTO `sys_operation_log` VALUES ('494', '菜单管理', '3', 'com.twelvet.server.system.controller.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/menu/1055', '127.0.0.1', '', '{menuId=1055}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 16:27:09');
INSERT INTO `sys_operation_log` VALUES ('495', '菜单管理', '3', 'com.twelvet.server.system.controller.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/menu/1056', '127.0.0.1', '', '{menuId=1056}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 16:27:11');
INSERT INTO `sys_operation_log` VALUES ('496', '菜单管理', '3', 'com.twelvet.server.system.controller.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/menu/1058', '127.0.0.1', '', '{menuId=1058}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 16:27:13');
INSERT INTO `sys_operation_log` VALUES ('497', '菜单管理', '3', 'com.twelvet.server.system.controller.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/menu/1057', '127.0.0.1', '', '{menuId=1057}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 16:27:15');
INSERT INTO `sys_operation_log` VALUES ('498', '菜单管理', '3', 'com.twelvet.server.system.controller.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/menu/1059', '127.0.0.1', '', '{menuId=1059}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 16:27:17');
INSERT INTO `sys_operation_log` VALUES ('499', '菜单管理', '3', 'com.twelvet.server.system.controller.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/menu/1060', '127.0.0.1', '', '{menuId=1060}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 16:27:22');
INSERT INTO `sys_operation_log` VALUES ('500', '菜单管理', '2', 'com.twelvet.server.system.controller.SysMenuController.update()', 'PUT', '1', 'admin', null, '/menu', '127.0.0.1', '', '{\"visible\":true,\"icon\":\"icon-koni-edit\",\"orderNum\":\"2\",\"menuName\":\"拓扑编辑器\",\"params\":{},\"parentId\":3,\"path\":\"/tool/graphicalEditor/koni\",\"routes\":[],\"component\":\"./tool/graphicalEditor/koni\",\"updateBy\":\"admin\",\"isFrame\":false,\"menuId\":114,\"menuType\":\"C\",\"perms\":\"tool:gen:list\",\"status\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 16:27:43');
INSERT INTO `sys_operation_log` VALUES ('501', '菜单管理', '2', 'com.twelvet.server.system.controller.SysMenuController.update()', 'PUT', '1', 'admin', null, '/menu', '127.0.0.1', '', '{\"visible\":false,\"icon\":\"dict\",\"orderNum\":\"6\",\"menuName\":\"字典管理\",\"params\":{},\"parentId\":1,\"path\":\"dict\",\"routes\":[],\"component\":\"system/dict/index\",\"updateBy\":\"admin\",\"isFrame\":true,\"menuId\":105,\"menuType\":\"C\",\"perms\":\"system:dict:list\",\"status\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 19:35:05');
INSERT INTO `sys_operation_log` VALUES ('502', '菜单管理', '2', 'com.twelvet.server.system.controller.SysMenuController.update()', 'PUT', '1', 'admin', null, '/menu', '127.0.0.1', '', '{\"visible\":false,\"icon\":\"icon-dict\",\"orderNum\":\"3\",\"menuName\":\"字典管理\",\"params\":{},\"parentId\":1,\"path\":\"system/dict\",\"routes\":[],\"component\":\"./system/dict\",\"updateBy\":\"admin\",\"isFrame\":true,\"menuId\":105,\"menuType\":\"C\",\"perms\":\"system:dict:list\",\"status\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 19:35:36');
INSERT INTO `sys_operation_log` VALUES ('503', '菜单管理', '2', 'com.twelvet.server.system.controller.SysMenuController.update()', 'PUT', '1', 'admin', null, '/menu', '127.0.0.1', '', '{\"visible\":true,\"icon\":\"icon-log\",\"orderNum\":\"3\",\"menuName\":\"日志管理\",\"params\":{},\"parentId\":0,\"path\":\"/log\",\"routes\":[],\"updateBy\":\"admin\",\"isFrame\":false,\"menuId\":4,\"menuType\":\"M\",\"status\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 20:48:12');
INSERT INTO `sys_operation_log` VALUES ('504', '菜单管理', '2', 'com.twelvet.server.system.controller.SysMenuController.update()', 'PUT', '1', 'admin', null, '/menu', '127.0.0.1', '', '{\"visible\":false,\"icon\":\"icon-dictionaries\",\"orderNum\":\"3\",\"menuName\":\"字典管理\",\"params\":{},\"parentId\":1,\"path\":\"system/dictionaries\",\"routes\":[],\"component\":\"./system/dictionaries\",\"updateBy\":\"admin\",\"isFrame\":true,\"menuId\":105,\"menuType\":\"C\",\"perms\":\"system:dictionaries:list\",\"status\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 21:46:11');
INSERT INTO `sys_operation_log` VALUES ('505', '菜单管理', '2', 'com.twelvet.server.system.controller.SysMenuController.update()', 'PUT', '1', 'admin', null, '/menu', '127.0.0.1', '', '{\"visible\":false,\"icon\":\"icon-dictionaries\",\"orderNum\":\"3\",\"menuName\":\"字典管理\",\"params\":{},\"parentId\":1,\"path\":\"/system/dictionaries\",\"routes\":[],\"component\":\"./system/dictionaries\",\"updateBy\":\"admin\",\"isFrame\":true,\"menuId\":105,\"menuType\":\"C\",\"perms\":\"system:dictionaries:list\",\"status\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-14 21:46:40');
INSERT INTO `sys_operation_log` VALUES ('506', '字典类型', '1', 'com.twelvet.server.system.controller.SysDictTypeController.add()', 'POST', '1', 'admin', null, '/dictionaries/type', '127.0.0.1', '', '{\"remark\":\"asd\",\"dictId\":0,\"params\":{},\"dictType\":\"sss\",\"dictName\":\"测试\",\"status\":1}', '{\"code\":500,\"msg\":\"新增字典\'测试\'失败，字典类型已存在\"}', '1', null, '2020-11-15 00:16:39');
INSERT INTO `sys_operation_log` VALUES ('507', '字典类型', '1', 'com.twelvet.server.system.controller.SysDictTypeController.add()', 'POST', '1', 'admin', null, '/dictionaries/type', '127.0.0.1', '', '{\"remark\":\"asd\",\"dictId\":0,\"params\":{},\"dictType\":\"sss\",\"createBy\":\"admin\",\"dictName\":\"测试\",\"status\":1}', 'null', '0', 'Redis exception; nested exception is io.lettuce.core.RedisException: java.io.IOException: 远程主机强迫关闭了一个现有的连接。', '2020-11-15 00:16:45');
INSERT INTO `sys_operation_log` VALUES ('508', '字典类型', '1', 'com.twelvet.server.system.controller.SysDictTypeController.add()', 'POST', '1', 'admin', null, '/dictionaries/type', '127.0.0.1', '', '{\"remark\":\"asd\",\"dictId\":0,\"params\":{},\"dictType\":\"asd\",\"createBy\":\"admin\",\"dictName\":\"asd\",\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-15 00:17:04');
INSERT INTO `sys_operation_log` VALUES ('509', '字典类型', '3', 'com.twelvet.server.system.controller.SysDictTypeController.remove()', 'DELETE', '1', 'admin', null, '/dictionaries/type/101', '127.0.0.1', '', '{dictIds=101}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-15 00:17:20');
INSERT INTO `sys_operation_log` VALUES ('510', '字典类型', '3', 'com.twelvet.server.system.controller.SysDictTypeController.remove()', 'DELETE', '1', 'admin', null, '/dictionaries/type/100', '127.0.0.1', '', '{dictIds=100}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-15 00:17:24');
INSERT INTO `sys_operation_log` VALUES ('511', '字典类型', '2', 'com.twelvet.server.system.controller.SysDictTypeController.edit()', 'PUT', '1', 'admin', null, '/dictionaries/type', '127.0.0.1', '', '{\"remark\":\"用户性别列表\",\"dictId\":1,\"params\":{},\"dictType\":\"sys_user_sex\",\"updateBy\":\"admin\",\"dictName\":\"用户性别sdf\",\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-15 00:18:24');
INSERT INTO `sys_operation_log` VALUES ('512', '字典类型', '2', 'com.twelvet.server.system.controller.SysDictTypeController.edit()', 'PUT', '1', 'admin', null, '/dictionaries/type', '127.0.0.1', '', '{\"remark\":\"用户性别列表\",\"dictId\":1,\"params\":{},\"dictType\":\"sys_user_sex\",\"updateBy\":\"admin\",\"dictName\":\"用户性别\",\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-15 00:18:32');
INSERT INTO `sys_operation_log` VALUES ('513', '字典类型', '5', 'com.twelvet.server.system.controller.SysDictTypeController.export()', 'POST', '1', 'admin', null, '/dictionaries/type/exportExcel', '127.0.0.1', '', '{\"params\":{}}', 'null', '1', null, '2020-11-15 00:22:41');
INSERT INTO `sys_operation_log` VALUES ('514', '字典类型', '2', 'com.twelvet.server.system.controller.SysDictTypeController.edit()', 'PUT', '1', 'admin', null, '/dictionaries/type', '127.0.0.1', '', '{\"remark\":\"用户性别列表\",\"dictId\":1,\"params\":{},\"dictType\":\"sys_user_sex\",\"updateBy\":\"admin\",\"dictName\":\"用户性别\",\"status\":0}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-15 11:52:13');
INSERT INTO `sys_operation_log` VALUES ('515', '字典类型', '2', 'com.twelvet.server.system.controller.SysDictTypeController.edit()', 'PUT', '1', 'admin', null, '/dictionaries/type', '127.0.0.1', '', '{\"remark\":\"用户性别列表\",\"dictId\":1,\"params\":{},\"dictType\":\"sys_user_sex\",\"updateBy\":\"admin\",\"dictName\":\"用户性别\",\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-15 11:52:18');
INSERT INTO `sys_operation_log` VALUES ('516', '字典数据', '5', 'com.twelvet.server.system.controller.SysDictDataController.export()', 'POST', '1', 'admin', null, '/dictionaries/data/exportExcel', '127.0.0.1', '', '{\"params\":{},\"default\":false}', 'null', '1', null, '2020-11-15 18:14:02');
INSERT INTO `sys_operation_log` VALUES ('517', '字典数据', '2', 'com.twelvet.server.system.controller.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/dictionaries/data', '127.0.0.1', '', '{\"dictValue\":\"0\",\"dictSort\":1,\"remark\":\"性别男asd\",\"params\":{},\"dictType\":\"sys_user_sex\",\"default\":false,\"dictCode\":1,\"updateBy\":\"admin\",\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-16 14:46:54');
INSERT INTO `sys_operation_log` VALUES ('518', '字典数据', '2', 'com.twelvet.server.system.controller.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/dictionaries/data', '127.0.0.1', '', '{\"dictValue\":\"0\",\"dictSort\":1,\"remark\":\"性别男\",\"params\":{},\"dictType\":\"sys_user_sex\",\"default\":false,\"dictCode\":1,\"updateBy\":\"admin\",\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-16 14:46:58');
INSERT INTO `sys_operation_log` VALUES ('519', '字典数据', '2', 'com.twelvet.server.system.controller.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/dictionaries/data', '127.0.0.1', '', '{\"dictValue\":\"1\",\"dictSort\":1,\"params\":{},\"dictType\":\"sys_user_sex\",\"default\":false,\"updateBy\":\"admin\",\"status\":1}', '{\"code\":500,\"msg\":\"操作失败\"}', '1', null, '2020-11-16 18:03:01');
INSERT INTO `sys_operation_log` VALUES ('520', '字典数据', '2', 'com.twelvet.server.system.controller.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/dictionaries/data', '127.0.0.1', '', '{\"dictValue\":\"5\",\"dictSort\":4,\"params\":{},\"dictType\":\"sys_user_sex\",\"default\":false,\"updateBy\":\"admin\",\"status\":1}', '{\"code\":500,\"msg\":\"操作失败\"}', '1', null, '2020-11-16 18:03:10');
INSERT INTO `sys_operation_log` VALUES ('521', '字典数据', '2', 'com.twelvet.server.system.controller.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/dictionaries/data', '127.0.0.1', '', '{\"dictValue\":\"5\",\"dictSort\":4,\"params\":{},\"dictType\":\"sys_user_sex\",\"default\":false,\"updateBy\":\"admin\",\"status\":1}', '{\"code\":500,\"msg\":\"操作失败\"}', '1', null, '2020-11-16 18:03:16');
INSERT INTO `sys_operation_log` VALUES ('522', '字典数据', '2', 'com.twelvet.server.system.controller.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/dictionaries/data', '127.0.0.1', '', '{\"dictValue\":\"5\",\"dictSort\":5,\"remark\":\"asd\",\"params\":{},\"dictType\":\"sys_user_sex\",\"default\":false,\"updateBy\":\"admin\",\"status\":1}', '{\"code\":500,\"msg\":\"操作失败\"}', '1', null, '2020-11-16 18:05:12');
INSERT INTO `sys_operation_log` VALUES ('523', '字典数据', '2', 'com.twelvet.server.system.controller.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/dictionaries/data', '127.0.0.1', '', '{\"dictValue\":\"5\",\"dictSort\":5,\"remark\":\"asd\",\"params\":{},\"dictType\":\"sys_user_sex\",\"default\":false,\"updateBy\":\"admin\",\"status\":1}', '{\"code\":500,\"msg\":\"操作失败\"}', '1', null, '2020-11-16 18:07:42');
INSERT INTO `sys_operation_log` VALUES ('524', '字典数据', '2', 'com.twelvet.server.system.controller.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/dictionaries/data', '127.0.0.1', '', '{\"dictValue\":\"5\",\"dictSort\":5,\"remark\":\"asd\",\"params\":{},\"dictType\":\"sys_user_sex\",\"default\":false,\"updateBy\":\"admin\",\"status\":1}', '{\"code\":500,\"msg\":\"操作失败\"}', '1', null, '2020-11-16 18:07:51');
INSERT INTO `sys_operation_log` VALUES ('525', '字典数据', '2', 'com.twelvet.server.system.controller.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/dictionaries/data', '127.0.0.1', '', '{\"dictValue\":\"5\",\"dictSort\":5,\"remark\":\"asd\",\"params\":{},\"dictType\":\"sys_user_sex\",\"default\":false,\"updateBy\":\"admin\",\"status\":1}', '{\"code\":500,\"msg\":\"操作失败\"}', '1', null, '2020-11-16 18:07:56');
INSERT INTO `sys_operation_log` VALUES ('526', '字典数据', '2', 'com.twelvet.server.system.controller.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/dictionaries/data', '127.0.0.1', '', '{\"dictValue\":\"5\",\"dictSort\":5,\"remark\":\"asd\",\"params\":{},\"dictType\":\"sys_user_sex\",\"default\":false,\"updateBy\":\"admin\",\"status\":1}', '{\"code\":500,\"msg\":\"操作失败\"}', '1', null, '2020-11-16 18:09:14');
INSERT INTO `sys_operation_log` VALUES ('527', '字典数据', '2', 'com.twelvet.server.system.controller.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/dictionaries/data', '127.0.0.1', '', '{\"dictValue\":\"5\",\"dictSort\":5,\"remark\":\"asd\",\"params\":{},\"dictType\":\"sys_user_sex\",\"default\":false,\"updateBy\":\"admin\",\"status\":1}', '{\"code\":500,\"msg\":\"操作失败\"}', '1', null, '2020-11-16 18:09:32');
INSERT INTO `sys_operation_log` VALUES ('528', '字典数据', '2', 'com.twelvet.server.system.controller.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/dictionaries/data', '127.0.0.1', '', '{\"dictValue\":\"5\",\"dictSort\":5,\"remark\":\"asd\",\"params\":{},\"dictType\":\"sys_user_sex\",\"default\":false,\"updateBy\":\"admin\",\"status\":1}', '{\"code\":500,\"msg\":\"操作失败\"}', '1', null, '2020-11-16 18:10:13');
INSERT INTO `sys_operation_log` VALUES ('529', '字典数据', '2', 'com.twelvet.server.system.controller.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/dictionaries/data', '127.0.0.1', '', '{\"dictValue\":\"5\",\"dictSort\":5,\"remark\":\"asd\",\"params\":{},\"dictType\":\"sys_user_sex\",\"default\":false,\"updateBy\":\"admin\",\"status\":1}', '{\"code\":500,\"msg\":\"操作失败\"}', '1', null, '2020-11-16 18:10:31');
INSERT INTO `sys_operation_log` VALUES ('530', '字典数据', '2', 'com.twelvet.server.system.controller.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/dictionaries/data', '127.0.0.1', '', '{\"dictValue\":\"3\",\"dictSort\":4,\"params\":{},\"dictType\":\"sys_user_sex\",\"dictLabel\":\"测试\",\"default\":false,\"updateBy\":\"admin\",\"status\":1}', '{\"code\":500,\"msg\":\"操作失败\"}', '1', null, '2020-11-16 18:14:16');
INSERT INTO `sys_operation_log` VALUES ('531', '字典数据', '2', 'com.twelvet.server.system.controller.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/dictionaries/data', '127.0.0.1', '', '{\"dictValue\":\"3\",\"dictSort\":4,\"params\":{},\"dictType\":\"sys_user_sex\",\"dictLabel\":\"测试\",\"default\":false,\"updateBy\":\"admin\",\"status\":1}', '{\"code\":500,\"msg\":\"操作失败\"}', '1', null, '2020-11-16 18:16:58');
INSERT INTO `sys_operation_log` VALUES ('532', '字典数据', '1', 'com.twelvet.server.system.controller.SysDictDataController.add()', 'POST', '1', 'admin', null, '/dictionaries/data', '127.0.0.1', '', '{\"dictValue\":\"12\",\"dictSort\":4,\"params\":{},\"dictType\":\"sys_user_sex\",\"dictLabel\":\"测试\",\"createBy\":\"admin\",\"default\":false,\"dictCode\":0,\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-16 18:22:44');
INSERT INTO `sys_operation_log` VALUES ('533', '字典类型', '3', 'com.twelvet.server.system.controller.SysDictDataController.remove()', 'DELETE', '1', 'admin', null, '/dictionaries/data/100', '127.0.0.1', '', '{dictCodes=100}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-16 18:22:50');
INSERT INTO `sys_operation_log` VALUES ('534', '字典数据', '1', 'com.twelvet.server.system.controller.SysDictDataController.add()', 'POST', '1', 'admin', null, '/dictionaries/data', '127.0.0.1', '', '{\"dictValue\":\"12\",\"dictSort\":4,\"params\":{},\"dictType\":\"sys_user_sex\",\"dictLabel\":\"测试\",\"createBy\":\"admin\",\"default\":false,\"dictCode\":0,\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-16 18:23:01');
INSERT INTO `sys_operation_log` VALUES ('535', '字典类型', '3', 'com.twelvet.server.system.controller.SysDictDataController.remove()', 'DELETE', '1', 'admin', null, '/dictionaries/data/101', '127.0.0.1', '', '{dictCodes=101}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-16 18:23:12');
INSERT INTO `sys_operation_log` VALUES ('536', '字典数据', '5', 'com.twelvet.server.system.controller.SysDictDataController.export()', 'POST', '1', 'admin', null, '/dictionaries/data/exportExcel', '127.0.0.1', '', '{\"params\":{},\"default\":false}', 'null', '1', null, '2020-11-16 18:23:27');
INSERT INTO `sys_operation_log` VALUES ('537', '字典数据', '5', 'com.twelvet.server.system.controller.SysDictDataController.export()', 'POST', '1', 'admin', null, '/dictionaries/data/exportExcel', '127.0.0.1', '', '{\"params\":{},\"default\":false}', 'null', '1', null, '2020-11-16 20:20:44');
INSERT INTO `sys_operation_log` VALUES ('538', '字典数据', '5', 'com.twelvet.server.system.controller.SysDictDataController.export()', 'POST', '1', 'admin', null, '/dictionaries/data/exportExcel', '127.0.0.1', '', '{\"params\":{},\"default\":false}', 'null', '1', null, '2020-11-19 10:23:55');
INSERT INTO `sys_operation_log` VALUES ('539', '定时任务', '2', 'com.twelvet.server.job.controller.SysJobController.edit()', 'PUT', '1', 'admin', null, '/cron', '127.0.0.1', '', '{\"jobName\":\"测试任务\",\"concurrent\":0,\"jobGroup\":\"SYSTEM\",\"params\":{},\"cronExpression\":\"0 */15 * * * ?\",\"jobId\":103,\"nextValidTime\":1605754800000,\"updateBy\":\"admin\",\"invokeTarget\":\"twtTask.twtParams(\'twt\')\\t\",\"misfirePolicy\":3,\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-19 10:59:56');
INSERT INTO `sys_operation_log` VALUES ('540', '定时任务', '2', 'com.twelvet.server.job.controller.SysJobController.edit()', 'PUT', '1', 'admin', null, '/cron', '127.0.0.1', '', '{\"jobName\":\"测试任务\",\"concurrent\":0,\"jobGroup\":\"SYSTEM\",\"params\":{},\"cronExpression\":\"0 */15 * * * ?\",\"jobId\":103,\"nextValidTime\":1605754800000,\"updateBy\":\"admin\",\"invokeTarget\":\"twtTask.twtParams(\'twt\')\\t\",\"misfirePolicy\":3,\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-19 11:00:02');
INSERT INTO `sys_operation_log` VALUES ('541', '定时任务', '2', 'com.twelvet.server.job.controller.SysJobController.edit()', 'PUT', '1', 'admin', null, '/cron', '127.0.0.1', '', '{\"jobName\":\"测试任务\",\"concurrent\":0,\"jobGroup\":\"SYSTEM\",\"params\":{},\"cronExpression\":\"0 */15 * * * ?\",\"jobId\":103,\"nextValidTime\":1605755700000,\"updateBy\":\"admin\",\"invokeTarget\":\"twtTask.twtParams(\'twt\')\\t\",\"misfirePolicy\":3,\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-19 11:00:08');
INSERT INTO `sys_operation_log` VALUES ('542', '定时任务', '3', 'com.twelvet.server.job.controller.SysJobController.remove()', 'DELETE', '1', 'admin', null, '/cron/103', '127.0.0.1', '', '{jobIds=103}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-19 11:00:39');
INSERT INTO `sys_operation_log` VALUES ('543', '定时任务', '1', 'com.twelvet.server.job.controller.SysJobController.add()', 'POST', '1', 'admin', null, '/cron', '127.0.0.1', '', '{\"jobName\":\"sas\",\"concurrent\":0,\"jobGroup\":\"SYSTEM\",\"params\":{},\"cronExpression\":\"0 */15 * * * ?\\t\",\"jobId\":104,\"createBy\":\"admin\",\"nextValidTime\":1605755700000,\"invokeTarget\":\"asd\",\"misfirePolicy\":3,\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-19 11:02:09');
INSERT INTO `sys_operation_log` VALUES ('544', '定时任务', '3', 'com.twelvet.server.job.controller.SysJobController.remove()', 'DELETE', '1', 'admin', null, '/cron/104', '127.0.0.1', '', '{jobIds=104}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-19 11:02:14');
INSERT INTO `sys_operation_log` VALUES ('545', '定时任务', '1', 'com.twelvet.server.job.controller.SysJobController.add()', 'POST', '1', 'admin', null, '/cron', '127.0.0.1', '', '{\"jobName\":\"sad\",\"concurrent\":0,\"jobGroup\":\"SYSTEM\",\"params\":{},\"cronExpression\":\"0 */15 * * * ?\",\"jobId\":105,\"createBy\":\"admin\",\"nextValidTime\":1605755700000,\"invokeTarget\":\"sa\",\"misfirePolicy\":1,\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-19 11:05:03');
INSERT INTO `sys_operation_log` VALUES ('546', '定时任务', '3', 'com.twelvet.server.job.controller.SysJobController.remove()', 'DELETE', '1', 'admin', null, '/cron/105', '127.0.0.1', '', '{jobIds=105}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-19 11:05:07');
INSERT INTO `sys_operation_log` VALUES ('547', '用户管理', '1', 'com.twelvet.server.system.controller.SysUserController.add()', 'POST', '1', 'admin', null, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15478978787\",\"admin\":false,\"password\":\"aaaaaa\",\"postIds\":[4],\"email\":\"2471835953@qq.com\",\"nickName\":\"demo\",\"sex\":\"0\",\"deptId\":101,\"params\":{},\"userId\":0,\"roleIds\":[2],\"status\":1,\"username\":\"demo\"}', '{\"code\":500,\"msg\":\"新增用户\'demo\'失败，登录账号已存在\"}', '1', null, '2020-11-19 14:03:25');
INSERT INTO `sys_operation_log` VALUES ('548', '用户管理', '1', 'com.twelvet.server.system.controller.SysUserController.add()', 'POST', '1', 'admin', null, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15478978787\",\"admin\":false,\"password\":\"aaaaaa\",\"postIds\":[4],\"email\":\"2471835953@qq.com\",\"nickName\":\"demo\",\"sex\":\"0\",\"deptId\":101,\"params\":{},\"userId\":0,\"roleIds\":[2],\"status\":1,\"username\":\"demo\"}', '{\"code\":500,\"msg\":\"新增用户\'demo\'失败，邮箱账号已存在\"}', '1', null, '2020-11-19 14:06:29');
INSERT INTO `sys_operation_log` VALUES ('549', '用户管理', '1', 'com.twelvet.server.system.controller.SysUserController.add()', 'POST', '1', 'admin', null, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15478978787\",\"admin\":false,\"password\":\"aaaaaa\",\"postIds\":[4],\"email\":\"2471835953@qq.com\",\"nickName\":\"demo\",\"sex\":\"0\",\"deptId\":101,\"params\":{},\"userId\":0,\"roleIds\":[2],\"status\":1,\"username\":\"demo\"}', '{\"code\":500,\"msg\":\"新增用户\'demo\'失败，邮箱账号已存在\"}', '1', null, '2020-11-19 14:06:36');
INSERT INTO `sys_operation_log` VALUES ('550', '用户管理', '1', 'com.twelvet.server.system.controller.SysUserController.add()', 'POST', '1', 'admin', null, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15478978787\",\"admin\":false,\"password\":\"$2a$10$5PR3BlOCmA8huYo5fUC78.8JiWHm95vkWIvpV4Zx8nqx0t.FDz/OC\",\"postIds\":[4],\"email\":\"8888@qq.com\",\"nickName\":\"demo\",\"sex\":\"0\",\"deptId\":101,\"params\":{},\"userId\":4,\"createBy\":\"admin\",\"roleIds\":[2],\"status\":1,\"username\":\"demo\"}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-19 14:06:45');
INSERT INTO `sys_operation_log` VALUES ('551', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"5\",\"params\":{},\"roleSort\":\"2\",\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"deptIds\":[],\"menuIds\":[1,102,110,105,1013,1014,1015,1016,1026,1027,1028,1029,1030,1051,1052,1053,1054],\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-19 14:08:21');
INSERT INTO `sys_operation_log` VALUES ('552', '用户管理', '2', 'com.twelvet.server.system.controller.SysUserController.edit()', 'PUT', '1', 'admin', null, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15478978787\",\"admin\":false,\"updateBy\":\"admin\",\"postIds\":[4],\"email\":\"8888@qq.com\",\"nickName\":\"demo\",\"sex\":\"0\",\"deptId\":101,\"params\":{},\"userId\":4,\"roleIds\":[2],\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-19 14:09:31');
INSERT INTO `sys_operation_log` VALUES ('553', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"2\",\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"deptIds\":[],\"menuIds\":[1013,1014,1015,1016,1026,1027,1028,1029,1030,1051,1052,1053,1054],\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-19 14:10:12');
INSERT INTO `sys_operation_log` VALUES ('554', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"2\",\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"deptIds\":[],\"menuIds\":[2,100,101,103,104,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1017,1018,1019,1020,1021,1022,1023,1024,1025,1,102,110,105,1013,1014,1015,1016,1026,1027,1028,1029,1030,1051,1052,1053,1054],\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-19 14:46:44');
INSERT INTO `sys_operation_log` VALUES ('555', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"2\",\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"deptIds\":[],\"menuIds\":[1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1051,1052,1053,1054,100,101,103,104,105,110,2],\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-19 14:47:20');
INSERT INTO `sys_operation_log` VALUES ('556', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"2\",\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"deptIds\":[],\"menuIds\":[1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,100,101,103,104,105,2,102,1013,1014,1015,1016],\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-19 14:47:36');
INSERT INTO `sys_operation_log` VALUES ('557', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"2\",\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"deptIds\":[],\"menuIds\":[],\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-19 14:47:59');
INSERT INTO `sys_operation_log` VALUES ('558', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"2\",\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"deptIds\":[],\"menuIds\":[102,1013,1014,1015,1016],\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-19 14:48:23');
INSERT INTO `sys_operation_log` VALUES ('559', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"2\",\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"deptIds\":[],\"menuIds\":[1013,1014,1015,1016,102,1,110,105,1026,1027,1028,1029,1030,1051,1052,1053,1054],\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-19 14:48:41');
INSERT INTO `sys_operation_log` VALUES ('560', '字典类型', '9', 'com.twelvet.server.system.controller.SysDictTypeController.clearCache()', 'DELETE', '1', 'demo', null, '/dictionaries/type/clearCache', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-19 14:52:18');
INSERT INTO `sys_operation_log` VALUES ('561', '字典类型', '9', 'com.twelvet.server.system.controller.SysDictTypeController.clearCache()', 'DELETE', '1', 'demo', null, '/dictionaries/type/clearCache', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-19 14:52:28');
INSERT INTO `sys_operation_log` VALUES ('562', '字典类型', '9', 'com.twelvet.server.system.controller.SysDictTypeController.clearCache()', 'DELETE', '1', 'demo', null, '/dictionaries/type/clearCache', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-19 14:54:54');
INSERT INTO `sys_operation_log` VALUES ('563', '字典类型', '9', 'com.twelvet.server.system.controller.SysDictTypeController.clearCache()', 'DELETE', '1', 'demo', null, '/dictionaries/type/clearCache', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-19 14:57:55');
INSERT INTO `sys_operation_log` VALUES ('564', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"5\",\"params\":{},\"roleSort\":\"2\",\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"deptIds\":[],\"menuIds\":[1013,1014,1015,1016,1026,1027,1028,1029,1030,1051,1052,1053,1054],\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-19 14:58:11');
INSERT INTO `sys_operation_log` VALUES ('565', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"5\",\"params\":{},\"roleSort\":\"2\",\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"deptIds\":[],\"menuIds\":[1013,1014,1015,1016,1051,1052,1053,1054,102,110],\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-19 14:58:31');
INSERT INTO `sys_operation_log` VALUES ('566', '字典类型', '9', 'com.twelvet.server.system.controller.SysDictTypeController.clearCache()', 'DELETE', '1', 'demo', null, '/dictionaries/type/clearCache', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-19 14:58:36');
INSERT INTO `sys_operation_log` VALUES ('567', '字典类型', '9', 'com.twelvet.server.system.controller.SysDictTypeController.clearCache()', 'DELETE', '1', 'admin', null, '/dictionaries/type/clearCache', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-19 22:25:03');
INSERT INTO `sys_operation_log` VALUES ('568', '字典类型', '9', 'com.twelvet.server.system.controller.SysDictTypeController.clearCache()', 'DELETE', '1', 'admin', null, '/dictionaries/type/clearCache', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-19 22:53:18');
INSERT INTO `sys_operation_log` VALUES ('569', '字典类型', '9', 'com.twelvet.server.system.controller.SysDictTypeController.clearCache()', 'DELETE', '1', 'admin', null, '/dictionaries/type/clearCache', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-19 22:53:22');
INSERT INTO `sys_operation_log` VALUES ('570', '字典类型', '9', 'com.twelvet.server.system.controller.SysDictTypeController.clearCache()', 'DELETE', '1', 'admin', null, '/dictionaries/type/clearCache', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-19 22:53:29');
INSERT INTO `sys_operation_log` VALUES ('571', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"5\",\"params\":{},\"roleSort\":\"2\",\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"deptIds\":[],\"menuIds\":[1013,1014,1015,1016,1051,1052,1053,1054,102,110,1,105,1026,1027,1028,1029,1030],\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-19 23:43:15');
INSERT INTO `sys_operation_log` VALUES ('572', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"5\",\"params\":{},\"roleSort\":\"2\",\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"deptIds\":[],\"menuIds\":[1,102,110,105,1013,1014,1015,1016,1026,1027,1028,1029,1030,1051,1052,1053,1054],\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-19 23:45:41');
INSERT INTO `sys_operation_log` VALUES ('573', '角色管理', '2', 'com.twelvet.server.system.controller.SysRoleController.update()', 'PUT', '1', 'admin', null, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"2\",\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"deptIds\":[],\"menuIds\":[1013,1014,1015,1016,1026,1027,1028,1029,1030,1051,1052,1053,1054],\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-19 23:45:59');
INSERT INTO `sys_operation_log` VALUES ('574', '字典类型', '9', 'com.twelvet.server.system.controller.SysDictTypeController.clearCache()', 'DELETE', '1', 'admin', null, '/dictionaries/type/clearCache', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-19 23:51:29');
INSERT INTO `sys_operation_log` VALUES ('575', '字典类型', '9', 'com.twelvet.server.system.controller.SysDictTypeController.clearCache()', 'DELETE', '1', 'admin', null, '/dictionaries/type/clearCache', '127.0.0.1', '', '{}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-19 23:52:08');
INSERT INTO `sys_operation_log` VALUES ('576', '菜单管理', '2', 'com.twelvet.server.system.controller.SysMenuController.update()', 'PUT', '1', 'admin', null, '/menu', '127.0.0.1', '', '{\"visible\":false,\"icon\":\"icon-job\",\"orderNum\":\"2\",\"menuName\":\"定时任务\",\"params\":{},\"parentId\":1,\"path\":\"/system/job\",\"routes\":[],\"component\":\"./system/job\",\"updateBy\":\"admin\",\"isFrame\":true,\"menuId\":110,\"menuType\":\"C\",\"perms\":\"system:job:list\",\"status\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', '1', null, '2020-11-21 22:49:28');
INSERT INTO `sys_operation_log` VALUES ('577', '文件上传', '6', 'com.twelvet.server.dfs.controller.DFSController.upload()', 'POST', '1', 'admin', null, '/upload', '127.0.0.1', '', '[]', '{\"code\":200,\"data\":[]}', '1', null, '2021-01-03 09:51:19');
INSERT INTO `sys_operation_log` VALUES ('578', '文件上传', '6', 'com.twelvet.server.dfs.controller.DFSController.upload()', 'POST', '1', 'admin', null, '/upload', '127.0.0.1', '', '[]', '{\"code\":200,\"data\":[]}', '1', null, '2021-01-03 09:56:41');
INSERT INTO `sys_operation_log` VALUES ('579', '文件上传', '6', 'com.twelvet.server.dfs.controller.DFSController.upload()', 'POST', '1', 'admin', null, '/upload', '127.0.0.1', '', '[]', '{\"code\":200,\"data\":[]}', '1', null, '2021-01-03 10:31:43');
INSERT INTO `sys_operation_log` VALUES ('580', '文件上传', '6', 'com.twelvet.server.dfs.controller.DFSController.upload()', 'POST', '1', 'admin', null, '/upload', '127.0.0.1', '', '[]', '{\"code\":200,\"data\":[]}', '1', null, '2021-01-03 10:32:12');
INSERT INTO `sys_operation_log` VALUES ('581', '文件上传', '6', 'com.twelvet.server.dfs.controller.DFSController.upload()', 'POST', '1', 'admin', null, '/upload', '127.0.0.1', '', '[]', '{\"code\":200,\"data\":[]}', '1', null, '2021-01-03 10:34:27');
INSERT INTO `sys_operation_log` VALUES ('582', '文件上传', '6', 'com.twelvet.server.dfs.controller.DFSController.upload()', 'POST', '1', 'admin', null, '/upload', '127.0.0.1', '', '[]', '{\"code\":200,\"data\":[]}', '1', null, '2021-01-03 10:34:55');
INSERT INTO `sys_operation_log` VALUES ('583', '文件上传', '6', 'com.twelvet.server.dfs.controller.DFSController.upload()', 'POST', '1', 'admin', null, '/upload', '127.0.0.1', '', '[]', '{\"code\":200,\"data\":[]}', '1', null, '2021-01-03 10:36:05');
INSERT INTO `sys_operation_log` VALUES ('584', '文件上传', '6', 'com.twelvet.server.dfs.controller.DFSController.upload()', 'POST', '1', 'admin', null, '/upload', '127.0.0.1', '', '[]', '{\"code\":200,\"data\":[]}', '1', null, '2021-01-03 10:36:42');
INSERT INTO `sys_operation_log` VALUES ('585', '文件上传', '6', 'com.twelvet.server.dfs.controller.DFSController.upload()', 'POST', '1', 'admin', null, '/upload', '127.0.0.1', '', '[]', '{\"code\":200,\"data\":[]}', '1', null, '2021-01-03 10:37:56');
INSERT INTO `sys_operation_log` VALUES ('586', '文件上传', '6', 'com.twelvet.server.dfs.controller.DFSController.upload()', 'POST', '1', 'admin', null, '/upload', '127.0.0.1', '', '[]', '{\"code\":200,\"data\":[]}', '1', null, '2021-01-03 10:50:39');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（1正常 0停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'ceo', '董事长', '1', '1', 'admin', '2018-03-16 11:33:00', 'admin', '2020-12-31 16:49:55', '董事长');
INSERT INTO `sys_post` VALUES ('2', 'se', '项目经理', '2', '1', 'admin', '2018-03-16 11:33:00', 'admin', '2020-10-22 15:19:10', '项目经理');
INSERT INTO `sys_post` VALUES ('3', 'hr', '人力资源', '3', '1', 'admin', '2018-03-16 11:33:00', 'admin', '2020-10-22 15:19:18', '人力资源');
INSERT INTO `sys_post` VALUES ('4', 'staff', '普通员工', '4', '1', 'admin', '2018-03-16 11:33:00', 'admin', '2020-10-22 15:19:30', '普通员工');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) COLLATE utf8_unicode_ci DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` tinyint(1) NOT NULL COMMENT '角色状态（1正常 0停用）',
  `del_flag` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', 'admin', '1', '1', '1', '0', 'admin', '2020-11-19 14:42:34', 'admin', '2021-01-11 22:40:02', '管理员');
INSERT INTO `sys_role` VALUES ('2', '普通角色', 'common', '2', '2', '1', '0', 'admin', '2020-11-19 14:42:34', 'admin', '2021-01-11 14:25:00', '普通角色');
INSERT INTO `sys_role` VALUES ('5', '测试角色', 'test', '3', '2', '1', '0', 'admin', '2020-12-19 20:54:25', 'admin', '2020-12-21 19:31:32', null);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('2', '103');
INSERT INTO `sys_role_dept` VALUES ('4', '103');
INSERT INTO `sys_role_dept` VALUES ('4', '104');
INSERT INTO `sys_role_dept` VALUES ('4', '105');
INSERT INTO `sys_role_dept` VALUES ('4', '106');
INSERT INTO `sys_role_dept` VALUES ('4', '107');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('2', '2');
INSERT INTO `sys_role_menu` VALUES ('2', '100');
INSERT INTO `sys_role_menu` VALUES ('2', '101');
INSERT INTO `sys_role_menu` VALUES ('2', '103');
INSERT INTO `sys_role_menu` VALUES ('2', '104');
INSERT INTO `sys_role_menu` VALUES ('2', '1001');
INSERT INTO `sys_role_menu` VALUES ('2', '1002');
INSERT INTO `sys_role_menu` VALUES ('2', '1003');
INSERT INTO `sys_role_menu` VALUES ('2', '1004');
INSERT INTO `sys_role_menu` VALUES ('2', '1005');
INSERT INTO `sys_role_menu` VALUES ('2', '1006');
INSERT INTO `sys_role_menu` VALUES ('2', '1007');
INSERT INTO `sys_role_menu` VALUES ('2', '1008');
INSERT INTO `sys_role_menu` VALUES ('2', '1009');
INSERT INTO `sys_role_menu` VALUES ('2', '1010');
INSERT INTO `sys_role_menu` VALUES ('2', '1011');
INSERT INTO `sys_role_menu` VALUES ('2', '1012');
INSERT INTO `sys_role_menu` VALUES ('2', '1017');
INSERT INTO `sys_role_menu` VALUES ('2', '1018');
INSERT INTO `sys_role_menu` VALUES ('2', '1019');
INSERT INTO `sys_role_menu` VALUES ('2', '1020');
INSERT INTO `sys_role_menu` VALUES ('2', '1021');
INSERT INTO `sys_role_menu` VALUES ('2', '1022');
INSERT INTO `sys_role_menu` VALUES ('2', '1023');
INSERT INTO `sys_role_menu` VALUES ('2', '1024');
INSERT INTO `sys_role_menu` VALUES ('2', '1025');
INSERT INTO `sys_role_menu` VALUES ('5', '4');
INSERT INTO `sys_role_menu` VALUES ('5', '500');
INSERT INTO `sys_role_menu` VALUES ('5', '501');
INSERT INTO `sys_role_menu` VALUES ('5', '1040');
INSERT INTO `sys_role_menu` VALUES ('5', '1041');
INSERT INTO `sys_role_menu` VALUES ('5', '1042');
INSERT INTO `sys_role_menu` VALUES ('5', '1043');
INSERT INTO `sys_role_menu` VALUES ('5', '1044');
INSERT INTO `sys_role_menu` VALUES ('5', '1045');
INSERT INTO `sys_role_menu` VALUES ('5', '1061');
INSERT INTO `sys_role_menu` VALUES ('5', '1062');
INSERT INTO `sys_role_menu` VALUES ('5', '1063');
INSERT INTO `sys_role_menu` VALUES ('5', '1064');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `username` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` tinyint(1) DEFAULT NULL COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` tinyint(1) DEFAULT NULL COMMENT '帐号状态（1正常 0停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '101', 'admin', 'twelvet', '00', '2471835953@qq.com', '15888888888', '0', 'http://119.29.118.110\\group1/M00/00/00/CgAIDWAs3PiATwMqAADKsRJKCPw827.png', '$2a$10$/vo1EcIb95RuoYLb69EpJ.6UW5l6v2Tk/SqyJx.asbsizhjv2TuLe', '1', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2021-02-11 11:33:00', 'admin', '2020-10-28 18:29:36', '管理员');
INSERT INTO `sys_user` VALUES ('4', '103', 'demo', 'demo', '00', '8888@qq.com', '15478978787', '2', '', '$2a$10$5PR3BlOCmA8huYo5fUC78.8JiWHm95vkWIvpV4Zx8nqx0t.FDz/OC', '1', '0', '', null, 'admin', '2020-11-19 14:06:45', 'admin', '2021-01-11 22:52:56', null);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '1');
INSERT INTO `sys_user_post` VALUES ('1', '2');
INSERT INTO `sys_user_post` VALUES ('2', '1');
INSERT INTO `sys_user_post` VALUES ('2', '2');
INSERT INTO `sys_user_post` VALUES ('2', '3');
INSERT INTO `sys_user_post` VALUES ('2', '4');
INSERT INTO `sys_user_post` VALUES ('3', '1');
INSERT INTO `sys_user_post` VALUES ('4', '3');
INSERT INTO `sys_user_post` VALUES ('4', '4');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('4', '2');
INSERT INTO `sys_user_role` VALUES ('4', '5');
