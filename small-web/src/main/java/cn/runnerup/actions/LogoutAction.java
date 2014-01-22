package cn.runnerup.actions;

import javax.servlet.http.Cookie;

import org.springframework.beans.factory.annotation.Autowired;

import cn.runnerup.service.SmallService;

public class LogoutAction extends RunnerSupport {

	private static final long serialVersionUID = 8900622537730453852L;

	@Autowired
	private SmallService smallService;

	@Override
	public Object index() throws Exception {
		Cookie cookie = new Cookie(SmallService.PASSWORD, "");
		cookie.setPath(this.servletRequest.getContextPath());
		cookie.setMaxAge(0);
		this.servletResponse.addCookie(cookie);

		smallService.logout();

		return LOGIN;
	}

}
