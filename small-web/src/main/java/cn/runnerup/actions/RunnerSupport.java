package cn.runnerup.actions;

import java.io.Serializable;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.rest.RestActionSupport;
import org.springframework.beans.factory.annotation.Autowired;

import cn.runnerup.model.User;
import cn.runnerup.service.SmallService;
import cn.runnerup.service.SmallSession;

public class RunnerSupport extends RestActionSupport implements
		ServletRequestAware, ServletResponseAware, Serializable {

	private static final long serialVersionUID = 7465276717972034649L;

	public static final String INDEX = "index";

	protected HttpServletRequest servletRequest;

	protected HttpServletResponse servletResponse;

	@Autowired
	private SmallService smallService;

	protected String encodeHttpHeader(String string, String encoding) throws Exception {
		if(null == string) string = "";
		if(servletRequest.getHeader("User-Agent").toLowerCase().indexOf("firefox") >= 0)
			return new String(string.getBytes(encoding), "ISO8859-1");
		else
			return URLEncoder.encode(string, encoding);
	}

	public User getUser() {
		return smallService.getUser();
	}

	public SmallSession getSmallSession() {
		return smallService.getSession();
	}

	public void setServletResponse(HttpServletResponse response) {
		this.servletResponse = response;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.servletRequest = request;
	}


}
