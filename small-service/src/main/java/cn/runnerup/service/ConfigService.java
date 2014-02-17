package cn.runnerup.service;

import java.util.Properties;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

@Service
public class ConfigService {
	
	private static final Log LOG = LogFactory.getLog(ConfigService.class);
	
	private Properties properties = new Properties();
	
	public ConfigService() {
		try {
			properties.load(getClass().getClassLoader().getResourceAsStream("small.properties"));
		} catch (Exception e) {
			LOG.error(e);
		}
	}
	
	public String getConfig(String key) {
		return properties.getProperty(key);
	}

	public String getConfig(String key, String defaultValue) {
		return properties.getProperty(key, defaultValue);
	}	

}
