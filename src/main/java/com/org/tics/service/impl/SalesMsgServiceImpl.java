package com.org.tics.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.org.conf.model.DateModel;
import com.org.tics.dao.SalesMsgMapper;
import com.org.tics.model.SalesMsg;
import com.org.tics.service.SalesMsgService;
import com.org.utils.CSVUtils;
import com.org.utils.FileModel;
import com.org.utils.FileProUtil;
import com.org.utils.MapUtils;

@Service
public class SalesMsgServiceImpl implements SalesMsgService {

	@Autowired
	private SalesMsgMapper salesMsgMapper;

	@Autowired
	private FileProUtil fileProUtil;

	@Override
	public List<SalesMsg> getSalesMsgListPage(SalesMsg record) {
		return salesMsgMapper.getSalesMsgListPage(record);
	}

	@Override
	public Long getSalesMsgCountPage(SalesMsg record) {
		return salesMsgMapper.getSalesMsgCountPage(record);
	}

	@Override
	public List<SalesMsg> exportSalesMsgList(SalesMsg record) {
		return salesMsgMapper.exportSalesMsgList(record);
	}

	@Override
	public List<DateModel> getRepetCountryAll() {
		return salesMsgMapper.getRepetCountryAll();
	}

	/**
	 * 
	 * TODO 简单描述该方法的实现功能（可选）.
	 * 
	 * @author mao.ru date: 2016年9月1日 下午3:09:39 <br/>
	 */
	@Override
	public FileModel getDictionaryFile(SalesMsg record, String loginName,
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
		List<SalesMsg> list = salesMsgMapper.exportSalesMsgList(record);
		for (SalesMsg sm : list) {
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
		heads.put("activitTime", "上报时间");
		heads.put("appId", "应用ID");
		heads.put("appName", "应用名称");
		heads.put("channelName", "渠道名称");
		heads.put("channelCode", "渠道号");
		heads.put("installType", "安装类型");
		heads.put("packagename", "应用包名");
		heads.put("version", "应用版本号");
		heads.put("brand", "品牌");
		heads.put("model", "机型");
		heads.put("androidVersion", "系统版本");
		heads.put("imei", "IMEI");
		heads.put("imsi", "IMSI");
		heads.put("token", "token");
		heads.put("country", "国家");
		heads.put("region", "省份");
		heads.put("city", "城市");
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
		list.add("activitTime");
		list.add("appId");
		list.add("appName");
		list.add("channelName");
		list.add("channelCode");
		list.add("installType");
		list.add("packagename");
		list.add("version");
		list.add("brand");
		list.add("model");
		list.add("androidVersion");
		list.add("imei");
		list.add("imsi");
		list.add("token");
		list.add("country");
		list.add("region");
		list.add("city");
		return list;
	}

}
