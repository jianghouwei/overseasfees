package com.org.sysetem.service;

import java.util.List;

import com.org.system.model.UserType;

public interface UserTypeService {


	/**
	 * 
	 * 查询所有用户类型
	 * @author mao.ru
	 * @return
	 * @since JDK 1.7
	 */
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
	
	int deleteByPrimaryKey(Long id);

    int insert(UserType record);

    int insertSelective(UserType record);

    UserType selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(UserType record);

    int updateByPrimaryKey(UserType record);
}
