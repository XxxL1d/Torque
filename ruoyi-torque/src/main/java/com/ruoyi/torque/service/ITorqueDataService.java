package com.ruoyi.torque.service;

import java.util.List;
import com.ruoyi.torque.domain.TorqueData;

/**
 * 扭矩数据Service接口
 * 
 * @author ruoyi
 */
public interface ITorqueDataService 
{
    /**
     * 查询扭矩数据
     * 
     * @param dataId 扭矩数据ID
     * @return 扭矩数据
     */
    public TorqueData selectTorqueDataById(Long dataId);

    /**
     * 查询扭矩数据列表
     * 
     * @param torqueData 扭矩数据
     * @return 扭矩数据集合
     */
    public List<TorqueData> selectTorqueDataList(TorqueData torqueData);

    /**
     * 新增扭矩数据
     * 
     * @param torqueData 扭矩数据
     * @return 结果
     */
    public int insertTorqueData(TorqueData torqueData);

    /**
     * 修改扭矩数据
     * 
     * @param torqueData 扭矩数据
     * @return 结果
     */
    public int updateTorqueData(TorqueData torqueData);

    /**
     * 批量删除扭矩数据
     * 
     * @param dataIds 需要删除的扭矩数据ID
     * @return 结果
     */
    public int deleteTorqueDataByIds(Long[] dataIds);

    /**
     * 删除扭矩数据信息
     * 
     * @param dataId 扭矩数据ID
     * @return 结果
     */
    public int deleteTorqueDataById(Long dataId);
} 