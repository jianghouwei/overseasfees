package com.org.system.controller;

import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.org.sysetem.service.MenuService;
import com.org.system.model.Resource;
import com.org.system.model.UserInfo;
/*
 * 总入口
 */
@Controller
public class LoginController extends BaseController{
	
	@Autowired
	private MenuService menuService;
	/**
	 * 访问登录页
	 * @return
	 */
	@RequestMapping(value="/welcome")
	public ModelAndView toLogin()throws Exception{
		ModelAndView mv = this.getModelAndView();
		Subject subject = SecurityUtils.getSubject();
		UserInfo userinfo = this.getUserInfo();
		if((subject.isAuthenticated()||subject.isRemembered())&& userinfo != null){
			List<Resource> menuList = menuService.getMenusByUserId(userinfo.getId());
			mv.addObject("menuList", menuList);
			mv.setViewName("system/admin/index");
			return mv;
		}
		mv.setViewName("system/admin/login");
		return mv;
	}
	

	/**
	 * 登陆成功
	 * @return
	 */
	@RequestMapping(value="admin/index",method = RequestMethod.GET)
	public ModelAndView login() {
		ModelAndView mv = this.getModelAndView();
		Subject subject = SecurityUtils.getSubject();
		UserInfo userinfo = this.getUserInfo();
		if((subject.isAuthenticated()||subject.isRemembered())&& userinfo != null){
			List<Resource> menuList = menuService.getMenusByUserId(userinfo.getId());
			mv.addObject("menuList", menuList);
			mv.setViewName("system/admin/index");
			return mv;
		}
		mv.setViewName("system/admin/login");
		return mv;
	}
	
	/**
	 * 登录失败
	 * @param userName
	 * @param model
	 * @return
	 */
	@RequestMapping(value="login",method = RequestMethod.POST)
	public ModelAndView fail(@RequestParam(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM) String userName, Model model) {
		model.addAttribute(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM, userName);
		ModelAndView mv = this.getModelAndView();
		Subject subject = SecurityUtils.getSubject();
		UserInfo userinfo = this.getUserInfo();
		if((subject.isAuthenticated()||subject.isRemembered())&& userinfo != null){
			List<Resource> menuList = menuService.getMenusByUserId(userinfo.getId());
			mv.addObject("menuList", menuList);
			mv.setViewName("system/admin/index");
			return mv;
		}
		mv.setViewName("system/admin/login");
		return mv;
	}

	/**
	 * 登出
	 * @param userName
	 * @param model
	 * @return
	 */
	@RequestMapping(value="logout")
	public ModelAndView logout(Model model) {
		Subject subject = SecurityUtils.getSubject();
		subject.logout();
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/admin/login");
		return mv;
	}
	
	/**
	 * 进入tab标签
	 * @return
	 */
	@RequestMapping(value="/tab")
	public String tab(){
		return "system/admin/tab";
	}
	
	
	/**
	 * 进入首页后的默认页面
	 * @return
	 */
	@RequestMapping(value="/login_default")
	public String defaultPage(){
		return "system/admin/default";
	}
	
	
	
	
	
	
}
