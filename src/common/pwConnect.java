package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class pwConnect {
	
	public Connection con;
	public PreparedStatement pstmt;
	public ResultSet rs;
	
	public pwConnect() {
		try {
			Class.forName("org.h2.Driver");
			String url = "jdbc:h2:tcp://localhost/~/test";
			String user = "sa";
			String password = "";
			con = DriverManager.getConnection(url, user, password);
			
			System.out.println("DB ���� ����");
		} catch (Exception e) {
			System.out.println("Exception[connection] : " + e.getMessage());
		}
	}
	
	public void close() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
		} catch (Exception e) {
			System.out.println("Exception[connection] : " + e.getMessage());
		}
	}
}