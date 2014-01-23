package cn.runnerup.actions.stores;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import cn.runnerup.actions.RunnerSupport;
import cn.runnerup.model.User;
import cn.runnerup.service.UserService;

import com.opensymphony.xwork2.ModelDriven;

public class UserStoreAction extends RunnerSupport implements ModelDriven<List<User>>{

	private static final long serialVersionUID = -8330984458168372246L;

	private List<User> model = new ArrayList<User>();

	@Autowired
	private UserService userService;

	public String index(){
		model = userService.selectAll();
		return SUCCESS;
	}
	@Override
	public List<User> getModel() {
		return model;
	}

}
