package com.org.tics.service;

import java.util.List;
import java.util.Map;

import com.org.conf.model.DateModel;
import com.org.tics.model.SalesMsg;
import com.org.utils.FileModel;

/**
 * 
 * TODO { 用户上报实时数据统计 }
 *
 * @author mao.ru
 * @version 
 * @since JDK 1.7
 */
public interface SalesMsgService {

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
	FileModel getDictionaryFile(SalesMsg record, String loginName,Map<String, String> heads);
}
