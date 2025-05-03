package com.ruoyi.torque.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.torque.domain.TorqueAnalysis;
import com.ruoyi.torque.domain.TorqueData;
import com.ruoyi.torque.service.ITorqueAnalysisService;

/**
 * 扭矩数据分析Controller
 * 
 * @author ruoyi
 */
@RestController
@RequestMapping("/torque/analysis")
public class TorqueAnalysisController extends BaseController
{
    @Autowired
    private ITorqueAnalysisService torqueAnalysisService;

    /**
     * 查询扭矩分析数据列表
     */
    @PreAuthorize("@ss.hasPermi('torque:analysis:list')")
    @GetMapping("/list")
    public AjaxResult list(TorqueAnalysis torqueAnalysis)
    {
        Map<String, Object> result = new HashMap<>();
        
        // 获取趋势数据
        List<TorqueData> data = torqueAnalysisService.selectTrendData(torqueAnalysis);
        // 获取统计分析数据
        List<TorqueAnalysis> statistics = torqueAnalysisService.selectStatisticsData(torqueAnalysis);
        
        result.put("data", data);
        result.put("statistics", statistics);
        
        return AjaxResult.success(result);
    }

    /**
     * 导出扭矩分析数据
     */
    @PreAuthorize("@ss.hasPermi('torque:analysis:export')")
    @Log(title = "扭矩分析", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(TorqueAnalysis torqueAnalysis)
    {
        List<TorqueAnalysis> list = torqueAnalysisService.selectStatisticsData(torqueAnalysis);
        ExcelUtil<TorqueAnalysis> util = new ExcelUtil<TorqueAnalysis>(TorqueAnalysis.class);
        return util.exportExcel(list, "扭矩分析数据");
    }

    /**
     * 获取趋势分析数据
     */
    @PreAuthorize("@ss.hasPermi('torque:analysis:query')")
    @GetMapping("/trend")
    public AjaxResult getTrendData(TorqueAnalysis torqueAnalysis)
    {
        List<TorqueData> list = torqueAnalysisService.selectTrendData(torqueAnalysis);
        return AjaxResult.success(list);
    }

    /**
     * 获取设备对比数据
     */
    @PreAuthorize("@ss.hasPermi('torque:analysis:query')")
    @GetMapping("/deviceComparison")
    public AjaxResult getDeviceComparison(TorqueAnalysis torqueAnalysis)
    {
        List<TorqueAnalysis> list = torqueAnalysisService.selectDeviceComparisonData(torqueAnalysis);
        return AjaxResult.success(list);
    }

    /**
     * 获取传感器对比数据
     */
    @PreAuthorize("@ss.hasPermi('torque:analysis:query')")
    @GetMapping("/sensorComparison")
    public AjaxResult getSensorComparison(TorqueAnalysis torqueAnalysis)
    {
        List<TorqueAnalysis> list = torqueAnalysisService.selectSensorComparisonData(torqueAnalysis);
        return AjaxResult.success(list);
    }

    /**
     * 获取异常分析数据
     */
    @PreAuthorize("@ss.hasPermi('torque:analysis:query')")
    @GetMapping("/anomaly")
    public AjaxResult getAnomalyData(TorqueAnalysis torqueAnalysis)
    {
        List<TorqueData> list = torqueAnalysisService.selectAnomalyData(torqueAnalysis);
        return AjaxResult.success(list);
    }
} 