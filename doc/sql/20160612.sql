-- Script was generated by Devart dbForge Studio for MySQL, Version 6.0.315.0
-- Product home page: http://www.devart.com/dbforge/mysql/studio
-- Script date 2016-06-12 14:22:18
-- Server version: 5.5.20
-- Client version: 4.1

--
-- Disable foreign keys
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

--
-- Set character set the client will use to send SQL statements to the server
--
SET NAMES 'utf8';

--
-- Set default database
--
USE springbootadmin;

--
-- Definition for table sys_dict
--
DROP TABLE IF EXISTS sys_dict;
CREATE TABLE sys_dict (
  id INT(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  label VARCHAR(100) NOT NULL COMMENT '标签名',
  value VARCHAR(100) NOT NULL COMMENT '数据值',
  dict_type VARCHAR(100) NOT NULL COMMENT '类型',
  description VARCHAR(100) DEFAULT NULL COMMENT '描述',
  sort INT(11) DEFAULT 0 COMMENT '排序（升序）',
  create_by INT(11) DEFAULT NULL COMMENT '创建者',
  create_date DATETIME DEFAULT NULL COMMENT '创建时间',
  update_by INT(11) DEFAULT NULL COMMENT '更新者',
  update_date DATETIME DEFAULT NULL COMMENT '更新时间',
  remarks VARCHAR(255) DEFAULT NULL COMMENT '备注信息',
  del_flag CHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (id),
  INDEX sys_dict_del_flag (del_flag),
  INDEX sys_dict_label (label),
  INDEX sys_dict_value (value)
)
ENGINE = MYISAM
AUTO_INCREMENT = 11
AVG_ROW_LENGTH = 80
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = '字典表';

--
-- Definition for table sys_log
--
DROP TABLE IF EXISTS sys_log;
CREATE TABLE sys_log (
  id INT(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  type CHAR(1) DEFAULT '1' COMMENT '日志类型1：访问日志 2：异常日志',
  create_by INT(11) DEFAULT NULL COMMENT '创建者',
  create_date DATETIME DEFAULT NULL COMMENT '创建时间',
  remote_addr VARCHAR(255) DEFAULT NULL COMMENT '操作IP地址',
  user_agent VARCHAR(255) DEFAULT NULL COMMENT '用户代理',
  request_uri VARCHAR(255) DEFAULT NULL COMMENT '请求URI',
  method VARCHAR(1024) DEFAULT NULL COMMENT '操作方式',
  params TEXT DEFAULT NULL COMMENT '操作提交的数据',
  exception TEXT DEFAULT NULL COMMENT '异常信息',
  response TEXT DEFAULT NULL COMMENT '响应信息',
  PRIMARY KEY (id),
  INDEX sys_log_create_by (create_by),
  INDEX sys_log_create_date (create_date),
  INDEX sys_log_request_uri (request_uri),
  INDEX sys_log_type (type)
)
ENGINE = MYISAM
AUTO_INCREMENT = 8
AVG_ROW_LENGTH = 307
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = '日志表';

--
-- Definition for table sys_menu
--
DROP TABLE IF EXISTS sys_menu;
CREATE TABLE sys_menu (
  id INT(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  parent_id INT(11) NOT NULL COMMENT '父级编号',
  name VARCHAR(100) NOT NULL COMMENT '菜单名称',
  href VARCHAR(255) DEFAULT NULL COMMENT '链接',
  target VARCHAR(20) DEFAULT NULL COMMENT '目标',
  icon VARCHAR(100) DEFAULT NULL COMMENT '图标',
  sort INT(11) DEFAULT NULL COMMENT '排序（升序）',
  is_show CHAR(1) DEFAULT NULL COMMENT '是否在菜单中显示',
  permission VARCHAR(200) DEFAULT NULL COMMENT '权限标识',
  create_by INT(11) DEFAULT NULL COMMENT '创建者',
  create_date DATETIME DEFAULT NULL COMMENT '创建时间',
  update_by INT(11) DEFAULT NULL COMMENT '更新者',
  update_date DATETIME DEFAULT NULL COMMENT '更新时间',
  remarks VARCHAR(255) DEFAULT NULL COMMENT '备注信息',
  del_flag CHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (id),
  INDEX sys_menu_del_flag (del_flag),
  INDEX sys_menu_parent_id (parent_id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 7
AVG_ROW_LENGTH = 69
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = '菜单表';

--
-- Definition for table sys_role
--
DROP TABLE IF EXISTS sys_role;
CREATE TABLE sys_role (
  id INT(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  name VARCHAR(100) NOT NULL COMMENT '角色名称',
  create_by INT(11) DEFAULT NULL COMMENT '创建者',
  create_date DATETIME DEFAULT NULL COMMENT '创建时间',
  update_by INT(11) DEFAULT NULL COMMENT '更新者',
  update_date DATETIME DEFAULT NULL COMMENT '更新时间',
  remarks VARCHAR(255) DEFAULT NULL COMMENT '备注信息',
  del_flag CHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (id),
  INDEX sys_role_del_flag (del_flag)
)
ENGINE = MYISAM
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = '系统角色表';

--
-- Definition for table sys_role_menu
--
DROP TABLE IF EXISTS sys_role_menu;
CREATE TABLE sys_role_menu (
  role_id INT(11) NOT NULL COMMENT '角色编号',
  menu_id INT(11) NOT NULL COMMENT '菜单编号',
  PRIMARY KEY (role_id, menu_id)
)
ENGINE = MYISAM
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = '角色-菜单';

--
-- Definition for table sys_user
--
DROP TABLE IF EXISTS sys_user;
CREATE TABLE sys_user (
  id INT(11) NOT NULL AUTO_INCREMENT,
  user_id INT(11) DEFAULT NULL COMMENT '用户信息表ID',
  login_name VARCHAR(50) DEFAULT NULL COMMENT '登录名',
  login_pwd VARCHAR(255) DEFAULT NULL COMMENT '登录密码',
  last_login_ip VARCHAR(255) DEFAULT NULL COMMENT '最近一次登录IP',
  last_login_date DATETIME DEFAULT NULL COMMENT '最近一次登录时间',
  create_by INT(11) DEFAULT NULL COMMENT '创建人ID',
  create_date DATETIME DEFAULT NULL COMMENT '创建时间',
  status SMALLINT(6) DEFAULT NULL COMMENT '0正常：-1：失效',
  PRIMARY KEY (id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 2
AVG_ROW_LENGTH = 1717
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = '系统用户表'
ROW_FORMAT = FIXED;

--
-- Definition for table sys_user_info
--
DROP TABLE IF EXISTS sys_user_info;
CREATE TABLE sys_user_info (
  user_id INT(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  real_name VARCHAR(50) DEFAULT NULL COMMENT '真实姓名',
  phone VARCHAR(11) DEFAULT NULL COMMENT '手机',
  email VARCHAR(50) DEFAULT NULL COMMENT ' 邮箱',
  create_by INT(11) DEFAULT NULL COMMENT '创建人',
  create_date DATETIME DEFAULT NULL COMMENT '创建时间',
  status SMALLINT(6) DEFAULT NULL COMMENT '0: 正常 ；-1失效',
  PRIMARY KEY (user_id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = '用户基本信息表'
ROW_FORMAT = FIXED;

--
-- Definition for table sys_user_role
--
DROP TABLE IF EXISTS sys_user_role;
CREATE TABLE sys_user_role (
  user_id INT(11) NOT NULL COMMENT '用户编号',
  role_id INT(11) NOT NULL COMMENT '角色编号',
  PRIMARY KEY (user_id, role_id)
)
ENGINE = MYISAM
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = '用户-角色';

--
-- Dumping data for table sys_dict
--
INSERT INTO sys_dict VALUES
(10, '有效', '1', 'isValid', '是否有效', 1, NULL, '2016-06-07 15:34:52', NULL, NULL, '', '0');

--
-- Dumping data for table sys_log
--
INSERT INTO sys_log VALUES
(1, '1', 1, '2016-05-23 13:06:49', 'test_remote_addr', 'user_agent', 'test_request_uri', 'post', 'test', NULL, NULL),
(2, '1', 1, '2016-05-23 17:02:18', 'testset', 'testset', 'setttest', 'get', 'test', NULL, NULL),
(3, '1', NULL, '2016-06-02 10:24:14', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', 'http://localhost/login', 'login', '[admin, admin]', NULL, 'SysUser{id=1, loginName=''admin'', loginPwd=''admin'', createDate=2016-05-19 16:12:38.0, createBy=1, status=0}'),
(4, '1', NULL, '2016-06-02 10:27:34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', 'http://localhost/sysLog/findAll', 'findByCreateDateBetween', '[Page request [number: 0, size 10, sort: id: DESC], SysLog{id=null, type=''null'', remoteAddr=''null'', userAgent=''null'', requestUri=''null'', method=''null'', createDate=null, params=''null''}]', NULL, 'Page 0 of 0 containing UNKNOWN instances'),
(5, '1', NULL, '2016-06-02 10:27:34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', 'http://localhost/sysLog/findAll', 'findByCreateDateBetween', '[Page request [number: 0, size 10, sort: id: DESC], SysLog{id=null, type=''null'', remoteAddr=''null'', userAgent=''null'', requestUri=''null'', method=''null'', createDate=null, params=''null''}]', NULL, 'Page 0 of 0 containing UNKNOWN instances'),
(6, '1', NULL, '2016-06-02 10:27:37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', 'http://localhost/sysLog/findAll', 'findByCreateDateBetween', '[Page request [number: 0, size 10, sort: id: DESC], SysLog{id=null, type=''null'', remoteAddr=''null'', userAgent=''null'', requestUri=''null'', method=''null'', createDate=null, params=''null''}]', NULL, 'Page 0 of 0 containing UNKNOWN instances'),
(7, '1', NULL, '2016-06-02 10:27:37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', 'http://localhost/sysLog/findAll', 'findByCreateDateBetween', '[Page request [number: 0, size 10, sort: id: DESC], SysLog{id=null, type=''null'', remoteAddr=''null'', userAgent=''null'', requestUri=''null'', method=''null'', createDate=null, params=''null''}]', NULL, 'Page 0 of 0 containing UNKNOWN instances');

--
-- Dumping data for table sys_menu
--
INSERT INTO sys_menu VALUES
(1, 0, '顶级菜单', NULL, NULL, NULL, 1, '1', NULL, NULL, '2016-06-06 13:15:55', NULL, NULL, NULL, '0'),
(3, 1, '系统管理', NULL, NULL, NULL, 2, '1', NULL, NULL, '2016-06-06 13:16:29', NULL, NULL, NULL, '0'),
(4, 3, '日志管理', '/sysLog/findAll', NULL, NULL, 3, '1', NULL, NULL, '2016-06-06 13:17:12', NULL, NULL, NULL, '0'),
(5, 3, '菜单管理', 'sysMenu/find', 'mainFrame', NULL, 2, '1', '', NULL, '2016-06-07 13:32:18', NULL, NULL, '', '0'),
(6, 3, '数据字典管理', 'sysDict/find', 'mainFrame', NULL, 2, '1', '', NULL, '2016-06-07 13:35:36', NULL, NULL, '', '0');

--
-- Dumping data for table sys_role
--

-- Table springbootadmin.sys_role does not contain any data (it is empty)

--
-- Dumping data for table sys_role_menu
--

-- Table springbootadmin.sys_role_menu does not contain any data (it is empty)

--
-- Dumping data for table sys_user
--
INSERT INTO sys_user VALUES
(1, 0, 'admin', 'admin', NULL, NULL, 1, '2016-05-19 16:12:38', 0);

--
-- Dumping data for table sys_user_info
--

-- Table springbootadmin.sys_user_info does not contain any data (it is empty)

--
-- Dumping data for table sys_user_role
--

-- Table springbootadmin.sys_user_role does not contain any data (it is empty)

--
-- Enable foreign keys
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;