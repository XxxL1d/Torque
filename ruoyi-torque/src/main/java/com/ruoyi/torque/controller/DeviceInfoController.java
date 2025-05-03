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
import com.ruoyi.torque.domain.DeviceInfo;
import com.ruoyi.torque.service.IDeviceInfoService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 设备信息Controller
 * 
 * @author ruoyi
 */
@RestController
@RequestMapping("/torque/device")
public class DeviceInfoController extends BaseController
{
    @Autowired
    private IDeviceInfoService deviceInfoService;

    /**
     * 查询设备信息列表
     */
    @PreAuthorize("@ss.hasPermi('torque:device:list')")
    @GetMapping("/list")
    public TableDataInfo list(DeviceInfo deviceInfo)
    {
        startPage();
        List<DeviceInfo> list = deviceInfoService.selectDeviceInfoList(deviceInfo);
        return getDataTable(list);
    }

    /**
     * 导出设备信息列表
     */
    @PreAuthorize("@ss.hasPermi('torque:device:export')")
    @Log(title = "设备信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, DeviceInfo deviceInfo)
    {
        List<DeviceInfo> list = deviceInfoService.selectDeviceInfoList(deviceInfo);
        ExcelUtil<DeviceInfo> util = new ExcelUtil<DeviceInfo>(DeviceInfo.class);
        util.exportExcel(response, list, "设备信息数据");
    }

    /**
     * 获取设备信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('torque:device:query')")
    @GetMapping(value = "/{deviceId}")
    public AjaxResult getInfo(@PathVariable("deviceId") Long deviceId)
    {
        return AjaxResult.success(deviceInfoService.selectDeviceInfoById(deviceId));
    }

    /**
     * 新增设备信息
     */
    @PreAuthorize("@ss.hasPermi('torque:device:add')")
    @Log(title = "设备信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DeviceInfo deviceInfo)
    {
        return toAjax(deviceInfoService.insertDeviceInfo(deviceInfo));
    }

    /**
     * 修改设备信息
     */
    @PreAuthorize("@ss.hasPermi('torque:device:edit')")
    @Log(title = "设备信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DeviceInfo deviceInfo)
    {
        return toAjax(deviceInfoService.updateDeviceInfo(deviceInfo));
    }

    /**
     * 删除设备信息
     */
    @PreAuthorize("@ss.hasPermi('torque:device:remove')")
    @Log(title = "设备信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{deviceIds}")
    public AjaxResult remove(@PathVariable Long[] deviceIds)
    {
        return toAjax(deviceInfoService.deleteDeviceInfoByIds(deviceIds));
    }
} 