package cn.runnerup.actions.businesses;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import cn.runnerup.actions.RunnerSupport;
import cn.runnerup.mapper.FlowAuthorizationMapper;
import cn.runnerup.model.User;
import cn.runnerup.service.BusinessService;

import com.opensymphony.xwork2.ModelDriven;

public class ListAction extends RunnerSupport implements ModelDriven<ListModel>{

	private static final long serialVersionUID = -2993395498134509472L;

	private ListModel model = new ListModel();

	@Autowired
	private BusinessService businessService;

	@Autowired
	private FlowAuthorizationMapper flowAuthorizationMapper;

	public String index(){
		User user = getUser();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("limit", model.getLimit());
		map.put("start", model.getStart());
		List<String> status = flowAuthorizationMapper.selectFromStatus(user.getPriority());
		map.put("status", status);
		model.setModels(businessService.getAllBusinesses(map));
		model.setTotal(businessService.getBusinessCount(map));
		return SUCCESS;
	}

	public ListModel getModel() {
		return model;
	}

}
