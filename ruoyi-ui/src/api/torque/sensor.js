import request from '@/utils/request'

// 查询传感器列表
export function listSensor(query) {
  return request({
    url: '/torque/sensor/list',
    method: 'get',
    params: query
  })
}

// 查询传感器详细
export function getSensor(sensorId) {
  return request({
    url: '/torque/sensor/' + sensorId,
    method: 'get'
  })
}

// 新增传感器
export function addSensor(data) {
  return request({
    url: '/torque/sensor',
    method: 'post',
    data: data
  })
}

// 修改传感器
export function updateSensor(data) {
  return request({
    url: '/torque/sensor',
    method: 'put',
    data: data
  })
}

// 删除传感器
export function delSensor(sensorId) {
  return request({
    url: '/torque/sensor/' + sensorId,
    method: 'delete'
  })
}

// 导出传感器
export function exportSensor(query) {
  return request({
    url: '/torque/sensor/export',
    method: 'get',
    params: query
  })
} 