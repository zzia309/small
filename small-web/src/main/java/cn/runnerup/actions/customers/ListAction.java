package cn.runnerup.actions.customers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ModelDriven;

import cn.runnerup.actions.RunnerSupport;
import cn.runnerup.model.Customer;
import cn.runnerup.service.CustomerService;

public class ListAction extends RunnerSupport implements ModelDriven<List<Customer>>{

	private static final long serialVersionUID = -2993395498134509472L;

	private List<Customer> model = new ArrayList<Customer>();

	@Autowired
	private CustomerService customerService;

	public String index(){
		model = customerService.getAllCustomers(getUser());
		return SUCCESS;
	}

	public List<Customer> getModel() {
		return model;
	}

}
