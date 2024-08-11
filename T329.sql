/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb3 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS `t329`;
CREATE DATABASE IF NOT EXISTS `t329` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `t329`;

DROP TABLE IF EXISTS `config`;
CREATE TABLE IF NOT EXISTS `config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) DEFAULT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='配置文件';

DELETE FROM `config`;
INSERT INTO `config` (`id`, `name`, `value`) VALUES
	(1, '轮播图1', 'upload/config1.jpg'),
	(2, '轮播图2', 'upload/config2.jpg'),
	(3, '轮播图3', 'upload/config3.jpg');

DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE IF NOT EXISTS `dictionary` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` int DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字  Search111 ',
  `super_id` int DEFAULT NULL COMMENT '父字段id',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3 COMMENT='字典';

DELETE FROM `dictionary`;
INSERT INTO `dictionary` (`id`, `dic_code`, `dic_name`, `code_index`, `index_name`, `super_id`, `beizhu`, `create_time`) VALUES
	(1, 'zhiyejieshao_types', '职业', 1, '职业1', NULL, NULL, '2023-03-14 01:57:32'),
	(2, 'zhiyejieshao_types', '职业', 2, '职业2', NULL, NULL, '2023-03-14 01:57:32'),
	(3, 'zhiyejieshao_types', '职业', 3, '职业3', NULL, NULL, '2023-03-14 01:57:32'),
	(4, 'zhiyejieshao_collection_types', '收藏表类型', 1, '收藏', NULL, NULL, '2023-03-14 01:57:32'),
	(5, 'xuexishipin_types', '课程类型', 1, '课程类型1', NULL, NULL, '2023-03-14 01:57:33'),
	(6, 'xuexishipin_types', '课程类型', 2, '课程类型2', NULL, NULL, '2023-03-14 01:57:33'),
	(7, 'xuexishipin_types', '课程类型', 3, '课程类型3', NULL, NULL, '2023-03-14 01:57:33'),
	(8, 'xuexishipin_collection_types', '收藏表类型', 1, '收藏', NULL, NULL, '2023-03-14 01:57:33'),
	(9, 'zujuan_types', '组卷方式', 1, '自动组卷', NULL, NULL, '2023-03-14 01:57:33'),
	(10, 'zujuan_types', '组卷方式', 2, '手动组卷', NULL, NULL, '2023-03-14 01:57:33'),
	(11, 'kemu_types', '科目', 1, '语文', NULL, NULL, '2023-03-14 01:57:33'),
	(12, 'kemu_types', '科目', 2, '前端', NULL, NULL, '2023-03-14 01:57:33'),
	(13, 'exampaper_types', '试卷状态', 1, '启用', NULL, NULL, '2023-03-14 01:57:33'),
	(14, 'exampaper_types', '试卷状态', 2, '禁用', NULL, NULL, '2023-03-14 01:57:33'),
	(15, 'examquestion_types', '试题类型', 1, '单选题', NULL, NULL, '2023-03-14 01:57:33'),
	(16, 'examquestion_types', '试题类型', 2, '多选题', NULL, NULL, '2023-03-14 01:57:33'),
	(17, 'examquestion_types', '试题类型', 3, '判断题', NULL, NULL, '2023-03-14 01:57:33'),
	(18, 'examquestion_types', '试题类型', 4, '填空题', NULL, NULL, '2023-03-14 01:57:33'),
	(19, 'news_types', '公告类型', 1, '公告类型1', NULL, NULL, '2023-03-14 01:57:34'),
	(20, 'news_types', '公告类型', 2, '公告类型2', NULL, NULL, '2023-03-14 01:57:34'),
	(21, 'news_types', '公告类型', 3, '公告类型3', NULL, NULL, '2023-03-14 01:57:34'),
	(22, 'sex_types', '性别', 1, '男', NULL, NULL, '2023-03-14 01:57:34'),
	(23, 'sex_types', '性别', 2, '女', NULL, NULL, '2023-03-14 01:57:34'),
	(24, 'forum_state_types', '帖子状态', 1, '发帖', NULL, NULL, '2023-03-14 01:57:34'),
	(25, 'forum_state_types', '帖子状态', 2, '回帖', NULL, NULL, '2023-03-14 01:57:34');

DROP TABLE IF EXISTS `exampaper`;
CREATE TABLE IF NOT EXISTS `exampaper` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `exampaper_name` varchar(200) NOT NULL COMMENT '试卷名称 Search111',
  `exampaper_date` int DEFAULT NULL COMMENT '考试时长(分钟)',
  `exampaper_myscore` int NOT NULL DEFAULT '0' COMMENT '试卷总分数',
  `kemu_types` int DEFAULT NULL COMMENT '科目 Search111',
  `exampaper_types` int NOT NULL DEFAULT '0' COMMENT '试卷状态 Search111',
  `zujuan_types` int DEFAULT NULL COMMENT '组卷方式',
  `exampaper_delete` int DEFAULT '0' COMMENT '逻辑删除（1代表未删除 2代表已删除）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间 show2 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COMMENT='试卷表';

DELETE FROM `exampaper`;
INSERT INTO `exampaper` (`id`, `exampaper_name`, `exampaper_date`, `exampaper_myscore`, `kemu_types`, `exampaper_types`, `zujuan_types`, `exampaper_delete`, `create_time`) VALUES
	(3, '测试试卷1', 60, 0, 1, 2, 2, 1, '2023-03-14 01:57:33'),
	(4, '测试试卷2', 180, 120, 2, 1, 1, 1, '2023-03-14 01:57:33');

DROP TABLE IF EXISTS `exampapertopic`;
CREATE TABLE IF NOT EXISTS `exampapertopic` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `exampaper_id` int NOT NULL COMMENT '试卷',
  `examquestion_id` int NOT NULL COMMENT '试题',
  `exampapertopic_number` int NOT NULL COMMENT '试题分数',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3 COMMENT='试卷选题';

DELETE FROM `exampapertopic`;
INSERT INTO `exampapertopic` (`id`, `exampaper_id`, `examquestion_id`, `exampapertopic_number`, `create_time`) VALUES
	(35, 4, 14, 10, '2023-03-14 02:39:59'),
	(36, 4, 24, 10, '2023-03-14 02:39:59'),
	(37, 4, 17, 10, '2023-03-14 02:39:59'),
	(38, 4, 23, 10, '2023-03-14 02:39:59'),
	(39, 4, 19, 10, '2023-03-14 02:39:59'),
	(40, 4, 13, 10, '2023-03-14 02:39:59'),
	(41, 4, 18, 10, '2023-03-14 02:39:59'),
	(42, 4, 21, 10, '2023-03-14 02:39:59'),
	(43, 4, 22, 10, '2023-03-14 02:39:59'),
	(44, 4, 16, 10, '2023-03-14 02:39:59'),
	(45, 4, 15, 10, '2023-03-14 02:39:59'),
	(46, 4, 20, 10, '2023-03-14 02:39:59');

DROP TABLE IF EXISTS `examquestion`;
CREATE TABLE IF NOT EXISTS `examquestion` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `examquestion_name` varchar(200) NOT NULL COMMENT '试题名称 Search111',
  `kemu_types` int DEFAULT NULL COMMENT '科目 Search111',
  `examquestion_options` longtext COMMENT '选项，json字符串',
  `examquestion_answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `examquestion_analysis` longtext COMMENT '答案解析',
  `examquestion_types` int DEFAULT '0' COMMENT '试题类型',
  `examquestion_sequence` int DEFAULT '100' COMMENT '试题排序，值越大排越前面',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COMMENT='试题表';

DELETE FROM `examquestion`;
INSERT INTO `examquestion` (`id`, `examquestion_name`, `kemu_types`, `examquestion_options`, `examquestion_answer`, `examquestion_analysis`, `examquestion_types`, `examquestion_sequence`, `create_time`) VALUES
	(13, '1-1=1', 2, '[{"text":"对","code":"A"},{"text":"错","code":"B"}]', 'B', '1-1=0', 3, 1, '2023-03-14 01:57:33'),
	(14, '1+1=？', 2, '[{"text":"1","code":"A"},{"text":"2","code":"B"},{"text":"3","code":"C"},{"text":"4","code":"D"}]', 'B', '1+1=2', 1, 2, '2023-03-14 01:57:33'),
	(15, '1+1-1=?', 2, '[]', '1', '1+1-1=1', 4, 3, '2023-03-14 01:57:33'),
	(16, '2+2=?', 2, '[]', '4', '2+2=4', 4, 4, '2023-03-14 01:57:33'),
	(17, '1-1-1+6=?', 2, '[{"text":"4","code":"A"},{"text":"5","code":"B"},{"text":"6","code":"C"},{"text":"3","code":"D"}]', 'B', '1-1-1+6=5', 1, 5, '2023-03-14 01:57:33'),
	(18, '3+3=9', 2, '[{"text":"对","code":"A"},{"text":"错","code":"B"}]', 'B', '3+3=6', 3, 6, '2023-03-14 01:57:33'),
	(19, '试题名称1', 2, '[{"text":"内容1","code":"A"},{"text":"内容2","code":"B"},{"text":"内容3","code":"C"},{"text":"内容4","code":"D"}]', 'A,B,C', '答案解析1', 2, 7, '2023-03-14 01:57:33'),
	(20, '试题名称2', 2, '[]', '正确答案2', '答案解析2', 4, 8, '2023-03-14 01:57:33'),
	(21, '试题名称3', 2, '[{"text":"对","code":"A"},{"text":"错","code":"B"}]', 'A', '答案解析3', 3, 9, '2023-03-14 01:57:33'),
	(22, '试题名称4', 2, '[]', '正确答案4', '答案解析4', 4, 10, '2023-03-14 01:57:33'),
	(23, '试题名称5', 2, '[{"text":"内容1","code":"A"},{"text":"内容2","code":"B"},{"text":"内容3","code":"C"},{"text":"内容4","code":"D"}]', 'B', '答案解析5', 1, 11, '2023-03-14 01:57:33'),
	(24, '试题名称6', 2, '[{"text":"内容1","code":"A"},{"text":"内容2","code":"B"},{"text":"内容3","code":"C"},{"text":"内容4","code":"D"}]', 'A', '答案解析6', 1, 12, '2023-03-14 01:57:33');

DROP TABLE IF EXISTS `examrecord`;
CREATE TABLE IF NOT EXISTS `examrecord` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `examrecord_uuid_number` varchar(200) DEFAULT NULL COMMENT '考试编号',
  `yonghu_id` int NOT NULL COMMENT '考试学生',
  `exampaper_id` int NOT NULL COMMENT '所属试卷id（外键）',
  `total_score` int DEFAULT NULL COMMENT '所得总分',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '考试时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='考试记录表';

DELETE FROM `examrecord`;
INSERT INTO `examrecord` (`id`, `examrecord_uuid_number`, `yonghu_id`, `exampaper_id`, `total_score`, `insert_time`, `create_time`) VALUES
	(1, '1678761684956', 1, 4, 40, '2023-03-14 02:41:25', '2023-03-14 02:41:25');

DROP TABLE IF EXISTS `examredetails`;
CREATE TABLE IF NOT EXISTS `examredetails` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `examredetails_uuid_number` varchar(200) DEFAULT NULL COMMENT '试卷编号',
  `yonghu_id` int NOT NULL COMMENT '学生id',
  `examquestion_id` int NOT NULL COMMENT '试题id（外键）',
  `examredetails_myanswer` varchar(200) DEFAULT NULL COMMENT '考生答案',
  `examredetails_myscore` int NOT NULL DEFAULT '0' COMMENT '试题得分',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COMMENT='答题详情表';

DELETE FROM `examredetails`;
INSERT INTO `examredetails` (`id`, `examredetails_uuid_number`, `yonghu_id`, `examquestion_id`, `examredetails_myanswer`, `examredetails_myscore`, `create_time`) VALUES
	(1, '1678761684956', 1, 20, '1', 0, '2023-03-14 02:41:25'),
	(2, '1678761684956', 1, 15, '1', 10, '2023-03-14 02:41:25'),
	(3, '1678761684956', 1, 16, '4', 10, '2023-03-14 02:41:25'),
	(4, '1678761684956', 1, 22, ' 23123', 0, '2023-03-14 02:41:25'),
	(5, '1678761684956', 1, 21, 'A', 10, '2023-03-14 02:41:25'),
	(6, '1678761684956', 1, 18, 'A', 0, '2023-03-14 02:41:25'),
	(7, '1678761684956', 1, 13, 'A', 0, '2023-03-14 02:41:25'),
	(8, '1678761684956', 1, 19, 'A', 0, '2023-03-14 02:41:25'),
	(9, '1678761684956', 1, 23, 'C', 0, '2023-03-14 02:41:25'),
	(10, '1678761684956', 1, 17, 'B', 10, '2023-03-14 02:41:25'),
	(11, '1678761684956', 1, 24, 'C', 0, '2023-03-14 02:41:25'),
	(12, '1678761684956', 1, 14, 'A', 0, '2023-03-14 02:41:25');

DROP TABLE IF EXISTS `forum`;
CREATE TABLE IF NOT EXISTS `forum` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `forum_name` varchar(200) DEFAULT NULL COMMENT '帖子标题  Search111 ',
  `yonghu_id` int DEFAULT NULL COMMENT '用户',
  `users_id` int DEFAULT NULL COMMENT '管理员',
  `forum_content` text COMMENT '发布内容',
  `super_ids` int DEFAULT NULL COMMENT '父id',
  `forum_state_types` int DEFAULT NULL COMMENT '帖子状态',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '发帖时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COMMENT='论坛';

DELETE FROM `forum`;
INSERT INTO `forum` (`id`, `forum_name`, `yonghu_id`, `users_id`, `forum_content`, `super_ids`, `forum_state_types`, `insert_time`, `update_time`, `create_time`) VALUES
	(1, '帖子标题1', 2, NULL, '发布内容1', 429, 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(2, '帖子标题2', 2, NULL, '发布内容2', 274, 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(3, '帖子标题3', 2, NULL, '发布内容3', 125, 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(4, '帖子标题4', 1, NULL, '发布内容4', 202, 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(5, '帖子标题5', 1, NULL, '发布内容5', 162, 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(6, '帖子标题6', 1, NULL, '发布内容6', 462, 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(7, '帖子标题7', 3, NULL, '发布内容7', 296, 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(8, '帖子标题8', 1, NULL, '发布内容8', 326, 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(9, '帖子标题9', 2, NULL, '发布内容9', 192, 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(10, '帖子标题10', 2, NULL, '发布内容10', 244, 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(11, '帖子标题11', 1, NULL, '发布内容11', 135, 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(12, '帖子标题12', 2, NULL, '发布内容12', 334, 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(13, '帖子标题13', 3, NULL, '发布内容13', 441, 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(14, '帖子标题14', 1, NULL, '发布内容14', 2, 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(15, NULL, 1, NULL, '123123', 14, 2, '2023-03-14 02:42:05', NULL, '2023-03-14 02:42:05'),
	(16, NULL, NULL, 1, '123123', 14, 2, '2023-03-14 02:42:21', NULL, '2023-03-14 02:42:21'),
	(17, NULL, 1, NULL, '111', 11, 2, '2024-08-04 02:16:18', NULL, '2024-08-04 02:16:18');

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `news_name` varchar(200) DEFAULT NULL COMMENT '公告标题  Search111 ',
  `news_types` int DEFAULT NULL COMMENT '公告类型  Search111 ',
  `news_photo` varchar(200) DEFAULT NULL COMMENT '公告图片',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `news_content` text COMMENT '公告详情',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 nameShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COMMENT='公告信息';

DELETE FROM `news`;
INSERT INTO `news` (`id`, `news_name`, `news_types`, `news_photo`, `insert_time`, `news_content`, `create_time`) VALUES
	(1, '公告标题1', 1, 'upload/news1.jpg', '2023-03-14 02:34:57', '公告详情1', '2023-03-14 02:34:57'),
	(2, '公告标题2', 3, 'upload/news2.jpg', '2023-03-14 02:34:57', '公告详情2', '2023-03-14 02:34:57'),
	(3, '公告标题3', 1, 'upload/news3.jpg', '2023-03-14 02:34:57', '公告详情3', '2023-03-14 02:34:57'),
	(4, '公告标题4', 3, 'upload/news4.jpg', '2023-03-14 02:34:57', '公告详情4', '2023-03-14 02:34:57'),
	(5, '公告标题5', 3, 'upload/news5.jpg', '2023-03-14 02:34:57', '公告详情5', '2023-03-14 02:34:57'),
	(6, '公告标题6', 3, 'upload/news6.jpg', '2023-03-14 02:34:57', '公告详情6', '2023-03-14 02:34:57'),
	(7, '公告标题7', 2, 'upload/news7.jpg', '2023-03-14 02:34:57', '公告详情7', '2023-03-14 02:34:57'),
	(8, '公告标题8', 3, 'upload/news8.jpg', '2023-03-14 02:34:57', '公告详情8', '2023-03-14 02:34:57'),
	(9, '公告标题9', 3, 'upload/news9.jpg', '2023-03-14 02:34:57', '公告详情9', '2023-03-14 02:34:57'),
	(10, '公告标题10', 2, 'upload/news10.jpg', '2023-03-14 02:34:57', '公告详情10', '2023-03-14 02:34:57'),
	(11, '公告标题11', 3, 'upload/news11.jpg', '2023-03-14 02:34:57', '公告详情11', '2023-03-14 02:34:57'),
	(12, '公告标题12', 3, 'upload/news12.jpg', '2023-03-14 02:34:57', '公告详情12', '2023-03-14 02:34:57'),
	(13, '公告标题13', 3, 'upload/news13.jpg', '2023-03-14 02:34:57', '公告详情13', '2023-03-14 02:34:57'),
	(14, '公告标题14', 2, 'upload/news14.jpg', '2023-03-14 02:34:57', '公告详情14', '2023-03-14 02:34:57');

DROP TABLE IF EXISTS `token`;
CREATE TABLE IF NOT EXISTS `token` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COMMENT='token表';

DELETE FROM `token`;
INSERT INTO `token` (`id`, `userid`, `username`, `tablename`, `role`, `token`, `addtime`, `expiratedtime`) VALUES
	(3, 1, 'a1', 'yonghu', '用户', '4vi9kyrifwez1fya6u1tub92kj6o3k9b', '2023-03-14 02:36:20', '2024-08-04 03:15:41'),
	(4, 1, 'admin', 'users', '管理员', 'i3zvkbeiptik66nltntclfb6ffnnlnxu', '2023-03-14 02:39:10', '2024-08-04 03:14:27');

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='管理员';

DELETE FROM `users`;
INSERT INTO `users` (`id`, `username`, `password`, `role`, `addtime`) VALUES
	(1, 'admin', '123456', '管理员', '2023-03-14 01:57:32');

DROP TABLE IF EXISTS `xuexishipin`;
CREATE TABLE IF NOT EXISTS `xuexishipin` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `xuexishipin_name` varchar(200) DEFAULT NULL COMMENT '课程名称  Search111 ',
  `xuexishipin_photo` varchar(200) DEFAULT NULL COMMENT '课程封面',
  `xuexishipin_video` varchar(255) DEFAULT NULL COMMENT '学习视频',
  `xuexishipin_types` int DEFAULT NULL COMMENT '课程类型 Search111',
  `zhiyejieshao_types` int DEFAULT NULL COMMENT '职业 Search111',
  `xuexishipin_content` text COMMENT '课程详情 ',
  `xuexishipin_delete` int DEFAULT NULL COMMENT '逻辑删除',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COMMENT='课程学习';

DELETE FROM `xuexishipin`;
INSERT INTO `xuexishipin` (`id`, `xuexishipin_name`, `xuexishipin_photo`, `xuexishipin_video`, `xuexishipin_types`, `zhiyejieshao_types`, `xuexishipin_content`, `xuexishipin_delete`, `insert_time`, `create_time`) VALUES
	(1, '课程名称1', 'upload/xuexishipin1.jpg', 'upload/video.mp4', 1, 2, '课程详情1', 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(2, '课程名称2', 'upload/xuexishipin2.jpg', 'upload/video.mp4', 1, 2, '课程详情2', 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(3, '课程名称3', 'upload/xuexishipin3.jpg', 'upload/video.mp4', 1, 1, '课程详情3', 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(4, '课程名称4', 'upload/xuexishipin4.jpg', 'upload/video.mp4', 2, 1, '课程详情4', 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(5, '课程名称5', 'upload/xuexishipin5.jpg', 'upload/video.mp4', 1, 2, '课程详情5', 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(6, '课程名称6', 'upload/xuexishipin6.jpg', 'upload/video.mp4', 3, 1, '课程详情6', 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(7, '课程名称7', 'upload/xuexishipin7.jpg', 'upload/video.mp4', 3, 1, '课程详情7', 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(8, '课程名称8', 'upload/xuexishipin1.jpg', 'upload/video.mp4', 2, 1, '课程详情8', 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(9, '课程名称9', 'upload/xuexishipin2.jpg', 'upload/video.mp4', 1, 2, '课程详情9', 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(10, '课程名称10', 'upload/xuexishipin3.jpg', 'upload/video.mp4', 3, 3, '课程详情10', 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(11, '课程名称11', 'upload/xuexishipin4.jpg', 'upload/video.mp4', 3, 3, '课程详情11', 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(12, '课程名称12', 'upload/xuexishipin5.jpg', 'upload/video.mp4', 2, 1, '课程详情12', 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(13, '课程名称13', 'upload/xuexishipin6.jpg', 'upload/video.mp4', 2, 1, '课程详情13', 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(14, '课程名称14', 'upload/xuexishipin7.jpg', 'upload/video.mp4', 3, 3, '课程详情14', 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57');

DROP TABLE IF EXISTS `xuexishipin_collection`;
CREATE TABLE IF NOT EXISTS `xuexishipin_collection` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `xuexishipin_id` int DEFAULT NULL COMMENT '课程',
  `yonghu_id` int DEFAULT NULL COMMENT '用户',
  `xuexishipin_collection_types` int DEFAULT NULL COMMENT '类型',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '收藏时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show3 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COMMENT='课程收藏';

DELETE FROM `xuexishipin_collection`;
INSERT INTO `xuexishipin_collection` (`id`, `xuexishipin_id`, `yonghu_id`, `xuexishipin_collection_types`, `insert_time`, `create_time`) VALUES
	(1, 1, 2, 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(2, 2, 2, 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(4, 4, 2, 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(6, 6, 1, 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(7, 7, 2, 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(8, 8, 3, 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(9, 9, 1, 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(10, 10, 2, 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(11, 11, 1, 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(12, 12, 2, 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(13, 13, 3, 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(14, 14, 3, 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(15, 2, 1, 1, '2023-03-14 02:38:42', '2023-03-14 02:38:42'),
	(16, 14, 1, 1, '2024-08-04 02:16:31', '2024-08-04 02:16:31');

DROP TABLE IF EXISTS `yonghu`;
CREATE TABLE IF NOT EXISTS `yonghu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `yonghu_name` varchar(200) DEFAULT NULL COMMENT '用户姓名 Search111 ',
  `yonghu_photo` varchar(255) DEFAULT NULL COMMENT '头像',
  `yonghu_phone` varchar(200) DEFAULT NULL COMMENT '用户手机号',
  `yonghu_id_number` varchar(200) DEFAULT NULL COMMENT '用户身份证号 ',
  `sex_types` int DEFAULT NULL COMMENT '性别 Search111 ',
  `yonghu_email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `yonghu_delete` int DEFAULT '1' COMMENT '假删',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='用户';

DELETE FROM `yonghu`;
INSERT INTO `yonghu` (`id`, `username`, `password`, `yonghu_name`, `yonghu_photo`, `yonghu_phone`, `yonghu_id_number`, `sex_types`, `yonghu_email`, `yonghu_delete`, `create_time`) VALUES
	(1, '用户1', '123456', '用户姓名1', 'upload/yonghu1.jpg', '17703786901', '410224199010102001', 2, '1@qq.com', 1, '2023-03-14 02:34:57'),
	(2, '用户2', '123456', '用户姓名2', 'upload/yonghu2.jpg', '17703786902', '410224199010102002', 2, '2@qq.com', 1, '2023-03-14 02:34:57'),
	(3, '用户3', '123456', '用户姓名3', 'upload/yonghu3.jpg', '17703786903', '410224199010102003', 1, '3@qq.com', 1, '2023-03-14 02:34:57');

DROP TABLE IF EXISTS `zhiyejieshao`;
CREATE TABLE IF NOT EXISTS `zhiyejieshao` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `zhiyejieshao_name` varchar(200) DEFAULT NULL COMMENT '职业名称  Search111 ',
  `zhiyejieshao_photo` varchar(200) DEFAULT NULL COMMENT '职业封面',
  `zhiyejieshao_types` int DEFAULT NULL COMMENT '职业 Search111',
  `zhiyejieshao_content` text COMMENT '职业详情 ',
  `zhiyejieshao_delete` int DEFAULT NULL COMMENT '逻辑删除',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COMMENT='职业介绍';

DELETE FROM `zhiyejieshao`;
INSERT INTO `zhiyejieshao` (`id`, `zhiyejieshao_name`, `zhiyejieshao_photo`, `zhiyejieshao_types`, `zhiyejieshao_content`, `zhiyejieshao_delete`, `insert_time`, `create_time`) VALUES
	(1, '职业名称1', 'upload/zhiyejieshao1.jpg', 2, '职业详情1', 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(2, '职业名称2', 'upload/zhiyejieshao2.jpg', 2, '职业详情2', 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(3, '职业名称3', 'upload/zhiyejieshao3.jpg', 3, '职业详情3', 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(4, '职业名称4', 'upload/zhiyejieshao4.jpg', 2, '职业详情4', 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(5, '职业名称5', 'upload/zhiyejieshao5.jpg', 3, '职业详情5', 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(6, '职业名称6', 'upload/zhiyejieshao6.jpg', 1, '职业详情6', 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(7, '职业名称7', 'upload/zhiyejieshao7.jpg', 2, '职业详情7', 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(8, '职业名称8', 'upload/zhiyejieshao1.jpg', 2, '职业详情8', 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(9, '职业名称9', 'upload/zhiyejieshao2.jpg', 2, '职业详情9', 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(10, '职业名称10', 'upload/zhiyejieshao3.jpg', 3, '职业详情10', 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(11, '职业名称11', 'upload/zhiyejieshao4.jpg', 2, '职业详情11', 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(12, '职业名称12', 'upload/zhiyejieshao5.jpg', 3, '职业详情12', 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(13, '职业名称13', 'upload/zhiyejieshao6.jpg', 3, '职业详情13', 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(14, '职业名称14', 'upload/zhiyejieshao7.jpg', 2, '职业详情14', 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57');

DROP TABLE IF EXISTS `zhiyejieshao_collection`;
CREATE TABLE IF NOT EXISTS `zhiyejieshao_collection` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `zhiyejieshao_id` int DEFAULT NULL COMMENT '职业介绍',
  `yonghu_id` int DEFAULT NULL COMMENT '用户',
  `zhiyejieshao_collection_types` int DEFAULT NULL COMMENT '类型',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '收藏时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show3 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COMMENT='职业介绍收藏';

DELETE FROM `zhiyejieshao_collection`;
INSERT INTO `zhiyejieshao_collection` (`id`, `zhiyejieshao_id`, `yonghu_id`, `zhiyejieshao_collection_types`, `insert_time`, `create_time`) VALUES
	(1, 1, 1, 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(2, 2, 3, 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(3, 3, 2, 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(4, 4, 2, 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(5, 5, 3, 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(6, 6, 1, 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(7, 7, 1, 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(8, 8, 2, 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(9, 9, 1, 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(10, 10, 3, 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(11, 11, 1, 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(12, 12, 2, 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(13, 13, 3, 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57'),
	(14, 14, 1, 1, '2023-03-14 02:34:57', '2023-03-14 02:34:57');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
