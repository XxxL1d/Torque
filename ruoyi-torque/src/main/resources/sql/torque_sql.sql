-- 传感器信息表
CREATE TABLE IF NOT EXISTS `sensor_info`
(
    `sensor_id`             bigint(20)  NOT NULL AUTO_INCREMENT COMMENT '传感器ID',
    `sensor_name`           varchar(50) NOT NULL COMMENT '传感器名称',
    `sensor_type`           varchar(20)  DEFAULT NULL COMMENT '传感器类型',
    `model_number`          varchar(50)  DEFAULT NULL COMMENT '型号',
    `manufacturer`          varchar(100) DEFAULT NULL COMMENT '制造商',
    `measurement_range`     varchar(50)  DEFAULT NULL COMMENT '测量范围',
    `accuracy`              varchar(20)  DEFAULT NULL COMMENT '精度',
    `protocol_type`         varchar(20)  DEFAULT NULL COMMENT '协议类型',
    `connection_params`     varchar(500) DEFAULT NULL COMMENT '连接参数',
    `installation_location` varchar(100) DEFAULT NULL COMMENT '安装位置',
    `installation_date`     datetime     DEFAULT NULL COMMENT '安装日期',
    `calibration_date`      datetime     DEFAULT NULL COMMENT '校准日期',
    `next_calibration_date` datetime     DEFAULT NULL COMMENT '下次校准日期',
    `status`                char(1)      DEFAULT '0' COMMENT '状态（0正常 1停用）',
    `remark`                varchar(500) DEFAULT NULL COMMENT '备注',
    `create_by`             varchar(64)  DEFAULT '' COMMENT '创建者',
    `create_time`           datetime     DEFAULT NULL COMMENT '创建时间',
    `update_by`             varchar(64)  DEFAULT '' COMMENT '更新者',
    `update_time`           datetime     DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`sensor_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 100
  DEFAULT CHARSET = utf8mb4 COMMENT ='传感器信息表';

-- 设备信息表
CREATE TABLE IF NOT EXISTS `device_info`
(
    `device_id`             bigint(20)  NOT NULL AUTO_INCREMENT COMMENT '设备ID',
    `device_name`           varchar(50) NOT NULL COMMENT '设备名称',
    `device_type`           varchar(20)  DEFAULT NULL COMMENT '设备类型',
    `model_number`          varchar(50)  DEFAULT NULL COMMENT '型号',
    `manufacturer`          varchar(100) DEFAULT NULL COMMENT '制造商',
    `production_date`       datetime     DEFAULT NULL COMMENT '生产日期',
    `installation_location` varchar(100) DEFAULT NULL COMMENT '安装位置',
    `department`            varchar(50)  DEFAULT NULL COMMENT '所属部门',
    `responsible_person`    varchar(20)  DEFAULT NULL COMMENT '负责人',
    `status`                char(1)      DEFAULT '0' COMMENT '状态（0正常 1停用）',
    `maintenance_cycle`     int(11)      DEFAULT NULL COMMENT '维护周期(天)',
    `last_maintenance_date` datetime     DEFAULT NULL COMMENT '上次维护日期',
    `next_maintenance_date` datetime     DEFAULT NULL COMMENT '下次维护日期',
    `remark`                varchar(500) DEFAULT NULL COMMENT '备注',
    `create_by`             varchar(64)  DEFAULT '' COMMENT '创建者',
    `create_time`           datetime     DEFAULT NULL COMMENT '创建时间',
    `update_by`             varchar(64)  DEFAULT '' COMMENT '更新者',
    `update_time`           datetime     DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`device_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 100
  DEFAULT CHARSET = utf8mb4 COMMENT ='设备信息表';

-- 扭矩数据表
CREATE TABLE IF NOT EXISTS `torque_data`
(
    `data_id`      bigint(20) NOT NULL AUTO_INCREMENT COMMENT '数据ID',
    `sensor_id`    bigint(20)     DEFAULT NULL COMMENT '传感器ID',
    `device_id`    bigint(20)     DEFAULT NULL COMMENT '设备ID',
    `torque_value` decimal(10, 2) DEFAULT NULL COMMENT '扭矩值',
    `torque_unit`  varchar(10)    DEFAULT 'N·m' COMMENT '扭矩单位',
    `rpm`          int(11)        DEFAULT NULL COMMENT '转速',
    `temperature`  decimal(5, 2)  DEFAULT NULL COMMENT '温度',
    `data_time`    datetime       DEFAULT NULL COMMENT '数据时间',
    `data_quality` char(1)        DEFAULT '0' COMMENT '数据质量（0正常 1异常）',
    `status`       char(1)        DEFAULT '0' COMMENT '状态（0正常 1警告 2异常）',
    `create_time`  datetime       DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`data_id`),
    KEY `idx_sensor_id` (`sensor_id`),
    KEY `idx_device_id` (`device_id`),
    KEY `idx_data_time` (`data_time`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1000
  DEFAULT CHARSET = utf8mb4 COMMENT ='扭矩数据表';

-- 初始数据
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`,
                        `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`,
                        `update_time`, `remark`)
VALUES (4000, '扭矩监测', 0, 50, 'torque', 'Layout', 1, 0, 'M', '0', '0', '', 'chart', 'admin', now(), '', NULL,
        '扭矩监测菜单');

INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`,
                        `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`,
                        `update_time`, `remark`)
VALUES (4001, '传感器管理', 4000, 1, 'sensor', 'torque/sensor/index', 1, 0, 'C', '0', '0', 'torque:sensor:list', 'drag',
        'admin', now(), '', NULL, '传感器管理菜单');

INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`,
                        `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`,
                        `update_time`, `remark`)
VALUES (4002, '传感器查询', 4001, 1, '#', '', 1, 0, 'F', '0', '0', 'torque:sensor:query', '#', 'admin', now(), '', NULL,
        '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`,
                        `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`,
                        `update_time`, `remark`)
VALUES (4003, '传感器新增', 4001, 2, '#', '', 1, 0, 'F', '0', '0', 'torque:sensor:add', '#', 'admin', now(), '', NULL,
        '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`,
                        `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`,
                        `update_time`, `remark`)
VALUES (4004, '传感器修改', 4001, 3, '#', '', 1, 0, 'F', '0', '0', 'torque:sensor:edit', '#', 'admin', now(), '', NULL,
        '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`,
                        `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`,
                        `update_time`, `remark`)
VALUES (4005, '传感器删除', 4001, 4, '#', '', 1, 0, 'F', '0', '0', 'torque:sensor:remove', '#', 'admin', now(), '',
        NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`,
                        `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`,
                        `update_time`, `remark`)
VALUES (4006, '传感器导出', 4001, 5, '#', '', 1, 0, 'F', '0', '0', 'torque:sensor:export', '#', 'admin', now(), '',
        NULL, '');

INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`,
                        `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`,
                        `update_time`, `remark`)
VALUES (4007, '设备管理', 4000, 2, 'device', 'torque/device/index', 1, 0, 'C', '0', '0', 'torque:device:list', 'server',
        'admin', now(), '', NULL, '设备管理菜单');

INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`,
                        `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`,
                        `update_time`, `remark`)
VALUES (4008, '设备查询', 4007, 1, '#', '', 1, 0, 'F', '0', '0', 'torque:device:query', '#', 'admin', now(), '', NULL,
        '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`,
                        `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`,
                        `update_time`, `remark`)
VALUES (4009, '设备新增', 4007, 2, '#', '', 1, 0, 'F', '0', '0', 'torque:device:add', '#', 'admin', now(), '', NULL,
        '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`,
                        `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`,
                        `update_time`, `remark`)
VALUES (4010, '设备修改', 4007, 3, '#', '', 1, 0, 'F', '0', '0', 'torque:device:edit', '#', 'admin', now(), '', NULL,
        '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`,
                        `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`,
                        `update_time`, `remark`)
VALUES (4011, '设备删除', 4007, 4, '#', '', 1, 0, 'F', '0', '0', 'torque:device:remove', '#', 'admin', now(), '', NULL,
        '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`,
                        `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`,
                        `update_time`, `remark`)
VALUES (4012, '设备导出', 4007, 5, '#', '', 1, 0, 'F', '0', '0', 'torque:device:export', '#', 'admin', now(), '', NULL,
        '');

INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`,
                        `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`,
                        `update_time`, `remark`)
VALUES (4013, '扭矩数据', 4000, 3, 'data', 'torque/data/index', 1, 0, 'C', '0', '0', 'torque:data:list', 'monitor',
        'admin', now(), '', NULL, '扭矩数据菜单');

INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`,
                        `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`,
                        `update_time`, `remark`)
VALUES (4014, '数据查询', 4013, 1, '#', '', 1, 0, 'F', '0', '0', 'torque:data:query', '#', 'admin', now(), '', NULL,
        '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`,
                        `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`,
                        `update_time`, `remark`)
VALUES (4015, '数据新增', 4013, 2, '#', '', 1, 0, 'F', '0', '0', 'torque:data:add', '#', 'admin', now(), '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`,
                        `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`,
                        `update_time`, `remark`)
VALUES (4016, '数据修改', 4013, 3, '#', '', 1, 0, 'F', '0', '0', 'torque:data:edit', '#', 'admin', now(), '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`,
                        `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`,
                        `update_time`, `remark`)
VALUES (4017, '数据删除', 4013, 4, '#', '', 1, 0, 'F', '0', '0', 'torque:data:remove', '#', 'admin', now(), '', NULL,
        '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`,
                        `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`,
                        `update_time`, `remark`)
VALUES (4018, '数据导出', 4013, 5, '#', '', 1, 0, 'F', '0', '0', 'torque:data:export', '#', 'admin', now(), '', NULL,
        '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`,
                        `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`,
                        `update_time`, `remark`)
VALUES (4019, '数据分析', 4013, 6, '#', '', 1, 0, 'F', '0', '0', 'torque:data:analysis', '#', 'admin', now(), '', NULL,
        '');

-- 初始化角色菜单权限
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 4000);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 4001);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 4002);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 4003);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 4004);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 4005);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 4006);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 4007);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 4008);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 4009);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 4010);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 4011);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 4012);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 4013);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 4014);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 4015);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 4016);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 4017);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 4018);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES (2, 4019);
