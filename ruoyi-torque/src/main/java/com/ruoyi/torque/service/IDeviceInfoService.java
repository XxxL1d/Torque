package com.ruoyi.torque.service;

import java.util.List;
import com.ruoyi.torque.domain.DeviceInfo;

/**
 * 设备信息Service接口
 * 
 * @author ruoyi
 */
public interface IDeviceInfoService 
{
    /**
     * 查询设备信息
     * 
     * @param deviceId 设备信息ID
     * @return 设备信息
     */
    public DeviceInfo selectDeviceInfoById(Long deviceId);

    /**
     * 查询设备信息列表
     * 
     * @param deviceInfo 设备信息
     * @return 设备信息集合
     */
    public List<DeviceInfo> selectDeviceInfoList(DeviceInfo deviceInfo);

    /**
     * 新增设备信息
     * 
     * @param deviceInfo 设备信息
     * @return 结果
     */
    public int insertDeviceInfo(DeviceInfo deviceInfo);

    /**
     * 修改设备信息
     * 
     * @param deviceInfo 设备信息
     * @return 结果
     */
    public int updateDeviceInfo(DeviceInfo deviceInfo);

    /**
     * 批量删除设备信息
     * 
     * @param deviceIds 需要删除的设备信息ID
     * @return 结果
     */
    public int deleteDeviceInfoByIds(Long[] deviceIds);

    /**
     * 删除设备信息信息
     * 
     * @param deviceId 设备信息ID
     * @return 结果
     */
    public int deleteDeviceInfoById(Long deviceId);
} 