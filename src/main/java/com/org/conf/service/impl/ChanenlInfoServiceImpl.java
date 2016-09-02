package com.org.conf.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.org.conf.dao.ChanenlInfoMapper;
import com.org.conf.model.ChanenlInfo;
import com.org.conf.service.ChanenlInfoService;

@Service
public class ChanenlInfoServiceImpl implements ChanenlInfoService{
	
	@Autowired
	private ChanenlInfoMapper chanenlInfoMapper;

	@Override
	public int deleteByPrimaryKey(Long id) {
		return chanenlInfoMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(ChanenlInfo record) {
		return chanenlInfoMapper.insert(record);
	}

	@Override
	public int insertSelective(ChanenlInfo record) {
		return chanenlInfoMapper.insertSelective(record);
	}

	@Override
	public ChanenlInfo selectByPrimaryKey(Long id) {
		return chanenlInfoMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(ChanenlInfo record) {
		return chanenlInfoMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(ChanenlInfo record) {
		return chanenlInfoMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<ChanenlInfo> getChanenlInfoListPage(ChanenlInfo record) {
		return chanenlInfoMapper.getChanenlInfoListPage(record);
	}

	@Override
	public Long getChanenlInfoCountPage(ChanenlInfo record) {
		return chanenlInfoMapper.getChanenlInfoCountPage(record);
	}

}
