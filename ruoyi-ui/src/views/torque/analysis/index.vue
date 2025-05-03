<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="设备名称" prop="deviceName">
        <el-select v-model="queryParams.deviceId" placeholder="请选择设备" clearable>
          <el-option
            v-for="item in deviceOptions"
            :key="item.deviceId"
            :label="item.deviceName"
            :value="item.deviceId"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="时间范围" prop="timeRange">
        <el-date-picker
          v-model="queryParams.timeRange"
          type="daterange"
          range-separator="至"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
          value-format="yyyy-MM-dd"
        ></el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
        <el-button type="info" icon="el-icon-s-tools" size="mini" @click="runDiagnostic">诊断</el-button>
        <el-button type="warning" icon="el-icon-connection" size="mini" @click="testAPIConnection">测试API</el-button>
        <el-button type="primary" plain icon="el-icon-question" size="mini" @click="showHelp">帮助</el-button>
        <el-dropdown @command="handleRefreshRate" split-button type="primary" size="mini" style="margin-left: 5px;">
          <i class="el-icon-time"></i> 刷新频率
          <el-dropdown-menu slot="dropdown">
            <el-dropdown-item command="0">关闭自动刷新</el-dropdown-item>
            <el-dropdown-item command="10">每10秒刷新</el-dropdown-item>
            <el-dropdown-item command="30">每30秒刷新</el-dropdown-item>
            <el-dropdown-item command="60">每1分钟刷新</el-dropdown-item>
            <el-dropdown-item command="300">每5分钟刷新</el-dropdown-item>
            <el-dropdown-item command="600">每10分钟刷新</el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
      </el-form-item>
    </el-form>

    <el-row :gutter="24">
      <el-col :span="24">
        <el-card shadow="hover" class="chart-card">
          <div slot="header">
            <span>扭矩数据趋势分析</span>
          </div>
          <div id="trendChart" style="width: 100%; height: 400px;"></div>
        </el-card>
      </el-col>
    </el-row>

    <el-row :gutter="24" style="margin-top: 20px;">
      <el-col :span="12">
        <el-card shadow="hover" class="chart-card">
          <div slot="header">
            <span>转速(RPM)趋势分析</span>
          </div>
          <div id="rpmChart" style="width: 100%; height: 300px;"></div>
        </el-card>
      </el-col>
      <el-col :span="12">
        <el-card shadow="hover" class="chart-card">
          <div slot="header">
            <span>温度趋势分析</span>
          </div>
          <div id="temperatureChart" style="width: 100%; height: 300px;"></div>
        </el-card>
      </el-col>
    </el-row>

    <el-row :gutter="24" style="margin-top: 20px;">
      <el-col :span="24">
        <el-card shadow="hover" class="chart-card">
          <div slot="header" style="display: flex; justify-content: space-between; align-items: center;">
            <span>异常数据分析</span>
            <el-button type="primary" size="mini" icon="el-icon-setting" @click="showThresholdDialog">安全阈值</el-button>
          </div>
          <div v-if="anomalyData.length === 0" class="empty-data">
            <el-empty description="暂无异常数据"></el-empty>
          </div>
          <el-table v-else v-loading="loading" :data="anomalyData" style="width: 100%">
            <el-table-column label="时间" align="center" prop="dataTime" />
            <el-table-column label="设备名称" align="center" prop="deviceName" />
            <el-table-column label="传感器名称" align="center" prop="sensorName" />
            <el-table-column label="扭矩值" align="center">
              <template slot-scope="scope">
                <el-tag 
                  :type="isOverThreshold(scope.row.torqueValue) ? 'danger' : 'warning'"
                  effect="dark"
                >
                  {{ scope.row.torqueValue }} {{ scope.row.torqueUnit || 'N·m' }}
                </el-tag>
              </template>
            </el-table-column>
            <el-table-column label="转速" align="center" prop="rpm" />
            <el-table-column label="温度" align="center" prop="temperature" />
            <el-table-column label="异常原因" align="center">
              <template slot-scope="scope">
                <span v-if="isOverMaxThreshold(scope.row.torqueValue)">
                  超过最大阈值 ({{ thresholdForm.maxThreshold }} N·m)
                </span>
                <span v-else-if="isBelowMinThreshold(scope.row.torqueValue)">
                  低于最小阈值 ({{ thresholdForm.minThreshold }} N·m)
                </span>
                <span v-else-if="scope.row.dataQuality === 0">
                  数据质量异常
                </span>
                <span v-else>
                  其他异常
                </span>
              </template>
            </el-table-column>
          </el-table>
          <div class="pagination-container" v-if="anomalyData.length > 0">
            <el-pagination
              background
              layout="total, sizes, prev, pager, next, jumper"
              :page-sizes="[5, 10, 20, 50]"
              :page-size="anomalyPageSize"
              :current-page="anomalyCurrentPage"
              :total="anomalyData.length"
              @size-change="handleAnomalySizeChange"
              @current-change="handleAnomalyCurrentChange"
            >
            </el-pagination>
          </div>
        </el-card>
      </el-col>
    </el-row>

    <el-row :gutter="24" style="margin-top: 20px;">
      <el-col :span="24">
        <el-card shadow="hover" class="chart-card">
          <div slot="header">
            <span>数据统计表</span>
          </div>
          <el-table v-loading="loading" :data="statisticsData">
            <el-table-column label="设备名称" align="center" prop="deviceName" />
            <el-table-column label="传感器名称" align="center" prop="sensorName" />
            <el-table-column label="扭矩平均值" align="center" prop="avgTorque" />
            <el-table-column label="扭矩最大值" align="center" prop="maxTorque" />
            <el-table-column label="扭矩最小值" align="center" prop="minTorque" />
            <el-table-column label="标准差" align="center" prop="stdDeviation" />
            <el-table-column label="数据记录数" align="center" prop="count" />
          </el-table>
        </el-card>
      </el-col>
    </el-row>

    <!-- 安全阈值设置对话框 -->
    <el-dialog title="扭矩安全阈值设置" :visible.sync="thresholdDialogVisible" width="30%">
      <el-form :model="thresholdForm" label-width="120px">
        <el-form-item label="最大安全阈值">
          <el-input-number v-model="thresholdForm.maxThreshold" :step="5" :min="0"></el-input-number>
          <span class="unit">N·m</span>
        </el-form-item>
        <el-form-item label="最小安全阈值">
          <el-input-number v-model="thresholdForm.minThreshold" :step="5" :min="0"></el-input-number>
          <span class="unit">N·m</span>
        </el-form-item>
        <el-form-item label="是否开启邮件通知">
          <el-switch v-model="thresholdForm.enableEmail"></el-switch>
        </el-form-item>
        <el-form-item label="接收邮箱" v-if="thresholdForm.enableEmail">
          <el-input v-model="thresholdForm.email" placeholder="请输入接收报警的邮箱"></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="thresholdDialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="saveThresholdSettings">保 存</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import * as echarts from 'echarts';
import axios from 'axios';
import { listData } from "@/api/torque/data";
import { listSensor } from "@/api/torque/sensor";
import { listDevice, getDevice, updateDevice } from "@/api/torque/device";
import { listAnalysis, getAnomalyAnalysis } from "@/api/torque/analysis";
import { getToken } from "@/utils/auth";
import { getUserProfile } from "@/api/system/user";

export default {
  name: "TorqueAnalysis",
  components: {},
  data() {
    return {
      // 遮罩层
      loading: true,
      // 显示搜索条件
      showSearch: true,
      // 设备选项
      deviceOptions: [],
      // 查询参数
      queryParams: {
        deviceId: null,
        timeRange: [],
        startTime: null,
        endTime: null
      },
      // 图表实例
      trendChart: null,
      rpmChart: null,
      temperatureChart: null,
      // 统计数据
      statisticsData: [],
      // 原始数据
      rawData: [],
      // 异常数据
      anomalyData: [],
      // 安全阈值对话框显示控制
      thresholdDialogVisible: false,
      // 阈值设置表单
      thresholdForm: {
        maxThreshold: 100,
        minThreshold: 0,
        enableEmail: false,
        email: '',
        deviceId: null
      },
      // 当前用户信息
      currentUser: {},
      // 是否已检查过阈值异常
      thresholdChecked: false,
      // 异常数据分页
      anomalyPageSize: 10,
      anomalyCurrentPage: 1,
      // 数据是否已加载标志
      dataLoaded: false,
      // 用户主动搜索标志
      userInitiatedSearch: false,
      // 刷新定时器
      refreshTimer: null,
      // 当前刷新频率（秒）
      currentRefreshRate: 0
    };
  },
  created() {
    this.initParams();
    this.getDeviceOptions();
    this.getCurrentUserInfo();
    this.loadThresholdSettings();
  },
  mounted() {
    this.initCharts();
    // 使用setTimeout确保DOM完全渲染
    setTimeout(() => {
      this.loadData();
    }, 300);
  },
  beforeDestroy() {
    // 清除刷新定时器
    if (this.refreshTimer) {
      clearInterval(this.refreshTimer);
    }
    
    // 清除图表resize监听
    window.removeEventListener('resize', this.resizeCharts);
  },
  methods: {
    // 初始化查询参数
    initParams() {
      // 默认查询最近7天数据
      const end = new Date();
      const start = new Date();
      start.setTime(start.getTime() - 3600 * 1000 * 24 * 7);
      
      // 确保使用正确的当前年份
      const endFormatted = this.formatDate(end);
      const startFormatted = this.formatDate(start);
      
      console.log('设置初始日期范围：', startFormatted, '至', endFormatted);
      
      this.queryParams.timeRange = [
        startFormatted,
        endFormatted
      ];
      this.queryParams.startTime = startFormatted;
      this.queryParams.endTime = endFormatted;
    },
    
    // 格式化日期
    formatDate(date) {
      const year = date.getFullYear();
      const month = (date.getMonth() + 1).toString().padStart(2, '0');
      const day = date.getDate().toString().padStart(2, '0');
      return `${year}-${month}-${day}`;
    },
    // 初始化图表
    initCharts() {
      this.trendChart = echarts.init(document.getElementById('trendChart'));
      this.rpmChart = echarts.init(document.getElementById('rpmChart'));
      this.temperatureChart = echarts.init(document.getElementById('temperatureChart'));
      
      // 响应式处理
      window.addEventListener('resize', this.resizeCharts);
    },
    // 获取设备选项
    getDeviceOptions() {
      listDevice().then(response => {
        this.deviceOptions = response.rows || [];
        if (this.deviceOptions.length > 0) {
          // 默认选择第一个设备
          this.queryParams.deviceId = this.deviceOptions[0].deviceId;
          // 自动查询数据
          this.handleQuery();
        } else {
          // 如果没有获取到设备数据，则使用模拟数据
          this.deviceOptions = [
            { deviceId: 1, deviceName: '重型主轴加工工ID5' },
            { deviceId: 2, deviceName: '精密磨床M2000' },
            { deviceId: 3, deviceName: '数控车床NC300' }
          ];
          this.queryParams.deviceId = this.deviceOptions[0].deviceId;
          this.handleQuery();
        }
      }).catch(() => {
        // 发生错误时使用模拟数据
        this.deviceOptions = [
          { deviceId: 1, deviceName: '重型主轴加工工ID5' },
          { deviceId: 2, deviceName: '精密磨床M2000' },
          { deviceId: 3, deviceName: '数控车床NC300' }
        ];
        this.queryParams.deviceId = this.deviceOptions[0].deviceId;
        this.handleQuery();
      });
    },
    // 获取当前用户信息
    getCurrentUserInfo() {
      getUserProfile().then(response => {
        if (response.code === 200) {
          this.currentUser = response.data;
          // 默认设置为当前用户邮箱
          if (this.currentUser.email) {
            this.thresholdForm.email = this.currentUser.email;
          } else {
            // 如果用户没有邮箱，则使用用户名和指定域名构造邮箱
            this.thresholdForm.email = `${this.currentUser.userName || 'user'}@xxxl1d.site`;
          }
        }
      }).catch(error => {
        console.error("获取用户信息失败:", error);
      });
    },
    // 显示阈值设置对话框
    showThresholdDialog() {
      // 如果有选中的设备，则获取设备信息并设置阈值
      if (this.queryParams.deviceId) {
        getDevice(this.queryParams.deviceId).then(response => {
          if (response.data) {
            this.thresholdForm = {
              ...this.thresholdForm,
              deviceId: this.queryParams.deviceId,
              maxThreshold: response.data.maxThreshold || 100,
              minThreshold: response.data.minThreshold || 0
            };
            this.thresholdDialogVisible = true;
          }
        });
      } else {
        this.$message.warning('请先选择设备');
      }
    },
    
    // 保存阈值设置
    saveThresholdSettings() {
      if (!this.thresholdForm.deviceId) {
        this.$message.warning('没有选择设备，无法保存阈值设置');
        return;
      }
      
      // 更新设备信息
      getDevice(this.thresholdForm.deviceId).then(response => {
        if (response.data) {
          const deviceData = response.data;
          deviceData.maxThreshold = this.thresholdForm.maxThreshold;
          deviceData.minThreshold = this.thresholdForm.minThreshold;
          
          updateDevice(deviceData).then(res => {
            this.$message.success('安全阈值设置已保存');
            this.thresholdDialogVisible = false;
            
            // 重新检查数据是否超出阈值
            this.checkThresholdViolations();
          }).catch(error => {
            console.error('保存阈值设置失败:', error);
            this.$message.error('保存阈值设置失败');
          });
        }
      });
    },
    
    // 加载阈值设置
    loadThresholdSettings() {
      if (!this.queryParams.deviceId) {
        // 没有选择设备，使用默认值
        this.thresholdForm = {
          maxThreshold: 100,
          minThreshold: 0,
          enableEmail: false,
          email: this.currentUser.email || '',
          deviceId: null
        };
        return;
      }
      
      // 从数据库加载设备阈值设置
      getDevice(this.queryParams.deviceId).then(response => {
        if (response.data) {
          this.thresholdForm = {
            maxThreshold: response.data.maxThreshold || 100,
            minThreshold: response.data.minThreshold || 0,
            enableEmail: false,
            email: this.currentUser.email || '',
            deviceId: this.queryParams.deviceId
          };
          console.log('已加载阈值设置:', this.thresholdForm);
        }
      }).catch(error => {
        console.error('加载阈值设置失败:', error);
        // 使用默认值
        this.thresholdForm = {
          maxThreshold: 100,
          minThreshold: 0,
          enableEmail: false,
          email: this.currentUser.email || '',
          deviceId: this.queryParams.deviceId
        };
      });
    },
    
    // 检查数据是否超出阈值
    checkThresholdViolations() {
      if (!this.rawData || !Array.isArray(this.rawData) || this.rawData.length === 0 || this.thresholdChecked) {
        return;
      }
      
      const { maxThreshold, minThreshold, enableEmail } = this.thresholdForm;
      const deviceId = this.queryParams.deviceId;
      
      // 筛选超出阈值的数据
      const violations = this.rawData.filter(item => {
        if (!deviceId || item.deviceId === deviceId) {
          const torqueValue = parseFloat(item.torqueValue);
          return !isNaN(torqueValue) && (torqueValue > maxThreshold || torqueValue < minThreshold);
        }
        return false;
      });
      
      if (violations.length > 0) {
        // 添加到异常数据中（需要去重）
        this.addUniqueAnomalyData(violations);
        
        console.log(`发现${violations.length}条超出安全阈值的数据`);
        this.$message.warning(`发现${violations.length}条超出安全阈值的数据`);
        
        // 如果开启了邮件通知，则发送邮件
        if (enableEmail && this.thresholdForm.email) {
          this.sendAlertEmail(violations);
        }
      }
      
      this.thresholdChecked = true;
    },
    
    // 添加唯一的异常数据（去重）
    addUniqueAnomalyData(newData) {
      if (!newData || newData.length === 0) {
        return;
      }
      
      // 创建一个Map用于检查重复数据
      const existingDataMap = new Map();
      
      // 将现有数据放入Map中
      this.anomalyData.forEach(item => {
        // 使用关键字段组合作为唯一标识
        const key = this.getAnomalyDataKey(item);
        existingDataMap.set(key, true);
      });
      
      // 筛选不重复的新数据
      const uniqueNewData = newData.filter(item => {
        const key = this.getAnomalyDataKey(item);
        if (existingDataMap.has(key)) {
          return false; // 数据已存在，不添加
        }
        existingDataMap.set(key, true); // 标记为已添加
        return true; // 添加新数据
      });
      
      // 添加唯一的新数据
      if (uniqueNewData.length > 0) {
        this.anomalyData = [...this.anomalyData, ...uniqueNewData];
        // 更新异常图表
        this.updateAnomalyChart();
      }
    },
    
    // 获取异常数据的唯一标识
    getAnomalyDataKey(item) {
      // 使用关键字段组合作为唯一标识
      // 根据实际数据结构调整这些字段
      return `${item.deviceId}-${item.sensorId}-${item.dataTime}-${item.torqueValue}`;
    },
    
    // 发送报警邮件
    sendAlertEmail(violations) {
      const deviceName = this.getDeviceName(this.queryParams.deviceId) || '未知设备';
      const emailData = {
        to: this.thresholdForm.email,
        subject: `扭矩数据安全阈值报警 - ${deviceName}`,
        content: `
          <h3>扭矩数据安全阈值报警</h3>
          <p>设备: ${deviceName}</p>
          <p>安全阈值范围: ${this.thresholdForm.minThreshold} ~ ${this.thresholdForm.maxThreshold} N·m</p>
          <p>发现${violations.length}条超出安全阈值的数据</p>
          <table border="1" cellpadding="5" style="border-collapse: collapse;">
            <tr>
              <th>时间</th>
              <th>扭矩值</th>
              <th>状态</th>
            </tr>
            ${violations.slice(0, 10).map(v => `
              <tr>
                <td>${v.dataTime}</td>
                <td>${v.torqueValue} N·m</td>
                <td>${parseFloat(v.torqueValue) > this.thresholdForm.maxThreshold ? '超过最大阈值' : '低于最小阈值'}</td>
              </tr>
            `).join('')}
            ${violations.length > 10 ? `<tr><td colspan="3">还有${violations.length - 10}条数据未显示...</td></tr>` : ''}
          </table>
          <p>请及时处理!</p>
        `
      };
      
      // 模拟发送邮件，实际项目中应替换为真实的邮件API调用
      console.log('准备发送报警邮件:', emailData);
      this.$message.info(`已向${this.thresholdForm.email}发送报警邮件`);
      
      // 如果有邮件发送API，可以调用
      // axios.post('/api/system/email/send', emailData, {
      //   headers: { 'Authorization': 'Bearer ' + getToken() }
      // }).then(res => {
      //   if (res.code === 200) {
      //     this.$message.success('报警邮件发送成功');
      //   } else {
      //     this.$message.error('报警邮件发送失败：' + res.msg);
      //   }
      // }).catch(error => {
      //   console.error('报警邮件发送失败:', error);
      //   this.$message.error('报警邮件发送失败，请检查网络连接');
      // });
    },
    // 查询数据
    handleQuery() {
      this.userInitiatedSearch = true; // 在点击搜索按钮时设置标记
      this.loadData();
    },
    // 实际加载数据的方法（原handleQuery的主体部分）
    loadData() {
      this.loading = true;
      this.thresholdChecked = false;
      
      // 重新加载阈值设置，以获取最新的设置
      this.loadThresholdSettings();
      
      // 处理时间范围
      if (this.queryParams.timeRange && this.queryParams.timeRange.length > 1) {
        this.queryParams.startTime = this.queryParams.timeRange[0];
        this.queryParams.endTime = this.queryParams.timeRange[1];
      }
      
      console.log("查询参数:", this.queryParams); // 添加日志，便于调试
      
      // 添加一个标志，表示这是首次加载
      const isFirstLoad = !this.dataLoaded;
      
      try {
        // 获取主要分析数据
        listAnalysis(this.queryParams).then(response => {
          console.log("分析数据响应:", response); // 添加日志
          if (response && response.code === 200) {
            if (response.msg && response.msg.includes("未关联")) {
              this.$message({
                message: '所选设备和传感器未建立关联关系，请检查配置',
                type: 'warning'
              });
              this.loading = false;
              return;
            }
            
            // 详细检查接收到的数据结构
            console.log("response.data类型:", Object.prototype.toString.call(response.data));
            console.log("response.statistics类型:", Object.prototype.toString.call(response.statistics));
            
            // 确保rawData始终是数组
            if (response.data && Array.isArray(response.data)) {
              this.rawData = response.data;
              console.log("成功设置rawData:", this.rawData.length + "条记录");
            } else if (response.data && typeof response.data === 'object') {
              // 尝试从响应中提取数组数据
              if (response.data.data && Array.isArray(response.data.data)) {
                this.rawData = response.data.data;
                console.log("从嵌套对象中提取rawData:", this.rawData.length + "条记录");
              } else {
                this.rawData = [];
                console.warn("response.data不是数组且不包含data数组");
              }
            } else {
              this.rawData = [];
              console.warn("response.data为空或不是预期格式");
            }
            
            // 确保statisticsData始终是数组
            if (response.statistics && Array.isArray(response.statistics)) {
              this.statisticsData = response.statistics;
              console.log("成功设置statisticsData:", this.statisticsData.length + "条记录");
            } else if (response.statistics && typeof response.statistics === 'object') {
              // 尝试从响应中提取数组数据
              if (response.statistics.statistics && Array.isArray(response.statistics.statistics)) {
                this.statisticsData = response.statistics.statistics;
                console.log("从嵌套对象中提取statisticsData:", this.statisticsData.length + "条记录");
              } else {
                this.statisticsData = [];
                console.warn("response.statistics不是数组且不包含statistics数组");
              }
            } else {
              this.statisticsData = [];
              console.warn("response.statistics为空或不是预期格式");
            }
            
            // 如果statisticsData为空但rawData不为空，尝试从rawData生成统计数据
            if (this.statisticsData.length === 0 && this.rawData.length > 0) {
              console.log("尝试从rawData生成统计数据...");
              this.generateStatisticsFromRawData();
            }
            
            // 检查是否有数据
            if (this.rawData.length === 0 && this.statisticsData.length === 0) {
              // 直接提示用户没有数据，不询问是否加载模拟数据
              // 只在非首次加载或用户主动搜索时显示提示
              if (!isFirstLoad || this.userInitiatedSearch) {
                this.$message({
                  type: 'info',
                  message: '选定时间范围内没有扭矩数据'
                });
              }
              
              // 清空异常数据
              this.anomalyData = [];
              
              // 更新各图表，显示"暂无扭矩数据"
              this.updateCharts();
              this.loading = false;
              return;
            }
            
            // 获取异常分析数据
            this.getAnomalyData();
            
            // 标记数据已加载
            this.dataLoaded = true;
          } else {
            // 只在用户主动搜索时显示错误信息
            if (this.userInitiatedSearch) {
              this.$message.error('获取分析数据失败：' + (response.msg || '未知错误'));
            }
            
            if (response.msg && response.msg.includes("未关联")) {
              this.$confirm('是否要查看设备和传感器的关联配置？', '关联配置', {
                confirmButtonText: '查看配置',
                cancelButtonText: '取消',
                type: 'warning'
              }).then(() => {
                // 跳转到关联配置页面
                this.$router.push('/torque/relation');
              }).catch(() => {});
            } else {
              // 清空数据并更新图表
              this.rawData = [];
              this.statisticsData = [];
              this.anomalyData = [];
              this.updateCharts();
            }
            this.loading = false;
          }
        }).catch(err => {
          console.error("获取分析数据出错:", err); // 添加错误日志
          // 只在用户主动搜索时显示错误信息
          if (this.userInitiatedSearch) {
            this.$message.error('获取分析数据出错');
          }
          // 清空数据并更新图表
          this.rawData = [];
          this.statisticsData = [];
          this.anomalyData = [];
          this.updateCharts();
          this.loading = false;
        });
      } catch (error) {
        console.error("执行查询时发生异常:", error); // 添加异常日志
        // 只在用户主动搜索时显示错误信息
        if (this.userInitiatedSearch) {
          this.$message.error('查询过程中发生错误');
        }
        // 清空数据并更新图表
        this.rawData = [];
        this.statisticsData = [];
        this.anomalyData = [];
        this.updateCharts();
        this.loading = false;
      }
    },
    // 获取异常数据
    getAnomalyData() {
      try {
        getAnomalyAnalysis(this.queryParams).then(res => {
          console.log("异常数据响应:", res); // 添加日志
          if (res && res.code === 200) {
            // 详细检查接收到的数据结构
            console.log("res.data类型:", Object.prototype.toString.call(res.data));
            
            // 确保anomalyData始终是数组
            let newAnomalyData = [];
            if (res.data && Array.isArray(res.data)) {
              newAnomalyData = res.data;
              console.log("成功获取anomalyData:", newAnomalyData.length + "条记录");
            } else if (res.data && typeof res.data === 'object') {
              // 尝试从响应中提取数组数据
              if (res.data.data && Array.isArray(res.data.data)) {
                newAnomalyData = res.data.data;
                console.log("从嵌套对象中提取anomalyData:", newAnomalyData.length + "条记录");
              } else {
                console.warn("res.data不是数组且不包含data数组");
              }
            } else {
              console.warn("res.data为空或不是预期格式");
            }
            
            // 初始化异常数据（清空之前的数据）
            this.anomalyData = [];
            
            // 添加获取到的异常数据（没有重复问题）
            if (newAnomalyData.length > 0) {
              this.anomalyData = newAnomalyData;
            }
          } else {
            this.$message.warning('获取异常数据失败');
            this.anomalyData = [];
          }
          
          // 在获取异常数据之后，检查阈值违规
          this.handleQueryResult();
        }).catch(err => {
          console.error("获取异常数据出错:", err); // 添加错误日志
          this.$message.warning('获取异常数据出错');
          this.anomalyData = [];
          this.handleQueryResult();
        });
      } catch (error) {
        console.error("获取异常数据时发生异常:", error); // 添加异常日志
        this.anomalyData = [];
        this.handleQueryResult();
      }
    },
    // 重置查询
    resetQuery() {
      this.resetForm("queryForm");
      this.userInitiatedSearch = true; // 标记为用户主动搜索
      this.handleQuery();
    },
    // 更新图表
    updateCharts() {
      this.updateTrendChart();
      this.updateRpmChart();
      this.updateTemperatureChart();
    },
    // 更新趋势图
    updateTrendChart() {
      if (!this.rawData || !Array.isArray(this.rawData) || this.rawData.length === 0) {
        this.trendChart.setOption({
          title: {
            text: '暂无扭矩数据',
            left: 'center',
            top: 'center'
          }
        });
        return;
      }
      
      // 格式化数据
      const dates = this.rawData.map(item => {
        if (typeof item.dataTime === 'string') {
          // 如果是完整的ISO格式时间，截取日期和时间部分
          if (item.dataTime.includes('T')) {
            return item.dataTime.replace('T', ' ').substring(0, 19);
          }
          // 简化日期显示格式
          if (item.dataTime.includes(' ')) {
            const parts = item.dataTime.split(' ');
            // 仅保留月日和时分
            if (parts[0].includes('-')) {
              const dateParts = parts[0].split('-');
              return `${dateParts[1]}-${dateParts[2]} ${parts[1].substring(0, 5)}`;
            }
          }
          return item.dataTime;
        }
        return '未知时间';
      });
      
      const values = this.rawData.map(item => {
        if (item.torqueValue !== null && item.torqueValue !== undefined) {
          return parseFloat(item.torqueValue);
        }
        return 0;
      });
      
      const option = {
        title: {
          text: '扭矩数据趋势',
          left: 'center'
        },
        tooltip: {
          trigger: 'axis',
          formatter: function(params) {
            const dataIndex = params[0].dataIndex;
            const originalTime = this.rawData[dataIndex]?.dataTime || '';
            return `${originalTime}<br/>${params[0].seriesName}: ${params[0].value} N·m`;
          }.bind(this)
        },
        grid: {
          left: '3%',
          right: '4%',
          bottom: '8%', // 增加底部空间以容纳标签
          containLabel: true
        },
        xAxis: {
          type: 'category',
          data: dates,
          axisLabel: {
            rotate: 45, // 旋转标签以便于阅读
            interval: Math.ceil(dates.length / 15), // 动态计算间隔，避免标签重叠
            formatter: function(value) {
              // 进一步简化显示
              return value.length > 8 ? value.substring(0, 8) + '...' : value;
            },
            rich: {
              a: {
                fontSize: 10, // 减小标签字体大小
                lineHeight: 10
              }
            }
          },
          axisTick: {
            alignWithLabel: true
          }
        },
        yAxis: {
          type: 'value',
          name: '扭矩值 (N·m)'
        },
        dataZoom: [
          {
            type: 'inside', // 内置型数据区域缩放组件
            start: 0,
            end: 100
          },
          {
            type: 'slider', // 滑动条型数据区域缩放组件
            start: 0,
            end: 100,
            height: 20 // 减小滑动条高度
          }
        ],
        series: [
          {
            name: '扭矩值',
            type: 'line',
            data: values,
            smooth: true
          }
        ]
      };
      
      this.trendChart.setOption(option);
    },
    // 更新异常图
    updateAnomalyChart() {
      // 由于已经改为表格展示，不再需要更新图表
      console.log("异常数据更新，共" + this.anomalyData.length + "条记录");
    },
    // 更新RPM图表
    updateRpmChart() {
      if (!this.rawData || !Array.isArray(this.rawData) || this.rawData.length === 0) {
        this.rpmChart.setOption({
          title: {
            text: '暂无扭矩数据',
            left: 'center',
            top: 'center'
          }
        });
        return;
      }
      
      // 格式化数据
      const dates = this.rawData.map(item => {
        if (typeof item.dataTime === 'string') {
          // 简化日期显示格式
          if (item.dataTime.includes(' ')) {
            const parts = item.dataTime.split(' ');
            // 仅保留月日和时分
            if (parts[0].includes('-')) {
              const dateParts = parts[0].split('-');
              return `${dateParts[1]}-${dateParts[2]} ${parts[1].substring(0, 5)}`;
            }
          }
          return item.dataTime;
        }
        return '未知时间';
      });
      
      const rpmValues = this.rawData.map(item => {
        if (item.rpm !== null && item.rpm !== undefined) {
          return parseFloat(item.rpm);
        }
        return 0;
      });
      
      const option = {
        title: {
          text: '转速(RPM)趋势',
          left: 'center'
        },
        tooltip: {
          trigger: 'axis',
          formatter: function(params) {
            const dataIndex = params[0].dataIndex;
            const originalTime = this.rawData[dataIndex]?.dataTime || '';
            return `${originalTime}<br/>${params[0].seriesName}: ${params[0].value} RPM`;
          }.bind(this)
        },
        grid: {
          left: '3%',
          right: '4%',
          bottom: '8%', // 增加底部空间以容纳标签
          containLabel: true
        },
        xAxis: {
          type: 'category',
          data: dates,
          axisLabel: {
            rotate: 45, // 旋转标签以便于阅读
            interval: Math.ceil(dates.length / 15), // 动态计算间隔，避免标签重叠
            formatter: function(value) {
              // 进一步简化显示
              return value.length > 8 ? value.substring(0, 8) + '...' : value;
            },
            rich: {
              a: {
                fontSize: 10, // 减小标签字体大小
                lineHeight: 10
              }
            }
          },
          axisTick: {
            alignWithLabel: true
          }
        },
        yAxis: {
          type: 'value',
          name: '转速(RPM)'
        },
        dataZoom: [
          {
            type: 'inside', // 内置型数据区域缩放组件
            start: 0,
            end: 100
          },
          {
            type: 'slider', // 滑动条型数据区域缩放组件
            start: 0,
            end: 100,
            height: 20 // 减小滑动条高度
          }
        ],
        series: [
          {
            name: '转速',
            type: 'line',
            data: rpmValues,
            smooth: true,
            itemStyle: {
              color: '#67C23A'
            }
          }
        ]
      };
      
      this.rpmChart.setOption(option);
    },
    
    // 更新温度图表
    updateTemperatureChart() {
      if (!this.rawData || !Array.isArray(this.rawData) || this.rawData.length === 0) {
        this.temperatureChart.setOption({
          title: {
            text: '暂无扭矩数据',
            left: 'center',
            top: 'center'
          }
        });
        return;
      }
      
      // 格式化数据
      const dates = this.rawData.map(item => {
        if (typeof item.dataTime === 'string') {
          // 简化日期显示格式
          if (item.dataTime.includes(' ')) {
            const parts = item.dataTime.split(' ');
            // 仅保留月日和时分
            if (parts[0].includes('-')) {
              const dateParts = parts[0].split('-');
              return `${dateParts[1]}-${dateParts[2]} ${parts[1].substring(0, 5)}`;
            }
          }
          return item.dataTime;
        }
        return '未知时间';
      });
      
      const tempValues = this.rawData.map(item => {
        if (item.temperature !== null && item.temperature !== undefined) {
          return parseFloat(item.temperature);
        }
        return 0;
      });
      
      const option = {
        title: {
          text: '温度趋势',
          left: 'center'
        },
        tooltip: {
          trigger: 'axis',
          formatter: function(params) {
            const dataIndex = params[0].dataIndex;
            const originalTime = this.rawData[dataIndex]?.dataTime || '';
            return `${originalTime}<br/>${params[0].seriesName}: ${params[0].value} °C`;
          }.bind(this)
        },
        grid: {
          left: '3%',
          right: '4%',
          bottom: '8%', // 增加底部空间以容纳标签
          containLabel: true
        },
        xAxis: {
          type: 'category',
          data: dates,
          axisLabel: {
            rotate: 45, // 旋转标签以便于阅读
            interval: Math.ceil(dates.length / 15), // 动态计算间隔，避免标签重叠
            formatter: function(value) {
              // 进一步简化显示
              return value.length > 8 ? value.substring(0, 8) + '...' : value;
            },
            rich: {
              a: {
                fontSize: 10, // 减小标签字体大小
                lineHeight: 10
              }
            }
          },
          axisTick: {
            alignWithLabel: true
          }
        },
        yAxis: {
          type: 'value',
          name: '温度(°C)'
        },
        dataZoom: [
          {
            type: 'inside', // 内置型数据区域缩放组件
            start: 0,
            end: 100
          },
          {
            type: 'slider', // 滑动条型数据区域缩放组件
            start: 0,
            end: 100,
            height: 20 // 减小滑动条高度
          }
        ],
        series: [
          {
            name: '温度',
            type: 'line',
            data: tempValues,
            smooth: true,
            itemStyle: {
              color: '#F56C6C'
            }
          }
        ]
      };
      
      this.temperatureChart.setOption(option);
    },
    // 模拟数据（当后端API未实现时使用）
    mockData() {
      // 模拟原始数据
      const today = new Date();
      const dataPoints = 30; // 增加数据点数量使图表更丰富
      
      // 从您提供的数据中构建模拟数据
      const realData = [
        {id: 1, deviceId: 8, sensorId: 1, torqueValue: 45.75, torqueUnit: 'N·m', rpm: 1500.00, temperature: 35.20, dataTime: '2023-08-01 08:30:00', dataQuality: 1},
        {id: 2, deviceId: 6, sensorId: 1, torqueValue: 47.20, torqueUnit: 'N·m', rpm: 1520.00, temperature: 35.50, dataTime: '2023-08-01 08:45:00', dataQuality: 1},
        {id: 3, deviceId: 7, sensorId: 1, torqueValue: 46.85, torqueUnit: 'N·m', rpm: 1510.00, temperature: 35.40, dataTime: '2023-08-01 09:00:00', dataQuality: 1},
        {id: 31, deviceId: 4, sensorId: 1, torqueValue: 75.25, torqueUnit: 'N·m', rpm: 1550.00, temperature: 45.20, dataTime: '2023-08-02 08:30:00', dataQuality: 0},
        {id: 4, deviceId: 2, sensorId: 2, torqueValue: 95.30, torqueUnit: 'N·m', rpm: 750.00, temperature: 42.10, dataTime: '2023-08-01 08:30:00', dataQuality: 1},
        {id: 5, deviceId: 2, sensorId: 2, torqueValue: 97.25, torqueUnit: 'N·m', rpm: 755.00, temperature: 42.30, dataTime: '2023-08-01 08:45:00', dataQuality: 1},
        {id: 6, deviceId: 2, sensorId: 2, torqueValue: 96.80, torqueUnit: 'N·m', rpm: 752.00, temperature: 42.20, dataTime: '2023-08-01 09:00:00', dataQuality: 1},
        {id: 32, deviceId: 2, sensorId: 2, torqueValue: 125.80, torqueUnit: 'N·m', rpm: 780.00, temperature: 55.30, dataTime: '2023-08-02 09:30:00', dataQuality: 0},
        {id: 36, deviceId: 2, sensorId: 2, torqueValue: 96.45, torqueUnit: 'N·m', rpm: 748.50, temperature: 42.15, dataTime: '2023-08-01 10:00:00', dataQuality: 1},
        {id: 37, deviceId: 2, sensorId: 2, torqueValue: 97.10, torqueUnit: 'N·m', rpm: 751.20, temperature: 42.25, dataTime: '2023-08-01 11:00:00', dataQuality: 1},
        {id: 38, deviceId: 2, sensorId: 2, torqueValue: 95.80, torqueUnit: 'N·m', rpm: 747.30, temperature: 42.05, dataTime: '2023-08-01 12:00:00', dataQuality: 1},
        {id: 39, deviceId: 2, sensorId: 2, torqueValue: 96.25, torqueUnit: 'N·m', rpm: 750.10, temperature: 42.20, dataTime: '2023-08-01 13:00:00', dataQuality: 1},
        {id: 40, deviceId: 2, sensorId: 2, torqueValue: 97.45, torqueUnit: 'N·m', rpm: 753.40, temperature: 42.35, dataTime: '2023-08-01 14:00:00', dataQuality: 1},
        {id: 41, deviceId: 2, sensorId: 2, torqueValue: 96.60, torqueUnit: 'N·m', rpm: 749.80, temperature: 42.25, dataTime: '2023-08-01 15:00:00', dataQuality: 1},
        {id: 42, deviceId: 2, sensorId: 2, torqueValue: 95.90, torqueUnit: 'N·m', rpm: 746.50, temperature: 42.10, dataTime: '2023-08-01 16:00:00', dataQuality: 1},
        {id: 43, deviceId: 2, sensorId: 2, torqueValue: 97.30, torqueUnit: 'N·m', rpm: 752.60, temperature: 42.30, dataTime: '2023-08-01 17:00:00', dataQuality: 1}
      ];
      
      // 获取传入的设备ID，如果有
      const selectedDeviceId = this.queryParams.deviceId;
      
      // 如果选择了特定设备，过滤数据
      let filteredData = realData;
      if (selectedDeviceId) {
        filteredData = realData.filter(item => item.deviceId === selectedDeviceId);
        
        // 如果过滤后没有数据，则使用所有数据
        if (filteredData.length === 0) {
          filteredData = realData;
        }
      }
      
      // 设置设备名称
      filteredData = filteredData.map(item => {
        const deviceName = this.getDeviceName(item.deviceId) || `设备${item.deviceId}`;
        const sensorName = `传感器${item.sensorId}`;
        return {
          ...item,
          deviceName,
          sensorName
        };
      });
      
      this.rawData = filteredData;
      console.log("设置模拟rawData:", this.rawData.length + "条记录");
      
      // 通过rawData生成统计数据
      this.generateStatisticsFromRawData();
      
      // 设置异常数据
      this.anomalyData = filteredData.filter(item => item.dataQuality === 0);
      console.log("设置模拟anomalyData:", this.anomalyData.length + "条记录");
      
      // 更新图表
      this.updateCharts();
      this.loading = false;
    },
    // 格式化日期和时间
    formatDateTime(date) {
      const year = date.getFullYear();
      const month = (date.getMonth() + 1).toString().padStart(2, '0');
      const day = date.getDate().toString().padStart(2, '0');
      const hours = date.getHours().toString().padStart(2, '0');
      const minutes = date.getMinutes().toString().padStart(2, '0');
      const seconds = date.getSeconds().toString().padStart(2, '0');
      
      return `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;
    },
    
    // 获取设备名称
    getDeviceName(deviceId) {
      const device = this.deviceOptions.find(d => d.deviceId === deviceId);
      return device ? device.deviceName : `设备${deviceId}`;
    },
    
    // 获取传感器名称
    getSensorName(sensorId) {
      // 因为传感器相关部分已移除，直接返回一个默认名称
      return `传感器${sensorId}`;
    },
    // 模拟异常数据（当后端API未实现时使用）
    mockAnomalyData() {
      // 模拟异常数据
      this.anomalyData = [
        {
          deviceId: 1,
          deviceName: '测试设备1',
          count: 2
        },
        {
          deviceId: 2,
          deviceName: '测试设备2',
          count: 1
        },
        {
          deviceId: 3,
          deviceName: '测试设备3',
          count: 0
        }
      ];
      
      // 更新图表
      this.updateAnomalyChart();
    },
    // 运行诊断
    runDiagnostic() {
      this.$message.info('开始诊断系统...');
      
      // 检查数据源可用性
      const checkAPIs = [
        { name: '设备列表API', fn: listDevice },
        { name: '传感器列表API', fn: listSensor },
        { name: '扭矩分析API', fn: listAnalysis, params: {} },
        { name: '异常数据API', fn: getAnomalyAnalysis, params: {} }
      ];
      
      const results = [];
      let completedChecks = 0;
      
      checkAPIs.forEach(api => {
        const startTime = new Date().getTime();
        api.fn(api.params || {}).then(response => {
          const endTime = new Date().getTime();
          const latency = endTime - startTime;
          
          results.push({
            name: api.name,
            status: response && response.code === 200 ? '成功' : '失败',
            latency: latency + 'ms',
            message: response.msg || ''
          });
        }).catch(err => {
          results.push({
            name: api.name,
            status: '错误',
            latency: '-',
            message: err.message || '未知错误'
          });
        }).finally(() => {
          completedChecks++;
          if (completedChecks === checkAPIs.length) {
            this.showDiagnosticResult(results);
          }
        });
      });
    },
    
    // 显示诊断结果
    showDiagnosticResult(results) {
      let html = '<div style="max-height: 300px; overflow-y: auto;"><table style="width: 100%; border-collapse: collapse;">';
      html += '<tr style="background-color: #f2f2f2;"><th style="padding: 8px; border: 1px solid #ddd;">API名称</th><th style="padding: 8px; border: 1px solid #ddd;">状态</th><th style="padding: 8px; border: 1px solid #ddd;">响应时间</th><th style="padding: 8px; border: 1px solid #ddd;">消息</th></tr>';
      
      results.forEach(result => {
        const statusColor = result.status === '成功' ? 'green' : (result.status === '错误' ? 'red' : 'orange');
        html += `<tr>
          <td style="padding: 8px; border: 1px solid #ddd;">${result.name}</td>
          <td style="padding: 8px; border: 1px solid #ddd; color: ${statusColor};">${result.status}</td>
          <td style="padding: 8px; border: 1px solid #ddd;">${result.latency}</td>
          <td style="padding: 8px; border: 1px solid #ddd;">${result.message}</td>
        </tr>`;
      });
      
      html += '</table></div>';
      
      this.$alert(html, '系统诊断结果', {
        dangerouslyUseHTMLString: true,
        confirmButtonText: '确定',
        callback: action => {
          this.$message({
            type: 'info',
            message: '诊断完成'
          });
        }
      });
    },
    // 加载模拟数据
    loadMockData() {
      this.$confirm('确定要使用模拟数据吗？这将不会请求后端服务。', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.mockData();
        this.$message({
          type: 'success',
          message: '已加载模拟数据'
        });
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消操作'
        });
      });
    },
    // 测试API连通性
    testAPIConnection() {
      this.$message.info('正在测试API连通性...');
      
      // 定义要测试的API端点
      const apiEndpoints = [
        {name: '设备列表API', url: '/torque/device/list'},
        {name: '传感器列表API', url: '/torque/sensor/list'},
        {name: '扭矩分析列表API', url: '/torque/analysis/list'},
        {name: '扭矩趋势API', url: '/torque/analysis/trend'},
        {name: '异常数据API', url: '/torque/analysis/anomaly'}
      ];
      
      const testPromises = apiEndpoints.map(endpoint => {
        const start = new Date().getTime();
        return axios.get(process.env.VUE_APP_BASE_API + endpoint.url, {
          params: {},
          timeout: 5000
        }).then(response => {
          const end = new Date().getTime();
          return {
            name: endpoint.name,
            url: endpoint.url,
            status: response.status,
            time: (end - start) + 'ms',
            result: 'success'
          };
        }).catch(error => {
          return {
            name: endpoint.name,
            url: endpoint.url,
            status: error.response ? error.response.status : 'N/A',
            time: 'N/A',
            result: 'failed',
            error: error.message
          };
        });
      });
      
      Promise.all(testPromises).then(results => {
        let message = '<div style="max-height: 400px; overflow-y: auto;"><table style="width: 100%; border-collapse: collapse;">';
        message += '<tr style="background-color: #f2f2f2;"><th style="padding: 8px; border: 1px solid #ddd;">API名称</th><th style="padding: 8px; border: 1px solid #ddd;">URL</th><th style="padding: 8px; border: 1px solid #ddd;">状态</th><th style="padding: 8px; border: 1px solid #ddd;">响应时间</th><th style="padding: 8px; border: 1px solid #ddd;">结果</th></tr>';
        
        results.forEach(result => {
          const resultColor = result.result === 'success' ? 'green' : 'red';
          message += `<tr>
            <td style="padding: 8px; border: 1px solid #ddd;">${result.name}</td>
            <td style="padding: 8px; border: 1px solid #ddd;">${result.url}</td>
            <td style="padding: 8px; border: 1px solid #ddd;">${result.status}</td>
            <td style="padding: 8px; border: 1px solid #ddd;">${result.time}</td>
            <td style="padding: 8px; border: 1px solid #ddd; color: ${resultColor};">${result.result}</td>
          </tr>`;
          
          if (result.error) {
            message += `<tr>
              <td colspan="5" style="padding: 8px; border: 1px solid #ddd; color: red;">${result.error}</td>
            </tr>`;
          }
        });
        
        message += '</table></div>';
        
        this.$alert(message, 'API连通性测试结果', {
          dangerouslyUseHTMLString: true,
          confirmButtonText: '确定'
        });
      });
    },
    // 显示帮助对话框
    showHelp() {
      const helpContent = `
        <div style="line-height: 1.5;">
          <h3 style="margin-top: 0;">扭矩分析使用指南</h3>
          
          <h4>基本操作</h4>
          <p>1. 选择<b>设备</b>和<b>传感器</b>：从下拉菜单中选择要分析的设备和传感器</p>
          <p>2. 设置<b>时间范围</b>：选择要分析的时间段（默认为最近7天）</p>
          <p>3. 点击<b>搜索</b>按钮：获取并显示该时间范围内的数据</p>
          
          <h4>功能按钮说明</h4>
          <ul style="padding-left: 20px;">
            <li><b>重置</b>：清除所有筛选条件，恢复默认设置</li>
            <li><b>诊断</b>：检查系统各部分是否正常工作</li>
            <li><b>模拟数据</b>：加载示例数据（当真实数据不可用时使用）</li>
            <li><b>测试API</b>：测试后端接口连通性</li>
          </ul>
          
          <h4>常见问题</h4>
          <p><b>问题</b>：搜索后没有数据显示<br/>
             <b>解决</b>：尝试使用更宽松的时间范围，或使用"模拟数据"按钮加载演示数据</p>
          
          <p><b>问题</b>：设备或传感器下拉列表为空<br/>
             <b>解决</b>：检查网络连接，或点击"诊断"按钮排查问题</p>
        </div>
      `;
      
      this.$alert(helpContent, '扭矩分析帮助', {
        dangerouslyUseHTMLString: true,
        confirmButtonText: '我知道了'
      });
    },
    // 从原始数据生成统计数据
    generateStatisticsFromRawData() {
      if (!this.rawData || !Array.isArray(this.rawData) || this.rawData.length === 0) {
        console.warn("无法生成统计数据：原始数据为空");
        return;
      }

      console.log("开始从原始数据生成统计数据...");
      
      // 按设备和传感器分组数据
      const deviceSensorGroups = {};
      
      this.rawData.forEach(item => {
        const deviceId = item.deviceId;
        const sensorId = item.sensorId || 0;
        const key = `${deviceId}-${sensorId}`;
        
        if (!deviceSensorGroups[key]) {
          deviceSensorGroups[key] = {
            values: [],
            deviceId: deviceId,
            deviceName: item.deviceName || this.getDeviceName(deviceId) || `设备${deviceId}`,
            sensorId: sensorId,
            sensorName: item.sensorName || `传感器${sensorId}`
          };
        }
        
        if (item.torqueValue !== null && item.torqueValue !== undefined) {
          const torqueValue = parseFloat(item.torqueValue);
          if (!isNaN(torqueValue)) {
            deviceSensorGroups[key].values.push(torqueValue);
          }
        }
      });
      
      // 计算统计值
      this.statisticsData = Object.values(deviceSensorGroups).map(group => {
        if (group.values.length === 0) {
          return {
            deviceId: group.deviceId,
            deviceName: group.deviceName,
            sensorId: group.sensorId,
            sensorName: group.sensorName,
            avgTorque: 0,
            maxTorque: 0,
            minTorque: 0,
            stdDeviation: 0,
            count: 0
          };
        }
        
        const values = group.values;
        const sum = values.reduce((a, b) => a + b, 0);
        const avg = sum / values.length;
        const max = Math.max(...values);
        const min = Math.min(...values);
        
        // 计算标准差
        const variance = values.reduce((a, b) => a + Math.pow(b - avg, 2), 0) / values.length;
        const stdDev = Math.sqrt(variance);
        
        return {
          deviceId: group.deviceId,
          deviceName: group.deviceName,
          sensorId: group.sensorId,
          sensorName: group.sensorName,
          avgTorque: parseFloat(avg.toFixed(2)),
          maxTorque: parseFloat(max.toFixed(2)),
          minTorque: parseFloat(min.toFixed(2)),
          stdDeviation: parseFloat(stdDev.toFixed(2)),
          count: values.length
        };
      });
      
      console.log("成功生成统计数据:", this.statisticsData.length + "条记录");
    },
    // 处理查询结果后检查阈值
    handleQueryResult() {
      // 更新图表
      this.updateCharts();
      
      // 检查阈值
      this.thresholdChecked = false;
      this.checkThresholdViolations();
      
      this.loading = false;
    },
    // 判断扭矩值是否超出阈值
    isOverThreshold(torqueValue) {
      const value = parseFloat(torqueValue);
      return !isNaN(value) && (value > this.thresholdForm.maxThreshold || value < this.thresholdForm.minThreshold);
    },
    
    // 判断扭矩值是否超过最大阈值
    isOverMaxThreshold(torqueValue) {
      const value = parseFloat(torqueValue);
      return !isNaN(value) && value > this.thresholdForm.maxThreshold;
    },
    
    // 判断扭矩值是否低于最小阈值
    isBelowMinThreshold(torqueValue) {
      const value = parseFloat(torqueValue);
      return !isNaN(value) && value < this.thresholdForm.minThreshold;
    },
    
    // 处理异常数据分页大小变化
    handleAnomalySizeChange(size) {
      this.anomalyPageSize = size;
    },
    
    // 处理异常数据当前页变化
    handleAnomalyCurrentChange(currentPage) {
      this.anomalyCurrentPage = currentPage;
    },
    
    // 处理刷新频率设置
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
          // 自动刷新数据
          this.loadData();
          this.$message.info(`分析数据已按照${refreshRate}秒频率自动刷新`);
        }, refreshRate * 1000);
        this.$message.success(`已设置分析数据刷新频率：${refreshRate}秒`);
      } else {
        this.$message.info('已关闭自动刷新');
      }
    },
    
    // 图表resize方法
    resizeCharts() {
      if (this.trendChart) this.trendChart.resize();
      if (this.rpmChart) this.rpmChart.resize();
      if (this.temperatureChart) this.temperatureChart.resize();
    }
  }
};
</script>

<style scoped>
.chart-card {
  margin-bottom: 20px;
}
.unit {
  margin-left: 8px;
  color: #909399;
}
.pagination-container {
  margin-top: 15px;
  text-align: center;
}
.empty-data {
  text-align: center;
  padding: 40px 0;
}
</style>