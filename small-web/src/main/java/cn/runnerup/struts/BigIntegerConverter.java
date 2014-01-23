package cn.runnerup.struts;

import java.math.BigInteger;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.util.StrutsTypeConverter;

public class BigIntegerConverter extends StrutsTypeConverter {

	@SuppressWarnings("rawtypes")
	@Override
	public Object convertFromString(Map context, String[] values, Class toClass) {
		if(values.length > 0) {
			if(StringUtils.isBlank(values[0])) return null;
			else return new BigInteger(values[0]);
		} else
			return null;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public String convertToString(Map context, Object o) {
		return (String) performFallbackConversion(context, o, String.class);
	}

}
