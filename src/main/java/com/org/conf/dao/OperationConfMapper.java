package com.org.conf.dao;

import java.util.List;

import com.org.conf.model.DateModel;
import com.org.conf.model.OperationConf;

public interface OperationConfMapper {
	
    int deleteByPrimaryKey(Long id);

    int insert(OperationConf record);
    
    int batchInsert(List<OperationConf> list);

    int insertSelective(OperationConf record);

    OperationConf selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(OperationConf record);

    int updateByPrimaryKey(OperationConf record);
    
    List<OperationConf> getOperationConfListPage(OperationConf record);

	Long geOperationConfCountPage(OperationConf record);
	
	
	/**
	 * 
	 * 获取国家
	 *
	 * @author mao.ru
	 * @return
	 * @since JDK 1.7
	 */
	List<DateModel> getCountryAll();
	
	/**
	 * 
	 * 依据计费服务提供商获取国家
	 *
	 * @author mao.ru
	 * @param priceService
	 * @return
	 * @since JDK 1.7
	 */
	List<DateModel> getCountryAllByPriceService(String priceService);
	
	/**
	 * 
	 * 获取计费服务提供商
	 *
	 * @author mao.ru
	 * @return
	 * @since JDK 1.7
	 */
	List<DateModel> getPriceServiceAll();
	
	/**
	 * 
	 * 依据国家获取计费服务提供商
	 *
	 * @author mao.ru
	 * @return
	 * @since JDK 1.7
	 */
	List<DateModel> getPriceServiceAllByCountry(String country);
	
	
	/**
	 * 
	 * 获取所有运营商
	 *
	 * @author mao.ru
	 * @param country
	 * @param priceService
	 * @return
	 * @since JDK 1.7
	 */
	List<DateModel> getOperatorAll();
	
	/**
	 * 
	 * 依据国家和服务提供商获取 运营商
	 *
	 * @author mao.ru
	 * @param country
	 * @param priceService
	 * @return
	 * @since JDK 1.7
	 */
	List<DateModel> getOperatorAllByCountryAndPservice(OperationConf record );
	
	
	/**
	 * 
	 * 依据国家,服务提供商,运营商 获取  ======  价格
	 *
	 * @author mao.ru
	 * @param country
	 * @param priceService
	 * @return
	 * @since JDK 1.7
	 */
	List<DateModel> getLocalPriceAllByCtryPserviceAndOperator(OperationConf record);
	
	
	
}