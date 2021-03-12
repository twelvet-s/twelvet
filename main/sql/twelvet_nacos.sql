SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `c_use` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `effect` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `c_schema` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfo_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 210 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info
-- ----------------------------
INSERT INTO `config_info` VALUES (5, 'twelvet-app-dev.yml', 'DEFAULT_GROUP', '# 服务调用超时时间(ms)\r\nribbon:\r\n  ReadTimeout: 8000\r\n  ConnectTimeout: 8000\r\n\r\n# 认证配置\r\nsecurity:\r\n  oauth2:\r\n    # 配置Resource Client_id信息\r\n    client:\r\n      client-id: twelvet\r\n      client-secret: 123456\r\n      scope: server\r\n    resource:\r\n      loadBalanced: true\r\n      token-info-uri: http://twelvet-auth/oauth/check_token\r\n    ignore:\r\n      urls:\r\n        - /actuator/**\r\nspring:\r\n  autoconfigure:\r\n    exclude: com.alibaba.druid.spring.boot.autoconfigure.DruidDataSourceAutoConfigure\r\n  jackson:\r\n    time-zone: GMT+8\r\n  # 关闭静态文件的映射，不关闭404抛不出\r\n  resources:\r\n    add-mappings: false\r\n  mvc:\r\n    # 抛出404异常给予自定义处理\r\n    throw-exception-if-no-handler-found: true\r\n\r\n# feign 配置\r\nfeign:\r\n  sentinel:\r\n    enabled: true\r\n  okhttp:\r\n    enabled: true\r\n  httpclient:\r\n    enabled: false\r\n  client:\r\n    config:\r\n      default:\r\n        connectTimeout: 10000\r\n        readTimeout: 10000\r\n  compression:\r\n    request:\r\n      enabled: true\r\n    response:\r\n      enabled: true\r\n\r\n# 暴露监控端点\r\nmanagement:\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: \'*\'\r\n\r\n# Mybatis配置\r\nmybatis:\r\n  # 搜索指定包别名\r\n  typeAliasesPackage: com.twelvet.api.*.domain\r\n  # 配置mapper的扫描，找到所有的mapper.xml映射文件\r\n  mapperLocations: classpath*:mapper/**/*Mapper.xml\r\n  # Mybatis开启日志打印\r\n  configuration:\r\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\r\n\r\n# 分布式事务配置\r\nseata:\r\n  # 未配置分布式事务,不要打开,会报错，且spring.datasource.dynami.seata需要同时开启\r\n  enabled: false\r\n  application-id: ${twelvet.name}\r\n  # 事务分组,nacos配置上必须相对应的配置\r\n  tx-service-group: ${twelvet.name}-group\r\n  # 开启自动数据源代理\r\n  enable-auto-data-source-proxy: true\r\n  config:\r\n    type: nacos\r\n    nacos:\r\n      server-addr: 127.0.0.1:8848\r\n      namespace: 60ca01e2-221e-47af-b7e5-64f2a7336973\r\n      group: DEFAULT_GROUP\r\n  registry:\r\n    type: nacos\r\n    nacos:\r\n      server-addr: 127.0.0.1:8848\r\n      application: seata-server\r\n      group: DEFAULT_GROUP\r\n      namespace: 60ca01e2-221e-47af-b7e5-64f2a7336973\r\n      cluster: DEFAULT', 'e849bdc14efde9d77fcaf073dd65baf5', '2020-06-04 12:38:30', '2021-03-12 12:18:51', NULL, '127.0.0.1', '', 'eeb43899-8a88-4f5b-b0e0-d7c8fd09b86e', '公共配置', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (18, 'twelvet-auth-dev.yml', 'DEFAULT_GROUP', 'server:\r\n  port: 8888\r\n\r\nspring: \r\n  datasource:\r\n    dynamic:\r\n      # 设置默认的数据源或者数据源组,默认值即为master\r\n      primary: master \r\n      druid:\r\n        initial-size: 5\r\n        min-idle: 5\r\n        maxActive: 20\r\n        maxWait: 60000\r\n        timeBetweenEvictionRunsMillis: 60000\r\n        minEvictableIdleTimeMillis: 300000\r\n        validationQuery: SELECT 1 FROM DUAL\r\n        testWhileIdle: true\r\n        testOnBorrow: false\r\n        testOnReturn: false\r\n        poolPreparedStatements: true\r\n        maxPoolPreparedStatementPerConnectionSize: 20\r\n        filters: stat,wall,slf4j\r\n        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000\r\n      datasource:\r\n        # 主库数据源\r\n        master:\r\n          driver-class-name: com.mysql.cj.jdbc.Driver\r\n          url: jdbc:mysql://127.0.0.1:3306/twelvet?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&serverTimezone=GMT%2B8\r\n          username: root\r\n          password: 123456\r\n        # 从库数据源\r\n        # slave:\r\n        # username:\r\n        # password:\r\n        # url:\r\n        # driver-class-name:\r\n      # 开启seata代理，开启后默认每个数据源都代理,分布式事务必须开启,否则关闭\r\n      seata: false\r\n  redis:\r\n    host: 127.0.0.1\r\n    port: 6379\r\n    password: \r\n    # 连接超时时间\r\n    timeout: 30s\r\n    lettuce:\r\n      pool:\r\n        # 连接池中的最小空闲连接\r\n        min-idle: 0\r\n        # 连接池中的最大空闲连接\r\n        max-idle: 8\r\n        # 连接池的最大数据库连接数\r\n        max-active: 8\r\n        # #连接池最大阻塞等待时间（使用负值表示没有限制）\r\n        max-wait: -1ms\r\n', '14fc523a8cbe2ada7990439aa33e3f8b', '2020-06-07 19:45:01', '2021-03-12 12:14:49', NULL, '127.0.0.1', '', 'eeb43899-8a88-4f5b-b0e0-d7c8fd09b86e', '认证服务器配置', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (19, 'twelvet-system-dev.yml', 'DEFAULT_GROUP', 'server:\r\n  port: 8081\r\n\r\nspring: \r\n  datasource:\r\n    dynamic:\r\n      # 设置默认的数据源或者数据源组,默认值即为master\r\n      primary: master \r\n      druid:\r\n        initial-size: 5\r\n        min-idle: 5\r\n        maxActive: 20\r\n        maxWait: 60000\r\n        timeBetweenEvictionRunsMillis: 60000\r\n        minEvictableIdleTimeMillis: 300000\r\n        validationQuery: SELECT 1 FROM DUAL\r\n        testWhileIdle: true\r\n        testOnBorrow: false\r\n        testOnReturn: false\r\n        poolPreparedStatements: true\r\n        maxPoolPreparedStatementPerConnectionSize: 20\r\n        filters: stat,wall,slf4j\r\n        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000\r\n      datasource:\r\n        # 主库数据源\r\n        master:\r\n          driver-class-name: com.mysql.cj.jdbc.Driver\r\n          url: jdbc:mysql://127.0.0.1:3306/twelvet?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&serverTimezone=GMT%2B8\r\n          username: root\r\n          password: 123456\r\n        # 从库数据源\r\n        # slave:\r\n        # username:\r\n        # password:\r\n        # url:\r\n        # driver-class-name:\r\n      # 开启seata代理，开启后默认每个数据源都代理,分布式事务必须开启,否则关闭\r\n      seata: false\r\n  redis:\r\n    host: 127.0.0.1\r\n    port: 6379\r\n    password: \r\n    # 连接超时时间\r\n    timeout: 30s\r\n    lettuce:\r\n      pool:\r\n        # 连接池中的最小空闲连接\r\n        min-idle: 0\r\n        # 连接池中的最大空闲连接\r\n        max-idle: 8\r\n        # 连接池的最大数据库连接数\r\n        max-active: 8\r\n        # #连接池最大阻塞等待时间（使用负值表示没有限制）\r\n        max-wait: -1ms\r\n', '7a78b8d83f831e1a3c2d722a94a3d6e6', '2020-06-07 19:45:29', '2021-03-12 12:15:21', NULL, '127.0.0.1', '', 'eeb43899-8a88-4f5b-b0e0-d7c8fd09b86e', '系统服务配置', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (41, 'twelvet-gateway-dev.yml', 'DEFAULT_GROUP', 'server:\r\n  port: 88\r\n\r\nspring: \r\n  cloud:\r\n    gateway:\r\n      loadbalancer: \r\n        use404: true\r\n      discovery:\r\n        locator:\r\n          # 开启服务名称小写匹配\r\n          lowerCaseServiceId: true\r\n          # 开启动态创建路由（不用每个都写死）\r\n          enabled: true\r\n      # 路由配置\r\n      routes:\r\n        # 认证中心\r\n        - id: twelvet-auth\r\n          uri: lb://twelvet-auth\r\n          predicates:\r\n            - Path=/auth/**\r\n          filters:\r\n            - StripPrefix=1\r\n        # 系统模块\r\n        - id: twelvet-system\r\n          # 匹配后提供服务的路由地址\r\n          uri: lb://twelvet-system\r\n           # 断言，路径匹配的进行路由\r\n          predicates:\r\n            - Path=/system/**\r\n          filters:\r\n            # 转发请求时去除路由前缀（system）\r\n            - StripPrefix=1\r\n            # 请求重写，将内部开放服务重写(重要配置，请勿轻易修改，否则将暴露用户信息API)\r\n            - RewritePath=/user/info(?<segment>/?.*), /from-user-info$\\{segment}\r\n            - RewritePath=/operationLog(?<segment>/?.*), /from-operationLog$\\{segment}\r\n            - RewritePath=/loginInfo(?<segment>/?.*), /from-loginInfo$\\{segment}\r\n        # 定时任务\r\n        - id: twelvet-job\r\n          uri: lb://twelvet-job\r\n          predicates:\r\n            - Path=/job/**\r\n          filters:\r\n            - StripPrefix=1\r\n        # DFS文件系统\r\n        - id: twelvet-dfs\r\n          uri: lb://twelvet-dfs\r\n          predicates:\r\n            - Path=/dfs/**\r\n          filters:\r\n            - StripPrefix=1\r\n            # 请求重写，不允许直接上传文件\r\n            - RewritePath=/upload(?<segment>/?.*), /from-upload$\\{segment}\r\n          ', 'd8089cb266522f85218d34fd2ecbc898', '2020-06-12 11:46:10', '2021-03-05 19:44:22', NULL, '117.136.31.87', '', 'eeb43899-8a88-4f5b-b0e0-d7c8fd09b86e', '网关配置', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (105, 'twelvet-monitor-dev.yml', 'DEFAULT_GROUP', 'server:\r\n  port: 8100\r\n\r\n# Spring\r\nspring: \r\n  security:\r\n    user:\r\n      name: twelvet\r\n      password: 123456\r\n  boot:\r\n    admin:\r\n      ui:\r\n        title: TwelveT服务监控中心', '8d399a0044b8ed359838d885a44ad885', '2020-09-06 23:43:00', '2020-09-06 23:44:26', NULL, '61.140.234.56', '', 'eeb43899-8a88-4f5b-b0e0-d7c8fd09b86e', '服务监控中心', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (109, 'sentinel-twelvet-gateway', 'DEFAULT_GROUP', '[\r\n    {\r\n        \"resource\": \"twelvet-auth\",\r\n        \"count\": 1000,\r\n        \"grade\": 1,\r\n        \"limitApp\": \"default\",\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0\r\n    },\r\n	{\r\n        \"resource\": \"twelvet-system\",\r\n        \"count\": 5,\r\n        \"grade\": 1,\r\n        \"limitApp\": \"default\",\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0\r\n    }\r\n]', '796032fef0c8185fdae015684ee42e5e', '2020-09-07 20:50:09', '2020-09-26 11:01:38', NULL, '61.140.239.30', '', 'eeb43899-8a88-4f5b-b0e0-d7c8fd09b86e', '流量控制', 'null', 'null', 'json', 'null');
INSERT INTO `config_info` VALUES (130, 'twelvet-job-dev.yml', 'DEFAULT_GROUP', 'server:\r\n    port: 8082\r\n# Spring\r\nspring: \r\n  datasource:\r\n    dynamic:\r\n      # 设置默认的数据源或者数据源组,默认值即为master\r\n      primary: master \r\n      druid:\r\n        initial-size: 5\r\n        min-idle: 5\r\n        maxActive: 20\r\n        maxWait: 60000\r\n        timeBetweenEvictionRunsMillis: 60000\r\n        minEvictableIdleTimeMillis: 300000\r\n        validationQuery: SELECT 1 FROM DUAL\r\n        testWhileIdle: true\r\n        testOnBorrow: false\r\n        testOnReturn: false\r\n        poolPreparedStatements: true\r\n        maxPoolPreparedStatementPerConnectionSize: 20\r\n        filters: stat,wall,slf4j\r\n        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000\r\n      datasource:\r\n        # 主库数据源\r\n        master:\r\n          driver-class-name: com.mysql.cj.jdbc.Driver\r\n          url: jdbc:mysql://127.0.0.1:3306/twelvet_job?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&serverTimezone=GMT%2B8\r\n          username: twelvet\r\n          password: liuxingmin\r\n        # 从库数据源\r\n        # slave:\r\n        # username:\r\n        # password:\r\n        # url:\r\n        # driver-class-name:\r\n      # 开启seata代理，开启后默认每个数据源都代理,分布式事务必须开启,否则关闭\r\n      seata: false\r\n  ', 'cfaa8dc854bba68f4b9dcb48e6386e7d', '2020-11-03 15:47:23', '2021-03-12 12:16:02', NULL, '127.0.0.1', '', 'eeb43899-8a88-4f5b-b0e0-d7c8fd09b86e', '分布式定时任务配置', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (155, 'twelvet-dfs-dev.yml', 'DEFAULT_GROUP', 'server:\r\n    port: 8083\r\n\r\nspring: \r\n  datasource:\r\n   dynamic:\r\n      # 设置默认的数据源或者数据源组,默认值即为master\r\n      primary: master \r\n      druid:\r\n        initial-size: 5\r\n        min-idle: 5\r\n        maxActive: 20\r\n        maxWait: 60000\r\n        timeBetweenEvictionRunsMillis: 60000\r\n        minEvictableIdleTimeMillis: 300000\r\n        validationQuery: SELECT 1 FROM DUAL\r\n        testWhileIdle: true\r\n        testOnBorrow: false\r\n        testOnReturn: false\r\n        poolPreparedStatements: true\r\n        maxPoolPreparedStatementPerConnectionSize: 20\r\n        filters: stat,wall,slf4j\r\n        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000\r\n      datasource:\r\n        # 主库数据源\r\n        master:\r\n          driver-class-name: com.mysql.cj.jdbc.Driver\r\n          url: jdbc:mysql://127.0.0.1:3306/twelvet?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&serverTimezone=GMT%2B8\r\n          username: root\r\n          password: 123456\r\n        # 从库数据源\r\n        # slave:\r\n        # username:\r\n        # password:\r\n        # url:\r\n        # driver-class-name:\r\n      # 开启seata代理，开启后默认每个数据源都代理,分布式事务必须开启,否则关闭\r\n      seata: false\r\n\r\n# FastDFS配置\r\nfdfs:\r\n  domain: http://cloud.twelvet.cn\r\n  soTimeout: 3000\r\n  connectTimeout: 2000\r\n  trackerList: 127.0.0.1:22122\r\n\r\n', 'eb1826623fcc718134f1d8266f425fa9', '2020-12-13 18:42:02', '2021-03-12 12:16:42', NULL, '127.0.0.1', '', 'eeb43899-8a88-4f5b-b0e0-d7c8fd09b86e', '分布式文件系统', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (194, 'store.mode', 'DEFAULT_GROUP', 'db', 'd77d5e503ad1439f585ac494268b351b', '2021-03-10 18:21:21', '2021-03-10 18:21:21', NULL, '127.0.0.1', '', '60ca01e2-221e-47af-b7e5-64f2a7336973', NULL, NULL, NULL, 'text', NULL);
INSERT INTO `config_info` VALUES (195, 'store.db.datasource', 'DEFAULT_GROUP', 'druid', '3d650fb8a5df01600281d48c47c9fa60', '2021-03-10 18:21:21', '2021-03-10 18:21:21', NULL, '127.0.0.1', '', '60ca01e2-221e-47af-b7e5-64f2a7336973', NULL, NULL, NULL, 'text', NULL);
INSERT INTO `config_info` VALUES (196, 'store.db.dbType', 'DEFAULT_GROUP', 'mysql', '81c3b080dad537de7e10e0987a4bf52e', '2021-03-10 18:21:21', '2021-03-10 18:21:21', NULL, '127.0.0.1', '', '60ca01e2-221e-47af-b7e5-64f2a7336973', NULL, NULL, NULL, 'text', NULL);
INSERT INTO `config_info` VALUES (197, 'store.db.driverClassName', 'DEFAULT_GROUP', 'com.mysql.jdbc.Driver', '683cf0c3a5a56cec94dfac94ca16d760', '2021-03-10 18:21:21', '2021-03-10 18:21:21', NULL, '127.0.0.1', '', '60ca01e2-221e-47af-b7e5-64f2a7336973', NULL, NULL, NULL, 'text', NULL);
INSERT INTO `config_info` VALUES (198, 'store.db.url', 'DEFAULT_GROUP', 'jdbc:mysql://localhost:3306/twelvet_seata?useUnicode=true', 'c6b0233c050e6495a0d9b246e0b1a5d9', '2021-03-10 18:21:21', '2021-03-10 18:22:43', NULL, '127.0.0.1', '', '60ca01e2-221e-47af-b7e5-64f2a7336973', '', '', '', 'text', '');
INSERT INTO `config_info` VALUES (199, 'store.db.user', 'DEFAULT_GROUP', 'root', '63a9f0ea7bb98050796b649e85481845', '2021-03-10 18:21:21', '2021-03-10 18:22:26', NULL, '127.0.0.1', '', '60ca01e2-221e-47af-b7e5-64f2a7336973', '', '', '', 'text', '');
INSERT INTO `config_info` VALUES (200, 'store.db.password', 'DEFAULT_GROUP', '123456', 'e10adc3949ba59abbe56e057f20f883e', '2021-03-10 18:21:21', '2021-03-10 18:24:45', NULL, '127.0.0.1', '', '60ca01e2-221e-47af-b7e5-64f2a7336973', '', '', '', 'text', '');
INSERT INTO `config_info` VALUES (201, 'store.db.minConn', 'DEFAULT_GROUP', '5', 'e4da3b7fbbce2345d7772b0674a318d5', '2021-03-10 18:21:21', '2021-03-10 18:21:21', NULL, '127.0.0.1', '', '60ca01e2-221e-47af-b7e5-64f2a7336973', NULL, NULL, NULL, 'text', NULL);
INSERT INTO `config_info` VALUES (202, 'store.db.maxConn', 'DEFAULT_GROUP', '30', '34173cb38f07f89ddbebc2ac9128303f', '2021-03-10 18:21:21', '2021-03-10 18:21:21', NULL, '127.0.0.1', '', '60ca01e2-221e-47af-b7e5-64f2a7336973', NULL, NULL, NULL, 'text', NULL);
INSERT INTO `config_info` VALUES (203, 'store.db.globalTable', 'DEFAULT_GROUP', 'global_table', '8b28fb6bb4c4f984df2709381f8eba2b', '2021-03-10 18:21:21', '2021-03-10 18:21:21', NULL, '127.0.0.1', '', '60ca01e2-221e-47af-b7e5-64f2a7336973', NULL, NULL, NULL, 'text', NULL);

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime(0) NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfoaggr_datagrouptenantdatum`(`data_id`, `group_id`, `tenant_id`, `datum_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '增加租户字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_aggr
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfobeta_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info_beta' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_beta
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfotag_datagrouptenanttag`(`data_id`, `group_id`, `tenant_id`, `tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info_tag' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_tag
-- ----------------------------

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tag_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE INDEX `uk_configtagrelation_configidtag`(`id`, `tag_name`, `tag_type`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_tag_relation' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_tags_relation
-- ----------------------------

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '集群、各Group容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of group_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info`  (
  `id` bigint(64) UNSIGNED NOT NULL,
  `nid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `gmt_create` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `op_type` char(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `idx_gmt_create`(`gmt_create`) USING BTREE,
  INDEX `idx_gmt_modified`(`gmt_modified`) USING BTREE,
  INDEX `idx_did`(`data_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '多租户改造' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of his_config_info
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('nacos', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数',
  `max_aggr_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '租户容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_info_kptenantid`(`kp`, `tenant_id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'tenant_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_info
-- ----------------------------
INSERT INTO `tenant_info` VALUES (1, '1', 'eeb43899-8a88-4f5b-b0e0-d7c8fd09b86e', 'dev', '开发环境', 'nacos', 1591243291556, 1591243291556);
INSERT INTO `tenant_info` VALUES (2, '1', '1edbee6b-43a7-4b97-a0f7-2804a8bb1bf9', 'test', '测试环境', 'nacos', 1598779661839, 1598779661839);
INSERT INTO `tenant_info` VALUES (4, '1', 'c4d16870-3d8d-40a8-b396-6737705dbde8', 'pre', '灰度环境', 'nacos', 1598779690682, 1598779690682);
INSERT INTO `tenant_info` VALUES (5, '1', '94664454-62b0-415a-9392-7c0ce2d11b2f', 'pro', '生产环境', 'nacos', 1598779700041, 1598779700041);
INSERT INTO `tenant_info` VALUES (6, '1', '60ca01e2-221e-47af-b7e5-64f2a7336973', 'seata', '分布式事务', 'nacos', 1615359228918, 1615359228918);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', 1);

SET FOREIGN_KEY_CHECKS = 1;
