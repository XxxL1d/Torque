package com.ruoyi.torque.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 扭矩数据记录对象 torque_data
 * 
 * @author ruoyi
 * @date 2023-04-09
 */
public class TorqueData extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 数据ID */
    private Long dataId;

    /** 传感器ID */
    @Excel(name = "传感器ID")
    private Long sensorId;

    /** 设备ID */
    @Excel(name = "设备ID")
    private Long deviceId;

    /** 扭矩值 */
    @Excel(name = "扭矩值")
    private BigDecimal torqueValue;

    /** 扭矩单位 */
    @Excel(name = "扭矩单位")
    private String torqueUnit;

    /** 转速 */
    @Excel(name = "转速")
    private BigDecimal rpm;

    /** 温度 */
    @Excel(name = "温度")
    private BigDecimal temperature;

    /** 数据时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "数据时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date dataTime;

    /** 数据质量（0异常 1正常） */
    @Excel(name = "数据质量", readConverterExp = "0=异常,1=正常")
    private Integer dataQuality;

    /** 传感器名称（非数据库字段，关联查询使用） */
    @Excel(name = "传感器名称")
    private String sensorName;

    /** 设备名称（非数据库字段，关联查询使用） */
    @Excel(name = "设备名称")
    private String deviceName;

    /** 操作人（用户名） */
    @Excel(name = "操作人")
    private String operator;

    public void setDataId(Long dataId) 
    {
        this.dataId = dataId;
    }

    public Long getDataId() 
    {
        return dataId;
    }
    
    public void setSensorId(Long sensorId) 
    {
        this.sensorId = sensorId;
    }

    public Long getSensorId() 
    {
        return sensorId;
    }
    public void setDeviceId(Long deviceId) 
    {
        this.deviceId = deviceId;
    }

    public Long getDeviceId() 
    {
        return deviceId;
    }
    public void setTorqueValue(BigDecimal torqueValue) 
    {
        this.torqueValue = torqueValue;
    }

    public BigDecimal getTorqueValue() 
    {
        return torqueValue;
    }
    public void setTorqueUnit(String torqueUnit) 
    {
        this.torqueUnit = torqueUnit;
    }

    public String getTorqueUnit() 
    {
        return torqueUnit;
    }
    public void setRpm(BigDecimal rpm) 
    {
        this.rpm = rpm;
    }

    public BigDecimal getRpm() 
    {
        return rpm;
    }
    public void setTemperature(BigDecimal temperature) 
    {
        this.temperature = temperature;
    }

    public BigDecimal getTemperature() 
    {
        return temperature;
    }
    public void setDataTime(Date dataTime) 
    {
        this.dataTime = dataTime;
    }

    public Date getDataTime() 
    {
        return dataTime;
    }
    public void setDataQuality(Integer dataQuality) 
    {
        this.dataQuality = dataQuality;
    }

    public Integer getDataQuality() 
    {
        return dataQuality;
    }
    
    public String getSensorName() {
        return sensorName;
    }

    public void setSensorName(String sensorName) {
        this.sensorName = sensorName;
    }

    public String getDeviceName() {
        return deviceName;
    }

    public void setDeviceName(String deviceName) {
        this.deviceName = deviceName;
    }
    
    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("dataId", getDataId())
            .append("sensorId", getSensorId())
            .append("deviceId", getDeviceId())
            .append("torqueValue", getTorqueValue())
            .append("torqueUnit", getTorqueUnit())
            .append("rpm", getRpm())
            .append("temperature", getTemperature())
            .append("dataTime", getDataTime())
            .append("dataQuality", getDataQuality())
            .append("createTime", getCreateTime())
            .append("sensorName", getSensorName())
            .append("deviceName", getDeviceName())
            .append("operator", getOperator())
            .toString();
    }
} 