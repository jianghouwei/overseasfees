/*
Navicat MySQL Data Transfer

Source Server         : loclahost
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : overseasfees

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2016-09-02 18:05:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for app_info
-- ----------------------------
DROP TABLE IF EXISTS `app_info`;
CREATE TABLE `app_info` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(64) DEFAULT NULL,
  `pkg_name` varchar(255) DEFAULT NULL,
  `app_name` varchar(255) DEFAULT NULL,
  `app_briefing` varchar(255) DEFAULT NULL COMMENT '应用简介',
  `app_user` bigint(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` bigint(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_info
-- ----------------------------
INSERT INTO `app_info` VALUES ('3', 'A14720101531302', 'com.org.dota', 'DOTA', '你好，这款游戏真的很不错', '1', '2016-08-24 11:42:32', '1', null, null);
INSERT INTO `app_info` VALUES ('4', 'A14720102465886', 'com.org.fifa', 'FIFA Oline 3', '老牌足球竞技手游！腾讯代理', '1', '2016-08-24 11:44:07', '1', '2016-08-24 11:56:31', '1');

-- ----------------------------
-- Table structure for chanenl_info
-- ----------------------------
DROP TABLE IF EXISTS `chanenl_info`;
CREATE TABLE `chanenl_info` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(64) DEFAULT NULL COMMENT '应用ID',
  `channel_code` varchar(128) DEFAULT NULL,
  `channel_name` varchar(255) DEFAULT NULL,
  `channel_briefing` varchar(255) DEFAULT NULL,
  `channel_user` bigint(11) DEFAULT NULL COMMENT '渠道所有者',
  `percentage` decimal(10,2) DEFAULT NULL COMMENT '扣量百分比',
  `create_time` datetime DEFAULT NULL,
  `create_user` bigint(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chanenl_info
-- ----------------------------
INSERT INTO `chanenl_info` VALUES ('4', 'A14720102465886', 'C2785141926', 'chanenl-1', '在这里去寻找你的战友！', '12', '10.00', '2016-08-24 13:57:44', '1', '2016-08-24 14:04:14', '1');
INSERT INTO `chanenl_info` VALUES ('5', 'A14720101531301', 'C2785141927', 'chanenl-2', '在这里去寻找你的战友！', '12', '10.00', '2016-08-24 13:57:44', '1', '2016-08-24 14:04:14', '1');

-- ----------------------------
-- Table structure for currency_mcc
-- ----------------------------
DROP TABLE IF EXISTS `currency_mcc`;
CREATE TABLE `currency_mcc` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `mcc` varchar(5) DEFAULT NULL COMMENT '国家mcc',
  `state_cn` varchar(32) DEFAULT NULL COMMENT '州',
  `state_en` varchar(32) DEFAULT NULL,
  `country_cn` varchar(64) DEFAULT NULL COMMENT '国家',
  `country_en` varchar(64) DEFAULT NULL,
  `currency_symbo` varchar(32) DEFAULT NULL COMMENT '货币符号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of currency_mcc
-- ----------------------------
INSERT INTO `currency_mcc` VALUES ('1', '412', '亚洲', 'Asia', '阿富汗', 'Afghanistan', 'AFN');
INSERT INTO `currency_mcc` VALUES ('2', '283', '亚洲', 'Asia', '亚美尼亚', 'Armenian', 'AMD');
INSERT INTO `currency_mcc` VALUES ('3', '400', '亚洲', 'Asia', '阿塞拜疆', 'Azerbaijani', 'AZN');
INSERT INTO `currency_mcc` VALUES ('4', '426', '亚洲', 'Asia', '巴林', 'Bahrain', 'BHD');
INSERT INTO `currency_mcc` VALUES ('5', '470', '亚洲', 'Asia', '孟加拉国', 'Bangladesh', 'BDT');
INSERT INTO `currency_mcc` VALUES ('6', '402', '亚洲', 'Asia', '不丹 ', 'Bhutan', 'BTN');
INSERT INTO `currency_mcc` VALUES ('7', '528', '亚洲', 'Asia', '文莱', 'Brune iDarussalam', 'BND');
INSERT INTO `currency_mcc` VALUES ('8', '456', '亚洲', 'Asia', '柬埔寨', 'Cambodia', 'KHR');
INSERT INTO `currency_mcc` VALUES ('9', '460', '亚洲', 'Asia', '中国', 'China', 'CNY');
INSERT INTO `currency_mcc` VALUES ('10', '282', '亚洲', 'Asia', '格鲁吉亚', 'Georgian lari', 'GEL');
INSERT INTO `currency_mcc` VALUES ('11', '454', '亚洲', 'Asia', '中国香港', 'Hong Kong', 'HKD');
INSERT INTO `currency_mcc` VALUES ('12', '404', '亚洲', 'Asia', '印度', 'India', 'INR');
INSERT INTO `currency_mcc` VALUES ('13', '510', '亚洲', 'Asia', '印度尼西亚', 'Indonesia', 'IDR');
INSERT INTO `currency_mcc` VALUES ('14', '418', '亚洲', 'Asia', '伊拉克', 'Iraq', 'IQD');
INSERT INTO `currency_mcc` VALUES ('15', '432', '亚洲', 'Asia', '伊朗', 'Islamic Republic of Iran', 'IRR');
INSERT INTO `currency_mcc` VALUES ('16', '425', '亚洲', 'Asia', '以色列', 'Israel', 'ILS');
INSERT INTO `currency_mcc` VALUES ('17', '440', '亚洲', 'Asia', '日本', 'Japan', 'JPY');
INSERT INTO `currency_mcc` VALUES ('18', '416', '亚洲', 'Asia', '约旦', 'Jordan', 'JOD');
INSERT INTO `currency_mcc` VALUES ('19', '401', '亚洲', 'Asia', '哈萨克斯坦', 'Kazakhstan', 'KZT');
INSERT INTO `currency_mcc` VALUES ('20', '467', '亚洲', 'Asia', '韩国', 'Korea Rep.', 'KRW');
INSERT INTO `currency_mcc` VALUES ('21', '467', '亚洲', 'Asia', '朝鲜', 'Korea,DPR', 'KPW');
INSERT INTO `currency_mcc` VALUES ('22', '419', '亚洲', 'Asia', '科威特', 'Kuwait', 'KWD');
INSERT INTO `currency_mcc` VALUES ('23', '437', '亚洲', 'Asia', '吉尔吉斯斯坦', 'Kyrgyzstan', 'KGS');
INSERT INTO `currency_mcc` VALUES ('24', '457', '亚洲', 'Asia', '老挝', 'Laos', 'LAK');
INSERT INTO `currency_mcc` VALUES ('25', '415', '亚洲', 'Asia', '黎巴嫩', 'Lebanon', 'LBP');
INSERT INTO `currency_mcc` VALUES ('26', '455', '亚洲', 'Asia', '中国澳门', 'Macau', 'MOP');
INSERT INTO `currency_mcc` VALUES ('27', '502', '亚洲', 'Asia', '马来西亚', 'Malaysia', 'MYR');
INSERT INTO `currency_mcc` VALUES ('28', '472', '亚洲', 'Asia', '马尔代夫', 'Maldives', 'MVR');
INSERT INTO `currency_mcc` VALUES ('29', '428', '亚洲', 'Asia', '蒙古', 'Mongolia', 'MNT');
INSERT INTO `currency_mcc` VALUES ('30', '414', '亚洲', 'Asia', '缅甸', 'Myanmar', 'BUK');
INSERT INTO `currency_mcc` VALUES ('31', '429', '亚洲', 'Asia', '尼泊尔', 'Nepal', 'NPR');
INSERT INTO `currency_mcc` VALUES ('32', '422', '亚洲', 'Asia', '阿曼', 'Oman', 'OMR');
INSERT INTO `currency_mcc` VALUES ('33', '425', '亚洲', 'Asia', '巴勒斯坦国', 'Pakistan', 'ILS');
INSERT INTO `currency_mcc` VALUES ('34', '410', '亚洲', 'Asia', '巴基斯坦', 'Pakistan', 'PKR');
INSERT INTO `currency_mcc` VALUES ('35', '999', '亚洲', 'Asia', '巴勒斯坦', 'Palestine', 'PKR');
INSERT INTO `currency_mcc` VALUES ('36', '515', '亚洲', 'Asia', '菲律宾', 'Philippines', 'PHP');
INSERT INTO `currency_mcc` VALUES ('37', '427', '亚洲', 'Asia', '卡塔尔', 'Qatar', 'QAR');
INSERT INTO `currency_mcc` VALUES ('38', '420', '亚洲', 'Asia', '沙特阿拉伯', 'Saudi Arabia', 'SAR');
INSERT INTO `currency_mcc` VALUES ('39', '525', '亚洲', 'Asia', '新加坡', 'Singapore', 'SGD');
INSERT INTO `currency_mcc` VALUES ('40', '413', '亚洲', 'Asia', '斯里兰卡', 'Srilanka', 'LKR');
INSERT INTO `currency_mcc` VALUES ('41', '417', '亚洲', 'Asia', '叙利亚', 'Syrian', 'SYP');
INSERT INTO `currency_mcc` VALUES ('42', '436', '亚洲', 'Asia', '塔吉克斯坦', 'Tadjikistan', 'TJS');
INSERT INTO `currency_mcc` VALUES ('43', '466', '亚洲', 'Asia', '中国台湾', 'Taiwan', 'TWD');
INSERT INTO `currency_mcc` VALUES ('44', '520', '亚洲', 'Asia', '泰国', 'Thailand', 'THB');
INSERT INTO `currency_mcc` VALUES ('45', '514', '亚洲', 'Asia', '东帝汶', 'Timor-Leste', 'USD');
INSERT INTO `currency_mcc` VALUES ('46', '438', '亚洲', 'Asia', '土库曼斯坦', 'Turkmenistan', 'TMM');
INSERT INTO `currency_mcc` VALUES ('47', '424', '亚洲', 'Asia', '阿联酋', 'United Arab Emirates', 'AED');
INSERT INTO `currency_mcc` VALUES ('48', '434', '亚洲', 'Asia', '乌兹别克斯坦', 'Uzbekistan', 'UZS');
INSERT INTO `currency_mcc` VALUES ('49', '452', '亚洲', 'Asia', '越南', 'Viet Nam', 'VND');
INSERT INTO `currency_mcc` VALUES ('50', '421', '亚洲', 'Asia', '也门', 'Yemen', 'YER');
INSERT INTO `currency_mcc` VALUES ('51', '276', '欧洲', 'Europe', '阿尔巴尼亚', 'Albania', 'ALL');
INSERT INTO `currency_mcc` VALUES ('52', '213', '欧洲', 'Europe', '安道尔', 'Andorra', 'EUR');
INSERT INTO `currency_mcc` VALUES ('53', '232', '欧洲', 'Europe', '奥地利', 'Austria', 'EUR');
INSERT INTO `currency_mcc` VALUES ('54', '257', '欧洲', 'Europe', '白俄罗斯', 'Belarus', 'BYR');
INSERT INTO `currency_mcc` VALUES ('55', '206', '欧洲', 'Europe', '比利时', 'Belgium', 'EUR');
INSERT INTO `currency_mcc` VALUES ('56', '284', '欧洲', 'Europe', '保加利亚', 'Bulgarian', 'BGN');
INSERT INTO `currency_mcc` VALUES ('57', '219', '欧洲', 'Europe', '克罗地亚', 'Croatia', 'HRK ');
INSERT INTO `currency_mcc` VALUES ('58', '280', '欧洲', 'Europe', '塞浦路斯', 'Cyprus', 'CYP');
INSERT INTO `currency_mcc` VALUES ('59', '230', '欧洲', 'Europe', '捷克', 'Czech Republic ', 'CZK');
INSERT INTO `currency_mcc` VALUES ('60', '238', '欧洲', 'Europe', '丹麦', 'Denmark', 'DKK');
INSERT INTO `currency_mcc` VALUES ('61', '248', '欧洲', 'Europe', '爱沙尼亚', 'Estonia', 'EEK');
INSERT INTO `currency_mcc` VALUES ('62', '244', '欧洲', 'Europe', '芬兰', 'Finland', 'EUR');
INSERT INTO `currency_mcc` VALUES ('63', '208', '欧洲', 'Europe', '法国', 'France', 'EUR');
INSERT INTO `currency_mcc` VALUES ('64', '262', '欧洲', 'Europe', '德国', 'Germany', 'EUR');
INSERT INTO `currency_mcc` VALUES ('65', '234', '欧洲', 'Europe', '英国', 'Great Britain', 'GBP');
INSERT INTO `currency_mcc` VALUES ('66', '202', '欧洲', 'Europe', '希腊', 'Greece', 'EUR');
INSERT INTO `currency_mcc` VALUES ('67', '216', '欧洲', 'Europe', '匈牙利', 'Hungary', 'HUF');
INSERT INTO `currency_mcc` VALUES ('68', '274', '欧洲', 'Europe', '冰岛', 'Iceland', 'ISK');
INSERT INTO `currency_mcc` VALUES ('69', '272', '欧洲', 'Europe', '爱尔兰', 'Ireland', 'EUR');
INSERT INTO `currency_mcc` VALUES ('70', '222', '欧洲', 'Europe', '意大利', 'Italy', 'EUR');
INSERT INTO `currency_mcc` VALUES ('71', '247', '欧洲', 'Europe', '拉脱维亚', 'Latvia', 'LVL');
INSERT INTO `currency_mcc` VALUES ('72', '295', '欧洲', 'Europe', '列支敦士登', 'Liechtenstein', 'CHF ');
INSERT INTO `currency_mcc` VALUES ('73', '246', '欧洲', 'Europe', '立陶宛', 'Lithuania', ' LTL ');
INSERT INTO `currency_mcc` VALUES ('74', '270', '欧洲', 'Europe', '卢森堡', 'Luxembourg', 'EUR');
INSERT INTO `currency_mcc` VALUES ('75', '294', '欧洲', 'Europe', '马其顿', 'Macedonia', 'MKD');
INSERT INTO `currency_mcc` VALUES ('76', '278', '欧洲', 'Europe', '马耳他', 'Malta', 'EUR');
INSERT INTO `currency_mcc` VALUES ('77', '259', '欧洲', 'Europe', '摩尔多瓦', 'Moldova', 'MDL');
INSERT INTO `currency_mcc` VALUES ('78', '212', '欧洲', 'Europe', '摩纳哥', 'Monaco', 'EUR');
INSERT INTO `currency_mcc` VALUES ('79', '204', '欧洲', 'Europe', '荷兰', 'Netherlands', 'EUR');
INSERT INTO `currency_mcc` VALUES ('80', '242', '欧洲', 'Europe', '挪威', 'Norway', 'NOK');
INSERT INTO `currency_mcc` VALUES ('81', '260', '欧洲', 'Europe', '波兰', 'Poland', 'PLN');
INSERT INTO `currency_mcc` VALUES ('82', '268', '欧洲', 'Europe', '葡萄牙', 'Portugal', 'EUR');
INSERT INTO `currency_mcc` VALUES ('83', '226', '欧洲', 'Europe', '罗马尼亚', 'Romania', 'RON ');
INSERT INTO `currency_mcc` VALUES ('84', '250', '欧洲', 'Europe', '俄罗斯', 'Russia', 'RUB');
INSERT INTO `currency_mcc` VALUES ('85', '292', '欧洲', 'Europe', '圣马力诺', 'San Marino', 'EUR');
INSERT INTO `currency_mcc` VALUES ('86', '220', '欧洲', 'Europe', '塞尔维亚', 'Serbia', 'RSD');
INSERT INTO `currency_mcc` VALUES ('87', '231', '欧洲', 'Europe', '斯洛伐克', 'Slovakia', 'EUR');
INSERT INTO `currency_mcc` VALUES ('88', '293', '欧洲', 'Europe', '斯洛文尼亚', 'Slovenia', 'SIT');
INSERT INTO `currency_mcc` VALUES ('89', '214', '欧洲', 'Europe', '西班牙', 'Spain', 'EUR');
INSERT INTO `currency_mcc` VALUES ('90', '240', '欧洲', 'Europe', '瑞典', 'Sweden', 'SEK');
INSERT INTO `currency_mcc` VALUES ('91', '228', '欧洲', 'Europe', '瑞士', 'Swiss', 'CHF');
INSERT INTO `currency_mcc` VALUES ('92', '286', '欧洲', 'Europe', '土耳其', 'Turkey', 'TRY');
INSERT INTO `currency_mcc` VALUES ('93', '255', '欧洲', 'Europe', '乌克兰', 'Ukraine', 'UAH');
INSERT INTO `currency_mcc` VALUES ('94', '225', '欧洲', 'Europe', '梵蒂冈', 'Vatican', 'EUR');
INSERT INTO `currency_mcc` VALUES ('95', '999', '欧洲', 'Europe', '南斯拉夫', 'Yugoslavia', 'YUN');
INSERT INTO `currency_mcc` VALUES ('96', '722', '美洲', 'America', '阿根廷', 'Argentina', 'ARS');
INSERT INTO `currency_mcc` VALUES ('97', '363', '美洲', 'America', '阿鲁巴岛', 'Aruba', 'AWG');
INSERT INTO `currency_mcc` VALUES ('98', '364', '美洲', 'America', '巴哈马联邦', 'Bahamas', 'BSD');
INSERT INTO `currency_mcc` VALUES ('99', '342', '美洲', 'America', '巴巴多斯', 'Barbados', 'BBD');
INSERT INTO `currency_mcc` VALUES ('100', '702', '美洲', 'America', '伯利兹', 'Belize', 'BZD');
INSERT INTO `currency_mcc` VALUES ('101', '350', '美洲', 'America', '百慕大', 'Bermuda', 'BMD');
INSERT INTO `currency_mcc` VALUES ('102', '736', '美洲', 'America', '玻利维亚', 'Bolivia', 'BOB');
INSERT INTO `currency_mcc` VALUES ('103', '724', '美洲', 'America', '巴西', 'Brazil', 'BRL');
INSERT INTO `currency_mcc` VALUES ('104', '302', '美洲', 'America', '加拿大', 'Canada', 'CAD');
INSERT INTO `currency_mcc` VALUES ('105', '346', '美洲', 'America', '开曼群岛', 'Cayman Islands', 'KYD');
INSERT INTO `currency_mcc` VALUES ('106', '730', '美洲', 'America', '智利', 'Chile', 'CLP');
INSERT INTO `currency_mcc` VALUES ('107', '732', '美洲', 'America', '哥伦比亚', 'Columbia', 'COP');
INSERT INTO `currency_mcc` VALUES ('108', '712', '美洲', 'America', '哥斯达黎加', 'Costa Rica', 'CRC');
INSERT INTO `currency_mcc` VALUES ('109', '368', '美洲', 'America', '古巴', 'Cuba', 'CUP');
INSERT INTO `currency_mcc` VALUES ('110', '370', '美洲', 'America', '多米尼加', 'Dominica', 'DOP');
INSERT INTO `currency_mcc` VALUES ('111', '740', '美洲', 'America', '厄瓜多尔', 'Ecuador', 'USD');
INSERT INTO `currency_mcc` VALUES ('112', '706', '美洲', 'America', '萨尔瓦多', 'El Salvador', 'SVC');
INSERT INTO `currency_mcc` VALUES ('113', '352', '美洲', 'America', '格林纳达', 'Grenada', 'XCD');
INSERT INTO `currency_mcc` VALUES ('114', '704', '美洲', 'America', '危地马拉', 'Guatemala', 'GTQ');
INSERT INTO `currency_mcc` VALUES ('115', '738', '美洲', 'America', '圭亚那', 'Guyana', 'GYD');
INSERT INTO `currency_mcc` VALUES ('116', '372', '美洲', 'America', '海地', 'Haiti', 'HTG');
INSERT INTO `currency_mcc` VALUES ('117', '708', '美洲', 'America', '洪都拉斯', 'Honduras', 'HNL');
INSERT INTO `currency_mcc` VALUES ('118', '338', '美洲', 'America', '牙买加', 'Jamaica', 'JMD');
INSERT INTO `currency_mcc` VALUES ('119', '334', '美洲', 'America', '墨西哥', 'Mexico', 'MXN');
INSERT INTO `currency_mcc` VALUES ('120', '362', '美洲', 'America', '荷属安的列斯', 'Netherlands Antilles', 'ANG');
INSERT INTO `currency_mcc` VALUES ('121', '710', '美洲', 'America', '尼加拉瓜', 'Nicaragua', 'NIO');
INSERT INTO `currency_mcc` VALUES ('122', '714', '美洲', 'America', '巴拿马', 'Panama', 'PAB');
INSERT INTO `currency_mcc` VALUES ('123', '744', '美洲', 'America', '巴拉圭', 'Paraguay', 'PYG');
INSERT INTO `currency_mcc` VALUES ('124', '716', '美洲', 'America', '秘鲁', 'Peru', 'PEN');
INSERT INTO `currency_mcc` VALUES ('125', '330', '美洲', 'America', '波多黎各', 'Puerto Rico', 'USD');
INSERT INTO `currency_mcc` VALUES ('126', '356', '美洲', 'America', '圣基茨和尼维斯', 'Saint Kitts and Nevis', 'XCD');
INSERT INTO `currency_mcc` VALUES ('127', '358', '美洲', 'America', '圣卢西亚', 'Saint Lucia', 'XCD');
INSERT INTO `currency_mcc` VALUES ('128', '746', '美洲', 'America', '苏里南', 'Surinam', 'SRG');
INSERT INTO `currency_mcc` VALUES ('129', '374', '美洲', 'America', '特立尼达和多巴哥', 'Trinidad and Tobago', 'TTD');
INSERT INTO `currency_mcc` VALUES ('130', '310', '美洲', 'America', '美国', 'United States', 'USD');
INSERT INTO `currency_mcc` VALUES ('131', '748', '美洲', 'America', '乌拉圭', 'Uruguay', 'UYU');
INSERT INTO `currency_mcc` VALUES ('132', '734', '美洲', 'America', '委内瑞拉', 'Venezuela', 'VEB');
INSERT INTO `currency_mcc` VALUES ('133', '623', '非洲', 'Africa', '中非', 'Africa', 'XAF');
INSERT INTO `currency_mcc` VALUES ('134', '603', '非洲', 'Africa', '阿尔及利亚', 'Algeria', 'DZD');
INSERT INTO `currency_mcc` VALUES ('135', '631', '非洲', 'Africa', '安哥拉', 'Angola', 'AOA');
INSERT INTO `currency_mcc` VALUES ('136', '616', '非洲', 'Africa', '贝宁', 'Benin', 'XOF');
INSERT INTO `currency_mcc` VALUES ('137', '652', '非洲', 'Africa', '博茨瓦纳', 'Botswana', 'BWP');
INSERT INTO `currency_mcc` VALUES ('138', '613', '非洲', 'Africa', '布基纳法索（上沃尔特）', 'Burkina Faso', 'XOF');
INSERT INTO `currency_mcc` VALUES ('139', '642', '非洲', 'Africa', '布隆迪', 'Burundi', 'BIF');
INSERT INTO `currency_mcc` VALUES ('140', '624', '非洲', 'Africa', '喀麦隆', 'Cameroon', 'XAF');
INSERT INTO `currency_mcc` VALUES ('141', '625', '非洲', 'Africa', '佛得角', 'Cape Verde', 'CVE');
INSERT INTO `currency_mcc` VALUES ('142', '623', '非洲', 'Africa', '中非经济与货币共同体', 'Central African Economic and Monetary Community', 'XAF');
INSERT INTO `currency_mcc` VALUES ('143', '622', '非洲', 'Africa', '乍得', 'Chad', 'XAF');
INSERT INTO `currency_mcc` VALUES ('144', '654', '非洲', 'Africa', '科摩罗', 'Comoros', 'KMF');
INSERT INTO `currency_mcc` VALUES ('145', '629', '非洲', 'Africa', '刚果', 'Congo', 'XAF');
INSERT INTO `currency_mcc` VALUES ('146', '612', '非洲', 'Africa', '科特迪瓦', 'Côte d\'Ivoire', 'XOF');
INSERT INTO `currency_mcc` VALUES ('147', '638', '非洲', 'Africa', '吉布提', 'Djibouti', 'DJF');
INSERT INTO `currency_mcc` VALUES ('148', '602', '非洲', 'Africa', '埃及', 'Egypt', 'EGP');
INSERT INTO `currency_mcc` VALUES ('149', '627', '非洲', 'Africa', '赤道几内亚', 'Equatorial Guinea', 'XAF');
INSERT INTO `currency_mcc` VALUES ('150', '657', '非洲', 'Africa', '厄立特里亚', 'Eritrea', 'ERN');
INSERT INTO `currency_mcc` VALUES ('151', '636', '非洲', 'Africa', '埃塞俄比亚', 'Ethiopia', 'ETB');
INSERT INTO `currency_mcc` VALUES ('152', '628', '非洲', 'Africa', '加蓬', 'Gabon', 'XAF');
INSERT INTO `currency_mcc` VALUES ('153', '607', '非洲', 'Africa', '冈比亚', 'Gambia', 'GMD');
INSERT INTO `currency_mcc` VALUES ('154', '620', '非洲', 'Africa', '加纳', 'Ghana', 'GHS');
INSERT INTO `currency_mcc` VALUES ('155', '611', '非洲', 'Africa', '几内亚', 'Guinea', 'GNF');
INSERT INTO `currency_mcc` VALUES ('156', '632', '非洲', 'Africa', '几内亚比绍', 'Guinea-Bissau', 'XOF');
INSERT INTO `currency_mcc` VALUES ('157', '639', '非洲', 'Africa', '肯尼亚', 'Kenya', 'KES');
INSERT INTO `currency_mcc` VALUES ('158', '651', '非洲', 'Africa', '莱索托', 'Lesotho', 'LSL');
INSERT INTO `currency_mcc` VALUES ('159', '618', '非洲', 'Africa', '利比里亚', 'Liberia', 'LRD');
INSERT INTO `currency_mcc` VALUES ('160', '606', '非洲', 'Africa', '利比亚', 'Libya', 'LYD');
INSERT INTO `currency_mcc` VALUES ('161', '646', '非洲', 'Africa', '马达加斯加', 'Madagascar', 'MGA');
INSERT INTO `currency_mcc` VALUES ('162', '650', '非洲', 'Africa', '马拉维', 'Malawi', 'MWK');
INSERT INTO `currency_mcc` VALUES ('163', '609', '非洲', 'Africa', '毛里塔尼亚', 'Mauritania', 'MRO');
INSERT INTO `currency_mcc` VALUES ('164', '617', '非洲', 'Africa', '毛里求斯', 'Mauritius', 'MUR');
INSERT INTO `currency_mcc` VALUES ('165', '604', '非洲', 'Africa', '摩洛哥', 'Morocco', 'MAD');
INSERT INTO `currency_mcc` VALUES ('166', '643', '非洲', 'Africa', '莫桑比克', 'Mozambique', 'MZN');
INSERT INTO `currency_mcc` VALUES ('167', '649', '非洲', 'Africa', '纳米比亚', 'Namibia', 'NAD');
INSERT INTO `currency_mcc` VALUES ('168', '614', '非洲', 'Africa', '尼日尔', 'Niger', 'XOF');
INSERT INTO `currency_mcc` VALUES ('169', '621', '非洲', 'Africa', '尼日利亚', 'Nigeria', 'NGN');
INSERT INTO `currency_mcc` VALUES ('170', '635', '非洲', 'Africa', '卢旺达', 'Rwanda', 'RWF');
INSERT INTO `currency_mcc` VALUES ('171', '655', '非洲', 'Africa', '南非', 'S.Africa', 'ZAR');
INSERT INTO `currency_mcc` VALUES ('172', '999', '非洲', 'Africa', '圣赫勒拿群岛', 'Saint Helena', 'SHP');
INSERT INTO `currency_mcc` VALUES ('173', '626', '非洲', 'Africa', '圣多美和普林西比', 'Sao Tome and Principe', 'STD');
INSERT INTO `currency_mcc` VALUES ('174', '608', '非洲', 'Africa', '塞内加尔', 'Senegal', 'XOF');
INSERT INTO `currency_mcc` VALUES ('175', '633', '非洲', 'Africa', '塞舌尔', 'Seychelles', 'SCR');
INSERT INTO `currency_mcc` VALUES ('176', '619', '非洲', 'Africa', '塞拉利昂', 'Sierra Leone', 'SLL');
INSERT INTO `currency_mcc` VALUES ('177', '619', '非洲', 'Africa', '塞拉利昂', 'Sierra Leone', 'SLL');
INSERT INTO `currency_mcc` VALUES ('178', '637', '非洲', 'Africa', '索马里', 'Somalia', 'SOS');
INSERT INTO `currency_mcc` VALUES ('179', '637', '非洲', 'Africa', '索马里兰', 'Somaliland', 'None');
INSERT INTO `currency_mcc` VALUES ('180', '655', '非洲', 'Africa', '南非', 'South Africa', 'ZAR');
INSERT INTO `currency_mcc` VALUES ('181', '634', '非洲', 'Africa', '苏丹', 'Sudan', 'SDG');
INSERT INTO `currency_mcc` VALUES ('182', '653', '非洲', 'Africa', '斯威士兰', 'Swaziland', 'SZL');
INSERT INTO `currency_mcc` VALUES ('183', '640', '非洲', 'Africa', '坦桑尼亚', 'Tanzania', 'TZS');
INSERT INTO `currency_mcc` VALUES ('184', '640', '非洲', 'Africa', '坦桑尼亚', 'Tanzania', 'TZS');
INSERT INTO `currency_mcc` VALUES ('185', '615', '非洲', 'Africa', '多哥', 'Togo', 'XOF');
INSERT INTO `currency_mcc` VALUES ('186', '605', '非洲', 'Africa', '突尼斯', 'Tunisia', 'TND');
INSERT INTO `currency_mcc` VALUES ('187', '641', '非洲', 'Africa', '乌干达', 'Uganda', 'UGX');
INSERT INTO `currency_mcc` VALUES ('188', '999', '非洲', 'Africa', '西非经济货币联盟', 'West African Economic and Monetary Union', 'XOF');
INSERT INTO `currency_mcc` VALUES ('189', '999', '非洲', 'Africa', '西撒哈拉', 'Western Sahara', 'MAD');
INSERT INTO `currency_mcc` VALUES ('190', '630', '非洲', 'Africa', '扎伊尔（刚果（金））', 'Zaire', 'CDF');
INSERT INTO `currency_mcc` VALUES ('191', '645', '非洲', 'Africa', '赞比亚', 'Zambia', 'ZMK');
INSERT INTO `currency_mcc` VALUES ('192', '648', '非洲', 'Africa', '津巴布韦', 'Zimbabwe', 'ZWD');
INSERT INTO `currency_mcc` VALUES ('193', '999', '非洲', 'Africa', '南苏丹', 'South Sudan', 'SSD');
INSERT INTO `currency_mcc` VALUES ('194', '505', '大洋洲', 'Oceania', '澳大利亚', 'Australia', 'AUD');
INSERT INTO `currency_mcc` VALUES ('195', '548', '大洋洲', 'Oceania', '库克群岛', 'Cook Islands', 'NZD');
INSERT INTO `currency_mcc` VALUES ('196', '542', '大洋洲', 'Oceania', '斐济', 'Fiji', 'FJD');
INSERT INTO `currency_mcc` VALUES ('197', '545', '大洋洲', 'Oceania', '基里巴斯', 'Kiribati', 'KMP');
INSERT INTO `currency_mcc` VALUES ('198', '536', '大洋洲', 'Oceania', '瑙鲁', 'Nauru', 'AUD');
INSERT INTO `currency_mcc` VALUES ('199', '530', '大洋洲', 'Oceania', '新西兰', 'New Zealand', 'NZD');
INSERT INTO `currency_mcc` VALUES ('200', '555', '大洋洲', 'Oceania', '纽埃', 'Niue', 'NZD');
INSERT INTO `currency_mcc` VALUES ('201', '552', '大洋洲', 'Oceania', '帕劳', 'Palau', 'USD');
INSERT INTO `currency_mcc` VALUES ('202', '537', '大洋洲', 'Oceania', '巴布亚新几内亚', 'Papua New Guinea', 'PGK');
INSERT INTO `currency_mcc` VALUES ('203', '549', '大洋洲', 'Oceania', '萨摩亚', 'Samoa', 'WST');
INSERT INTO `currency_mcc` VALUES ('204', '540', '大洋洲', 'Oceania', '所罗门群岛', 'Solomon Islands', 'SBD');
INSERT INTO `currency_mcc` VALUES ('205', '550', '大洋洲', 'Oceania', '密克罗尼西亚联邦', 'The Federated States of Micronesia', 'USD');
INSERT INTO `currency_mcc` VALUES ('206', '999', '大洋洲', 'Oceania', '马绍尔群岛共和国', 'The Republic of the Marshall Islands', 'USD');
INSERT INTO `currency_mcc` VALUES ('207', '539', '大洋洲', 'Oceania', '汤加', 'Tonga', 'TOP');
INSERT INTO `currency_mcc` VALUES ('208', '553', '大洋洲', 'Oceania', '图瓦卢', 'Tuvalu', 'AUD');
INSERT INTO `currency_mcc` VALUES ('209', '541', '大洋洲', 'Oceania', '瓦努阿图', 'Vanuatu', 'VUV');

-- ----------------------------
-- Table structure for gmobi_sms
-- ----------------------------
DROP TABLE IF EXISTS `gmobi_sms`;
CREATE TABLE `gmobi_sms` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `operator` varchar(128) DEFAULT NULL,
  `network` varchar(128) DEFAULT NULL,
  `msn` varchar(128) DEFAULT NULL,
  `msg_f` varchar(128) DEFAULT NULL,
  `sno` varchar(128) DEFAULT NULL,
  `uid` varchar(128) DEFAULT NULL,
  `channel_id` varchar(128) DEFAULT NULL,
  `country` varchar(128) DEFAULT NULL,
  `service` varchar(128) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `msisdn` varchar(128) DEFAULT NULL COMMENT '运营商号码',
  `msg_t` varchar(128) DEFAULT NULL,
  `keyword` varchar(128) DEFAULT NULL,
  `app_id` varchar(128) DEFAULT NULL,
  `price_no` varchar(128) DEFAULT NULL COMMENT '计费点',
  `price_local` varchar(128) DEFAULT NULL COMMENT '当地价格',
  `imsi` varchar(32) DEFAULT NULL,
  `imei` varchar(32) DEFAULT NULL,
  `mo_no` varchar(128) DEFAULT NULL COMMENT '上行短信序号',
  `errmsg` varchar(128) DEFAULT NULL,
  `over_status` varchar(1) DEFAULT NULL COMMENT '来源状态正对第二次请求，1本地有，2本地没有',
  `status` varchar(3) DEFAULT NULL COMMENT '上游短信订单状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建订单时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新状态时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gmobi_sms
-- ----------------------------
INSERT INTO `gmobi_sms` VALUES ('4', null, '', '', null, '', null, null, null, null, null, null, null, null, null, null, null, null, null, '160902170348525', null, '0', '0', '2016-08-02 16:24:07', '2016-09-02 16:24:41');
INSERT INTO `gmobi_sms` VALUES ('5', null, '', '', null, '', null, null, null, null, null, null, null, null, null, null, null, null, null, '160902170404839', null, '0', '3', '2016-08-10 16:24:14', '2016-09-02 16:24:47');
INSERT INTO `gmobi_sms` VALUES ('6', null, '', '', null, '', null, null, null, null, null, null, null, null, null, null, null, null, null, '160902170413310', null, '0', '4', '2016-09-02 16:24:28', '2016-09-02 16:24:49');
INSERT INTO `gmobi_sms` VALUES ('7', 'Mobistar', 'PREPAID', '66815589973', 'FOR GMOBI1 skydomain#A14720101531302#C2785141926#P14721095934503#2.00#20610753224#206107532221#160902170445834', '3236', '160902170422746', 'C2785141927', 'Belgium', '4028', '2016-09-02 17:18:06', '66875716314', 'FOR GMOBI1 skydomain#A14720101531302#C2785141926#P14721095934503#2.00#20610753224#206107532221#160902170445834', 'FOR GMOBI1 skydomain', 'A14720102465886', 'P14721095934503', '1.00', '20610753224', '206107532221', '160902170422746', null, '2', '-1', '2016-09-02 16:24:33', '2016-09-02 16:24:52');
INSERT INTO `gmobi_sms` VALUES ('8', 'Mobistar', 'PREPAID', '66815589973', 'FOR GMOBI1 skydomain#A14720101531301#C2785141927#P14721095934503#1.00#20610753222#206107532221#160902170445834', '3236', '160902170422746', 'C2785141927', 'Belgium', '4028', '2016-09-09 17:18:10', '66875716314', 'FOR GMOBI1 skydomain#A14720101531301#C2785141927#P14721095934503#1.00#20610753222#206107532221#160902170445834', 'FOR GMOBI1 skydomain', 'A14720102465886', 'P14721095934503', '1.00', '20610753222', '206107532221', '160902170436544', null, '2', '1', '2016-09-02 16:24:37', '2016-09-02 16:24:56');
INSERT INTO `gmobi_sms` VALUES ('9', 'Mobistar', 'PREPAID', '66815589973', 'TXT GMOBI2 skydomain#A14720101531302#C2785141927#P14721966492593#1.00#20610753221#206107532221#160902170445834', '6486', '160902170422746', 'C2785141926', 'Belgium', '4028', '2016-09-02 17:18:14', '66875716314', 'TXT GMOBI2 skydomain#A14720101531302#C2785141927#P14721966492593#1.00#20610753221#206107532221#160902170445834', 'TXT GMOBI2 skydomain', 'A14720101531302', 'P14721966492593', '2.00', '20610753221', '206107532221', '160902170445834', null, '2', '2', '2016-09-01 17:25:21', '2016-09-02 17:25:26');

-- ----------------------------
-- Table structure for operation_conf
-- ----------------------------
DROP TABLE IF EXISTS `operation_conf`;
CREATE TABLE `operation_conf` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `price_service` varchar(128) DEFAULT NULL COMMENT '计费提供商',
  `country` varchar(255) DEFAULT NULL,
  `operator` varchar(255) DEFAULT NULL,
  `short_code` varchar(255) DEFAULT NULL,
  `local_price` decimal(10,2) DEFAULT NULL,
  `mcc` varchar(255) DEFAULT NULL,
  `mnc` varchar(255) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `create_user` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1673 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_conf
-- ----------------------------
INSERT INTO `operation_conf` VALUES ('2', 'GM', 'Belgium', 'Proximus', '6486', '2.00', '206', '01', 'TXT GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('3', 'GM', 'Belgium', 'Mobistar', '3236', '1.00', '206', '10', 'FOR GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('4', 'GM', 'Belgium', 'Mobistar', '6486', '2.00', '206', '10', 'TXT GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('5', 'GM', 'Belgium', 'Telenet', '3236', '1.00', '206', '05', 'FOR GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('6', 'GM', 'Belgium', 'Telenet', '6486', '2.00', '206', '05', 'TXT GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('7', 'GM', 'Belgium', 'BASE', '3236', '1.00', '206', '20', 'FOR GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('8', 'GM', 'Belgium', 'BASE', '6486', '2.00', '206', '20', 'TXT GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('9', 'GM', 'Denmark', 'TDC', '1999', '10.00', '238', '01', 'TXT GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('10', 'GM', 'Denmark', 'TDC', '1999', '10.00', '238', '10', 'TXT GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('11', 'GM', 'Denmark', 'TDC', '1999', '10.00', '238', '12', 'TXT GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('12', 'GM', 'Denmark', 'TDC', '1999', '15.00', '238', '01', 'TXT GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('13', 'GM', 'Denmark', 'TDC', '1999', '15.00', '238', '10', 'TXT GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('14', 'GM', 'Denmark', 'TDC', '1999', '15.00', '238', '12', 'TXT GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('15', 'GM', 'Denmark', 'Telenor', '1999', '10.00', '238', '02', 'TXT GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('16', 'GM', 'Denmark', 'Telenor', '1999', '10.00', '238', '77', 'TXT GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('17', 'GM', 'Denmark', 'Telenor', '1999', '15.00', '238', '02', 'TXT GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('18', 'GM', 'Denmark', 'Telenor', '1999', '15.00', '238', '77', 'TXT GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('19', 'GM', 'Denmark', 'Telia', '1999', '10.00', '238', '20', 'TXT GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('20', 'GM', 'Denmark', 'Telia', '1999', '10.00', '238', '30', 'TXT GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('21', 'GM', 'Denmark', 'Telia', '1999', '15.00', '238', '20', 'TXT GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('22', 'GM', 'Denmark', 'Telia', '1999', '15.00', '238', '30', 'TXT GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('23', 'GM', 'Denmark', 'Tre', '1999', '10.00', '238', '06', 'TXT GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('24', 'GM', 'Denmark', 'Tre', '1999', '15.00', '238', '06', 'TXT GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('25', 'GM', 'Egypt', 'Vodafone', '91122', '1.00', '602', '02', 'TXT GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('26', 'GM', 'Egypt', 'Vodafone', '95125', '5.00', '602', '02', 'TXT GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('27', 'GM', 'Egypt', 'Mobinil', '91122', '1.00', '602', '01', 'TXT GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('28', 'GM', 'Egypt', 'Mobinil', '95125', '5.00', '602', '01', 'TXT GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('29', 'GM', 'Egypt', 'Etisalat', '91122', '1.00', '602', '03', 'TXT GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('30', 'GM', 'Egypt', 'Etisalat', '95125', '5.00', '602', '03', 'TXT GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('31', 'GM', 'Finland', 'Sonera', '17163', '0.50', '244', '91', 'TXT05 GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('32', 'GM', 'Finland', 'Sonera', '17163', '2.00', '244', '91', 'TXT2 GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('33', 'GM', 'Finland', 'Saunalahti', '17163', '0.50', '244', '21', 'TXT05 GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('34', 'GM', 'Finland', 'Saunalahti', '17163', '2.00', '244', '21', 'TXT2 GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('35', 'GM', 'Finland', 'Elisa', '17163', '0.50', '244', '05', 'TXT05 GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('36', 'GM', 'Finland', 'Elisa', '17163', '2.00', '244', '05', 'TXT2 GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('37', 'GM', 'Finland', 'DNA', '17163', '0.50', '244', '03', 'TXT05 GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('38', 'GM', 'Finland', 'DNA', '17163', '0.50', '244', '04', 'TXT05 GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('39', 'GM', 'Finland', 'DNA', '17163', '0.50', '244', '12', 'TXT05 GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('40', 'GM', 'Finland', 'DNA', '17163', '2.00', '244', '03', 'TXT2 GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('41', 'GM', 'Finland', 'DNA', '17163', '2.00', '244', '04', 'TXT2 GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('42', 'GM', 'Finland', 'DNA', '17163', '2.00', '244', '12', 'TXT2 GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('43', 'GM', 'Finland', 'AMT', '17163', '0.50', '244', '14', 'TXT05 GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('44', 'GM', 'Finland', 'AMT', '17163', '2.00', '244', '14', 'TXT2 GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('45', 'GM', 'France', 'Virgin Mobile', '61071', '0.35', '208', '23', 'TXT GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('46', 'GM', 'France', 'Virgin Mobile', '81029', '2.00', '208', '23', 'TAT GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('47', 'GM', 'France', 'SFR', '61071', '0.35', '208', '10', 'TXT GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('48', 'GM', 'France', 'SFR', '61071', '0.35', '208', '11', 'TXT GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('49', 'GM', 'France', 'SFR', '61071', '0.35', '208', '13', 'TXT GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('50', 'GM', 'France', 'SFR', '81029', '2.00', '208', '10', 'TAT GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('51', 'GM', 'France', 'SFR', '81029', '2.00', '208', '11', 'TAT GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('52', 'GM', 'France', 'SFR', '81029', '2.00', '208', '13', 'TAT GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('53', 'GM', 'France', 'Bouygues', '61071', '0.35', '208', '20', 'TXT GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('54', 'GM', 'France', 'Bouygues', '61071', '0.35', '208', '21', 'TXT GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('55', 'GM', 'France', 'Bouygues', '61071', '0.35', '208', '25', 'TXT GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('56', 'GM', 'France', 'Bouygues', '61071', '0.35', '208', '88', 'TXT GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('57', 'GM', 'France', 'Bouygues', '81029', '2.00', '208', '20', 'TAT GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('58', 'GM', 'France', 'Bouygues', '81029', '2.00', '208', '21', 'TAT GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('59', 'GM', 'France', 'Bouygues', '81029', '2.00', '208', '25', 'TAT GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('60', 'GM', 'France', 'Bouygues', '81029', '2.00', '208', '88', 'TAT GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('61', 'GM', 'France', 'Free Mobile', '61071', '0.35', '208', '14', 'TXT GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('62', 'GM', 'France', 'Free Mobile', '61071', '0.35', '208', '15', 'TXT GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('63', 'GM', 'France', 'Free Mobile', '81029', '2.00', '208', '14', 'TAT GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('64', 'GM', 'France', 'Free Mobile', '81029', '2.00', '208', '15', 'TAT GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('65', 'GM', 'France', 'NRJ Mobile', '61071', '0.35', '208', '26', 'TXT GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('66', 'GM', 'France', 'NRJ Mobile', '81029', '2.00', '208', '26', 'TAT GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('67', 'GM', 'France', 'Orange', '61071', '0.35', '208', '01', 'TXT GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('68', 'GM', 'France', 'Orange', '61071', '0.35', '208', '02', 'TXT GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('69', 'GM', 'France', 'Orange', '81029', '2.00', '208', '01', 'TAT GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('70', 'GM', 'France', 'Orange', '81029', '2.00', '208', '02', 'TAT GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('71', 'GM', 'Germany', 'Vodafone', '89000', '0.49', '262', '02', 'FOR05 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('72', 'GM', 'Germany', 'Vodafone', '89000', '0.49', '262', '04', 'FOR05 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('73', 'GM', 'Germany', 'Vodafone', '89000', '0.49', '262', '09', 'FOR05 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('74', 'GM', 'Germany', 'Vodafone', '89000', '0.99', '262', '02', 'FOR GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('75', 'GM', 'Germany', 'Vodafone', '89000', '0.99', '262', '04', 'FOR GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('76', 'GM', 'Germany', 'Vodafone', '89000', '0.99', '262', '09', 'FOR GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('77', 'GM', 'Germany', 'Vodafone', '89000', '1.99', '262', '02', 'FOR2 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('78', 'GM', 'Germany', 'Vodafone', '89000', '1.99', '262', '04', 'FOR2 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('79', 'GM', 'Germany', 'Vodafone', '89000', '1.99', '262', '09', 'FOR2 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('80', 'GM', 'Germany', 'Vodafone', '89000', '2.99', '262', '02', ' FOR3 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('81', 'GM', 'Germany', 'Vodafone', '89000', '2.99', '262', '04', ' FOR3 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('82', 'GM', 'Germany', 'Vodafone', '89000', '2.99', '262', '09', ' FOR3 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('83', 'GM', 'Germany', 'Vodafone', '89000', '3.99', '262', '02', 'FOR4 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('84', 'GM', 'Germany', 'Vodafone', '89000', '3.99', '262', '04', 'FOR4 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('85', 'GM', 'Germany', 'Vodafone', '89000', '3.99', '262', '09', 'FOR4 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('86', 'GM', 'Germany', 'Vodafone', '89000', '4.99', '262', '02', 'FOR5 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('87', 'GM', 'Germany', 'Vodafone', '89000', '4.99', '262', '04', 'FOR5 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('88', 'GM', 'Germany', 'Vodafone', '89000', '4.99', '262', '09', 'FOR5 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('89', 'GM', 'Germany', 'Vodafone', '89000', '7.99', '262', '02', 'FOR8 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('90', 'GM', 'Germany', 'Vodafone', '89000', '7.99', '262', '04', 'FOR8 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('91', 'GM', 'Germany', 'Vodafone', '89000', '7.99', '262', '09', 'FOR8 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('92', 'GM', 'Germany', 'Vodafone', '89000', '9.99', '262', '02', 'FOR10 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('93', 'GM', 'Germany', 'Vodafone', '89000', '9.99', '262', '04', 'FOR10 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('94', 'GM', 'Germany', 'Vodafone', '89000', '9.99', '262', '09', 'FOR10 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('95', 'GM', 'Germany', 'T-Mobile', '89000', '0.49', '262', '01', 'FOR05 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('96', 'GM', 'Germany', 'T-Mobile', '89000', '0.49', '262', '06', 'FOR05 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('97', 'GM', 'Germany', 'T-Mobile', '89000', '0.99', '262', '01', 'FOR GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('98', 'GM', 'Germany', 'T-Mobile', '89000', '0.99', '262', '06', 'FOR GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('99', 'GM', 'Germany', 'T-Mobile', '89000', '1.99', '262', '01', 'FOR2 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('100', 'GM', 'Germany', 'T-Mobile', '89000', '1.99', '262', '06', 'FOR2 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('101', 'GM', 'Germany', 'T-Mobile', '89000', '2.99', '262', '01', ' FOR3 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('102', 'GM', 'Germany', 'T-Mobile', '89000', '2.99', '262', '06', ' FOR3 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('103', 'GM', 'Germany', 'T-Mobile', '89000', '3.99', '262', '01', 'FOR4 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('104', 'GM', 'Germany', 'T-Mobile', '89000', '3.99', '262', '06', 'FOR4 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('105', 'GM', 'Germany', 'T-Mobile', '89000', '4.99', '262', '01', 'FOR5 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('106', 'GM', 'Germany', 'T-Mobile', '89000', '4.99', '262', '06', 'FOR5 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('107', 'GM', 'Germany', 'T-Mobile', '89000', '7.99', '262', '01', 'FOR8 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('108', 'GM', 'Germany', 'T-Mobile', '89000', '7.99', '262', '06', 'FOR8 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('109', 'GM', 'Germany', 'T-Mobile', '89000', '9.99', '262', '01', 'FOR10 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('110', 'GM', 'Germany', 'T-Mobile', '89000', '9.99', '262', '06', 'FOR10 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('111', 'GM', 'Germany', 'O2', '89000', '0.49', '262', '07', 'FOR05 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('112', 'GM', 'Germany', 'O2', '89000', '0.49', '262', '08', 'FOR05 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('113', 'GM', 'Germany', 'O2', '89000', '0.49', '262', '11', 'FOR05 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('114', 'GM', 'Germany', 'O2', '89000', '0.49', '262', '12', 'FOR05 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('115', 'GM', 'Germany', 'O2', '89000', '0.99', '262', '07', 'FOR GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('116', 'GM', 'Germany', 'O2', '89000', '0.99', '262', '08', 'FOR GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('117', 'GM', 'Germany', 'O2', '89000', '0.99', '262', '11', 'FOR GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('118', 'GM', 'Germany', 'O2', '89000', '0.99', '262', '12', 'FOR GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('119', 'GM', 'Germany', 'O2', '89000', '1.99', '262', '07', 'FOR2 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('120', 'GM', 'Germany', 'O2', '89000', '1.99', '262', '08', 'FOR2 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('121', 'GM', 'Germany', 'O2', '89000', '1.99', '262', '11', 'FOR2 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('122', 'GM', 'Germany', 'O2', '89000', '1.99', '262', '12', 'FOR2 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('123', 'GM', 'Germany', 'O2', '89000', '2.99', '262', '07', ' FOR3 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('124', 'GM', 'Germany', 'O2', '89000', '2.99', '262', '08', ' FOR3 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('125', 'GM', 'Germany', 'O2', '89000', '2.99', '262', '11', ' FOR3 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('126', 'GM', 'Germany', 'O2', '89000', '2.99', '262', '12', ' FOR3 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('127', 'GM', 'Germany', 'O2', '89000', '3.99', '262', '07', 'FOR4 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('128', 'GM', 'Germany', 'O2', '89000', '3.99', '262', '08', 'FOR4 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('129', 'GM', 'Germany', 'O2', '89000', '3.99', '262', '11', 'FOR4 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('130', 'GM', 'Germany', 'O2', '89000', '3.99', '262', '12', 'FOR4 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('131', 'GM', 'Germany', 'O2', '89000', '4.99', '262', '07', 'FOR5 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('132', 'GM', 'Germany', 'O2', '89000', '4.99', '262', '08', 'FOR5 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('133', 'GM', 'Germany', 'O2', '89000', '4.99', '262', '11', 'FOR5 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('134', 'GM', 'Germany', 'O2', '89000', '4.99', '262', '12', 'FOR5 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('135', 'GM', 'Germany', 'O2', '89000', '7.99', '262', '07', 'FOR8 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('136', 'GM', 'Germany', 'O2', '89000', '7.99', '262', '08', 'FOR8 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('137', 'GM', 'Germany', 'O2', '89000', '7.99', '262', '11', 'FOR8 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('138', 'GM', 'Germany', 'O2', '89000', '7.99', '262', '12', 'FOR8 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('139', 'GM', 'Germany', 'O2', '89000', '9.99', '262', '07', 'FOR10 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('140', 'GM', 'Germany', 'O2', '89000', '9.99', '262', '08', 'FOR10 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('141', 'GM', 'Germany', 'O2', '89000', '9.99', '262', '11', 'FOR10 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('142', 'GM', 'Germany', 'O2', '89000', '9.99', '262', '12', 'FOR10 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('143', 'GM', 'Germany', 'Mobilcom-Debitel', '89000', '0.49', '262', '901', 'FOR05 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('144', 'GM', 'Germany', 'Mobilcom-Debitel', '89000', '0.49', '262', '13', 'FOR05 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('145', 'GM', 'Germany', 'Mobilcom-Debitel', '89000', '0.99', '262', '901', 'FOR GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('146', 'GM', 'Germany', 'Mobilcom-Debitel', '89000', '0.99', '262', '13', 'FOR GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('147', 'GM', 'Germany', 'Mobilcom-Debitel', '89000', '1.99', '262', '901', 'FOR2 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('148', 'GM', 'Germany', 'Mobilcom-Debitel', '89000', '1.99', '262', '13', 'FOR2 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('149', 'GM', 'Germany', 'Mobilcom-Debitel', '89000', '2.99', '262', '901', ' FOR3 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('150', 'GM', 'Germany', 'Mobilcom-Debitel', '89000', '2.99', '262', '13', ' FOR3 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('151', 'GM', 'Germany', 'Mobilcom-Debitel', '89000', '3.99', '262', '901', 'FOR4 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('152', 'GM', 'Germany', 'Mobilcom-Debitel', '89000', '3.99', '262', '13', 'FOR4 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('153', 'GM', 'Germany', 'Mobilcom-Debitel', '89000', '4.99', '262', '901', 'FOR5 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('154', 'GM', 'Germany', 'Mobilcom-Debitel', '89000', '4.99', '262', '13', 'FOR5 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('155', 'GM', 'Germany', 'Mobilcom-Debitel', '89000', '7.99', '262', '901', 'FOR8 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('156', 'GM', 'Germany', 'Mobilcom-Debitel', '89000', '7.99', '262', '13', 'FOR8 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('157', 'GM', 'Germany', 'Mobilcom-Debitel', '89000', '9.99', '262', '901', 'FOR10 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('158', 'GM', 'Germany', 'Mobilcom-Debitel', '89000', '9.99', '262', '13', 'FOR10 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('159', 'GM', 'Germany', 'E-Plus', '89000', '0.49', '262', '03', 'FOR05 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('160', 'GM', 'Germany', 'E-Plus', '89000', '0.49', '262', '05', 'FOR05 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('161', 'GM', 'Germany', 'E-Plus', '89000', '0.49', '262', '77', 'FOR05 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('162', 'GM', 'Germany', 'E-Plus', '89000', '0.99', '262', '03', 'FOR GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('163', 'GM', 'Germany', 'E-Plus', '89000', '0.99', '262', '05', 'FOR GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('164', 'GM', 'Germany', 'E-Plus', '89000', '0.99', '262', '77', 'FOR GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('165', 'GM', 'Germany', 'E-Plus', '89000', '1.99', '262', '03', 'FOR2 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('166', 'GM', 'Germany', 'E-Plus', '89000', '1.99', '262', '05', 'FOR2 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('167', 'GM', 'Germany', 'E-Plus', '89000', '1.99', '262', '77', 'FOR2 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('168', 'GM', 'Germany', 'E-Plus', '89000', '2.99', '262', '03', ' FOR3 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('169', 'GM', 'Germany', 'E-Plus', '89000', '2.99', '262', '05', ' FOR3 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('170', 'GM', 'Germany', 'E-Plus', '89000', '2.99', '262', '77', ' FOR3 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('171', 'GM', 'Germany', 'E-Plus', '89000', '3.99', '262', '03', 'FOR4 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('172', 'GM', 'Germany', 'E-Plus', '89000', '3.99', '262', '05', 'FOR4 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('173', 'GM', 'Germany', 'E-Plus', '89000', '3.99', '262', '77', 'FOR4 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('174', 'GM', 'Germany', 'E-Plus', '89000', '4.99', '262', '03', 'FOR5 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('175', 'GM', 'Germany', 'E-Plus', '89000', '4.99', '262', '05', 'FOR5 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('176', 'GM', 'Germany', 'E-Plus', '89000', '4.99', '262', '77', 'FOR5 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('177', 'GM', 'Germany', 'E-Plus', '89000', '7.99', '262', '03', 'FOR8 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('178', 'GM', 'Germany', 'E-Plus', '89000', '7.99', '262', '05', 'FOR8 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('179', 'GM', 'Germany', 'E-Plus', '89000', '7.99', '262', '77', 'FOR8 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('180', 'GM', 'Germany', 'E-Plus', '89000', '9.99', '262', '03', 'FOR10 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('181', 'GM', 'Germany', 'E-Plus', '89000', '9.99', '262', '05', 'FOR10 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('182', 'GM', 'Germany', 'E-Plus', '89000', '9.99', '262', '77', 'FOR10 GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('183', 'GM', 'Greece', 'Wind', '54340', '0.62', '202', '09', 'TXT GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('184', 'GM', 'Greece', 'Wind', '54340', '0.62', '202', '10', 'TXT GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('185', 'GM', 'Greece', 'Wind', '54534', '1.48', '202', '09', 'TXT GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('186', 'GM', 'Greece', 'Wind', '54534', '1.48', '202', '10', 'TXT GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('187', 'GM', 'Greece', 'Vodafone', '54340', '0.62', '202', '05', 'TXT GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('188', 'GM', 'Greece', 'Vodafone', '54534', '1.48', '202', '05', 'TXT GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('189', 'GM', 'Greece', 'Cosmote', '54340', '0.62', '202', '01', 'TXT GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('190', 'GM', 'Greece', 'Cosmote', '54534', '1.48', '202', '01', 'TXT GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('191', 'GM', 'Indonesia', 'TELKOMSEL', '99787', '1100.00', '510', '10', 'DROID11 GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('192', 'GM', 'Indonesia', 'TELKOMSEL', '99787', '2200.00', '510', '10', 'DROID1 GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('193', 'GM', 'Indonesia', 'TELKOMSEL', '99787', '3300.00', '510', '10', 'DROID33 GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('194', 'GM', 'Indonesia', 'TELKOMSEL', '99787', '5500.00', '510', '10', 'DROID2 GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('195', 'GM', 'Indonesia', 'TELKOMSEL', '99787', '11000.00', '510', '10', 'DROID3 GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('196', 'GM', 'Indonesia', 'TELKOMSEL', '99787', '16500.00', '510', '10', 'DROID4 GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('197', 'GM', 'Indonesia', 'HUTCHISON', '99787', '1100.00', '510', '89', 'DROID11 GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('198', 'GM', 'Indonesia', 'HUTCHISON', '99787', '2200.00', '510', '89', 'DROID1 GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('199', 'GM', 'Indonesia', 'HUTCHISON', '99787', '3300.00', '510', '89', 'DROID33 GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('200', 'GM', 'Indonesia', 'HUTCHISON', '99787', '5500.00', '510', '89', 'DROID2 GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('201', 'GM', 'Indonesia', 'HUTCHISON', '99787', '11000.00', '510', '89', 'DROID3 GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('202', 'GM', 'Indonesia', 'HUTCHISON', '99787', '16500.00', '510', '89', 'DROID4 GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('203', 'GM', 'Indonesia', 'EXCELCOM', '99523', '1100.00', '510', '08', 'DROID11 GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('204', 'GM', 'Indonesia', 'EXCELCOM', '99523', '1100.00', '510', '11', 'DROID11 GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('205', 'GM', 'Indonesia', 'EXCELCOM', '99523', '2200.00', '510', '08', 'DROID1 GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('206', 'GM', 'Indonesia', 'EXCELCOM', '99523', '2200.00', '510', '11', 'DROID1 GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('207', 'GM', 'Indonesia', 'EXCELCOM', '99523', '3300.00', '510', '08', 'DROID33 GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('208', 'GM', 'Indonesia', 'EXCELCOM', '99523', '3300.00', '510', '11', 'DROID33 GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('209', 'GM', 'Indonesia', 'EXCELCOM', '99523', '5500.00', '510', '08', 'DROID2 GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('210', 'GM', 'Indonesia', 'EXCELCOM', '99523', '5500.00', '510', '11', 'DROID2 GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('211', 'GM', 'Indonesia', 'EXCELCOM', '99523', '11000.00', '510', '08', 'DROID3 GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('212', 'GM', 'Indonesia', 'EXCELCOM', '99523', '11000.00', '510', '11', 'DROID3 GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('213', 'GM', 'Indonesia', 'EXCELCOM', '99523', '16500.00', '510', '08', 'DROID4 GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('214', 'GM', 'Indonesia', 'EXCELCOM', '99523', '16500.00', '510', '11', 'DROID4 GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('215', 'GM', 'Israel', 'Orange', '5550', '2.00', '425', '01', 'T2 GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('216', 'GM', 'Israel', 'Orange', '5550', '10.00', '425', '01', 'T10 GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('217', 'GM', 'Israel', 'Pelephone', '5550', '2.00', '425', '03', 'T2 GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('218', 'GM', 'Israel', 'Pelephone', '5550', '10.00', '425', '03', 'T10 GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('219', 'GM', 'Israel', 'Cellcom', '5550', '2.00', '425', '02', 'T2 GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('220', 'GM', 'Israel', 'Cellcom', '5550', '10.00', '425', '02', 'T10 GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('221', 'GM', 'Malaysia', 'Maxis', '23110', '1.00', '502', '12', 'CENT1 GMG skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('222', 'GM', 'Malaysia', 'Maxis', '23110', '2.00', '502', '12', 'CENT2 GMG skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('223', 'GM', 'Malaysia', 'Maxis', '23110', '3.00', '502', '12', 'CENT3 GMG skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('224', 'GM', 'Malaysia', 'Maxis', '23110', '4.00', '502', '12', 'CENT4 GMG skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('225', 'GM', 'Malaysia', 'Maxis', '23110', '5.00', '502', '12', 'CENT5 GMG skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('226', 'GM', 'Malaysia', 'Maxis', '23110', '6.00', '502', '12', 'CENT6 GMG skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('227', 'GM', 'Malaysia', 'Maxis', '23110', '7.00', '502', '12', 'CENT7 GMG skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('228', 'GM', 'Malaysia', 'Maxis', '23110', '8.00', '502', '12', 'CENT8 GMG skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('229', 'GM', 'Malaysia', 'Maxis', '23110', '9.00', '502', '12', 'CENT9 GMG skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('230', 'GM', 'Malaysia', 'Maxis', '23110', '10.00', '502', '12', 'CENT10 GMG skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('231', 'GM', 'Malaysia', 'uMobile', '38788', '1.00', '502', '18', 'GEN1 GMG skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('232', 'GM', 'Malaysia', 'uMobile', '38788', '2.00', '502', '18', 'GEN2 GMG skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('233', 'GM', 'Malaysia', 'uMobile', '38788', '3.00', '502', '18', 'GEN3 GMG skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('234', 'GM', 'Malaysia', 'uMobile', '38788', '4.00', '502', '18', 'GEN4 GMG skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('235', 'GM', 'Malaysia', 'uMobile', '38788', '5.00', '502', '18', 'GEN5 GMG skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('236', 'GM', 'Malaysia', 'uMobile', '38788', '6.00', '502', '18', 'GEN6 GMG skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('237', 'GM', 'Malaysia', 'uMobile', '38788', '7.00', '502', '18', 'GEN7 GMG skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('238', 'GM', 'Malaysia', 'uMobile', '38788', '8.00', '502', '18', 'GEN8 GMG skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('239', 'GM', 'Malaysia', 'uMobile', '38788', '9.00', '502', '18', 'GEN9 GMG skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('240', 'GM', 'Malaysia', 'uMobile', '38788', '10.00', '502', '18', 'GEN10 GMG skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('241', 'GM', 'Pakistan', 'Mobilink', '3444', '10.00', '410', '01', 'MCN10GM 01 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('242', 'GM', 'Pakistan', 'Ufone', '3444', '10.00', '410', '03', 'MCN10GM 03 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('243', 'GM', 'Pakistan', 'Zong', '3444', '10.00', '410', '04', 'MCN10GM 04 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('244', 'GM', 'Pakistan', 'Telenor', '3444', '10.00', '410', '06', 'MCN10GM 06 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('245', 'GM', 'Pakistan', 'Warid', '3444', '10.00', '410', '07', 'MCN10GM 07 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('246', 'GM', 'Philippines', 'Globe', '2649', '2.50', '515', '2', 'CENT 2 GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('247', 'GM', 'Philippines', 'Globe', '2649', '5.00', '515', '2', 'CENT 5 GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('248', 'GM', 'Philippines', 'Globe', '2649', '10.00', '515', '2', 'CENT 10 GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('249', 'GM', 'Philippines', 'Globe', '2649', '15.00', '515', '2', 'CENT 15 GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('250', 'GM', 'Philippines', 'Globe', '2910', '20.00', '515', '2', 'CENT 20 GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('251', 'GM', 'Philippines', 'Globe', '2910', '40.00', '515', '2', 'CENT 40 GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('252', 'GM', 'Philippines', 'Globe', '2910', '60.00', '515', '2', 'CENT 60 GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('253', 'GM', 'Philippines', 'Globe', '2910', '80.00', '515', '2', 'CENT 80 GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('254', 'GM', 'Philippines', 'Globe', '2910', '100.00', '515', '2', 'CENT 100 GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('255', 'GM', 'Philippines', 'Globe', '2910', '200.00', '515', '2', 'CENT 200 GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('256', 'GM', 'Philippines', 'Globe', '2910', '300.00', '515', '2', 'CENT 300 GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('257', 'GM', 'Philippines', 'Globe', '2910', '400.00', '515', '2', 'CENT 400 GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('258', 'GM', 'Philippines', 'Globe', '2910', '500.00', '515', '2', 'CENT 500 GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('259', 'GM', 'Saudi Arabia', 'Zain', '758223', '5.00', '420', '04', 'TXT GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('260', 'GM', 'Saudi Arabia', 'Zain', '708260', '10.00', '420', '04', 'TXT GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('261', 'GM', 'Saudi Arabia', 'STC', '853660', '5.00', '420', '01', 'TXT GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('262', 'GM', 'Saudi Arabia', 'STC', '803574', '10.00', '420', '01', 'TXT GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('263', 'GM', 'Saudi Arabia', 'Mobily', '656162', '5.00', '420', '03', 'TXT GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('264', 'GM', 'Saudi Arabia', 'Mobily', '603568', '10.00', '420', '03', 'TXT GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('265', 'GM', 'South Africa', 'MTN', '32040', '1.00', '655', '10', 'GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('266', 'GM', 'South Africa', 'MTN', '47131', '2.00', '655', '10', 'GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('267', 'GM', 'South Africa', 'MTN', '47611', '3.00', '655', '10', 'GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('268', 'GM', 'South Africa', 'MTN', '31610', '5.00', '655', '10', 'GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('269', 'GM', 'South Africa', 'MTN', '37075', '7.50', '655', '10', 'GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('270', 'GM', 'South Africa', 'MTN', '38070', '10.00', '655', '10', 'GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('271', 'GM', 'South Africa', 'MTN', '39212', '15.00', '655', '10', 'GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('272', 'GM', 'South Africa', 'MTN', '40150', '20.00', '655', '10', 'GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('273', 'GM', 'South Africa', 'MTN', '41763', '25.00', '655', '10', 'GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('274', 'GM', 'South Africa', 'MTN', '42136', '30.00', '655', '10', 'GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('275', 'GM', 'South Africa', 'TELKOM', '32040', '1.00', '655', '2', 'GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('276', 'GM', 'South Africa', 'TELKOM', '47131', '2.00', '655', '2', 'GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('277', 'GM', 'South Africa', 'TELKOM', '47611', '3.00', '655', '2', 'GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('278', 'GM', 'South Africa', 'TELKOM', '31610', '5.00', '655', '2', 'GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('279', 'GM', 'South Africa', 'TELKOM', '37075', '7.50', '655', '2', 'GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('280', 'GM', 'South Africa', 'TELKOM', '38070', '10.00', '655', '2', 'GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('281', 'GM', 'South Africa', 'TELKOM', '39212', '15.00', '655', '2', 'GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('282', 'GM', 'South Africa', 'TELKOM', '40150', '20.00', '655', '2', 'GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('283', 'GM', 'South Africa', 'TELKOM', '41763', '25.00', '655', '2', 'GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('284', 'GM', 'South Africa', 'TELKOM', '42136', '30.00', '655', '2', 'GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('285', 'GM', 'South Africa', 'VODACOM', '32040', '1.00', '655', '1', 'GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('286', 'GM', 'South Africa', 'VODACOM', '47131', '2.00', '655', '1', 'GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('287', 'GM', 'South Africa', 'VODACOM', '47611', '3.00', '655', '1', 'GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('288', 'GM', 'South Africa', 'VODACOM', '31610', '5.00', '655', '1', 'GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('289', 'GM', 'South Africa', 'VODACOM', '37075', '7.50', '655', '1', 'GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('290', 'GM', 'South Africa', 'VODACOM', '38070', '10.00', '655', '1', 'GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('291', 'GM', 'South Africa', 'VODACOM', '39212', '15.00', '655', '1', 'GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('292', 'GM', 'South Africa', 'VODACOM', '40150', '20.00', '655', '1', 'GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('293', 'GM', 'South Africa', 'VODACOM', '41763', '25.00', '655', '1', 'GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('294', 'GM', 'South Africa', 'VODACOM', '42136', '30.00', '655', '1', 'GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('295', 'GM', 'South Africa', 'CELLC', '47131', '2.00', '655', '7', 'GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('296', 'GM', 'South Africa', 'CELLC', '47611', '3.00', '655', '7', 'GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('297', 'GM', 'South Africa', 'CELLC', '31610', '5.00', '655', '7', 'GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('298', 'GM', 'South Africa', 'CELLC', '37075', '7.50', '655', '7', 'GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('299', 'GM', 'South Africa', 'CELLC', '38070', '10.00', '655', '7', 'GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('300', 'GM', 'South Africa', 'CELLC', '39212', '15.00', '655', '7', 'GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('301', 'GM', 'South Africa', 'CELLC', '40150', '20.00', '655', '7', 'GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('302', 'GM', 'South Africa', 'CELLC', '41763', '25.00', '655', '7', 'GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('303', 'GM', 'South Africa', 'CELLC', '42136', '30.00', '655', '7', 'GMOBI skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('304', 'GM', 'Thailand', 'AIS', '4197002', '5.35', '520', '01', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('305', 'GM', 'Thailand', 'AIS', '4197002', '5.35', '520', '03', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('306', 'GM', 'Thailand', 'AIS', '4197002', '5.35', '520', '23', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('307', 'GM', 'Thailand', 'AIS', '4197003', '6.42', '520', '01', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('308', 'GM', 'Thailand', 'AIS', '4197003', '6.42', '520', '03', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('309', 'GM', 'Thailand', 'AIS', '4197003', '6.42', '520', '23', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('310', 'GM', 'Thailand', 'AIS', '4197004', '16.05', '520', '01', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('311', 'GM', 'Thailand', 'AIS', '4197004', '16.05', '520', '03', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('312', 'GM', 'Thailand', 'AIS', '4197004', '16.05', '520', '23', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('313', 'GM', 'Thailand', 'AIS', '4197005', '26.75', '520', '01', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('314', 'GM', 'Thailand', 'AIS', '4197005', '26.75', '520', '03', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('315', 'GM', 'Thailand', 'AIS', '4197005', '26.75', '520', '23', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('316', 'GM', 'Thailand', 'AIS', '4197006', '37.45', '520', '01', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('317', 'GM', 'Thailand', 'AIS', '4197006', '37.45', '520', '03', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('318', 'GM', 'Thailand', 'AIS', '4197006', '37.45', '520', '23', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('319', 'GM', 'Thailand', 'AIS', '4197007', '42.80', '520', '01', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('320', 'GM', 'Thailand', 'AIS', '4197007', '42.80', '520', '03', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('321', 'GM', 'Thailand', 'AIS', '4197007', '42.80', '520', '23', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('322', 'GM', 'Thailand', 'AIS', '4197010', '52.43', '520', '01', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('323', 'GM', 'Thailand', 'AIS', '4197010', '52.43', '520', '03', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('324', 'GM', 'Thailand', 'AIS', '4197010', '52.43', '520', '23', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('325', 'GM', 'Thailand', 'AIS', '4197008', '53.50', '520', '01', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('326', 'GM', 'Thailand', 'AIS', '4197008', '53.50', '520', '03', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('327', 'GM', 'Thailand', 'AIS', '4197008', '53.50', '520', '23', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('328', 'GM', 'Thailand', 'DTAC', '4197002', '5.35', '520', '05', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('329', 'GM', 'Thailand', 'DTAC', '4197002', '5.35', '520', '18', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('330', 'GM', 'Thailand', 'DTAC', '4197003', '6.42', '520', '05', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('331', 'GM', 'Thailand', 'DTAC', '4197003', '6.42', '520', '18', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('332', 'GM', 'Thailand', 'DTAC', '4197004', '16.05', '520', '05', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('333', 'GM', 'Thailand', 'DTAC', '4197004', '16.05', '520', '18', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('334', 'GM', 'Thailand', 'DTAC', '4197005', '26.75', '520', '05', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('335', 'GM', 'Thailand', 'DTAC', '4197005', '26.75', '520', '18', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('336', 'GM', 'Thailand', 'DTAC', '4197006', '37.45', '520', '05', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('337', 'GM', 'Thailand', 'DTAC', '4197006', '37.45', '520', '18', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('338', 'GM', 'Thailand', 'DTAC', '4197007', '42.80', '520', '05', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('339', 'GM', 'Thailand', 'DTAC', '4197007', '42.80', '520', '18', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('340', 'GM', 'Thailand', 'DTAC', '4197010', '52.43', '520', '05', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('341', 'GM', 'Thailand', 'DTAC', '4197010', '52.43', '520', '18', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('342', 'GM', 'Thailand', 'DTAC', '4197008', '53.50', '520', '05', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('343', 'GM', 'Thailand', 'DTAC', '4197008', '53.50', '520', '18', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('344', 'GM', 'Thailand', 'TRUEMOVE', '4197002', '5.35', '520', '00', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('345', 'GM', 'Thailand', 'TRUEMOVE', '4197002', '5.35', '520', '04', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('346', 'GM', 'Thailand', 'TRUEMOVE', '4197002', '5.35', '520', '99', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('347', 'GM', 'Thailand', 'TRUEMOVE', '4197003', '6.42', '520', '00', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('348', 'GM', 'Thailand', 'TRUEMOVE', '4197003', '6.42', '520', '04', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('349', 'GM', 'Thailand', 'TRUEMOVE', '4197003', '6.42', '520', '99', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('350', 'GM', 'Thailand', 'TRUEMOVE', '4197004', '16.05', '520', '00', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('351', 'GM', 'Thailand', 'TRUEMOVE', '4197004', '16.05', '520', '04', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('352', 'GM', 'Thailand', 'TRUEMOVE', '4197004', '16.05', '520', '99', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('353', 'GM', 'Thailand', 'TRUEMOVE', '4197005', '26.75', '520', '00', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('354', 'GM', 'Thailand', 'TRUEMOVE', '4197005', '26.75', '520', '04', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('355', 'GM', 'Thailand', 'TRUEMOVE', '4197005', '26.75', '520', '99', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('356', 'GM', 'Thailand', 'TRUEMOVE', '4197006', '37.45', '520', '00', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('357', 'GM', 'Thailand', 'TRUEMOVE', '4197006', '37.45', '520', '04', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('358', 'GM', 'Thailand', 'TRUEMOVE', '4197006', '37.45', '520', '99', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('359', 'GM', 'Thailand', 'TRUEMOVE', '4197007', '42.80', '520', '00', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('360', 'GM', 'Thailand', 'TRUEMOVE', '4197007', '42.80', '520', '04', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('361', 'GM', 'Thailand', 'TRUEMOVE', '4197007', '42.80', '520', '99', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('362', 'GM', 'Thailand', 'TRUEMOVE', '4197010', '52.43', '520', '00', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('363', 'GM', 'Thailand', 'TRUEMOVE', '4197010', '52.43', '520', '04', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('364', 'GM', 'Thailand', 'TRUEMOVE', '4197010', '52.43', '520', '99', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('365', 'GM', 'Thailand', 'TRUEMOVE', '4197008', '53.50', '520', '00', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('366', 'GM', 'Thailand', 'TRUEMOVE', '4197008', '53.50', '520', '04', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('367', 'GM', 'Thailand', 'TRUEMOVE', '4197008', '53.50', '520', '99', 'GMG onetime_skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('368', 'GM', 'Turkey', 'Avea', '2215', '1.00', '286', '03', 'TAT GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('369', 'GM', 'Turkey', 'Avea', '2215', '5.00', '286', '03', 'TAT GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('370', 'GM', 'Turkey', 'Turkcell', '2215', '1.00', '286', '01', 'TAT GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('371', 'GM', 'Turkey', 'Turkcell', '2215', '5.00', '286', '01', 'TAT GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('372', 'GM', 'Turkey', 'Vodafone', '2215', '1.00', '286', '02', 'TAT GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('373', 'GM', 'Turkey', 'Vodafone', '2215', '5.00', '286', '02', 'TAT GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('374', 'GM', 'Turkey', 'Aycell', '2215', '1.00', '286', '04', 'TAT GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('375', 'GM', 'Turkey', 'Aycell', '2215', '5.00', '286', '04', 'TAT GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('376', 'GM', 'United Arab Emirates', 'DU', '6442', '5.00', '424', '03', 'TXT GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('377', 'GM', 'United Arab Emirates', 'DU', '9499', '10.00', '424', '03', 'TXT GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('378', 'GM', 'United Arab Emirates', 'DU', '9322', '20.00', '424', '03', 'TXT GMOBI4 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('379', 'GM', 'United Arab Emirates', 'DU', '5077', '30.00', '424', '03', 'TXT GMOBI6 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('380', 'GM', 'United Arab Emirates', 'Etisalat', '1469', '5.00', '424', '02', 'TXT GMOBI1 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('381', 'GM', 'United Arab Emirates', 'Etisalat', '1469', '10.00', '424', '02', 'TXT GMOBI2 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('382', 'GM', 'United Arab Emirates', 'Etisalat', '1469', '20.00', '424', '02', 'TXT GMOBI4 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('383', 'GM', 'United Arab Emirates', 'Etisalat', '1469', '30.00', '424', '02', 'TXT GMOBI6 skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('384', 'GM', 'Vietnam', 'Mobifone Vietnam', '7192', '1000.00', '452', '1', 'CENT GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('385', 'GM', 'Vietnam', 'Mobifone Vietnam', '7292', '2000.00', '452', '1', 'CENT GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('386', 'GM', 'Vietnam', 'Mobifone Vietnam', '7392', '3000.00', '452', '1', 'CENT GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('387', 'GM', 'Vietnam', 'Mobifone Vietnam', '7492', '4000.00', '452', '1', 'CENT GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('388', 'GM', 'Vietnam', 'Mobifone Vietnam', '7592', '5000.00', '452', '1', 'CENT GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('389', 'GM', 'Vietnam', 'Mobifone Vietnam', '7692', '10000.00', '452', '1', 'CENT GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('390', 'GM', 'Vietnam', 'Mobifone Vietnam', '7792', '15000.00', '452', '1', 'CENT GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('391', 'GM', 'Vietnam', 'Vinaphone Vietnam', '7192', '1000.00', '452', '2', 'CENT GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('392', 'GM', 'Vietnam', 'Vinaphone Vietnam', '7292', '2000.00', '452', '2', 'CENT GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('393', 'GM', 'Vietnam', 'Vinaphone Vietnam', '7392', '3000.00', '452', '2', 'CENT GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('394', 'GM', 'Vietnam', 'Vinaphone Vietnam', '7492', '4000.00', '452', '2', 'CENT GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('395', 'GM', 'Vietnam', 'Vinaphone Vietnam', '7592', '5000.00', '452', '2', 'CENT GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('396', 'GM', 'Vietnam', 'Vinaphone Vietnam', '7692', '10000.00', '452', '2', 'CENT GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('397', 'GM', 'Vietnam', 'Vinaphone Vietnam', '7792', '15000.00', '452', '2', 'CENT GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('398', 'GM', 'Vietnam', 'Viettel Vietnam', '7192', '1000.00', '452', '4', 'CENT GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('399', 'GM', 'Vietnam', 'Viettel Vietnam', '7292', '2000.00', '452', '4', 'CENT GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('400', 'GM', 'Vietnam', 'Viettel Vietnam', '7392', '3000.00', '452', '4', 'CENT GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('401', 'GM', 'Vietnam', 'Viettel Vietnam', '7492', '4000.00', '452', '4', 'CENT GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('402', 'GM', 'Vietnam', 'Viettel Vietnam', '7592', '5000.00', '452', '4', 'CENT GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('403', 'GM', 'Vietnam', 'Viettel Vietnam', '7692', '10000.00', '452', '4', 'CENT GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('404', 'GM', 'Vietnam', 'Viettel Vietnam', '7792', '15000.00', '452', '4', 'CENT GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('405', 'GM', 'Vietnam', 'VietnamMobile', '7192', '1000.00', '452', '5', 'CENT GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('406', 'GM', 'Vietnam', 'VietnamMobile', '7292', '2000.00', '452', '5', 'CENT GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('407', 'GM', 'Vietnam', 'VietnamMobile', '7392', '3000.00', '452', '5', 'CENT GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('408', 'GM', 'Vietnam', 'VietnamMobile', '7492', '4000.00', '452', '5', 'CENT GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('409', 'GM', 'Vietnam', 'VietnamMobile', '7592', '5000.00', '452', '5', 'CENT GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('410', 'GM', 'Vietnam', 'VietnamMobile', '7692', '10000.00', '452', '5', 'CENT GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('411', 'GM', 'Vietnam', 'VietnamMobile', '7792', '15000.00', '452', '5', 'CENT GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('412', 'GM', 'Vietnam', 'Gtel Vietnam', '7192', '1000.00', '452', '7', 'CENT GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('413', 'GM', 'Vietnam', 'Gtel Vietnam', '7292', '2000.00', '452', '7', 'CENT GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('414', 'GM', 'Vietnam', 'Gtel Vietnam', '7392', '3000.00', '452', '7', 'CENT GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('415', 'GM', 'Vietnam', 'Gtel Vietnam', '7492', '4000.00', '452', '7', 'CENT GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('416', 'GM', 'Vietnam', 'Gtel Vietnam', '7592', '5000.00', '452', '7', 'CENT GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('417', 'GM', 'Vietnam', 'Gtel Vietnam', '7692', '10000.00', '452', '7', 'CENT GM skydomain', null, null, null, null);
INSERT INTO `operation_conf` VALUES ('418', 'GM', 'Vietnam', 'Gtel Vietnam', '7792', '15000.00', '452', '7', 'CENT GM skydomain', null, null, null, null);

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `resource_id` bigint(11) DEFAULT NULL,
  `role_id` bigint(11) DEFAULT NULL,
  `permission_code` varchar(255) DEFAULT NULL COMMENT '保留字段',
  `permission_name` varchar(255) DEFAULT NULL COMMENT '保留字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=551 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('82', '1', '3', null, null);
INSERT INTO `permission` VALUES ('83', '4', '3', null, null);
INSERT INTO `permission` VALUES ('149', '1', '2', null, null);
INSERT INTO `permission` VALUES ('150', '2', '2', null, null);
INSERT INTO `permission` VALUES ('151', '28', '2', null, null);
INSERT INTO `permission` VALUES ('152', '12', '2', null, null);
INSERT INTO `permission` VALUES ('153', '13', '2', null, null);
INSERT INTO `permission` VALUES ('492', '1', '1', null, null);
INSERT INTO `permission` VALUES ('493', '2', '1', null, null);
INSERT INTO `permission` VALUES ('494', '13', '1', null, null);
INSERT INTO `permission` VALUES ('495', '14', '1', null, null);
INSERT INTO `permission` VALUES ('496', '15', '1', null, null);
INSERT INTO `permission` VALUES ('497', '28', '1', null, null);
INSERT INTO `permission` VALUES ('498', '12', '1', null, null);
INSERT INTO `permission` VALUES ('499', '3', '1', null, null);
INSERT INTO `permission` VALUES ('500', '16', '1', null, null);
INSERT INTO `permission` VALUES ('501', '17', '1', null, null);
INSERT INTO `permission` VALUES ('502', '18', '1', null, null);
INSERT INTO `permission` VALUES ('503', '19', '1', null, null);
INSERT INTO `permission` VALUES ('504', '29', '1', null, null);
INSERT INTO `permission` VALUES ('505', '31', '1', null, null);
INSERT INTO `permission` VALUES ('506', '4', '1', null, null);
INSERT INTO `permission` VALUES ('507', '20', '1', null, null);
INSERT INTO `permission` VALUES ('508', '21', '1', null, null);
INSERT INTO `permission` VALUES ('509', '22', '1', null, null);
INSERT INTO `permission` VALUES ('510', '23', '1', null, null);
INSERT INTO `permission` VALUES ('511', '32', '1', null, null);
INSERT INTO `permission` VALUES ('512', '10', '1', null, null);
INSERT INTO `permission` VALUES ('513', '24', '1', null, null);
INSERT INTO `permission` VALUES ('514', '25', '1', null, null);
INSERT INTO `permission` VALUES ('515', '26', '1', null, null);
INSERT INTO `permission` VALUES ('516', '27', '1', null, null);
INSERT INTO `permission` VALUES ('517', '30', '1', null, null);
INSERT INTO `permission` VALUES ('518', '5', '1', null, null);
INSERT INTO `permission` VALUES ('519', '6', '1', null, null);
INSERT INTO `permission` VALUES ('520', '33', '1', null, null);
INSERT INTO `permission` VALUES ('521', '34', '1', null, null);
INSERT INTO `permission` VALUES ('522', '35', '1', null, null);
INSERT INTO `permission` VALUES ('523', '36', '1', null, null);
INSERT INTO `permission` VALUES ('524', '37', '1', null, null);
INSERT INTO `permission` VALUES ('525', '7', '1', null, null);
INSERT INTO `permission` VALUES ('526', '38', '1', null, null);
INSERT INTO `permission` VALUES ('527', '39', '1', null, null);
INSERT INTO `permission` VALUES ('528', '40', '1', null, null);
INSERT INTO `permission` VALUES ('529', '41', '1', null, null);
INSERT INTO `permission` VALUES ('530', '42', '1', null, null);
INSERT INTO `permission` VALUES ('531', '8', '1', null, null);
INSERT INTO `permission` VALUES ('532', '43', '1', null, null);
INSERT INTO `permission` VALUES ('533', '44', '1', null, null);
INSERT INTO `permission` VALUES ('534', '45', '1', null, null);
INSERT INTO `permission` VALUES ('535', '46', '1', null, null);
INSERT INTO `permission` VALUES ('536', '47', '1', null, null);
INSERT INTO `permission` VALUES ('537', '53', '1', null, null);
INSERT INTO `permission` VALUES ('538', '9', '1', null, null);
INSERT INTO `permission` VALUES ('539', '48', '1', null, null);
INSERT INTO `permission` VALUES ('540', '49', '1', null, null);
INSERT INTO `permission` VALUES ('541', '50', '1', null, null);
INSERT INTO `permission` VALUES ('542', '51', '1', null, null);
INSERT INTO `permission` VALUES ('543', '52', '1', null, null);
INSERT INTO `permission` VALUES ('544', '54', '1', null, null);
INSERT INTO `permission` VALUES ('545', '55', '1', null, null);
INSERT INTO `permission` VALUES ('546', '56', '1', null, null);
INSERT INTO `permission` VALUES ('547', '57', '1', null, null);
INSERT INTO `permission` VALUES ('548', '58', '1', null, null);
INSERT INTO `permission` VALUES ('549', '59', '1', null, null);
INSERT INTO `permission` VALUES ('550', '60', '1', null, null);

-- ----------------------------
-- Table structure for price_info
-- ----------------------------
DROP TABLE IF EXISTS `price_info`;
CREATE TABLE `price_info` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(128) DEFAULT NULL,
  `price_id` varchar(128) DEFAULT NULL,
  `price_name` varchar(255) DEFAULT NULL,
  `price_briefing` varchar(255) DEFAULT NULL COMMENT '计费点功能介绍',
  `price_type` varchar(1) DEFAULT NULL COMMENT '计费点类型 1： 固定 ，2 自适应',
  `qc_id` bigint(11) DEFAULT NULL COMMENT '运营商id',
  `global_price` decimal(10,2) DEFAULT NULL COMMENT '当地价格或者世界价格',
  `is_tip` varchar(255) DEFAULT NULL COMMENT '1是，2否',
  `is_param` varchar(255) DEFAULT NULL COMMENT '1是， 2 否',
  `params` varchar(1) DEFAULT NULL COMMENT '1:向上原则，2:向下原则',
  `status` varchar(1) DEFAULT '' COMMENT '1:生效，2：无效',
  `update_time` datetime DEFAULT NULL,
  `update_user` bigint(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of price_info
-- ----------------------------
INSERT INTO `price_info` VALUES ('2', 'A14720101531301', 'P14721095934503', 'Kaka', '06W——卡卡', '1', '3', null, '1', '2', '', '1', '2016-08-26 15:26:19', '1', '2016-08-25 15:19:53', '1');
INSERT INTO `price_info` VALUES ('3', 'A14720101531302', 'P14721966492593', '女巫', '魔杖', '2', null, '5.00', '1', '1', '1', '1', '2016-08-26 15:41:47', '1', '2016-08-26 15:30:49', '1');

-- ----------------------------
-- Table structure for price_info_log
-- ----------------------------
DROP TABLE IF EXISTS `price_info_log`;
CREATE TABLE `price_info_log` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `imsi` varchar(255) DEFAULT NULL,
  `app_id` varchar(128) DEFAULT NULL,
  `price_id` varchar(128) DEFAULT NULL,
  `price_name` varchar(255) DEFAULT NULL,
  `price_briefing` varchar(255) DEFAULT NULL COMMENT '计费点功能介绍',
  `price_type` varchar(1) DEFAULT NULL COMMENT '计费点类型 1： 固定 ，2 自适应',
  `price_service` varchar(128) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `operator` varchar(128) DEFAULT NULL,
  `local_price` decimal(10,2) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `short_code` varchar(11) DEFAULT NULL,
  `mcc` varchar(5) DEFAULT NULL,
  `mnc` varchar(5) DEFAULT NULL,
  `is_tip` varchar(255) DEFAULT NULL COMMENT '1是，2否',
  `is_param` varchar(255) DEFAULT NULL COMMENT '1是， 2 否',
  `params` varchar(1) DEFAULT NULL COMMENT '1:向上原则，2:向下原则',
  `status` varchar(1) DEFAULT '' COMMENT '1:生效，2：无效',
  `update_time` datetime DEFAULT NULL,
  `update_user` bigint(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of price_info_log
-- ----------------------------
INSERT INTO `price_info_log` VALUES ('2', null, 'A14720102465886', 'P14721095934503', 'Kaka', '06W——卡卡', '2', '', '', '', '5.60', null, null, null, null, '1', '2', '', '2', '2016-08-25 18:28:49', '1', '2016-08-25 15:19:53', '1');
INSERT INTO `price_info_log` VALUES ('3', '206107538', 'A14720101531302', 'P14721966492593', '女巫', '魔杖', '2', 'GM', 'Belgium', 'Mobistar', '2.00', 'TXT GMOBI2 skydomain', '6486', '206', '10', '1', '1', '1', '1', '2016-08-26 15:41:47', '1', '2016-08-26 15:30:49', '1');

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `code` varchar(128) NOT NULL COMMENT '权限编码',
  `name` varchar(255) NOT NULL,
  `level_pid` int(11) NOT NULL COMMENT '父级id',
  `leve_sort` int(10) DEFAULT NULL COMMENT '菜单排序',
  `level_lag` int(1) NOT NULL COMMENT '1:按钮 2：字段，3：菜单',
  `icon_url` varchar(255) DEFAULT NULL,
  `msg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES ('1', '#', 'system:info', '系统', '0', '1', '3', null, '系统');
INSERT INTO `resource` VALUES ('2', 'system/userinfo', 'system:user:info', '用户管理', '1', '1', '3', null, null);
INSERT INTO `resource` VALUES ('3', 'system/role', 'system:role:info', '角色管理', '1', '2', '3', null, null);
INSERT INTO `resource` VALUES ('4', 'system/rources', 'system:rources:info', '资源管理', '1', '3', '3', null, null);
INSERT INTO `resource` VALUES ('5', '#', 'conf:info', '配置', '0', '2', '3', 'icon-briefcase', null);
INSERT INTO `resource` VALUES ('6', 'conf/apply', 'conf:apply:info', '应用管理', '5', '1', '3', null, null);
INSERT INTO `resource` VALUES ('7', 'conf/channel', 'conf:channel:info', '渠道管理', '5', '2', '3', null, null);
INSERT INTO `resource` VALUES ('8', 'conf/bpoint', 'conf:bpoint:info', '计费点管理', '5', '3', '3', null, null);
INSERT INTO `resource` VALUES ('9', 'conf/operator', 'conf:operator:info', '运营商配置', '5', '4', '3', null, null);
INSERT INTO `resource` VALUES ('10', 'system/usertype', 'system:usertype:info', '用户类型管理', '1', '4', '3', null, null);
INSERT INTO `resource` VALUES ('12', '#', 'system:userinfo:add', '增加', '2', '1', '1', null, '');
INSERT INTO `resource` VALUES ('13', '#', 'system:userinfo:del', '删除', '2', '1', '1', null, '');
INSERT INTO `resource` VALUES ('14', '#', 'system:userInfo:view', '查看', '2', '1', '1', null, '');
INSERT INTO `resource` VALUES ('15', '#', 'system:userinfo:edit', '修改', '2', '1', '1', null, '');
INSERT INTO `resource` VALUES ('16', '#', 'system:role:add', '增加', '3', '1', '1', '', '');
INSERT INTO `resource` VALUES ('17', '#', 'system:role:del', '删除', '3', '1', '1', '', '');
INSERT INTO `resource` VALUES ('18', '#', 'system:role:view', '查看', '3', '1', '1', '', '');
INSERT INTO `resource` VALUES ('19', '#', 'system:role:edit', '修改', '3', '1', '1', '', '');
INSERT INTO `resource` VALUES ('20', '#', 'system:rources:addf', '创建一级菜单', '4', '1', '1', '', '');
INSERT INTO `resource` VALUES ('21', '#', 'system:rources:del', '删除', '4', '1', '1', '', '');
INSERT INTO `resource` VALUES ('22', '#', 'system:rources:view', '查看', '4', '1', '1', '', '');
INSERT INTO `resource` VALUES ('23', '#', 'system:rources:edit', '修改', '4', '1', '1', '', '');
INSERT INTO `resource` VALUES ('24', '#', 'system:usertype:add', '增加', '10', '1', '1', '', '');
INSERT INTO `resource` VALUES ('25', '#', 'system:usertype:del', '删除', '10', '1', '1', '', '');
INSERT INTO `resource` VALUES ('26', '#', 'system:usertype:view', '查看', '10', '1', '1', '', '');
INSERT INTO `resource` VALUES ('27', '#', 'system:usertype:edit', '修改', '10', '1', '1', '', '');
INSERT INTO `resource` VALUES ('28', '#', 'system:userinfo:query', '查询/重置', '2', '1', '1', null, null);
INSERT INTO `resource` VALUES ('29', '#', 'system:role:query', '查询/重置', '3', '1', '1', null, null);
INSERT INTO `resource` VALUES ('30', '#', 'system:usertype:query', '查询/重置', '10', '1', '1', '', '');
INSERT INTO `resource` VALUES ('31', '#', 'system:role:jurisdiction', '权限分配', '3', '1', '1', null, null);
INSERT INTO `resource` VALUES ('32', '#', 'system:rources:addc', '创建子菜单', '4', '1', '1', null, null);
INSERT INTO `resource` VALUES ('33', '#', 'conf:applyinfo:query', '查询/重置', '6', '1', '1', null, null);
INSERT INTO `resource` VALUES ('34', '#', 'conf:applyinfo:add', '增加', '6', '1', '1', null, null);
INSERT INTO `resource` VALUES ('35', '#', 'conf:applyinfo:del', '删除', '6', '1', '1', null, null);
INSERT INTO `resource` VALUES ('36', '#', 'conf:applyinfo:view', '查看', '6', '1', '1', null, null);
INSERT INTO `resource` VALUES ('37', '#', 'conf:applyinfo:edit', '修改', '6', '1', '1', null, null);
INSERT INTO `resource` VALUES ('38', '#', 'conf:channelinfo:query', '查看/重置', '7', '1', '1', null, null);
INSERT INTO `resource` VALUES ('39', '#', 'conf:channelinfo:add', '增加', '7', '1', '1', null, null);
INSERT INTO `resource` VALUES ('40', '#', 'conf:channelinfo:del', '删除', '7', '1', '1', null, null);
INSERT INTO `resource` VALUES ('41', '#', 'conf:channelinfo:edit', '修改', '7', '1', '1', null, null);
INSERT INTO `resource` VALUES ('42', '#', 'conf:channelinfo:view', '查看', '7', '1', '1', null, null);
INSERT INTO `resource` VALUES ('43', '#', 'conf:bpointinfo:query', '查看/重置', '8', '1', '1', null, null);
INSERT INTO `resource` VALUES ('44', '#', 'conf:bpointinfo:add', '增加', '8', '1', '1', null, null);
INSERT INTO `resource` VALUES ('45', '#', 'conf:bpointinfo:del', '删除', '8', '1', '1', null, null);
INSERT INTO `resource` VALUES ('46', '#', 'conf:bpointinfo:edit', '修改', '8', '1', '1', null, null);
INSERT INTO `resource` VALUES ('47', '#', 'conf:bpointinfo:view', '查看', '8', '1', '1', null, null);
INSERT INTO `resource` VALUES ('48', '#', 'conf:operatorinfo:query', '查看/重置', '9', '1', '1', null, null);
INSERT INTO `resource` VALUES ('49', '#', 'conf:operatorinfo:add', '增加', '9', '1', '1', null, null);
INSERT INTO `resource` VALUES ('50', '#', 'conf:operatorinfo:del', '删除', '9', '1', '1', null, null);
INSERT INTO `resource` VALUES ('51', '#', 'conf:operatorinfo:edit', '修改', '9', '1', '1', null, null);
INSERT INTO `resource` VALUES ('52', '#', 'conf:operatorinfo:import', '导入', '9', '1', '1', null, null);
INSERT INTO `resource` VALUES ('53', '#', 'conf:bpointinfo:status', '状态', '8', '1', '1', null, null);
INSERT INTO `resource` VALUES ('54', '#', 'tics:info', '统计', '0', '3', '3', 'icon-th', null);
INSERT INTO `resource` VALUES ('55', 'tics/userdata', 'tics:userdata:info', '用户实时数据', '54', '1', '3', null, null);
INSERT INTO `resource` VALUES ('56', 'tics/userprice', 'tics:userprice:info', '用户实时计费数据', '54', '2', '3', null, null);
INSERT INTO `resource` VALUES ('57', 'tics/datadetilbef', 'tics:datadetilbef:info', '数据详情(扣量后)', '54', '3', '3', null, null);
INSERT INTO `resource` VALUES ('58', 'tics/datadetil', 'tics:datadetil:info', '数据详情', '54', '4', '3', '', '');
INSERT INTO `resource` VALUES ('59', 'tics/survey', 'tics:survey:info', '概况', '54', '5', '3', '', '');
INSERT INTO `resource` VALUES ('60', 'tics/surveybef', 'tics:surveybef:info', '概况(扣量后)', '54', '6', '3', '', '');
INSERT INTO `resource` VALUES ('61', '#', 'tics:userdata:query', '用户实时数据查询', '55', '1', '1', null, null);
INSERT INTO `resource` VALUES ('62', '#', 'tics:userdata:export', '用户实时数据导出', '55', '2', '1', null, null);
INSERT INTO `resource` VALUES ('63', '#', 'tics:userprice:query', '用户实时计费查询', '56', '1', '1', null, null);
INSERT INTO `resource` VALUES ('64', '#', 'tics:userprice:export', '用户实时计费导出', '56', '1', '1', null, null);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(128) DEFAULT NULL,
  `role_code` varchar(128) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员', 'admin', '2016-08-11 10:44:12', '1');
INSERT INTO `role` VALUES ('2', '悟空', 'wk', '2016-08-16 11:13:00', '1');
INSERT INTO `role` VALUES ('3', '八戒 ', 'bj', '2016-08-16 11:13:07', '1');

-- ----------------------------
-- Table structure for sales_msg
-- ----------------------------
DROP TABLE IF EXISTS `sales_msg`;
CREATE TABLE `sales_msg` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(128) DEFAULT NULL,
  `lc` varchar(128) DEFAULT NULL COMMENT '渠道号',
  `brand` varchar(64) DEFAULT NULL,
  `model` varchar(64) DEFAULT NULL,
  `android_version` varchar(32) DEFAULT NULL,
  `imei` varchar(32) DEFAULT NULL,
  `imsi` varchar(32) DEFAULT NULL,
  `token` varchar(128) DEFAULT NULL,
  `install_type` varchar(2) DEFAULT NULL,
  `app_name` varchar(255) DEFAULT NULL,
  `packagename` varchar(128) DEFAULT NULL,
  `version` varchar(32) DEFAULT NULL,
  `activit_time` datetime DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL,
  `country` varchar(64) DEFAULT NULL,
  `area` varchar(128) DEFAULT NULL COMMENT '地区',
  `region` varchar(128) DEFAULT NULL COMMENT '省份',
  `city` varchar(128) DEFAULT NULL COMMENT '城市',
  `area_id` varchar(32) DEFAULT NULL,
  `country_id` varchar(32) DEFAULT NULL,
  `region_id` varchar(32) DEFAULT NULL,
  `city_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sales_msg
-- ----------------------------
INSERT INTO `sales_msg` VALUES ('1', 'A14720101531302', 'C2785141926', 'GPLUS', 'GPLUS GW502', '5.0', '12312', '460008860833268', 'varchar(80)', '2', 'fileexplorer.apk', 'com.hll.fileexplorer', '3.0.u.07221_10', '2010-01-02 02:48:01', null, null, null, null, null, null, null, null, null);
INSERT INTO `sales_msg` VALUES ('2', 'A14720101531302', 'C2785141926', 'GPLUS', 'GPLUS GW502', '5.0', '12312', '460008860833268', 'varchar(80)', '2', 'fileexplorer.apk', 'com.hll.fileexplorer', '3.0.u.07221_10', '2010-01-02 02:48:01', '127.0.0.1', '未分配或者内网IP', null, null, null, null, null, null, null);
INSERT INTO `sales_msg` VALUES ('3', 'A14720101531302', 'C2785141926', 'GPLUS', 'GPLUS GW502', '5.0', '12312', '460008860833268', 'varchar(80)', '2', 'fileexplorer.apk', 'com.hll.fileexplorer', '3.0.u.07221_10', '2010-01-02 02:48:01', '127.0.0.1', null, null, null, null, null, null, null, null);
INSERT INTO `sales_msg` VALUES ('4', 'A14720101531302', 'C2785141926', 'GPLUS', 'GPLUS GW502', '5.0', '12312', '460008860833268', 'varchar(80)', '2', 'fileexplorer.apk', 'com.hll.fileexplorer', '3.0.u.07221_10', '2010-01-02 02:48:01', '127.0.0.1', null, null, null, null, null, null, null, null);
INSERT INTO `sales_msg` VALUES ('5', 'A14720101531302', 'C2785141926', 'GPLUS', 'GPLUS GW502', '5.0', '12312', '460008860833268', 'varchar(80)', '2', 'fileexplorer.apk', 'com.hll.fileexplorer', '3.0.u.07221_10', '2010-01-02 02:48:01', '139.198.9.255', null, null, null, null, null, null, null, null);
INSERT INTO `sales_msg` VALUES ('6', 'A14720101531302', 'C2785141926', 'GPLUS', 'GPLUS GW502', '5.0', '12312', '460008860833268', 'varchar(80)', '2', 'fileexplorer.apk', 'com.hll.fileexplorer', '3.0.u.07221_10', '2010-01-02 02:48:01', '139.198.9.255', '中国', '华北', '北京市', '北京市', '100000', 'CN', '110000', '110100');
INSERT INTO `sales_msg` VALUES ('7', 'A14720101531302', 'C2785141926', 'GPLUS', 'GPLUS GW502', '5.0', '12312', '460008860833268', 'varchar(80)', '2', 'fileexplorer.apk', 'com.hll.fileexplorer', '3.0.u.07221_10', '2010-01-02 02:48:01', '127.0.0.1', '未分配或者内网IP', '', '', '', '', 'IANA', '', '');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(255) DEFAULT NULL COMMENT '登陆名',
  `name` varchar(255) DEFAULT NULL COMMENT '昵称',
  `password` varchar(255) DEFAULT NULL,
  `tel_name` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `telphone` varchar(16) DEFAULT NULL,
  `qq` varchar(255) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `user_type` bigint(8) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` bigint(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', 'admin', '茅茹', '159ae5f48f14e89f3f9f54dc995f1f276d472b54', '江', '3d06a5c14d010804', '18818200818', '279941737', '279941737@qq.com', '数字天域', '1', '2016-08-03 16:15:23', '1', '2016-08-16 14:20:20', '1');
INSERT INTO `user_info` VALUES ('11', '18818200818', '唐僧', '21d2f1645dbfa2c3f6ce833ec4ea37762f477be2', '12', 'a6553f37fccf0032', '18818200818', '123@yahoo.c', '123@11.com', '18818200818', '4', '2016-08-16 13:46:04', '1', '2016-08-18 16:33:46', '1');
INSERT INTO `user_info` VALUES ('12', '1', '陌陌', '28fb963ac2ef4ea3e7d227f4b9856dc3854a0063', '1', 'e9951f4985c09cbc', '18818200818', '1', '1@qq.com', '1', '3', '2016-08-18 16:25:08', '1', '2016-08-24 12:05:55', '1');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(11) DEFAULT NULL,
  `user_id` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1', '1');
INSERT INTO `user_role` VALUES ('2', '3', '12');
INSERT INTO `user_role` VALUES ('3', '2', '11');

-- ----------------------------
-- Table structure for user_type
-- ----------------------------
DROP TABLE IF EXISTS `user_type`;
CREATE TABLE `user_type` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  `type_code` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_type
-- ----------------------------
INSERT INTO `user_type` VALUES ('1', '数字天域', 'szty', '2016-08-10 16:16:31', '1');
INSERT INTO `user_type` VALUES ('2', '下游CP合作商', 'cp', '2016-08-10 16:16:58', '1');
INSERT INTO `user_type` VALUES ('3', '下游渠道商', 'channel', '2016-08-10 16:17:37', '1');
INSERT INTO `user_type` VALUES ('4', '其他', 'other', '2016-08-10 16:17:57', '1');
INSERT INTO `user_type` VALUES ('5', null, null, '2016-08-24 14:07:11', '1');
INSERT INTO `user_type` VALUES ('6', null, null, '2016-08-25 14:38:29', '1');
