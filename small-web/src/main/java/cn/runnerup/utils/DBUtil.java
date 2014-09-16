package cn.runnerup.utils;

import java.sql.Connection;

import org.apache.commons.dbcp.BasicDataSource;


public class DBUtil {

	public static Connection getConnection() throws Exception{
		BasicDataSource dataSource = (BasicDataSource) SpringHelper.getAppContext().getBean("dataSource");
		return dataSource.getConnection();
	}

	public static BasicDataSource getDataSource() throws Exception{
		BasicDataSource dataSource = (BasicDataSource) SpringHelper.getAppContext().getBean("dataSource");
		return dataSource;
	}
}
