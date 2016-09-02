package com.org.system.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.org.model.shiro.ShiroUser;
import com.org.sysetem.service.UserTypeService;
import com.org.system.model.UserType;
import com.org.utils.Page;
import com.org.utils.PageData;


@Controller
@RequestMapping(value = "system")
public class UserTypeController extends BaseController{

	@Autowired
	private UserTypeService userTypeService;
	/**
	 * 默认页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/usertype")
	public ModelAndView userType(UserType userType,Page page, ModelMap model) {
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		Long count  = userTypeService.getUserTypeCountPage(userType);
		List<UserType> userList = userTypeService.getUserTypeListPage(userType);
		page.setPd(pd);
		page.setTotalResult(count.intValue());//总数
		page.setCurrentPage(page.getCurrentPage());//当前页
		page.setShowCount(page.getShowCount());//当前页
		model.put("typeList", userList);
		mv.addObject("pd", pd);
		mv.setViewName("system/usertype/usertype_list");
		return mv;
	}
	
	
	/**
	 * 用户添加页面
	 * @return
	 * @author DELONG 2015年5月27日下午2:11:08
	 */
	@RequestMapping(value="/toAddUserType")
	public String toAddUserType(ModelMap model){
		return "system/usertype/usertype_add";
	}
	
	/**
	 * 用户添加保存
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/doAddUserType",method = RequestMethod.POST)
	public String doAddUserType(HttpServletRequest request,UserType userType,ModelMap model)throws Exception{
		try {
			ShiroUser su = getShiroUser();
			userType.setCreateTime(new Date());
			userType.setCreateUser(su.getId());
			userTypeService.insertSelective(userType);
			//更新用户类型
			model.put("msg","success");
		} catch (Exception e) {
			logger.error(e.toString(), e);
			model.put("msg","failed");
		}
		return "save_result";
	}
	
	/**
	 * 用户编辑页面
	 * @param userId
	 * @param model
	 * @return
	 * @author DELONG 2015年5月27日下午2:12:45
	 */
	@RequestMapping(value="/toEditUserType")
	public String toEditUserType( @RequestParam(value="typeId",required=true) Long typeId,
			ModelMap model){
		//依据id查询用户类型
		UserType userType = userTypeService.selectByPrimaryKey(typeId);
		model.put("usertype", userType);
		return "system/usertype/usertype_edit";
	}
	
	/**
	 * 用户编辑页面
	 * @param userId
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/doEditUserType")
	public String doEditUserType(UserType userType, ModelMap model){
		try {
			//更新用户类型
			ShiroUser su = getShiroUser();
			userType.setCreateTime(new Date());
			userType.setCreateUser(su.getId());
			userTypeService.updateByPrimaryKeySelective(userType);
			model.put("msg","success");
		} catch (Exception e) {
			logger.error(e.toString(), e);
			model.put("msg","failed");
		}
		return "save_result";
	}
	
	@RequestMapping(value="/doDelUserType")
	public String doDelUserType(@RequestParam(value="typeId",required=true) Long typeId,
			ModelMap model){
		try {
			//删除用户类型
			userTypeService.deleteByPrimaryKey(typeId);
		} catch (Exception e) {
			logger.error(e.toString(), e);
			model.put("msg","failed");
		}
		return "save_result";
	}
}
