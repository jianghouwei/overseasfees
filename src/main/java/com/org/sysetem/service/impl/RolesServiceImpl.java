package com.org.sysetem.service.impl;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.org.sysetem.service.RolesService;
import com.org.system.dao.RoleMapper;
import com.org.system.dao.UserRoleMapper;
import com.org.system.model.Role;
import com.org.system.model.UserRole;

@Service
public class RolesServiceImpl implements RolesService {

	@Autowired
	private UserRoleMapper userRoleMapper;
	
	@Autowired
	private RoleMapper roleMapper;

	@Override
	public Set<String> getRolesByUserId(Long userId) {
		return userRoleMapper.getRolesByUserId(userId);
	}

	@Override
	public List<Role> queryRoles() {
		return roleMapper.queryRoles();
	}

	@Override
	public int deleteByPrimaryKey(Long id) {
		return userRoleMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(UserRole record) {
		return userRoleMapper.insert(record);
	}

	@Override
	public int insertSelective(UserRole record) {
		return userRoleMapper.insertSelective(record);
	}

	@Override
	public UserRole selectByPrimaryKey(Long id) {
		return userRoleMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(UserRole record) {
		return userRoleMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(UserRole record) {
		return userRoleMapper.updateByPrimaryKey(record);
	}

	@Override
	public int deleteByRoleUserUserId(Long userId) {
		return userRoleMapper.deleteByUserId(userId);
	}

	@Override
	public int updateUserRoleByUserIdSelective(UserRole record) {
		return userRoleMapper.updateUserRoleByUserIdSelective(record);
	}

	@Override
	public List<Role> getRoleListPage(Role role) {
		return roleMapper.getRoleListPage(role);
	}

	@Override
	public Long getRoleCountPage(Role role) {
		return roleMapper.getRoleCountPage(role);
	}

	/**
	 * 
	 * TODO 简单描述该方法的实现功能（依据角色ID 删除用户角色关系表）.
	 * @see com.org.sysetem.service.RolesService#deleteRoleUserByRoleId(java.lang.Long)
	 * @author mao.ru 
	 * date: 2016年8月16日 下午5:03:43 <br/>
	 */
	@Override
	public int deleteRoleUserByRoleId(Long roleId) {
		return userRoleMapper.deleteRoleUserByRoleId(roleId);
	}

	@Override
	public int deleteRoleByPrimaryKey(Long id) {
		return roleMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insertRole(Role record) {
		return roleMapper.insert(record);
	}

	@Override
	public int insertRoleSelective(Role record) {
		return roleMapper.insertSelective(record);
	}

	@Override
	public Role selectRoleByPrimaryKey(Long id) {
		return roleMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateRoleByPrimaryKeySelective(Role record) {
		return roleMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateRoleByPrimaryKey(Role record) {
		return roleMapper.updateByPrimaryKey(record);
	}

	

}
