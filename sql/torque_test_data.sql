-- ----------------------------
-- 1、设备信息插入
-- ----------------------------
INSERT INTO ry_vue.device_info (device_id, device_name, device_type, model_number, manufacturer, production_date,
                                installation_location, department, responsible_person, status, maintenance_cycle,
                                last_maintenance_date, next_maintenance_date, max_threshold, min_threshold, remark,
                                create_by, create_time, update_by, update_time)
VALUES (1, '电机测试台A1', '测试台', 'MT-A1', '上海机械制造有限公司', '2022-10-10 00:00:00', '测试实验室A区', '研发部',
        '张工', 0, 90, '2023-06-15 00:00:00', '2023-09-15 00:00:00', 120.00, 20.00, '用于电机扭矩测试', 'admin',
        '2022-10-15 08:30:00', 'admin', '2023-06-20 09:15:00');
INSERT INTO ry_vue.device_info (device_id, device_name, device_type, model_number, manufacturer, production_date,
                                installation_location, department, responsible_person, status, maintenance_cycle,
                                last_maintenance_date, next_maintenance_date, max_threshold, min_threshold, remark,
                                create_by, create_time, update_by, update_time)
VALUES (2, '减速器组装线B2', '生产线', 'AL-B2', '江苏自动化设备厂', '2022-11-15 00:00:00', '1号厂房2楼', '生产部',
        '李工', 0, 60, '2023-07-10 00:00:00', '2023-09-10 00:00:00', 200.00, 50.00, '用于减速器组装和测试', 'admin',
        '2022-11-20 10:20:00', 'admin', '2023-07-15 14:30:00');
INSERT INTO ry_vue.device_info (device_id, device_name, device_type, model_number, manufacturer, production_date,
                                installation_location, department, responsible_person, status, maintenance_cycle,
                                last_maintenance_date, next_maintenance_date, max_threshold, min_threshold, remark,
                                create_by, create_time, update_by, update_time)
VALUES (3, '联轴器加工中心C3', '加工中心', 'MC-C3', '德国精密机床公司', '2022-09-20 00:00:00', '2号厂房1楼', '生产部',
        '王工', 0, 30, '2023-08-05 00:00:00', '2023-09-05 00:00:00', 150.00, 30.00, '用于联轴器精密加工', 'admin',
        '2022-09-25 14:15:00', 'admin', '2023-08-10 11:40:00');
INSERT INTO ry_vue.device_info (device_id, device_name, device_type, model_number, manufacturer, production_date,
                                installation_location, department, responsible_person, status, maintenance_cycle,
                                last_maintenance_date, next_maintenance_date, max_threshold, min_threshold, remark,
                                create_by, create_time, update_by, update_time)
VALUES (4, '电机组装线A4', '生产线', 'AL-A4', '江苏自动化设备厂', '2022-12-05 00:00:00', '1号厂房1楼', '生产部', '赵工',
        0, 60, '2023-06-25 00:00:00', '2023-08-25 00:00:00', 180.00, 20.00, '用于电机组装和测试', 'admin',
        '2022-12-10 09:45:00', 'admin', '2023-06-30 15:20:00');
INSERT INTO ry_vue.device_info (device_id, device_name, device_type, model_number, manufacturer, production_date,
                                installation_location, department, responsible_person, status, maintenance_cycle,
                                last_maintenance_date, next_maintenance_date, max_threshold, min_threshold, remark,
                                create_by, create_time, update_by, update_time)
VALUES (5, '重型主轴加工机D5', '加工机', 'HM-D5', '美国重型机械公司', '2022-08-15 00:00:00', '3号厂房', '生产部',
        '刘工', 0, 90, '2023-07-20 00:00:00', '2023-10-20 00:00:00', 350.00, 100.00, '用于重型主轴加工', 'admin',
        '2022-08-20 11:30:00', 'admin', '2023-07-25 10:15:00');
INSERT INTO ry_vue.device_info (device_id, device_name, device_type, model_number, manufacturer, production_date,
                                installation_location, department, responsible_person, status, maintenance_cycle,
                                last_maintenance_date, next_maintenance_date, max_threshold, min_threshold, remark,
                                create_by, create_time, update_by, update_time)
VALUES (6, '轴承装配线B6', '生产线', 'AL-B6', '江苏自动化设备厂', '2023-01-10 00:00:00', '1号厂房3楼', '生产部', '钱工',
        0, 60, '2023-06-10 00:00:00', '2023-08-10 00:00:00', 90.00, 5.00, '用于轴承装配和测试', 'admin',
        '2023-01-15 13:45:00', 'admin', '2023-06-15 16:30:00');
INSERT INTO ry_vue.device_info (device_id, device_name, device_type, model_number, manufacturer, production_date,
                                installation_location, department, responsible_person, status, maintenance_cycle,
                                last_maintenance_date, next_maintenance_date, max_threshold, min_threshold, remark,
                                create_by, create_time, update_by, update_time)
VALUES (7, '减速箱测试台A7', '测试台', 'MT-A7', '上海机械制造有限公司', '2022-11-25 00:00:00', '测试实验室B区',
        '研发部', '孙工', 0, 90, '2023-05-25 00:00:00', '2023-08-25 00:00:00', 175.00, 25.00, '用于减速箱扭矩测试',
        'admin', '2022-11-30 10:40:00', 'admin', '2023-05-30 14:15:00');
INSERT INTO ry_vue.device_info (device_id, device_name, device_type, model_number, manufacturer, production_date,
                                installation_location, department, responsible_person, status, maintenance_cycle,
                                last_maintenance_date, next_maintenance_date, max_threshold, min_threshold, remark,
                                create_by, create_time, update_by, update_time)
VALUES (8, '电机测试台A8', '测试台', 'MT-A8', '上海机械制造有限公司', '2023-02-15 00:00:00', '测试实验室A区', '研发部',
        '周工', 0, 90, '2023-06-20 00:00:00', '2023-09-20 00:00:00', 150.00, 15.00, '用于大功率电机测试', 'admin',
        '2023-02-20 09:15:00', 'admin', '2023-06-25 11:30:00');
INSERT INTO ry_vue.device_info (device_id, device_name, device_type, model_number, manufacturer, production_date,
                                installation_location, department, responsible_person, status, maintenance_cycle,
                                last_maintenance_date, next_maintenance_date, max_threshold, min_threshold, remark,
                                create_by, create_time, update_by, update_time)
VALUES (9, '精密扭矩校准台C9', '校准设备', 'CT-C9', '美国精密仪器公司', '2022-10-05 00:00:00', '计量实验室', '质量部',
        '吴工', 0, 180, '2023-04-05 00:00:00', '2023-10-05 00:00:00', 80.00, 0.50, '用于扭矩传感器校准', 'admin',
        '2022-10-10 15:20:00', 'admin', '2023-04-10 10:45:00');
INSERT INTO ry_vue.device_info (device_id, device_name, device_type, model_number, manufacturer, production_date,
                                installation_location, department, responsible_person, status, maintenance_cycle,
                                last_maintenance_date, next_maintenance_date, max_threshold, min_threshold, remark,
                                create_by, create_time, update_by, update_time)
VALUES (10, '电机组装线A10', '生产线', 'AL-A10', '江苏自动化设备厂', '2023-03-10 00:00:00', '1号厂房2楼', '生产部',
        '郑工', 0, 60, '2023-07-05 00:00:00', '2023-09-05 00:00:00', 140.00, 10.00, '用于中型电机组装', 'admin',
        '2023-03-15 11:10:00', 'admin', '2023-07-10 14:50:00');
INSERT INTO ry_vue.device_info (device_id, device_name, device_type, model_number, manufacturer, production_date,
                                installation_location, department, responsible_person, status, maintenance_cycle,
                                last_maintenance_date, next_maintenance_date, max_threshold, min_threshold, remark,
                                create_by, create_time, update_by, update_time)
VALUES (11, '重型测试平台D11', '测试平台', 'TP-D11', '德国重型设备公司', '2022-09-15 00:00:00', '测试实验室C区',
        '研发部', '陈工', 0, 120, '2023-05-15 00:00:00', '2023-09-15 00:00:00', 500.00, 100.00, '用于重型设备扭矩测试',
        'admin', '2022-09-20 13:40:00', 'admin', '2023-05-20 15:15:00');
INSERT INTO ry_vue.device_info (device_id, device_name, device_type, model_number, manufacturer, production_date,
                                installation_location, department, responsible_person, status, maintenance_cycle,
                                last_maintenance_date, next_maintenance_date, max_threshold, min_threshold, remark,
                                create_by, create_time, update_by, update_time)
VALUES (12, '高精度扭矩测试台E12', '测试台', 'PT-E12', '日本精密仪器株式会社', '2023-01-20 00:00:00', '测试实验室A区',
        '测试部', '林工', 0, 90, '2023-07-25 00:00:00', '2023-10-25 00:00:00', 100.00, 1.00, '用于高精度扭矩测试',
        'admin', '2023-01-25 09:30:00', 'admin', '2023-07-30 10:20:00');
INSERT INTO ry_vue.device_info (device_id, device_name, device_type, model_number, manufacturer, production_date,
                                installation_location, department, responsible_person, status, maintenance_cycle,
                                last_maintenance_date, next_maintenance_date, max_threshold, min_threshold, remark,
                                create_by, create_time, update_by, update_time)
VALUES (13, '涡轮增压器测试台F13', '测试台', 'TT-F13', '德国涡轮技术有限公司', '2022-12-10 00:00:00', '动力测试间',
        '测试部', '黄工', 0, 60, '2023-06-15 00:00:00', '2023-08-15 00:00:00', 250.00, 50.00, '用于涡轮增压器性能测试',
        'admin', '2022-12-15 14:25:00', 'admin', '2023-06-20 16:40:00');
INSERT INTO ry_vue.device_info (device_id, device_name, device_type, model_number, manufacturer, production_date,
                                installation_location, department, responsible_person, status, maintenance_cycle,
                                last_maintenance_date, next_maintenance_date, max_threshold, min_threshold, remark,
                                create_by, create_time, update_by, update_time)
VALUES (14, '自动化组装线G14', '生产线', 'AL-G14', '瑞士自动化科技公司', '2023-02-05 00:00:00', '2号厂房2楼', '生产部',
        '张工', 0, 45, '2023-07-10 00:00:00', '2023-08-25 00:00:00', 120.00, 20.00, '用于精密零件自动化组装', 'admin',
        '2023-02-10 11:45:00', 'admin', '2023-07-15 13:30:00');
INSERT INTO ry_vue.device_info (device_id, device_name, device_type, model_number, manufacturer, production_date,
                                installation_location, department, responsible_person, status, maintenance_cycle,
                                last_maintenance_date, next_maintenance_date, max_threshold, min_threshold, remark,
                                create_by, create_time, update_by, update_time)
VALUES (15, '齿轮箱耐久测试台H15', '测试台', 'ET-H15', '意大利测试设备制造商', '2022-11-05 00:00:00', '耐久测试区',
        '测试部', '李工', 0, 120, '2023-05-10 00:00:00', '2023-09-10 00:00:00', 300.00, 60.00, '用于齿轮箱耐久性测试',
        'admin', '2022-11-10 10:15:00', 'admin', '2023-05-15 14:50:00');
INSERT INTO ry_vue.device_info (device_id, device_name, device_type, model_number, manufacturer, production_date,
                                installation_location, department, responsible_person, status, maintenance_cycle,
                                last_maintenance_date, next_maintenance_date, max_threshold, min_threshold, remark,
                                create_by, create_time, update_by, update_time)
VALUES (16, '精密加工中心I16', '加工中心', 'MC-I16', '日本CNC制造商', '2023-03-15 00:00:00', '精密加工车间', '生产部',
        '王工', 0, 30, '2023-06-20 00:00:00', '2023-07-20 00:00:00', 80.00, 10.00, '用于高精度零件加工', 'admin',
        '2023-03-20 09:20:00', 'admin', '2023-06-25 11:15:00');
INSERT INTO ry_vue.device_info (device_id, device_name, device_type, model_number, manufacturer, production_date,
                                installation_location, department, responsible_person, status, maintenance_cycle,
                                last_maintenance_date, next_maintenance_date, max_threshold, min_threshold, remark,
                                create_by, create_time, update_by, update_time)
VALUES (17, '变速器测试台J17', '测试台', 'GT-J17', '德国传动技术公司', '2022-10-25 00:00:00', '测试实验室B区', '测试部',
        '赵工', 0, 75, '2023-04-25 00:00:00', '2023-07-10 00:00:00', 220.00, 40.00, '用于变速器性能测试', 'admin',
        '2022-10-30 13:50:00', 'admin', '2023-05-05 10:30:00');
INSERT INTO ry_vue.device_info (device_id, device_name, device_type, model_number, manufacturer, production_date,
                                installation_location, department, responsible_person, status, maintenance_cycle,
                                last_maintenance_date, next_maintenance_date, max_threshold, min_threshold, remark,
                                create_by, create_time, update_by, update_time)
VALUES (18, '扭矩校准设备K18', '校准设备', 'TC-K18', '美国计量技术公司', '2023-01-05 00:00:00', '计量实验室', '质量部',
        '刘工', 0, 180, '2023-06-05 00:00:00', '2023-12-05 00:00:00', 50.00, 0.10, '用于高精度扭矩传感器校准', 'admin',
        '2023-01-10 15:40:00', 'admin', '2023-06-10 14:20:00');
INSERT INTO ry_vue.device_info (device_id, device_name, device_type, model_number, manufacturer, production_date,
                                installation_location, department, responsible_person, status, maintenance_cycle,
                                last_maintenance_date, next_maintenance_date, max_threshold, min_threshold, remark,
                                create_by, create_time, update_by, update_time)
VALUES (19, '电机寿命测试台L19', '测试台', 'LT-L19', '美国测试设备供应商', '2022-12-20 00:00:00', '寿命测试区',
        '测试部', '钱工', 0, 90, '2023-05-20 00:00:00', '2023-08-20 00:00:00', 150.00, 20.00, '用于电机寿命测试',
        'admin', '2022-12-25 11:20:00', 'admin', '2023-05-25 15:45:00');
INSERT INTO ry_vue.device_info (device_id, device_name, device_type, model_number, manufacturer, production_date,
                                installation_location, department, responsible_person, status, maintenance_cycle,
                                last_maintenance_date, next_maintenance_date, max_threshold, min_threshold, remark,
                                create_by, create_time, update_by, update_time)
VALUES (20, '振动分析设备M20', '分析设备', 'VA-M20', '丹麦振动分析技术公司', '2023-02-25 00:00:00', '振动实验室',
        '研发部', '孙工', 0, 60, '2023-07-15 00:00:00', '2023-09-15 00:00:00', 100.00, 5.00, '用于扭矩振动分析',
        'admin', '2023-03-01 10:30:00', 'admin', '2023-07-20 13:45:00');
INSERT INTO ry_vue.device_info (device_id, device_name, device_type, model_number, manufacturer, production_date,
                                installation_location, department, responsible_person, status, maintenance_cycle,
                                last_maintenance_date, next_maintenance_date, max_threshold, min_threshold, remark,
                                create_by, create_time, update_by, update_time)
VALUES (21, '驱动系统测试台N21', '测试台', 'DT-N21', '法国驱动技术公司', '2022-11-15 00:00:00', '测试实验室C区',
        '测试部', '周工', 0, 75, '2023-04-15 00:00:00', '2023-07-01 00:00:00', 280.00, 50.00, '用于驱动系统综合测试',
        'admin', '2022-11-20 14:10:00', 'admin', '2023-04-20 16:25:00');
INSERT INTO ry_vue.device_info (device_id, device_name, device_type, model_number, manufacturer, production_date,
                                installation_location, department, responsible_person, status, maintenance_cycle,
                                last_maintenance_date, next_maintenance_date, max_threshold, min_threshold, remark,
                                create_by, create_time, update_by, update_time)
VALUES (22, '扭矩监测系统O22', '监测系统', 'TM-O22', '瑞典监测技术公司', '2023-01-15 00:00:00', '生产线监测区',
        '质量部', '吴工', 0, 90, '2023-06-15 00:00:00', '2023-09-15 00:00:00', 120.00, 10.00, '用于生产线扭矩实时监测',
        'admin', '2023-01-20 09:45:00', 'admin', '2023-06-20 11:30:00');
INSERT INTO ry_vue.device_info (device_id, device_name, device_type, model_number, manufacturer, production_date,
                                installation_location, department, responsible_person, status, maintenance_cycle,
                                last_maintenance_date, next_maintenance_date, max_threshold, min_threshold, remark,
                                create_by, create_time, update_by, update_time)
VALUES (23, '转向系统测试台P23', '测试台', 'ST-P23', '德国汽车技术公司', '2022-12-05 00:00:00', '汽车部件测试区',
        '测试部', '郑工', 0, 60, '2023-06-05 00:00:00', '2023-08-05 00:00:00', 180.00, 30.00, '用于转向系统测试',
        'admin', '2022-12-10 13:20:00', 'admin', '2023-06-10 15:45:00');
INSERT INTO ry_vue.device_info (device_id, device_name, device_type, model_number, manufacturer, production_date,
                                installation_location, department, responsible_person, status, maintenance_cycle,
                                last_maintenance_date, next_maintenance_date, max_threshold, min_threshold, remark,
                                create_by, create_time, update_by, update_time)
VALUES (24, '工业机器人关节测试台Q24', '测试台', 'RT-Q24', '日本机器人制造商', '2023-03-05 00:00:00', '机器人测试区',
        '研发部', '陈工', 0, 45, '2023-07-05 00:00:00', '2023-08-20 00:00:00', 150.00, 15.00, '用于机器人关节扭矩测试',
        'admin', '2023-03-10 10:50:00', 'admin', '2023-07-10 14:30:00');
INSERT INTO ry_vue.device_info (device_id, device_name, device_type, model_number, manufacturer, production_date,
                                installation_location, department, responsible_person, status, maintenance_cycle,
                                last_maintenance_date, next_maintenance_date, max_threshold, min_threshold, remark,
                                create_by, create_time, update_by, update_time)
VALUES (25, '质量检测设备R25', '检测设备', 'QC-R25', '瑞士精密测量公司', '2022-10-20 00:00:00', '质检实验室', '质量部',
        '林工', 0, 120, '2023-05-20 00:00:00', '2023-09-20 00:00:00', 80.00, 1.00, '用于产品质量扭矩检测', 'admin',
        '2022-10-25 15:30:00', 'admin', '2023-05-25 10:20:00');

-- ----------------------------
-- 2、传感器信息插入
-- ----------------------------
INSERT INTO ry_vue.sensor_info (sensor_id, sensor_name, sensor_type, model_number, manufacturer, measurement_range,
                                accuracy, installation_location, installation_date, calibration_date,
                                next_calibration_date, status, remark, create_by, create_time, update_by, update_time)
VALUES (1, '扭矩传感器T100', '扭矩传感器', 'TQ-100A', '上海精密仪器厂', '0-100N·m', '±0.5%', '1号生产线电机端',
        '2023-01-15 00:00:00', '2023-07-15 00:00:00', '2024-01-15 00:00:00', 0, '定期校准', 'admin',
        '2023-01-10 14:30:00', 'admin', '2023-07-20 10:15:00');
INSERT INTO ry_vue.sensor_info (sensor_id, sensor_name, sensor_type, model_number, manufacturer, measurement_range,
                                accuracy, installation_location, installation_date, calibration_date,
                                next_calibration_date, status, remark, create_by, create_time, update_by, update_time)
VALUES (2, '扭矩传感器T200', '扭矩传感器', 'TQ-200B', '北京传感技术有限公司', '0-200N·m', '±0.3%', '2号生产线减速器',
        '2023-02-10 00:00:00', '2023-08-10 00:00:00', '2024-02-10 00:00:00', 0, '高精度型号', 'admin',
        '2023-02-05 09:20:00', 'admin', '2023-08-15 11:30:00');
INSERT INTO ry_vue.sensor_info (sensor_id, sensor_name, sensor_type, model_number, manufacturer, measurement_range,
                                accuracy, installation_location, installation_date, calibration_date,
                                next_calibration_date, status, remark, create_by, create_time, update_by, update_time)
VALUES (3, '扭矩传感器T300', '扭矩传感器', 'TQ-300C', '德国TorqueTech', '0-500N·m', '±0.2%', '3号生产线联轴器',
        '2023-01-20 00:00:00', '2023-07-20 00:00:00', '2024-01-20 00:00:00', 0, '进口高端型号', 'admin',
        '2023-01-15 16:40:00', 'admin', '2023-07-25 14:20:00');
INSERT INTO ry_vue.sensor_info (sensor_id, sensor_name, sensor_type, model_number, manufacturer, measurement_range,
                                accuracy, installation_location, installation_date, calibration_date,
                                next_calibration_date, status, remark, create_by, create_time, update_by, update_time)
VALUES (4, '扭矩传感器T400', '扭矩传感器', 'TQ-400A', '上海精密仪器厂', '0-50N·m', '±0.5%', '4号生产线电机端',
        '2023-03-05 00:00:00', '2023-09-05 00:00:00', '2024-03-05 00:00:00', 0, '小量程型号', 'admin',
        '2023-03-01 10:00:00', 'admin', '2023-09-10 09:15:00');
INSERT INTO ry_vue.sensor_info (sensor_id, sensor_name, sensor_type, model_number, manufacturer, measurement_range,
                                accuracy, installation_location, installation_date, calibration_date,
                                next_calibration_date, status, remark, create_by, create_time, update_by, update_time)
VALUES (5, '扭矩传感器T500', '扭矩传感器', 'TQ-500B', '北京传感技术有限公司', '0-1000N·m', '±0.3%', '5号生产线主轴',
        '2023-02-25 00:00:00', '2023-08-25 00:00:00', '2024-02-25 00:00:00', 0, '大量程型号', 'admin',
        '2023-02-20 14:20:00', 'admin', '2023-08-30 15:40:00');
INSERT INTO ry_vue.sensor_info (sensor_id, sensor_name, sensor_type, model_number, manufacturer, measurement_range,
                                accuracy, installation_location, installation_date, calibration_date,
                                next_calibration_date, status, remark, create_by, create_time, update_by, update_time)
VALUES (6, '温度传感器TS100', '温度传感器', 'TS-100A', '深圳传感科技有限公司', '-50-150℃', '±0.5℃', '1号生产线轴承',
        '2023-01-10 00:00:00', '2023-07-10 00:00:00', '2024-01-10 00:00:00', 0, '配套温度监测', 'admin',
        '2023-01-05 11:30:00', 'admin', '2023-07-15 16:20:00');
INSERT INTO ry_vue.sensor_info (sensor_id, sensor_name, sensor_type, model_number, manufacturer, measurement_range,
                                accuracy, installation_location, installation_date, calibration_date,
                                next_calibration_date, status, remark, create_by, create_time, update_by, update_time)
VALUES (7, '温度传感器TS200', '温度传感器', 'TS-200B', '深圳传感科技有限公司', '-50-250℃', '±0.3℃', '2号生产线轴承',
        '2023-02-15 00:00:00', '2023-08-15 00:00:00', '2024-02-15 00:00:00', 0, '高温环境使用', 'admin',
        '2023-02-10 13:40:00', 'admin', '2023-08-20 10:50:00');
INSERT INTO ry_vue.sensor_info (sensor_id, sensor_name, sensor_type, model_number, manufacturer, measurement_range,
                                accuracy, installation_location, installation_date, calibration_date,
                                next_calibration_date, status, remark, create_by, create_time, update_by, update_time)
VALUES (8, '振动传感器VS100', '振动传感器', 'VS-100A', '广州工业自动化设备厂', '0-20mm/s', '±2%', '1号生产线减速箱',
        '2023-03-10 00:00:00', '2023-09-10 00:00:00', '2024-03-10 00:00:00', 0, '配套振动监测', 'admin',
        '2023-03-05 09:15:00', 'admin', '2023-09-15 14:30:00');
INSERT INTO ry_vue.sensor_info (sensor_id, sensor_name, sensor_type, model_number, manufacturer, measurement_range,
                                accuracy, installation_location, installation_date, calibration_date,
                                next_calibration_date, status, remark, create_by, create_time, update_by, update_time)
VALUES (9, '扭矩传感器T600', '扭矩传感器', 'TQ-600D', '美国TorqueMaster', '0-300N·m', '±0.1%', '装配车间测试台',
        '2023-04-05 00:00:00', '2023-10-05 00:00:00', '2024-04-05 00:00:00', 0, '高精度校准用', 'admin',
        '2023-04-01 15:20:00', 'admin', '2023-10-10 11:10:00');
INSERT INTO ry_vue.sensor_info (sensor_id, sensor_name, sensor_type, model_number, manufacturer, measurement_range,
                                accuracy, installation_location, installation_date, calibration_date,
                                next_calibration_date, status, remark, create_by, create_time, update_by, update_time)
VALUES (10, '扭矩传感器T700', '扭矩传感器', 'TQ-700A', '上海精密仪器厂', '0-150N·m', '±0.5%', '6号生产线电机端',
        '2023-03-20 00:00:00', '2023-09-20 00:00:00', '2024-03-20 00:00:00', 0, '常规型号', 'admin',
        '2023-03-15 10:45:00', 'admin', '2023-09-25 09:30:00');
INSERT INTO ry_vue.sensor_info (sensor_id, sensor_name, sensor_type, model_number, manufacturer, measurement_range,
                                accuracy, installation_location, installation_date, calibration_date,
                                next_calibration_date, status, remark, create_by, create_time, update_by, update_time)
VALUES (11, '扭矩传感器T800', '扭矩传感器', 'TQ-800E', '德国TorqueTech', '0-800N·m', '±0.2%', '重型设备测试区',
        '2023-05-10 00:00:00', '2023-11-10 00:00:00', '2024-05-10 00:00:00', 0, '大扭矩测量专用', 'admin',
        '2023-05-05 14:15:00', 'admin', '2023-11-15 16:40:00');
INSERT INTO ry_vue.sensor_info (sensor_id, sensor_name, sensor_type, model_number, manufacturer, measurement_range,
                                accuracy, installation_location, installation_date, calibration_date,
                                next_calibration_date, status, remark, create_by, create_time, update_by, update_time)
VALUES (12, '扭矩传感器T900', '扭矩传感器', 'TQ-900B', '北京传感技术有限公司', '0-100N·m', '±0.3%', '7号生产线减速器',
        '2023-04-15 00:00:00', '2023-10-15 00:00:00', '2024-04-15 00:00:00', 0, '常规型号', 'admin',
        '2023-04-10 11:20:00', 'admin', '2023-10-20 15:30:00');
INSERT INTO ry_vue.sensor_info (sensor_id, sensor_name, sensor_type, model_number, manufacturer, measurement_range,
                                accuracy, installation_location, installation_date, calibration_date,
                                next_calibration_date, status, remark, create_by, create_time, update_by, update_time)
VALUES (13, '转速传感器RS100', '转速传感器', 'RS-100A', '深圳传感科技有限公司', '0-10000rpm', '±1rpm', '1号生产线电机',
        '2023-01-25 00:00:00', '2023-07-25 00:00:00', '2024-01-25 00:00:00', 0, '配套转速监测', 'admin',
        '2023-01-20 13:10:00', 'admin', '2023-07-30 10:20:00');
INSERT INTO ry_vue.sensor_info (sensor_id, sensor_name, sensor_type, model_number, manufacturer, measurement_range,
                                accuracy, installation_location, installation_date, calibration_date,
                                next_calibration_date, status, remark, create_by, create_time, update_by, update_time)
VALUES (14, '转速传感器RS200', '转速传感器', 'RS-200B', '深圳传感科技有限公司', '0-5000rpm', '±0.5rpm', '2号生产线电机',
        '2023-02-20 00:00:00', '2023-08-20 00:00:00', '2024-02-20 00:00:00', 0, '高精度型号', 'admin',
        '2023-02-15 09:40:00', 'admin', '2023-08-25 14:15:00');
INSERT INTO ry_vue.sensor_info (sensor_id, sensor_name, sensor_type, model_number, manufacturer, measurement_range,
                                accuracy, installation_location, installation_date, calibration_date,
                                next_calibration_date, status, remark, create_by, create_time, update_by, update_time)
VALUES (15, '扭矩传感器T1000', '扭矩传感器', 'TQ-1000F', '日本TorqueSystem', '0-200N·m', '±0.1%', '实验室校准台',
        '2023-05-20 00:00:00', '2023-11-20 00:00:00', '2024-05-20 00:00:00', 0, '实验室标准型号', 'admin',
        '2023-05-15 15:30:00', 'admin', '2023-11-25 11:45:00');

-- ----------------------------
-- 3、传感器信息插入
-- ----------------------------
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (1, 1, 1, 85.20, 'N·m', 1500.00, 42.50, '2023-01-15 09:30:00', 1, '2023-01-15 09:30:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (2, 1, 1, 87.65, 'N·m', 1520.00, 43.10, '2023-01-15 10:00:00', 1, '2023-01-15 10:00:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (3, 1, 1, 86.90, 'N·m', 1510.00, 42.80, '2023-01-15 10:30:00', 1, '2023-01-15 10:30:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (4, 1, 1, 130.50, 'N·m', 1600.00, 48.70, '2023-01-15 11:00:00', 0, '2023-01-15 11:00:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (5, 1, 1, 84.75, 'N·m', 1490.00, 42.30, '2023-01-15 11:30:00', 1, '2023-01-15 11:30:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (6, 2, 2, 165.20, 'N·m', 750.00, 56.40, '2023-01-20 14:00:00', 1, '2023-01-20 14:00:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (7, 2, 2, 170.50, 'N·m', 760.00, 57.10, '2023-01-20 14:30:00', 1, '2023-01-20 14:30:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (8, 2, 2, 168.30, 'N·m', 755.00, 56.80, '2023-01-20 15:00:00', 1, '2023-01-20 15:00:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (9, 2, 2, 220.40, 'N·m', 780.00, 61.50, '2023-01-20 15:30:00', 0, '2023-01-20 15:30:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (10, 2, 2, 167.50, 'N·m', 750.00, 56.50, '2023-01-20 16:00:00', 1, '2023-01-20 16:00:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (11, 3, 3, 125.30, 'N·m', 1200.00, 48.20, '2023-02-05 09:15:00', 1, '2023-02-05 09:15:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (12, 3, 3, 128.40, 'N·m', 1210.00, 48.50, '2023-02-05 09:45:00', 1, '2023-02-05 09:45:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (13, 3, 3, 126.90, 'N·m', 1205.00, 48.30, '2023-02-05 10:15:00', 1, '2023-02-05 10:15:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (14, 3, 3, 15.20, 'N·m', 1000.00, 40.10, '2023-02-05 10:45:00', 0, '2023-02-05 10:45:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (15, 3, 3, 127.50, 'N·m', 1200.00, 48.40, '2023-02-05 11:15:00', 1, '2023-02-05 11:15:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (16, 4, 4, 145.60, 'N·m', 1800.00, 52.30, '2023-02-10 13:00:00', 1, '2023-02-10 13:00:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (17, 4, 4, 148.20, 'N·m', 1820.00, 52.70, '2023-02-10 13:30:00', 1, '2023-02-10 13:30:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (18, 4, 4, 146.90, 'N·m', 1810.00, 52.50, '2023-02-10 14:00:00', 1, '2023-02-10 14:00:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (19, 4, 4, 147.30, 'N·m', 1805.00, 52.40, '2023-02-10 14:30:00', 1, '2023-02-10 14:30:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (20, 4, 4, 190.40, 'N·m', 1900.00, 58.60, '2023-02-10 15:00:00', 0, '2023-02-10 15:00:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (21, 5, 5, 280.50, 'N·m', 900.00, 65.20, '2023-02-15 10:00:00', 1, '2023-02-15 10:00:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (22, 5, 5, 285.30, 'N·m', 910.00, 65.60, '2023-02-15 10:30:00', 1, '2023-02-15 10:30:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (23, 5, 5, 282.80, 'N·m', 905.00, 65.40, '2023-02-15 11:00:00', 1, '2023-02-15 11:00:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (24, 5, 5, 284.20, 'N·m', 908.00, 65.50, '2023-02-15 11:30:00', 1, '2023-02-15 11:30:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (25, 5, 5, 360.40, 'N·m', 950.00, 72.30, '2023-02-15 12:00:00', 0, '2023-02-15 12:00:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (26, 9, 11, 350.60, 'N·m', 650.00, 68.40, '2023-03-05 09:00:00', 1, '2023-03-05 09:00:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (27, 9, 11, 355.20, 'N·m', 660.00, 68.80, '2023-03-05 09:30:00', 1, '2023-03-05 09:30:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (28, 9, 11, 352.90, 'N·m', 655.00, 68.60, '2023-03-05 10:00:00', 1, '2023-03-05 10:00:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (29, 9, 11, 354.30, 'N·m', 658.00, 68.70, '2023-03-05 10:30:00', 1, '2023-03-05 10:30:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (30, 9, 11, 510.20, 'N·m', 700.00, 75.40, '2023-03-05 11:00:00', 0, '2023-03-05 11:00:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (31, 10, 12, 75.40, 'N·m', 2000.00, 45.20, '2023-03-10 14:15:00', 1, '2023-03-10 14:15:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (32, 10, 12, 78.60, 'N·m', 2020.00, 45.60, '2023-03-10 14:45:00', 1, '2023-03-10 14:45:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (33, 10, 12, 76.90, 'N·m', 2010.00, 45.40, '2023-03-10 15:15:00', 1, '2023-03-10 15:15:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (34, 10, 12, 77.50, 'N·m', 2005.00, 45.30, '2023-03-10 15:45:00', 1, '2023-03-10 15:45:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (35, 10, 12, 0.50, 'N·m', 1800.00, 32.10, '2023-03-10 16:15:00', 0, '2023-03-10 16:15:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (36, 15, 13, 180.30, 'N·m', 3000.00, 58.40, '2023-03-15 08:30:00', 1, '2023-03-15 08:30:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (37, 15, 13, 185.60, 'N·m', 3020.00, 58.80, '2023-03-15 09:00:00', 1, '2023-03-15 09:00:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (38, 15, 13, 182.90, 'N·m', 3010.00, 58.60, '2023-03-15 09:30:00', 1, '2023-03-15 09:30:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (39, 15, 13, 184.20, 'N·m', 3015.00, 58.70, '2023-03-15 10:00:00', 1, '2023-03-15 10:00:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (40, 15, 13, 255.40, 'N·m', 3100.00, 65.20, '2023-03-15 10:30:00', 0, '2023-03-15 10:30:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (41, 12, 15, 220.50, 'N·m', 1200.00, 61.30, '2023-03-20 13:45:00', 1, '2023-03-20 13:45:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (42, 12, 15, 225.80, 'N·m', 1220.00, 61.70, '2023-03-20 14:15:00', 1, '2023-03-20 14:15:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (43, 12, 15, 223.20, 'N·m', 1210.00, 61.50, '2023-03-20 14:45:00', 1, '2023-03-20 14:45:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (44, 12, 15, 224.60, 'N·m', 1215.00, 61.60, '2023-03-20 15:15:00', 1, '2023-03-20 15:15:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (45, 12, 15, 58.20, 'N·m', 1100.00, 45.30, '2023-03-20 15:45:00', 0, '2023-03-20 15:45:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (46, 3, 17, 155.40, 'N·m', 1500.00, 54.20, '2023-04-05 09:30:00', 1, '2023-04-05 09:30:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (47, 3, 17, 160.70, 'N·m', 1520.00, 54.60, '2023-04-05 10:00:00', 1, '2023-04-05 10:00:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (48, 3, 17, 158.20, 'N·m', 1510.00, 54.40, '2023-04-05 10:30:00', 1, '2023-04-05 10:30:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (49, 3, 17, 159.50, 'N·m', 1515.00, 54.50, '2023-04-05 11:00:00', 1, '2023-04-05 11:00:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (50, 3, 17, 225.30, 'N·m', 1600.00, 62.40, '2023-04-05 11:30:00', 0, '2023-04-05 11:30:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (51, 1, 19, 110.60, 'N·m', 1800.00, 48.30, '2023-04-10 14:00:00', 1, '2023-04-10 14:00:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (52, 1, 19, 115.90, 'N·m', 1820.00, 48.70, '2023-04-10 14:30:00', 1, '2023-04-10 14:30:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (53, 1, 19, 113.20, 'N·m', 1810.00, 48.50, '2023-04-10 15:00:00', 1, '2023-04-10 15:00:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (54, 1, 19, 114.70, 'N·m', 1815.00, 48.60, '2023-04-10 15:30:00', 1, '2023-04-10 15:30:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (55, 1, 19, 18.30, 'N·m', 1700.00, 35.20, '2023-04-10 16:00:00', 0, '2023-04-10 16:00:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (56, 2, 21, 190.40, 'N·m', 1600.00, 58.50, '2023-04-15 09:15:00', 1, '2023-04-15 09:15:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (57, 2, 21, 195.70, 'N·m', 1620.00, 58.90, '2023-04-15 09:45:00', 1, '2023-04-15 09:45:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (58, 2, 21, 193.20, 'N·m', 1610.00, 58.70, '2023-04-15 10:15:00', 1, '2023-04-15 10:15:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (59, 2, 21, 194.50, 'N·m', 1615.00, 58.80, '2023-04-15 10:45:00', 1, '2023-04-15 10:45:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (60, 2, 21, 290.30, 'N·m', 1700.00, 66.40, '2023-04-15 11:15:00', 0, '2023-04-15 11:15:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (61, 9, 23, 145.20, 'N·m', 1300.00, 52.40, '2023-04-20 13:30:00', 1, '2023-04-20 13:30:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (62, 9, 23, 150.60, 'N·m', 1320.00, 52.80, '2023-04-20 14:00:00', 1, '2023-04-20 14:00:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (63, 9, 23, 147.90, 'N·m', 1310.00, 52.60, '2023-04-20 14:30:00', 1, '2023-04-20 14:30:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (64, 9, 23, 149.30, 'N·m', 1315.00, 52.70, '2023-04-20 15:00:00', 1, '2023-04-20 15:00:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (65, 9, 23, 185.60, 'N·m', 1400.00, 60.30, '2023-04-20 15:30:00', 0, '2023-04-20 15:30:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (66, 4, 6, 65.30, 'N·m', 1600.00, 42.50, '2023-05-05 09:45:00', 1, '2023-05-05 09:45:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (67, 4, 6, 70.60, 'N·m', 1620.00, 42.90, '2023-05-05 10:15:00', 1, '2023-05-05 10:15:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (68, 4, 6, 68.20, 'N·m', 1610.00, 42.70, '2023-05-05 10:45:00', 1, '2023-05-05 10:45:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (69, 4, 6, 69.50, 'N·m', 1615.00, 42.80, '2023-05-05 11:15:00', 1, '2023-05-05 11:15:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (70, 4, 6, 3.20, 'N·m', 1500.00, 30.20, '2023-05-05 11:45:00', 0, '2023-05-05 11:45:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (71, 15, 8, 105.40, 'N·m', 2000.00, 47.60, '2023-05-10 14:30:00', 1, '2023-05-10 14:30:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (72, 15, 8, 110.80, 'N·m', 2020.00, 48.00, '2023-05-10 15:00:00', 1, '2023-05-10 15:00:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (73, 15, 8, 108.20, 'N·m', 2010.00, 47.80, '2023-05-10 15:30:00', 1, '2023-05-10 15:30:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (74, 15, 8, 109.60, 'N·m', 2015.00, 47.90, '2023-05-10 16:00:00', 1, '2023-05-10 16:00:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (75, 15, 8, 155.20, 'N·m', 2100.00, 55.40, '2023-05-10 16:30:00', 0, '2023-05-10 16:30:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (76, 3, 7, 125.50, 'N·m', 1700.00, 50.30, '2023-05-15 09:00:00', 1, '2023-05-15 09:00:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (77, 3, 7, 130.80, 'N·m', 1720.00, 50.70, '2023-05-15 09:30:00', 1, '2023-05-15 09:30:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (78, 3, 7, 128.20, 'N·m', 1710.00, 50.50, '2023-05-15 10:00:00', 1, '2023-05-15 10:00:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (79, 3, 7, 129.60, 'N·m', 1715.00, 50.60, '2023-05-15 10:30:00', 1, '2023-05-15 10:30:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (80, 3, 7, 180.30, 'N·m', 1800.00, 58.20, '2023-05-15 11:00:00', 0, '2023-05-15 11:00:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (81, 12, 24, 115.60, 'N·m', 1400.00, 49.20, '2023-06-01 13:45:00', 1, '2023-06-01 13:45:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (82, 12, 24, 120.90, 'N·m', 1420.00, 49.60, '2023-06-01 14:15:00', 1, '2023-06-01 14:15:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (83, 12, 24, 118.30, 'N·m', 1410.00, 49.40, '2023-06-01 14:45:00', 1, '2023-06-01 14:45:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (84, 12, 24, 119.70, 'N·m', 1415.00, 49.50, '2023-06-01 15:15:00', 1, '2023-06-01 15:15:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (85, 12, 24, 10.20, 'N·m', 1300.00, 32.30, '2023-06-01 15:45:00', 0, '2023-06-01 15:45:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (86, 5, 14, 85.30, 'N·m', 1900.00, 45.40, '2023-06-10 09:15:00', 1, '2023-06-10 09:15:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (87, 5, 14, 90.60, 'N·m', 1920.00, 45.80, '2023-06-10 09:45:00', 1, '2023-06-10 09:45:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (88, 5, 14, 88.20, 'N·m', 1910.00, 45.60, '2023-06-10 10:15:00', 1, '2023-06-10 10:15:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (89, 5, 14, 89.50, 'N·m', 1915.00, 45.70, '2023-06-10 10:45:00', 1, '2023-06-10 10:45:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (90, 5, 14, 125.60, 'N·m', 2000.00, 53.20, '2023-06-10 11:15:00', 0, '2023-06-10 11:15:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (91, 10, 16, 60.40, 'N·m', 2200.00, 41.30, '2023-06-15 14:00:00', 1, '2023-06-15 14:00:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (92, 10, 16, 65.70, 'N·m', 2220.00, 41.70, '2023-06-15 14:30:00', 1, '2023-06-15 14:30:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (93, 10, 16, 63.20, 'N·m', 2210.00, 41.50, '2023-06-15 15:00:00', 1, '2023-06-15 15:00:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (94, 10, 16, 64.50, 'N·m', 2215.00, 41.60, '2023-06-15 15:30:00', 1, '2023-06-15 15:30:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (95, 10, 16, 85.30, 'N·m', 2300.00, 48.20, '2023-06-15 16:00:00', 0, '2023-06-15 16:00:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (96, 1, 20, 75.20, 'N·m', 1500.00, 44.30, '2023-06-20 09:30:00', 1, '2023-06-20 09:30:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (97, 1, 20, 80.50, 'N·m', 1520.00, 44.70, '2023-06-20 10:00:00', 1, '2023-06-20 10:00:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (98, 1, 20, 78.10, 'N·m', 1510.00, 44.50, '2023-06-20 10:30:00', 1, '2023-06-20 10:30:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (99, 1, 20, 79.40, 'N·m', 1515.00, 44.60, '2023-06-20 11:00:00', 1, '2023-06-20 11:00:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (100, 1, 20, 2.30, 'N·m', 1400.00, 28.20, '2023-06-20 11:30:00', 0, '2023-06-20 11:30:00', 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (101, 1, 1, 20.50, 'N·m', 1000.00, 25.30, '2025-05-03 21:44:11', 1, null, 'admin');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (105, 1, 1, 35.00, 'N·m', null, null, '2025-05-03 19:53:24', 1, null, 'Newton');
INSERT INTO ry_vue.torque_data (data_id, sensor_id, device_id, torque_value, torque_unit, rpm, temperature, data_time,
                                data_quality, create_time, operator)
VALUES (106, 1, 1, 35.00, 'N·m', null, null, '2025-05-03 21:47:46', 1, null, 'Newton');
