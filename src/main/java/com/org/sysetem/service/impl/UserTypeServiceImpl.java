package com.org.sysetem.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.org.sysetem.service.UserTypeService;
import com.org.system.dao.UserTypeMapper;
import com.org.system.model.UserType;

@Service
public class UserTypeServiceImpl implements UserTypeService{

	@Autowired
	private UserTypeMapper userTypeMapper;
	
	@Override
	public List<UserType> queryUserTypes() {
		return userTypeMapper.queryUserTypes();
	}

	@Override
	public List<UserType> getUserTypeListPage(UserType usertype) {
		return userTypeMapper.getUserTypeListPage(usertype);
	}

	@Override
	public Long getUserTypeCountPage(UserType usertype) {
		return userTypeMapper.getUserTypeCountPage(usertype);
	}

	@Override
	public int deleteByPrimaryKey(Long id) {
		return userTypeMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(UserType record) {
		return userTypeMapper.insert(record);
	}

	@Override
	public int insertSelective(UserType record) {
		return userTypeMapper.insertSelective(record);
	}

	@Override
	public UserType selectByPrimaryKey(Long id) {
		return userTypeMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(UserType record) {
		return userTypeMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(UserType record) {
		return userTypeMapper.updateByPrimaryKey(record);
	}
	
	
	

}
