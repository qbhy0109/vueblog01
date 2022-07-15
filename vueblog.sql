-- MySQL dump 10.13  Distrib 5.7.33, for Linux (x86_64)
--
-- Host: localhost    Database: vueblog
-- ------------------------------------------------------
-- Server version	5.7.33-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `m_blog`
--

DROP TABLE IF EXISTS `m_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_blog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `content` longtext,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_blog`
--

LOCK TABLES `m_blog` WRITE;
/*!40000 ALTER TABLE `m_blog` DISABLE KEYS */;
INSERT INTO `m_blog` VALUES (1,1,'test2','this is a test','\n![深大防疫平台](https://www1.szu.edu.cn/images/index/ncp.png)\n# 居中\n**sci-hub**：https://tool.yovisun.com/scihub/\n\n![](http://yjzq.online/img/blogImg/WebImage_1653840460050.jpg)\n\n\n\n','2020-05-21 14:08:42',0),(2,1,'常用论文数据库','常用论文数据库','论文\n>万方：[https://c.wanfangdata.com.cn/periodical](https://c.wanfangdata.com.cn/periodical)\n\n>知网：[https://www-cnki-net.ezproxy.lib.szu.edu.cn/](https://www-cnki-net.ezproxy.lib.szu.edu.cn/)\n\n>SCIE：[https://www.webofscience.com/wos/alldb/basic-search](https://www.webofscience.com/wos/alldb/basic-search)\n\n>谷歌镜像：[http://scholar.scqylaw.com/](http://scholar.scqylaw.com/)\n\n>scihub：[https://tool.yovisun.com/scihub/](https://tool.yovisun.com/scihub/)\n>>[这个更快](https://sci-hub.yncjkj.com/)\n\n>百度学术：[https://xueshu.baidu.com/](https://xueshu.baidu.com/)\n\n','2022-05-20 04:00:52',0),(3,1,'戈萨的公司',' 的嘎嘎','***++下划线++***','2022-05-20 04:02:16',0),(4,1,'22课表','这是一个课表','\n\n|Time|Mon|Tue|Wed|Thur|Fri|\n|-|-|-|-|-|-|\n|(8:30-9:55)||||基础英语L3-712||\n|(10:15-12:25)|现代通信原理L1-103||机器学习L3-606|||\n|(14:15-15:40)|\n|(16:00-17:25)|||嵌入式系统N411|||\n|(19:00-20:20)||||自然辨证法L3-104|嵌入式系统N411|\n|(20:30-21:10)||论文写作指导L3-604||||\n\n\n\n','2022-05-20 04:02:51',0),(5,1,'这是一个教程','这是一个copy教程：https://blog.csdn.net/weixin_43247803/article/details/113666136','**B站博主链接：**\nhttps://www.bilibili.com/video/BV1PQ4y1P7hZ?p=1\n\n**博主的开发文档:**\nhttps://juejin.cn/post/6844903823966732302\n\n**部署视频**\nhttps://www.bilibili.com/video/BV17A411E7aE?p=1\n\n**up主的部署文档**\nhttps://juejin.im/post/6886061338804617229/\n\n开源项目源码 :\n\nup主的：\nhttps://github.com/MarkerHub/vueblog\n\n**我的：**\nhttps://gitee.com/hntianshu/vueblog\n\n热部署配置:\nhttps://www.cnblogs.com/erlongxizhu-03/p/12193646.html\n\nidea报Could not autowired解决办法:\nhttps://blog.csdn.net/yxm234786/article/details/81460752\n\nElementUI官方文档\nhttps://element.eleme.cn/#/zh-CN/component/quickstart\n\nPostMan安装包下载\nhttps://blog.csdn.net/weixin_43184774/article/details/100578557\n\nVsCode保存自动格式化样式\nhttps://blog.csdn.net/wang0112233/article/details/90608328\n\nRedis的安装和启动\nhttps://www.cnblogs.com/pretty-sunshine/p/10615287.html\n\n**搞定Shiro集成redis实现会话共享**\nhttps://blog.csdn.net/m0_46995061/article/details/106751848\n\nnginx官网\nhttp://nginx.org/en/download.html','2022-05-20 10:36:48',0),(6,1,'test','test','![照片](https://image-1300566513.cos.ap-guangzhou.myqcloud.com/upload/images/5a9f48118166308daba8b6da7e466aab.jpg)\n\n==标记==\n\n```\nHello\n\n```\n\n1. 大哥i撒关闭\n2. 给你撒个娇你\n3. gnsaibg\n\n|column1|column2|column3|\n|-|-|-|\n|content1|content2|content3|\n\n\n|1|![照片](https://image-1300566513.cos.ap-guangzhou.myqcloud.com/upload/images/5a9f48118166308daba8b6da7e466aab.jpg)|column3|\n|-|-|-|\n|content1|content2|content3|\n\n\n\n','2022-05-20 10:41:19',0),(7,1,'前端路由与服务端接口路由冲突问题','前面三个问题解决后，本来以为已经全部正常。但是再测试发现，部分页面刷新仍然会出现问题，但是通过前端的排查未能发现原因。直到检查到nginx的配置时，发现这些出错误的页面的路由，与服务端的接口路由似乎是重合的！这些前端页面的路由被nginx匹配到服务端的路由，转发到服务端去处理，所以发生异常了！\n解决问题的思路为，前端程序中给所有的接口添加统一的路由前缀入口，nginx转发时匹配这个统一的前缀即可。','———————————————————————\n\n版权声明：本文为CSDN博主「sunliyings17」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。\n\n原文链接：https://blog.csdn.net/sunliyings17/article/details/124016692\n\n———————————————————————\n\n###  前端路由与服务端接口路由冲突问题\n前面三个问题解决后，本来以为已经全部正常。但是再测试发现，部分页面刷新仍然会出现问题，但是通过前端的排查未能发现原因。直到检查到nginx的配置时，发现这些出错误的页面的路由，与服务端的接口路由似乎是重合的！这些前端页面的路由被nginx匹配到服务端的路由，转发到服务端去处理，所以发生异常了！\n解决问题的思路为，前端程序中给所有的接口添加统一的路由前缀入口，nginx转发时匹配这个统一的前缀即可。\n\n\n### 设置bashURL\naxios.js：\n```javascript\naxios.defaults.baseURL = \"/api\";\n```\n### nginx配置文件：\n\n```\nlocation ^~ /api/ {\n      proxy_pass http://pig-gateway:9999/;\n      # proxy_set_header Host $http_host;\n      proxy_connect_timeout 60s;\n      proxy_send_timeout 45s;\n      proxy_read_timeout 450s;\n      proxy_set_header X-Real-IP $remote_addr;\n      proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;\n  }\n```\n### 开发环境跨域设置调整\nvue.config.js：(这个没加也能)\n\n```javascript\n  devServer: {\n  ...\n    proxy: {\n 	  ...\n      \'/api\': {\n        target: url,\n        changeOrigin: true,\n        logLevel: \'debug\'\n      },\n    },\n 	...\n }\n```\n','2022-05-20 10:51:13',0),(8,1,'记录一个部署vue遇到的问题','有趣的一件事。。。\n','事情是这样的。。。。。。。。  \n  \n在linux上部署springboot+vue项目，但是对nginx部署不太熟悉，  \n只在nginx.conf上配置了\n```bash\nlocation / {\n	root html;\n	index index.html;\n	try_files $uri $uri/ /index.html;\n}\n```\n并没有把对后端的请求处理转发给springboot。（[参考这里](http://www.yjzq.online/blog/7)）  \n\n结果项目运行后，只有前端页面没有数据  \n\n又在我电脑本地的同样的一个项目springboot+vue调试，结果，调着调着，linux上的页面竟然显示数据了！！！  \n  \n然后我就发现，这是linux端的网页连上了我电脑本地上运行着的springboot。。。   \n\n我想可能是因为浏览器接受到vue中的js文件，路由中的路径标明了localhost:8081，因为js文件连接不是服务器的后端端口就把请求发给了电脑端运行这的后端8081端口，就，连上了？？？\n\n\n','2022-05-26 03:18:30',0),(9,1,'图床图床','作者：高鸿祥\n链接：https://www.jianshu.com/p/ea1eb11db63f\n来源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。','>#### 对象存储图床\n>国外的有amazon s3 和google storage等\n>国内的有七牛云、又拍云、腾讯云、阿里云、天翼云等\n>#### 第三方图床\n>sm.ms、imgchr、聚合图床等\n>#### 云盘图床\n>微云等\n>社交网站图床\n>新浪微博、qq空间等\n>#### 云笔记图床\n>印象笔记、有道云笔记等\n>#### 代码托管网站图床\n>github、码云等\n>#### 自建图床\n>github开源图片服务Cheverto\n>#### 区块链存储图床\n>IPFS等\n\n\n作者：高鸿祥\n链接：https://www.jianshu.com/p/ea1eb11db63f\n来源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。','2022-05-26 07:56:56',0),(10,1,'markdown语法','markdown语法','\n<a href=\"https://www.jianshu.com/u/1f5ac0cf6a8b\" target=\"_blank\">简书</a>\n---\n\nfsdafsags','2022-05-26 07:58:47',0),(11,1,'plan','plan','1. 五月底熟悉shiro的用户注册验证等基础用法 or sa-token?\n2. 六月尝试找一个类似与vue官网的前端页面源代码\n3. 查找springboot的常用注解学习','2022-05-26 14:52:51',0),(12,1,'使用七牛CDN遇到的小问题','（创建二级域名来解析更好，有时间再折腾）  ','### 要点\n>主机记录\n>>**@ --> yjzq.online**  \n>>**www --> www.yjzq.online**\n\n现在把主机记录为@的记录类型改为CNAME，所以当访问yjzq.online/...的时候DNS服务器会将域名解析到CDN， \n \n如果再输入yjzq.online是访问不了本网页。只能通过www.yjqz.online来访问。\n\n![](http://yjzq.online/img/blogImg/1653641212%281%29.png)  \n![](http://yjzq.online/img/blogImg/1653641346%281%29.jpg)  \n![](http://yjzq.online/img/blogImg/1653641303%281%29.jpg)\n\n\n[七牛云教程](https://developer.qiniu.com/fusion/kb/1322/how-to-configure-cname-domain-name)\n\n\n  \n  \n  \n-----','2022-05-27 09:00:08',0),(13,1,'question','fasfs','chrome访问具体某一个blog异常(间歇性，时有时没有)   \nwww.yjqz.online ---> ok      \nwww.yjqz.online/blog/7  ---> false','2022-05-27 09:46:10',0),(14,1,'常见响应码','响应码','**200 OK**：表示成功；   \n**301 Moved Permanently**：表示该URL已经永久重定向；  \n**302 Found**：表示该URL需要临时重定向；  \n**304 Not Modified**：表示该资源没有修改，客户端可以使用本地缓存的版本；  \n**400 Bad Request**：表示客户端发送了一个错误的请求，例如参数无效；  \n**401 Unauthorized**：表示客户端因为身份未验证而不允许访问该URL；  \n**403 Forbidden**：表示服务器因为权限问题拒绝了客户端的请求；  \n**404 Not Found**：表示客户端请求了一个不存在的资源；  \n**500 Internal Server Error**：表示服务器处理时内部出错，例如因为无法连接数据库；  \n**503 Service Unavailable**：表示服务器此刻暂时无法处理请求。  \n|code|description|\n|-|-|\n|**200 OK**|表示成功|\n|**301 Moved Permanently**|表示该URL已经永久重定向|\n|**302 Found**|表示该URL需要临时重定向|\n|**304 Not Modified**|表示该资源没有修改，客户端可以使用本地缓存的版本|\n|**400 Bad Request**|表示客户端发送了一个错误的请求，例如参数无效|\n|**401 Unauthorized**|表示客户端因为身份未验证而不允许访问该URL|\n|**403 Forbidden**|表示服务器因为权限问题拒绝了客户端的请求|\n|**404 Not Found**|表示客户端请求了一个不存在的资源|\n|**500 Internal Server Error**|表示服务器处理时内部出错，例如因为无法连接数据库|\n|**503 Service Unavailable**|表示服务器此刻暂时无法处理请求|\n|||\n|||\n|||\n','2022-05-31 06:28:23',0),(15,1,'Q2','question','utf8和gbk编码格式  \n\nutf8格式乱码问题，无法写入中文  \n\n见shiro/springbootjjwt','2022-05-31 11:26:56',0),(16,1,'mark','待看','[filter 和 interceptor 的区别](https://blog.csdn.net/m0_37583655/article/details/121234046)    \n[Java web三大器：过滤器-监听器-拦截器](https://www.csdn.net/tags/MtTaIgxsNDA5MDM5LWJsb2cO0O0O.html)   \n[Jwt两种生成方式](https://www.jianshu.com/p/aaf23f42abb3)  \n[SpringBoot常用注解@RestControllerAdvice](https://blog.csdn.net/user2025/article/details/105458842)   \n[客户端存储sessionStorage、localStorage详解](https://blog.csdn.net/Jack_lzx/article/details/116940344)   \n','2022-05-31 13:11:54',0),(17,1,'axios获取不到token','vue中用axios获取不到headers中的token','>在电脑本地调试的前后端分离的项目，学习利用jwt认证时，  \n>在浏览器开发者工具发现vue中无法接受到后端传递的token，  \n  \n![without_token](http://static.yjzq.online/img/blogImg/without_token.jpg)  \n\n>但是Apipost工具中是可以收到token的  \n\n![api_token](http://static.yjzq.online/img/blogImg/api_token.jpg)  \n\n>查询资料，[axios返回header无法获取所有数据的问题 & vue数据无法实时更新问题](https://www.it610.com/article/1279360393793257472.htm)   \n>**java代码还需要对Access-Control-Expose-Headers这个头属性进行设置，这样相关接口，前端才能通过axios请求的response.header里可以获取到相关参数**  \n\n![token_code](http://static.yjzq.online/img/blogImg/token_code.jpg)   \n\n>然后就好了  \n  \n![with_token](http://static.yjzq.online/img/blogImg/with_token.jpg)','2022-06-02 14:51:19',0),(18,1,'test','test','test','2022-06-03 05:36:10',0),(19,1,'。。。','。。。','。。。\n\n\n','2022-06-03 07:21:49',0);
/*!40000 ALTER TABLE `m_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_user`
--

DROP TABLE IF EXISTS `m_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `status` int(5) NOT NULL,
  `created` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_USERNAME` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_user`
--

LOCK TABLES `m_user` WRITE;
/*!40000 ALTER TABLE `m_user` DISABLE KEYS */;
INSERT INTO `m_user` VALUES (1,'byy','http://yjzq.online/img/blogImg/WebImage_1653840460050.jpg',NULL,'96e79218965eb72c92a549dd5a330112',0,'2020-04-20 10:44:01',NULL),(2,'qbhy','http://yjzq.online/img/blogImg/WebImage_1653840460050.jpg',NULL,'96e79218965eb72c92a549dd5a330112',0,'2025-05-30 10:44:01',NULL);
/*!40000 ALTER TABLE `m_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-03 20:57:49
