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
      <el-form-item label="传感器" prop="sensorId">
        <el-select v-model="queryParams.sensorId" placeholder="请选择传感器" clearable>
          <el-option
            v-for="item in sensorOptions"
            :key="item.sensorId"
            :label="item.sensorName"
            :value="item.sensorId"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="测量时间" prop="dataTime">
        <el-date-picker
          v-model="dateRange"
          style="width: 240px"
          value-format="yyyy-MM-dd HH:mm:ss"
          type="datetimerange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
        ></el-date-picker>
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
          v-hasPermi="['torque:data:add']"
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
          v-hasPermi="['torque:data:edit']"
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
          v-hasPermi="['torque:data:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['torque:data:export']"
        >导出</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-view"
          size="mini"
          :disabled="single"
          @click="handleView"
        >查看详情</el-button>
      </el-col>
      <el-col :span="2.5">
        <el-dropdown @command="handleRefreshRate" split-button type="primary" size="mini">
          <i class="el-icon-time"></i> 刷新频率
          <el-dropdown-menu slot="dropdown">
            <el-dropdown-item command="0">关闭自动刷新</el-dropdown-item>
            <el-dropdown-item command="5">每5秒刷新</el-dropdown-item>
            <el-dropdown-item command="10">每10秒刷新</el-dropdown-item>
            <el-dropdown-item command="30">每30秒刷新</el-dropdown-item>
            <el-dropdown-item command="60">每1分钟刷新</el-dropdown-item>
            <el-dropdown-item command="300">每5分钟刷新</el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="dataList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="数据ID" align="center" prop="dataId" />
      <el-table-column label="设备名称" align="center" prop="deviceName" />
      <el-table-column label="传感器" align="center" prop="sensorName" />
      <el-table-column label="扭矩值(Nm)" align="center" prop="torqueValue" />
      <el-table-column label="测量时间" align="center" prop="dataTime" width="160">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.dataTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['torque:data:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['torque:data:remove']"
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

    <!-- 添加或修改扭矩数据对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="800px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="设备" prop="deviceId">
              <el-select v-model="form.deviceId" placeholder="请选择设备" @change="handleDeviceChange">
                <el-option
                  v-for="item in deviceOptions"
                  :key="item.deviceId"
                  :label="item.deviceName"
                  :value="item.deviceId"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="传感器" prop="sensorId">
              <el-select v-model="form.sensorId" placeholder="请选择传感器">
                <el-option
                  v-for="item in sensorOptions"
                  :key="item.sensorId"
                  :label="item.sensorName"
                  :value="item.sensorId"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="扭矩值(Nm)" prop="torqueValue">
              <el-input-number v-model="form.torqueValue" :precision="2" :step="0.1" :min="0" controls-position="right" placeholder="请输入扭矩值" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="测量时间" prop="dataTime">
              <el-date-picker clearable
                v-model="form.dataTime"
                type="datetime"
                value-format="yyyy-MM-dd HH:mm:ss"
                placeholder="请选择测量时间">
              </el-date-picker>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="操作人" prop="operator">
              <el-select v-model="form.operator" placeholder="请选择操作人">
                <el-option
                  v-for="item in userOptions"
                  :key="item.userName"
                  :label="item.nickName"
                  :value="item.userName"
                ></el-option>
              </el-select>
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

    <!-- 查看详情对话框 -->
    <el-dialog title="扭矩数据详情" :visible.sync="viewOpen" width="800px" append-to-body>
      <el-descriptions :column="2" border>
        <el-descriptions-item label="数据ID">{{ viewForm.dataId }}</el-descriptions-item>
        <el-descriptions-item label="设备名称">{{ viewForm.deviceName }}</el-descriptions-item>
        <el-descriptions-item label="传感器">{{ viewForm.sensorName }}</el-descriptions-item>
        <el-descriptions-item label="扭矩值(Nm)">{{ viewForm.torqueValue }}</el-descriptions-item>
        <el-descriptions-item label="测量时间">{{ parseTime(viewForm.dataTime) }}</el-descriptions-item>
        <el-descriptions-item label="操作人">{{ viewForm.operator }}</el-descriptions-item>
        <el-descriptions-item label="创建时间">{{ parseTime(viewForm.createTime) }}</el-descriptions-item>
        <el-descriptions-item label="备注" :span="2">{{ viewForm.remark }}</el-descriptions-item>
      </el-descriptions>
      <div slot="footer" class="dialog-footer">
        <el-button @click="viewOpen = false">关 闭</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listTorqueData, getTorqueData, delTorqueData, addTorqueData, updateTorqueData } from "@/api/torque/data";
import { listDevice } from "@/api/torque/device";
import { listSensor } from "@/api/torque/sensor";
import { listUsers, listOperatorUsers } from "@/api/torque/user";

export default {
  name: "TorqueData",
  dicts: [],
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
      // 扭矩数据表格数据
      dataList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 是否显示查看详情弹出层
      viewOpen: false,
      // 日期范围
      dateRange: [],
      // 设备选项
      deviceOptions: [],
      // 传感器选项
      sensorOptions: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        deviceName: null,
        sensorId: null
      },
      // 表单参数
      form: {},
      // 查看详情表单
      viewForm: {},
      // 表单校验
      rules: {
        deviceId: [
          { required: true, message: "设备不能为空", trigger: "change" }
        ],
        sensorId: [
          { required: true, message: "传感器不能为空", trigger: "change" }
        ],
        torqueValue: [
          { required: true, message: "扭矩值不能为空", trigger: "blur" }
        ],
        dataTime: [
          { required: true, message: "测量时间不能为空", trigger: "blur" }
        ]
      },
      // 用户选项
      userOptions: [],
      // 刷新定时器
      refreshTimer: null,
      // 当前刷新频率（秒）
      currentRefreshRate: 0
    };
  },
  created() {
    this.getList();
    this.getDeviceOptions();
    this.getSensorOptions();
    this.getUserOptions();
  },
  methods: {
    /** 查询扭矩数据列表 */
    getList() {
      this.loading = true;
      listTorqueData(this.addDateRange(this.queryParams, this.dateRange)).then(response => {
        this.dataList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    /** 获取设备选项 */
    getDeviceOptions() {
      listDevice().then(response => {
        this.deviceOptions = response.rows;
      });
    },
    /** 获取传感器选项 */
    getSensorOptions() {
      listSensor().then(response => {
        this.sensorOptions = response.rows;
      });
    },
    /** 获取用户选项 */
    getUserOptions() {
      // 获取操作员角色的用户列表
      listOperatorUsers().then(response => {
        this.userOptions = response.data || [];
        if (this.userOptions.length === 0) {
          // 如果操作员用户列表为空，则获取所有用户
          listUsers().then(response => {
            this.userOptions = response.data || [];
          }).catch(() => {
            // 如果API还未实现，使用模拟数据
            this.userOptions = [
              { userName: 'admin', nickName: '管理员' },
              { userName: 'ry', nickName: '若依' },
              { userName: 'test', nickName: '测试用户' }
            ];
          });
        }
      }).catch(() => {
        // 如果操作员用户API失败，则获取所有用户
        listUsers().then(response => {
          this.userOptions = response.data || [];
        }).catch(() => {
          // 如果API还未实现，使用模拟数据
          this.userOptions = [
            { userName: 'admin', nickName: '管理员' },
            { userName: 'ry', nickName: '若依' },
            { userName: 'test', nickName: '测试用户' }
          ];
        });
      });
    },
    /** 设备选择框变化 */
    handleDeviceChange(deviceId) {
      // 根据选择的设备过滤传感器选项
      if (deviceId) {
        const device = this.deviceOptions.find(item => item.deviceId === deviceId);
        if (device) {
          // 这里假设设备与传感器有关联，实际可能需要根据后端接口调整
          this.sensorOptions = this.sensorOptions.filter(item => item.deviceId === deviceId);
        }
      } else {
        this.getSensorOptions();
      }
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        dataId: null,
        deviceId: null,
        sensorId: null,
        torqueValue: null,
        dataTime: null,
        operator: null,
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
      this.dateRange = [];
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.dataId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加扭矩数据";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const dataId = row.dataId || this.ids[0]
      getTorqueData(dataId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改扭矩数据";
      });
    },
    /** 查看详情按钮操作 */
    handleView() {
      this.viewForm = this.dataList[0] || {};
      this.viewOpen = true;
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.dataId != null) {
            updateTorqueData(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addTorqueData(this.form).then(response => {
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
      const dataIds = row.dataId || this.ids;
      this.$modal.confirm('是否确认删除扭矩数据编号为"' + dataIds + '"的数据项？').then(function() {
        return delTorqueData(dataIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('torque/data/export', {
        ...this.queryParams
      }, `torque_data_${new Date().getTime()}.xlsx`)
    },
    /** 处理刷新频率设置 */
    handleRefreshRate(rate) {
      // 清除当前定时器
      if (this.refreshTimer) {
        clearInterval(this.refreshTimer);
        this.refreshTimer = null;
      }
      
      // 将字符串转换为数字
      const refreshRate = parseInt(rate);
      this.currentRefreshRate = refreshRate;
      
      // 设置新的定时器（如果频率大于0）
      if (refreshRate > 0) {
        this.refreshTimer = setInterval(() => {
          this.getList();
          this.$message.info(`数据已按照${refreshRate}秒频率自动刷新`);
        }, refreshRate * 1000);
        this.$message.success(`已设置数据刷新频率：${refreshRate}秒`);
      } else {
        this.$message.info('已关闭自动刷新');
      }
    }
  },
  // 组件销毁前清除定时器
  beforeDestroy() {
    if (this.refreshTimer) {
      clearInterval(this.refreshTimer);
    }
  }
};
</script>

<style scoped>
.chart-container {
  position: relative;
  width: 100%;
  height: 400px;
}
</style> 