package com.org.sysetem.service;

import java.util.List;
import java.util.Set;

import com.org.system.model.Permission;
import com.org.system.model.Resource;

public interface PermissionService {

	
	/**
	 * 
	 * TODO(依据用户id查询用户权限).<br/>
	 *
	 * @author mao.ru
	 * @return
	 * @since JDK 1.7
	 */
	Set<String> getPermissionByUserId(Long userId,String lag);
	
	/**
	 * 依据roleId查询权限
	 *
	 * TODO(这里描述这个方法的使用方法 – 可选).<br/>
	 * TODO(这里描述这个方法的注意事项 – 可选).<br/>
	 *
	 * @author mao.ru
	 * @param roleId
	 * @return
	 * @since JDK 1.7
	 */
	Set<String> getPermissionByRoleId(Long roleId);
	
	/**
	 * 依据roleId查询权限
	 *
	 * TODO(这里描述这个方法的使用方法 – 可选).<br/>
	 * TODO(这里描述这个方法的注意事项 – 可选).<br/>
	 *
	 * @author mao.ru
	 * @param roleId
	 * @return
	 * @since JDK 1.7
	 */
	Set<String> getPermissionByRoleIds(Long[] roleIds);
	
	
	List<Resource> queryPermissionByAll(Long roleId);
	
	
	/**
	 * 
	 * 依据角色Id删除角色权限
	 *
	 * @author mao.ru
	 * @param roleId
	 * @return
	 * @since JDK 1.7
	 */
	int delPermissionByRoleId(Long roleId);
	
	
	int deleteByPrimaryKey(Long id);

    int insert(Permission record);

    int insertSelective(Permission record);

    Permission selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Permission record);

    int updateByPrimaryKey(Permission record);
}
