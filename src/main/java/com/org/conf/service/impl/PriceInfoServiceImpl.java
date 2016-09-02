package com.org.conf.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.org.conf.dao.PriceInfoMapper;
import com.org.conf.model.PriceInfo;
import com.org.conf.service.PriceInfoService;

@Service
public class PriceInfoServiceImpl implements PriceInfoService{

	@Autowired
	private PriceInfoMapper priceInfoMapper;
	
	@Override
	public int deleteByPrimaryKey(Long id) {
		return priceInfoMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(PriceInfo record) {
		return priceInfoMapper.insert(record);
	}

	@Override
	public int insertSelective(PriceInfo record) {
		return priceInfoMapper.insertSelective(record);
	}

	@Override
	public PriceInfo selectByPrimaryKey(Long id) {
		return priceInfoMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(PriceInfo record) {
		return priceInfoMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(PriceInfo record) {
		return priceInfoMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<PriceInfo> getPriceInfoListPage(PriceInfo record) {
		return priceInfoMapper.getPriceInfoListPage(record);
	}

	@Override
	public Long getPriceInfoCountPage(PriceInfo record) {
		return priceInfoMapper.getPriceInfoCountPage(record);
	}

}
