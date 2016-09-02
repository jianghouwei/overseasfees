package com.org.system.dao;

import java.util.List;

import com.org.system.model.UserInfo;

public interface UserInfoMapper {
	
	int deleteByPrimaryKey(Long id);

	int insert(UserInfo record);

	int insertSelective(UserInfo record);

	UserInfo selectByPrimaryKey(Long id);

	int updateByPrimaryKeySelective(UserInfo record);

	int updateByPrimaryKey(UserInfo record);

	/**
	 * 
	 * TODO(依据用户名查询用户信息).<br/>
	 *
	 * @author mao.ru
	 * @param name
	 * @return
	 * @since JDK 1.7
	 */
	UserInfo selectByLoginName(String loginName);

	/**
	 * 
	 * TODO(依据用户名统计用户数量).<br/>
	 *
	 * @author mao.ru
	 * @param name
	 * @return
	 * @since JDK 1.7
	 */
	Long selectCountByLoginName(String loginName);

	/**
	 * 
	 * TODO(依据手机号码统计用户数量).<br/>
	 *
	 * @author mao.ru
	 * @param name
	 * @return
	 * @since JDK 1.7
	 */
	Long selectCountByTelPhone(String telPhone);
	
	
	/**
	 * 
	 * 分页查询
	 * @author mao.ru
	 * @param page
	 * @return
	 * @since JDK 1.7
	 */
	List<UserInfo> getUserListPage(UserInfo record);
	
	/**
	 * 
	 * 分页查询
	 * @author mao.ru
	 * @param page
	 * @return
	 * @since JDK 1.7
	 */
	Long getUserCountPage(UserInfo record);
	
	/**
	 * 查询用户所有信息
	 *
	 * @author mao.ru
	 * @param id
	 * @return
	 * @since JDK 1.7
	 */
	UserInfo selectAllByUserId(Long id);
	
	
	/**
	 * 
	 * 依据类型查询用户列表
	 * @author mao.ru
	 * @param userType
	 * @return
	 * @since JDK 1.7
	 */
	List<UserInfo> getUserInfoByUserType(Long userType);
	
	
	/**
	 * 
	 * 查询APP发布者:情况不明有点乱，暂且全部查询出来
	 * @author mao.ru
	 * @param userType
	 * @return
	 * @since JDK 1.7
	 */
	List<UserInfo> getUserInfoList();
	
}