package cn.runnerup.struts;

import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.struts2.util.StrutsTypeConverter;

public class ObjectConverter extends StrutsTypeConverter {

	private static Map<String,String> cache = new HashMap<String, String>();

	@SuppressWarnings("rawtypes")
	@Override
	public Object convertFromString( Map context, String[] values, Class toClass) {
		if(values.length > 0 && values[0].length() > 0) {
			try {
				Object obj = toClass.newInstance();
				BeanUtils.setProperty(obj, getId(toClass), values[0]);
				return obj;
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public String convertToString(Map context, Object o) {
		return (String) performFallbackConversion(context, o, String.class);
	}

	private String getId(Class<?> toClass) {
		String name = toClass.getCanonicalName();
		String id = cache.get(name);
		if(id == null) {
			try {
				InputStream stream = toClass.getResourceAsStream(toClass.getSimpleName() + "-info.properties");
				if(stream != null) {
					Properties properties = new Properties();
					properties.load(stream);
					stream.close();
					id = properties.getProperty("id");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			if(id == null) id = "id";
			cache.put(name, id);
		}
		return id;
	}
}
