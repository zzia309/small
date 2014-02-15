package cn.runnerup.actions.customers;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import cn.runnerup.actions.RunnerSupport;
import cn.runnerup.mapper.CustomerMapper;

import com.opensymphony.xwork2.ModelDriven;

public class ListAction extends RunnerSupport implements ModelDriven<ListModel>{

	private static final long serialVersionUID = -2993395498134509472L;

	private ListModel model = new ListModel();

	@Autowired
	private CustomerMapper customerMapper;

	public String index(){
		String condition = servletRequest.getParameter("condition");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("limit", model.getLimit());
		map.put("start", model.getStart());
		map.put("user", getUser().getId());
		if(StringUtils.isNotBlank(condition))
			map.put("condition", condition.trim());
		
		model.setModels(customerMapper.getCheckCustomers(map));
		model.setTotal(customerMapper.getCheckCustomersCount(map));
		return SUCCESS;
	}

	public ListModel getModel() {
		return model;
	}

}
