package com.ruoyi.torque.mapper;

import java.util.List;
import com.ruoyi.torque.domain.SensorInfo;

/**
 * 传感器信息Mapper接口
 * 
 * @author ruoyi
 * @date 2023-04-09
 */
public interface SensorInfoMapper 
{
    /**
     * 查询传感器信息
     * 
     * @param sensorId 传感器信息ID
     * @return 传感器信息
     */
    public SensorInfo selectSensorInfoBySensorId(Long sensorId);

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
     * 删除传感器信息
     * 
     * @param sensorId 传感器信息ID
     * @return 结果
     */
    public int deleteSensorInfoBySensorId(Long sensorId);

    /**
     * 批量删除传感器信息
     * 
     * @param sensorIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteSensorInfoBySensorIds(Long[] sensorIds);
} 