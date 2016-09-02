package com.org.system.dao;

import java.util.Set;

import com.org.system.model.UserRole;

public interface UserRoleMapper {
    int deleteByPrimaryKey(Long id);

    int insert(UserRole record);

    int insertSelective(UserRole record);

    UserRole selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(UserRole record);

    int updateByPrimaryKey(UserRole record);
    
    Set<String> getRolesByUserId(Long userId);
    
    int deleteByUserId(Long userId);
    
    int updateUserRoleByUserIdSelective(UserRole record);
    
    int deleteRoleUserByRoleId(Long roleId);
   
}