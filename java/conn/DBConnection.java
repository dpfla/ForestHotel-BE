package conn;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBConnection {
	private DataSource dataFactory;
	
	public DBConnection() {
		try {
			Context ctx=new InitialContext();
			Context envContext=(Context)ctx.lookup("java:/comp/env");
			dataFactory=(DataSource)envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			System.out.println("Ŀ�ؼ� �������: "+e.getMessage());
		}
	}
	
	public Connection getConnection() {
		Connection conn=null;
		try {
			conn = dataFactory.getConnection();
		} catch (Exception e) {
			System.out.println("Ŀ�ؼ� ȹ�� ����: " + e.getMessage());
		}
		
		return conn;
	}
}
