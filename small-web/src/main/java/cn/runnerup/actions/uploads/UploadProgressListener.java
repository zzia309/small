package cn.runnerup.actions.uploads;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.ProgressListener;

public class UploadProgressListener implements ProgressListener {

	private HttpSession session;
	 
    public UploadProgressListener(HttpServletRequest request) {
       session = request.getSession();
       FileUploadStatus newUploadStatus = new FileUploadStatus();
       session.setAttribute("currentUploadStatus", newUploadStatus);
    }
 
    public void update(long readedBytes, long totalBytes, int currentItem) {
       FileUploadStatus status = (FileUploadStatus) session.getAttribute("currentUploadStatus");
       status.setReadedBytes(readedBytes);
       status.setTotalBytes(totalBytes);
       status.setCurrentItems(currentItem);
       if(readedBytes == totalBytes)
    	   status.setSuccess(true);
       session.setAttribute("currentUploadStatus", status);
    }

}
