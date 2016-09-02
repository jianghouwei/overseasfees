package com.org.system.dao;

import java.util.List;

import com.org.system.model.Role;

public interface RoleMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);
    
    /**
   	 * 
   	 * 查询所有用户角色
   	 * @author mao.ru
   	 * @return
   	 * @since JDK 1.7
   	 */
   	List<Role> queryRoles();
   	
    List<Role> getRoleListPage(Role role);

   	Long getRoleCountPage(Role role);
}