package cn.runnerup.actions.businesses;

import cn.runnerup.model.Business;

public class BusinessModel extends Business{
	private boolean success = false;

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}
}
