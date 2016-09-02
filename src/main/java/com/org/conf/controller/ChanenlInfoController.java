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
import com.org.conf.model.ChanenlInfo;
import com.org.conf.service.AppInfoService;
import com.org.conf.service.ChanenlInfoService;
import com.org.model.shiro.ShiroUser;
import com.org.sysetem.service.UserInfoService;
import com.org.system.controller.BaseController;
import com.org.system.model.UserInfo;
import com.org.utils.Page;
import com.org.utils.PageData;

/**
 * 
 * TODO { 渠道配置管理 }
 *
 * @author mao.ru
 * @version
 * @since JDK 1.7
 */
@Controller
@RequestMapping(value = "/conf")
public class ChanenlInfoController extends BaseController {

	@Autowired
	private ChanenlInfoService chanenlInfoService;

	@Autowired
	private AppInfoService appInfoService;

	@Autowired
	private UserInfoService userInfoService;

	/**
	 * 默认页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/channel")
	public ModelAndView userType(ChanenlInfo record, Page page, ModelMap model) {
		ModelAndView mv = this.getModelAndView();
		// 应用列表分页
		PageData pd = this.getPageData();
		Long count = chanenlInfoService.getChanenlInfoCountPage(record);
		List<ChanenlInfo> channelList = chanenlInfoService
				.getChanenlInfoListPage(record);
		model.put("channelList", channelList);
		page.setPd(pd);
		page.setTotalResult(count.intValue());// 总数
		page.setCurrentPage(page.getCurrentPage());// 当前页
		page.setShowCount(page.getShowCount());// 当前页
		mv.addObject("pd", pd);
		// 渠道所有者
		List<UserInfo> channelusers = userInfoService.getUserInfoByUserType(3L);
		model.put("channelusers", channelusers);
		mv.setViewName("conf/channel/channel_list");
		return mv;
	}

	/**
	 * 添加页面
	 * 
	 * @return
	 * @author DELONG 2015年5月27日下午2:11:08
	 */
	@RequestMapping(value = "/toChannelAdd")
	public String toChannelAdd(ModelMap model) {
		// 应用下拉列表
		List<AppInfo> appnames = appInfoService.getAllAppInfo();
		model.put("appnames", appnames);
		// 渠道所有者
		List<UserInfo> users = userInfoService.getUserInfoByUserType(3L);
		model.put("users", users);
		return "conf/channel/channel_add";
	}

	/**
	 * 添加保存
	 * 
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/doChannelAdd", method = RequestMethod.POST)
	public String doApplyAdd(HttpServletRequest request, ChanenlInfo record,
			ModelMap model) throws Exception {
		try {
			ShiroUser su = getShiroUser();
			record.setCreateTime(new Date());
			record.setCreateUser(su.getId());
			chanenlInfoService.insertSelective(record);
			model.put("msg", "success");
		} catch (Exception e) {
			logger.error(e.toString(), e);
			model.put("msg", "failed");
		}
		return "save_result";
	}

	/**
	 * 编辑页面
	 * 
	 * @param userId
	 * @param model
	 * @return
	 * @author DELONG 2015年5月27日下午2:12:45
	 */
	@RequestMapping(value = "/toChannelEdit")
	public String toApplyEdit(
			@RequestParam(value = "id", required = true) Long id, ModelMap model) {
		// 依据id查询用户类型
		ChanenlInfo record = chanenlInfoService.selectByPrimaryKey(id);
		model.put("channelinfo", record);
		// 应用下拉列表
		List<AppInfo> appnames = appInfoService.getAllAppInfo();
		model.put("appnames", appnames);
		// 渠道所有者
		List<UserInfo> channelusers = userInfoService.getUserInfoByUserType(3L);
		model.put("channelusers", channelusers);
		return "conf/channel/channel_edit";
	}

	/**
	 * 
	 * 查询页面
	 * 
	 * @param userId
	 * @param model
	 * @return
	 * @author DELONG 2015年5月27日下午2:12:45
	 */
	@RequestMapping(value = "/quChannelEdit")
	public String quApplyEdit(
			@RequestParam(value = "id", required = true) Long id, ModelMap model) {
		// 依据id查询用户类型
		ChanenlInfo record = chanenlInfoService.selectByPrimaryKey(id);
		model.put("chanenlInfo", record);
		// 应用所有者
		List<UserInfo> users = userInfoService.getUserInfoList();
		model.put("users", users);
		return "conf/channel/channel_edit";
	}

	/**
	 * 编辑保存页面
	 * 
	 * @param userId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/doChannelEdit")
	public String doChannelEdit(ChanenlInfo record, ModelMap model) {
		try {
			// 更新用户类型
			ShiroUser su = getShiroUser();
			record.setUpdateTime(new Date());
			record.setUpdateUser(su.getId());
			chanenlInfoService.updateByPrimaryKeySelective(record);
			model.put("msg", "success");
		} catch (Exception e) {
			logger.error(e.toString(), e);
			model.put("msg", "failed");
		}
		return "save_result";
	}

	/**
	 * 
	 *
	 * 删除
	 * 
	 * @author mao.ru
	 * @param id
	 * @param model
	 * @return
	 * @since JDK 1.7
	 */
	@RequestMapping(value = "/doChannelDel")
	public String doChannelDel(
			@RequestParam(value = "id", required = true) Long id, ModelMap model) {
		try {
			chanenlInfoService.deleteByPrimaryKey(id);
		} catch (Exception e) {
			logger.error(e.toString(), e);
			model.put("msg", "failed");
		}
		return "save_result";
	}
}
