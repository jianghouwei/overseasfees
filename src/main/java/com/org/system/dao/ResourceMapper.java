package com.org.system.dao;

import java.util.List;

import com.org.system.model.Resource;

public interface ResourceMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Resource record);

    int insertSelective(Resource record);

    Resource selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Resource record);

    int updateByPrimaryKey(Resource record);
    
    List<Resource> getMenusByUserId(Long userId);
    
    List<Resource> getResourceAll();
    
    List<Resource> queryPermissionByAll(Long roleId);
    
    int deleteByPid(Integer levelPid);
}