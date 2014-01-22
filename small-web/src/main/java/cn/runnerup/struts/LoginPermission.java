package cn.runnerup.struts;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import cn.runnerup.service.SmallService;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginPermission extends AbstractInterceptor {

	private static final long serialVersionUID = -992345798270091596L;

	@Autowired
	private SmallService smallService;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		Map<String, Object> map = invocation.getInvocationContext().getSession();
		if(map.get(SmallService.SESSION_KEY) != null)
			return invocation.invoke();
		if(!invocation.getProxy().getActionName().endsWith("login"))
			return Action.LOGIN;
		else
			return invocation.invoke();
	}

}
