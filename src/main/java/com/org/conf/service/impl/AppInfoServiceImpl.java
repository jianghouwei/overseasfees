package com.org.conf.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.org.conf.dao.AppInfoMapper;
import com.org.conf.model.AppInfo;
import com.org.conf.service.AppInfoService;

@Service
public class AppInfoServiceImpl implements AppInfoService {

	@Autowired
	private AppInfoMapper appInfoMapper;
	
	@Override
	public int deleteByPrimaryKey(Long id) {
		return appInfoMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(AppInfo record) {
		return appInfoMapper.insert(record);
	}

	@Override
	public int insertSelective(AppInfo record) {
		return appInfoMapper.insertSelective(record);
	}

	@Override
	public AppInfo selectByPrimaryKey(Long id) {
		return appInfoMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(AppInfo record) {
		return appInfoMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(AppInfo record) {
		return appInfoMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<AppInfo> getAppInfoListPage(AppInfo record) {
		return appInfoMapper.getAppInfoListPage(record);
	}

	@Override
	public Long getAppInfoCountPage(AppInfo record) {
		return appInfoMapper.getAppInfoCountPage(record);
	}

	@Override
	public List<AppInfo> getAllAppInfo() {
		return appInfoMapper.getAllAppInfo();
	}
	

}
