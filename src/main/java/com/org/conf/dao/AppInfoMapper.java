package com.org.conf.dao;

import java.util.List;

import com.org.conf.model.AppInfo;

public interface AppInfoMapper {

	int deleteByPrimaryKey(Long id);

	int insert(AppInfo record);

	int insertSelective(AppInfo record);

	AppInfo selectByPrimaryKey(Long id);

	int updateByPrimaryKeySelective(AppInfo record);

	int updateByPrimaryKey(AppInfo record);

	List<AppInfo> getAppInfoListPage(AppInfo record);

	Long getAppInfoCountPage(AppInfo record);
	
	/**
	 * 获取所有应用
	 *
	 * @author mao.ru
	 * @return
	 * @since JDK 1.7
	 */
	List<AppInfo> getAllAppInfo();
}