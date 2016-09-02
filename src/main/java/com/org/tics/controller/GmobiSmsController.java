package com.org.tics.controller;

import java.io.IOException;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.org.conf.model.AppInfo;
import com.org.conf.model.DateModel;
import com.org.conf.service.AppInfoService;
import com.org.dict.service.DictService;
import com.org.model.shiro.ShiroUser;
import com.org.system.controller.BaseController;
import com.org.tics.model.GmobiSms;
import com.org.tics.service.GmobiSmsService;
import com.org.utils.FileModel;
import com.org.utils.Page;
import com.org.utils.PageData;

/**
 * 
 * TODO { 用户实时计费数据统计 }
 *
 * @author mao.ru
 * @version
 * @since JDK 1.7
 */
@Controller
@RequestMapping(value = "/tics")
public class GmobiSmsController extends BaseController {
	
	@Autowired
	private GmobiSmsService gmobiSmsService;
	
	@Autowired
	private AppInfoService appInfoService;
	
	@Autowired
	private DictService dictService;
	/**
	 * 默认页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/userprice")
	public ModelAndView userType(GmobiSms record, Page page, ModelMap model) {
		ModelAndView mv = this.getModelAndView();
		// 用户实时数据列表
		PageData pd = this.getPageData();
		Long count = gmobiSmsService.getGmobiSmsCountPage(record);
		List<GmobiSms> priceList = gmobiSmsService.getGmobiSmsListPage(record);
		model.put("priceList", priceList);
		page.setPd(pd);
		page.setTotalResult(count.intValue());// 总数
		page.setCurrentPage(page.getCurrentPage());// 当前页
		page.setShowCount(page.getShowCount());// 当前页
		mv.addObject("pd", pd);
		// 计费国家
		List<DateModel> countrys = dictService.getCountryAll();
		model.put("countrys", countrys);
		// 应用名称
		List<AppInfo> appnames = appInfoService.getAllAppInfo();
		model.put("appnames", appnames);
		// 渠道名称
		List<DateModel> channels = dictService.getChannelAll();
		model.put("channels", channels);
		//计费点
		List<DateModel> pricesinfo = dictService.getPriceInfoAll();
		model.put("pricesinfo", pricesinfo);
		mv.setViewName("tics/userprice/userprice_list");
		return mv;
	}
	
	
	@RequestMapping("/userprice/download")  
	public ResponseEntity<byte[]> download(GmobiSms record) throws IOException {  
		ShiroUser su = getShiroUser();
		FileModel filem = gmobiSmsService.getGmobiSmsFile(record,su.getLoginName(),null);
	    HttpHeaders headers = new HttpHeaders();  
	    headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);  
	    headers.setContentDispositionFormData("attachment", filem.getFileName()); 
	    return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(filem.getFile()),headers, HttpStatus.CREATED);  
	}

}
