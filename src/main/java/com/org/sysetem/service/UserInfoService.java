package com.org.sysetem.service;

import java.util.List;

import com.org.system.model.UserInfo;

public interface UserInfoService {

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
	 * 
	 * @author mao.ru
	 * @param page
	 * @return
	 * @since JDK 1.7
	 */
	List<UserInfo> getUserListPage(UserInfo user);

	Long getUserCountPage(UserInfo record);

	Long insertSelective(UserInfo record);

	int deleteByPrimaryKey(Long id);

	UserInfo selectByPrimaryKey(Long id);

	int updateByPrimaryKeySelective(UserInfo record);

	int updateByPrimaryKey(UserInfo record);

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
	 * 查询APP发布者:情况不明 有点乱，暂且全部查询出来
	 * @author mao.ru
	 * @param userType
	 * @return
	 * @since JDK 1.7
	 */
	List<UserInfo> getUserInfoList();
	
	

}
