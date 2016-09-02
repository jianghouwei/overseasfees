package com.org.sysetem.service;

import java.util.List;

import com.org.system.model.Resource;

public interface MenuService {

	/**
	 * 
	 * 依据用户id 查询用权限
	 *
	 * @author mao.ru
	 * @param userId
	 * @return
	 * @since JDK 1.7
	 */
	List<Resource> getMenusByUserId(Long userId);
	
	/**
	 * 
	 *  所有资源查询
	 *
	 * @author mao.ru
	 * @return
	 * @since JDK 1.7
	 */
	List<Resource> getResourceAll();
	
	
	int deleteByPrimaryKey(Long id);

    int insert(Resource record);

    int insertSelective(Resource record);

    Resource selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Resource record);

    int updateByPrimaryKey(Resource record);
    
    int deleteByPid(Integer pId);
}
