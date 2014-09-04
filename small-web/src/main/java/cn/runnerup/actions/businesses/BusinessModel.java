package cn.runnerup.actions.businesses;

import java.io.File;
import java.util.List;

import cn.runnerup.model.Business;
import cn.runnerup.model.Woflow;

public class BusinessModel extends Business{

	private boolean success = false;

	private File[] businessfiles;

	private String[] businessfilesFileName;

	private String newStatus;

	private String woflowDescr;

	private String buqicailiao;

	private List<Woflow> woflows;

	public String getBuqicailiao() {
		return buqicailiao;
	}

	public void setBuqicailiao(String buqicailiao) {
		this.buqicailiao = buqicailiao;
	}

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

	public List<Woflow> getWoflows() {
		return woflows;
	}

	public void setWoflows(List<Woflow> woflows) {
		this.woflows = woflows;
	}

}
