/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50639
Source Host           : localhost:3306
Source Database       : 1712d_cms

Target Server Type    : MYSQL
Target Server Version : 50639
File Encoding         : 65001

Date: 2020-04-13 22:45:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cms_article`
-- ----------------------------
DROP TABLE IF EXISTS `cms_article`;
CREATE TABLE `cms_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `content` longtext COMMENT '文章内容',
  `picture` varchar(200) DEFAULT NULL COMMENT '标题图片',
  `channel_id` int(11) DEFAULT NULL COMMENT '所属栏目',
  `category_id` int(11) DEFAULT NULL COMMENT '所属分类',
  `user_id` int(11) DEFAULT NULL COMMENT '文章发布人',
  `hits` int(11) DEFAULT '0',
  `hot` int(11) DEFAULT '0',
  `status` int(11) DEFAULT NULL COMMENT '0,刚发布,1审核通过,-1 审核未通过',
  `deleted` int(11) DEFAULT NULL COMMENT '0:正常,1:删除',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `summary` text,
  `content_type` int(11) DEFAULT '0' COMMENT '文章类型: 1:html 2:image',
  `keywords` varchar(100) DEFAULT NULL,
  `original` varchar(100) DEFAULT NULL,
  `comment_num` int(11) DEFAULT '0' COMMENT '评论数量',
  PRIMARY KEY (`id`),
  KEY `FK_CMS_ARTI_REFERENCE_CMS_USER` (`user_id`),
  KEY `FK_CMS_ARTI_REFERENCE_CMS_CHAN` (`channel_id`),
  KEY `FK_CMS_ARTI_REFERENCE_CMS_CATE` (`category_id`),
  CONSTRAINT `cms_article_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `cms_category` (`id`),
  CONSTRAINT `cms_article_ibfk_2` FOREIGN KEY (`channel_id`) REFERENCES `cms_channel` (`id`),
  CONSTRAINT `cms_article_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `cms_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_article
-- ----------------------------
INSERT INTO `cms_article` VALUES ('16', '硅谷著名预言家表示，2045年人类将实现永生，50年内能实现复活', '<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	人类一直以来都想实现长生，目前，硅谷有数十个公司在做事人类未来永生技术的研究，而谷歌首席科学家雷·库兹韦尔预言说：到了2029年，人类将开始正式走上永生之旅；到2045年，人类将正式实现永生！\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	雷·库兹韦尔是美国硅谷知名的未来学研究者，发明家，作家，谷歌的首席工程师。\n</p>\n<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p1.pstatp.com/large/pgc-image/02444a34691944cd8041c2f3ea52b109\" alt=\"硅谷著名预言家表示，2045年人类将实现永生，50年内能实现复活\" />\n</div>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	他曾发明了盲人阅读机、音乐合成器和语音识别系统。1988年，麻省理工学院提名他为“当年杰出发明家“。他曾获9项名誉博士学位，2次总统荣誉奖。同时也是一名成功的企业家，他用他的发明创办了自己的企业，开发出多项造福人类的高科技产品。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	雷·库兹韦尔被比尔盖茨称为“我所知道的人工智能预测领域最牛的人”，据说他的预测准确率高达86%。\n</p>\n<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p3.pstatp.com/large/pgc-image/5866a0d13a3f48e1ad26220df982091b\" alt=\"硅谷著名预言家表示，2045年人类将实现永生，50年内能实现复活\" />\n</div>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	他成功预测了苏联的解体、电脑战胜冠军棋手、数字助理（如Siri）的出现，虚拟和增强现实系统等，其中最为知名的是他曾预测到了上世纪90年代，全球互联网使用率会暴增，到了21世纪初，无线网络会被大范围使用。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	还有就是他曾预言90年末电脑的发展将战胜棋王，1997年，“深蓝”战胜了棋王加里·卡斯帕罗夫。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	库兹韦尔之所以作出这样的预言，是基于这样的判断：\n</p>\n<ul class=\" list-paddingleft-2\" style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	<li>\n		人体即将可以植入纳米机器人，纳米机器人开始接管人类的免疫系统，把病原体，肿瘤等一系列的病变错误进行修复。\n	</li>\n	<li>\n		人体开始启动程序化，植入纳米程序芯片后开始由机器人编程，实现一系列的组织器官的修复，比如癌症还有心血管疾病的修复。\n	</li>\n	<li>\n		当肉体再也支撑不了现实的“摧残”，渐渐老化不能用的时候，只需要将记忆芯片取出来，借助人工智能技术，合成一个新的“大脑”。\n	</li>\n</ul>', '5be50724-5d1f-4670-9622-4cb889ffd832.jpg', '1', '1', '1', '0', '0', '0', '0', '2020-03-05 11:42:47', null, null, '0', null, null, '0');
INSERT INTO `cms_article` VALUES ('17', '硅谷著名预言家表示，2045年人类将实现永生，50年内能实现复活', '<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	人类一直以来都想实现长生，目前，硅谷有数十个公司在做事人类未来永生技术的研究，而谷歌首席科学家雷·库兹韦尔预言说：到了2029年，人类将开始正式走上永生之旅；到2045年，人类将正式实现永生！\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	雷·库兹韦尔是美国硅谷知名的未来学研究者，发明家，作家，谷歌的首席工程师。\n</p>\n<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p1.pstatp.com/large/pgc-image/02444a34691944cd8041c2f3ea52b109\" alt=\"硅谷著名预言家表示，2045年人类将实现永生，50年内能实现复活\" />\n</div>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	他曾发明了盲人阅读机、音乐合成器和语音识别系统。1988年，麻省理工学院提名他为“当年杰出发明家“。他曾获9项名誉博士学位，2次总统荣誉奖。同时也是一名成功的企业家，他用他的发明创办了自己的企业，开发出多项造福人类的高科技产品。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	雷·库兹韦尔被比尔盖茨称为“我所知道的人工智能预测领域最牛的人”，据说他的预测准确率高达86%。\n</p>\n<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p3.pstatp.com/large/pgc-image/5866a0d13a3f48e1ad26220df982091b\" alt=\"硅谷著名预言家表示，2045年人类将实现永生，50年内能实现复活\" />\n</div>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	他成功预测了苏联的解体、电脑战胜冠军棋手、数字助理（如Siri）的出现，虚拟和增强现实系统等，其中最为知名的是他曾预测到了上世纪90年代，全球互联网使用率会暴增，到了21世纪初，无线网络会被大范围使用。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	还有就是他曾预言90年末电脑的发展将战胜棋王，1997年，“深蓝”战胜了棋王加里·卡斯帕罗夫。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	库兹韦尔之所以作出这样的预言，是基于这样的判断：\n</p>\n<ul class=\" list-paddingleft-2\" style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	<li>\n		人体即将可以植入纳米机器人，纳米机器人开始接管人类的免疫系统，把病原体，肿瘤等一系列的病变错误进行修复。\n	</li>\n	<li>\n		人体开始启动程序化，植入纳米程序芯片后开始由机器人编程，实现一系列的组织器官的修复，比如癌症还有心血管疾病的修复。\n	</li>\n	<li>\n		当肉体再也支撑不了现实的“摧残”，渐渐老化不能用的时候，只需要将记忆芯片取出来，借助人工智能技术，合成一个新的“大脑”。\n	</li>\n</ul>', 'edf39005-61c4-44a8-8174-ea74ef0ce49b.jpg', '1', '2', '1', '0', '0', '0', '0', '2020-03-05 11:43:38', null, null, '0', '我是关键词', '新华网', '0');
INSERT INTO `cms_article` VALUES ('18', '硅谷著名预言家表示，2045年人类将实现永生，50年内能实现复活', '<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	人类一直以来都想实现长生，目前，硅谷有数十个公司在做事人类未来永生技术的研究，而谷歌首席科学家雷·库兹韦尔预言说：到了2029年，人类将开始正式走上永生之旅；到2045年，人类将正式实现永生！\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	雷·库兹韦尔是美国硅谷知名的未来学研究者，发明家，作家，谷歌的首席工程师。\n</p>\n<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p1.pstatp.com/large/pgc-image/02444a34691944cd8041c2f3ea52b109\" alt=\"硅谷著名预言家表示，2045年人类将实现永生，50年内能实现复活\" />\n</div>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	他曾发明了盲人阅读机、音乐合成器和语音识别系统。1988年，麻省理工学院提名他为“当年杰出发明家“。他曾获9项名誉博士学位，2次总统荣誉奖。同时也是一名成功的企业家，他用他的发明创办了自己的企业，开发出多项造福人类的高科技产品。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	雷·库兹韦尔被比尔盖茨称为“我所知道的人工智能预测领域最牛的人”，据说他的预测准确率高达86%。\n</p>\n<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p3.pstatp.com/large/pgc-image/5866a0d13a3f48e1ad26220df982091b\" alt=\"硅谷著名预言家表示，2045年人类将实现永生，50年内能实现复活\" />\n</div>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	他成功预测了苏联的解体、电脑战胜冠军棋手、数字助理（如Siri）的出现，虚拟和增强现实系统等，其中最为知名的是他曾预测到了上世纪90年代，全球互联网使用率会暴增，到了21世纪初，无线网络会被大范围使用。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	还有就是他曾预言90年末电脑的发展将战胜棋王，1997年，“深蓝”战胜了棋王加里·卡斯帕罗夫。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	库兹韦尔之所以作出这样的预言，是基于这样的判断：\n</p>\n<ul class=\" list-paddingleft-2\" style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	<li>\n		人体即将可以植入纳米机器人，纳米机器人开始接管人类的免疫系统，把病原体，肿瘤等一系列的病变错误进行修复。\n	</li>\n	<li>\n		人体开始启动程序化，植入纳米程序芯片后开始由机器人编程，实现一系列的组织器官的修复，比如癌症还有心血管疾病的修复。\n	</li>\n	<li>\n		当肉体再也支撑不了现实的“摧残”，渐渐老化不能用的时候，只需要将记忆芯片取出来，借助人工智能技术，合成一个新的“大脑”。\n	</li>\n</ul>', '643a762e-f4c7-491f-ba7a-463097747757.jpg', '1', '2', '1', '0', '1', '0', '0', '2020-03-05 11:43:40', null, null, '0', null, null, '0');
INSERT INTO `cms_article` VALUES ('19', '硅谷著名预言家表示，2045年人类将实现永生，50年内能实现复活', '<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	人类一直以来都想实现长生，目前，硅谷有数十个公司在做事人类未来永生技术的研究，而谷歌首席科学家雷·库兹韦尔预言说：到了2029年，人类将开始正式走上永生之旅；到2045年，人类将正式实现永生！\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	雷·库兹韦尔是美国硅谷知名的未来学研究者，发明家，作家，谷歌的首席工程师。\n</p>\n<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p1.pstatp.com/large/pgc-image/02444a34691944cd8041c2f3ea52b109\" alt=\"硅谷著名预言家表示，2045年人类将实现永生，50年内能实现复活\" />\n</div>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	他曾发明了盲人阅读机、音乐合成器和语音识别系统。1988年，麻省理工学院提名他为“当年杰出发明家“。他曾获9项名誉博士学位，2次总统荣誉奖。同时也是一名成功的企业家，他用他的发明创办了自己的企业，开发出多项造福人类的高科技产品。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	雷·库兹韦尔被比尔盖茨称为“我所知道的人工智能预测领域最牛的人”，据说他的预测准确率高达86%。\n</p>\n<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p3.pstatp.com/large/pgc-image/5866a0d13a3f48e1ad26220df982091b\" alt=\"硅谷著名预言家表示，2045年人类将实现永生，50年内能实现复活\" />\n</div>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	他成功预测了苏联的解体、电脑战胜冠军棋手、数字助理（如Siri）的出现，虚拟和增强现实系统等，其中最为知名的是他曾预测到了上世纪90年代，全球互联网使用率会暴增，到了21世纪初，无线网络会被大范围使用。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	还有就是他曾预言90年末电脑的发展将战胜棋王，1997年，“深蓝”战胜了棋王加里·卡斯帕罗夫。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	库兹韦尔之所以作出这样的预言，是基于这样的判断：\n</p>\n<ul class=\" list-paddingleft-2\" style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	<li>\n		人体即将可以植入纳米机器人，纳米机器人开始接管人类的免疫系统，把病原体，肿瘤等一系列的病变错误进行修复。\n	</li>\n	<li>\n		人体开始启动程序化，植入纳米程序芯片后开始由机器人编程，实现一系列的组织器官的修复，比如癌症还有心血管疾病的修复。\n	</li>\n	<li>\n		当肉体再也支撑不了现实的“摧残”，渐渐老化不能用的时候，只需要将记忆芯片取出来，借助人工智能技术，合成一个新的“大脑”。\n	</li>\n</ul>', '9461fed4-5960-4174-bec7-edf2a37b1df7.jpg', '1', '2', '1', '0', '0', '1', '0', '2020-03-05 11:43:41', null, null, '0', null, null, '0');
INSERT INTO `cms_article` VALUES ('20', '硅谷著名预言家表示，2045年人类将实现永生，50年内能实现复活', '<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	人类一直以来都想实现长生，目前，硅谷有数十个公司在做事人类未来永生技术的研究，而谷歌首席科学家雷·库兹韦尔预言说：到了2029年，人类将开始正式走上永生之旅；到2045年，人类将正式实现永生！\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	雷·库兹韦尔是美国硅谷知名的未来学研究者，发明家，作家，谷歌的首席工程师。\n</p>\n<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p1.pstatp.com/large/pgc-image/02444a34691944cd8041c2f3ea52b109\" alt=\"硅谷著名预言家表示，2045年人类将实现永生，50年内能实现复活\" />\n</div>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	他曾发明了盲人阅读机、音乐合成器和语音识别系统。1988年，麻省理工学院提名他为“当年杰出发明家“。他曾获9项名誉博士学位，2次总统荣誉奖。同时也是一名成功的企业家，他用他的发明创办了自己的企业，开发出多项造福人类的高科技产品。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	雷·库兹韦尔被比尔盖茨称为“我所知道的人工智能预测领域最牛的人”，据说他的预测准确率高达86%。\n</p>\n<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p3.pstatp.com/large/pgc-image/5866a0d13a3f48e1ad26220df982091b\" alt=\"硅谷著名预言家表示，2045年人类将实现永生，50年内能实现复活\" />\n</div>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	他成功预测了苏联的解体、电脑战胜冠军棋手、数字助理（如Siri）的出现，虚拟和增强现实系统等，其中最为知名的是他曾预测到了上世纪90年代，全球互联网使用率会暴增，到了21世纪初，无线网络会被大范围使用。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	还有就是他曾预言90年末电脑的发展将战胜棋王，1997年，“深蓝”战胜了棋王加里·卡斯帕罗夫。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	库兹韦尔之所以作出这样的预言，是基于这样的判断：\n</p>\n<ul class=\" list-paddingleft-2\" style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	<li>\n		人体即将可以植入纳米机器人，纳米机器人开始接管人类的免疫系统，把病原体，肿瘤等一系列的病变错误进行修复。\n	</li>\n	<li>\n		人体开始启动程序化，植入纳米程序芯片后开始由机器人编程，实现一系列的组织器官的修复，比如癌症还有心血管疾病的修复。\n	</li>\n	<li>\n		当肉体再也支撑不了现实的“摧残”，渐渐老化不能用的时候，只需要将记忆芯片取出来，借助人工智能技术，合成一个新的“大脑”。\n	</li>\n</ul>', 'e5ffc83c-0520-417d-90f1-2d8c8b9409e2.jpg', '1', '2', '1', '1', '0', '0', '0', '2020-03-05 11:43:43', null, null, '0', null, null, '0');
INSERT INTO `cms_article` VALUES ('21', '  华为鸿蒙确认更名！网民：新名称更令人惊艳', '<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	最近有报道称，华为的鸿蒙系统将余八月份与大家见面。余承东以前说过，但现在看来是真的。据悉，华为全球开发者大会也将在同一天举行。那时，可以看到全球软件开发人员聚集在一起解决鸿蒙面临的生态问题，并努力开发软件生态系统。\n</p>\n<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p1.pstatp.com/large/pgc-image/5c47c1557aeb419d8614e6231bb92eb9\" alt=\"华为鸿蒙确认更名！网民：新名称更令人惊艳\" />\n</div>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	可以看出华为这次将再次放大招了，自鸿蒙宣布以来，每个人的期望都不小。虽然这个名字乍一看听起来很奇怪，但实际上是取自\"混沌初开\"。目前，鸿盟还在欧洲注册了商标，名为\"方舟\"，意为诺亚方舟。\n</p>\n<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p1.pstatp.com/large/pgc-image/afd3717aef3a42b4b24b9e91536acc41\" alt=\"华为鸿蒙确认更名！网民：新名称更令人惊艳\" />\n</div>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	但是，鸿蒙的新名字又来了，被称为\"Harmony\"！它的意思是\"和谐\"。尽管它不如\"方舟\"强大，但它更加宏伟。此外，新名称的发音与鸿蒙类似，鸿蒙即将显示其真正的实力。\n</p>\n<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p3.pstatp.com/large/pgc-image/669fe0445bce4676b8dd3d8f5d022340\" alt=\"华为鸿蒙确认更名！网民：新名称更令人惊艳\" />\n</div>', 'cfeb4e75-fcbb-4801-a997-e312fbdda0fd.jpg', '1', '2', '1', '0', '1', '1', '0', '2020-03-05 11:49:26', null, null, '0', '华为中国', '今天头条', '3');
INSERT INTO `cms_article` VALUES ('22', 'test ', 'aaaa', 'deacb52a-9598-46a7-9343-fa2c2692192e.jpg', '2', '5', '1', '1', '0', '-1', '0', '2020-03-05 19:39:30', null, null, '0', null, null, '0');
INSERT INTO `cms_article` VALUES ('23', '苹果发力中端市场，从6188跌到2999，128GB+iOS13', '<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	在众多智能手机厂商中，苹果是最会赚钱的一个，凭借iPhone手机，苹果获得了丰厚的利润。比如苹果史上卖的最火的iPhone6系列，据说它的出货量已经高达2.5亿。iPhone6系列因为亲民售价，其占据的市场正是那些中端市场，也就是3000元左右的市场。现在，虽然iPhone6系列已经停产，但苹果依然在这个市场发力，用的是iPhone6系列的继任者——iPhone7。\n</p>\n<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p1.pstatp.com/large/pgc-image/324ba775441349fd9516d75de85fa5a6\" alt=\"苹果发力中端市场，从6188跌到2999，128GB+iOS13\" />\n</div>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	最新消息显示，iPhone7现在依然有售，同时售价很低，仅2999元。简单说说iPhone7的情况，就是苹果发力中端市场，从6188跌到2999，拥有128GB+iOS13系统。\n</p>\n<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p3.pstatp.com/large/pgc-image/76ad2cc5cf914a71a06caa8a34f46348\" alt=\"苹果发力中端市场，从6188跌到2999，128GB+iOS13\" />\n</div>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	作为继任者，iPhone7延续iPhone6系列的优点，4.7英寸小屏，圆形HOME键，IP67级别防水防尘，还有强劲性能。在这里要仔细说说这个防水防尘功能，目前3000元左右的机型，基本不支持这些，唯独iPhone7，支持防水和防尘，这在平时的使用中，会让用户非常放心，能够随意使用。\n</p>\n<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p9.pstatp.com/large/pgc-image/203468f3fc5c476881ef89e141a94e41\" alt=\"苹果发力中端市场，从6188跌到2999，128GB+iOS13\" />\n</div>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	相比iPhone6，iPhone7还有一个亮点，就是机身背部的天线放置方式更好看，配合一体化机身设计风格，看起来非常不错。\n</p>\n<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p1.pstatp.com/large/pgc-image/4875717557a442eca7eab630464d7794\" alt=\"苹果发力中端市场，从6188跌到2999，128GB+iOS13\" />\n</div>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	iPhone7的HOME键，也是全新风格，添加振动反馈，是全新力度感应键，可以感知压力，能够提供触感反馈，响应度更高，同时不易被按坏。核心硬件上，iPhone7带来苹果A10处理器，可以升级到最新iOS13系统，再加上128GB机身存储，用起来也是非常流畅。\n</p>\n<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p1.pstatp.com/large/pgc-image/133dd548104948f5b5904d070a1837a2\" alt=\"苹果发力中端市场，从6188跌到2999，128GB+iOS13\" />\n</div>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	如果说iPhone7的缺点，那就是拍照了，到了现在，安卓阵营手机的拍照都在全面提升，对比来看，iPhone7的拍照功能就显得有些少了。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	屏幕前的朋友，你们觉得iPhone7如何，可以在评论区聊聊，说说你们的看法\n</p>', '055ab5e4-b901-4201-be77-f1f590f07268.jpg', '1', '2', '3', '0', '1', '0', '0', '2020-03-13 10:27:25', null, null, '0', null, null, '0');
INSERT INTO `cms_article` VALUES ('24', '《花木兰》全面撤档，万达负债融资20亿，全球影业的“黑暗时刻”', '<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	疫情爆发两个月，国内电影产业在回温的天气与降低的确诊数量下得到喘息，复工准备提上日程，而海外市场上疫情才开始真正显现破坏力。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	今天（3月13日），迪士尼正式对外宣布，受疫情影响，原本预计3月27日上映的真人版《花木兰》全球撤档，皮克斯新动画电影《1/2的魔法》延期，同时此前宣布4月上映的电影《新变种人》《鹿角》（福斯发行）宣布延期，《尚气与十诫传奇》停止拍摄，计划5月上映的电影《黑寡妇》也传出延期消息，而拍摄中的漫威剧集《猎鹰与冬兵》已经停止拍摄。——原本携着重磅IP气势汹汹前行的帝国迪士尼，踩了一个急刹车。\n</p>\n<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p3.pstatp.com/large/pgc-image/08e31c50c5274fd2a4a097a1922e875f\" alt=\"《花木兰》全面撤档，万达负债融资20亿，全球影业的“黑暗时刻”\" />\n</div>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	<br />\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	同样被动刹车的还有其他好莱坞制片厂，派拉蒙宣布电影《寂静之地2》全球撤档、爱情喜剧片《爱情鸟》撤档，环球影业原计划将于5月22日上映的《速度与激情9》延期一年，索尼影业此前3月开始公映的《比得兔2》推迟到8月，更早之前，米高梅宣布《007:无暇赴死》推迟上映。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	至此，好莱坞市场3月到4月的大体量电影基本撤档。同时，原定于3月30日-4月2日举行的好莱坞业界推介大会Cinemacon宣布取消，历年好莱坞制片厂齐都要在此进行新片推介，盛会取消，海外电影市场受到的冲击进一步外延。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	而国内电影产业的情况也没有更好一些。虽然国内内容市场已经渐渐缓过了电影大规模撤档、影院关闭的打击，但是院线的处境并没有更好。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	3月10日万达电影对外发布公告，拟发行不超过20亿的债务类融资工具，这无疑显示出院线受疫情影响出现了资金危机，而2019年万达业绩快报透露公司净利润亏损47亿，也预示着2020年万达处境的越发艰难。\n</p>', 'a2658f1a-ed2c-4fdb-b00d-8f0f7433e075.png', '6', '21', '1', '0', '0', '1', '0', '2020-03-14 08:37:48', null, null, '0', null, null, '1');
INSERT INTO `cms_article` VALUES ('25', '垃圾分类', '{\"A\":\"干垃圾\",\"B\":\"湿垃圾\"}', null, null, null, '1', '0', '0', '1', '0', '2020-03-15 10:58:50', null, null, '1', null, null, '0');
INSERT INTO `cms_article` VALUES ('26', '疫情什么时候结束', '{\"A\":\"明天\",\"B\":\"后天\",\"C\":\"1个月后\"}', null, null, null, '1', '0', '0', '1', '0', '2020-03-15 14:22:20', null, null, '1', null, null, '0');
INSERT INTO `cms_article` VALUES ('27', '你想升班吗？', '{\"A\":\"想升班\",\"B\":\"不想升班\",\"C\":\"十分想升班\",\"D\":\"我想末班\"}', null, null, null, '3', '0', '0', '1', '0', '2020-03-15 15:06:41', null, null, '1', null, null, '0');
INSERT INTO `cms_article` VALUES ('28', 'test316', 'test316test316test316test316test316test316test316test316test316', '1c9d94fb-bfae-42e8-96a1-cf5f9ce28d99.png', '4', '14', '5', '0', '0', '-1', '0', '2020-03-16 08:42:10', null, null, null, null, null, '0');
INSERT INTO `cms_article` VALUES ('29', 'test315', 'test315test315test315test315test315test315', 'd801ebdd-0e4b-4693-99e0-0912d5aee078.png', '5', '17', '5', '0', '1', '1', '0', '2020-03-16 08:47:18', null, null, '0', null, null, '0');
INSERT INTO `cms_article` VALUES ('30', 'iPhone9 Plus基本确认，5.5寸+A13芯片+经典Home键，老用户首选？', '<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	用了一段时间iPhoneX，然后换了iPhone11，我明白了一个道理。手机只是一个工具，简单、耐用、靠谱才是王道。不管是Oled材质，还是LCD材质，用起来其实没有太大区别。自从iPhoneX开始，苹果手机的定价就开始飘了。以前能买旗舰的价格，现在只能买得起「青春版」。然而，电影的画幅依然是16：9，手机依然只是拿来聊天打游戏。「全面屏」什么都没有改变，只是进一步压榨了我们的钱包。\n</p>\n<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p9.pstatp.com/large/pgc-image/da9691cd423846e0abf8fca05523edbf\" alt=\"iPhone9 Plus基本确认，5.5寸+A13芯片+经典Home键，老用户首选？\" />\n</div>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	对手机屏占比不感冒的，我相信肯定不止我一个。到现在依然有许多人认为，iPhone8的设计比iPhoneXR、iPhone11耐看多了。众所周知，苹果将在今年发布新机iPhone9，它将采用iPhone8的外观，以及最新的A13芯片，定价3000元档。iPhone9是专门给老用户换机升级的性价比之选，毕竟不是每个人都愿意花大代价去购买全面屏iPhone。\n</p>\n<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p1.pstatp.com/large/pgc-image/5106cb164967438595f154bc667e0e77\" alt=\"iPhone9 Plus基本确认，5.5寸+A13芯片+经典Home键，老用户首选？\" />\n</div>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	其实不止iPhone9，根据外媒报道，在iOS14的测试代码中，发现了「iPhone9 Plus」的存在。iPhone8分为4.7寸版和5.5寸版，相应的，iPhone9存在5.5寸这个大屏版本也并不奇怪。大尺寸机身拥有更强的散热，更持久的续航，更宽阔的视野范围。在当年，iPhone8 Plus可是游戏主播人手一台的存在。尤其是打游戏的时候，大边框反而避免了误触。搭载A13芯片的iPhone9 Plus，也许会再一次被封为游戏神机。\n</p>\n<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p1.pstatp.com/large/pgc-image/de74f671d556430184d0a5dfa65f1581\" alt=\"iPhone9 Plus基本确认，5.5寸+A13芯片+经典Home键，老用户首选？\" />\n</div>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	iPhone9 Plus基本确认，5.5寸+A13芯片+经典Home键，老用户升级首选。目前，消息没有指出iPhone9 Plus的定价。考虑到iPhoneXR已经跌到4000元价位了，很可能iPhone9 Plus的价格会在4000元以内。此外，iPhone9 依然保留了经典Home键，相对手势操作更为高效。并且还沿用了类似iPhone11的扫描NFC标签功能，整体功能性上没有任何落后。\n</p>\n<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p3.pstatp.com/large/pgc-image/7987435387af48b9b0867ef9bb443cca\" alt=\"iPhone9 Plus基本确认，5.5寸+A13芯片+经典Home键，老用户首选？\" />\n</div>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	这段时间以来，大家基本上出门都会戴上口罩，作为果粉，最大的困扰应该就是频繁的人脸识别。我深刻地认识到，人脸解锁并不能完美适用所有场景，因为人脸作为一种生物特征太容易被外界干扰了。屏下指纹+3D人脸才是最佳方案，哪怕是单纯的屏下指纹，也比人脸识别的适应能力强。迟早苹果必须得适应这个世界的变化，而不是一意孤行，妄图教育整个市场。\n</p>', '435fa595-3165-48af-9057-053798b07baf.png', '1', '2', '1', '0', '1', '1', '0', '2020-03-19 09:06:33', null, null, '0', null, null, '1');
INSERT INTO `cms_article` VALUES ('31', 'test ', 'fsdfsadfsdfsadfsadfsad', '098b4b9a-3653-40c3-a0c5-1b21421f067b.jpg', '2', '4', '1', '0', '0', '1', '0', '2020-03-19 09:13:22', null, null, '0', null, null, '0');
INSERT INTO `cms_article` VALUES ('32', '2020年五大颠覆性科技趋势', '<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	编者按：人们为什么喜欢预测未来？因为每个人都想把握先机，早做准备，尤其是日新月异的科技领域。下面的预测观点并非来自大公司的市场宣传，而出自硅谷本地第三方服务商公司的视角。本文译自Medium，作者 Thomas Smith，原标题为“Five Disruptive Tech Trends We’re Tracking in 2020”。\n</p>\n<img src=\"http://p1.pstatp.com/large/pgc-image/Rqj5KYR4JAp1Nd\" alt=\"2020年五大颠覆性科技趋势\" />\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	All images credit Gado Images\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	硅谷一直是引领全球科技界蓬勃发展的中心。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	我们的公司是做基于人工智能的摄影业务，就位于硅谷的边缘。我们的业务可以涵盖和观察到硅谷科技、创新和生活领域的方方面面。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	这让我们对未来的发展具备了独特的视角。以下是我们正在追踪的2020年五大科技趋势，它们有可能带来重大的改变和颠覆——既有显而易见的，也有悄无声息的。\n</p>\n<h2 style=\"font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	零工经济和共享经济蓬勃发展\n</h2>\n<img src=\"http://p3.pstatp.com/large/pgc-image/Rqj5Kbx7eBQWGd\" alt=\"2020年五大颠覆性科技趋势\" />\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	零工经济（比如像Uber、Lyft和Doordash这样的公司）和分享经济（比如AirBNB，以及现在那些到处停放的、把城里的人行道堵得水泄不通的微型共享滑板车）曾经有过一段非常随心所欲、野蛮生长的时期。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	2018年，我曾为Doordash拍摄一套系列图片，需要测试体验他们的物流服务。我只花了一个小时接受培训，然后做了一个非常初级的背景调查，还在一个办公园区的快闪空间里看了几个安全视频，就成为了一名Doordash送货员。在我决定注册的几小时内，我就已经从餐馆拿到了顾客的订餐出发去送货了，而Doordash随即就把钱存入了我的银行账户。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	人们对这些服务的接受也是蛮快的，一瞬间，无证出租车，可廉价使用的电动共享滑板车，没有信用担保的AirBNB等等就普及开来了。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	但是时不再来。由于零工经济和共享经济的扩张范围和影响力不断扩大，它们已经引起了监管机构和立法者的注意。比如加州出台的AB5法案，试图将零工经济的从业者重新归类为正式雇员（这将会让该产业受到很大的影响），城市管理者也在不断地扣押影响市容的共享滑板车，而发生在加州奥琳达的一家AirBNB民宿里的枪击事件等悲剧，也使得人们对短期租赁的宽松许可产生了怀疑。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	简而言之，零工和共享经济正在经历重大的成长之烦恼。我们预计这种情况将在2020年持续存在。以AB5法案为中心，关于这个行业存在的合理性问题的争论仍将继续。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	但与此同时，零工经济和共享经济公司继续在扩张。秘密泄露了——没人会把那些该死的滑板车拿回去。在廉价风投（以及现在的公共资金）的支持下，零工经济和共享经济公司将继续主导行业，继续主宰世界——一次堵住一条人行道。\n</p>\n<h2 style=\"font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	植物肉成为主流\n</h2>\n<img src=\"http://p3.pstatp.com/large/pgc-image/Rqj5Kck92bJDmz\" alt=\"2020年五大颠覆性科技趋势\" />\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	植物肉刚出现时是很新奇的，现在，它即将成为主流。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	这个行业的两家最主要的企业是Beyond Meat和Impossible，人们期待它们能够成为该行业的“百事可乐”和“可口可乐”公司，在争夺市场份额的持续竞争中互相促进，并最终推动整个行业的发展。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	2019年 Impossible 曾尝试与汉堡王合作，将植物肉产品推向大众，取得了极大的成功。与 Beyond Meat 同样，Impossible 也通过寻找这些合作伙伴进行扩张，寻求进入商店销售的渠道。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	反对这些公司的声音固然有之，但是可以忽略。一些顽固派对Impossible与BK这样的巨头合作颇感不爽，Impossible并不在乎——他们的目标人群是广大主流消费者，而不是少数顽固分子，能触达主流消费者才是最关键的，将对行业整体环境产生积极的影响。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	我们认为，目前植物肉这个行业就像十年前有机食品刚兴起时一样。最初，有机食品只是一个小众市场，当像Stonyfield这样的公司开始通过沃尔玛销售有机食品的时候，市场逐渐壮大，这同样使得顽固派很生气。但是今天，你在全国每一家餐馆和折扣超市都能够买到有机食品。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	我们预计，植物肉也会遵循类似的发展轨迹——从一个小众市场逐渐发展壮大（尽管顽固分子抵触），发展成又一个新的产品门类。\n</p>\n<h2 style=\"font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	人工智能占据主导地位——但没有人注意到\n</h2>\n<img src=\"http://p1.pstatp.com/large/pgc-image/Rqj5Kgb8qQXVvD\" alt=\"2020年五大颠覆性科技趋势\" />\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	自从2013年至2014年的“深度学习革命”以来，人工智能就一直在重塑行业，但过程是悄无声息的。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	人工智能技术已经悄然兴起，但并不是幻想中那种机器人入侵某一个行业，导致每个人失业的可怕场景：比如有用的语音助手，非常精准的垃圾邮件拦截器，能够看懂照片的计算机，OCR驱动技术，比如通过手机自动银行存款，更好的针对性广告……类似的还可以列出更多。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	当然，人工智能也有一些很炫目的应用（比如自动驾驶汽车，有人知道吗？）但总体上，人工智能已经是一种非常普遍的无形的存在了——嗯，无处不在。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	我们预计这种情况在2020年也会持续，AI即服务(来自微软、IBM Watson等)类似技术的发展，更多的用于模型训练的数据，以及像英特尔设备上的人工智能芯片这样的硬件，将确保人工智能继续扩大其主导地位。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	但同样，这将是潜移默化的，许多行业甚至不会意识到它们正在被颠覆。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	不过，我们也将越来越多地看到人工智能的影响，已经有更多的风投在为人工智能公司提供资金，以便不断改进数据分析、机器视觉和预测分析功能，以及帮助改善让政府觉得棘手的宏观经济指标——比如在没有就业或工资增长的情况下提高生产率。\n</p>\n<h2 style=\"font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	科技主导政治\n</h2>\n<img src=\"http://p9.pstatp.com/large/pgc-image/Rqj5KiD4cZsulu\" alt=\"2020年五大颠覆性科技趋势\" />\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	从历史上看，高尚的、自由主义倾向的科技界与混乱的、没有尊严的政治界一向是泾渭分明的，但如今情况正在迅速改变。\n</p>', '0efe973f-6ea3-4088-9cdc-6815ebffb891.jpg', '1', '2', '6', '0', '1', '1', '0', '2020-03-31 08:40:52', null, null, '0', null, null, '0');
INSERT INTO `cms_article` VALUES ('34', '意大利确诊11万，最大华人社区零感染，如何做到的？', '<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	意大利民事保护部门4月1日发布的数据显示，截至当天18时，意大利新冠肺炎确诊病例增至110574例，死亡13155例。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	根据美国约翰斯·霍普金斯大学实时统计数据，目前意大利是全球死亡病例最多的国家。意大利总理孔特4月1日发表视频讲话，宣布全国范围内“封城”措施将延迟至4月13日。他呼吁意大利民众继续遵守相关隔离规定，否则整个国家将再次付出巨大代价。\n</p>\n<img src=\"http://p1.pstatp.com/large/pgc-image/Rv0gpv27X7er50\" alt=\"意大利确诊11万，最大华人社区零感染，如何做到的？\" />\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	孔特发表讲话。／意大利媒体NEWS1视频截图\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	在疫情如此严峻之时，意大利中北部的城市普拉托（Prato）拥有意大利最大的华人社区，约2.5万统计在册的华人“零感染”，是怎么做到的？\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	<span style=\"font-weight:700;\">总领馆：普拉托约2.5万在册华人无确诊、无疑似</span>\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	据意大利《新欧洲侨报》报道，意大利普拉托发布的《2019年人口报告》指出：近年来普拉托市镇人口持续增长，这一增长主要是因为当地的移民，尤其是华人。截至2019年12月31日，普拉托市内共有195089人，华人共有24906人。\n</p>\n<img src=\"http://p1.pstatp.com/large/pgc-image/Rv0gpvc89sUVTJ\" alt=\"意大利确诊11万，最大华人社区零感染，如何做到的？\" />\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	普拉托市镇风光。／推特\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	新京报记者4月2日从中国驻佛罗伦萨总领馆了解到，截至目前，托斯卡纳大区普拉托市官方统计在册的华人约有2.5万人，尚未发现新冠肺炎确诊患者，也没有疑似病例。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	中国驻佛罗伦萨总领馆工作人员介绍，总领馆所负责的领区范围内，有3名华人感染新冠肺炎。普拉托是意大利华人密度最高的市镇，无人感染，他们大多数来自于浙江温州，主要集中在当地的两个大型工业园区，从事“快时尚”服装产业工作，另外还有少量华人开餐馆或食品超市。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	“为防范疫情，早在1月底至2月初的时候，普拉托市华人开设的工厂、餐馆就陆续关闭，在意大利政府宣布‘禁足令’之前10天左右，除了食品超市之外的华人企业基本都停工、停产。普拉托市是华人比较集中的地方，一旦出现病例，传染起来后果不堪设想，大家都很紧张、谨慎。”总领馆工作人员称，1月25日，驻佛罗伦萨总领事王文刚就和领馆工作人员一起走访普拉托等地的华人社区，提醒防范新冠疫情。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	关于在意中国留学生情况，驻佛罗伦萨总领馆表示，领区内的中国留学生大约有几千人，未成年的小留学生极少，大多数都是硕士、博士在读，他们当中约有一半人已经回国，总领馆一直在密切关注未回国留学生的情况。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	<span style=\"font-weight:700;\">“华人从中国返意自觉隔离”</span>\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	普拉托是意大利华人密度最高的地区，服装业是旅意华人经济体量的重要支撑之一。意大利华人服装行业协会会长李小锋向新京报记者表示，普拉托是全欧洲最大的服装生产基地之一，许多华人在当地从事服装业工作。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	“2月意大利疫情蔓延，从那时候开始，华人企业的服装订单基本改成在网络上对接，尽量避免与外籍人士接触。工厂门口贴着告示，要求人与人保持1米距离，必须戴上口罩。” 李小锋说，华人企业里大概有20%的意大利工人，他们一开始没想到新冠肺炎会发展到这个地步，认为和感冒差不多，但后期意识到疫情的严重，都非常注意卫生措施。\n</p>\n<img src=\"http://p3.pstatp.com/large/pgc-image/Rv0gpwA5ORy9cA\" alt=\"意大利确诊11万，最大华人社区零感染，如何做到的？\" />\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	李小锋在普拉托一家商店门口。／受访者供图\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	谈及华人社区零感染的原因，李小锋认为，一个很重要的因素是，华人从中国返回普拉托之后都自觉居家隔离两个星期。“今年春节，许多华人回国过年了。于是很早发布通知，呼吁大家返回意大利后先自我隔离一段时间。华人们都非常自觉地响应这一呼吁，回到普拉托居家隔离。”即使度过隔离期，当地华人也避免聚集性活动。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	路透社报道，普拉托的华人对当地政府颁布的政策非常配合，当意大利人还聚集在酒吧和咖啡馆时，公共场所几乎看不到华人的身影。许多华人家庭主动联系当地政府，自我隔离并接受远程健康监测。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	<span style=\"font-weight:700;\">普拉托市长盛赞华人社区</span>\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	意大利民事保护部门公布的数据显示，截至4月1日晚，普拉托市新冠肺炎确诊病例为290例，占全省近26万人口的万分之十一。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	意大利普拉托市市长马泰奥·毕弗尼4月1日在社交媒体脸书（Facebook)上表示，一开始很多人都觉得普拉托会和其他地方一样疫情暴发。但事实上当地感染人数目前为止还比较少。这主要是因为普拉托华人在疫情初期就自觉居家、减少外出，并且采取了严格的防疫措施。华人社区的表现给其他市民传递了一个信号，即疫情不容轻视。\n</p>\n<img src=\"http://p1.pstatp.com/large/pgc-image/Rv0gpwv79XRm3h\" alt=\"意大利确诊11万，最大华人社区零感染，如何做到的？\" />\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	普拉托市市长马泰奥·毕弗尼视频直播讲话。／脸书\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	托斯卡纳大区卫生官员贝尔蒂（Renzo Berti）对路透社表示：“意大利人担心普拉托的华人会带来疫情问题。相反地，他们表现得比我们好得多。”\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	中国驻佛罗伦萨总领馆方面称，目前意大利的医疗防护物资仍然紧缺，地方政府向中国领事馆提出能否捐赠一些物资。总领馆正在号召中国国内的友好城市进行对接，为意大利捐赠一些医疗物资。与此同时，在意的华人华侨也为筹措物资做了不少工作。\n</p>', '1e8c009d-0295-45f6-8adc-1769f31f0ded.jpg', '3', '11', '6', '0', '1', '1', '0', '2020-04-03 08:40:25', null, null, '0', null, null, '0');
INSERT INTO `cms_article` VALUES ('35', '我的文章', '<p>\n	我的文章\n</p>\n<p>\n	<img src=\"/pic/image/20200403/20200403092914_422.jpg\" alt=\"\" />\n</p>', '4c558f39-0cda-4184-8d1a-65c87a3b8be6.jpg', '7', '25', '6', '0', '1', '1', '0', '2020-04-03 09:29:30', null, null, '0', null, null, '0');
INSERT INTO `cms_article` VALUES ('36', 'test', '的点点滴滴', '9d846c79-ae92-4344-95a0-08ee8a6a7a7f.jpg', '1', '2', '20', '0', '0', '0', '0', '2020-04-10 10:45:12', null, null, '0', null, null, '0');
INSERT INTO `cms_article` VALUES ('37', 'test2', 'aaaaaaaa', null, '1', '2', '20', '0', '0', '0', '0', '2020-04-10 10:54:29', null, null, '0', null, null, '0');
INSERT INTO `cms_article` VALUES ('38', 'test', 'cccccc', '98c915f8-b0aa-4529-9583-c7a05692dce9.jpg', '1', '1', '20', '0', '0', '1', '0', '2020-04-10 10:58:36', null, null, '0', null, null, '0');
INSERT INTO `cms_article` VALUES ('39', '系统测试', '系统测试系统测试系统测试系统测试系统测试系统测试系统测试', '497b6365-d658-483b-b9d7-4f1ce712f7f1.jpg', '2', '4', '20', '0', '0', '1', '0', '2020-04-10 11:20:40', null, null, '0', null, null, '0');
INSERT INTO `cms_article` VALUES ('40', '中兴通讯：董事会已收到鲍毓明辞去独立非执行董事职务的申请', '<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	据中兴通讯官方微博消息，中兴通讯在获悉相关媒体报道后，高度重视，公司董事会已收到鲍毓明辞去独立非执行董事职务的申请。特此声明。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	<br />\n</p>\n<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p1.pstatp.com/large/pgc-image/455fb83e4cc145c6a47b529b19f8cecd\" alt=\"中兴通讯：董事会已收到鲍毓明辞去独立非执行董事职务的申请\" />\n</div>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	<span style=\"font-weight:700;\">红星新闻早前报道：</span>\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	<span style=\"font-weight:700;\">涉嫌性侵“养女”鲍某明：杰瑞股份高管，法律门外汉两个月拿律师资格</span>\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	按照计划，杰瑞股份（002353.SZ）将在4月10日公布2019年年报。不料，在公布年报的前一天，遭遇黑天鹅。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	有媒体报道称，一烟台上市公司高管鲍某某被指以“养父”身份长期性侵女孩，警方已立案侦办。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	舆论发酵后，先后有多家上市公司被质疑是鲍某某所任职的公司。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	杰瑞股份证券部工作人员曾对媒体回应称，涉案嫌疑人员并非上市公司董监高人员。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	然而，红星资本局根据上市公司公开信息等渠道交叉印证发现，事件当事人鲍某明的确为杰瑞相关公司的副总裁兼首席法务官，同时他还是中兴通讯（000063.SZ ）的独立董事。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	从鲍某明的履历来看，大学专业与法律无关的他，却同时拥有中美两国的律师资格。而且，他的工作也与法律息息相关。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	知法懂法的鲍某明，现在被曝出以“养父”身份涉嫌长期性侵女孩。今天，鲍某明任职的杰瑞股份的收盘价微涨，为25.02元/股，总市值为239.9亿元。鲍某明兼任独立董事的中兴通讯的收盘价为41.12元/股，总市值为1896亿元。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	<span style=\"font-weight:700;\">女孩自述：</span>\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	<span style=\"font-weight:700;\">14岁起多次被性侵</span>\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	<span style=\"font-weight:700;\">被强迫观看恋童癖视频</span>\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	据澎湃新闻报道，女孩小芳（化名）自称从2016年起被“养父”鲍某某长期控制在山东烟台某公寓里，遭多次性侵，直到2019年4月，在一次遭性侵并被殴打后，她选择报警。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	小芳的生母表示，孩子从小磕磕碰碰一直不顺，“听人说要认个养父养母能冲冲这个灾气，也是因为迷信。”\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	据小芳生母表示，2015年9月，通过中间人，她和鲍某某约定见面，谈妥将女儿小芳“送养”给鲍某某，鲍某某以“养父”的身份带走了小芳。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	小芳称，3个月之后，鲍某某在其老家天津对她实施了性侵，当时她刚满14周岁。2016年开始，鲍某某将她控制在烟台市某公寓内。在烟台的公寓里，鲍某某逼迫她观看恋童癖视频。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	据小芳称，这种情况一直持续到2019年4月，在她生理期发高烧时，鲍某某对她性侵并暴力殴打她，这促使她选择了报警。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	烟台市公安局芝罘区分局2019年4月26日作出的一份撤销案件通知书称，小芳被强奸一案，因没有犯罪事实，决定撤销此案。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	小芳称，2019年10月，她再次报警，获警方立案侦办。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	4月7日，烟台市公安局芝罘分局办案民警向媒体证实，该案件目前正在办理，“请相信警方会依法公正处理”。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	4月9日下午，有烟台市芝罘区相关部门负责人对媒体表示，涉事女生此前曾报警，但经公安机关调查，女生所述与事实存在一定出入，目前正在做进一步了解。\n</p>\n<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p3.pstatp.com/large/pgc-image/1ce5dd23c0184b14a137ec3bb6a4594e\" alt=\"中兴通讯：董事会已收到鲍毓明辞去独立非执行董事职务的申请\" />\n</div>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	图据新京报\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	<span style=\"font-weight:700;\">涉案高管任职单位确认</span>\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	<span style=\"font-weight:700;\">杰瑞副总裁兼首席法务官</span>\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	<span style=\"font-weight:700;\">还任中兴通讯独立董事，年薪25万</span>\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	该事件舆论发酵后，先后有多家上市公司被质疑是鲍某某所任职的公司，如万华化学（600309.SH）以及杰瑞股份。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	万华化学对媒体回应称，涉性侵案件的高管并非来自万华化学。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	而杰瑞股份证券部工作人员也对媒体回应称，涉案嫌疑人员并非上市公司董监高人员，面对突发情况，公司正在了解情况，如果属实会严肃处理。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	然而，在杰瑞股份否认的新闻出炉后不久，4月9日下午，烟台市芝罘区相关部门负责人向媒体证实，事件当事人之一为杰瑞集团高管鲍某明，正在配合警方调查。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	杰瑞股份是否撒了谎？\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	红星资本局翻阅杰瑞股份的多季度、多年度\n</p>', '17b9c04d-68b4-404e-b097-4fa4847fe89b.jpg', '1', '1', '21', '0', '1', '1', '0', '2020-04-10 11:39:26', null, null, '0', null, null, '2');
INSERT INTO `cms_article` VALUES ('41', '测试图片集', '[{\"url\":\"196c011f-0b2f-4580-af2a-691dc075f13c.jpg\",\"descr\":\"1111111\"},{\"url\":\"9b9cd916-ab29-42b6-8658-aa9f44fa41ee.jpg\",\"descr\":\"222222\"}]', '9b9cd916-ab29-42b6-8658-aa9f44fa41ee.jpg', null, null, '21', '0', '0', '1', '0', '2020-04-13 09:07:02', '2020-04-13 09:07:02', null, '1', null, null, '0');
INSERT INTO `cms_article` VALUES ('42', '系统测试2', '[{\"url\":\"1d31eebd-7a76-41de-9387-c8d899508cab.jpg\",\"descr\":\"11111\"},{\"url\":\"998fa30c-c38f-426f-87ff-56f80d74ec81.jpg\",\"descr\":\"2222\"},{\"url\":\"c24aacbc-0e6d-4f68-97b0-8afa0e5694a6.jpg\",\"descr\":\"3333\"}]', 'c24aacbc-0e6d-4f68-97b0-8afa0e5694a6.jpg', null, null, '21', '0', '0', '1', '0', '2020-04-13 09:39:56', '2020-04-13 09:39:56', null, '1', null, null, '0');

-- ----------------------------
-- Table structure for `cms_category`
-- ----------------------------
DROP TABLE IF EXISTS `cms_category`;
CREATE TABLE `cms_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_CMS_CATE_REFERENCE_CMS_CHAN` (`channel_id`),
  CONSTRAINT `cms_category_ibfk_1` FOREIGN KEY (`channel_id`) REFERENCES `cms_channel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_category
-- ----------------------------
INSERT INTO `cms_category` VALUES ('1', '互联网', '1');
INSERT INTO `cms_category` VALUES ('2', '软件', '1');
INSERT INTO `cms_category` VALUES ('3', '智能家居', '1');
INSERT INTO `cms_category` VALUES ('4', '虚拟货币', '2');
INSERT INTO `cms_category` VALUES ('5', '股票', '2');
INSERT INTO `cms_category` VALUES ('6', '外汇', '2');
INSERT INTO `cms_category` VALUES ('7', '黄金', '2');
INSERT INTO `cms_category` VALUES ('8', '宏观经济', '2');
INSERT INTO `cms_category` VALUES ('9', '美国', '3');
INSERT INTO `cms_category` VALUES ('10', '亚洲', '3');
INSERT INTO `cms_category` VALUES ('11', '欧洲', '3');
INSERT INTO `cms_category` VALUES ('12', '非洲', '3');
INSERT INTO `cms_category` VALUES ('13', '新车', '4');
INSERT INTO `cms_category` VALUES ('14', 'SUV', '4');
INSERT INTO `cms_category` VALUES ('15', '汽车导购', '4');
INSERT INTO `cms_category` VALUES ('16', '用车', '4');
INSERT INTO `cms_category` VALUES ('17', 'NBA', '5');
INSERT INTO `cms_category` VALUES ('18', 'CBA', '5');
INSERT INTO `cms_category` VALUES ('19', '中超', '5');
INSERT INTO `cms_category` VALUES ('20', '意甲', '5');
INSERT INTO `cms_category` VALUES ('21', '电影', '6');
INSERT INTO `cms_category` VALUES ('22', '电视剧', '6');
INSERT INTO `cms_category` VALUES ('23', '综艺', '6');
INSERT INTO `cms_category` VALUES ('24', '明星八卦', '6');
INSERT INTO `cms_category` VALUES ('25', '段子', '7');
INSERT INTO `cms_category` VALUES ('26', '爆笑节目', '7');
INSERT INTO `cms_category` VALUES ('27', '童趣萌宠', '7');
INSERT INTO `cms_category` VALUES ('28', '雷人囧事', '7');
INSERT INTO `cms_category` VALUES ('29', '老图片', '9');
INSERT INTO `cms_category` VALUES ('30', '图片故事', '9');
INSERT INTO `cms_category` VALUES ('31', '摄影集', '9');
INSERT INTO `cms_category` VALUES ('32', '王者荣耀', '8');

-- ----------------------------
-- Table structure for `cms_channel`
-- ----------------------------
DROP TABLE IF EXISTS `cms_channel`;
CREATE TABLE `cms_channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `sorted` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_channel
-- ----------------------------
INSERT INTO `cms_channel` VALUES ('1', '科技', null, null, null);
INSERT INTO `cms_channel` VALUES ('2', '财经', null, null, null);
INSERT INTO `cms_channel` VALUES ('3', '国际', null, null, null);
INSERT INTO `cms_channel` VALUES ('4', '汽车', null, null, null);
INSERT INTO `cms_channel` VALUES ('5', '体育', null, null, null);
INSERT INTO `cms_channel` VALUES ('6', '娱乐', null, null, null);
INSERT INTO `cms_channel` VALUES ('7', '搞笑', null, null, null);
INSERT INTO `cms_channel` VALUES ('8', '游戏', '游戏游戏游戏游戏', null, null);
INSERT INTO `cms_channel` VALUES ('9', '图片', null, null, null);

-- ----------------------------
-- Table structure for `cms_collect`
-- ----------------------------
DROP TABLE IF EXISTS `cms_collect`;
CREATE TABLE `cms_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(300) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_collect
-- ----------------------------
INSERT INTO `cms_collect` VALUES ('6', '2020年五大颠覆性科技趋势', 'http://127.0.0.1/detail?id=32', '21', '2020-04-11 10:44:53');
INSERT INTO `cms_collect` VALUES ('7', 'iPhone9 Plus基本确认，5.5寸+A13芯片+经典Home键，老用户首选？', 'http://127.0.0.1/detail?id=30', '21', '2020-04-11 10:44:59');
INSERT INTO `cms_collect` VALUES ('8', '中兴通讯：董事会已收到鲍毓明辞去独立非执行董事职务的申请', 'http://127.0.0.1/detail?id=40', '21', '2020-04-11 10:47:32');

-- ----------------------------
-- Table structure for `cms_comment`
-- ----------------------------
DROP TABLE IF EXISTS `cms_comment`;
CREATE TABLE `cms_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `content` longtext,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `article_id` (`article_id`),
  CONSTRAINT `cms_comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `cms_user` (`id`),
  CONSTRAINT `cms_comment_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `cms_article` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_comment
-- ----------------------------
INSERT INTO `cms_comment` VALUES ('1', '21', '40', '今天星期六', '2020-04-11 11:47:33');
INSERT INTO `cms_comment` VALUES ('2', '20', '40', '明天星期天', '2020-04-11 11:51:37');
INSERT INTO `cms_comment` VALUES ('3', '20', '40', '有一条评论\n', '2020-04-11 11:54:04');
INSERT INTO `cms_comment` VALUES ('5', '21', '40', '再次评论', '2020-04-11 12:02:21');
INSERT INTO `cms_comment` VALUES ('6', '21', '40', '违法维尔', '2020-04-11 12:02:38');

-- ----------------------------
-- Table structure for `cms_settings`
-- ----------------------------
DROP TABLE IF EXISTS `cms_settings`;
CREATE TABLE `cms_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_domain` varchar(50) DEFAULT NULL,
  `site_name` varchar(50) DEFAULT NULL,
  `article_list_size` int(11) DEFAULT NULL,
  `slide_size` int(11) DEFAULT NULL,
  `admin_username` varchar(16) DEFAULT NULL,
  `admin_password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_settings
-- ----------------------------

-- ----------------------------
-- Table structure for `cms_slide`
-- ----------------------------
DROP TABLE IF EXISTS `cms_slide`;
CREATE TABLE `cms_slide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `picture` varchar(50) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_slide
-- ----------------------------
INSERT INTO `cms_slide` VALUES ('1', '广告一', 'jd1.png', '');
INSERT INTO `cms_slide` VALUES ('2', '广告一', 'jd2.png', '');
INSERT INTO `cms_slide` VALUES ('3', '广告三', 'jd3.png', '');
INSERT INTO `cms_slide` VALUES ('4', '广告四', 'jd4.png', '');
INSERT INTO `cms_slide` VALUES ('5', '开发步骤', '开发步骤.png', '');

-- ----------------------------
-- Table structure for `cms_user`
-- ----------------------------
DROP TABLE IF EXISTS `cms_user`;
CREATE TABLE `cms_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `nickname` varchar(20) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `locked` int(11) DEFAULT '0' COMMENT '0:正常,1:禁用',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `role` varchar(1) DEFAULT '0' COMMENT '0:普通用户,1:管理员',
  `url` varchar(200) DEFAULT NULL COMMENT '个人博客网址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_user
-- ----------------------------
INSERT INTO `cms_user` VALUES ('1', 'lucy', '16140a5af212b82efb8a2ca2918a0762', 'lucy', null, '0', '1', '2020-03-11 11:51:36', '2020-03-05 11:51:51', '0', null);
INSERT INTO `cms_user` VALUES ('2', 'admin', '16140a5af212b82efb8a2ca2918a0762', 'admin', null, '1', '0', null, null, '1', null);
INSERT INTO `cms_user` VALUES ('3', 'jack', '16140a5af212b82efb8a2ca2918a0762', 'jack', '2020-04-06', '1', '1', '2020-03-13 10:12:55', null, '0', null);
INSERT INTO `cms_user` VALUES ('4', 'test', '16140a5af212b82efb8a2ca2918a0762', 'test', null, '1', '0', '2020-03-15 15:00:31', null, '0', null);
INSERT INTO `cms_user` VALUES ('5', '316', '16140a5af212b82efb8a2ca2918a0762', '316', null, '1', '1', '2020-03-16 08:41:17', null, '0', null);
INSERT INTO `cms_user` VALUES ('6', '1712d', '16140a5af212b82efb8a2ca2918a0762', '1712d', '2020-04-06', '1', '0', '2020-03-31 08:38:38', null, '0', null);
INSERT INTO `cms_user` VALUES ('20', '张飞', '16140a5af212b82efb8a2ca2918a0762', null, null, '0', '0', null, null, '0', null);
INSERT INTO `cms_user` VALUES ('21', '丁一然', '16140a5af212b82efb8a2ca2918a0762', null, null, '0', '0', null, null, '0', null);
