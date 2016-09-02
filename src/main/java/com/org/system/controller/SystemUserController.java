package com.org.system.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.org.model.shiro.ShiroUser;
import com.org.sysetem.service.RolesService;
import com.org.sysetem.service.UserInfoService;
import com.org.sysetem.service.UserTypeService;
import com.org.system.model.Role;
import com.org.system.model.UserInfo;
import com.org.system.model.UserRole;
import com.org.system.model.UserType;
import com.org.utils.Page;
import com.org.utils.PageData;
import com.org.utils.UserUtil;

@Controller
@RequestMapping(value = "system")
public class SystemUserController extends BaseController {
	@Autowired
	private RolesService rolesService;

	@Autowired
	private UserTypeService userTypeService;
	
	@Autowired
	private UserInfoService userInfoService;
	
	/**
	 * 校验用户
	 * @param userId
	 * @param userName
	 * @param response
	 * @param model
	 * @throws Exception
	 * @author DELONG 2015年5月27日下午2:13:19
	 */
	//@RequiresPermissions(value={"user:create","user:update"},logical=Logical.OR)
	@ResponseBody
	@RequestMapping(value="/validateUser")
	public String validateUser(
			@RequestParam(value = "userId", required = false) Integer userId,
			@RequestParam(value = "loginName", required = true) String loginName,
			HttpServletResponse response,ModelMap model)throws Exception{
		UserInfo user = userInfoService.selectByLoginName(loginName);
		Map<String,Object> result = new HashMap<String,Object>();
		if(user != null){
			result.put("result", "failed");
		}else{
			result.put("result", "success");
		}
		return JSON.toJSONString(result);
	}
	/**
	 * 默认页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "userinfo")
	public ModelAndView userInfo(UserInfo userInfo,Page page, ModelMap model) {
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		Long count  = userInfoService.getUserCountPage(userInfo);
		List<UserInfo> userList = userInfoService.getUserListPage(userInfo);
		List<Role> roles = rolesService.queryRoles();
		List<UserType> userTypes = userTypeService.queryUserTypes();
		page.setPd(pd);
		page.setTotalResult(count.intValue());//总数
		page.setCurrentPage(page.getCurrentPage());//当前页
		page.setShowCount(page.getShowCount());//当前页
		model.put("userList", userList);
		model.put("roleList", roles);
		model.put("userTypes", userTypes);
		mv.addObject("pd", pd);
		mv.setViewName("system/user/user_list");
		return mv;
	}
	
	
	/**
	 * 用户添加页面
	 * @return
	 * @author DELONG 2015年5月27日下午2:11:08
	 */
	//@RequiresPermissions("user:create")
	@RequestMapping(value="/toAddUser")
	public String toAddUser(ModelMap model){
		List<Role> roles = rolesService.queryRoles();
		List<UserType> userTypes = userTypeService.queryUserTypes();
		model.put("userTypes", userTypes);
		model.put("roleList", roles);
		return "system/user/user_add";
	}
	
	/**
	 * 用户添加保存
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
//	@RequiresPermissions("user:create")
	@RequestMapping(value = "/doAddUser",method = RequestMethod.POST)
	public String doAddUser(HttpServletRequest request,UserInfo userInfo,ModelMap model)throws Exception{
		try {
			ShiroUser su = getShiroUser();
			UserUtil.entryptPassword(userInfo);
			userInfo.setCreateTime(new Date());
			userInfo.setCreateUser(su.getId());
			userInfo.setUpdateTime(new Date());
			userInfo.setUpdateUser(su.getId());
			Long userId = userInfoService.insertSelective(userInfo);
			if(userInfo !=null && userInfo.getRoleId() != null){
				//维护用户和角色
				UserRole record = new UserRole();
				record.setRoleId(userInfo.getRoleId());
				record.setUserId(userId);
				rolesService.insert(record);
			}
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
//	@RequiresPermissions("user:update")
	@RequestMapping(value="/toEditUser")
	public String toEditUser( @RequestParam(value="userId",required=true) Long userId,
			ModelMap model){
		UserInfo user = userInfoService.selectAllByUserId(userId);
		model.put("user", user);
		List<Role> roles = rolesService.queryRoles();
		List<UserType> userTypes = userTypeService.queryUserTypes();
		model.put("userTypes", userTypes);
		model.put("roleList", roles);
		return "system/user/user_edit";
	}
	
	/**
	 * 用户编辑页面
	 * @param userId
	 * @param model
	 * @return
	 */
//	@RequiresPermissions("user:update")
	@RequestMapping(value="/doEditUser")
	public String doEditUser(UserInfo userInfo, ModelMap model){
		try {
			ShiroUser su = getShiroUser();
			UserInfo user = userInfoService.selectAllByUserId(userInfo.getId());
			if(!(user.getPassword()).equals(userInfo.getPassword())){
				UserUtil.entryptPassword(userInfo);
			}
			userInfo.setUpdateTime(new Date());
			userInfo.setUpdateUser(su.getId());
			userInfoService.updateByPrimaryKeySelective(userInfo);
			if(userInfo !=null && userInfo.getRoleId() != null){
				//维护用户和角色
				UserRole record = new UserRole();
				record.setRoleId(userInfo.getRoleId());
				record.setUserId(userInfo.getId());
				Set<String> set = rolesService.getRolesByUserId(userInfo.getId());
				if(set.isEmpty()){
					rolesService.insert(record);
				}else{
					rolesService.updateUserRoleByUserIdSelective(record);//一个用户对应一个角色
				}
				
			}
			model.put("msg","success");
		} catch (Exception e) {
			logger.error(e.toString(), e);
			model.put("msg","failed");
		}
		return "save_result";
	}
	
	@RequestMapping(value="/doDelUser")
	public String doDelUser(@RequestParam(value="userId",required=true) Long userId,
			ModelMap model){
		try {
			rolesService.deleteByRoleUserUserId(userId);
			userInfoService.deleteByPrimaryKey(userId);
		} catch (Exception e) {
			logger.error(e.toString(), e);
			model.put("msg","failed");
		}
		return "save_result";
	}

}
