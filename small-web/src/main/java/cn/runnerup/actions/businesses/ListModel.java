package cn.runnerup.actions.businesses;

import java.io.Serializable;
import java.util.List;

import cn.runnerup.model.Business;

public class ListModel implements Serializable {

	private static final long serialVersionUID = -271613263977061925L;

	private List<Business> models;

	private int start = 0;

	private Integer limit;

	private int total;

	public List<Business> getModels() {
		return models;
	}

	public void setModels(List<Business> models) {
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
