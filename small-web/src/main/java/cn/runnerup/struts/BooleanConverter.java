package cn.runnerup.struts;

import java.util.Map;

import org.apache.commons.lang3.BooleanUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.util.StrutsTypeConverter;

public class BooleanConverter extends StrutsTypeConverter {

	@SuppressWarnings("rawtypes")
	@Override
	public Object convertFromString(Map context, String[] values, Class toClass) {
		if(values.length > 0 && StringUtils.isNotBlank(values[0])) {
			return BooleanUtils.toBoolean(values[0]);
		} else {
			if(toClass.isPrimitive())
				return Boolean.FALSE;
			else
				return null;
		}
	}

	@SuppressWarnings("rawtypes")
	@Override
	public String convertToString(Map context, Object o) {
		return (String) performFallbackConversion(context, o, String.class);
	}

}
