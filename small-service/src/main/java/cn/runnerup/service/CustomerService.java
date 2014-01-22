package cn.runnerup.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.runnerup.mapper.CustomerMapper;
import cn.runnerup.model.Customer;
import cn.runnerup.model.User;

@Service
public class CustomerService {

	@Autowired
	private CustomerMapper customerMapper;


	public List<Customer> getAllCustomers(User user){
		return customerMapper.getAllCustomersByCreatedby(user.getId());
	}

	public Customer getCustomer(Integer id){
		return customerMapper.selectByPrimaryKey(id);
	}

	public Customer createCustomer(Customer customer){
		customerMapper.insert(customer);
		return customer;
	}

	public void deleteCustomer(Customer customer){
		customerMapper.deleteByPrimaryKey(customer.getId());
	}

	public void updateCustomer(Customer customer){
		customerMapper.updateByPrimaryKey(customer);
	}

}
