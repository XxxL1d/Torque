package com.ruoyi.torque.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.torque.domain.SensorInfo;
import com.ruoyi.torque.service.ISensorInfoService;

/**
 * 传感器信息Controller
 * 
 * @author ruoyi
 * @date 2023-04-09
 */
@RestController
@RequestMapping("/torque/sensor")
public class SensorInfoController extends BaseController
{
    @Autowired
    private ISensorInfoService sensorInfoService;

    /**
     * 查询传感器信息列表
     */
    @PreAuthorize("@ss.hasPermi('torque:sensor:list')")
    @GetMapping("/list")
    public TableDataInfo list(SensorInfo sensorInfo)
    {
        startPage();
        List<SensorInfo> list = sensorInfoService.selectSensorInfoList(sensorInfo);
        return getDataTable(list);
    }

    /**
     * 导出传感器信息列表
     */
    @PreAuthorize("@ss.hasPermi('torque:sensor:export')")
    @Log(title = "传感器信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SensorInfo sensorInfo)
    {
        List<SensorInfo> list = sensorInfoService.selectSensorInfoList(sensorInfo);
        ExcelUtil<SensorInfo> util = new ExcelUtil<SensorInfo>(SensorInfo.class);
        util.exportExcel(response, list, "传感器信息数据");
    }

    /**
     * 获取传感器信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('torque:sensor:query')")
    @GetMapping(value = "/{sensorId}")
    public AjaxResult getInfo(@PathVariable("sensorId") Long sensorId)
    {
        return AjaxResult.success(sensorInfoService.selectSensorInfoById(sensorId));
    }

    /**
     * 新增传感器信息
     */
    @PreAuthorize("@ss.hasPermi('torque:sensor:add')")
    @Log(title = "传感器信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SensorInfo sensorInfo)
    {
        return toAjax(sensorInfoService.insertSensorInfo(sensorInfo));
    }

    /**
     * 修改传感器信息
     */
    @PreAuthorize("@ss.hasPermi('torque:sensor:edit')")
    @Log(title = "传感器信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SensorInfo sensorInfo)
    {
        return toAjax(sensorInfoService.updateSensorInfo(sensorInfo));
    }

    /**
     * 删除传感器信息
     */
    @PreAuthorize("@ss.hasPermi('torque:sensor:remove')")
    @Log(title = "传感器信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{sensorIds}")
    public AjaxResult remove(@PathVariable Long[] sensorIds)
    {
        return toAjax(sensorInfoService.deleteSensorInfoByIds(sensorIds));
    }
} 