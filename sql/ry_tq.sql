-- ----------------------------
-- 1、扭矩模块相关表
-- ----------------------------
create table device_info
(
    device_id             bigint auto_increment comment '设备ID'
        primary key,
    device_name           varchar(100)                  not null comment '设备名称',
    device_type           varchar(50)                   not null comment '设备类型',
    model_number          varchar(50)                   null comment '型号',
    manufacturer          varchar(100)                  null comment '制造商',
    production_date       datetime                      null comment '出厂日期',
    installation_location varchar(100)                  null comment '安装位置',
    department            varchar(50)                   null comment '所属部门',
    responsible_person    varchar(50)                   null comment '责任人',
    status                tinyint(1)     default 0      null comment '状态（0正常运行 1停机维护 2故障）',
    maintenance_cycle     int                           null comment '维护周期(天)',
    last_maintenance_date datetime                      null comment '上次维护日期',
    next_maintenance_date datetime                      null comment '下次维护日期',
    max_threshold         decimal(10, 2) default 100.00 null comment '最大安全阈值',
    min_threshold         decimal(10, 2) default 0.00   null comment '最小安全阈值',
    remark                varchar(500)                  null comment '备注',
    create_by             varchar(64)    default ''     null comment '创建者',
    create_time           datetime                      null comment '创建时间',
    update_by             varchar(64)    default ''     null comment '更新者',
    update_time           datetime                      null comment '更新时间'
)
    comment '设备信息表';

create table sensor_info
(
    sensor_id             bigint auto_increment comment '传感器ID'
        primary key,
    sensor_name           varchar(50)            not null comment '传感器名称',
    sensor_type           varchar(20)            not null comment '传感器类型',
    model_number          varchar(50)            null comment '型号',
    manufacturer          varchar(100)           null comment '制造商',
    measurement_range     varchar(50)            null comment '测量范围',
    accuracy              varchar(20)            null comment '精度',
    installation_location varchar(100)           null comment '安装位置',
    installation_date     datetime               null comment '安装日期',
    calibration_date      datetime               null comment '最近校准日期',
    next_calibration_date datetime               null comment '下次校准日期',
    status                tinyint(1)  default 0  null comment '状态（0正常 1停用）',
    remark                varchar(500)           null comment '备注',
    create_by             varchar(64) default '' null comment '创建者',
    create_time           datetime               null comment '创建时间',
    update_by             varchar(64) default '' null comment '更新者',
    update_time           datetime               null comment '更新时间'
)
    comment '传感器信息表';

create table torque_data
(
    data_id      bigint auto_increment comment '数据ID'
        primary key,
    sensor_id    bigint                    not null comment '传感器ID',
    device_id    bigint                    null comment '设备ID',
    torque_value decimal(10, 2)            not null comment '扭矩值',
    torque_unit  varchar(10) default 'N·m' null comment '扭矩单位',
    rpm          decimal(10, 2)            null comment '转速',
    temperature  decimal(5, 2)             null comment '温度',
    data_time    datetime                  not null comment '数据时间',
    data_quality tinyint(1)  default 1     null comment '数据质量（0异常 1正常）',
    create_time  datetime                  null comment '创建时间',
    operator     varchar(50)               null comment '操作人'
)
    comment '扭矩数据记录表';

create index idx_data_time
    on torque_data (data_time);

create index idx_device_id
    on torque_data (device_id);

create index idx_sensor_id
    on torque_data (sensor_id);


-- ----------------------------
-- 2、ry字典
-- ----------------------------
-- 传感器类型字典
INSERT INTO sys_dict_type(dict_id, dict_name, dict_type, status, create_by, create_time, remark)
SELECT (SELECT MAX(dict_id) + 1 FROM sys_dict_type),
       '传感器类型',
       'torque_sensor_type',
       '0',
       'admin',
       NOW(),
       '传感器类型字典'
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_type WHERE dict_type = 'torque_sensor_type');

-- 传感器类型字典数据
INSERT INTO sys_dict_data(dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default,
                          status, create_by, create_time, remark)
SELECT (SELECT MAX(dict_code) + 1 FROM sys_dict_data),
       1,
       '应变式传感器',
       '1',
       'torque_sensor_type',
       NULL,
       'default',
       'Y',
       '0',
       'admin',
       NOW(),
       '应变式传感器'
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'torque_sensor_type' AND dict_value = '1');

INSERT INTO sys_dict_data(dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default,
                          status, create_by, create_time, remark)
SELECT (SELECT MAX(dict_code) + 1 FROM sys_dict_data),
       2,
       '磁弹性传感器',
       '2',
       'torque_sensor_type',
       NULL,
       'default',
       'N',
       '0',
       'admin',
       NOW(),
       '磁弹性传感器'
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'torque_sensor_type' AND dict_value = '2');

INSERT INTO sys_dict_data(dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default,
                          status, create_by, create_time, remark)
SELECT (SELECT MAX(dict_code) + 1 FROM sys_dict_data),
       3,
       '光学传感器',
       '3',
       'torque_sensor_type',
       NULL,
       'default',
       'N',
       '0',
       'admin',
       NOW(),
       '光学传感器'
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'torque_sensor_type' AND dict_value = '3');

INSERT INTO sys_dict_data(dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default,
                          status, create_by, create_time, remark)
SELECT (SELECT MAX(dict_code) + 1 FROM sys_dict_data),
       4,
       '压电式传感器',
       '4',
       'torque_sensor_type',
       NULL,
       'default',
       'N',
       '0',
       'admin',
       NOW(),
       '压电式传感器'
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'torque_sensor_type' AND dict_value = '4');

INSERT INTO sys_dict_data(dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default,
                          status, create_by, create_time, remark)
SELECT (SELECT MAX(dict_code) + 1 FROM sys_dict_data),
       5,
       '其他',
       '9',
       'torque_sensor_type',
       NULL,
       'default',
       'N',
       '0',
       'admin',
       NOW(),
       '其他类型传感器'
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'torque_sensor_type' AND dict_value = '9');

-- 设备类型字典
INSERT INTO sys_dict_type(dict_id, dict_name, dict_type, status, create_by, create_time, remark)
SELECT (SELECT MAX(dict_id) + 1 FROM sys_dict_type),
       '设备类型',
       'torque_device_type',
       '0',
       'admin',
       NOW(),
       '扭矩设备类型字典'
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_type WHERE dict_type = 'torque_device_type');

-- 设备类型字典数据
INSERT INTO sys_dict_data(dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default,
                          status, create_by, create_time, remark)
SELECT (SELECT MAX(dict_code) + 1 FROM sys_dict_data),
       1,
       '发动机测试台',
       '1',
       'torque_device_type',
       NULL,
       'default',
       'Y',
       '0',
       'admin',
       NOW(),
       '发动机测试台'
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'torque_device_type' AND dict_value = '1');

INSERT INTO sys_dict_data(dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default,
                          status, create_by, create_time, remark)
SELECT (SELECT MAX(dict_code) + 1 FROM sys_dict_data),
       2,
       '扭矩传感器校准设备',
       '2',
       'torque_device_type',
       NULL,
       'default',
       'N',
       '0',
       'admin',
       NOW(),
       '扭矩传感器校准设备'
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'torque_device_type' AND dict_value = '2');

INSERT INTO sys_dict_data(dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default,
                          status, create_by, create_time, remark)
SELECT (SELECT MAX(dict_code) + 1 FROM sys_dict_data),
       3,
       '工业生产线',
       '3',
       'torque_device_type',
       NULL,
       'default',
       'N',
       '0',
       'admin',
       NOW(),
       '工业生产线'
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'torque_device_type' AND dict_value = '3');

INSERT INTO sys_dict_data(dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default,
                          status, create_by, create_time, remark)
SELECT (SELECT MAX(dict_code) + 1 FROM sys_dict_data),
       4,
       '扭矩扳手',
       '4',
       'torque_device_type',
       NULL,
       'default',
       'N',
       '0',
       'admin',
       NOW(),
       '扭矩扳手'
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'torque_device_type' AND dict_value = '4');

INSERT INTO sys_dict_data(dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default,
                          status, create_by, create_time, remark)
SELECT (SELECT MAX(dict_code) + 1 FROM sys_dict_data),
       5,
       '其他',
       '9',
       'torque_device_type',
       NULL,
       'default',
       'N',
       '0',
       'admin',
       NOW(),
       '其他类型设备'
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'torque_device_type' AND dict_value = '9');

-- 扭矩数据状态字典
INSERT INTO sys_dict_type(dict_id, dict_name, dict_type, status, create_by, create_time, remark)
SELECT (SELECT MAX(dict_id) + 1 FROM sys_dict_type),
       '扭矩数据状态',
       'torque_data_status',
       '0',
       'admin',
       NOW(),
       '扭矩数据状态字典'
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_type WHERE dict_type = 'torque_data_status');

-- 扭矩数据状态字典数据
INSERT INTO sys_dict_data(dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default,
                          status, create_by, create_time, remark)
SELECT (SELECT MAX(dict_code) + 1 FROM sys_dict_data),
       1,
       '正常',
       '0',
       'torque_data_status',
       NULL,
       'success',
       'Y',
       '0',
       'admin',
       NOW(),
       '正常数据'
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'torque_data_status' AND dict_value = '0');

INSERT INTO sys_dict_data(dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default,
                          status, create_by, create_time, remark)
SELECT (SELECT MAX(dict_code) + 1 FROM sys_dict_data),
       2,
       '异常',
       '1',
       'torque_data_status',
       NULL,
       'danger',
       'N',
       '0',
       'admin',
       NOW(),
       '异常数据'
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'torque_data_status' AND dict_value = '1');

INSERT INTO sys_dict_data(dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default,
                          status, create_by, create_time, remark)
SELECT (SELECT MAX(dict_code) + 1 FROM sys_dict_data),
       3,
       '待验证',
       '2',
       'torque_data_status',
       NULL,
       'warning',
       'N',
       '0',
       'admin',
       NOW(),
       '待验证数据'
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'torque_data_status' AND dict_value = '2');

-- 设备状态字典
INSERT INTO sys_dict_type(dict_id, dict_name, dict_type, status, create_by, create_time, remark)
SELECT (SELECT MAX(dict_id) + 1 FROM sys_dict_type),
       '设备状态',
       'torque_device_status',
       '0',
       'admin',
       NOW(),
       '设备状态字典'
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_type WHERE dict_type = 'torque_device_status');

-- 设备状态字典数据
INSERT INTO sys_dict_data(dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default,
                          status, create_by, create_time, remark)
SELECT (SELECT MAX(dict_code) + 1 FROM sys_dict_data),
       1,
       '正常',
       '0',
       'torque_device_status',
       NULL,
       'success',
       'Y',
       '0',
       'admin',
       NOW(),
       '正常状态'
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'torque_device_status' AND dict_value = '0');

INSERT INTO sys_dict_data(dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default,
                          status, create_by, create_time, remark)
SELECT (SELECT MAX(dict_code) + 1 FROM sys_dict_data),
       2,
       '故障',
       '1',
       'torque_device_status',
       NULL,
       'danger',
       'N',
       '0',
       'admin',
       NOW(),
       '故障状态'
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'torque_device_status' AND dict_value = '1');

INSERT INTO sys_dict_data(dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default,
                          status, create_by, create_time, remark)
SELECT (SELECT MAX(dict_code) + 1 FROM sys_dict_data),
       3,
       '维护中',
       '2',
       'torque_device_status',
       NULL,
       'warning',
       'N',
       '0',
       'admin',
       NOW(),
       '维护中状态'
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'torque_device_status' AND dict_value = '2');

INSERT INTO sys_dict_data(dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default,
                          status, create_by, create_time, remark)
SELECT (SELECT MAX(dict_code) + 1 FROM sys_dict_data),
       4,
       '停用',
       '3',
       'torque_device_status',
       NULL,
       'info',
       'N',
       '0',
       'admin',
       NOW(),
       '停用状态'
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'torque_device_status' AND dict_value = '3');