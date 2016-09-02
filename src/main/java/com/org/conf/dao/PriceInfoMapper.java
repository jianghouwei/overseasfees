package com.org.conf.dao;

import java.util.List;

import com.org.conf.model.PriceInfo;

/**
 * 
 * TODO {计费点配置}
 *
 * @author mao.ru
 * @version 
 * @since JDK 1.7
 */
public interface PriceInfoMapper {
	
    int deleteByPrimaryKey(Long id);

    int insert(PriceInfo record);

    int insertSelective(PriceInfo record);

    PriceInfo selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(PriceInfo record);

    int updateByPrimaryKey(PriceInfo record);
    
    
    List<PriceInfo> getPriceInfoListPage(PriceInfo record);

  	Long getPriceInfoCountPage(PriceInfo record);
  	
  	
}