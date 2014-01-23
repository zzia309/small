package cn.runnerup.service;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.Calendar;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.HttpRequestHandler;
import org.springframework.web.context.ServletContextAware;

@Component("staticServlet")
public class StaticServlet implements HttpRequestHandler, ServletContextAware {

	protected static final Log LOG = LogFactory.getLog(StaticServlet.class);

    protected static final String[] classPaths = {
    		"static/",
    		"template/",
    		"org/apache/struts2/static/",
    		"org/apache/struts2/interceptor/debugging/"
    	};

	@Autowired
	private MimeService mimeService;

	protected ServletContext context;

	@Override
	public void handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		if(LOG.isDebugEnabled())
			LOG.debug(String.format("PathInfo: %s", request.getPathInfo()));
		String path = cleanupPath(request.getPathInfo());
		URL url = null;

		if(path != null)
			url = findResource(path);

		if(url != null)
			process(url, path, request, response);
		else
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
	}

	@Override
	public void setServletContext(ServletContext context) {
		this.context = context;
	}

	protected void process(URL url, String path, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Calendar cal = Calendar.getInstance();
		long ifModifiedSince = 0;

		try {
			ifModifiedSince = request.getDateHeader("If-Modified-Since");
		} catch (Exception e) {
		}
		URLConnection connection = url.openConnection();
		long lastModifiedMillis = connection.getLastModified();
		long now = cal.getTimeInMillis();
		cal.add(Calendar.DAY_OF_MONTH, 1);
		long expires = cal.getTimeInMillis();

		if (ifModifiedSince > 0 && ifModifiedSince <= lastModifiedMillis) {
			response.setDateHeader("Expires", expires);
			response.setStatus(HttpServletResponse.SC_NOT_MODIFIED);
			return;
		}

		response.setDateHeader("Date", now);
		response.setDateHeader("Expires", expires);
		response.setDateHeader("Retry-After", expires);
		response.setDateHeader("Last-Modified", lastModifiedMillis);
		response.setHeader("Cache-Control", "public");

		String contentType = mimeService.getMime(path);
		if (contentType != null) {
			response.setContentType(contentType);
		}

		InputStream inputStream = connection.getInputStream();
		OutputStream outputStream = response.getOutputStream();
		try {
			IOUtils.copy(inputStream, outputStream);
			outputStream.flush();
		} finally {
			inputStream.close();
		}
	}

	protected URL findResource(String name) {
		URL url;

		if(name.length() == 0 || name.endsWith("/"))
			return null;

		url = findContextResource(name);
		if(url != null) return url;

		return url;
	}

	protected URL findContextResource(String name) {
		URL url = null;
		try {
			url = context.getResource("/statics/style/" + name);
		} catch (MalformedURLException e) {
		}
		return url;
	}

	protected String cleanupPath(String path) {
		if(path != null) {
			if(path.startsWith("/"))
				path = path.substring(1);
		}
		return path;
	}
}
