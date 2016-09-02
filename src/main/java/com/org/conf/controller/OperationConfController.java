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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.org.conf.model.DateModel;
import com.org.conf.model.OperationConf;
import com.org.conf.service.OperationConfService;
import com.org.model.shiro.ShiroUser;
import com.org.system.controller.BaseController;
import com.org.utils.ExcelReader;
import com.org.utils.Page;
import com.org.utils.PageData;

/**
 * 
 * TODO { 服务商配置管理 }
 *
 * @author mao.ru
 * @version
 * @since JDK 1.7
 */
@Controller
@RequestMapping(value = "/conf")
public class OperationConfController extends BaseController {

	@Autowired
	private OperationConfService operationConfService;

	/**
	 * 默认页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/operator")
	public ModelAndView userType(OperationConf record, Page page, ModelMap model) {
		ModelAndView mv = this.getModelAndView();
		// 应用列表分页
		PageData pd = this.getPageData();
		Long count = operationConfService.geOperationConfCountPage(record);
		List<OperationConf> operationList = operationConfService
				.getOperationConfListPage(record);
		model.put("operationList", operationList);
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
		mv.setViewName("conf/operator/operator_list");
		return mv;
	}

	/**
	 * 添加页面
	 * 
	 * @return
	 * @author DELONG 2015年5月27日下午2:11:08
	 */
	@RequestMapping(value = "/toOperatorAdd")
	public String toOperatorAdd(ModelMap model) {
		// 应用所有者
		return "conf/operator/operator_add";
	}

	/**
	 * 添加保存
	 * 
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/doOperatorAdd", method = RequestMethod.POST)
	public String doOperatorAdd(HttpServletRequest request,
			OperationConf record, ModelMap model) throws Exception {
		try {
			ShiroUser su = getShiroUser();
			record.setCreateTime(new Date());
			record.setUpdateUser(su.getId());
			operationConfService.insertSelective(record);
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
	@RequestMapping(value = "/toOperatorEdit")
	public String toOperatorEdit(@RequestParam(value = "id", required = true) Long id, ModelMap model) {
		// 依据id查询用户类型
		OperationConf record = operationConfService.selectByPrimaryKey(id);
		model.put("operationConf", record);
		return "conf/operator/operator_edit";
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
	@RequestMapping(value = "/quOperatorEdit")
	public String quOperatorEdit(
			@RequestParam(value = "id", required = true) Long id, ModelMap model) {
		// 依据id查询用户类型
		OperationConf record = operationConfService.selectByPrimaryKey(id);
		model.put("operationConf", record);
		return "conf/operator/operator_edit";
	}

	/**
	 * 编辑保存页面
	 * 
	 * @param userId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/doOperatorEdit")
	public String doOperatorEdit(OperationConf record, ModelMap model) {
		try {
			// 更新用户类型
			ShiroUser su = getShiroUser();
			record.setUpdateTime(new Date());
			record.setUpdateUser(su.getId());
			operationConfService.updateByPrimaryKeySelective(record);
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
	@RequestMapping(value = "/doOperatorDel")
	public String doOperatorDel(
			@RequestParam(value = "id", required = true) Long id, ModelMap model) {
		try {
			operationConfService.deleteByPrimaryKey(id);
		} catch (Exception e) {
			logger.error(e.toString(), e);
			model.put("msg", "failed");
		}
		return "save_result";
	}

	/**
	 * 导入
	 * 
	 * @author mao.ru
	 * @param id
	 * @param model
	 * @return
	 * @since JDK 1.7
	 */
	@RequestMapping(value = "/doImprotExcel")
	public String improtOperator(HttpServletRequest request, ModelMap model) {
		try {
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			MultipartFile mapkfile = multipartRequest.getFile("upfile");
			ShiroUser su = getShiroUser();
			List<OperationConf> list = ExcelReader.improt(mapkfile, su.getId());
			operationConfService.batchInsert(list);
			model.put("msg", "success");
		} catch (Exception e) {
			logger.error(e.toString(), e);
			model.put("msg", "failed");
		}
		return "save_result";
	}

	/**
	 * 
	 * 计费服务商===> 决定国家
	 * @author mao.ru
	 * @param request
	 * @return
	 * @since JDK 1.7
	 */
	@ResponseBody
	@RequestMapping(value = "/getCountry")
	public String getCountryByPriceServer(HttpServletRequest request,
			@RequestParam(value = "priceService", required = true) String priceService) {
		List<DateModel> list = operationConfService.getCountryAllByPriceService(priceService);
		return JSON.toJSONString(list);
	}

	/**
	 * 
	 * 计费服务商+国家-决定运营商
	 * @author mao.ru
	 * @param request
	 * @return
	 * @since JDK 1.7
	 */
	@ResponseBody
	@RequestMapping(value = "/getOperator")
	public String getOperatorByPsAndCountry(HttpServletRequest request, OperationConf record) {
		record.setCountry(record.getCountry().replaceAll("_", " "));
		List<DateModel> list = operationConfService.getOperatorAllByCountryAndPservice(record);
		return JSON.toJSONString(list);
	}

	/**
	 * 
	 *  计费服务商+国家+运营商====> 决定价格
	 * @author mao.ru
	 * @param request
	 * @return
	 * @since JDK 1.7
	 */
	@ResponseBody
	@RequestMapping(value = "/getLocalPrice")
	public String getgetLocalPriceByPsCtyAndOper(HttpServletRequest request,OperationConf record) {
		record.setCountry(record.getCountry().replaceAll("_", " "));
		record.setOperator(record.getOperator().replaceAll("_", " "));
		List<DateModel> list = operationConfService.getPriceAllByCtryPserviceAndOperator(record);
		return JSON.toJSONString(list);
	}

}
