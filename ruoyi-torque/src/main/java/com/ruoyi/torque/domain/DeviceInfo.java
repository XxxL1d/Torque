package com.ruoyi.torque.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 设备信息对象 device_info
 * 
 * @author ruoyi
 * @date 2023-04-09
 */
public class DeviceInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 设备ID */
    private Long deviceId;

    /** 设备名称 */
    @Excel(name = "设备名称")
    private String deviceName;

    /** 设备类型 */
    @Excel(name = "设备类型")
    private String deviceType;

    /** 型号 */
    @Excel(name = "型号")
    private String modelNumber;

    /** 制造商 */
    @Excel(name = "制造商")
    private String manufacturer;

    /** 出厂日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "出厂日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date productionDate;

    /** 安装位置 */
    @Excel(name = "安装位置")
    private String installationLocation;

    /** 所属部门 */
    @Excel(name = "所属部门")
    private String department;

    /** 责任人 */
    @Excel(name = "责任人")
    private String responsiblePerson;

    /** 状态（0正常运行 1停机维护 2故障） */
    @Excel(name = "状态", readConverterExp = "0=正常运行,1=停机维护,2=故障")
    private Integer status;

    /** 维护周期(天) */
    @Excel(name = "维护周期(天)")
    private Integer maintenanceCycle;

    /** 上次维护日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "上次维护日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date lastMaintenanceDate;

    /** 下次维护日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "下次维护日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date nextMaintenanceDate;
    
    /** 最大安全阈值 */
    @Excel(name = "最大安全阈值")
    private Double maxThreshold;
    
    /** 最小安全阈值 */
    @Excel(name = "最小安全阈值")
    private Double minThreshold;

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
    public void setDeviceType(String deviceType) 
    {
        this.deviceType = deviceType;
    }

    public String getDeviceType() 
    {
        return deviceType;
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
    public void setProductionDate(Date productionDate) 
    {
        this.productionDate = productionDate;
    }

    public Date getProductionDate() 
    {
        return productionDate;
    }
    public void setInstallationLocation(String installationLocation) 
    {
        this.installationLocation = installationLocation;
    }

    public String getInstallationLocation() 
    {
        return installationLocation;
    }
    public void setDepartment(String department) 
    {
        this.department = department;
    }

    public String getDepartment() 
    {
        return department;
    }
    public void setResponsiblePerson(String responsiblePerson) 
    {
        this.responsiblePerson = responsiblePerson;
    }

    public String getResponsiblePerson() 
    {
        return responsiblePerson;
    }
    public void setStatus(Integer status) 
    {
        this.status = status;
    }

    public Integer getStatus() 
    {
        return status;
    }
    public void setMaintenanceCycle(Integer maintenanceCycle) 
    {
        this.maintenanceCycle = maintenanceCycle;
    }

    public Integer getMaintenanceCycle() 
    {
        return maintenanceCycle;
    }
    public void setLastMaintenanceDate(Date lastMaintenanceDate) 
    {
        this.lastMaintenanceDate = lastMaintenanceDate;
    }

    public Date getLastMaintenanceDate() 
    {
        return lastMaintenanceDate;
    }
    public void setNextMaintenanceDate(Date nextMaintenanceDate) 
    {
        this.nextMaintenanceDate = nextMaintenanceDate;
    }

    public Date getNextMaintenanceDate() 
    {
        return nextMaintenanceDate;
    }
    
    public void setMaxThreshold(Double maxThreshold) 
    {
        this.maxThreshold = maxThreshold;
    }

    public Double getMaxThreshold() 
    {
        return maxThreshold;
    }
    
    public void setMinThreshold(Double minThreshold) 
    {
        this.minThreshold = minThreshold;
    }

    public Double getMinThreshold() 
    {
        return minThreshold;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("deviceId", getDeviceId())
            .append("deviceName", getDeviceName())
            .append("deviceType", getDeviceType())
            .append("modelNumber", getModelNumber())
            .append("manufacturer", getManufacturer())
            .append("productionDate", getProductionDate())
            .append("installationLocation", getInstallationLocation())
            .append("department", getDepartment())
            .append("responsiblePerson", getResponsiblePerson())
            .append("status", getStatus())
            .append("maintenanceCycle", getMaintenanceCycle())
            .append("lastMaintenanceDate", getLastMaintenanceDate())
            .append("nextMaintenanceDate", getNextMaintenanceDate())
            .append("maxThreshold", getMaxThreshold())
            .append("minThreshold", getMinThreshold())
            .append("remark", getRemark())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
} 