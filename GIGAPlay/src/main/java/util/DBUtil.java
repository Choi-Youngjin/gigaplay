package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil {
	static {
		try {
			//Class.forName("oracle.jdbc.driver.OracleDriver");
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException c) {
			System.out.println(c.getMessage());
		}
	}

	public static Connection getConnection() throws SQLException {
		//return DriverManager.getConnection("jdbc:mysql://192.168.0.35:3306/cf_8ca4b924_ba4d_4722_95fb_72ef73e5571e?user=Ab6f0ylaxUlKUvvC&password=UgPrJOJv21USIUwb", "Ab6f0ylaxUlKUvvC", "UgPrJOJv21USIUwb");
		return DriverManager.getConnection("jdbc:mysql://gigaplay.c3xqukejexe9.ap-northeast-2.rds.amazonaws.com:3306/gigaplay?useSSL=false", "root", "root1234");
		
	}

	// DML��
	public static void close(Connection con, Statement stmt) {
		try {
			if (stmt != null) {
				stmt.close();
				stmt = null;
			}
			if (con != null) {
				con.close();
				con = null;
			}
		} catch (SQLException s) {
			s.printStackTrace();
		}
	}

	// SELECT��
	public static void close(Connection con, Statement stmt, ResultSet rset) {
		try {
			if (rset != null) {
				rset.close();
				rset = null;
			}
			if (stmt != null) {
				stmt.close();
				stmt = null;
			}
			if (con != null) {
				con.close();
				con = null;
			}
		} catch (SQLException s) {
			s.printStackTrace();
		}
	}
}
