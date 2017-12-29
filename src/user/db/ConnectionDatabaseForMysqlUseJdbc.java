package user.db;

import java.sql.Connection;
import java.sql.SQLException;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class ConnectionDatabaseForMysqlUseJdbc {
	
	private static ComboPooledDataSource ds=new ComboPooledDataSource();
	private static Connection con=null;
	
	public static ComboPooledDataSource getDataSourse(){
		return ds;
	}
	
	public static Connection getConnection() {
		try {
			con=ds.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	
}
