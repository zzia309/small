package cn.runnerup.actions.commons;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import cn.runnerup.actions.RunnerSupport;
import cn.runnerup.model.Attachment;
import cn.runnerup.service.AttachmentService;

import com.opensymphony.xwork2.ModelDriven;

public class AttachmentAction extends RunnerSupport implements ModelDriven<List<Attachment>> {

	private static final long serialVersionUID = -7553607131119466258L;

	private List<Attachment> model = new ArrayList<Attachment>();

	private String id;

	@Autowired
	private AttachmentService attachmentService;

	public String show() {
		if(id != null){
			String type = servletRequest.getParameter("type");
			model = attachmentService.getAttachments(type, id, 0);
		}
		return SUCCESS;
	}

	public List<Attachment> getModel() {
		return model;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
