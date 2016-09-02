package com.org.utils;

import org.apache.shiro.authc.AuthenticationException;

/**
 * 验证码异常类
 */
public class CaptchaException extends AuthenticationException {


	/**
	 * serialVersionUID:TODO(用一句话描述这个变量表示什么).
	 * @since JDK 1.7
	 */
	private static final long serialVersionUID = -8679667557436399761L;

	public CaptchaException() {
		super();
	}

	public CaptchaException(String message, Throwable cause) {
		super(message, cause);
	}

	public CaptchaException(String message) {
		super(message);
	}

	public CaptchaException(Throwable cause) {
		super(cause);
	}
}