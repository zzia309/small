package cn.runnerup.service;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.io.IOUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.commons.net.ftp.FTPClient;

public class FtpService {

    private Log logger = LogFactory.getLog(getClass());
    private FTPClient ftpClient;
    private String username;
    private String password;
    private String hostname;
    private Integer port;
    private String protocol;
    private Boolean isImplicit;
    
    public FtpService(String username, String password, String hostname, Integer port) {
        this.username = username;
        this.password = password;
        this.hostname = hostname;
        this.port = port;
    }

    private void connect() throws IOException {
        ftpClient = new FTPClient();
        ftpClient.connect(hostname, port);
        ftpClient.setBufferSize(0);
        ftpClient.setFileType(FTPClient.BINARY_FILE_TYPE);
        ftpClient.setConnectTimeout(60000);
    }

    private boolean login() throws IOException {
    	boolean	loginSuccess = ftpClient.login(username, password);
        return loginSuccess;
    }

	public String uploadFiles(String filePath) {
        String message = null;
        File file = new File(filePath);
        try {
            connect();
            boolean success = login();
            if (success) {
            	mkdirs(ftpClient, getDatePath());
                uploadFiles(file);
            } else {
                message = "Failed to login to " + hostname + ", check username and password";
                logger.warn(message);
            }
        } catch (IOException ex) {
            message = "upload files to " + hostname + " has encountered an exception: " + ex.getMessage();
            logger.error(ex.getMessage(), ex);
        } finally {
            disconnect();
        }
        return message;
    }
//
//    public static void main(String[] args) {
//        FtpService ftpUtilService = new FtpService("zxy", "enqishuang", "192.168.169.2", 21);
//        String result = ftpUtilService.uploadFiles("D:/files");
//        System.out.println(result);
//    }
//    
    private void uploadFiles(File src) throws IOException {
        if (src.isDirectory()) {
        	String dir = src.getName();
        	if(!ftpClient.changeWorkingDirectory(dir)) {
        		ftpClient.makeDirectory(dir);
        		ftpClient.changeWorkingDirectory(dir);
        	}
        	for (File file : src.listFiles()) {
        		uploadFiles(file);
        	}
            // Upload directory
            ftpClient.changeToParentDirectory();
        } else {
            // upload single file
            InputStream srcStream = null;
            try {
                srcStream = src.toURI().toURL().openStream();
                ftpClient.storeFile(new String(src.getName().getBytes("GBK"),"iso-8859-1"), srcStream);
            } finally {
                IOUtils.closeQuietly(srcStream);
            }
        }
    }

    private void disconnect() {
        if (ftpClient.isConnected()) {
            try {
                ftpClient.disconnect();
            } catch (IOException ex) {
                logger.error(ex.getMessage(), ex);
            }
        }
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getHostname() {
        return hostname;
    }

    public void setHostname(String hostname) {
        this.hostname = hostname;
    }

    public Integer getPort() {
        return port;
    }

    public void setPort(Integer port) {
        this.port = port;
    }

    public String getProtocol() {
        return protocol;
    }

    public void setProtocol(String protocol) {
        this.protocol = protocol;
    }

    public Boolean getIsImplicit() {
        return isImplicit;
    }

    public void setIsImplicit(Boolean isImplicit) {
        this.isImplicit = isImplicit;
    }
    
    private void mkdirs(FTPClient ftpClient, String directory) throws IOException{
    	for(String dir : directory.split("/")) {
    		if(!ftpClient.changeWorkingDirectory(dir)) {
    			ftpClient.makeDirectory(dir);
    			ftpClient.changeWorkingDirectory(dir);
    		}
    	}
    }
    
	public String getDatePath() {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");
		return simpleDateFormat.format(new Date());
	}    
}
