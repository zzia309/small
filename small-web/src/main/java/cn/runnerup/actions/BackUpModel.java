package cn.runnerup.actions;

public class BackUpModel {
	
	private String username;
	
	private String password;
	
	private String hostip;
	
	private boolean success = false;

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

	public String getHostip() {
		return hostip;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public void setHostip(String hostip) {
		this.hostip = hostip;
	}

}
