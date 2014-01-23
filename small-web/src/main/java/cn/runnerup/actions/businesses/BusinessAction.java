package cn.runnerup.actions.businesses;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
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

public class BusinessAction extends RunnerSupport implements ModelDriven<BusinessModel>{

	private static final long serialVersionUID = 6761123230844817537L;

	protected final Log logger = LogFactory.getLog(getClass());

	@Autowired
	private BusinessService businessService;

	@Autowired
	private AttachmentService attachmentService;

	@Autowired
	private CustomerService customerService;

	@Autowired
	private WoFlowService woFlowService;

	private BusinessModel model = new BusinessModel();

	private Business business;

	private int id;

	public String show(){
		model.setSuccess(true);
		return SUCCESS;
	}

	public String editNew() {
		model.setSuccess(true);
		return "edit";
	}


	public String edit() {
		model.setSuccess(business != null);
		return "edit";
	}

	public HttpHeaders create() {
		try {
			businessService.createBusiness(model);
			Integer modelId = model.getId();
			User user = getUser();
			if(model.getBusinessfiles() != null) {
				for(int i=0; i<model.getBusinessfiles().length; i++) {
					attachmentService.upload(user, "business", modelId.toString(), 0, model.getBusinessfiles()[i], model.getBusinessfilesFileName()[i]);
				}
			}
			model.setSuccess(true);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return new DefaultHttpHeaders(SUCCESS).setLocationId(model.getId());
	}

	public HttpHeaders update() {
		if(business != null) {
			try {
				Integer modelId = model.getId();
				User user = getUser();
				String newStatus = model.getNewStatus();
				if("-".equals(newStatus)) {
					Customer customer = model.getCustomer();
					customer.setFlow(false);
					customerService.updateCustomer(customer);
				}
				if(StringUtils.isNotBlank(newStatus))
					model.setStatus(newStatus);
				if(model.getBusinessfiles() != null) {
					for(int i=0; i<model.getBusinessfiles().length; i++) {
						attachmentService.upload(user, "business", modelId.toString(), 0, model.getBusinessfiles()[i], model.getBusinessfilesFileName()[i]);
					}
				}
				businessService.updateBusiness(model);
				woFlowService.createWoFlow(user, model.getWoflowDescr(), business.getStatus(), newStatus, model.getId());
				model.setSuccess(true);
			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}
		}
		return new DefaultHttpHeaders(SUCCESS).setLocationId(model.getId());
	}

	public HttpHeaders destroy() {
		try {
			if(business != null) {
				businessService.deleteBusiness(business);
				model.setSuccess(true);
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return new DefaultHttpHeaders(SUCCESS).setLocationId(model.getId());
	}


	public BusinessModel getModel() {
		return model;
	}

	public int getId() {
		return id;
	}

	public void setId(Integer id) throws Exception {
		if(id != null){
			business = businessService.getBusiness(id);
			PropertyUtils.copyProperties(model, business);
		}else{
			addActionError("miss id or business is not exist");
		}
		this.id = id;
	}

}
