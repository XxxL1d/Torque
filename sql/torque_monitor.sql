-- ----------------------------
-- 1. 传感器管理表
-- ----------------------------
DROP TABLE IF EXISTS `sensor_info`;
CREATE TABLE `sensor_info` (
  `sensor_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '传感器ID',
  `sensor_name` varchar(50) NOT NULL COMMENT '传感器名称',
  `sensor_type` varchar(20) NOT NULL COMMENT '传感器类型',
  `model_number` varchar(50) DEFAULT NULL COMMENT '型号',
  `manufacturer` varchar(100) DEFAULT NULL COMMENT '制造商',
  `measurement_range` varchar(50) DEFAULT NULL COMMENT '测量范围',
  `accuracy` varchar(20) DEFAULT NULL COMMENT '精度',
  `protocol_type` varchar(30) DEFAULT NULL COMMENT '协议类型',
  `connection_params` varchar(500) DEFAULT NULL COMMENT '连接参数(JSON格式)',
  `installation_location` varchar(100) DEFAULT NULL COMMENT '安装位置',
  `installation_date` datetime DEFAULT NULL COMMENT '安装日期',
  `calibration_date` datetime DEFAULT NULL COMMENT '最近校准日期',
  `next_calibration_date` datetime DEFAULT NULL COMMENT '下次校准日期',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`sensor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='传感器信息表';

-- ----------------------------
-- 2. 扭矩数据记录表
-- ----------------------------
DROP TABLE IF EXISTS `torque_data`;
CREATE TABLE `torque_data` (
  `data_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '数据ID',
  `sensor_id` bigint(20) NOT NULL COMMENT '传感器ID',
  `device_id` bigint(20) DEFAULT NULL COMMENT '设备ID',
  `torque_value` decimal(10,2) NOT NULL COMMENT '扭矩值',
  `torque_unit` varchar(10) NOT NULL COMMENT '扭矩单位',
  `rpm` decimal(10,2) DEFAULT NULL COMMENT '转速',
  `temperature` decimal(5,2) DEFAULT NULL COMMENT '温度',
  `data_time` datetime NOT NULL COMMENT '数据时间',
  `data_quality` tinyint(1) DEFAULT '1' COMMENT '数据质量（0异常 1正常）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`data_id`),
  KEY `idx_sensor_id` (`sensor_id`),
  KEY `idx_device_id` (`device_id`),
  KEY `idx_data_time` (`data_time`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='扭矩数据记录表';

-- ----------------------------
-- 3. 设备信息表
-- ----------------------------
DROP TABLE IF EXISTS `device_info`;
CREATE TABLE `device_info` (
  `device_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '设备ID',
  `device_name` varchar(100) NOT NULL COMMENT '设备名称',
  `device_type` varchar(50) NOT NULL COMMENT '设备类型',
  `model_number` varchar(50) DEFAULT NULL COMMENT '型号',
  `manufacturer` varchar(100) DEFAULT NULL COMMENT '制造商',
  `production_date` datetime DEFAULT NULL COMMENT '出厂日期',
  `installation_location` varchar(100) DEFAULT NULL COMMENT '安装位置',
  `department` varchar(50) DEFAULT NULL COMMENT '所属部门',
  `responsible_person` varchar(50) DEFAULT NULL COMMENT '责任人',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态（0正常运行 1停机维护 2故障）',
  `maintenance_cycle` int(11) DEFAULT NULL COMMENT '维护周期(天)',
  `last_maintenance_date` datetime DEFAULT NULL COMMENT '上次维护日期',
  `next_maintenance_date` datetime DEFAULT NULL COMMENT '下次维护日期',
  `max_threshold` decimal(10,2) DEFAULT '100.00' COMMENT '最大安全阈值',
  `min_threshold` decimal(10,2) DEFAULT '0.00' COMMENT '最小安全阈值',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`device_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='设备信息表';

-- ----------------------------
-- 4. 传感器与设备关联表
-- ----------------------------
DROP TABLE IF EXISTS `sensor_device_relation`;
CREATE TABLE `sensor_device_relation` (
  `relation_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '关联ID',
  `sensor_id` bigint(20) NOT NULL COMMENT '传感器ID',
  `device_id` bigint(20) NOT NULL COMMENT '设备ID',
  `mounting_position` varchar(100) DEFAULT NULL COMMENT '安装位置',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`relation_id`),
  UNIQUE KEY `uk_sensor_device` (`sensor_id`,`device_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='传感器设备关联表';

-- ----------------------------
-- 5. 报警规则表
-- ----------------------------
DROP TABLE IF EXISTS `alarm_rule`;
CREATE TABLE `alarm_rule` (
  `rule_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '规则ID',
  `rule_name` varchar(100) NOT NULL COMMENT '规则名称',
  `rule_type` tinyint(1) NOT NULL COMMENT '规则类型（1阈值 2波动 3趋势）',
  `sensor_id` bigint(20) DEFAULT NULL COMMENT '传感器ID',
  `device_id` bigint(20) DEFAULT NULL COMMENT '设备ID',
  `threshold_value` decimal(10,2) DEFAULT NULL COMMENT '阈值',
  `comparison_operator` varchar(10) DEFAULT NULL COMMENT '比较运算符',
  `duration_seconds` int(11) DEFAULT NULL COMMENT '持续时间(秒)',
  `alarm_level` tinyint(1) NOT NULL COMMENT '报警级别（1一般 2重要 3紧急）',
  `is_enabled` tinyint(1) DEFAULT '1' COMMENT '是否启用（0禁用 1启用）',
  `trigger_condition` varchar(500) DEFAULT NULL COMMENT '触发条件(JSON格式)',
  `notification_method` varchar(50) DEFAULT NULL COMMENT '通知方式（email,sms,app）',
  `notification_target` varchar(500) DEFAULT NULL COMMENT '通知目标(JSON格式)',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`rule_id`),
  KEY `idx_sensor_id` (`sensor_id`),
  KEY `idx_device_id` (`device_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='报警规则表';

-- ----------------------------
-- 6. 报警记录表
-- ----------------------------
DROP TABLE IF EXISTS `alarm_record`;
CREATE TABLE `alarm_record` (
  `alarm_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '报警ID',
  `rule_id` bigint(20) NOT NULL COMMENT '规则ID',
  `sensor_id` bigint(20) DEFAULT NULL COMMENT '传感器ID',
  `device_id` bigint(20) DEFAULT NULL COMMENT '设备ID',
  `alarm_value` decimal(10,2) DEFAULT NULL COMMENT '报警值',
  `alarm_time` datetime NOT NULL COMMENT '报警时间',
  `alarm_level` tinyint(1) NOT NULL COMMENT '报警级别（1一般 2重要 3紧急）',
  `alarm_status` tinyint(1) DEFAULT '0' COMMENT '处理状态（0未处理 1已处理 2已忽略）',
  `process_time` datetime DEFAULT NULL COMMENT '处理时间',
  `process_by` varchar(64) DEFAULT NULL COMMENT '处理人',
  `process_method` varchar(500) DEFAULT NULL COMMENT '处理方法',
  `process_result` varchar(500) DEFAULT NULL COMMENT '处理结果',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`alarm_id`),
  KEY `idx_rule_id` (`rule_id`),
  KEY `idx_sensor_id` (`sensor_id`),
  KEY `idx_device_id` (`device_id`),
  KEY `idx_alarm_time` (`alarm_time`),
  KEY `idx_alarm_status` (`alarm_status`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='报警记录表';

-- ----------------------------
-- 7. 扭矩数据分析报告表
-- ----------------------------
DROP TABLE IF EXISTS `torque_analysis_report`;
CREATE TABLE `torque_analysis_report` (
  `report_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '报告ID',
  `report_name` varchar(100) NOT NULL COMMENT '报告名称',
  `report_type` varchar(50) NOT NULL COMMENT '报告类型',
  `sensor_id` bigint(20) DEFAULT NULL COMMENT '传感器ID',
  `device_id` bigint(20) DEFAULT NULL COMMENT '设备ID',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `max_value` decimal(10,2) DEFAULT NULL COMMENT '最大值',
  `min_value` decimal(10,2) DEFAULT NULL COMMENT '最小值',
  `avg_value` decimal(10,2) DEFAULT NULL COMMENT '平均值',
  `std_deviation` decimal(10,4) DEFAULT NULL COMMENT '标准差',
  `analysis_result` text COMMENT '分析结果',
  `report_status` tinyint(1) DEFAULT '0' COMMENT '状态（0生成中 1已完成）',
  `report_url` varchar(255) DEFAULT NULL COMMENT '报告URL',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`report_id`),
  KEY `idx_sensor_id` (`sensor_id`),
  KEY `idx_device_id` (`device_id`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='扭矩数据分析报告表';

-- ----------------------------
-- 8. 数据采集配置表
-- ----------------------------
DROP TABLE IF EXISTS `data_collection_config`;
CREATE TABLE `data_collection_config` (
  `config_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `config_name` varchar(100) NOT NULL COMMENT '配置名称',
  `sensor_id` bigint(20) NOT NULL COMMENT '传感器ID',
  `sampling_interval` int(11) NOT NULL COMMENT '采样间隔(ms)',
  `sampling_method` varchar(20) DEFAULT 'REAL_TIME' COMMENT '采样方式(REAL_TIME,AVERAGE,MAX,MIN)',
  `protocol_config` varchar(1000) DEFAULT NULL COMMENT '协议配置(JSON格式)',
  `preprocessing_config` varchar(1000) DEFAULT NULL COMMENT '预处理配置(JSON格式)',
  `is_enabled` tinyint(1) DEFAULT '1' COMMENT '是否启用（0禁用 1启用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`config_id`),
  KEY `idx_sensor_id` (`sensor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='数据采集配置表';

-- ----------------------------
-- 9. 维护记录表
-- ----------------------------
DROP TABLE IF EXISTS `maintenance_record`;
CREATE TABLE `maintenance_record` (
  `record_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `device_id` bigint(20) DEFAULT NULL COMMENT '设备ID',
  `sensor_id` bigint(20) DEFAULT NULL COMMENT '传感器ID',
  `maintenance_type` varchar(50) NOT NULL COMMENT '维护类型',
  `maintenance_date` datetime NOT NULL COMMENT '维护日期',
  `maintenance_person` varchar(50) NOT NULL COMMENT '维护人员',
  `maintenance_content` text NOT NULL COMMENT '维护内容',
  `maintenance_result` varchar(500) DEFAULT NULL COMMENT '维护结果',
  `next_maintenance_date` datetime DEFAULT NULL COMMENT '下次维护日期',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`record_id`),
  KEY `idx_device_id` (`device_id`),
  KEY `idx_sensor_id` (`sensor_id`),
  KEY `idx_maintenance_date` (`maintenance_date`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='维护记录表';

-- ----------------------------
-- 10. 模拟数据配置表
-- ----------------------------
DROP TABLE IF EXISTS `simulation_config`;
CREATE TABLE `simulation_config` (
  `config_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `config_name` varchar(100) NOT NULL COMMENT '配置名称',
  `sensor_id` bigint(20) DEFAULT NULL COMMENT '关联传感器ID',
  `data_type` varchar(20) NOT NULL COMMENT '数据类型',
  `min_value` decimal(10,2) DEFAULT NULL COMMENT '最小值',
  `max_value` decimal(10,2) DEFAULT NULL COMMENT '最大值',
  `interval_ms` int(11) DEFAULT NULL COMMENT '生成间隔(ms)',
  `fluctuation_ratio` decimal(5,2) DEFAULT NULL COMMENT '波动率',
  `noise_ratio` decimal(5,2) DEFAULT NULL COMMENT '噪声率',
  `value_pattern` varchar(20) DEFAULT 'RANDOM' COMMENT '值模式(RANDOM,SINE,STEP,CUSTOM)',
  `custom_pattern` text COMMENT '自定义模式配置',
  `is_enabled` tinyint(1) DEFAULT '1' COMMENT '是否启用（0禁用 1启用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`config_id`),
  KEY `idx_sensor_id` (`sensor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='模拟数据配置表';


-- 添加扭矩监控主菜单（update_time设置为NULL）
INSERT INTO sys_menu
VALUES (4, '扭矩监控', 0, 4, 'torque', '', '', 1, 0, 'M', '0', '0', '', 'dashboard', 'admin', NOW(), NULL, NULL,
        '扭矩监控系统');

-- 添加子菜单
INSERT INTO sys_menu
VALUES (400, '传感器管理', 4, 1, 'sensor', 'torque/sensor/index', '', 1, 0, 'C', '0', '0', 'torque:sensor:list',
        'validCode', 'admin', NOW(), NULL, NULL, '传感器管理菜单');
INSERT INTO sys_menu
VALUES (401, '设备信息', 4, 2, 'device', 'torque/device/index', '', 1, 0, 'C', '0', '0', 'torque:device:list', 'server',
        'admin', NOW(), NULL, NULL, '设备信息菜单');
INSERT INTO sys_menu
VALUES (402, '扭矩数据', 4, 3, 'data', 'torque/data/index', '', 1, 0, 'C', '0', '0', 'torque:data:list', 'chart',
        'admin', NOW(), NULL, NULL, '扭矩数据菜单');
INSERT INTO sys_menu
VALUES (403, '扭矩分析', 4, 4, 'analysis', 'torque/analysis/index', '', 1, 0, 'C', '0', '0', 'torque:analysis:list',
        'monitor', 'admin', NOW(), NULL, NULL, '扭矩分析菜单');

-- 权限管理-目录
-- 为传感器管理添加功能按钮
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible,
                      status, perms, icon, create_by, create_time)
VALUES (4002, '传感器查询', 400, 1, '#', '', 1, 0, 'F', '0', '0', 'torque:sensor:query', '#', 'admin', NOW());

INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible,
                      status, perms, icon, create_by, create_time)
VALUES (4003, '传感器新增', 400, 2, '#', '', 1, 0, 'F', '0', '0', 'torque:sensor:add', '#', 'admin', NOW());

INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible,
                      status, perms, icon, create_by, create_time)
VALUES (4004, '传感器修改', 400, 3, '#', '', 1, 0, 'F', '0', '0', 'torque:sensor:edit', '#', 'admin', NOW());

INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible,
                      status, perms, icon, create_by, create_time)
VALUES (4005, '传感器删除', 400, 4, '#', '', 1, 0, 'F', '0', '0', 'torque:sensor:remove', '#', 'admin', NOW());

INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible,
                      status, perms, icon, create_by, create_time)
VALUES (4006, '传感器导出', 400, 5, '#', '', 1, 0, 'F', '0', '0', 'torque:sensor:export', '#', 'admin', NOW());

-- 为设备管理添加功能按钮
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible,
                      status, perms, icon, create_by, create_time)
VALUES (4008, '设备查询', 401, 1, '#', '', 1, 0, 'F', '0', '0', 'torque:device:query', '#', 'admin', NOW());

INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible,
                      status, perms, icon, create_by, create_time)
VALUES (4009, '设备新增', 401, 2, '#', '', 1, 0, 'F', '0', '0', 'torque:device:add', '#', 'admin', NOW());

INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible,
                      status, perms, icon, create_by, create_time)
VALUES (4010, '设备修改', 401, 3, '#', '', 1, 0, 'F', '0', '0', 'torque:device:edit', '#', 'admin', NOW());

INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible,
                      status, perms, icon, create_by, create_time)
VALUES (4011, '设备删除', 401, 4, '#', '', 1, 0, 'F', '0', '0', 'torque:device:remove', '#', 'admin', NOW());

INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible,
                      status, perms, icon, create_by, create_time)
VALUES (4012, '设备导出', 401, 5, '#', '', 1, 0, 'F', '0', '0', 'torque:device:export', '#', 'admin', NOW());

-- 为扭矩数据添加功能按钮
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible,
                      status, perms, icon, create_by, create_time)
VALUES (4014, '数据查询', 402, 1, '#', '', 1, 0, 'F', '0', '0', 'torque:data:query', '#', 'admin', NOW());

INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible,
                      status, perms, icon, create_by, create_time)
VALUES (4015, '数据新增', 402, 2, '#', '', 1, 0, 'F', '0', '0', 'torque:data:add', '#', 'admin', NOW());

INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible,
                      status, perms, icon, create_by, create_time)
VALUES (4016, '数据修改', 402, 3, '#', '', 1, 0, 'F', '0', '0', 'torque:data:edit', '#', 'admin', NOW());

INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible,
                      status, perms, icon, create_by, create_time)
VALUES (4017, '数据删除', 402, 4, '#', '', 1, 0, 'F', '0', '0', 'torque:data:remove', '#', 'admin', NOW());

INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible,
                      status, perms, icon, create_by, create_time)
VALUES (4018, '数据导出', 402, 5, '#', '', 1, 0, 'F', '0', '0', 'torque:data:export', '#', 'admin', NOW());

-- 为扭矩分析添加功能按钮
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible,
                      status, perms, icon, create_by, create_time)
VALUES (4020, '分析查询', 403, 1, '#', '', 1, 0, 'F', '0', '0', 'torque:analysis:query', '#', 'admin', NOW());