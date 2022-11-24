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
	
	//로그인
	public boolean findMember(String _id, String _password) {
		boolean result=false;
		try {
			conn=dataFactory.getConnection();
			String queryString = "select decode(count(*), 1, 'true', 'false') as result from forestmembertbl where id=? and password=?";
			pstmt = conn.prepareStatement(queryString);
			pstmt.setString(1, _id);
			pstmt.setString(2, _password);
			System.out.println(_id + " / " + _password);
			System.out.println(queryString);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			result = Boolean.parseBoolean(rs.getString("result"));
			System.out.println(result);
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("로그인 정보 탐색 중 에러: " + e.getMessage());
		}
		
		return result;
	}
	
	public MemberBean getMemberInfo(String _id) {
		MemberBean memberBean = new MemberBean();
		try {
			conn=dataFactory.getConnection();
			String queryString = "select * from forestmembertbl where id=?";
			pstmt = conn.prepareStatement(queryString);
			pstmt.setString(1, _id);
			System.out.println(queryString);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			int num=rs.getInt("num");
			String id=rs.getString("id");
			String name=rs.getString("name");
			Date birth=rs.getDate("birth");
			int tel=rs.getInt("tel");
			String email=rs.getString("email");
			String receiveemail=rs.getString("receiveemail");
			String receivesms=rs.getString("receivesms");
			System.out.println(receiveemail);
			Date joinDate=rs.getDate("joindate");
			memberBean=new MemberBean(num, id, "", name, birth, tel, email, receiveemail, receivesms, joinDate);
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("DB 수정 자료 탐색 중 에러: " + e.getMessage());
		}
		
		return memberBean;
	}
	
	public boolean updateMember(MemberBean bean) {

		try {
			conn = dataFactory.getConnection();
			String id = bean.getId();
			String password=bean.getPassword();
			int tel = bean.getTel();
			String email=bean.getEmail();
			String receiveemail = bean.getReceiveemail();
			String receivesms=bean.getReceivesms();
			
			String queryString = "update forestmembertbl set password=?, tel=?, email=?, receiveemail=?, receivesms=? where id=?";
			pstmt=conn.prepareStatement(queryString);
			pstmt.setString(1, password);
			pstmt.setInt(2, tel);
			pstmt.setString(3, email);
			pstmt.setString(4, receiveemail);
			pstmt.setString(5, receivesms);
			pstmt.setString(6, id);
			System.out.println(queryString);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
			
		} catch (Exception e) {
			System.out.println("회원 등록 오류: " + e.getMessage());
		}
		
		return true;
	}
	
	public void deleteMember(String id) {
		try {
			conn=dataFactory.getConnection();
			String queryString = "delete from forestmembertbl where id=?";
			pstmt = conn.prepareStatement(queryString);
			pstmt.setString(1, id);
			System.out.println(queryString);
			pstmt.executeUpdate();		
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("로그인 정보 탐색 중 에러: " + e.getMessage());
		}
	}
}
