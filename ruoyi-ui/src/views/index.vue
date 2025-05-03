<template>
  <div class="app-container home">
    <el-row :gutter="20">
      <el-col :span="24">
        <el-card class="welcome-card">
          <div class="welcome-header">
            <h1>欢迎使用扭矩管理系统</h1>
            <p class="version">当前版本: v{{ version }}</p>
          </div>
          <div class="welcome-content">
            <p>扭矩管理系统是一套专业的扭矩管理平台，用于管理扭矩相关数据和流程。</p>
            <p>采用前后端分离的模式，提供完整的扭矩管理解决方案。</p>
          </div>
        </el-card>
      </el-col>
    </el-row>

    <el-row :gutter="20" class="feature-section">
      <el-col :span="24">
        <h2 class="section-title">主要功能</h2>
      </el-col>
      <el-col :xs="24" :sm="12" :md="8" :lg="6" v-for="(feature, index) in features" :key="index">
        <el-card class="feature-card" :body-style="{ padding: '20px' }">
          <div class="feature-icon">
            <i :class="feature.icon"></i>
          </div>
          <h3>{{ feature.title }}</h3>
          <p>{{ feature.description }}</p>
        </el-card>
      </el-col>
    </el-row>

    <el-row :gutter="20" class="tech-section">
      <el-col :span="24">
        <h2 class="section-title">技术选型</h2>
      </el-col>
      <el-col :xs="24" :sm="24" :md="12" :lg="12">
        <el-card class="tech-card">
          <div slot="header">
            <span>后端技术</span>
          </div>
          <div class="tech-list">
            <el-tag v-for="(tech, index) in backendTech" :key="index" type="success" class="tech-tag">
              {{ tech }}
            </el-tag>
          </div>
        </el-card>
      </el-col>
      <el-col :xs="24" :sm="24" :md="12" :lg="12">
        <el-card class="tech-card">
          <div slot="header">
            <span>前端技术</span>
          </div>
          <div class="tech-list">
            <el-tag v-for="(tech, index) in frontendTech" :key="index" type="warning" class="tech-tag">
              {{ tech }}
            </el-tag>
          </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  name: "Index",
  data() {
    return {
      version: "3.8.3",
      features: [
        {
          icon: "el-icon-user",
          title: "用户管理",
          description: "用户是系统操作者，该功能主要完成系统用户配置。"
        },
        {
          icon: "el-icon-setting",
          title: "部门管理",
          description: "配置系统组织机构（公司、部门、小组），树结构展现支持数据权限。"
        },
        {
          icon: "el-icon-s-operation",
          title: "岗位管理",
          description: "配置系统用户所属担任职务。"
        },
        {
          icon: "el-icon-s-custom",
          title: "角色管理",
          description: "角色菜单权限分配、设置角色按机构进行数据范围权限划分。"
        },
        {
          icon: "el-icon-menu",
          title: "菜单管理",
          description: "配置系统菜单，操作权限，按钮权限标识等。"
        },
        {
          icon: "el-icon-document",
          title: "代码生成",
          description: "前后端代码的生成（java、html、xml、sql）支持CRUD下载 。"
        }
      ],
      backendTech: [
        "Spring Boot",
        "Spring Security",
        "MyBatis",
        "Druid",
        "JWT",
        "Redis",
        "Maven",
        "MySQL"
      ],
      frontendTech: [
        "Vue",
        "Vuex",
        "Vue Router",
        "Element UI",
        "Axios",
        "Sass",
        "ECharts"
      ]
    };
  }
};
</script>

<style lang="scss" scoped>
.home {
  padding: 20px;
  .welcome-card {
    margin-bottom: 20px;
    .welcome-header {
      text-align: center;
      margin-bottom: 20px;
      h1 {
        font-size: 28px;
        color: #303133;
        margin-bottom: 10px;
      }
      .version {
        color: #909399;
        font-size: 14px;
      }
    }
    .welcome-content {
      text-align: center;
      color: #606266;
      line-height: 1.8;
    }
  }

  .section-title {
    font-size: 24px;
    color: #303133;
    margin: 20px 0;
    padding-left: 10px;
    border-left: 4px solid #409EFF;
  }

  .feature-section {
    margin-bottom: 20px;
    .el-col {
      margin-bottom: 30px;
    }
    .feature-card {
      height: 200px;
      text-align: center;
      transition: all 0.3s;
      display: flex;
      flex-direction: column;
      justify-content: center;
      &:hover {
        transform: translateY(-5px);
        box-shadow: 0 2px 12px 0 rgba(0,0,0,.1);
      }
      .feature-icon {
        font-size: 40px;
        color: #409EFF;
        margin-bottom: 15px;
      }
      h3 {
        font-size: 18px;
        margin-bottom: 10px;
        height: 24px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
      }
      p {
        color: #606266;
        font-size: 14px;
        line-height: 1.6;
        height: 44px;
        overflow: hidden;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
      }
    }
  }

  .tech-section {
    margin-bottom: 20px;
    .tech-card {
      height: 100%;
      .tech-list {
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
        .tech-tag {
          margin: 5px;
        }
      }
    }
  }
}

// 响应式布局
@media screen and (max-width: 768px) {
  .home {
    padding: 10px;
    .welcome-card {
      .welcome-header {
        h1 {
          font-size: 24px;
        }
      }
    }
    .section-title {
      font-size: 20px;
    }
    .feature-card {
      height: 180px !important;
      .feature-icon {
        font-size: 32px !important;
      }
      h3 {
        font-size: 16px !important;
      }
      p {
        font-size: 12px !important;
      }
    }
  }
}
</style>

