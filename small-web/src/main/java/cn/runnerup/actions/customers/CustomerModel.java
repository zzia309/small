package cn.runnerup.actions.customers;

import java.io.File;

import cn.runnerup.model.Customer;

public class CustomerModel extends Customer{

	private boolean success = false;

	private File[] customerfile;

	private String[] customerfileFileName;

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public File[] getCustomerfile() {
		return customerfile;
	}

	public void setCustomerfile(File[] customerfile) {
		this.customerfile = customerfile;
	}

	public String[] getCustomerfileFileName() {
		return customerfileFileName;
	}

	public void setCustomerfileFileName(String[] customerfileFileName) {
		this.customerfileFileName = customerfileFileName;
	}

}
