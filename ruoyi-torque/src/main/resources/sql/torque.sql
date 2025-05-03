-- ----------------------------
-- 1. 传感器信息表
-- ----------------------------
create table if not exists sensor_info
(
    sensor_id             bigint(20)  not null auto_increment comment '传感器ID',
    sensor_name           varchar(64) not null comment '传感器名称',
    sensor_type           varchar(20) not null comment '传感器类型',
    model_number          varchar(50) comment '型号',
    manufacturer          varchar(100) comment '制造商',
    measurement_range     varchar(50) comment '测量范围',
    accuracy              varchar(50) comment '精度',
    protocol_type         varchar(20) comment '协议类型',
    connection_params     varchar(500) comment '连接参数(JSON格式)',
    installation_location varchar(200) comment '安装位置',
    installation_date     date comment '安装日期',
    calibration_date      date comment '最近校准日期',
    next_calibration_date date comment '下次校准日期',
    status                char(1)     default '0' comment '状态（0正常 1停用）',
    remark                varchar(500) comment '备注',
    create_by             varchar(64) default '' comment '创建者',
    create_time           datetime comment '创建时间',
    update_by             varchar(64) default '' comment '更新者',
    update_time           datetime comment '更新时间',
    primary key (sensor_id)
) engine = innodb
  auto_increment = 200 comment = '传感器信息表';

-- ----------------------------
-- 2. 设备信息表
-- ----------------------------
create table if not exists device_info
(
    device_id             bigint(20)  not null auto_increment comment '设备ID',
    device_name           varchar(64) not null comment '设备名称',
    device_type           varchar(20) not null comment '设备类型',
    model_number          varchar(50) comment '型号',
    manufacturer          varchar(100) comment '制造商',
    production_date       date comment '出厂日期',
    installation_location varchar(200) comment '安装位置',
    department            varchar(50) comment '所属部门',
    responsible_person    varchar(50) comment '责任人',
    status                char(1)     default '0' comment '状态（0正常运行 1停机维护 2故障）',
    maintenance_cycle     int(10) comment '维护周期(天)',
    last_maintenance_date date comment '上次维护日期',
    next_maintenance_date date comment '下次维护日期',
    remark                varchar(500) comment '备注',
    create_by             varchar(64) default '' comment '创建者',
    create_time           datetime comment '创建时间',
    update_by             varchar(64) default '' comment '更新者',
    update_time           datetime comment '更新时间',
    primary key (device_id)
) engine = innodb
  auto_increment = 100 comment = '设备信息表';

-- ----------------------------
-- 3. 扭矩数据记录表
-- ----------------------------
create table if not exists torque_data
(
    data_id      bigint(20)     not null auto_increment comment '数据ID',
    sensor_id    bigint(20)     not null comment '传感器ID',
    device_id    bigint(20)     not null comment '设备ID',
    torque_value decimal(12, 4) not null comment '扭矩值',
    torque_unit  varchar(10) default 'N·m' comment '扭矩单位',
    rpm          decimal(10, 2) comment '转速',
    temperature  decimal(10, 2) comment '温度',
    data_time    datetime       not null comment '数据时间',
    data_quality char(1)     default '1' comment '数据质量（0异常 1正常）',
    create_time  datetime comment '创建时间',
    primary key (data_id),
    index idx_sensor_id (sensor_id),
    index idx_device_id (device_id),
    index idx_data_time (data_time)
) engine = innodb
  auto_increment = 1 comment = '扭矩数据记录表';

-- ----------------------------
-- 4. 扭矩模块菜单
-- ----------------------------
-- 检查是否已存在扭矩监控菜单
SET @torque_menu_id = (SELECT menu_id
                       FROM sys_menu
                       WHERE menu_name = '扭矩监控'
                         AND parent_id = 0
                       LIMIT 1);

-- 如果不存在，则插入扭矩监控菜单
SET @torque_menu_insert =
        CONCAT("INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES ('扭矩监控', '0', '50', 'torque', null, 1, 0, 'M', '0', '0', '', 'chart', 'admin', SYSDATE(), '', null, '扭矩监控数据管理集成平台')");

SET @torque_menu_select = CONCAT("SET @torque_menu_id = LAST_INSERT_ID()");

SET @sql_execute = IF(@torque_menu_id IS NULL, CONCAT(@torque_menu_insert, ";", @torque_menu_select),
                      "SELECT 'Torque menu already exists' as message");

PREPARE stmt FROM @sql_execute;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 插入传感器管理菜单
INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status,
                      perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES ('传感器管理', @torque_menu_id, 1, 'sensor', 'torque/sensor/index', 1, 0, 'C', '0', '0', 'torque:sensor:list',
        'component', 'admin', SYSDATE(), '', null, '传感器信息菜单');

-- 获取传感器管理菜单ID
SET @sensor_menu_id = LAST_INSERT_ID();

-- 传感器按钮
INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status,
                      perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES ('传感器查询', @sensor_menu_id, 1, '#', '', 1, 0, 'F', '0', '0', 'torque:sensor:query', '#', 'admin', SYSDATE(),
        '', null, '');

INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status,
                      perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES ('传感器新增', @sensor_menu_id, 2, '#', '', 1, 0, 'F', '0', '0', 'torque:sensor:add', '#', 'admin', SYSDATE(),
        '', null, '');

INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status,
                      perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES ('传感器修改', @sensor_menu_id, 3, '#', '', 1, 0, 'F', '0', '0', 'torque:sensor:edit', '#', 'admin', SYSDATE(),
        '', null, '');

INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status,
                      perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES ('传感器删除', @sensor_menu_id, 4, '#', '', 1, 0, 'F', '0', '0', 'torque:sensor:remove', '#', 'admin', SYSDATE(),
        '', null, '');

INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status,
                      perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES ('传感器导出', @sensor_menu_id, 5, '#', '', 1, 0, 'F', '0', '0', 'torque:sensor:export', '#', 'admin', SYSDATE(),
        '', null, '');

-- 设备管理
INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status,
                      perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES ('设备管理', @torque_menu_id, 2, 'device', 'torque/device/index', 1, 0, 'C', '0', '0', 'torque:device:list',
        'server', 'admin', SYSDATE(), '', null, '设备信息菜单');

-- 扭矩数据
INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status,
                      perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES ('扭矩数据', @torque_menu_id, 3, 'torque_data', 'torque/data/index', 1, 0, 'C', '0', '0', 'torque:data:list',
        'chart', 'admin', SYSDATE(), '', null, '扭矩数据记录菜单');

-- 数据分析
INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status,
                      perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES ('数据分析', @torque_menu_id, 4, 'analysis', 'torque/analysis/index', 1, 0, 'C', '0', '0',
        'torque:analysis:list', 'monitor', 'admin', SYSDATE(), '', null, '扭矩数据分析菜单');
