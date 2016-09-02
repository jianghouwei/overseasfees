package com.org.utils;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;

import com.org.model.shiro.ShiroUser;
import com.org.system.model.UserInfo;




public class UserUtil {
	
	
	/** 加密方法 */
	public static final String HASH_ALGORITHM = "SHA-1";
	public static final int HASH_INTERATIONS = 1024;
	public static final int SALT_SIZE = 8; // 盐长度
	
	/**
	 * 获取当前用户对象shiro
	 * @return shirouser
	 */
	public static ShiroUser getCurrentShiroUser(){
		ShiroUser user=(ShiroUser) SecurityUtils.getSubject().getPrincipal();
		return user;
	}
	
	/**
	 * 获取当前用户session
	 * @return session
	 */
	public static Session getSession(){
		Session session =SecurityUtils.getSubject().getSession();
		return session;
	}
	
	/**
	 * 获取当前用户httpsession
	 * @return httpsession
	 */
	public static Session getHttpSession(){
		Session session =SecurityUtils.getSubject().getSession();
		return session;
	}
	
	/**
	 * 获取当前用户对象
	 * @return user
	 */
	public static UserInfo getCurrentUser(){
		Session session =SecurityUtils.getSubject().getSession();
		if(null!=session){
			return (UserInfo) session.getAttribute("user");
		}else{
			return null;
		}
		
	}
	
	/**
	 * 设定安全的密码，生成随机的salt并经过1024次 sha-1 hash
	 */
	public static void entryptPassword(UserInfo user) {
		byte[] salt = Digests.generateSalt(SALT_SIZE);
		user.setSalt(Encodes.encodeHex(salt));

		byte[] hashPassword = Digests.sha1(user.getPlainPassword().getBytes(), salt, HASH_INTERATIONS);
		user.setPassword(Encodes.encodeHex(hashPassword));
	}
}
 