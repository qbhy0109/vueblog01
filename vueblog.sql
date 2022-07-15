# Host: 127.0.0.1  (Version: 5.5.15)
# Date: 2022-05-21 21:41:56
# Generator: MySQL-Front 5.3  (Build 4.269)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "m_blog"
#

DROP TABLE IF EXISTS `m_blog`;
CREATE TABLE `m_blog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `content` longtext,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

#
# Data for table "m_blog"
#

INSERT INTO `m_blog` VALUES (1,1,'test2','this is a test','::: hljs-center\n\n![深大防疫平台](https://www1.szu.edu.cn/images/index/ncp.png)\n# 居中\n**sci-hub**：https://tool.yovisun.com/scihub/\n\n:::\n\n\n','2020-05-21 22:08:42',0),(2,1,'gwagrew','tawtwet','尔特哇嘎为如果','2022-05-20 12:00:52',0),(3,1,'戈萨的公司',' 的嘎嘎','的噶啥味','2022-05-20 12:02:16',0),(4,1,'gewgbwigbweyg','gewagwergheh','::: hljs-right\n\n靠twsrkms\n\n:::\n','2022-05-20 12:02:51',0),(5,1,'这是一个教程','这是一个copy教程：https://blog.csdn.net/weixin_43247803/article/details/113666136','**B站博主链接：**\nhttps://www.bilibili.com/video/BV1PQ4y1P7hZ?p=1\n\n**博主的开发文档:**\nhttps://juejin.cn/post/6844903823966732302\n\n**部署视频**\nhttps://www.bilibili.com/video/BV17A411E7aE?p=1\n\n**up主的部署文档**\nhttps://juejin.im/post/6886061338804617229/\n\n开源项目源码 :\n\nup主的：\nhttps://github.com/MarkerHub/vueblog\n\n**我的：**\nhttps://gitee.com/hntianshu/vueblog\n\n热部署配置:\nhttps://www.cnblogs.com/erlongxizhu-03/p/12193646.html\n\nidea报Could not autowired解决办法:\nhttps://blog.csdn.net/yxm234786/article/details/81460752\n\nElementUI官方文档\nhttps://element.eleme.cn/#/zh-CN/component/quickstart\n\nPostMan安装包下载\nhttps://blog.csdn.net/weixin_43184774/article/details/100578557\n\nVsCode保存自动格式化样式\nhttps://blog.csdn.net/wang0112233/article/details/90608328\n\nRedis的安装和启动\nhttps://www.cnblogs.com/pretty-sunshine/p/10615287.html\n\n**搞定Shiro集成redis实现会话共享**\nhttps://blog.csdn.net/m0_46995061/article/details/106751848\n\nnginx官网\nhttp://nginx.org/en/download.html','2022-05-20 18:36:48',0),(6,1,'test','test','![照片](https://image-1300566513.cos.ap-guangzhou.myqcloud.com/upload/images/5a9f48118166308daba8b6da7e466aab.jpg)\n\n==标记==\n\n```\nHello\n\n```\n\n1. 大哥i撒关闭\n2. 给你撒个娇你\n3. gnsaibg\n\n|column1|column2|column3|\n|-|-|-|\n|content1|content2|content3|\n\n\n\n','2022-05-20 18:41:19',0),(7,1,'test3','tests哇阿文','::: hljs-center\n\n啊好热好热阿合啊\n\n:::\n','2022-05-20 18:51:13',0);

#
# Structure for table "m_user"
#

DROP TABLE IF EXISTS `m_user`;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "m_user"
#

INSERT INTO `m_user` VALUES (1,'markerhub','https://image-1300566513.cos.ap-guangzhou.myqcloud.com/upload/images/5a9f48118166308daba8b6da7e466aab.jpg',NULL,'96e79218965eb72c92a549dd5a330112',0,'2020-04-20 10:44:01',NULL);
