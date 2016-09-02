package com.org.system.dao;

import java.util.List;

import com.org.system.model.UserType;

public interface UserTypeMapper {
    int deleteByPrimaryKey(Long id);

    int insert(UserType record);

    int insertSelective(UserType record);

    UserType selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(UserType record);

    int updateByPrimaryKey(UserType record);
    
    List<UserType> queryUserTypes();
    
    
    List<UserType> getUserTypeListPage(UserType usertype);

	/**
	 * 
	 *  分页查询
	 *
	 * @author mao.ru
	 * @param usertype
	 * @return
	 * @since JDK 1.7
	 */
	Long getUserTypeCountPage(UserType usertype);
}