package com.ruoyi.torque.mapper;

import java.util.List;
import java.util.Map;
import com.ruoyi.torque.domain.TorqueData;

/**
 * 扭矩数据Mapper接口
 * 
 * @author ruoyi
 */
public interface TorqueDataMapper 
{
    /**
     * 查询扭矩数据
     * 
     * @param dataId 扭矩数据ID
     * @return 扭矩数据
     */
    public TorqueData selectTorqueDataByDataId(Long dataId);

    /**
     * 查询扭矩数据列表
     * 
     * @param torqueData 扭矩数据
     * @return 扭矩数据集合
     */
    public List<TorqueData> selectTorqueDataList(TorqueData torqueData);

    /**
     * 查询传感器最新数据
     * 
     * @param sensorId 传感器ID
     * @return 扭矩数据
     */
    public TorqueData selectLatestTorqueDataBySensorId(Long sensorId);

    /**
     * 查询扭矩数据统计信息
     * 
     * @param params 参数
     * @return 统计信息
     */
    public Map<String, Object> selectTorqueDataStatistics(Map<String, Object> params);

    /**
     * 新增扭矩数据
     * 
     * @param torqueData 扭矩数据
     * @return 结果
     */
    public int insertTorqueData(TorqueData torqueData);

    /**
     * 批量新增扭矩数据
     * 
     * @param torqueDataList 扭矩数据列表
     * @return 结果
     */
    public int batchInsertTorqueData(List<TorqueData> torqueDataList);

    /**
     * 修改扭矩数据
     * 
     * @param torqueData 扭矩数据
     * @return 结果
     */
    public int updateTorqueData(TorqueData torqueData);

    /**
     * 删除扭矩数据
     * 
     * @param dataId 扭矩数据ID
     * @return 结果
     */
    public int deleteTorqueDataByDataId(Long dataId);

    /**
     * 批量删除扭矩数据
     * 
     * @param dataIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteTorqueDataByDataIds(Long[] dataIds);
} 