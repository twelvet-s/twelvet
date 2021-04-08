SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0,100,101', 'TWT科技', 1, 'twelvet', '15888888888', '2471835953@qq.com', '1', '0', 'admin', '2018-03-16 11:33:00', 'TWT', '2020-12-31 16:49:51');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100,101,10,100,1010,100,101', '深圳总公司', 1, 'twelvet', '15888888888', '2471835953@qq.com', '1', '0', 'admin', '2018-03-16 11:33:00', 'TWT', '2020-10-23 16:03:40');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100,101,10,100,1010,100,101', '长沙分公司', 2, 'twelvet', '15888888888', '2471835953@qq.com', '1', '0', 'admin', '2018-03-16 11:33:00', 'TWT', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101,10,100,1010,100,101,10,100,1011', '研发部门', 1, 'twelvet', '15888888888', '2471835953@qq.com', '1', '0', 'admin', '2018-03-16 11:33:00', 'TWT', '2020-10-23 14:48:44');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101,10,100,1010,100,101,10,100,1011', '市场部门', 2, 'twelvet', '15888888888', '2471835953@qq.com', '1', '0', 'admin', '2018-03-16 11:33:00', 'TWT', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101,10,100,1010,100,101,10,100,1011', '测试部门', 3, 'twelvet', '15888888888', '2471835953@qq.com', '1', '0', 'admin', '2018-03-16 11:33:00', 'TWT', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101,10,100,1010,100,101,10,100,1011', '财务部门', 4, 'twelvet', '15888888888', '2471835953@qq.com', '1', '0', 'admin', '2018-03-16 11:33:00', 'TWT', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101,10,100,1010,100,101,10,100,1011', '运维部门', 5, 'twelvet', '15888888888', '2471835953@qq.com', '1', '0', 'admin', '2018-03-16 11:33:00', 'TWT', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,101,10,100,1010,100,101,10,100,1012', '市场部门', 1, 'twelvet', '15888888888', '2471835953@qq.com', '1', '0', 'admin', '2018-03-16 11:33:00', 'TWT', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,101,10,100,1010,100,101,10,100,1012', '财务部门', 2, 'twelvet', '15888888888', '2471835953@qq.com', '1', '0', 'admin', '2018-03-16 11:33:00', 'TWT', '2018-03-16 11:33:00');

-- ----------------------------
-- Table structure for sys_dfs
-- ----------------------------
DROP TABLE IF EXISTS `sys_dfs`;
CREATE TABLE `sys_dfs`  (
  `file_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件名称',
  `original_file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件原名称',
  `space_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件分组',
  `path` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件路径',
  `size` int(11) NOT NULL COMMENT '文件大小',
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件类型',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`file_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dfs
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', 1, 'admin', '2021-01-12 22:09:15', 'twelvet', '2021-01-12 22:09:27', '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', 1, 'admin', '2021-01-12 22:09:15', 'twelvet', '2021-01-12 22:09:27', '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', 1, 'admin', '2021-01-12 22:09:15', 'twelvet', '2021-01-12 22:09:27', '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', 1, 'admin', '2021-01-12 22:09:15', 'twelvet', '2021-01-12 22:09:27', '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', 1, 'admin', '2021-01-12 22:09:15', 'twelvet', '2021-01-12 22:09:27', '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', 1, 'admin', '2021-01-12 22:09:15', 'twelvet', '2021-01-12 22:09:27', '系统默认否');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', 1, 'admin', '2021-01-12 22:09:15', 'twelvet', '2021-01-12 22:09:27', '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', 1, 'admin', '2021-01-12 22:09:15', 'twelvet', '2021-01-12 22:09:27', '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', 1, 'admin', '2021-01-12 22:09:15', 'twelvet', '2021-01-12 22:09:27', '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', 1, 'admin', '2021-01-12 22:09:15', 'twelvet', '2021-01-12 22:09:27', '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', 1, 'admin', '2021-01-12 22:09:15', 'twelvet', '2021-01-12 22:09:27', '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', 1, 'admin', '2021-01-12 22:09:15', 'twelvet', '2021-01-12 22:09:27', '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', 1, 'admin', '2021-01-12 22:09:15', 'twelvet', '2021-01-12 22:09:27', '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', 1, 'admin', '2021-01-12 22:09:15', 'twelvet', '2021-01-12 22:09:27', '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', 1, 'admin', '2021-01-12 22:09:15', 'twelvet', '2021-01-12 22:09:27', '清空操作');
INSERT INTO `sys_dict_data` VALUES (106, 1, '密码模式', 'password', 'sys_oauth_client_details', NULL, NULL, 'N', 1, 'admin', '2021-01-12 22:09:15', '', '2021-01-12 22:09:27', NULL);
INSERT INTO `sys_dict_data` VALUES (107, 2, '刷新模式', 'refresh_token', 'sys_oauth_client_details', NULL, NULL, 'N', 1, 'admin', '2021-01-12 22:09:15', '', '2021-01-12 22:09:27', NULL);
INSERT INTO `sys_dict_data` VALUES (108, 3, '手机号码模式', 'phone_password', 'sys_oauth_client_details', NULL, NULL, 'N', 1, 'admin', '2021-01-12 22:09:15', '', '2021-01-12 22:09:27', NULL);
INSERT INTO `sys_dict_data` VALUES (109, 4, '授权码模式', 'authorization_code', 'sys_oauth_client_details', NULL, NULL, 'N', 1, 'admin', '2021-01-12 22:28:56', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', 1, 'admin', '2021-01-12 11:33:00', 'twelvet', '2021-01-12 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', 1, 'admin', '2021-01-12 11:33:00', 'twelvet', '2021-01-12 11:33:00', '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', 1, 'admin', '2021-01-12 11:33:00', 'twelvet', '2021-01-12 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', 1, 'admin', '2021-01-12 11:33:00', 'twelvet', '2021-01-12 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', 1, 'admin', '2021-01-12 11:33:00', 'twelvet', '2021-01-12 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (103, 'OAuth2终端', 'sys_oauth_client_details', 1, 'admin', '2021-01-12 11:33:00', '', '2021-01-12 22:07:34', 'OAuth2终端授权模式');

-- ----------------------------
-- Table structure for sys_login_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_info`;
CREATE TABLE `sys_login_info`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '提示信息',
  `access_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_login_info
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '组件路径',
  `is_frame` tinyint(1) NULL DEFAULT 1 COMMENT '是否为外链（1是 0否）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` tinyint(1) NULL DEFAULT 1 COMMENT '菜单状态（1显示 0隐藏）',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '菜单状态（1正常 0停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1079 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, '/system', NULL, 0, 'M', 1, 1, '', 'icon-system', 'admin', '2018-03-16 11:33:00', 'admin', '2021-03-19 14:46:45', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '人力管理', 0, 2, '/human', NULL, 0, 'M', 1, 1, '', 'icon-human-resources', 'admin', '2018-03-16 11:33:00', 'admin', '2020-11-14 11:38:41', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '工具箱', 0, 4, '/tool', NULL, 0, 'M', 1, 1, '', 'icon-tool-box', 'admin', '2018-03-16 11:33:00', 'admin', '2020-11-14 16:25:19', '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '日志管理', 0, 3, '/log', '', 0, 'M', 1, 1, '', 'icon-log', 'admin', '2018-03-16 11:33:00', 'admin', '2020-11-14 20:48:12', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (5, 'TwelveT', 0, 5, 'https://www.twelvet.cn', NULL, 1, 'M', 0, 1, '', 'icon-system', 'admin', '2018-03-16 11:33:00', 'admin', '2021-03-13 17:39:36', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '职员管理', 2, 1, '/human/staff', './human/staff', 1, 'C', 1, 1, 'system:user:list', 'icon-team', 'admin', '2018-03-16 11:33:00', 'admin', '2020-11-14 11:47:39', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 2, 2, '/human/role', './human/role', 0, 'C', 1, 1, 'system:role:list', 'icon-role', 'admin', '2018-03-16 11:33:00', 'admin', '2020-11-14 11:39:15', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 2, 'menu', 'system/menu', 0, 'C', 1, 1, 'system:menu:list', 'icon-menu', 'admin', '2018-03-16 11:33:00', 'admin', '2021-03-26 12:30:06', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 2, 4, '/human/dept', './human/dept', 0, 'C', 1, 1, 'system:dept:list', 'icon-dept', 'admin', '2018-03-16 11:33:00', 'admin', '2020-11-14 11:39:40', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 2, 5, '/human/post', './human/post', 0, 'C', 1, 1, 'system:post:list', 'icon-post', 'admin', '2018-03-16 11:33:00', 'admin', '2020-11-14 11:40:02', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 3, '/system/dictionaries', './system/dictionaries', 1, 'C', 0, 1, 'system:dictionaries:list', 'icon-dictionaries', 'admin', '2018-03-16 11:33:00', 'admin', '2020-11-14 21:46:40', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (107, 'OAuth2终端', 1, 4, '/system/client', './system/client', 1, 'C', 0, 1, 'system:client:list', 'icon-client', 'admin', '2018-03-16 11:33:00', 'admin', '2020-11-22 12:59:09', '终端设置菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 1, 5, '/system/job', './system/job', 1, 'C', 0, 1, 'system:job:list', 'icon-job', 'admin', '2018-03-16 11:33:00', 'admin', '2020-11-30 22:55:31', '定时任务菜单');
INSERT INTO `sys_menu` VALUES (113, '流程编辑器', 1066, 1, '/tool/graphicalEditor/flow', './tool/graphicalEditor/flow', 0, 'C', 1, 1, 'tool:build:list', 'icon-flow-edit', 'admin', '2018-03-16 11:33:00', 'admin', '2020-11-14 16:26:30', '表单构建菜单');
INSERT INTO `sys_menu` VALUES (114, '拓扑编辑器', 1066, 2, '/tool/graphicalEditor/koni', './tool/graphicalEditor/koni', 0, 'C', 1, 1, 'tool:gen:list', 'icon-koni-edit', 'admin', '2018-03-16 11:33:00', 'admin', '2020-11-14 16:27:43', '代码生成菜单');
INSERT INTO `sys_menu` VALUES (115, '脑图编辑器', 1066, 3, '/tool/graphicalEditor/mind', './tool/graphicalEditor/mind', 0, 'C', 1, 1, 'tool:swagger:list', 'icon-mind-edit', 'admin', '2018-03-16 11:33:00', 'admin', '2020-11-14 16:26:57', '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 4, 1, '/log/operation', './log/operation', 0, 'C', 1, 1, 'monitor:operlog:list', 'icon-log-operation', 'admin', '2018-03-16 11:33:00', 'admin', '2020-11-14 12:03:17', '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 4, 2, '/log/login', './log/login', 0, 'C', 1, 1, 'monitor:logininfor:list', 'icon-log-login', 'admin', '2018-03-16 11:33:00', 'admin', '2020-11-14 12:03:41', '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', 1, 'F', 0, 1, 'system:user:query', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', 1, 'F', 0, 1, 'system:user:insert', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', 1, 'F', 0, 1, 'system:user:update', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', 1, 'F', 0, 1, 'system:user:remove', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', 1, 'F', 0, 1, 'system:user:export', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', 1, 'F', 0, 1, 'system:user:import', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', 1, 'F', 0, 1, 'system:user:resetPwd', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', 0, 'F', 1, 1, 'system:role:query', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', 0, 'F', 1, 1, 'system:role:insert', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', 0, 'F', 1, 1, 'system:role:update', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', 0, 'F', 1, 1, 'system:role:remove', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', 0, 'F', 1, 1, 'system:role:export', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', 0, 'F', 1, 1, 'system:menu:query', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', 0, 'F', 1, 1, 'system:menu:insert', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', 0, 'F', 1, 1, 'system:menu:update', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', 0, 'F', 1, 1, 'system:menu:remove', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', 0, 'F', 1, 1, 'system:dept:query', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', 0, 'F', 1, 1, 'system:dept:insert', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2020-12-01 10:09:29', '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', 0, 'F', 1, 1, 'system:dept:update', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2020-12-01 10:09:38', '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', 0, 'F', 1, 1, 'system:dept:remove', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', 0, 'F', 1, 1, 'system:post:query', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', 0, 'F', 1, 1, 'system:post:insert', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', 0, 'F', 1, 1, 'system:post:update', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', 0, 'F', 1, 1, 'system:post:remove', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', 0, 'F', 1, 1, 'system:post:export', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', 1, 'F', 0, 1, 'system:dict:query', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', 1, 'F', 0, 1, 'system:dict:insert', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', 1, 'F', 0, 1, 'system:dict:update', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', 1, 'F', 0, 1, 'system:dict:remove', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', 1, 'F', 0, 1, 'system:dict:export', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1036, '终端查询', 107, 1, '#', '', 1, 'F', 0, 1, 'system:client:query', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1037, '终端新增', 107, 2, '#', '', 1, 'F', 0, 1, 'system:client:insert', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2020-12-01 10:05:20', '');
INSERT INTO `sys_menu` VALUES (1038, '终端修改', 107, 3, '#', '', 1, 'F', 0, 1, 'system:client:update', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2020-12-01 09:52:47', '');
INSERT INTO `sys_menu` VALUES (1039, '终端删除', 107, 4, '#', '', 1, 'F', 0, 1, 'system:client:remove', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', 0, 'F', 1, 1, 'monitor:operlog:query', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', 0, 'F', 1, 1, 'monitor:operlog:remove', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 0, 'F', 1, 1, 'monitor:operlog:export', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 0, 'F', 1, 1, 'monitor:logininfor:query', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 0, 'F', 1, 1, 'monitor:logininfor:remove', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 0, 'F', 1, 1, 'monitor:logininfor:export', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1051, '任务查询', 110, 1, '#', '', 1, 'F', 0, 1, 'monitor:job:query', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1052, '任务新增', 110, 2, '#', '', 1, 'F', 0, 1, 'monitor:job:insert', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1053, '任务修改', 110, 3, '#', '', 1, 'F', 0, 1, 'monitor:job:update', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1054, '任务删除', 110, 4, '#', '', 1, 'F', 0, 1, 'monitor:job:remove', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1061, '定时任务日志', 4, 3, '/log/job', './log/job', 1, 'C', 1, 1, 'system:operlog', 'icon-log-job', 'admin', '2020-11-14 12:10:35', 'admin', '2020-11-14 16:24:38', '');
INSERT INTO `sys_menu` VALUES (1062, '操作删除', 1061, 2, '#', '', 1, 'F', 1, 1, 'system:operlog:remove', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1063, '日志导出', 1061, 4, '#', '', 1, 'F', 1, 1, 'system:operlog:export', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1064, '操作查询', 1061, 1, '#', '', 1, 'F', 1, 1, 'system:operlog:query', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1066, '图形化编辑器', 3, 1, '/tool/graphicalEditor', NULL, 1, 'M', 1, 1, NULL, 'icon-graphical-edit', 'admin', '2020-11-14 16:25:44', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1071, '文件管理', 1, 6, '/system/dfs', '/system/dfs', 1, 'C', 1, 1, 'asd', 'icon-DFS', 'admin', '2020-12-31 17:16:37', 'admin', '2021-01-02 20:03:42', '');
INSERT INTO `sys_menu` VALUES (1072, '代码生成器', 3, 2, '/tool/gen', '/tool/gen', 1, 'C', 1, 1, 'tool:gen:list', 'icon-gen-code', 'admin', '2021-03-20 22:15:51', 'admin', '2021-03-22 00:32:20', '');
INSERT INTO `sys_menu` VALUES (1073, '生成查询', 1072, 1, '', NULL, 1, 'F', 1, 1, 'tool:gen:query', '#', 'admin', '2021-03-20 23:01:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1074, '生成修改', 1072, 2, '', NULL, 1, 'F', 1, 1, 'tool:gen:edit', '#', 'admin', '2021-03-20 23:01:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1075, '导入代码 ', 1072, 3, '', NULL, 1, 'F', 1, 1, 'tool:gen:import', '#', 'admin', '2021-03-20 23:02:37', 'admin', '2021-03-20 23:02:46', '');
INSERT INTO `sys_menu` VALUES (1076, '生成删除', 1072, 4, '', NULL, 1, 'F', 1, 1, '	 tool:gen:remove', '#', 'admin', '2021-03-20 23:03:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1077, '预览代码', 1072, 5, '', NULL, 1, 'F', 1, 1, 'tool:gen:preview', '#', 'admin', '2021-03-20 23:03:22', 'admin', '2021-03-20 23:03:30', '');
INSERT INTO `sys_menu` VALUES (1078, '生成代码', 1072, 6, '', NULL, 1, 'F', 1, 1, 'tool:gen:code', '#', 'admin', '2021-03-20 23:03:46', 'admin', '2021-03-22 11:34:47', '');

-- ----------------------------
-- Table structure for sys_oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `sys_oauth_client_details`;
CREATE TABLE `sys_oauth_client_details`  (
  `client_id` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户端唯一标识',
  `resource_ids` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '资源ID标识',
  `client_secret` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户端安全码',
  `scope` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户端授权范围',
  `authorized_grant_types` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户端授权类型',
  `web_server_redirect_uri` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务器回调地址',
  `authorities` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '访问资源所需权限',
  `access_token_validity` int(11) NULL DEFAULT NULL COMMENT '设定客户端的access_token的有效时间值（秒）',
  `refresh_token_validity` int(11) NULL DEFAULT NULL COMMENT '设定客户端的refresh_token的有效时间值（秒）',
  `additional_information` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预留字段',
  `autoapprove` tinyint(4) NULL DEFAULT NULL COMMENT '是否登录时跳过授权（默认false）',
  PRIMARY KEY (`client_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '客户端配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oauth_client_details
-- ----------------------------
INSERT INTO `sys_oauth_client_details` VALUES ('twelvet', NULL, '$2a$10$umNBbgAHokePA6cV8eQwPe9s3cEscMjIDRw9XJ4vWCR.ZjkZOxec2', 'server', 'password,phone_password,refresh_token', NULL, NULL, 3600, 7200, NULL, NULL);

-- ----------------------------
-- Table structure for sys_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_operation_log`;
CREATE TABLE `sys_operation_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `service` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` tinyint(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '操作状态（1正常 0异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_operation_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（1正常 0停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '1', 'admin', '2018-03-16 11:33:00', 'admin', '2020-12-31 16:49:55', '董事长');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '1', 'admin', '2018-03-16 11:33:00', 'admin', '2020-10-22 15:19:10', '项目经理');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '1', 'admin', '2018-03-16 11:33:00', 'admin', '2020-10-22 15:19:18', '人力资源');
INSERT INTO `sys_post` VALUES (4, 'staff', '普通员工', 4, '1', 'admin', '2018-03-16 11:33:00', 'admin', '2020-10-22 15:19:30', '普通员工');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` tinyint(1) NOT NULL COMMENT '角色状态（1正常 0停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', 'admin', 1, '1', 1, '0', 'admin', '2020-11-19 14:42:34', 'admin', '2021-01-11 22:40:02', '管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, '0', 'admin', '2020-11-19 14:42:34', 'admin', '2021-02-24 14:14:57', '普通角色');
INSERT INTO `sys_role` VALUES (5, '测试角色', 'test', 3, '2', 1, '0', 'admin', '2020-12-19 20:54:25', 'admin', '2020-12-21 19:31:32', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 103);
INSERT INTO `sys_role_dept` VALUES (4, 103);
INSERT INTO `sys_role_dept` VALUES (4, 104);
INSERT INTO `sys_role_dept` VALUES (4, 105);
INSERT INTO `sys_role_dept` VALUES (4, 106);
INSERT INTO `sys_role_dept` VALUES (4, 107);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (5, 4);
INSERT INTO `sys_role_menu` VALUES (5, 500);
INSERT INTO `sys_role_menu` VALUES (5, 501);
INSERT INTO `sys_role_menu` VALUES (5, 1040);
INSERT INTO `sys_role_menu` VALUES (5, 1041);
INSERT INTO `sys_role_menu` VALUES (5, 1042);
INSERT INTO `sys_role_menu` VALUES (5, 1043);
INSERT INTO `sys_role_menu` VALUES (5, 1044);
INSERT INTO `sys_role_menu` VALUES (5, 1045);
INSERT INTO `sys_role_menu` VALUES (5, 1061);
INSERT INTO `sys_role_menu` VALUES (5, 1062);
INSERT INTO `sys_role_menu` VALUES (5, 1063);
INSERT INTO `sys_role_menu` VALUES (5, 1064);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` tinyint(1) NULL DEFAULT NULL COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '帐号状态（1正常 0停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 101, 'admin', 'TwelveT', '00', '2471835953@qq.com', '15788888888', 0, 'http://cloud.twelvet.cn/dfs/group1/M00/00/02/CgAIDWA_LIaACVcrAAE4lCIAI8o859.jpg', '$2a$10$MBq3PvaIX9Yghhu.mm45wO8IC4WKXAUST9LvneCsQ71k/mrOdN6SO', 1, '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2021-02-11 11:33:00', 'admin', '2021-03-03 10:19:38', '管理员');
INSERT INTO `sys_user` VALUES (4, 103, 'demo', 'demo', '00', '8888@qq.com', '15478978787', 2, '', '$2a$10$5PR3BlOCmA8huYo5fUC78.8JiWHm95vkWIvpV4Zx8nqx0t.FDz/OC', 1, '0', '', NULL, 'admin', '2020-11-19 14:06:45', 'admin', '2021-01-11 22:52:56', NULL);
INSERT INTO `sys_user` VALUES (5, 108, 'demo2', 'demo2', '00', '123@qq.com', '13888888888', NULL, '', '$2a$10$USnKylS/ngPEBzwDTg8tre/HASWpsth3YtTWXTkZRWLRMP6bAGP.G', 1, '2', '', NULL, 'admin', '2021-02-24 13:47:02', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (1, 2);
INSERT INTO `sys_user_post` VALUES (2, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);
INSERT INTO `sys_user_post` VALUES (2, 3);
INSERT INTO `sys_user_post` VALUES (2, 4);
INSERT INTO `sys_user_post` VALUES (3, 1);
INSERT INTO `sys_user_post` VALUES (4, 3);
INSERT INTO `sys_user_post` VALUES (4, 4);
INSERT INTO `sys_user_post` VALUES (5, 4);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (4, 2);
INSERT INTO `sys_user_role` VALUES (4, 5);
INSERT INTO `sys_user_role` VALUES (5, 2);

-- ----------------------------
-- Table structure for undo_log
-- ----------------------------
DROP TABLE IF EXISTS `undo_log`;
CREATE TABLE `undo_log`  (
  `branch_id` bigint(20) NOT NULL COMMENT 'branch transaction id',
  `xid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'global transaction id',
  `context` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'undo_log context,such as serialization',
  `rollback_info` longblob NOT NULL COMMENT 'rollback info',
  `log_status` int(11) NOT NULL COMMENT '0:normal status,1:defense status',
  `log_created` datetime(6) NOT NULL COMMENT 'create datetime',
  `log_modified` datetime(6) NOT NULL COMMENT 'modify datetime',
  UNIQUE INDEX `ux_undo_log`(`xid`, `branch_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'AT transaction mode undo table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of undo_log
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
