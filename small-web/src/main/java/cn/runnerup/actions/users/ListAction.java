package cn.runnerup.actions.users;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import cn.runnerup.actions.RunnerSupport;
import cn.runnerup.service.UserService;

import com.opensymphony.xwork2.ModelDriven;

public class ListAction extends RunnerSupport implements ModelDriven<ListModel>{

	private static final long serialVersionUID = -6644916771598490732L;

	private ListModel model = new ListModel();

	@Autowired
	private UserService userService;

	private String condition;

	public String index() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("limit", model.getLimit());
		map.put("start", model.getStart());
		if(StringUtils.isNotBlank(condition))
			map.put("condition", condition.trim());
		model.setModels(userService.selectAllUsers(map));
		model.setTotal(userService.selectCount(map));
		return "success";
	}

	public ListModel getModel() {
		return model;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

}
