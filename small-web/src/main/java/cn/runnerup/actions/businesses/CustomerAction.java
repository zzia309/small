package cn.runnerup.actions.businesses;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ModelDriven;

import cn.runnerup.actions.RunnerSupport;
import cn.runnerup.model.Business;
import cn.runnerup.model.Customer;
import cn.runnerup.service.BusinessService;
import cn.runnerup.service.CustomerService;

public class CustomerAction extends RunnerSupport implements ModelDriven<CustomerModel>{

	private static final long serialVersionUID = 7824125188649437078L;

	private CustomerModel model = new CustomerModel();

	private Integer id;

	@Autowired
	private CustomerService customerService;

	@Autowired
	private BusinessService businessService;

	public String show(){
		Business business = businessService.getBusiness(id);
		if(null != business){
			Customer customer = business.getCustomer();
			model.setCustomer(customer);
			model.setSuccess(true);
		}
		return SUCCESS;
	}

	public CustomerModel getModel() {
		return model;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}



}
