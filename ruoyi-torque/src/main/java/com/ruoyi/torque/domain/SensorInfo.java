package com.ruoyi.torque.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 传感器信息对象 sensor_info
 * 
 * @author ruoyi
 * @date 2023-04-09
 */
public class SensorInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 传感器ID */
    private Long sensorId;

    /** 传感器名称 */
    @Excel(name = "传感器名称")
    private String sensorName;

    /** 传感器类型 */
    @Excel(name = "传感器类型")
    private String sensorType;

    /** 型号 */
    @Excel(name = "型号")
    private String modelNumber;

    /** 制造商 */
    @Excel(name = "制造商")
    private String manufacturer;

    /** 测量范围 */
    @Excel(name = "测量范围")
    private String measurementRange;

    /** 精度 */
    @Excel(name = "精度")
    private String accuracy;

    /** 协议类型 */
    @Excel(name = "协议类型")
    private String protocolType;

    /** 连接参数(JSON格式) */
    private String connectionParams;

    /** 安装位置 */
    @Excel(name = "安装位置")
    private String installationLocation;

    /** 安装日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "安装日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date installationDate;

    /** 最近校准日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "最近校准日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date calibrationDate;

    /** 下次校准日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "下次校准日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date nextCalibrationDate;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private Integer status;

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
    public void setSensorType(String sensorType) 
    {
        this.sensorType = sensorType;
    }

    public String getSensorType() 
    {
        return sensorType;
    }
    public void setModelNumber(String modelNumber) 
    {
        this.modelNumber = modelNumber;
    }

    public String getModelNumber() 
    {
        return modelNumber;
    }
    public void setManufacturer(String manufacturer) 
    {
        this.manufacturer = manufacturer;
    }

    public String getManufacturer() 
    {
        return manufacturer;
    }
    public void setMeasurementRange(String measurementRange) 
    {
        this.measurementRange = measurementRange;
    }

    public String getMeasurementRange() 
    {
        return measurementRange;
    }
    public void setAccuracy(String accuracy) 
    {
        this.accuracy = accuracy;
    }

    public String getAccuracy() 
    {
        return accuracy;
    }
    public void setProtocolType(String protocolType) 
    {
        this.protocolType = protocolType;
    }

    public String getProtocolType() 
    {
        return protocolType;
    }
    public void setConnectionParams(String connectionParams) 
    {
        this.connectionParams = connectionParams;
    }

    public String getConnectionParams() 
    {
        return connectionParams;
    }
    public void setInstallationLocation(String installationLocation) 
    {
        this.installationLocation = installationLocation;
    }

    public String getInstallationLocation() 
    {
        return installationLocation;
    }
    public void setInstallationDate(Date installationDate) 
    {
        this.installationDate = installationDate;
    }

    public Date getInstallationDate() 
    {
        return installationDate;
    }
    public void setCalibrationDate(Date calibrationDate) 
    {
        this.calibrationDate = calibrationDate;
    }

    public Date getCalibrationDate() 
    {
        return calibrationDate;
    }
    public void setNextCalibrationDate(Date nextCalibrationDate) 
    {
        this.nextCalibrationDate = nextCalibrationDate;
    }

    public Date getNextCalibrationDate() 
    {
        return nextCalibrationDate;
    }
    public void setStatus(Integer status) 
    {
        this.status = status;
    }

    public Integer getStatus() 
    {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("sensorId", getSensorId())
            .append("sensorName", getSensorName())
            .append("sensorType", getSensorType())
            .append("modelNumber", getModelNumber())
            .append("manufacturer", getManufacturer())
            .append("measurementRange", getMeasurementRange())
            .append("accuracy", getAccuracy())
            .append("protocolType", getProtocolType())
            .append("connectionParams", getConnectionParams())
            .append("installationLocation", getInstallationLocation())
            .append("installationDate", getInstallationDate())
            .append("calibrationDate", getCalibrationDate())
            .append("nextCalibrationDate", getNextCalibrationDate())
            .append("status", getStatus())
            .append("remark", getRemark())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
} 