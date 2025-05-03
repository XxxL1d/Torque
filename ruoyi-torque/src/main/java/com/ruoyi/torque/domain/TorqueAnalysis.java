package com.ruoyi.torque.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 扭矩分析对象 torque_analysis
 * 
 * @author ruoyi
 */
public class TorqueAnalysis extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 分析ID */
    private Long analysisId;

    /** 设备ID */
    @Excel(name = "设备ID")
    private Long deviceId;

    /** 设备名称 */
    @Excel(name = "设备名称")
    private String deviceName;

    /** 传感器ID */
    @Excel(name = "传感器ID")
    private Long sensorId;

    /** 传感器名称 */
    @Excel(name = "传感器名称")
    private String sensorName;

    /** 扭矩值 */
    @Excel(name = "扭矩值")
    private Double torqueValue;

    /** 平均扭矩值 */
    @Excel(name = "平均扭矩值")
    private Double avgTorque;

    /** 最大扭矩值 */
    @Excel(name = "最大扭矩值")
    private Double maxTorque;

    /** 最小扭矩值 */
    @Excel(name = "最小扭矩值")
    private Double minTorque;

    /** 标准差 */
    @Excel(name = "标准差")
    private Double stdDeviation;

    /** 数据记录数 */
    @Excel(name = "数据记录数")
    private Integer count;

    /** 数据时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "数据时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date dataTime;

    /** 异常标志 */
    @Excel(name = "异常标志")
    private String anomalyFlag;

    /** 查询开始时间 */
    private String startTime;

    /** 查询结束时间 */
    private String endTime;

    public void setAnalysisId(Long analysisId) 
    {
        this.analysisId = analysisId;
    }

    public Long getAnalysisId() 
    {
        return analysisId;
    }

    public void setDeviceId(Long deviceId) 
    {
        this.deviceId = deviceId;
    }

    public Long getDeviceId() 
    {
        return deviceId;
    }

    public void setDeviceName(String deviceName) 
    {
        this.deviceName = deviceName;
    }

    public String getDeviceName() 
    {
        return deviceName;
    }

    public void setSensorId(Long sensorId) 
    {
        this.sensorId = sensorId;
    }

    public Long getSensorId() 
    {
        return sensorId;
    }

    public void setSensorName(String sensorName) 
    {
        this.sensorName = sensorName;
    }

    public String getSensorName() 
    {
        return sensorName;
    }

    public void setTorqueValue(Double torqueValue) 
    {
        this.torqueValue = torqueValue;
    }

    public Double getTorqueValue() 
    {
        return torqueValue;
    }

    public void setDataTime(Date dataTime) 
    {
        this.dataTime = dataTime;
    }

    public Date getDataTime() 
    {
        return dataTime;
    }

    public void setAvgTorque(Double avgTorque) 
    {
        this.avgTorque = avgTorque;
    }

    public Double getAvgTorque() 
    {
        return avgTorque;
    }

    public void setMaxTorque(Double maxTorque) 
    {
        this.maxTorque = maxTorque;
    }

    public Double getMaxTorque() 
    {
        return maxTorque;
    }

    public void setMinTorque(Double minTorque) 
    {
        this.minTorque = minTorque;
    }

    public Double getMinTorque() 
    {
        return minTorque;
    }

    public void setStdDeviation(Double stdDeviation) 
    {
        this.stdDeviation = stdDeviation;
    }

    public Double getStdDeviation() 
    {
        return stdDeviation;
    }

    public void setCount(Integer count) 
    {
        this.count = count;
    }

    public Integer getCount() 
    {
        return count;
    }

    public void setAnomalyFlag(String anomalyFlag) 
    {
        this.anomalyFlag = anomalyFlag;
    }

    public String getAnomalyFlag() 
    {
        return anomalyFlag;
    }

    public void setStartTime(String startTime) 
    {
        this.startTime = startTime;
    }

    public String getStartTime() 
    {
        return startTime;
    }

    public void setEndTime(String endTime) 
    {
        this.endTime = endTime;
    }

    public String getEndTime() 
    {
        return endTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("analysisId", getAnalysisId())
            .append("deviceId", getDeviceId())
            .append("deviceName", getDeviceName())
            .append("sensorId", getSensorId())
            .append("sensorName", getSensorName())
            .append("torqueValue", getTorqueValue())
            .append("avgTorque", getAvgTorque())
            .append("maxTorque", getMaxTorque())
            .append("minTorque", getMinTorque())
            .append("stdDeviation", getStdDeviation())
            .append("count", getCount())
            .append("dataTime", getDataTime())
            .append("anomalyFlag", getAnomalyFlag())
            .append("startTime", getStartTime())
            .append("endTime", getEndTime())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
} 