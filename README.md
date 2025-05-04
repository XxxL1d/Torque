# 扭矩管理系统

基于 [RuoYi-Vue](https://gitee.com/y_project/RuoYi-Vue) 前后端分离框架的扭矩监控管理系统。

## 项目介绍

扭矩管理系统是一个基于 Spring Boot、Spring Security、Redis、Vue 的前后端分离的扭矩监控管理平台。系统采用前后端分离的架构，前端使用 Vue.js、Element UI，后端使用 Spring Boot、MyBatis 等主流技术。

## 系统功能

* 用户管理：用户是系统操作者，该功能主要完成系统用户配置。
* 部门管理：配置系统组织机构（公司、部门、小组），树结构展现支持数据权限。
* 岗位管理：配置系统用户所属担任职务。
* 菜单管理：配置系统菜单，操作权限，按钮权限标识等。
* 角色管理：角色菜单权限分配、设置角色按机构进行数据范围权限划分。
* 字典管理：对系统中经常使用的一些较为固定的数据进行维护。
* 参数管理：对系统动态配置常用参数。
* 通知公告：系统通知公告信息发布维护。
* 操作日志：系统正常操作日志记录和查询；系统异常信息日志记录和查询。
* 登录日志：系统登录日志记录查询包含登录异常。
* 在线用户：当前系统中活跃用户状态监控。
* 定时任务：在线（添加、修改、删除）任务调度包含执行结果日志。
* 代码生成：前后端代码的生成（java、html、xml、sql）支持CRUD下载。
* 系统接口：根据业务代码自动生成相关的api接口文档。
* 服务监控：监视当前系统CPU、内存、磁盘、堆栈等相关信息。
* 在线构建器：拖动表单元素生成相应的HTML代码。
* 连接池监视：监视当前系统数据库连接池状态，可进行分析SQL找出系统性能瓶颈。
* 扭矩监控：实时监控设备扭矩数据，提供数据展示和分析功能。

## 技术选型

### 前端技术

* Vue：前端框架
* Element-UI：前端UI框架
* Vue Router：路由框架
* Vuex：全局状态管理
* Axios：HTTP客户端
* Echarts：图表框架

### 后端技术

* Spring Boot：应用基础框架
* Spring Framework：核心框架
* Spring Security：安全框架
* MyBatis：ORM框架
* Redis：缓存数据库
* JWT：JWT登录支持
* Shardingsphere：分库分表中间件
* Quartz：作业调度框架
* WebSocket：用于实时扭矩数据传输
* Druid：数据库连接池

## 开发环境

* JDK 1.8+
* Maven 3.0+
* Redis 5.0+
* MySQL 5.7+
* Node.js 12+
* npm 6.0+

## 快速开始

### 后端启动

```bash
# 克隆项目
git clone https://your-repository-url.git

# 导入数据库
导入项目sql目录下的sql脚本

# 修改配置
修改ruoyi-admin/src/main/resources/application.yml中的数据库连接信息

# 启动项目
- 直接运行ruoyi-admin模块下的RuoYiApplication.java主类
- 或使用maven命令：mvn spring-boot:run
```

### 前端启动

```bash
# 进入前端项目目录
cd ruoyi-ui

# 安装依赖
npm install

# 启动服务
npm run dev
```

启动成功后，访问 http://localhost:80

## 项目结构

```
├── ruoyi-admin        // 管理模块（启动入口）
├── ruoyi-common       // 公共模块
├── ruoyi-framework    // 核心框架
├── ruoyi-generator    // 代码生成
├── ruoyi-quartz       // 定时任务
├── ruoyi-system       // 系统管理
├── ruoyi-torque       // 扭矩监控
├── ruoyi-ui           // 前端UI
```


## 特别鸣谢

* [RuoYi-Vue](https://gitee.com/y_project/RuoYi-Vue) 项目提供了优秀的框架支持

## 版权信息

本项目使用MIT开源协议，您可以在协议允许的范围内进行免费使用。 