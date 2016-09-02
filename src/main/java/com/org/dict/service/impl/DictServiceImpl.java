package com.org.dict.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.org.conf.model.DateModel;
import com.org.conf.model.OperationConf;
import com.org.dict.dao.DictMapper;
import com.org.dict.service.DictService;

@Service
public class DictServiceImpl implements  DictService{

	@Autowired
	private DictMapper dictMapper;
	@Override
	public List<DateModel> getCountryAll() {
		return dictMapper.getCountryAll();
	}

	@Override
	public List<DateModel> getCountryAllByPriceService(String priceService) {
		return dictMapper.getCountryAllByPriceService(priceService);
	}

	@Override
	public List<DateModel> getPriceServiceAll() {
		return dictMapper.getPriceServiceAll();
	}

	@Override
	public List<DateModel> getPriceServiceAllByCountry(String country) {
		return dictMapper.getPriceServiceAllByCountry(country);
	}

	@Override
	public List<DateModel> getOperatorAll() {
		return dictMapper.getOperatorAll();
	}

	@Override
	public List<DateModel> getOperatorAllByCountryAndPservice(
			OperationConf record) {
		return dictMapper.getOperatorAllByCountryAndPservice(record);
	}

	@Override
	public List<DateModel> getLocalPriceAllByCtryPserviceAndOperator(
			OperationConf record) {
		return dictMapper.getLocalPriceAllByCtryPserviceAndOperator(record);
	}

	@Override
	public List<DateModel> getRepetCountryAll() {
		return dictMapper.getRepetCountryAll();
	}

	@Override
	public List<DateModel> getChannelAll() {
		return dictMapper.getChannelAll();
	}

	@Override
	public List<DateModel> getPriceInfoAll() {
		return dictMapper.getPriceInfoAll();
	}
	
}
