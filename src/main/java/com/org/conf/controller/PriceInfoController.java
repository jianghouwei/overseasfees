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
import com.org.conf.model.DateModel;
import com.org.conf.model.OperationConf;
import com.org.conf.model.PriceInfo;
import com.org.conf.service.AppInfoService;
import com.org.conf.service.OperationConfService;
import com.org.conf.service.PriceInfoService;
import com.org.model.shiro.ShiroUser;
import com.org.system.controller.BaseController;
import com.org.utils.Page;
import com.org.utils.PageData;
import com.org.utils.UuidUtil;

/**
 * 
 * TODO { 计费点配置管理 }
 *
 * @author mao.ru
 * @version
 * @since JDK 1.7
 */
@Controller
@RequestMapping(value = "/conf")
public class PriceInfoController extends BaseController {

	@Autowired
	private PriceInfoService priceInfoService;

	@Autowired
	private AppInfoService appInfoService;

	@Autowired
	private OperationConfService operationConfService;

	/**
	 * 默认页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/bpoint")
	public ModelAndView userType(PriceInfo record, Page page, ModelMap model) {
		ModelAndView mv = this.getModelAndView();
		// 应用列表分页
		PageData pd = this.getPageData();
		Long count = priceInfoService.getPriceInfoCountPage(record);
		List<PriceInfo> priceList = priceInfoService.getPriceInfoListPage(record);
		model.put("priceList", priceList);
		page.setPd(pd);
		page.setTotalResult(count.intValue());// 总数
		page.setCurrentPage(page.getCurrentPage());// 当前页
		page.setShowCount(page.getShowCount());// 当前页
		mv.addObject("pd", pd);
		// 国家
		List<DateModel> countrys = operationConfService.getCountryAll();
		model.put("countrys", countrys);
		// 运营商
		List<DateModel> operators = operationConfService.getOperatorAll();
		model.put("operators", operators);
		// 计费服务提供商
		List<DateModel> priceservices = operationConfService
				.getPriceServiceAll();
		model.put("priceservices", priceservices);
		// 应用名称
		List<AppInfo> appnames = appInfoService.getAllAppInfo();
		model.put("appnames", appnames);
		mv.setViewName("conf/operator/bpoint_list");
		return mv;
	}

	/**
	 * 添加页面
	 * 
	 * @return
	 * @author DELONG 2015年5月27日下午2:11:08
	 */
	@RequestMapping(value = "/toBpointAdd")
	public String toBpointAdd(ModelMap model) {
		// 应用名称
		List<AppInfo> appnames = appInfoService.getAllAppInfo();
		model.put("appnames", appnames);
		// 计费服务提供商
		List<DateModel> priceservices = operationConfService.getPriceServiceAll();
		model.put("priceservices", priceservices);
		return "conf/operator/bpoint_add";
	}

	/**
	 * 添加保存
	 * 
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/doBpointAdd", method = RequestMethod.POST)
	public String doBpointAdd(HttpServletRequest request, PriceInfo record,
			ModelMap model) throws Exception {
		try {
			ShiroUser su = getShiroUser();
			record.setCreateTime(new Date());
			record.setCreateUser(su.getId());
			record.setPriceId(UuidUtil.getPriceCode());
			if (record.getPriceType().equals("2")) {
				// 自适应时
				record.setQcId(null);
			}else{
				//固定 世界价格为空
				record.setGlobalPrice(null);
			}
			record.setStatus("2");// 默认是不生效
			priceInfoService.insertSelective(record);
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
	@RequestMapping(value = "/toBpointEdit")
	public String toBpointEdit(
			@RequestParam(value = "id", required = true) Long id, ModelMap model) {
		// 应用名称
		List<AppInfo> appnames = appInfoService.getAllAppInfo();
		model.put("appnames", appnames);
		// 依据id查询用户类型
		PriceInfo record = priceInfoService.selectByPrimaryKey(id);
		if (record.getPriceType().equals("1")) {
			// 计费服务提供商
			List<DateModel> priceservices = operationConfService
					.getPriceServiceAll();
			model.put("priceservices", priceservices);
			// 国家
			List<DateModel> countrys = operationConfService
					.getCountryAllByPriceService(record.getPriceService());
			model.put("countrys", countrys);
			// 运营商
			OperationConf oc = new OperationConf();
			oc.setCountry(record.getCountry());
			oc.setPriceService(record.getPriceService());
			List<DateModel> operators = operationConfService
					.getOperatorAllByCountryAndPservice(oc);
			model.put("operators", operators);
			// 当地价格
			oc.setOperator(record.getOperator());
			List<DateModel> localPrices = operationConfService
					.getPriceAllByCtryPserviceAndOperator(oc);
			model.put("localPrices", localPrices);
			record.setLocalPriceStr(String.valueOf(record.getLocalPrice()));
		} 
		model.put("priceInfo", record);
		return "conf/operator/bpoint_edit";
	}

	/**
	 * 编辑保存页面
	 * 
	 * @param userId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/doBpointEdit")
	public String doBpointEdit(PriceInfo record, ModelMap model) {
		try {
			// 更新用户类型
			ShiroUser su = getShiroUser();
			record.setUpdateTime(new Date());
			record.setUpdateUser(su.getId());
			if (record.getPriceType().equals("2")) {
				// 自适应时 
				record.setQcId(null);
			}else{
				//固定 世界价格为空
				record.setGlobalPrice(null);
			}
			record.setStatus("2");// 默认是不生效
			priceInfoService.updateByPrimaryKeySelective(record);
			model.put("msg", "success");
		} catch (Exception e) {
			logger.error(e.toString(), e);
			model.put("msg", "failed");
		}
		return "save_result";
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
	@RequestMapping(value = "/quBpointEdit")
	public String quBpointEdit(
			@RequestParam(value = "id", required = true) Long id, ModelMap model) {
		// 依据id查询用户类型
		PriceInfo record = priceInfoService.selectByPrimaryKey(id);
		model.put("appinfo", record);
		// 计费服务提供商
		List<DateModel> priceservices = operationConfService
				.getPriceServiceAll();
		model.put("priceservices", priceservices);
		return "conf/operator/bpoint_edit";
	}

	/**
	 *
	 * 删除
	 * 
	 * @author mao.ru
	 * @param id
	 * @param model
	 * @return
	 * @since JDK 1.7
	 */
	@RequestMapping(value = "/doBpointDel")
	public String doBpointDel(
			@RequestParam(value = "id", required = true) Long id, ModelMap model) {
		try {
			priceInfoService.deleteByPrimaryKey(id);
			model.put("msg", "success");
		} catch (Exception e) {
			logger.error(e.toString(), e);
			model.put("msg", "failed");
		}
		return "save_result";
	}

	/**
	 *
	 * 变更状态
	 * 
	 * @author mao.ru
	 * @param id
	 * @param model
	 * @return
	 * @since JDK 1.7
	 */
	@RequestMapping(value = "/changeStatus")
	public String changeStatus(
			@RequestParam(value = "id", required = true) Long id,
			@RequestParam(value = "status", required = true) String status,
			ModelMap model) {
		try {
			PriceInfo record = new PriceInfo();
			record.setId(id);
			record.setStatus(status);
			priceInfoService.updateByPrimaryKeySelective(record);
			model.put("msg", "success");
		} catch (Exception e) {
			logger.error(e.toString(), e);
			model.put("msg", "failed");
		}
		return "save_result";
	}

}
