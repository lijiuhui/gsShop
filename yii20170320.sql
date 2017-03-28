/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : yii

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-03-20 09:33:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_admin
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE `tb_admin` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '名字',
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `tel` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '电话',
  `modify_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='管理员信息表';

-- ----------------------------
-- Table structure for tb_admin_group
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin_group`;
CREATE TABLE `tb_admin_group` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` int(10) NOT NULL COMMENT '父组ID',
  `group_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户组名称',
  `modify_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户组表';

-- ----------------------------
-- Table structure for tb_admin_local_auth
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin_local_auth`;
CREATE TABLE `tb_admin_local_auth` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) NOT NULL COMMENT 'Admin ID',
  `auth_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '登录名',
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '登录密码',
  `modify_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='管理员认证表';

-- ----------------------------
-- Table structure for tb_admin_token
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin_token`;
CREATE TABLE `tb_admin_token` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) NOT NULL COMMENT '管理员ID',
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'token',
  `expires_time` int(10) NOT NULL COMMENT '过期时间(s为最小单位)',
  `modify_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Admin Token 表';

-- ----------------------------
-- Table structure for tb_product_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_product_category`;
CREATE TABLE `tb_product_category` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '父节点ID',
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '分类名称',
  `level` tinyint(1) NOT NULL DEFAULT '0' COMMENT '分类等级(0为第一级...)',
  `sort_no` tinyint(6) NOT NULL DEFAULT '0' COMMENT '排序号',
  `modify_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='产品分类表';

-- ----------------------------
-- Table structure for tb_product_resource
-- ----------------------------
DROP TABLE IF EXISTS `tb_product_resource`;
CREATE TABLE `tb_product_resource` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '资源ID',
  `resource_uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '图片地址',
  `resource_location` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '图片位置(前缀)',
  `is_main` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否缩略图(0不是,1是)',
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '生成时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='产品图片表';

-- ----------------------------
-- Table structure for tb_product_supplier
-- ----------------------------
DROP TABLE IF EXISTS `tb_product_supplier`;
CREATE TABLE `tb_product_supplier` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '供应商ID',
  `supplier_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '供应商名称',
  `describe` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '描述',
  `logo_uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Logo图标地址',
  `state` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'enabled' COMMENT '启用状态',
  `modify_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='产品供应商表';

-- ----------------------------
-- Table structure for tb_rbac_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_rbac_menu`;
CREATE TABLE `tb_rbac_menu` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '父节点ID',
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '菜单名称',
  `menu_url` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `modify_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='菜单表';

-- ----------------------------
-- Table structure for tb_rbac_operation
-- ----------------------------
DROP TABLE IF EXISTS `tb_rbac_operation`;
CREATE TABLE `tb_rbac_operation` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '操作ID',
  `pid` int(10) NOT NULL COMMENT '父操作ID',
  `op_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '操作名称',
  `op_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '操作请求URL',
  `modify_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='功能操作表';

-- ----------------------------
-- Table structure for tb_rbac_power
-- ----------------------------
DROP TABLE IF EXISTS `tb_rbac_power`;
CREATE TABLE `tb_rbac_power` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `power_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '权限类型(such:MENU.OPERATION.FILE.ELEMENT...)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='权限表';

-- ----------------------------
-- Table structure for tb_rbac_relate_admin_group
-- ----------------------------
DROP TABLE IF EXISTS `tb_rbac_relate_admin_group`;
CREATE TABLE `tb_rbac_relate_admin_group` (
  `group_id` int(10) NOT NULL COMMENT '用户组ID',
  `admin_id` int(10) NOT NULL COMMENT '管理员ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='管理员组与管理员关联表';

-- ----------------------------
-- Table structure for tb_rbac_relate_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_rbac_relate_admin_role`;
CREATE TABLE `tb_rbac_relate_admin_role` (
  `admin_id` int(10) NOT NULL COMMENT '管理员ID',
  `role_id` int(10) NOT NULL COMMENT '角色ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='管理员关联角色表';

-- ----------------------------
-- Table structure for tb_rbac_relate_group_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_rbac_relate_group_role`;
CREATE TABLE `tb_rbac_relate_group_role` (
  `group_id` int(10) NOT NULL,
  `role_id` int(10) NOT NULL COMMENT '角色ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='管理员组关联角色表';

-- ----------------------------
-- Table structure for tb_rbac_relate_power_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_rbac_relate_power_menu`;
CREATE TABLE `tb_rbac_relate_power_menu` (
  `power_id` int(10) NOT NULL COMMENT '权限ID',
  `menu_id` int(10) NOT NULL COMMENT '菜单ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='权限菜单关联表';

-- ----------------------------
-- Table structure for tb_rbac_relate_power_operation
-- ----------------------------
DROP TABLE IF EXISTS `tb_rbac_relate_power_operation`;
CREATE TABLE `tb_rbac_relate_power_operation` (
  `power_id` int(10) NOT NULL COMMENT '权限ID',
  `operation_id` int(10) NOT NULL COMMENT '操作ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='权限操作关联表';

-- ----------------------------
-- Table structure for tb_rbac_relate_role_power
-- ----------------------------
DROP TABLE IF EXISTS `tb_rbac_relate_role_power`;
CREATE TABLE `tb_rbac_relate_role_power` (
  `role_id` int(10) NOT NULL COMMENT '角色ID',
  `power_id` int(10) NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='角色权限关联表';

-- ----------------------------
-- Table structure for tb_rbac_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_rbac_role`;
CREATE TABLE `tb_rbac_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_name` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `modify_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` datetime NOT NULL COMMENT '增加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='管理员角色表';

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '名字',
  `account` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '账户名',
  `tel` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `avatar` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '头像',
  `birth` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '生日',
  `modify_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '资料更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户资料表';

-- ----------------------------
-- Table structure for tb_user_local_auth
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_local_auth`;
CREATE TABLE `tb_user_local_auth` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL COMMENT '用户ID',
  `auth_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '登录名',
  `password` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密码',
  `modify_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='默认认证登录表';

-- ----------------------------
-- Table structure for tb_user_other_auth
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_other_auth`;
CREATE TABLE `tb_user_other_auth` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL COMMENT '用户ID',
  `auth_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '认证名称 (QQ,Weibo,FaceBook,Github...)',
  `auth_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '认证ID',
  `oauth_access_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'access_token',
  `oauth_expires` int(10) NOT NULL COMMENT '过期时间(以s为最小单位)',
  `c` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='三方登录认证表';

-- ----------------------------
-- Table structure for tb_user_token
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_token`;
CREATE TABLE `tb_user_token` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(10) NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户token',
  `expires_time` int(10) NOT NULL COMMENT '过期时间(以s为最小单位)',
  `modify_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='API认证表';
SET FOREIGN_KEY_CHECKS=1;
