package cn.runnerup.actions.businesses;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import com.opensymphony.xwork2.ModelDriven;
import cn.runnerup.actions.RunnerSupport;
import cn.runnerup.model.Business;
import cn.runnerup.service.BusinessService;

public class ListAction extends RunnerSupport implements ModelDriven<List<Business>>{

	private static final long serialVersionUID = -2993395498134509472L;

	private List<Business> model = new ArrayList<Business>();

	@Autowired
	private BusinessService businessService;

	public String index(){
		model = businessService.getAllBusinesses();
		return SUCCESS;
	}

	public List<Business> getModel() {
		return model;
	}

}
