package cn.runnerup.actions.customers;

import java.io.Serializable;
import java.util.List;

import cn.runnerup.model.Customer;

public class ListModel implements Serializable {

	private static final long serialVersionUID = 6935919000515003485L;

	private List<Customer> models;

	private int start = 0;

	private Integer limit;

	private int total;

	public List<Customer> getModels() {
		return models;
	}

	public void setModels(List<Customer> models) {
		this.models = models;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public Integer getLimit() {
		return limit;
	}

	public void setLimit(Integer limit) {
		this.limit = limit;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

}
