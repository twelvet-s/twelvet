/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : twelvet

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 02/10/2020 21:20:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
  `visible` tinyint(1) NULL DEFAULT 0 COMMENT '菜单状态（1显示 0隐藏）',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '菜单状态（1正常 0停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1061 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, 0, 'M', 1, 1, '', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, 0, 'M', 1, 1, '', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, 0, 'M', 1, 1, '', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, 'TwelveT', 0, 4, 'https://www.twelvet.com', NULL, 1, 'M', 1, 1, '', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', 0, 'C', 1, 1, 'system:user:list', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', 0, 'C', 1, 1, 'system:role:list', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', 0, 'C', 1, 1, 'system:menu:list', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', 0, 'C', 1, 1, 'system:dept:list', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', 0, 'C', 1, 1, 'system:post:list', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', 0, 'C', 1, 1, 'system:dict:list', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', 0, 'C', 1, 1, 'system:config:list', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', 0, 'C', 1, 1, 'system:notice:list', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', 'system/log/index', 0, 'C', 1, 1, '', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', 0, 'C', 1, 1, 'monitor:online:list', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', 0, 'C', 1, 1, 'monitor:job:list', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', 0, 'C', 1, 1, 'monitor:druid:list', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', 0, 'C', 1, 1, 'monitor:server:list', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '表单构建', 3, 1, 'build', 'tool/build/index', 0, 'C', 1, 1, 'tool:build:list', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '表单构建菜单');
INSERT INTO `sys_menu` VALUES (114, '代码生成', 3, 2, 'gen', 'tool/gen/index', 0, 'C', 1, 1, 'tool:gen:list', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '代码生成菜单');
INSERT INTO `sys_menu` VALUES (115, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', 0, 'C', 1, 1, 'tool:swagger:list', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', 0, 'C', 1, 1, 'monitor:operlog:list', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', 0, 'C', 1, 1, 'monitor:logininfor:list', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', 0, 'F', 1, 1, 'system:user:query', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', 0, 'F', 1, 1, 'system:user:add', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', 0, 'F', 1, 1, 'system:user:edit', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', 0, 'F', 1, 1, 'system:user:remove', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', 0, 'F', 1, 1, 'system:user:export', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', 0, 'F', 1, 1, 'system:user:import', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', 0, 'F', 1, 1, 'system:user:resetPwd', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', 0, 'F', 1, 1, 'system:role:query', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', 0, 'F', 1, 1, 'system:role:add', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', 0, 'F', 1, 1, 'system:role:edit', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', 0, 'F', 1, 1, 'system:role:remove', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', 0, 'F', 1, 1, 'system:role:export', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', 0, 'F', 1, 1, 'system:menu:query', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', 0, 'F', 1, 1, 'system:menu:add', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', 0, 'F', 1, 1, 'system:menu:edit', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', 0, 'F', 1, 1, 'system:menu:remove', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', 0, 'F', 1, 1, 'system:dept:query', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', 0, 'F', 1, 1, 'system:dept:add', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', 0, 'F', 1, 1, 'system:dept:edit', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', 0, 'F', 1, 1, 'system:dept:remove', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', 0, 'F', 1, 1, 'system:post:query', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', 0, 'F', 1, 1, 'system:post:add', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', 0, 'F', 1, 1, 'system:post:edit', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', 0, 'F', 1, 1, 'system:post:remove', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', 0, 'F', 1, 1, 'system:post:export', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', 0, 'F', 1, 1, 'system:dict:query', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', 0, 'F', 1, 1, 'system:dict:add', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', 0, 'F', 1, 1, 'system:dict:edit', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', 0, 'F', 1, 1, 'system:dict:remove', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', 0, 'F', 1, 1, 'system:dict:export', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', 0, 'F', 1, 1, 'system:config:query', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', 0, 'F', 1, 1, 'system:config:add', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', 0, 'F', 1, 1, 'system:config:edit', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', 0, 'F', 1, 1, 'system:config:remove', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', 0, 'F', 1, 1, 'system:config:export', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', 0, 'F', 1, 1, 'system:notice:query', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', 0, 'F', 1, 1, 'system:notice:add', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', 0, 'F', 1, 1, 'system:notice:edit', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', 0, 'F', 1, 1, 'system:notice:remove', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', 0, 'F', 1, 1, 'monitor:operlog:query', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', 0, 'F', 1, 1, 'monitor:operlog:remove', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 0, 'F', 1, 1, 'monitor:operlog:export', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 0, 'F', 1, 1, 'monitor:logininfor:query', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 0, 'F', 1, 1, 'monitor:logininfor:remove', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 0, 'F', 1, 1, 'monitor:logininfor:export', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', 0, 'F', 1, 1, 'monitor:online:query', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', 0, 'F', 1, 1, 'monitor:online:batchLogout', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', 0, 'F', 1, 1, 'monitor:online:forceLogout', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', 0, 'F', 1, 1, 'monitor:job:query', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', 0, 'F', 1, 1, 'monitor:job:add', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', 0, 'F', 1, 1, 'monitor:job:edit', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', 0, 'F', 1, 1, 'monitor:job:remove', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', 0, 'F', 1, 1, 'monitor:job:changeStatus', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 7, '#', '', 0, 'F', 1, 1, 'monitor:job:export', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 114, 1, '#', '', 0, 'F', 1, 1, 'tool:gen:query', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 114, 2, '#', '', 0, 'F', 1, 1, 'tool:gen:edit', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 114, 3, '#', '', 0, 'F', 1, 1, 'tool:gen:remove', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 114, 2, '#', '', 0, 'F', 1, 1, 'tool:gen:import', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 114, 4, '#', '', 0, 'F', 1, 1, 'tool:gen:preview', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 114, 5, '#', '', 0, 'F', 1, 1, 'tool:gen:code', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');

SET FOREIGN_KEY_CHECKS = 1;
