package cn.runnerup.utils;

import org.springframework.web.context.WebApplicationContext;

public class SpringHelper {

	public static WebApplicationContext getAppContext(){
		return SmallSpringContext.getSpringContext();
	}

}
