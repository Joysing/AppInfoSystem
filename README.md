# AppInfoSystem
松田校内学术项目  
APP管理系统WEB端  
由开发者后台+管理员后台两大模块组成  
基于SSM + MySQL

源码演示地址：[http://joysing.cc:8081/appsys](http://joysing.cc:8081/appsys)

 **运行环境** ：Apache+PHP+Mysql

 **代码说明** 

resources/database.properties 需要配置数据库连接信息（主机、用户名、密码），系统常量，debug模式等  
appinfodb.sql 位于data目录中，是数据库备份文件，需要提前导入到mysql中

 **技术架构** ：后台Spring+SpringMVC+MyBatis+Mysql 前台jQuery、html、CSS、Bootstrap

 **网站结构** ：后台登录页index 开发者后台首页dev/main 管理员后台首页user/main

 **网站目录** 

developer 开发者后台  
backend 管理员后台  
assets 全站的前端样式文件  
statics/json 前台ajax请求接口  
statics/updateFiles 上传的APP的安装包和APP的图片  
resources/database.properties 配置数据库连接信息  
