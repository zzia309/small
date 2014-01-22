package cn.runnerup.service;

import java.util.HashMap;
import java.util.Map;

import cn.runnerup.model.User;

public class SmallSession {

	private User user;

	private Map<String, Object> properties = new HashMap<String, Object>();

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Object getProperty(String key) {
		return properties.get(key);
	}

	public Object setProperty(String key, Object value) {
		return properties.put(key, value);
	}

	public Object removeProperty(String key) {
		return properties.remove(key);
	}

}
