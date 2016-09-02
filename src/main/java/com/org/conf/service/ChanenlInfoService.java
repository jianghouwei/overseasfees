package com.org.conf.service;

import java.util.List;

import com.org.conf.model.ChanenlInfo;

/***
 * 
 * TODO {渠道配置}
 *
 * @author mao.ru
 * @version 
 * @since JDK 1.7
 */
public interface ChanenlInfoService {


    int deleteByPrimaryKey(Long id);

    int insert(ChanenlInfo record);

    int insertSelective(ChanenlInfo record);

    ChanenlInfo selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ChanenlInfo record);

    int updateByPrimaryKey(ChanenlInfo record);
    
    List<ChanenlInfo> getChanenlInfoListPage(ChanenlInfo record);

   	Long getChanenlInfoCountPage(ChanenlInfo record);
}
