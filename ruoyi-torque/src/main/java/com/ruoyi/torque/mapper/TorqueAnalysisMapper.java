package com.ruoyi.torque.mapper;

import java.util.List;
import java.util.Map;
import com.ruoyi.torque.domain.TorqueAnalysis;
import com.ruoyi.torque.domain.TorqueData;

/**
 * 扭矩数据分析Mapper接口
 * 
 * @author ruoyi
 */
public interface TorqueAnalysisMapper 
{
    /**
     * 查询趋势分析数据
     * 
     * @param params 分析查询条件
     * @return 趋势分析数据集合
     */
    public List<TorqueData> selectTrendData(Map<String, Object> params);

    /**
     * 按设备对比分析数据
     * 
     * @param params 分析查询条件
     * @return 设备对比数据集合
     */
    public List<TorqueAnalysis> selectDeviceComparisonData(Map<String, Object> params);

    /**
     * 按传感器对比分析数据
     * 
     * @param params 分析查询条件
     * @return 传感器对比数据集合
     */
    public List<TorqueAnalysis> selectSensorComparisonData(Map<String, Object> params);

    /**
     * 查询异常分析数据
     * 
     * @param params 分析查询条件
     * @return 异常分析数据集合
     */
    public List<TorqueData> selectAnomalyData(Map<String, Object> params);

    /**
     * 查询统计分析数据
     * 
     * @param params 分析查询条件
     * @return 统计分析数据集合
     */
    public List<TorqueAnalysis> selectStatisticsData(Map<String, Object> params);
} 