package cn.runnerup.actions.commons;

import java.io.FileInputStream;
import java.io.InputStream;

import org.apache.commons.io.FilenameUtils;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import cn.runnerup.actions.RunnerSupport;
import cn.runnerup.model.Attachment;
import cn.runnerup.service.AttachmentService;
import cn.runnerup.service.MimeService;

@Results({
	@Result(name = "attachment", type = "stream", params = {
			"inputName",
			"inputStream",
			"allowCaching",
			"true"
	})
})
public class DownAction extends RunnerSupport {

	private static final long serialVersionUID = -4367629776729927085L;

	private Integer id;

	@Autowired
	private AttachmentService attachmentService;

	@Autowired
	private MimeService mimeService;

	private Attachment attachment;

	private String contentType;

	private String contentDisposition;

	private InputStream inputStream;

	public String show() throws Exception {
		if(attachment != null) {
			contentType = mimeService.getMime(attachment.getFilename());
			contentDisposition = String.format("attachment; filename=\"%s\"", encodeHttpHeader(attachment.getFilename(), "UTF-8"));
			inputStream = new FileInputStream(FilenameUtils.concat(attachmentService.getRoot(), attachment.getPath()));
		}
		return "attachment";
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		if(id != null)
			attachment = attachmentService.getAttachment(id);
		else
			addActionError("error");
		this.id = id;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public String getContentDisposition() {
		return contentDisposition;
	}

	public void setContentDisposition(String contentDisposition) {
		this.contentDisposition = contentDisposition;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

}
