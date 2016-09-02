package com.org.sysetem.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.org.sysetem.service.UserInfoService;
import com.org.system.dao.UserInfoMapper;
import com.org.system.model.UserInfo;

@Service
public class UserInfoServiceImpl implements UserInfoService {

	@Autowired
	private UserInfoMapper userInfoMapper;

	@Override
	public UserInfo selectByLoginName(String loginName) {
		try {
			return userInfoMapper.selectByLoginName(loginName);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return null;
	}

	@Override
	public Long selectCountByLoginName(String loginName) {
		return userInfoMapper.selectCountByLoginName(loginName);
	}

	@Override
	public Long selectCountByTelPhone(String telPhone) {
		return userInfoMapper.selectCountByTelPhone(telPhone);
	}

	@Override
	public List<UserInfo> getUserListPage(UserInfo record) {
		return userInfoMapper.getUserListPage(record);
	}
	
	@Override
	public Long getUserCountPage(UserInfo record) {
		Long count = userInfoMapper.getUserCountPage(record);
		return count;
	}

	@Override
	public Long insertSelective(UserInfo record) {
		userInfoMapper.insertSelective(record);
		return record.getId();
	}

	@Override
	public int updateByPrimaryKeySelective(UserInfo record) {
		return userInfoMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int deleteByPrimaryKey(Long id) {
		return userInfoMapper.deleteByPrimaryKey(id);
	}

	@Override
	public UserInfo selectByPrimaryKey(Long id) {
		return userInfoMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKey(UserInfo record) {
		return userInfoMapper.updateByPrimaryKey(record);
	}

	@Override
	public UserInfo selectAllByUserId(Long id) {
		return userInfoMapper.selectAllByUserId(id);
	}

	@Override
	public List<UserInfo> getUserInfoByUserType(Long userType) {
		return userInfoMapper.getUserInfoByUserType(userType);
	}

	@Override
	public List<UserInfo> getUserInfoList() {
		return userInfoMapper.getUserInfoList();
	}


}
