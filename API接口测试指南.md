# Postman测试扭矩监控系统API接口指南

## 一、Postman环境配置

### 1. 创建测试环境
- 点击"Environments"，创建新环境"扭矩监控系统测试环境"
- 设置环境变量：
  ```
  baseUrl: http://localhost:8080
  token: 空（登录后会自动更新）
  ```

### 2. 设置全局预处理脚本
- 创建请求的预处理脚本，统一处理认证：
  ```javascript
  pm.request.headers.add({
    key: 'Authorization', 
    value: 'Bearer ' + pm.environment.get('token')
  });
  ```

## 二、创建API测试集合

### 1. 用户认证测试集合
- 创建登录请求：
  ```
  POST {{baseUrl}}/login
  Content-Type: application/json
  
  {
    "username": "admin",
    "password": "admin123",
    "code": "1234",
    "uuid": "xxxxxx"
  }
  ```
- 添加测试脚本自动获取token：
  ```javascript
  pm.test("登录成功", function () {
    pm.response.to.have.status(200);
    var jsonData = pm.response.json();
    pm.expect(jsonData.code).to.eql(200);
    if (jsonData.token) {
      pm.environment.set("token", jsonData.token);
    }
  });
  ```

### 2. 传感器管理API测试集合

#### 传感器列表查询
```
GET {{baseUrl}}/torque/sensor/list
Content-Type: application/json
```
测试脚本：
```javascript
pm.test("传感器列表查询成功", function () {
  pm.response.to.have.status(200);
  var jsonData = pm.response.json();
  pm.expect(jsonData.code).to.eql(200);
  pm.expect(jsonData.rows).to.be.an('array');
});
```

#### 传感器添加
```
POST {{baseUrl}}/torque/sensor
Content-Type: application/json

{
  "sensorName": "测试传感器TA001",
  "sensorType": "扭矩传感器",
  "modelNumber": "TQ-TEST-001",
  "manufacturer": "上海精密仪器厂",
  "measurementRange": "0-200N·m",
  "accuracy": "±0.5%",
  "protocolType": "ModBus",
  "connectionParams": "{\"port\":\"COM10\",\"baudRate\":9600,\"dataBits\":8,\"parity\":\"N\",\"stopBits\":1}",
  "installationLocation": "测试生产线",
  "installationDate": "2025-04-24",
  "calibrationDate": "2025-04-24",
  "nextCalibrationDate": "2025-10-24",
  "status": 0,
  "remark": "测试用传感器"
}
```
测试脚本：
```javascript
pm.test("传感器添加成功", function () {
  pm.response.to.have.status(200);
  var jsonData = pm.response.json();
  pm.expect(jsonData.code).to.eql(200);
  
  // 存储新创建的传感器ID，用于后续测试
  if (jsonData.data) {
    pm.environment.set("testSensorId", jsonData.data);
  }
});
```

#### 传感器详情查询
```
GET {{baseUrl}}/torque/sensor/{{testSensorId}}
```
测试脚本：
```javascript
pm.test("传感器详情查询成功", function () {
  pm.response.to.have.status(200);
  var jsonData = pm.response.json();
  pm.expect(jsonData.code).to.eql(200);
  pm.expect(jsonData.data).to.be.an('object');
  pm.expect(jsonData.data.sensorName).to.eql("测试传感器");
});
```

#### 传感器修改
```
PUT {{baseUrl}}/torque/sensor
Content-Type: application/json

{
  "sensorId": {{testSensorId}},
  "sensorName": "修改后的传感器",
  "sensorModel": "TQ-2000",
  "manufacturerId": 1,
  "calibrationDate": "2023-05-01",
  "accuracyClass": "0.5",
  "measureRange": "0-2000N·m",
  "status": "0"
}
```
测试脚本：
```javascript
pm.test("传感器修改成功", function () {
  pm.response.to.have.status(200);
  var jsonData = pm.response.json();
  pm.expect(jsonData.code).to.eql(200);
});
```

#### 传感器删除
```
DELETE {{baseUrl}}/torque/sensor/{{testSensorId}}
```
测试脚本：
```javascript
pm.test("传感器删除成功", function () {
  pm.response.to.have.status(200);
  var jsonData = pm.response.json();
  pm.expect(jsonData.code).to.eql(200);
});
```

### 3. 设备管理API测试集合

#### 设备列表查询
```
GET {{baseUrl}}/torque/device/list
Content-Type: application/json
```
测试脚本：
```javascript
pm.test("设备列表查询成功", function () {
  pm.response.to.have.status(200);
  var jsonData = pm.response.json();
  pm.expect(jsonData.code).to.eql(200);
  pm.expect(jsonData.rows).to.be.an('array');
});
```

#### 设备添加
```
POST {{baseUrl}}/torque/device
Content-Type: application/json

{
  "deviceName": "测试设备",
  "deviceType": "测试台",
  "modelNumber": "DEV-1000",
  "manufacturer": "测试制造商",
  "productionDate": "2023-05-01",
  "installationLocation": "测试实验室",
  "department": "研发部",
  "responsiblePerson": "测试工程师",
  "status": 0,
  "maintenanceCycle": 30,
  "lastMaintenanceDate": "2023-04-01",
  "nextMaintenanceDate": "2023-05-01",
  "remark": "测试用设备"
}
```
测试脚本：
```javascript
pm.test("设备添加成功", function () {
  pm.response.to.have.status(200);
  var jsonData = pm.response.json();
  pm.expect(jsonData.code).to.eql(200);
  
  // 存储新创建的设备ID，用于后续测试
  if (jsonData.data) {
    pm.environment.set("testDeviceId", jsonData.data);
  }
});
```

### 4. 扭矩数据API测试集合

#### 扭矩数据列表查询
```
GET {{baseUrl}}/torque/data/list
params:
  sensorId: 1
  pageNum: 1
  pageSize: 10
```
测试脚本：
```javascript
pm.test("扭矩数据列表查询成功", function () {
  pm.response.to.have.status(200);
  var jsonData = pm.response.json();
  pm.expect(jsonData.code).to.eql(200);
  pm.expect(jsonData.rows).to.be.an('array');
  pm.expect(jsonData.total).to.be.a('number');
});
```

#### 扭矩数据详细信息查询
```
GET {{baseUrl}}/torque/data/{{testDataId}}
```
测试脚本：
```javascript
pm.test("扭矩数据详情查询成功", function () {
  pm.response.to.have.status(200);
  var jsonData = pm.response.json();
  pm.expect(jsonData.code).to.eql(200);
  pm.expect(jsonData.data).to.be.an('object');
  pm.expect(jsonData.data.dataId).to.eql(Number(pm.environment.get("testDataId")));
});
```

#### 新增扭矩数据
```
POST {{baseUrl}}/torque/data
Content-Type: application/json

{
  "sensorId": 1,
  "deviceId": 1,
  "torqueValue": 150.5,
  "torqueUnit": "N·m",
  "rpm": 1500.0,
  "temperature": 45.2,
  "dataTime": "2025-04-24 12:00:00",
  "dataQuality": 1
}
```
测试脚本：
```javascript
pm.test("新增扭矩数据成功", function () {
  pm.response.to.have.status(200);
  var jsonData = pm.response.json();
  pm.expect(jsonData.code).to.eql(200);
  
  // 存储新创建的数据ID
  if (jsonData.data) {
    pm.environment.set("newDataId", jsonData.data);
  }
});
```

#### 修改扭矩数据
```
PUT {{baseUrl}}/torque/data
Content-Type: application/json

{
  "dataId": {{newDataId}},
  "sensorId": 1,
  "deviceId": 1,
  "torqueValue": 155.5,
  "torqueUnit": "N·m",
  "rpm": 1550.0,
  "temperature": 46.2,
  "dataTime": "2025-04-24 12:00:00",
  "dataQuality": 1
}
```
测试脚本：
```javascript
pm.test("修改扭矩数据成功", function () {
  pm.response.to.have.status(200);
  var jsonData = pm.response.json();
  pm.expect(jsonData.code).to.eql(200);
});
```

#### 导出扭矩数据
```
POST {{baseUrl}}/torque/data/export
Content-Type: application/json
params:
  sensorId: 1
```
测试脚本：
```javascript
pm.test("导出扭矩数据成功", function () {
  pm.response.to.have.status(200);
  pm.expect(pm.response.headers.get('Content-Type')).to.include('application/vnd.ms-excel');
});
```

#### 删除扭矩数据
```
DELETE {{baseUrl}}/torque/data/{{newDataId}}
```
测试脚本：
```javascript
pm.test("删除扭矩数据成功", function () {
  pm.response.to.have.status(200);
  var jsonData = pm.response.json();
  pm.expect(jsonData.code).to.eql(200);
});
```

### 5. 数据分析API测试集合

#### 趋势分析
```
GET {{baseUrl}}/torque/analysis/trend
params:
  sensorId: 1
  startTime: 2023-05-01 00:00:00
  endTime: 2023-05-31 23:59:59
  interval: day
```
测试脚本：
```javascript
pm.test("趋势分析查询成功", function () {
  pm.response.to.have.status(200);
  var jsonData = pm.response.json();
  pm.expect(jsonData.code).to.eql(200);
  pm.expect(jsonData.data).to.be.an('object');
  pm.expect(jsonData.data.xAxis).to.be.an('array');
  pm.expect(jsonData.data.series).to.be.an('array');
});
```

## 三、创建测试流程自动化

### 1. 创建测试集合运行顺序
- 创建测试集合运行器(Collection Runner)
- 按照以下顺序添加测试项：
  1. 用户认证
  2. 传感器管理测试
  3. 设备管理测试
  4. 扭矩数据测试
  5. 数据分析测试

### 2. 添加数据依赖处理
- 使用环境变量在测试间传递数据
- 每个测试都添加必要的检查和断言

## 四、执行测试与生成报告

### 1. 运行测试集合
```
1. 选择正确的环境
2. 点击Collection Runner运行整个测试集合
3. 设置迭代次数：1
4. 勾选"保存响应"以便后续分析
5. 点击"Run"开始测试
```

### 2. 查看测试结果
- 查看测试通过、失败数量
- 查看失败项的详细信息和响应内容
- 分析API性能指标(响应时间)

### 3. 生成测试报告
```
1. 测试完成后，点击"Export Results"
2. 选择导出格式（如JSON或CSV）
3. 生成HTML格式的可视化测试报告
```

## 五、常见问题解决方案

### 1. 认证问题
- 检查token是否正确获取和设置
- 确认token格式是否正确（Bearer格式）
- 验证token是否过期

### 2. 请求参数问题
- 检查参数名称和格式是否正确
- 验证必填参数是否都已提供
- 确认日期格式是否符合要求

### 3. 响应解析问题
- 检查响应格式是否与预期一致
- 确认JSON解析是否正确
- 验证测试脚本中的属性路径是否正确

通过以上Postman测试方法，可以全面测试扭矩监控系统的各个API接口，验证其功能正确性、性能表现和异常处理能力，为系统质量提供保障。