package cn.runnerup.utils;


import javax.servlet.ServletContextEvent;

import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;


public class SmallSpringContext extends ContextLoaderListener{

	private static WebApplicationContext springContext;

	public SmallSpringContext(){
		super();
	}

	@Override
	public void contextInitialized(ServletContextEvent event) {
		springContext = WebApplicationContextUtils.getWebApplicationContext(event.getServletContext());
	}

	public void contextDestroyed(ServletContextEvent event) {
    }

	public static WebApplicationContext getSpringContext() {
		return springContext;
	}
}
