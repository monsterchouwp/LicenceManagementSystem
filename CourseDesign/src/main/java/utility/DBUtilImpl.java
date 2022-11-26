package utility;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class DBUtilImpl {

	private static DataSource ds = null;

	public static DataSource getDataSource() throws Exception {
		if (ds == null) {//拿数据源
			ds = new ComboPooledDataSource();
		}
		return ds;//返回连接池连接数据库后获取的数据源
	}

	public Connection getConnection() {//通过连接池获取链接
		try {
			Connection conn = getDataSource().getConnection();
			if (conn != null) {
				System.out.println("已建立连接");
				return conn;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public void close(Connection conn, Statement stm, ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
			}
		}
		if (stm != null) {
			try {
				conn.close();
			} catch (Exception ec) {
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (Exception ex) {
			}
		}
	}
}
