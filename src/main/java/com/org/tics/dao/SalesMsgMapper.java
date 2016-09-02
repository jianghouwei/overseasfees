package com.org.tics.dao;

import java.util.List;

import com.org.conf.model.DateModel;
import com.org.tics.model.SalesMsg;

public interface SalesMsgMapper {
	/**
	 * 
	 * 分页查询
	 * @author mao.ru
	 * @param record
	 * @return
	 * @since JDK 1.7
	 */
	List<SalesMsg> getSalesMsgListPage(SalesMsg record);

	/**
	 * 
	 * 分页
	 *
	 * @author mao.ru
	 * @param record
	 * @return
	 * @since JDK 1.7
	 */
	Long getSalesMsgCountPage(SalesMsg record);
	
	/**
	 * 
	 * 导出
	 *
	 * @author mao.ru
	 * @param record
	 * @return
	 * @since JDK 1.7
	 */
	List<SalesMsg> exportSalesMsgList(SalesMsg record);
	
	/**
	 * 
	 * 上报国家
	 * 
	 * @author mao.ru
	 * @return
	 * @since JDK 1.7
	 */
	List<DateModel> getRepetCountryAll();
	
}