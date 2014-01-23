package cn.runnerup.actions.customers;


import java.util.Calendar;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.struts2.rest.DefaultHttpHeaders;
import org.apache.struts2.rest.HttpHeaders;
import org.springframework.beans.factory.annotation.Autowired;

import cn.runnerup.actions.RunnerSupport;
import cn.runnerup.model.Business;
import cn.runnerup.model.Customer;
import cn.runnerup.model.User;
import cn.runnerup.service.BusinessService;
import cn.runnerup.service.CustomerService;
import cn.runnerup.service.WoFlowService;

import com.opensymphony.xwork2.ModelDriven;

public class CustomerAction extends RunnerSupport implements ModelDriven<CustomerModel>{

	private static final long serialVersionUID = -3865047448150578498L;

	private CustomerModel model = new CustomerModel();

	@Autowired
	private CustomerService customerService;

	@Autowired
	private BusinessService businessService;

	@Autowired
	private WoFlowService woFlowService;

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
		model.setCreatedby(getUser());
		model.setCreated(Calendar.getInstance().getTime());
		customerService.createCustomer(model);
		model.setSuccess(true);
		return new DefaultHttpHeaders(SUCCESS).setLocationId(model.getId());
	}

	public String createFlow() {
		Integer modelId = model.getId();
		model.setFlow(true);
		User user = getUser();
		if(modelId != null) {
			Business business = businessService.getBusinessByCustomer(modelId);
			if(business != null) {
				business.setStatus("new");
				businessService.updateBusiness(business);
			}else {
				business = new Business();
				business.setCustomer(model);
				business.setStatus("new");
				businessService.createBusiness(business);
			}
			customerService.updateCustomer(model);
		}else {
			model.setCreatedby(user);
			model.setCreated(Calendar.getInstance().getTime());
			customerService.createCustomer(model);
			Business business = new Business();
			business.setCustomer(model);
			business.setStatus("new");
			businessService.createBusiness(business);
		}
		woFlowService.createWoFlow(user, "", "-", "new", model.getId());
		model.setSuccess(true);
		return SUCCESS;
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
