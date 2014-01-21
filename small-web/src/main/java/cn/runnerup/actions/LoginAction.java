package cn.runnerup.actions;

import javax.servlet.http.Cookie;

import org.springframework.beans.factory.annotation.Autowired;

import cn.runnerup.model.User;
import cn.runnerup.service.SmallService;
import cn.runnerup.service.SmallSession;
import cn.runnerup.service.UserService;

import com.opensymphony.xwork2.ModelDriven;

public class LoginAction extends RunnerSupport implements ModelDriven<LoginModel> {

	private static final long serialVersionUID = 2583934288106947256L;

	@Autowired
	private UserService userService;

	@Autowired
	private SmallService smallService;

	private LoginModel model = new LoginModel();

	@Override
	public Object index() throws Exception {
		SmallSession session = smallService.getSession();
		if(session != null && session.getUser() != null)
			return INDEX;

		Cookie[] cookies = this.servletRequest.getCookies();
		if(cookies != null) {
			for(Cookie cookie: cookies) {
				if(SmallService.USERNAME.equals(cookie.getName())) {
					model.setUsername(cookie.getValue());
					break;
				}
			}
		}
		return INPUT;
	}

	public String create() throws Exception {

		User user = userService.selectUser(model.getUsername());

		if(user == null) {
			addFieldError("username", "用户名不存在！");
			return INPUT;
		}

		if(!userService.verifyPassword(user, model.getPassword())) {
			addFieldError("password", "密码错误！");
			return INPUT;
		}

		if(!smallService.validateUser(user)) {
			addFieldError("username", "该用户不是有效用户！");
			return INPUT;
		}

		Cookie cookie = new Cookie(SmallService.USERNAME, model.getUsername());
		cookie.setPath(this.servletRequest.getContextPath());
		cookie.setMaxAge(Integer.MAX_VALUE);
		this.servletResponse.addCookie(cookie);

		if(model.isRememberMe()) {
			cookie = new Cookie(SmallService.PASSWORD, user.getPassword());
			cookie.setPath(this.servletRequest.getContextPath());
			cookie.setMaxAge(Integer.MAX_VALUE);
			this.servletResponse.addCookie(cookie);
		}

		try {
			smallService.login(user);
		} catch (Exception e) {
			addActionError("系统错误！");
			return INPUT;
		}

		return INDEX;
	}

	public LoginModel getModel() {
		return model;
	}

}
