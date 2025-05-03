<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="设备名称" prop="deviceName">
        <el-input
          v-model="queryParams.deviceName"
          placeholder="请输入设备名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="设备类型" prop="deviceType">
        <el-select v-model="queryParams.deviceType" placeholder="请选择设备类型" clearable>
          <el-option
            v-for="dict in dict.type.torque_device_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择状态" clearable>
          <el-option
            v-for="dict in dict.type.torque_device_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="所属部门" prop="department">
        <el-input
          v-model="queryParams.department"
          placeholder="请输入所属部门"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['torque:device:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['torque:device:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['torque:device:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['torque:device:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="deviceList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="设备ID" align="center" prop="deviceId" />
      <el-table-column label="设备名称" align="center" prop="deviceName" />
      <el-table-column label="设备类型" align="center" prop="deviceType">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.torque_device_type" :value="scope.row.deviceType"/>
        </template>
      </el-table-column>
      <el-table-column label="型号" align="center" prop="modelNumber" />
      <el-table-column label="制造商" align="center" prop="manufacturer" />
      <el-table-column label="安装位置" align="center" prop="installationLocation" />
      <el-table-column label="所属部门" align="center" prop="department" />
      <el-table-column label="责任人" align="center" prop="responsiblePerson" />
      <el-table-column label="状态" align="center" prop="status">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.torque_device_status" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="下次维护日期" align="center" prop="nextMaintenanceDate" width="100">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.nextMaintenanceDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['torque:device:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['torque:device:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改设备对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="800px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="设备名称" prop="deviceName">
              <el-input v-model="form.deviceName" placeholder="请输入设备名称" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="设备类型" prop="deviceType">
              <el-select v-model="form.deviceType" placeholder="请选择设备类型">
                <el-option
                  v-for="dict in dict.type.torque_device_type"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="型号" prop="modelNumber">
              <el-input v-model="form.modelNumber" placeholder="请输入型号" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="制造商" prop="manufacturer">
              <el-input v-model="form.manufacturer" placeholder="请输入制造商" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="出厂日期" prop="productionDate">
              <el-date-picker clearable
                v-model="form.productionDate"
                type="date"
                value-format="yyyy-MM-dd"
                placeholder="请选择出厂日期">
              </el-date-picker>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="安装位置" prop="installationLocation">
              <el-input v-model="form.installationLocation" placeholder="请输入安装位置" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="所属部门" prop="department">
              <el-input v-model="form.department" placeholder="请输入所属部门" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="责任人" prop="responsiblePerson">
              <el-input v-model="form.responsiblePerson" placeholder="请输入责任人" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="维护周期(天)" prop="maintenanceCycle">
              <el-input-number v-model="form.maintenanceCycle" :min="0" controls-position="right" placeholder="请输入维护周期" @change="calculateNextDate" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="上次维护日期" prop="lastMaintenanceDate">
              <el-date-picker clearable
                v-model="form.lastMaintenanceDate"
                type="date"
                value-format="yyyy-MM-dd"
                placeholder="请选择上次维护日期"
                @change="calculateNextDate">
              </el-date-picker>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="下次维护日期" prop="nextMaintenanceDate">
              <el-date-picker clearable
                v-model="form.nextMaintenanceDate"
                type="date"
                value-format="yyyy-MM-dd"
                placeholder="请选择下次维护日期">
              </el-date-picker>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="状态" prop="status">
              <el-radio-group v-model="form.status">
                <el-radio
                  v-for="dict in dict.type.torque_device_status"
                  :key="dict.value"
                  :label="dict.value"
                >{{dict.label}}</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="最大安全阈值" prop="maxThreshold">
              <el-input-number v-model="form.maxThreshold" :precision="2" :step="5" :min="0" controls-position="right" placeholder="请输入最大安全阈值" />
              <span class="unit">N·m</span>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="最小安全阈值" prop="minThreshold">
              <el-input-number v-model="form.minThreshold" :precision="2" :step="5" :min="0" controls-position="right" placeholder="请输入最小安全阈值" />
              <span class="unit">N·m</span>
            </el-form-item>
          </el-col>
        </el-row>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listDevice, getDevice, delDevice, addDevice, updateDevice } from "@/api/torque/device";

export default {
  name: "Device",
  dicts: ['torque_device_type', 'torque_device_status'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 设备表格数据
      deviceList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        deviceName: null,
        deviceType: null,
        department: null,
        status: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        deviceName: [
          { required: true, message: "设备名称不能为空", trigger: "blur" }
        ],
        deviceType: [
          { required: true, message: "设备类型不能为空", trigger: "change" }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询设备列表 */
    getList() {
      this.loading = true;
      listDevice(this.queryParams).then(response => {
        this.deviceList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        deviceId: null,
        deviceName: null,
        deviceType: null,
        modelNumber: null,
        manufacturer: null,
        productionDate: null,
        installationLocation: null,
        department: null,
        responsiblePerson: null,
        status: "0",
        maintenanceCycle: null,
        lastMaintenanceDate: null,
        nextMaintenanceDate: null,
        maxThreshold: 100,
        minThreshold: 0,
        remark: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.deviceId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加设备";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const deviceId = row.deviceId || this.ids[0]
      getDevice(deviceId).then(response => {
        this.form = response.data;
        // 确保状态值是字符串类型，与el-radio-group的值类型一致
        if (this.form.status !== null && this.form.status !== undefined) {
          this.form.status = this.form.status.toString();
        }
        
        this.open = true;
        this.title = "修改设备";
      });
    },
    /** 根据维护周期和上次维护日期计算下次维护日期 */
    calculateNextDate() {
      if (this.form.lastMaintenanceDate && this.form.maintenanceCycle) {
        const lastDate = new Date(this.form.lastMaintenanceDate);
        const nextDate = new Date(lastDate.setDate(lastDate.getDate() + parseInt(this.form.maintenanceCycle)));
        this.form.nextMaintenanceDate = this.parseTime(nextDate, '{y}-{m}-{d}');
      }
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          // 确保status是整数类型
          if (this.form.status !== null && this.form.status !== undefined) {
            this.form.status = parseInt(this.form.status);
          }
          
          if (this.form.deviceId != null) {
            updateDevice(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addDevice(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const deviceIds = row.deviceId || this.ids;
      this.$modal.confirm('是否确认删除设备编号为"' + deviceIds + '"的数据项？').then(function() {
        return delDevice(deviceIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('torque/device/export', {
        ...this.queryParams
      }, `device_${new Date().getTime()}.xlsx`)
    }
  }
};
</script> 