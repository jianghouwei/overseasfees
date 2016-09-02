package com.org.sysetem.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.org.sysetem.service.MenuService;
import com.org.system.dao.ResourceMapper;
import com.org.system.model.Resource;
import com.org.utils.TreeNodeUtils;

@Service
public class MenuServiceImpl implements MenuService{

	@Autowired
	private ResourceMapper resourceMapper;
	
	@Override
	public List<Resource> getMenusByUserId(Long userId) {
		List<Resource> listall = resourceMapper.getMenusByUserId(userId);
		if(listall != null && !listall.isEmpty() && listall.size() > 0){
			return TreeNodeUtils.buildTree(listall);
		}
		return null;
	}

	@Override
	public List<Resource> getResourceAll() {
		return resourceMapper.getResourceAll();
	}

	@Override
	public int deleteByPrimaryKey(Long id) {
		return resourceMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Resource record) {
		return resourceMapper.insert(record);
	}

	@Override
	public int insertSelective(Resource record) {
		return resourceMapper.insertSelective(record);
	}

	@Override
	public Resource selectByPrimaryKey(Long id) {
		return resourceMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(Resource record) {
		return resourceMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Resource record) {
		return resourceMapper.updateByPrimaryKey(record);
	}

	@Override
	public int deleteByPid(Integer pId) {
		// TODO Auto-generated method stub
		return resourceMapper.deleteByPid(pId);
	}

}
