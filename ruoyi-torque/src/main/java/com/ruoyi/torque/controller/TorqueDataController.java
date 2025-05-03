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
import com.ruoyi.torque.domain.TorqueData;
import com.ruoyi.torque.service.ITorqueDataService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 扭矩数据Controller
 * 
 * @author ruoyi
 */
@RestController
@RequestMapping("/torque/data")
public class TorqueDataController extends BaseController
{
    @Autowired
    private ITorqueDataService torqueDataService;

    /**
     * 查询扭矩数据列表
     */
    @PreAuthorize("@ss.hasPermi('torque:data:list')")
    @GetMapping("/list")
    public TableDataInfo list(TorqueData torqueData)
    {
        startPage();
        List<TorqueData> list = torqueDataService.selectTorqueDataList(torqueData);
        return getDataTable(list);
    }

    /**
     * 导出扭矩数据列表
     */
    @PreAuthorize("@ss.hasPermi('torque:data:export')")
    @Log(title = "扭矩数据", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, TorqueData torqueData)
    {
        List<TorqueData> list = torqueDataService.selectTorqueDataList(torqueData);
        ExcelUtil<TorqueData> util = new ExcelUtil<TorqueData>(TorqueData.class);
        util.exportExcel(response, list, "扭矩数据");
    }

    /**
     * 获取扭矩数据详细信息
     */
    @PreAuthorize("@ss.hasPermi('torque:data:query')")
    @GetMapping(value = "/{dataId}")
    public AjaxResult getInfo(@PathVariable("dataId") Long dataId)
    {
        return AjaxResult.success(torqueDataService.selectTorqueDataById(dataId));
    }

    /**
     * 新增扭矩数据
     */
    @PreAuthorize("@ss.hasPermi('torque:data:add')")
    @Log(title = "扭矩数据", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TorqueData torqueData)
    {
        return toAjax(torqueDataService.insertTorqueData(torqueData));
    }

    /**
     * 修改扭矩数据
     */
    @PreAuthorize("@ss.hasPermi('torque:data:edit')")
    @Log(title = "扭矩数据", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TorqueData torqueData)
    {
        return toAjax(torqueDataService.updateTorqueData(torqueData));
    }

    /**
     * 删除扭矩数据
     */
    @PreAuthorize("@ss.hasPermi('torque:data:remove')")
    @Log(title = "扭矩数据", businessType = BusinessType.DELETE)
    @DeleteMapping("/{dataIds}")
    public AjaxResult remove(@PathVariable Long[] dataIds)
    {
        return toAjax(torqueDataService.deleteTorqueDataByIds(dataIds));
    }
} 