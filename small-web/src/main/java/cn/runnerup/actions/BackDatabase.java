package cn.runnerup.actions;

import com.opensymphony.xwork2.ModelDriven;

public class BackDatabase extends RunnerSupport implements ModelDriven<String> {

	private static final long serialVersionUID = -2916736298913384050L;
	
	String model = null;
	
	public String index() {
		try {
        	Runtime.getRuntime().exec("cmd /c start d:\\files\\small.bat");
        	model = "success";
		} catch (Exception e) {
		}
		return SUCCESS;
	}

	@Override
	public String getModel() {
		return model;
	}

}
