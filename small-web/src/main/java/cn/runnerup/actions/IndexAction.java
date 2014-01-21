package cn.runnerup.actions;

import org.springframework.beans.factory.annotation.Autowired;

import cn.runnerup.model.User;
import cn.runnerup.service.MenuService;
import cn.runnerup.service.UserService;

import com.opensymphony.xwork2.ModelDriven;

public class IndexAction extends RunnerSupport implements ModelDriven<User> {

	private static final long serialVersionUID = -1354148015885662944L;

	@Autowired
	private UserService userService;

	@Autowired
	private MenuService menuService;

	private User model = new User();

	public String index() {
		model = userService.selectUser("zae");
		return SUCCESS;
	}

	public User getModel() {
		return model;
	}

}
