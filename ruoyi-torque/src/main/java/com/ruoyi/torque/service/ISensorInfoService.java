package com.ruoyi.torque.service;

import java.util.List;
import com.ruoyi.torque.domain.SensorInfo;

/**
 * 传感器信息Service接口
 * 
 * @author ruoyi
 * @date 2023-04-09
 */
public interface ISensorInfoService 
{
    /**
     * 查询传感器信息
     * 
     * @param sensorId 传感器信息ID
     * @return 传感器信息
     */
    public SensorInfo selectSensorInfoById(Long sensorId);

    /**
     * 查询传感器信息列表
     * 
     * @param sensorInfo 传感器信息
     * @return 传感器信息集合
     */
    public List<SensorInfo> selectSensorInfoList(SensorInfo sensorInfo);

    /**
     * 新增传感器信息
     * 
     * @param sensorInfo 传感器信息
     * @return 结果
     */
    public int insertSensorInfo(SensorInfo sensorInfo);

    /**
     * 修改传感器信息
     * 
     * @param sensorInfo 传感器信息
     * @return 结果
     */
    public int updateSensorInfo(SensorInfo sensorInfo);

    /**
     * 批量删除传感器信息
     * 
     * @param sensorIds 需要删除的传感器信息ID
     * @return 结果
     */
    public int deleteSensorInfoByIds(Long[] sensorIds);

    /**
     * 删除传感器信息信息
     * 
     * @param sensorId 传感器信息ID
     * @return 结果
     */
    public int deleteSensorInfoById(Long sensorId);
} 