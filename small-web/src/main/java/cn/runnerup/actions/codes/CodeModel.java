package cn.runnerup.actions.codes;

import cn.runnerup.model.Code;

public class CodeModel extends Code{

	private boolean success = false;

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

}
