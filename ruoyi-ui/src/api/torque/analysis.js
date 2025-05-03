import request from '@/utils/request'

// 获取扭矩趋势分析数据
export function getTrendAnalysis(params) {
  return request({
    url: '/torque/analysis/trend',
    method: 'get',
    params: params
  })
}

// 获取设备对比分析数据
export function getDeviceComparison(params) {
  return request({
    url: '/torque/analysis/deviceComparison',
    method: 'get',
    params: params
  })
}

// 获取传感器对比分析数据
export function getSensorComparison(params) {
  return request({
    url: '/torque/analysis/sensorComparison',
    method: 'get',
    params: params
  })
}

// 获取异常数据分析
export function getAnomalyAnalysis(params) {
  return request({
    url: '/torque/analysis/anomaly',
    method: 'get',
    params: params
  })
}

// 获取综合分析报告
export function getComprehensiveReport(params) {
  return request({
    url: '/torque/analysis/report',
    method: 'get',
    params: params
  })
}

// 查询分析数据列表
export function listAnalysis(query) {
  // 确保传递正确的查询参数
  const params = { ...query };
  
  // 如果有设备ID但没有设备名称，尝试添加设备名称参数
  if (params.deviceId && !params.deviceName) {
    // deviceName参数可能在后端需要
    console.log('查询参数 deviceId:', params.deviceId);
  }
  
  // 处理时间范围参数
  if (params.startTime) {
    console.log('查询开始时间:', params.startTime);
  }
  
  if (params.endTime) {
    console.log('查询结束时间:', params.endTime);
  }
  
  return request({
    url: '/torque/analysis/list',
    method: 'get',
    params: params
  });
}

// 获取分析数据详细信息
export function getAnalysis(id) {
  return request({
    url: '/torque/analysis/' + id,
    method: 'get'
  })
}

// 导出分析数据
export function exportAnalysis(query) {
  return request({
    url: '/torque/analysis/export',
    method: 'get',
    params: query
  })
} 