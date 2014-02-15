package cn.runnerup.actions.stores;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ModelDriven;

import cn.runnerup.actions.RunnerSupport;
import cn.runnerup.model.Customer;
import cn.runnerup.service.CustomerService;

public class CustomerStore extends RunnerSupport implements ModelDriven<List<Customer>>{

	private static final long serialVersionUID = 6709072814708659375L;

	private List<Customer> model = new ArrayList<Customer>();

	@Autowired
	private CustomerService customerService;
	
	public String index(){
		model = customerService.selectAll();
		return SUCCESS;
	}

	@Override
	public List<Customer> getModel() {
		return model;
	}



}
