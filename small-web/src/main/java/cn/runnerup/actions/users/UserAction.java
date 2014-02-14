package cn.runnerup.actions.users;


import java.util.Calendar;
import java.util.Date;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.rest.DefaultHttpHeaders;
import org.apache.struts2.rest.HttpHeaders;
import org.springframework.beans.factory.annotation.Autowired;

import cn.runnerup.actions.RunnerSupport;
import cn.runnerup.model.User;
import cn.runnerup.service.UserService;

import com.opensymphony.xwork2.ModelDriven;

public class UserAction extends RunnerSupport implements ModelDriven<UserModel>{

	private static final long serialVersionUID = 6761123230844817537L;

	protected final Log logger = LogFactory.getLog(getClass());

	@Autowired
	private UserService userService;

	private UserModel model = new UserModel();

	private User user;

	private int id;

	public String show(){
		model.setSuccess(true);
		return "success";
	}

	public String editNew() {
		model.setSuccess(true);
		return "edit";
	}


	public String edit() {
		model.setSuccess(user != null);
		return "edit";
	}

	public HttpHeaders create() {
		try {
			Date now = Calendar.getInstance().getTime();
			model.setCreated(now);
			model.setUpdated(now);
			if(model.getDisabled()==null)
				model.setDisabled(false);
			userService.createUser(model);
			model.setSuccess(true);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return new DefaultHttpHeaders(SUCCESS).setLocationId(model.getId());
	}

	public HttpHeaders update() {
		if(user != null) {
			if(model.getDisabled()==null)
				model.setDisabled(false);
			model.setUpdated(Calendar.getInstance().getTime());
			userService.updateUser(model);
		}
		return new DefaultHttpHeaders(SUCCESS).setLocationId(model.getId());
	}

	public HttpHeaders destroy() {
		try {
			if(user != null) {
				userService.deleteUser(user);
				model.setSuccess(true);
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return new DefaultHttpHeaders(SUCCESS).setLocationId(model.getId());
	}


	public UserModel getModel() {
		return model;
	}

	public int getId() {
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

}
