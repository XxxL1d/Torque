import request from '@/utils/request'

// 查询扭矩数据列表
export function listTorqueData(query) {
  return request({
    url: '/torque/data/list',
    method: 'get',
    params: query
  })
}

// 查询扭矩数据详细
export function getTorqueData(dataId) {
  return request({
    url: '/torque/data/' + dataId,
    method: 'get'
  })
}

// 新增扭矩数据
export function addTorqueData(data) {
  return request({
    url: '/torque/data',
    method: 'post',
    data: data
  })
}

// 修改扭矩数据
export function updateTorqueData(data) {
  return request({
    url: '/torque/data',
    method: 'put',
    data: data
  })
}

// 删除扭矩数据
export function delTorqueData(dataId) {
  return request({
    url: '/torque/data/' + dataId,
    method: 'delete'
  })
}

// 导出扭矩数据
export function exportTorqueData(query) {
  return request({
    url: '/torque/data/export',
    method: 'get',
    params: query
  })
}

// 获取统计数据
export function getStatistics(params) {
  return request({
    url: '/torque/data/statistics',
    method: 'get',
    params: params
  })
} 