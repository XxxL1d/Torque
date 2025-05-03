package com.ruoyi.torque.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.torque.mapper.DeviceInfoMapper;
import com.ruoyi.torque.domain.DeviceInfo;
import com.ruoyi.torque.service.IDeviceInfoService;

/**
 * 设备信息Service业务层处理
 * 
 * @author ruoyi
 */
@Service
public class DeviceInfoServiceImpl implements IDeviceInfoService 
{
    @Autowired
    private DeviceInfoMapper deviceInfoMapper;

    /**
     * 查询设备信息
     * 
     * @param deviceId 设备信息ID
     * @return 设备信息
     */
    @Override
    public DeviceInfo selectDeviceInfoById(Long deviceId)
    {
        return deviceInfoMapper.selectDeviceInfoByDeviceId(deviceId);
    }

    /**
     * 查询设备信息列表
     * 
     * @param deviceInfo 设备信息
     * @return 设备信息
     */
    @Override
    public List<DeviceInfo> selectDeviceInfoList(DeviceInfo deviceInfo)
    {
        return deviceInfoMapper.selectDeviceInfoList(deviceInfo);
    }

    /**
     * 新增设备信息
     * 
     * @param deviceInfo 设备信息
     * @return 结果
     */
    @Override
    public int insertDeviceInfo(DeviceInfo deviceInfo)
    {
        return deviceInfoMapper.insertDeviceInfo(deviceInfo);
    }

    /**
     * 修改设备信息
     * 
     * @param deviceInfo 设备信息
     * @return 结果
     */
    @Override
    public int updateDeviceInfo(DeviceInfo deviceInfo)
    {
        return deviceInfoMapper.updateDeviceInfo(deviceInfo);
    }

    /**
     * 批量删除设备信息
     * 
     * @param deviceIds 需要删除的设备信息ID
     * @return 结果
     */
    @Override
    public int deleteDeviceInfoByIds(Long[] deviceIds)
    {
        return deviceInfoMapper.deleteDeviceInfoByDeviceIds(deviceIds);
    }

    /**
     * 删除设备信息信息
     * 
     * @param deviceId 设备信息ID
     * @return 结果
     */
    @Override
    public int deleteDeviceInfoById(Long deviceId)
    {
        return deviceInfoMapper.deleteDeviceInfoByDeviceId(deviceId);
    }
} 