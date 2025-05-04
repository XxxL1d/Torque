package com.ruoyi.torque.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.apache.commons.lang3.StringUtils;
import com.ruoyi.torque.mapper.TorqueDataMapper;
import com.ruoyi.torque.domain.TorqueData;
import com.ruoyi.torque.service.ITorqueDataService;

/**
 * 扭矩数据Service业务层处理
 * 
 * @author ruoyi
 */
@Service
public class TorqueDataServiceImpl implements ITorqueDataService 
{
    @Autowired
    private TorqueDataMapper torqueDataMapper;

    /**
     * 查询扭矩数据
     * 
     * @param dataId 扭矩数据ID
     * @return 扭矩数据
     */
    @Override
    public TorqueData selectTorqueDataById(Long dataId)
    {
        return torqueDataMapper.selectTorqueDataByDataId(dataId);
    }

    /**
     * 查询扭矩数据列表
     * 
     * @param torqueData 扭矩数据
     * @return 扭矩数据
     */
    @Override
    public List<TorqueData> selectTorqueDataList(TorqueData torqueData)
    {
        return torqueDataMapper.selectTorqueDataList(torqueData);
    }

    /**
     * 新增扭矩数据
     * 
     * @param torqueData 扭矩数据
     * @return 结果
     */
    @Override
    public int insertTorqueData(TorqueData torqueData)
    {
        // 设置默认的扭矩单位为"N·m"
        if (torqueData.getTorqueUnit() == null || StringUtils.isEmpty(torqueData.getTorqueUnit()))
        {
            torqueData.setTorqueUnit("N·m");
        }
        return torqueDataMapper.insertTorqueData(torqueData);
    }

    /**
     * 修改扭矩数据
     * 
     * @param torqueData 扭矩数据
     * @return 结果
     */
    @Override
    public int updateTorqueData(TorqueData torqueData)
    {
        return torqueDataMapper.updateTorqueData(torqueData);
    }

    /**
     * 批量删除扭矩数据
     * 
     * @param dataIds 需要删除的扭矩数据ID
     * @return 结果
     */
    @Override
    public int deleteTorqueDataByIds(Long[] dataIds)
    {
        return torqueDataMapper.deleteTorqueDataByDataIds(dataIds);
    }

    /**
     * 删除扭矩数据信息
     * 
     * @param dataId 扭矩数据ID
     * @return 结果
     */
    @Override
    public int deleteTorqueDataById(Long dataId)
    {
        return torqueDataMapper.deleteTorqueDataByDataId(dataId);
    }
} 