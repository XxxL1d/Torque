import request from '@/utils/request'

// 查询系统用户列表（简化版，只返回用户名和昵称）
export function listUsers() {
  return request({
    url: '/system/user/listAll',
    method: 'get'
  })
}

// 查询操作员角色的用户列表
export function listOperatorUsers() {
  return request({
    url: '/system/user/listOperators',
    method: 'get'
  })
} 