package com.org.utils;

import org.apache.shiro.authc.AuthenticationException;

/**
 * 
 * TODO {未查询到用户信息异常}
 *
 * @author mao.ru
 * @version 
 * @since JDK 1.7
 */
public class UserInfoNullException extends AuthenticationException{

	/**
	 * serialVersionUID:TODO(用一句话描述这个变量表示什么).
	 * @since JDK 1.7
	 */
	private static final long serialVersionUID = -2778564164885161254L;
	
	public UserInfoNullException() {
		super();
	}

	public UserInfoNullException(String message, Throwable cause) {
		super(message, cause);
	}

	public UserInfoNullException(String message) {
		super(message);
	}

	public UserInfoNullException(Throwable cause) {
		super(cause);
	}

}
