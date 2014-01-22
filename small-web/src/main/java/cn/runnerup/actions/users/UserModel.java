package cn.runnerup.actions.users;

import cn.runnerup.model.User;

public class UserModel extends User{

	private boolean success = false;

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

}
