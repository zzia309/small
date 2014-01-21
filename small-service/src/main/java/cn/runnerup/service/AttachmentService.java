package cn.runnerup.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.runnerup.mapper.AttachmentMapper;
import cn.runnerup.model.Attachment;
import cn.runnerup.model.User;

@Service
@Transactional
public class AttachmentService {

	public static final String ATTACHMENT_DIR = "files";

	@Autowired
	private AttachmentMapper attachmentMapper;

	@Autowired
	private MimeService mimeService;

	public Attachment getAttachment(Integer id) {
		return attachmentMapper.selectByPrimaryKey(id);
	}

	public InputStream getAttachment(Attachment attachment, boolean thumvnail, boolean download) throws Exception{
		String root = getRoot();
		String path = attachment.getPath();
		File file = new File(FilenameUtils.concat(root, path));
		if(download) {
			return new FileInputStream(file);
		} else
			if(thumvnail) {
				File thumvnailFile = new File(file.getParent(), "thumbnail_" + file.getName());
				return new FileInputStream(thumvnailFile);
			}
			else
				return new FileInputStream(file);
	}
//
//	public void createThumbnailImage(Attachment attachment, ImageInputStream Image) throws Exception{
//		String root = getRoot();
//		String path = attachment.getPath();
//
//		File file1 = new File(FilenameUtils.concat(root, path));
//		File file = new File(file1.getParent(), "thumbnail_" + file1.getName());
//
//		BufferedImage bufferedImage = ImageIO.read(Image);
//		BufferedImage thumvnail = Scalr.resize(bufferedImage, 150);
//		ImageIO.write(thumvnail, "JPG", file);
//	}

//	public int deleteAttachment(Attachment attachment) {
//		File file = new File(FilenameUtils.concat(getRoot(), attachment.getPath()));
////		if(attachment.getType() == AttachmentType.IMAGE){
////			File thumbnailFile = new File(file.getParent(), "thumbnail_" + attachment.getFilename());
////			thumbnailFile.delete();
////		}
//		file.delete();
//		return attachmentMapper.delete(attachment.getId());
//	}

	public Attachment upload(User user, String model, String record, int type, File file, String fileName) throws IOException {
		String root, path, filename, name;
		root = getRoot();
		path = getPath();
		filename = FilenameUtils.getName(fileName);
		File directory = new File(FilenameUtils.concat(root, path));
		if (!directory.exists()) {
			directory.mkdirs();
		}
		name = createName(root, path, filename);
		File destFile = new File(directory, name);
		FileUtils.copyFile(file, destFile);

		Attachment attachment = new Attachment();
		attachment.setUser(user);
		attachment.setModel(model);
		attachment.setRecord(record);
		attachment.setType(type);
		attachment.setFilename(filename);
		attachment.setPath(FilenameUtils.concat(path, name));
		attachment.setMime(mimeService.getMime(fileName));
		attachment.setSize(FileUtils.sizeOf(file));
		attachment.setCreated(Calendar.getInstance().getTime());
		attachmentMapper.insert(attachment);
		return attachment;
	}

	public String getRoot() {
		return FilenameUtils.concat(FileUtils.getTempDirectoryPath(), ATTACHMENT_DIR);
	}

	private String getPath() {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");
		return simpleDateFormat.format(Calendar.getInstance().getTime());
	}

	private String createName(String root, String path, String filename) throws IOException {
		String parent = FilenameUtils.concat(root, path);
		String name = filename;
		File file = new File(parent, name);
		int i = 0;
		while (!file.createNewFile()) {
			i++;
			name = String.format("%1$s.%2$03d", filename, i);
			file = new File(parent, name);
		}
		return name;
	}

}
