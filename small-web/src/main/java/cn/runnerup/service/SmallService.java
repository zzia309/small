package cn.runnerup.service;

import cn.runnerup.model.User;

public interface SmallService {

	public static final String SESSION_KEY = "smallsession";

	public static final String PASSWORD = "password";

	public static final String USERNAME = "username";

	public boolean validateUser(User user);

	public SmallSession login(User user) throws Exception;

	public void logout();

	public SmallSession getSession();

	public User getUser();

}
