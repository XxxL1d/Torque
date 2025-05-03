<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="100px">
      <el-form-item label="传感器名称" prop="sensorName">
        <el-input
          v-model="queryParams.sensorName"
          placeholder="请输入传感器名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="传感器类型" prop="sensorType">
        <el-select v-model="queryParams.sensorType" placeholder="请选择传感器类型" clearable>
          <el-option
            v-for="dict in dict.type.torque_sensor_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择状态" clearable>
          <el-option
            v-for="dict in dict.type.sys_normal_disable"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
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
          v-hasPermi="['torque:sensor:add']"
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
          v-hasPermi="['torque:sensor:edit']"
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
          v-hasPermi="['torque:sensor:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['torque:sensor:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="sensorList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="传感器ID" align="center" prop="sensorId" />
      <el-table-column label="传感器名称" align="center" prop="sensorName" width="150" />
      <el-table-column label="传感器类型" align="center" prop="sensorType" width="180">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.torque_sensor_type" :value="scope.row.sensorType"/>
        </template>
      </el-table-column>
      <el-table-column label="型号" align="center" prop="modelNumber" />
      <el-table-column label="制造商" align="center" prop="manufacturer" />
      <el-table-column label="精度" align="center" prop="accuracy" />
      <el-table-column label="安装位置" align="center" prop="installationLocation" />
      <el-table-column label="安装日期" align="center" prop="installationDate" width="100">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.installationDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="状态" align="center" prop="status">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_normal_disable" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['torque:sensor:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['torque:sensor:remove']"
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

    <!-- 添加或修改传感器对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="800px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="传感器名称" prop="sensorName">
              <el-input v-model="form.sensorName" placeholder="请输入传感器名称" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="传感器类型" prop="sensorType">
              <el-select v-model="form.sensorType" placeholder="请选择传感器类型">
                <el-option
                  v-for="dict in dict.type.torque_sensor_type"
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
            <el-form-item label="测量范围" prop="measurementRange">
              <el-input v-model="form.measurementRange" placeholder="请输入测量范围" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="精度" prop="accuracy">
              <el-input v-model="form.accuracy" placeholder="请输入精度" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="安装位置" prop="installationLocation">
              <el-input v-model="form.installationLocation" placeholder="请输入安装位置" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="安装日期" prop="installationDate">
              <el-date-picker clearable
                v-model="form.installationDate"
                type="date"
                value-format="yyyy-MM-dd"
                placeholder="请选择安装日期">
              </el-date-picker>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="最近校准日期" prop="calibrationDate">
              <el-date-picker clearable
                v-model="form.calibrationDate"
                type="date"
                value-format="yyyy-MM-dd"
                placeholder="请选择最近校准日期">
              </el-date-picker>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="下次校准日期" prop="nextCalibrationDate">
              <el-date-picker clearable
                v-model="form.nextCalibrationDate"
                type="date"
                value-format="yyyy-MM-dd"
                placeholder="请选择下次校准日期">
              </el-date-picker>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="状态" prop="status">
              <el-radio-group v-model="form.status">
                <el-radio
                  v-for="dict in dict.type.sys_normal_disable"
                  :key="dict.value"
                  :label="dict.value"
                >{{dict.label}}</el-radio>
              </el-radio-group>
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
import { listSensor, getSensor, delSensor, addSensor, updateSensor } from "@/api/torque/sensor";

export default {
  name: "Sensor",
  dicts: ['sys_normal_disable', 'torque_sensor_type'],
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
      // 传感器表格数据
      sensorList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        sensorName: null,
        sensorType: null,
        status: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        sensorName: [
          { required: true, message: "传感器名称不能为空", trigger: "blur" }
        ],
        sensorType: [
          { required: true, message: "传感器类型不能为空", trigger: "change" }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询传感器列表 */
    getList() {
      this.loading = true;
      listSensor(this.queryParams).then(response => {
        this.sensorList = response.rows;
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
        sensorId: null,
        sensorName: null,
        sensorType: null,
        modelNumber: null,
        manufacturer: null,
        measurementRange: null,
        accuracy: null,
        installationLocation: null,
        installationDate: null,
        calibrationDate: null,
        nextCalibrationDate: null,
        status: "0",
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
      this.ids = selection.map(item => item.sensorId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加传感器";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const sensorId = row.sensorId || this.ids[0]
      getSensor(sensorId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改传感器";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.sensorId != null) {
            updateSensor(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addSensor(this.form).then(response => {
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
      const sensorIds = row.sensorId || this.ids;
      this.$modal.confirm('是否确认删除传感器编号为"' + sensorIds + '"的数据项？').then(function() {
        return delSensor(sensorIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('torque/sensor/export', {
        ...this.queryParams
      }, `sensor_${new Date().getTime()}.xlsx`)
    }
  }
};
</script> 