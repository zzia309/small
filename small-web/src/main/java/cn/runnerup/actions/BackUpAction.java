package cn.runnerup.actions;

import org.apache.commons.lang3.StringUtils;
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
	
	public String create() {
		try {
			if(getUser().getPriority() == 5) {
				FtpService ftpService = new FtpService(model.getUsername(), model.getPassword(), model.getHostip(), 21);
				String message = null;
				message = ftpService.uploadFiles(attachmentService.getRoot());
				model.setSuccess(StringUtils.isBlank(message));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return SUCCESS;
	}

	@Override
	public BackUpModel getModel() {
		return model;
	}

}
