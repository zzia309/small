package cn.runnerup.actions.commons;

import java.io.FileInputStream;
import java.io.OutputStream;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;

import cn.runnerup.actions.RunnerSupport;
import cn.runnerup.model.Attachment;
import cn.runnerup.service.AttachmentService;

public class DownAction extends RunnerSupport {

	private static final long serialVersionUID = -4367629776729927085L;

	private Integer id;

	@Autowired
	private AttachmentService attachmentService;

	private Attachment attachment;

	public String show() throws Exception {
		if(attachment != null) {
			servletResponse.setContentType(attachment.getMime());
			servletResponse.setHeader(
					"Content-disposition",
					String.format("attachment; filename=\"%s\"", encodeHttpHeader(attachment.getFilename(), "UTF-8")));
			OutputStream out = servletResponse.getOutputStream();
			FileInputStream stream = new FileInputStream(FilenameUtils.concat(attachmentService.getRoot(), attachment.getPath()));
			IOUtils.copy(stream, out);
		}
		return null;
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

}
