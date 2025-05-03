-- 传感器类型字典
INSERT INTO sys_dict_type(dict_id, dict_name, dict_type, status, create_by, create_time, remark)
SELECT (SELECT MAX(dict_id) + 1 FROM sys_dict_type), '传感器类型', 'torque_sensor_type', '0', 'admin', NOW(), '传感器类型字典'
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_type WHERE dict_type = 'torque_sensor_type');

-- 传感器类型字典数据
INSERT INTO sys_dict_data(dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, remark)
SELECT (SELECT MAX(dict_code) + 1 FROM sys_dict_data), 1, '应变式传感器', '1', 'torque_sensor_type', NULL, 'default', 'Y', '0', 'admin', NOW(), '应变式传感器'
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'torque_sensor_type' AND dict_value = '1');

INSERT INTO sys_dict_data(dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, remark)
SELECT (SELECT MAX(dict_code) + 1 FROM sys_dict_data), 2, '磁弹性传感器', '2', 'torque_sensor_type', NULL, 'default', 'N', '0', 'admin', NOW(), '磁弹性传感器'
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'torque_sensor_type' AND dict_value = '2');

INSERT INTO sys_dict_data(dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, remark)
SELECT (SELECT MAX(dict_code) + 1 FROM sys_dict_data), 3, '光学传感器', '3', 'torque_sensor_type', NULL, 'default', 'N', '0', 'admin', NOW(), '光学传感器'
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'torque_sensor_type' AND dict_value = '3');

INSERT INTO sys_dict_data(dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, remark)
SELECT (SELECT MAX(dict_code) + 1 FROM sys_dict_data), 4, '压电式传感器', '4', 'torque_sensor_type', NULL, 'default', 'N', '0', 'admin', NOW(), '压电式传感器'
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'torque_sensor_type' AND dict_value = '4');

INSERT INTO sys_dict_data(dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, remark)
SELECT (SELECT MAX(dict_code) + 1 FROM sys_dict_data), 5, '其他', '9', 'torque_sensor_type', NULL, 'default', 'N', '0', 'admin', NOW(), '其他类型传感器'
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'torque_sensor_type' AND dict_value = '9');

-- 设备类型字典
INSERT INTO sys_dict_type(dict_id, dict_name, dict_type, status, create_by, create_time, remark)
SELECT (SELECT MAX(dict_id) + 1 FROM sys_dict_type), '设备类型', 'torque_device_type', '0', 'admin', NOW(), '扭矩设备类型字典'
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_type WHERE dict_type = 'torque_device_type');

-- 设备类型字典数据
INSERT INTO sys_dict_data(dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, remark)
SELECT (SELECT MAX(dict_code) + 1 FROM sys_dict_data), 1, '发动机测试台', '1', 'torque_device_type', NULL, 'default', 'Y', '0', 'admin', NOW(), '发动机测试台'
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'torque_device_type' AND dict_value = '1');

INSERT INTO sys_dict_data(dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, remark)
SELECT (SELECT MAX(dict_code) + 1 FROM sys_dict_data), 2, '扭矩传感器校准设备', '2', 'torque_device_type', NULL, 'default', 'N', '0', 'admin', NOW(), '扭矩传感器校准设备'
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'torque_device_type' AND dict_value = '2');

INSERT INTO sys_dict_data(dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, remark)
SELECT (SELECT MAX(dict_code) + 1 FROM sys_dict_data), 3, '工业生产线', '3', 'torque_device_type', NULL, 'default', 'N', '0', 'admin', NOW(), '工业生产线'
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'torque_device_type' AND dict_value = '3');

INSERT INTO sys_dict_data(dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, remark)
SELECT (SELECT MAX(dict_code) + 1 FROM sys_dict_data), 4, '扭矩扳手', '4', 'torque_device_type', NULL, 'default', 'N', '0', 'admin', NOW(), '扭矩扳手'
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'torque_device_type' AND dict_value = '4');

INSERT INTO sys_dict_data(dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, remark)
SELECT (SELECT MAX(dict_code) + 1 FROM sys_dict_data), 5, '其他', '9', 'torque_device_type', NULL, 'default', 'N', '0', 'admin', NOW(), '其他类型设备'
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'torque_device_type' AND dict_value = '9');

-- 扭矩数据状态字典
INSERT INTO sys_dict_type(dict_id, dict_name, dict_type, status, create_by, create_time, remark)
SELECT (SELECT MAX(dict_id) + 1 FROM sys_dict_type), '扭矩数据状态', 'torque_data_status', '0', 'admin', NOW(), '扭矩数据状态字典'
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_type WHERE dict_type = 'torque_data_status');

-- 扭矩数据状态字典数据
INSERT INTO sys_dict_data(dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, remark)
SELECT (SELECT MAX(dict_code) + 1 FROM sys_dict_data), 1, '正常', '0', 'torque_data_status', NULL, 'success', 'Y', '0', 'admin', NOW(), '正常数据'
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'torque_data_status' AND dict_value = '0');

INSERT INTO sys_dict_data(dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, remark)
SELECT (SELECT MAX(dict_code) + 1 FROM sys_dict_data), 2, '异常', '1', 'torque_data_status', NULL, 'danger', 'N', '0', 'admin', NOW(), '异常数据'
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'torque_data_status' AND dict_value = '1');

INSERT INTO sys_dict_data(dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, remark)
SELECT (SELECT MAX(dict_code) + 1 FROM sys_dict_data), 3, '待验证', '2', 'torque_data_status', NULL, 'warning', 'N', '0', 'admin', NOW(), '待验证数据'
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'torque_data_status' AND dict_value = '2');

-- 设备状态字典
INSERT INTO sys_dict_type(dict_id, dict_name, dict_type, status, create_by, create_time, remark)
SELECT (SELECT MAX(dict_id) + 1 FROM sys_dict_type), '设备状态', 'torque_device_status', '0', 'admin', NOW(), '设备状态字典'
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_type WHERE dict_type = 'torque_device_status');

-- 设备状态字典数据
INSERT INTO sys_dict_data(dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, remark)
SELECT (SELECT MAX(dict_code) + 1 FROM sys_dict_data), 1, '正常', '0', 'torque_device_status', NULL, 'success', 'Y', '0', 'admin', NOW(), '正常状态'
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'torque_device_status' AND dict_value = '0');

INSERT INTO sys_dict_data(dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, remark)
SELECT (SELECT MAX(dict_code) + 1 FROM sys_dict_data), 2, '故障', '1', 'torque_device_status', NULL, 'danger', 'N', '0', 'admin', NOW(), '故障状态'
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'torque_device_status' AND dict_value = '1');

INSERT INTO sys_dict_data(dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, remark)
SELECT (SELECT MAX(dict_code) + 1 FROM sys_dict_data), 3, '维护中', '2', 'torque_device_status', NULL, 'warning', 'N', '0', 'admin', NOW(), '维护中状态'
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'torque_device_status' AND dict_value = '2');

INSERT INTO sys_dict_data(dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, remark)
SELECT (SELECT MAX(dict_code) + 1 FROM sys_dict_data), 4, '停用', '3', 'torque_device_status', NULL, 'info', 'N', '0', 'admin', NOW(), '停用状态'
WHERE NOT EXISTS (SELECT 1 FROM sys_dict_data WHERE dict_type = 'torque_device_status' AND dict_value = '3'); 