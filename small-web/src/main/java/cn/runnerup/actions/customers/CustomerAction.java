package cn.runnerup.actions.customers;


import org.apache.commons.beanutils.PropertyUtils;
import org.apache.struts2.rest.DefaultHttpHeaders;
import org.apache.struts2.rest.HttpHeaders;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ModelDriven;

import cn.runnerup.actions.RunnerSupport;
import cn.runnerup.model.Customer;
import cn.runnerup.service.CustomerService;

public class CustomerAction extends RunnerSupport implements ModelDriven<CustomerModel>{

	private static final long serialVersionUID = -3865047448150578498L;

	private CustomerModel model = new CustomerModel();

	@Autowired
	private CustomerService customerService;

	private Integer id;

	private Customer customer;

	public String show(){
		model.setSuccess(true);
		return SUCCESS;
	}

	public String editNew() {
		model.setSuccess(true);
		return "edit";
	}


	public String edit() {
		model.setSuccess(customer != null);
		return "edit";
	}

	public HttpHeaders create() {
		customerService.createCustomer(model);
		model.setSuccess(true);
		return new DefaultHttpHeaders(SUCCESS).setLocationId(model.getId());
	}

	public HttpHeaders update() {
		if(customer != null) {
			customerService.updateCustomer(model);
			model.setSuccess(true);
		}
		return new DefaultHttpHeaders(SUCCESS).setLocationId(model.getId());
	}

	public HttpHeaders destroy() {
		if(customer != null) {
			customerService.deleteCustomer(customer);
			model.setSuccess(true);
		}
		return new DefaultHttpHeaders(SUCCESS).setLocationId(model.getId());
	}

	public CustomerModel getModel() {
		return model;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) throws Exception {
		if(id != null){
			customer = customerService.getCustomer(id);
			PropertyUtils.copyProperties(model, customer);
		}else{
			addActionError("miss id or customer is not exist");
		}
		this.id = id;
	}


}
