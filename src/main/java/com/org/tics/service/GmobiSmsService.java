package com.org.tics.service;

import java.util.List;
import java.util.Map;

import com.org.tics.model.GmobiSms;
import com.org.utils.FileModel;

public interface GmobiSmsService {

	/**
	 * 
	 * 分页查询
	 * @author mao.ru
	 * @param record
	 * @return
	 * @since JDK 1.7
	 */
	List<GmobiSms> getGmobiSmsListPage(GmobiSms record);

	/**
	 * 
	 * 分页总数
	 *
	 * @author mao.ru
	 * @param record
	 * @return
	 * @since JDK 1.7
	 */
	Long getGmobiSmsCountPage(GmobiSms record);
	
	
	/**
	 *  文件下载
	 *
	 * TODO(这里描述这个方法的使用方法 – 可选).<br/>
	 * TODO(这里描述这个方法的注意事项 – 可选).<br/>
	 *
	 * @author mao.ru
	 * @param record
	 * @param loginName
	 * @param head : 导出字段
	 * @return
	 * @since JDK 1.7
	 */
	FileModel getGmobiSmsFile(GmobiSms record, String loginName,Map<String, String> heads);
}
