# 扭矩监测模块

## 简介
扭矩监测模块是一个基于RuoYi-Vue框架开发的扩展模块，用于管理和监控各种设备的扭矩数据。该模块提供传感器信息管理、设备信息管理、扭矩数据记录和分析等功能。

## 功能列表
1. 传感器管理
   - 传感器信息CRUD
   - 传感器状态监控
   - 传感器校准管理

2. 设备管理
   - 设备信息CRUD
   - 设备状态监控
   - 设备维护管理

3. 扭矩数据
   - 实时数据采集
   - 历史数据查询
   - 异常数据标记

4. 数据分析
   - 趋势分析
   - 设备对比
   - 传感器对比
   - 异常分析
   - 综合报告

## 技术架构
- 前端：Vue.js, Element UI, ECharts
- 后端：Spring Boot, MyBatis
- 数据库：MySQL

## 安装部署
1. 导入SQL脚本
   ```sql
   # 导入表结构
   source /path/to/ruoyi-torque/src/main/resources/sql/torque_sql.sql
   
   # 导入测试数据（可选）
   source /path/to/ruoyi-torque/src/main/resources/sql/torque_test_data.sql
   ```

2. 修改数据库配置
   在`application-druid.yml`中配置数据库连接信息。

3. 启动应用
   ```bash
   # 开发环境
   java -jar ruoyi-admin.jar --spring.profiles.active=dev
   
   # 生产环境
   java -jar ruoyi-admin.jar --spring.profiles.active=prod
   ```

4. 访问系统
   默认访问地址：http://localhost:8081
   默认用户名/密码：admin/admin123

## API接口
详细API文档见Swagger接口文档：http://localhost:8081/swagger-ui.html

### 主要接口
1. 传感器管理: `/torque/sensor/**`
2. 设备管理: `/torque/device/**`
3. 扭矩数据: `/torque/data/**`
4. 数据分析: `/torque/analysis/**` 