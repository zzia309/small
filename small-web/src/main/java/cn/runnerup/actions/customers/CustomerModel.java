package cn.runnerup.actions.customers;

import cn.runnerup.model.Customer;

public class CustomerModel extends Customer{

	private boolean success = false;

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

}
