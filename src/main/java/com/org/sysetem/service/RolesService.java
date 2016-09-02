package com.org.sysetem.service;

import java.util.List;
import java.util.Set;

import com.org.system.model.Role;
import com.org.system.model.UserRole;

public interface RolesService {

	/**
	 * 
	 * TODO(依据用户id查询用户角色).<br/>
	 *
	 * @author mao.ru
	 * @return
	 * @since JDK 1.7
	 */
	Set<String> getRolesByUserId(Long userId);
	
	/**
	 * 
	 * 查询所有用户角色
	 * @author mao.ru
	 * @return
	 * @since JDK 1.7
	 */
	List<Role> queryRoles();
	
	
	int deleteByPrimaryKey(Long id);

    int insert(UserRole record);

    int insertSelective(UserRole record);

    UserRole selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(UserRole record);
    
    int updateUserRoleByUserIdSelective(UserRole record);

    int updateByPrimaryKey(UserRole record);
    
    int deleteByRoleUserUserId(Long userId);
    
    int deleteRoleUserByRoleId(Long userId);
    
    List<Role> getRoleListPage(Role role);

	Long getRoleCountPage(Role role);
	
	int deleteRoleByPrimaryKey(Long id);

    int insertRole(Role record);

    int insertRoleSelective(Role record);

    Role selectRoleByPrimaryKey(Long id);

    int updateRoleByPrimaryKeySelective(Role record);

    int updateRoleByPrimaryKey(Role record);
}
