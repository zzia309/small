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
import cn.runnerup.service.AttachmentService;
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

	@Autowired
	private AttachmentService attachmentService;

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
		try {
			User user = getUser();
			model.setCreatedby(user);
			model.setCreated(Calendar.getInstance().getTime());
			customerService.createCustomer(model);
			if(model.getCustomerfile() != null) {
				for(int i=0; i<model.getCustomerfile().length; i++) {
					attachmentService.upload(user, "customer", model.getId().toString(), 0, model.getCustomerfile()[i], model.getCustomerfileFileName()[i]);
				}
			}
			model.setSuccess(true);
		} catch (Exception e) {

		}
		return new DefaultHttpHeaders(SUCCESS).setLocationId(model.getId());
	}

	public String createFlow() {
		try {
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
				if(model.getCustomerfile() != null) {
					for(int i=0; i<model.getCustomerfile().length; i++) {
						attachmentService.upload(getUser(), "customer", model.getId().toString(), 0, model.getCustomerfile()[i], model.getCustomerfileFileName()[i]);
					}
				}
				customerService.updateCustomer(model);
			}else {
				model.setCreatedby(user);
				model.setCreated(Calendar.getInstance().getTime());
				customerService.createCustomer(model);
				if(model.getCustomerfile() != null) {
					for(int i=0; i<model.getCustomerfile().length; i++) {
						attachmentService.upload(getUser(), "customer", model.getId().toString(), 0, model.getCustomerfile()[i], model.getCustomerfileFileName()[i]);
					}
				}
				Business business = new Business();
				business.setCustomer(model);
				business.setStatus("new");
				businessService.createBusiness(business);
			}
			woFlowService.createWoFlow(user, "", "-", "new", model.getId());
			model.setSuccess(true);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return SUCCESS;
	}

	public HttpHeaders update() {
		try {
			if(customer != null) {
				customerService.updateCustomer(model);
				if(model.getCustomerfile() != null) {
					for(int i=0; i<model.getCustomerfile().length; i++) {
						attachmentService.upload(getUser(), "customer", model.getId().toString(), 0, model.getCustomerfile()[i], model.getCustomerfileFileName()[i]);
					}
				}
				model.setSuccess(true);
			}
		} catch (Exception e) {
			// TODO: handle exception
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
