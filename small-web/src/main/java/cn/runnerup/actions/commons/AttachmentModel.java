package cn.runnerup.actions.commons;

import java.util.List;

import cn.runnerup.model.Attachment;
import cn.runnerup.model.Woflow;

public class AttachmentModel {

	private List<Attachment> attachments;

	private List<Woflow> woflows;

	private boolean success = false;

	public List<Attachment> getAttachments() {
		return attachments;
	}

	public void setAttachments(List<Attachment> attachments) {
		this.attachments = attachments;
	}

	public List<Woflow> getWoflows() {
		return woflows;
	}

	public void setWoflows(List<Woflow> woflows) {
		this.woflows = woflows;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

}
