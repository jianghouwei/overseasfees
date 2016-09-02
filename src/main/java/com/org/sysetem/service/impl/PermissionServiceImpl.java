package com.org.sysetem.service.impl;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.org.sysetem.service.PermissionService;
import com.org.system.dao.PermissionMapper;
import com.org.system.dao.ResourceMapper;
import com.org.system.model.Permission;
import com.org.system.model.Resource;

@Service
public class PermissionServiceImpl implements PermissionService {

	@Autowired
	private PermissionMapper permissionMapper;
	
	@Autowired
	private ResourceMapper resourceMapper;

	@Override
	public Set<String> getPermissionByUserId(Long userId ,String lag) {
		if(lag.equals("admin")){
			return permissionMapper.getPermissionByUserId(userId);
		}else{
			return permissionMapper.getPermissionByUserId(userId);
		}
		
	}

	@Override
	public Set<String> getPermissionByRoleId(Long roleId) {
		return permissionMapper.getPermissionByRoleId(roleId);
	}

	@Override
	public Set<String> getPermissionByRoleIds(Long[] roleIds) {
		return permissionMapper.getPermissionByRoleIds(roleIds);
	}

	@Override
	public List<Resource> queryPermissionByAll(Long roleId) {
		return resourceMapper.queryPermissionByAll(roleId);
	}

	@Override
	public int delPermissionByRoleId(Long roleId) {
		return permissionMapper.delPermissionByRoleId(roleId);
	}

	@Override
	public int deleteByPrimaryKey(Long id) {
		return permissionMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Permission record) {
		return permissionMapper.insert(record);
	}

	@Override
	public int insertSelective(Permission record) {
		return permissionMapper.insertSelective(record);
	}

	@Override
	public Permission selectByPrimaryKey(Long id) {
		return permissionMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(Permission record) {
		return permissionMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Permission record) {
		return permissionMapper.updateByPrimaryKey(record);
	}

}
