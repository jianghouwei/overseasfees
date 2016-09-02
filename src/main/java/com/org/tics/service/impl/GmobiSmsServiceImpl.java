package com.org.tics.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.org.tics.dao.GmobiSmsMapper;
import com.org.tics.model.GmobiSms;
import com.org.tics.service.GmobiSmsService;
import com.org.utils.CSVUtils;
import com.org.utils.FileModel;
import com.org.utils.FileProUtil;
import com.org.utils.MapUtils;

@Service
public class GmobiSmsServiceImpl implements GmobiSmsService {

	@Autowired
	private  GmobiSmsMapper gmobiSmsMapper;
	
	@Autowired
	private FileProUtil fileProUtil;
	
	@Override
	public List<GmobiSms> getGmobiSmsListPage(GmobiSms record) {
		return gmobiSmsMapper.getGmobiSmsListPage(record);
	}

	@Override
	public Long getGmobiSmsCountPage(GmobiSms record) {
		return gmobiSmsMapper.getGmobiSmsCountPage(record);
	}

	@Override
	public FileModel getGmobiSmsFile(GmobiSms record, String loginName,
			Map<String, String> heads) {
		if (heads == null || heads.isEmpty()) {
			heads = getheads();
		}
		FileModel fm = new FileModel();
		String filePath = fileProUtil.getFileSavePath() + "\\" + loginName
				+ "\\";
		String fileName = loginName
				+ String.valueOf(System.currentTimeMillis()) + ".csv";
		fm.setFilePath(filePath);
		fm.setFileName(fileName);
		// 生成下载文件
		List<Map<String, Object>> exportData = new ArrayList<Map<String, Object>>();
		List<GmobiSms> list = gmobiSmsMapper.exportGmobiSmsList(record);
		for (GmobiSms sm : list) {
			Map<String, Object> map = MapUtils.transBean2Map(sm);
			exportData.add(map);
		}
		List<String> sort = getHeadsSort();
		List<String> listdata = CSVUtils.getdataList(exportData, heads,sort);
		File csvFile = new File(filePath + fileName);
		fm.setFile(csvFile);
		CSVUtils.exportCsv(csvFile, listdata);
		return fm;
	}
	
	/**
	 * 
	 *
	 * 导出标题
	 * @author mao.ru
	 * @return
	 * @since JDK 1.7
	 */
	protected static Map<String, String> getheads() {
		Map<String, String> heads = new HashMap<String, String>();
		heads.put("id", "id");
		heads.put("createTime", "创建时间");
		heads.put("appName", "应用名称");
		heads.put("appId", "应用ID");
		heads.put("imei", "IMEI");
		heads.put("imsi", "IMSI");
		heads.put("channelName", "渠道名称");
		heads.put("channelCode", "渠道号");
		heads.put("priceName", "计费点名称");
		heads.put("priceNo", "计费点ID");
		heads.put("moNo", "上行短信序号");
		heads.put("localPrice", "当地价格");
		heads.put("uid", "计费UID");
		heads.put("date", "计费交易时间");
		heads.put("operator", "运营商");
		heads.put("network", "网络类型");
		heads.put("msn", "终端号码");
		heads.put("msgF", "计费指令");
		heads.put("shortCode", "计费短号");
		heads.put("mcc", "计费国家码");
		heads.put("service", "服务名称");
		heads.put("status", "计费状态");
		return heads;
	}
	
	/**
	 * 
	 *
	 * 导出字段顺序
	 *
	 * @author mao.ru
	 * @return
	 * @since JDK 1.7
	 */
	protected static List<String> getHeadsSort() {
		List<String> list = new ArrayList<String>();
		list.add("id");
		list.add("createTime");
		list.add("appName");
		list.add("appId");
		list.add("imei");
		list.add("imsi");
		list.add("channelCode");
		list.add("channelName");
		list.add("priceNo");
		list.add("moNo");
		list.add("localPrice");
		list.add("uid");
		list.add("date");
		list.add("operator");
		list.add("network");
		list.add("msn");
		list.add("msgF");
		list.add("shortCode");
		list.add("mcc");
		list.add("service");
		list.add("status");
		return list;
	}

}
