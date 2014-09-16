package cn.runnerup.reports;

import java.io.File;
import java.util.Map;


import cn.runnerup.utils.DBUtil;


import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;

public class ReportEngine {

	private static final String ROOT = "reports";
	private static final String SOURCESUFFIX = ".jrxml";
	private static final String COMPILESUFFIX = ".jasper";

	public void export(){

	}

	public static String compileJasper(String filename) throws Exception{
		String path = ReportEngine.class.getClassLoader().getResource("").getPath();
		String compilePath = path + ROOT + File.separator + filename + COMPILESUFFIX;
		String sourcePath = path + ROOT + File.separator + filename + SOURCESUFFIX;
		File compileFile = new File(compilePath);
		File sourceFile = new File(sourcePath);
		if(!sourceFile.exists())
			throw new RuntimeException("");
		if(!compileFile.exists())
			JasperCompileManager.compileReportToFile(sourcePath, compilePath);
		return compilePath;
	}

	public void exportToFile(String code, Map<String, Object> map) throws Exception{
		String path = ReportEngine.compileJasper("user");
		System.out.println(path);
		JasperReport jasperReport = (JasperReport) JRLoader.loadObject(new File(path));
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, map, DBUtil.getConnection());
		//JasperExportManager.ex
	}






}
