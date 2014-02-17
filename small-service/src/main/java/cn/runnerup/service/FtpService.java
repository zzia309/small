package cn.runnerup.service;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPSClient;

public class FtpService {

    private Log logger = LogFactory.getLog(getClass());
    private FTPClient ftpClient;
    private String username;
    private String password;
    private String hostname;
    private Integer port;
    private Boolean isFTPS;
    private String protocol;
    private Boolean isImplicit;

    public FtpService(String username, String password, String hostname, Integer port) {
        this.username = username;
        this.password = password;
        this.hostname = hostname;
        this.port = port;
        isFTPS = false;
    }

    public FtpService(String username, String password, String hostname, Integer port, String protocol, Boolean isImplicit) {
        this.username = username;
        this.password = password;
        this.hostname = hostname;
        this.port = port;
        isFTPS = true;
        this.protocol = protocol;
        this.isImplicit = isImplicit;
    }

    private void connect() throws IOException {
        if (!isFTPS) {
            ftpClient = new FTPClient();
        } else {
            FTPSClient ftpsClient;
            if (protocol == null) {
                if (isImplicit == null) {
                    ftpsClient = new FTPSClient();
                } else {
                    ftpsClient = new FTPSClient(isImplicit);
                }
            } else {
                if (isImplicit == null) {
                    ftpsClient = new FTPSClient(protocol);
                } else {
                    ftpsClient = new FTPSClient(protocol, isImplicit);
                }
            }
            ftpClient = ftpsClient;
        }
        ftpClient.connect(hostname, port);
        ftpClient.setBufferSize(0);
        ftpClient.setFileType(FTPClient.BINARY_FILE_TYPE);
    }

    private boolean login() throws IOException {
        boolean loginSuccess = ftpClient.login(username, password);
        return loginSuccess;
    }

    public String uploadFiles(String filePath, String changeDirectory) {
        String message = null;
        File file = new File(filePath);
        try {
            connect();
            if (login()) {
                if (StringUtils.isNotBlank(changeDirectory)) {
                    // Change working directory
                    if (!ftpClient.changeWorkingDirectory(changeDirectory)) {
                        message = "Failed to change working directory to " + changeDirectory + " on " + hostname;
                        logger.warn(message);
                        return message;
                    }
                }
                uploadFiles(file);
                message = "upload files to " + hostname + " via ftp";
            } else {
                message = "Failed to login to " + hostname + ", check username and password";
                logger.warn(message);
            }
        } catch (IOException ex) {
            message = "upload files to " + hostname + "has encountered an exception: " + ex.getMessage();
            logger.error(ex.getMessage(), ex);
        } finally {
            disconnect();
        }
        return message;
    }

//    public static void main(String[] args) {
//        FtpService ftpUtilService = new FtpService("zxy", "enqishuang", "192.168.0.105", 21);
//        String result = ftpUtilService.uploadFiles("D:/files", "");
//        System.out.println(result);
//    }
    
    public String uploadStream(List<String> remoteList, List<InputStream> inputStreamList, String changeDirectory) {
        String message = null;
        try {
            connect();
            if (login()) {
                if (StringUtils.isNotBlank(changeDirectory)) {
                    // Change working directory
                    if (!ftpClient.changeWorkingDirectory(changeDirectory)) {
                        message = "Failed to change working directory to " + changeDirectory + " on " + hostname;
                        logger.warn(message);
                        return message;
                    }
                }
                // upload input streams
                int size = remoteList.size();
                for (int i = 0; i < size; i++) {
                    ftpClient.storeFile(remoteList.get(i), inputStreamList.get(i));
                }
                message = "upload files to " + hostname;
            } else {
                message = "Failed to login to " + hostname + ", check username and password";
                logger.warn(message);
            }
        } catch (IOException ex) {
            message = "upload files to " + hostname + "has encountered an exception: " + ex.getMessage();
            logger.error(ex.getMessage(), ex);
        } finally {
            disconnect();
        }
        return message;
    }

    private void uploadFiles(File src) throws IOException {
        if (src.isDirectory()) {
            // Upload directory
            ftpClient.makeDirectory(src.getName());
            ftpClient.changeWorkingDirectory(src.getName());
            for (File file : src.listFiles()) {
                uploadFiles(file);
            }
            ftpClient.changeToParentDirectory();
        } else {
            // upload single file
            InputStream srcStream = null;
            try {
                srcStream = src.toURI().toURL().openStream();
                ftpClient.storeFile(src.getName(), srcStream);
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

    public Boolean getIsFTPS() {
        return isFTPS;
    }

    public void setIsFTPS(Boolean isFTPS) {
        this.isFTPS = isFTPS;
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
}
