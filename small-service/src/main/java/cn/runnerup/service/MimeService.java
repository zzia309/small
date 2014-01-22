package cn.runnerup.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

@Service
public class MimeService {

	private final Map<String, String> mimes = new HashMap<String, String>();

	public MimeService() {
		InputStream input = null;
		InputStreamReader inputStreamReader = null;
		BufferedReader bufferedReader = null;
		try {
			input = this.getClass().getResourceAsStream("mime.types");
			inputStreamReader = new InputStreamReader(input, "UTF-8");
			bufferedReader = new BufferedReader(inputStreamReader);
			String str;
			while ((str = bufferedReader.readLine()) != null) {
				if (str.trim().startsWith("#")
						|| StringUtils.isBlank(str.trim())) {
					continue;
				}
				String[] columns = str.trim().split("\\s+");
				if (columns.length >= 2) {
					for (int i = 1; i < columns.length; i++) {
						mimes.put(columns[i], columns[0]);
					}
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if(bufferedReader != null)
					bufferedReader.close();
				if(inputStreamReader != null)
					inputStreamReader.close();
				if(input != null)
					input.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	public String getMime(String filename) {
		String ext = FilenameUtils.getExtension(filename).toLowerCase();
		return getMimeByExtension(ext);
	}

	public String getMimeByExtension(String extension) {
		return mimes.get(extension);
	}
}
