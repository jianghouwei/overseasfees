package com.org.system.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.org.sysetem.service.MenuService;
import com.org.system.model.Resource;
import com.org.utils.TreeNodeUtils;


@Controller
@RequestMapping(value="/system")
public class MenusController extends BaseController{

	@Autowired
	private MenuService menuService;
	/**
	 * 显示菜单列表
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/rources")
	public String rources(ModelMap model)throws Exception{
		List<Resource> list =TreeNodeUtils.buildTree(menuService.getResourceAll()) ;
		if(list != null){
			model.put("menuList",list);
		}
		return "system/menu/menu_list";
	}
	
	/**
	 * 
	 * 新增一级菜单
	 *
	 * @author mao.ru
	 * @param model
	 * @return
	 * @throws Exception
	 * @since JDK 1.7
	 */
	@RequestMapping(value = "/tofirstLevel")
	public String toFirstLevel(ModelMap model)throws Exception{
		return "system/menu/menu_fadd";
	}
	/**
	 * 
	 * 添加一级菜单
	 *
	 * @author mao.ru
	 * @param model
	 * @return
	 * @throws Exception
	 * @since JDK 1.7
	 */
	@RequestMapping(value = "/dofirstLevel")
	public String doFirstLevel(ModelMap model,Resource resource)throws Exception{
		try {
			resource.setUrl("#");
			resource.setLevelLag(3);//标识 
			resource.setLevelPid(0);// PID
			menuService.insertSelective(resource);
			model.put("msg", "success");
		} catch (Exception e) {
			logger.error(e.toString(), e);
			model.put("msg", "failed");
		}
		return "save_result";
	}
	
	/**
	 * 
	 * 创建子菜单
	 *
	 * @author mao.ru
	 * @param model
	 * @return
	 * @throws Exception
	 * @since JDK 1.7
	 */
	@RequestMapping(value = "/toChildrenLevel")
	public String toChildrenLevel(@RequestParam(value = "levelPid", required = true) Long levelPid,
			ModelMap model)throws Exception{
		model.put("levelPid", levelPid);
		return "system/menu/menu_cadd";
	}
	/**
	 * 
	 * 创建子菜单
	 *
	 * @author mao.ru
	 * @param model
	 * @return
	 * @throws Exception
	 * @since JDK 1.7
	 */
	@RequestMapping(value = "/doChildrenLevel")
	public String doChildrenLevel(ModelMap model,Resource resource)throws Exception{
		try {
			menuService.insertSelective(resource);
			model.put("msg", "success");
		} catch (Exception e) {
			logger.error(e.toString(), e);
			model.put("msg", "failed");
		}
		return "save_result";
	}
	
	/**
	 * 
	 * 修改菜单
	 *
	 * @author mao.ru
	 * @param model
	 * @return
	 * @throws Exception
	 * @since JDK 1.7
	 */
	@RequestMapping(value = "/toEditMenu")
	public String toEditMenu(@RequestParam(value = "menuId", required = true) Long menuId,
			ModelMap model)throws Exception{
		Resource resource = menuService.selectByPrimaryKey(menuId);
		model.put("resource", resource);
		return "system/menu/menu_edit";
	}
	
	
	/**
	 * 
	 *  修改菜单
	 *
	 * @author mao.ru
	 * @param model
	 * @return
	 * @throws Exception
	 * @since JDK 1.7
	 */
	@RequestMapping(value = "/doEditMenu")
	public String doEditMenu(ModelMap model,Resource resource)throws Exception{
		try {
			menuService.updateByPrimaryKeySelective(resource);
			model.put("msg", "success");
		} catch (Exception e) {
			logger.error(e.toString(), e);
			model.put("msg", "failed");
		}
		return "save_result";
	}
	
	/**
	 * 删除菜单
	 * @param menuId
	 * @param out
	 */
	@RequestMapping(value="/delMenu")
	public String delete(@RequestParam Long menuId,ModelMap model)throws Exception{
		try {
			//删除当前一级菜单
			menuService.deleteByPrimaryKey(menuId);
			//删除其子菜单
			menuService.deleteByPid(menuId.intValue());
			model.put("msg", "success");
		} catch (Exception e) {
			logger.error(e.toString(), e);
			model.put("msg", "failed");
		}
		return "save_result";
		
	}
}
