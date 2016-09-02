package com.org.conf.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.org.conf.dao.OperationConfMapper;
import com.org.conf.model.DateModel;
import com.org.conf.model.OperationConf;
import com.org.conf.service.OperationConfService;

@Service
public class OperationConfServiceServiceImpl implements OperationConfService {
	
	
	@Autowired
	private OperationConfMapper operationConfMapper;

	@Override
	public int deleteByPrimaryKey(Long id) {
		return operationConfMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(OperationConf record) {
		return operationConfMapper.insert(record);
	}

	@Override
	public int insertSelective(OperationConf record) {
		return operationConfMapper.insertSelective(record);
	}

	@Override
	public OperationConf selectByPrimaryKey(Long id) {
		return operationConfMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(OperationConf record) {
		return operationConfMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(OperationConf record) {
		return operationConfMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<OperationConf> getOperationConfListPage(OperationConf record) {
		return operationConfMapper.getOperationConfListPage(record);
	}

	@Override
	public Long geOperationConfCountPage(OperationConf record) {
		return operationConfMapper.geOperationConfCountPage(record);
	}

	@Override
	public List<DateModel> getCountryAll() {
		return operationConfMapper.getCountryAll();
	}

	@Override
	public List<DateModel> getCountryAllByPriceService(String priceService) {
		return operationConfMapper.getCountryAllByPriceService(priceService);
	}

	@Override
	public List<DateModel> getPriceServiceAll() {
		return operationConfMapper.getPriceServiceAll();
	}

	@Override
	public List<DateModel> getPriceServiceAllByCountry(String country) {
		return operationConfMapper.getPriceServiceAllByCountry(country);
	}

	@Override
	public List<DateModel> getOperatorAll() {
		return operationConfMapper.getOperatorAll();
	}

	@Override
	public List<DateModel> getOperatorAllByCountryAndPservice(
			OperationConf record) {
		return operationConfMapper.getOperatorAllByCountryAndPservice(record);
	}

	@Override
	public List<DateModel> getPriceAllByCtryPserviceAndOperator(
			OperationConf record) {
		return operationConfMapper.getLocalPriceAllByCtryPserviceAndOperator(record);
	}

	@Override
	public int batchInsert(List<OperationConf> list) {
		return operationConfMapper.batchInsert(list);
	}

}
