package com.org.system.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.org.model.shiro.ShiroUser;
import com.org.system.model.UserInfo;
import com.org.utils.Logger;
import com.org.utils.Page;
import com.org.utils.PageData;
import com.org.utils.UuidUtil;

public class BaseController {

	protected Logger logger = Logger.getLogger(this.getClass());

	
	/**
	 * 
	 * 获取用户角色权限
	 *
	 * @author mao.ru
	 * @return
	 * @since JDK 1.7
	 */
	protected ShiroUser getShiroUser(){
		return (ShiroUser) SecurityUtils.getSubject().getSession().getAttribute("shiroUser");
	}
	
	/**
	 * 
	 * 获取用户信息
	 * @author mao.ru
	 * @return
	 * @since JDK 1.7
	 */
	protected UserInfo getUserInfo(){
		return (UserInfo) SecurityUtils.getSubject().getSession().getAttribute("user");
	}
	/**
	 * 得到PageData
	 */
	public PageData getPageData(){
		return new PageData(this.getRequest());
	}
	
	/**
	 * 得到ModelAndView
	 */
	public ModelAndView getModelAndView(){
		return new ModelAndView();
	}
	
	/**
	 * 得到request对象
	 */
	public HttpServletRequest getRequest() {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		
		return request;
	}

	/**
	 * 得到32位的uuid
	 * @return
	 */
	public String get32UUID(){
		
		return UuidUtil.get32UUID();
	}
	
	/**
	 * 得到分页列表的信息 
	 */
	public Page getPage(){
		
		return new Page();
	}
	
	public static void logBefore(Logger logger, String interfaceName){
		logger.info("");
		logger.info("start");
		logger.info(interfaceName);
	}
	
	public static void logAfter(Logger logger){
		logger.info("end");
		logger.info("");
	}
}
