package cn.runnerup.actions.businesses;

import cn.runnerup.model.Customer;

public class CustomerModel {

	private Customer customer;

	private boolean success = false;

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

}
