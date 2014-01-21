package cn.runnerup.struts;

import java.io.IOException;
import java.io.Writer;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.StrutsConstants;
import org.apache.struts2.rest.handler.ContentTypeHandler;
import org.apache.struts2.rest.handler.JsonLibHandler;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.opensymphony.xwork2.inject.Inject;

public class GsonTypeHandler extends JsonLibHandler implements ContentTypeHandler {

	private static final String DEFAULT_CONTENT_TYPE = "text/html";

	private String defaultEncoding = "ISO-8859-1";

    protected final Log logger = LogFactory.getLog(getClass());

	public String fromObject(Object obj, String resultCode, Writer stream)
			throws IOException {
		Gson gson = createGson();
		if (obj instanceof Throwable) {
			Map<String, Object> map = new HashMap<String, Object>();
			List<String> errors = new ArrayList<String>();
			Throwable t = (Throwable) obj;
			logger.error(t.getLocalizedMessage(), t);
//			if(t instanceof EapException) {
//				EapException e = (EapException) t;
//				errors.add(e.getLocalizedMessage());
//			} else
//				errors.add("System error.");
			map.put("actionErrors", errors);
			stream.write(gson.toJson(map));
		} else {
			stream.write(gson.toJson(obj));
		}
		return null;
	}

	public String getExtension() {
		return "gson";
	}

	@Override
	public String getContentType() {
		return DEFAULT_CONTENT_TYPE+";charset=" + this.defaultEncoding;
	}

	@Inject(StrutsConstants.STRUTS_I18N_ENCODING)
	public void setDefaultEncoding(String val) {
		this.defaultEncoding = val;
	}

	private Gson createGson() {
		GsonBuilder builder = new GsonBuilder();
		DateSerializer dateSerializer = new DateSerializer();
//		ClobSerializer clobSerializer = new ClobSerializer();

		builder.serializeNulls();

		builder.registerTypeAdapter(Date.class, dateSerializer);
		builder.registerTypeAdapter(java.sql.Date.class, dateSerializer);
		builder.registerTypeAdapter(Time.class, dateSerializer);
		builder.registerTypeAdapter(Timestamp.class, dateSerializer);

//		builder.registerTypeHierarchyAdapter(java.sql.Clob.class, clobSerializer);

		return builder.create();
	}

}
