package com.ruoyi.torque.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.torque.mapper.SensorInfoMapper;
import com.ruoyi.torque.domain.SensorInfo;
import com.ruoyi.torque.service.ISensorInfoService;

/**
 * 传感器信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-04-09
 */
@Service
public class SensorInfoServiceImpl implements ISensorInfoService 
{
    @Autowired
    private SensorInfoMapper sensorInfoMapper;

    /**
     * 查询传感器信息
     * 
     * @param sensorId 传感器信息ID
     * @return 传感器信息
     */
    @Override
    public SensorInfo selectSensorInfoById(Long sensorId)
    {
        return sensorInfoMapper.selectSensorInfoBySensorId(sensorId);
    }

    /**
     * 查询传感器信息列表
     * 
     * @param sensorInfo 传感器信息
     * @return 传感器信息
     */
    @Override
    public List<SensorInfo> selectSensorInfoList(SensorInfo sensorInfo)
    {
        return sensorInfoMapper.selectSensorInfoList(sensorInfo);
    }

    /**
     * 新增传感器信息
     * 
     * @param sensorInfo 传感器信息
     * @return 结果
     */
    @Override
    public int insertSensorInfo(SensorInfo sensorInfo)
    {
        return sensorInfoMapper.insertSensorInfo(sensorInfo);
    }

    /**
     * 修改传感器信息
     * 
     * @param sensorInfo 传感器信息
     * @return 结果
     */
    @Override
    public int updateSensorInfo(SensorInfo sensorInfo)
    {
        return sensorInfoMapper.updateSensorInfo(sensorInfo);
    }

    /**
     * 批量删除传感器信息
     * 
     * @param sensorIds 需要删除的传感器信息ID
     * @return 结果
     */
    @Override
    public int deleteSensorInfoByIds(Long[] sensorIds)
    {
        return sensorInfoMapper.deleteSensorInfoBySensorIds(sensorIds);
    }

    /**
     * 删除传感器信息信息
     * 
     * @param sensorId 传感器信息ID
     * @return 结果
     */
    @Override
    public int deleteSensorInfoById(Long sensorId)
    {
        return sensorInfoMapper.deleteSensorInfoBySensorId(sensorId);
    }
} 