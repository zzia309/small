package cn.runnerup.actions.checkcustomers;

import org.apache.commons.beanutils.PropertyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import cn.runnerup.actions.RunnerSupport;
import cn.runnerup.actions.businesses.BusinessModel;
import cn.runnerup.model.Business;
import cn.runnerup.service.BusinessService;
import com.opensymphony.xwork2.ModelDriven;

public class CustomerAction extends RunnerSupport implements ModelDriven<BusinessModel>{

	private static final long serialVersionUID = -3865047448150578498L;

	private BusinessModel model = new BusinessModel();

	@Autowired
	private BusinessService businessService;

	private Integer id;

	private Business business;

	public String show(){
		model.setSuccess(business != null);
		return SUCCESS;
	}

	public BusinessModel getModel() {
		return model;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) throws Exception {
		if(id != null){
			business = businessService.getBusinessByCustomer(id);
			PropertyUtils.copyProperties(model, business);
		}else{
			addActionError("miss id or customer is not exist");
		}
		this.id = id;
	}


}
