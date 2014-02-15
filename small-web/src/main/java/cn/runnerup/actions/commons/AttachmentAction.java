package cn.runnerup.actions.commons;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import cn.runnerup.actions.RunnerSupport;
import cn.runnerup.model.Attachment;
import cn.runnerup.model.Business;
import cn.runnerup.service.AttachmentService;
import cn.runnerup.service.BusinessService;
import cn.runnerup.service.WoFlowService;

import com.opensymphony.xwork2.ModelDriven;

public class AttachmentAction extends RunnerSupport implements ModelDriven<AttachmentModel> {

	private static final long serialVersionUID = -7553607131119466258L;

	private AttachmentModel model = new AttachmentModel();

	private String id;

	@Autowired
	private AttachmentService attachmentService;

	@Autowired
	private WoFlowService woFlowService;

	@Autowired
	private BusinessService businessService;

	public String show() {
		if(StringUtils.isNotBlank(id)){
			String type = servletRequest.getParameter("type");
			Integer record = Integer.valueOf(id);
			List<Attachment> attachments = new ArrayList<Attachment>();
			attachments.addAll(attachmentService.getAttachments(type, id, 0));
			if("business".equals(type)) {
				Business business = businessService.getBusiness(record);
				if(business != null && business.getCustomer() != null) {
					attachments.addAll(attachmentService.getAttachments("customer", business.getCustomer().getId().toString(), 0));
					model.setWoflows(woFlowService.getBusinessFlow(record));
				}
			}else {
				Business business = businessService.getBusinessByCustomer(record);
				if(business != null) {
					Integer businessId = business.getId();
					attachments.addAll(attachmentService.getAttachments("business", businessId.toString(), 0));
					model.setWoflows(woFlowService.getBusinessFlow(businessId));
				}
			}
			model.setAttachments(attachments);
			model.setSuccess(true);
		}
		return SUCCESS;
	}
	
	public String destroy()throws Exception {
		Attachment attachment = attachmentService.getAttachment(Integer.valueOf(id));
		if(attachment != null) {
			attachmentService.deleteAttachment(attachment);
			model.setSuccess(true);
		}
		return SUCCESS;
	}	

	public AttachmentModel getModel() {
		return model;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
