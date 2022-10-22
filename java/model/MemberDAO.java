package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MemberDAO {
	private DataSource dataFactory;
	private Connection conn;
	private PreparedStatement pstmt;
	
	public MemberDAO() {
		try {
			Context ctx=new InitialContext();
			Context envContext=(Context)ctx.lookup("java:/comp/env");
			dataFactory=(DataSource)envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			System.out.println("커넥션 연결실패: "+e.getMessage());
		}
	}
	
	
	//회원 등록
	public void addMember(MemberBean bean) {
		try {
			conn = dataFactory.getConnection();
			String id= bean.getId();
			String password=bean.getPassword();
			String name=bean.getName();
			Date birth=bean.getBirth();
			int tel = bean.getTel();
			String email=bean.getEmail();
			String receiveemail = bean.getReceiveemail();
			String receivesms=bean.getReceivesms();
			
			String queryString="insert into forestmembertbl values(num_seq.nextval,?,?,?,?,?,?,?,?,sysdate) ";
			pstmt=conn.prepareStatement(queryString);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			pstmt.setString(3, name);
			pstmt.setDate(4, birth);
			pstmt.setInt(5, tel);
			pstmt.setString(6, email);
			pstmt.setString(7, receiveemail);
			pstmt.setString(8, receivesms);
			System.out.println(queryString);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
			
		} catch (Exception e) {
			System.out.println("회원 등록 오류: " + e.getMessage());
		}
	}
	
	//아이디 중복 체크
	public boolean overlappedID(String id) {
		boolean result=false;
		
		try {
			conn = dataFactory.getConnection();
			String query = "select decode(count(*), 1, 'true', 'false') as result from forestmembertbl";
			query += " where id=?";
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			result = Boolean.parseBoolean(rs.getString("result"));
			System.out.println(result);
			pstmt.close();
			conn.close();
			rs.close();
		} catch (Exception e) {
			System.out.println("overlappedID 실패: " + e.getMessage());
		}
		
		return result;
	}
}
