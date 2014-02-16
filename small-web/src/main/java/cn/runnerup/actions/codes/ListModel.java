package cn.runnerup.actions.codes;

import java.util.List;

import cn.runnerup.model.Code;

public class ListModel {

	private List<Code> models;

	private int start = 0;

	private Integer limit;

	private int total;

	public List<Code> getModels() {
		return models;
	}

	public void setModels(List<Code> models) {
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
