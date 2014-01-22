package cn.runnerup.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.runnerup.mapper.BusinessMapper;
import cn.runnerup.model.Business;

@Service
public class BusinessService {

	@Autowired
	private BusinessMapper businessMapper;

	public List<Business> getAllBusinesses(Map<String, Object> map){
		return businessMapper.getAllBusinesses(map);
	}

	public int getBusinessCount(Map<String, Object> map){
		return businessMapper.selectCount(map);
	}

	public void deleteBusiness(Business business){
		businessMapper.deleteByPrimaryKey(business.getId());
	}

	public Business createBusiness(Business business){
		businessMapper.insert(business);
		return business;
	}

	public Business getBusiness(Integer id){
		return businessMapper.selectByPrimaryKey(id);
	}

	public Business getBusinessByCustomer(Integer customer){
		return businessMapper.selectByCustomer(customer);
	}

	public void updateBusiness(Business business){
		businessMapper.updateByPrimaryKey(business);
	}

}
