package com.org.tics.dao;

import java.util.List;

import com.org.tics.model.GmobiSms;

/**
 * 
 * TODO { 计费实时信息查询 }
 *
 * @author mao.ru
 * @version 
 * @since JDK 1.7
 */
public interface GmobiSmsMapper {
	
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
	 * 分页
	 *
	 * @author mao.ru
	 * @param record
	 * @return
	 * @since JDK 1.7
	 */
	Long getGmobiSmsCountPage(GmobiSms record);
	
	

	/**
	 * 
	 * 导出
	 *
	 * @author mao.ru
	 * @param record
	 * @return
	 * @since JDK 1.7
	 */
	List<GmobiSms> exportGmobiSmsList(GmobiSms record);
}