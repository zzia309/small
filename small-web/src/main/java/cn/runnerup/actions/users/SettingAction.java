package cn.runnerup.actions.users;

import java.util.Calendar;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import cn.runnerup.actions.RunnerSupport;
import cn.runnerup.model.User;
import cn.runnerup.service.UserService;

import com.opensymphony.xwork2.ModelDriven;

public class SettingAction extends RunnerSupport implements ModelDriven<UserModel> {
	
	private static final long serialVersionUID = -2884721380944078587L;
	
	private Integer id;

	@Autowired
	private UserService userService;

	private UserModel model = new UserModel();

	private User user;
	
	private String changepassword;
	
	public String update() {
		if(user != null) {
			if(StringUtils.isNotEmpty(changepassword)) {
				model.setPassword(userService.encodePassword(changepassword));
			}
			model.setUpdated(Calendar.getInstance().getTime());
			userService.updateUser(model);
			model.setSuccess(true);
		}
		return SUCCESS;
	}

	@Override
	public UserModel getModel() {
		return model;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) throws Exception {
		if(id != null){
			user = userService.select(id);
			PropertyUtils.copyProperties(model, user);
		}else{
			addActionMessage("miss id or user is not exist");
		}
		this.id = id;
	}

	public String getChangepassword() {
		return changepassword;
	}

	public void setChangepassword(String changepassword) {
		this.changepassword = changepassword;
	}
	
}
