package com.ruoyi.torque.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.torque.mapper.TorqueAnalysisMapper;
import com.ruoyi.torque.domain.TorqueAnalysis;
import com.ruoyi.torque.domain.TorqueData;
import com.ruoyi.torque.service.ITorqueAnalysisService;

/**
 * 扭矩数据分析Service业务层处理
 * 
 * @author ruoyi
 */
@Service
public class TorqueAnalysisServiceImpl implements ITorqueAnalysisService 
{
    @Autowired
    private TorqueAnalysisMapper torqueAnalysisMapper;

    /**
     * 将TorqueAnalysis转换为Map
     * 
     * @param torqueAnalysis 分析对象
     * @return 转换后的Map
     */
    private Map<String, Object> convertToMap(TorqueAnalysis torqueAnalysis) {
        Map<String, Object> params = new HashMap<>();
        if (torqueAnalysis != null) {
            params.put("deviceId", torqueAnalysis.getDeviceId());
            params.put("sensorId", torqueAnalysis.getSensorId());
            params.put("startTime", torqueAnalysis.getStartTime());
            params.put("endTime", torqueAnalysis.getEndTime());
        }
        return params;
    }

    /**
     * 查询趋势分析数据
     * 
     * @param torqueAnalysis 分析查询条件
     * @return 趋势分析数据集合
     */
    @Override
    public List<TorqueData> selectTrendData(TorqueAnalysis torqueAnalysis)
    {
        return torqueAnalysisMapper.selectTrendData(convertToMap(torqueAnalysis));
    }

    /**
     * 按设备对比分析数据
     * 
     * @param torqueAnalysis 分析查询条件
     * @return 设备对比数据集合
     */
    @Override
    public List<TorqueAnalysis> selectDeviceComparisonData(TorqueAnalysis torqueAnalysis)
    {
        return torqueAnalysisMapper.selectDeviceComparisonData(convertToMap(torqueAnalysis));
    }

    /**
     * 按传感器对比分析数据
     * 
     * @param torqueAnalysis 分析查询条件
     * @return 传感器对比数据集合
     */
    @Override
    public List<TorqueAnalysis> selectSensorComparisonData(TorqueAnalysis torqueAnalysis)
    {
        return torqueAnalysisMapper.selectSensorComparisonData(convertToMap(torqueAnalysis));
    }

    /**
     * 查询异常分析数据
     * 
     * @param torqueAnalysis 分析查询条件
     * @return 异常分析数据集合
     */
    @Override
    public List<TorqueData> selectAnomalyData(TorqueAnalysis torqueAnalysis)
    {
        return torqueAnalysisMapper.selectAnomalyData(convertToMap(torqueAnalysis));
    }

    /**
     * 查询统计分析数据
     * 
     * @param torqueAnalysis 分析查询条件
     * @return 统计分析数据集合
     */
    @Override
    public List<TorqueAnalysis> selectStatisticsData(TorqueAnalysis torqueAnalysis)
    {
        return torqueAnalysisMapper.selectStatisticsData(convertToMap(torqueAnalysis));
    }
} 