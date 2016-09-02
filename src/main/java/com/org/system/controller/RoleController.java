package com.org.system.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import com.org.sysetem.service.PermissionService;
import com.org.sysetem.service.RolesService;
import com.org.system.model.Permission;
import com.org.system.model.Resource;
import com.org.system.model.Role;
import com.org.utils.Page;
import com.org.utils.PageData;

@Controller
@RequestMapping(value = "system")
public class RoleController extends BaseController {

	@Autowired
	private RolesService rolesService;

	@Autowired
	private PermissionService permissionService;
	

	/**
	 * 默认页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/role")
	public ModelAndView role(Role role, Page page, ModelMap model) {
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		Long count = rolesService.getRoleCountPage(role);
		List<Role> rolelist = rolesService.getRoleListPage(role);
		page.setPd(pd);
		page.setTotalResult(count.intValue());// 总数
		page.setCurrentPage(page.getCurrentPage());// 当前页
		page.setShowCount(page.getShowCount());// 当前页
		model.put("rolelist", rolelist);
		mv.addObject("pd", pd);
		mv.setViewName("system/role/role_list");
		return mv;
	}

	/**
	 * 用户添加页面
	 * 
	 * @return
	 * @author DELONG 2015年5月27日下午2:11:08
	 */
	@RequestMapping(value = "/toRoleAdd")
	public String toRoleAdd(ModelMap model) {
		return "system/role/role_add";
	}

	/**
	 * 用户添加保存
	 * 
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/doRoleAdd", method = RequestMethod.POST)
	public String doRoleAdd(HttpServletRequest request, Role role,
			ModelMap model) throws Exception {
		try {
			ShiroUser su = getShiroUser();
			role.setCreateTime(new Date());
			role.setCreateUser(su.getId());
			rolesService.insertRoleSelective(role);
			// 更新用户类型
			model.put("msg", "success");
		} catch (Exception e) {
			logger.error(e.toString(), e);
			model.put("msg", "failed");
		}
		return "save_result";
	}

	/**
	 * 用户编辑页面
	 * 
	 * @param userId
	 * @param model
	 * @return
	 * @author DELONG 2015年5月27日下午2:12:45
	 */
	@RequestMapping(value = "/toRoleEdit")
	public String toRoleEdit(
			@RequestParam(value = "roleId", required = true) Long roleId,
			ModelMap model) {
		// 依据id查询用户类型
		Role role = rolesService.selectRoleByPrimaryKey(roleId);
		model.put("role", role);
		return "system/role/role_edit";
	}

	/**
	 * 用户编辑页面
	 * 
	 * @param userId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/doRoleEdit")
	public String doRoleEdit(Role role, ModelMap model) {
		try {
			// 更新用户类型
			ShiroUser su = getShiroUser();
			role.setCreateTime(new Date());
			role.setCreateUser(su.getId());
			rolesService.updateRoleByPrimaryKeySelective(role);
			model.put("msg", "success");
		} catch (Exception e) {
			logger.error(e.toString(), e);
			model.put("msg", "failed");
		}
		return "save_result";
	}

	@RequestMapping(value = "/doDelRole")
	public String doDelRole(
			@RequestParam(value = "roleId", required = true) Long roleId,
			ModelMap model) {
		try {
			// 删除角色
			rolesService.deleteRoleByPrimaryKey(roleId);
			// 依据角色删除用户角色关系
			rolesService.deleteRoleUserByRoleId(roleId);
			// 依据角色删除角色权限关系
			permissionService.delPermissionByRoleId(roleId);
		} catch (Exception e) {
			logger.error(e.toString(), e);
			model.put("msg", "failed");
		}
		return "save_result";
	}

	/**
	 * 权限分配菜单跳转
	 * 
	 * @author mao.ru
	 * @param roleId
	 * @param model
	 * @return
	 * @since JDK 1.7
	 */
	@RequestMapping(value = "/tojurisdiction")
	public String toJurisdiction(
			@RequestParam(value = "roleId", required = true) Long roleId,
			ModelMap model) {
		try {
			List<Map<String, Object>> trees = new ArrayList<Map<String, Object>>();
			List<Resource> list = permissionService.queryPermissionByAll(roleId);
			for (Resource r : list) {
				Map<String, Object> node = new HashMap<String, Object>();
				node.put("id", r.getId());
				node.put("pId", r.getLevelPid());
				node.put("name", r.getName());
				if (r != null && r.getRoleId() != null) {
					node.put("checked", Boolean.TRUE);
				} else {
					node.put("checked", Boolean.FALSE);
				}
				trees.add(node);
			}
			model.put("roleId", roleId);
			model.put("zTreeNodes", JSON.toJSONString(trees));
		} catch (Exception e) {
			logger.error(e.toString(), e);
			model.put("msg", "failed");
		}
		return "system/role/role_button";
	}
	@RequestMapping(value = "/dojurisdiction")
	@ResponseBody
	public String doJurisdiction(
			@RequestParam(value = "roleId", required = true) Long roleId,
			@RequestParam(value = "menuIds", required = false) String menuIds,
			ModelMap model) {	 
		try {
			if (menuIds == null || menuIds == "") {
				// 依据用户角色 删除所有角色权限关系
				permissionService.delPermissionByRoleId(roleId);
			} else {
				String[] arrIds = menuIds.split(",");
				// 删除所有角色权限
				permissionService.delPermissionByRoleId(roleId);
				// 插入所有权限角色信息
				for(int i = 0 ; i < arrIds.length ; i ++){
					if(arrIds[i] != null){
						Permission record = new Permission();
						record.setRoleId(roleId);
						record.setResourceId(Long.valueOf(arrIds[i]));
						permissionService.insertSelective(record);
					}
				}
			}
			return "save_result";
		} catch (Exception e) {
			logger.error(e.toString(), e);
			model.put("msg", "failed");
		}
		return "save_result";
	}

}
