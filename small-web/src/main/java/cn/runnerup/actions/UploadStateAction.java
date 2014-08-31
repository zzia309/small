package cn.runnerup.actions;

import cn.runnerup.actions.uploads.FileUploadStatus;

import com.opensymphony.xwork2.ModelDriven;

public class UploadStateAction extends RunnerSupport implements ModelDriven<FileUploadStatus> {
	
	private static final long serialVersionUID = -3819680609275326684L;
	
	private FileUploadStatus status = new FileUploadStatus();
	
	public String create() {
		try {
			status = (FileUploadStatus) servletRequest.getSession().getAttribute("currentUploadStatus");
		} catch (Exception e) {
		}
		return SUCCESS;
	}

	@Override
	public FileUploadStatus getModel() {
		return status;
	}

}
