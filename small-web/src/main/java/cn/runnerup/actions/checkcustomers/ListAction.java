package cn.runnerup.actions.checkcustomers;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ModelDriven;

import cn.runnerup.actions.RunnerSupport;
import cn.runnerup.service.CustomerService;

public class ListAction extends RunnerSupport implements ModelDriven<ListModel>{

	private static final long serialVersionUID = -2993395498134509472L;

	private ListModel model = new ListModel();

	@Autowired
	private CustomerService customerService;

	public String index(){
		String condition = servletRequest.getParameter("condition");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("limit", model.getLimit());
		map.put("start", model.getStart());
		if(StringUtils.isNotBlank(condition))
			map.put("condition", condition.trim());
		if(getUser().getPriority()>3) {
			model.setModels(customerService.getCustomers(map));
			model.setTotal(customerService.getCustomerCount(map));
		}
		return SUCCESS;
	}

	public ListModel getModel() {
		return model;
	}

}
