package cn.runnerup.actions;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;

import cn.runnerup.service.AttachmentService;
import cn.runnerup.service.ConfigService;
import cn.runnerup.service.FtpService;

import com.opensymphony.xwork2.ModelDriven;

public class BackUpAction extends RunnerSupport implements ModelDriven<BackUpModel>{

	private static final long serialVersionUID = 5428953142782473615L;
	
	private BackUpModel model = new BackUpModel();
	
	@Autowired
	private ConfigService configService;
	
	@Autowired
	private AttachmentService attachmentService;
	
	private boolean isFile = false;
	
	public String index() {
		try {
			FtpService ftpService = new FtpService(model.getUsername(), model.getPassword(), model.getHostip(), 21);
			if(!isFile) {
				Runtime.getRuntime().exec("cmd /c start d:\\files\\small.bat");
				ftpService.uploadFiles(attachmentService.getRoot(), "");
			}else
				ftpService.uploadFiles(FilenameUtils.concat(attachmentService.getRoot(), "small.db"), "");
			model.setSuccess(true);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return SUCCESS;
	}

	@Override
	public BackUpModel getModel() {
		return model;
	}

	public boolean isFile() {
		return isFile;
	}

	public void setFile(boolean isFile) {
		this.isFile = isFile;
	}
	
}