package com.org.conf.controller;

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

import com.org.conf.model.AppInfo;
import com.org.conf.service.AppInfoService;
import com.org.model.shiro.ShiroUser;
import com.org.sysetem.service.UserInfoService;
import com.org.system.controller.BaseController;
import com.org.system.model.UserInfo;
import com.org.utils.Page;
import com.org.utils.PageData;
import com.org.utils.UuidUtil;

/**
 * 
 * TODO { 应用配置管理 }
 *
 * @author mao.ru
 * @version
 * @since JDK 1.7
 */
@Controller
@RequestMapping(value = "/conf")
public class AppInfoController extends BaseController {

	@Autowired
	private AppInfoService appInfoService;

	@Autowired
	private UserInfoService userInfoService;

	/**
	 * 默认页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/apply")
	public ModelAndView userType(AppInfo record, Page page, ModelMap model) {
		ModelAndView mv = this.getModelAndView();
		// 应用列表分页
		PageData pd = this.getPageData();
		Long count = appInfoService.getAppInfoCountPage(record);
		List<AppInfo> appList = appInfoService.getAppInfoListPage(record);
		model.put("appList", appList);
		page.setPd(pd);
		page.setTotalResult(count.intValue());// 总数
		page.setCurrentPage(page.getCurrentPage());// 当前页
		page.setShowCount(page.getShowCount());// 当前页
		mv.addObject("pd", pd);
		// 应用下拉列表
		List<AppInfo> appnames = appInfoService.getAllAppInfo();
		model.put("appnames", appnames);
		// 应用所有者
		List<UserInfo> users = userInfoService.getUserInfoList();
		model.put("users", users);
		mv.setViewName("conf/appinfo/appinfo_list");
		return mv;
	}

	/**
	 * 用户添加页面
	 * 
	 * @return
	 * @author DELONG 2015年5月27日下午2:11:08
	 */
	@RequestMapping(value = "/toApplyAdd")
	public String toApplyAdd(ModelMap model) {
		// 应用所有者
		List<UserInfo> users = userInfoService.getUserInfoList();
		model.put("users", users);
		return "conf/appinfo/appinfo_add";
	}

	/**
	 * 用户添加保存
	 * 
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/doApplyAdd", method = RequestMethod.POST)
	public String doApplyAdd(HttpServletRequest request, AppInfo record,
			ModelMap model) throws Exception {
		try {
			ShiroUser su = getShiroUser();
			record.setCreateTime(new Date());
			record.setCreateUser(su.getId());
			record.setAppId(UuidUtil.getAppCode());
			appInfoService.insertSelective(record);
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
	@RequestMapping(value = "/toApplyEdit")
	public String toApplyEdit(
			@RequestParam(value = "id", required = true) Long id, ModelMap model) {
		// 依据id查询用户类型
		AppInfo record = appInfoService.selectByPrimaryKey(id);
		model.put("appinfo", record);
		// 应用所有者
		List<UserInfo> users = userInfoService.getUserInfoList();
		model.put("users", users);
		return "conf/appinfo/appinfo_edit";
	}
	
	/**
	 * 查询页面
	 * 
	 * @param userId
	 * @param model
	 * @return
	 * @author DELONG 2015年5月27日下午2:12:45
	 */
	@RequestMapping(value = "/quApplyEdit")
	public String quApplyEdit(@RequestParam(value = "id", required = true) Long id, ModelMap model) {
		// 依据id查询用户类型
		AppInfo record = appInfoService.selectByPrimaryKey(id);
		model.put("appinfo", record);
		// 应用所有者
		List<UserInfo> users = userInfoService.getUserInfoList();
		model.put("users", users);
		return "conf/appinfo/appinfo_edit";
	}

	/**
	 * 用户编辑页面
	 * 
	 * @param userId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/doApplyEdit")
	public String doApplyEdit(AppInfo record, ModelMap model) {
		try {
			// 更新用户类型
			ShiroUser su = getShiroUser();
			record.setUpdateTime(new Date());
			record.setUpdateUser(su.getId());
			appInfoService.updateByPrimaryKeySelective(record);
			model.put("msg", "success");
		} catch (Exception e) {
			logger.error(e.toString(), e);
			model.put("msg", "failed");
		}
		return "save_result";
	}

	@RequestMapping(value = "/doApplyDel")
	public String doApplyDel(
			@RequestParam(value = "id", required = true) Long id,
			ModelMap model) {
		try {
			// 删除用户类型
			appInfoService.deleteByPrimaryKey(id);
		} catch (Exception e) {
			logger.error(e.toString(), e);
			model.put("msg", "failed");
		}
		return "save_result";
	}
}
