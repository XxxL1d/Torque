-- ----------------------------
-- 创建分库的数据库
-- ----------------------------
CREATE DATABASE IF NOT EXISTS `ry_vue_0` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
CREATE DATABASE IF NOT EXISTS `ry_vue_1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
CREATE DATABASE IF NOT EXISTS `ry_vue_2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- ----------------------------
-- 创建基础表（按季度分表）
-- ----------------------------
-- 在每个数据库中创建2020年到2024年共20个季度表
-- 使用USE语句切换数据库

-- 数据库0的表
USE `ry_vue_0`;

-- 2020年的四个季度
CREATE TABLE IF NOT EXISTS `torque_data_2020_1` (
  `data_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '数据ID',
  `sensor_id` bigint(20) NOT NULL COMMENT '传感器ID',
  `device_id` bigint(20) DEFAULT NULL COMMENT '设备ID',
  `torque_value` decimal(10,2) NOT NULL COMMENT '扭矩值',
  `torque_unit` varchar(10) NOT NULL DEFAULT 'N·m' COMMENT '扭矩单位',
  `rpm` decimal(10,2) DEFAULT NULL COMMENT '转速',
  `temperature` decimal(5,2) DEFAULT NULL COMMENT '温度',
  `data_time` datetime NOT NULL COMMENT '数据时间',
  `data_quality` tinyint(1) DEFAULT '1' COMMENT '数据质量（0异常 1正常）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`data_id`),
  KEY `idx_sensor_id` (`sensor_id`),
  KEY `idx_device_id` (`device_id`),
  KEY `idx_data_time` (`data_time`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='扭矩数据记录表-2020年第1季度';

CREATE TABLE IF NOT EXISTS `torque_data_2020_2` LIKE `torque_data_2020_1`;
ALTER TABLE `torque_data_2020_2` COMMENT '扭矩数据记录表-2020年第2季度';

CREATE TABLE IF NOT EXISTS `torque_data_2020_3` LIKE `torque_data_2020_1`;
ALTER TABLE `torque_data_2020_3` COMMENT '扭矩数据记录表-2020年第3季度';

CREATE TABLE IF NOT EXISTS `torque_data_2020_4` LIKE `torque_data_2020_1`;
ALTER TABLE `torque_data_2020_4` COMMENT '扭矩数据记录表-2020年第4季度';

-- 2021年的四个季度
CREATE TABLE IF NOT EXISTS `torque_data_2021_1` LIKE `torque_data_2020_1`;
ALTER TABLE `torque_data_2021_1` COMMENT '扭矩数据记录表-2021年第1季度';

CREATE TABLE IF NOT EXISTS `torque_data_2021_2` LIKE `torque_data_2020_1`;
ALTER TABLE `torque_data_2021_2` COMMENT '扭矩数据记录表-2021年第2季度';

CREATE TABLE IF NOT EXISTS `torque_data_2021_3` LIKE `torque_data_2020_1`;
ALTER TABLE `torque_data_2021_3` COMMENT '扭矩数据记录表-2021年第3季度';

CREATE TABLE IF NOT EXISTS `torque_data_2021_4` LIKE `torque_data_2020_1`;
ALTER TABLE `torque_data_2021_4` COMMENT '扭矩数据记录表-2021年第4季度';

-- 2022年的四个季度
CREATE TABLE IF NOT EXISTS `torque_data_2022_1` LIKE `torque_data_2020_1`;
ALTER TABLE `torque_data_2022_1` COMMENT '扭矩数据记录表-2022年第1季度';

CREATE TABLE IF NOT EXISTS `torque_data_2022_2` LIKE `torque_data_2020_1`;
ALTER TABLE `torque_data_2022_2` COMMENT '扭矩数据记录表-2022年第2季度';

CREATE TABLE IF NOT EXISTS `torque_data_2022_3` LIKE `torque_data_2020_1`;
ALTER TABLE `torque_data_2022_3` COMMENT '扭矩数据记录表-2022年第3季度';

CREATE TABLE IF NOT EXISTS `torque_data_2022_4` LIKE `torque_data_2020_1`;
ALTER TABLE `torque_data_2022_4` COMMENT '扭矩数据记录表-2022年第4季度';

-- 2023年的四个季度
CREATE TABLE IF NOT EXISTS `torque_data_2023_1` LIKE `torque_data_2020_1`;
ALTER TABLE `torque_data_2023_1` COMMENT '扭矩数据记录表-2023年第1季度';

CREATE TABLE IF NOT EXISTS `torque_data_2023_2` LIKE `torque_data_2020_1`;
ALTER TABLE `torque_data_2023_2` COMMENT '扭矩数据记录表-2023年第2季度';

CREATE TABLE IF NOT EXISTS `torque_data_2023_3` LIKE `torque_data_2020_1`;
ALTER TABLE `torque_data_2023_3` COMMENT '扭矩数据记录表-2023年第3季度';

CREATE TABLE IF NOT EXISTS `torque_data_2023_4` LIKE `torque_data_2020_1`;
ALTER TABLE `torque_data_2023_4` COMMENT '扭矩数据记录表-2023年第4季度';

-- 2024年的四个季度
CREATE TABLE IF NOT EXISTS `torque_data_2024_1` LIKE `torque_data_2020_1`;
ALTER TABLE `torque_data_2024_1` COMMENT '扭矩数据记录表-2024年第1季度';

CREATE TABLE IF NOT EXISTS `torque_data_2024_2` LIKE `torque_data_2020_1`;
ALTER TABLE `torque_data_2024_2` COMMENT '扭矩数据记录表-2024年第2季度';

CREATE TABLE IF NOT EXISTS `torque_data_2024_3` LIKE `torque_data_2020_1`;
ALTER TABLE `torque_data_2024_3` COMMENT '扭矩数据记录表-2024年第3季度';

CREATE TABLE IF NOT EXISTS `torque_data_2024_4` LIKE `torque_data_2020_1`;
ALTER TABLE `torque_data_2024_4` COMMENT '扭矩数据记录表-2024年第4季度';

-- 数据库1的表
USE `ry_vue_1`;

-- 创建同样的表结构
CREATE TABLE IF NOT EXISTS `torque_data_2020_1` (
  `data_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '数据ID',
  `sensor_id` bigint(20) NOT NULL COMMENT '传感器ID',
  `device_id` bigint(20) DEFAULT NULL COMMENT '设备ID',
  `torque_value` decimal(10,2) NOT NULL COMMENT '扭矩值',
  `torque_unit` varchar(10) NOT NULL DEFAULT 'N·m' COMMENT '扭矩单位',
  `rpm` decimal(10,2) DEFAULT NULL COMMENT '转速',
  `temperature` decimal(5,2) DEFAULT NULL COMMENT '温度',
  `data_time` datetime NOT NULL COMMENT '数据时间',
  `data_quality` tinyint(1) DEFAULT '1' COMMENT '数据质量（0异常 1正常）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`data_id`),
  KEY `idx_sensor_id` (`sensor_id`),
  KEY `idx_device_id` (`device_id`),
  KEY `idx_data_time` (`data_time`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='扭矩数据记录表-2020年第1季度';

-- 重复创建所有季度表
CREATE TABLE IF NOT EXISTS `torque_data_2020_2` LIKE `torque_data_2020_1`;
ALTER TABLE `torque_data_2020_2` COMMENT '扭矩数据记录表-2020年第2季度';
-- ... 重复创建2020_3到2024_4的表结构，与上面相同 ...

-- 数据库2的表
USE `ry_vue_2`;

-- 创建同样的表结构
CREATE TABLE IF NOT EXISTS `torque_data_2020_1` (
  `data_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '数据ID',
  `sensor_id` bigint(20) NOT NULL COMMENT '传感器ID',
  `device_id` bigint(20) DEFAULT NULL COMMENT '设备ID',
  `torque_value` decimal(10,2) NOT NULL COMMENT '扭矩值',
  `torque_unit` varchar(10) NOT NULL DEFAULT 'N·m' COMMENT '扭矩单位',
  `rpm` decimal(10,2) DEFAULT NULL COMMENT '转速',
  `temperature` decimal(5,2) DEFAULT NULL COMMENT '温度',
  `data_time` datetime NOT NULL COMMENT '数据时间',
  `data_quality` tinyint(1) DEFAULT '1' COMMENT '数据质量（0异常 1正常）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`data_id`),
  KEY `idx_sensor_id` (`sensor_id`),
  KEY `idx_device_id` (`device_id`),
  KEY `idx_data_time` (`data_time`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='扭矩数据记录表-2020年第1季度';

-- 重复创建所有季度表
CREATE TABLE IF NOT EXISTS `torque_data_2020_2` LIKE `torque_data_2020_1`;
ALTER TABLE `torque_data_2020_2` COMMENT '扭矩数据记录表-2020年第2季度';
-- ... 重复创建2020_3到2024_4的表结构，与上面相同 ... 