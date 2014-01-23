package cn.runnerup.actions.businesses;

import java.io.File;

import cn.runnerup.model.Business;

public class BusinessModel extends Business{

	private boolean success = false;

	private File[] businessfiles;

	private String[] businessfilesFileName;

	private String newStatus;

	private String woflowDescr;

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public File[] getBusinessfiles() {
		return businessfiles;
	}

	public void setBusinessfiles(File[] businessfiles) {
		this.businessfiles = businessfiles;
	}

	public String[] getBusinessfilesFileName() {
		return businessfilesFileName;
	}

	public void setBusinessfilesFileName(String[] businessfilesFileName) {
		this.businessfilesFileName = businessfilesFileName;
	}

	public String getNewStatus() {
		return newStatus;
	}

	public void setNewStatus(String newStatus) {
		this.newStatus = newStatus;
	}

	public String getWoflowDescr() {
		return woflowDescr;
	}

	public void setWoflowDescr(String woflowDescr) {
		this.woflowDescr = woflowDescr;
	}

}
