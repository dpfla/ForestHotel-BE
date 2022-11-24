package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	private DataSource dataFactory;
	private Connection conn;
	private PreparedStatement pstmt;
	
	public BoardDAO() {
		try {
			Context ctx=new InitialContext();
			Context envContext=(Context)ctx.lookup("java:/comp/env");
			dataFactory=(DataSource)envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			System.out.println("커넥션 연결실패: "+e.getMessage());
		}
	}
	
	public List<BoardBean> selectAllBoard() {
		List<BoardBean> boardList = new ArrayList<BoardBean>();
		
		try {
			conn=dataFactory.getConnection();
			String query= "select * from forestboardtbl order by articleNo desc";
			System.out.println(query);
			pstmt=conn.prepareStatement(query);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				int articleNo=rs.getInt("articleNo");
				String title=rs.getString("title");
				Date writeDate=rs.getDate("writeDate");
				
				BoardBean bean=new BoardBean();
				bean.setArticleNo(articleNo);
				bean.setTitle(title);
				bean.setWriteDate(writeDate);
				
				boardList.add(bean);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("전체 공지사항 조회 중 오류: " + e.getMessage());
		}
		
		return boardList;
	}
	
	public List<BoardBean> selectMapBoard(Map<String, Integer> pagingMap) {
		List<BoardBean> boardList=new ArrayList<BoardBean>();
		int section=(Integer)pagingMap.get("section");
		int pageNum=(Integer)pagingMap.get("pageNum");
		
		try {
			conn=dataFactory.getConnection();
			String query= "select * from"
					+ " (select rownum as recNum, articleNo, title, writeDate from forestboardtbl order by articleNo desc)"
					+ " where recNum between (?-1)*50+(?-1)*10+1 and (?-1)*50+?*10";
			System.out.println(query);
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, section);
			pstmt.setInt(2, pageNum);
			pstmt.setInt(3, section);
			pstmt.setInt(4, pageNum);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				int articleNo=rs.getInt("articleNo");
				String title=rs.getString("title");
				Date writeDate=rs.getDate("writeDate");
				
				BoardBean bean=new BoardBean();
				bean.setArticleNo(articleNo);
				bean.setTitle(title);
				bean.setWriteDate(writeDate);
				
				boardList.add(bean);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("전체 공지사항 조회 중 오류: " + e.getMessage());
		}
		
		return boardList;
	}
	public int selectTotal() {
		try {
			conn=dataFactory.getConnection();
			String query="select count(articleNo) from forestboardtbl";
			pstmt=conn.prepareStatement(query);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				System.out.println(rs.getInt(1));
				return (rs.getInt(1));
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("글 목록 수 처리중 오류: " + e.getMessage());
		}
		//자료가 하나도 없을 때
		return 0;
	}
	
	public Map listArticles(Map<String, Integer> paginMap) {
		Map boardMap=new HashMap();
		List<BoardBean> boardList = selectMapBoard(paginMap);
		int totBoards=selectTotal();
		//글이 100개 이하일 때는 section 표시하지 않기 위해 전체 글 갯수 가져옴
		boardMap.put("boardList", boardList);
		boardMap.put("totBoards", totBoards);
		
		return boardMap;
	}
	
	public void addBoard(BoardBean bean) {
		try {
			conn = dataFactory.getConnection();
			String title = bean.getTitle();
			String content = bean.getContent();
			
			String queryString="insert into forestboardtbl values(articleNo_seq.nextval,?,?,sysdate) ";
			pstmt=conn.prepareStatement(queryString);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			System.out.println(queryString);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
			
		} catch (Exception e) {
			System.out.println("공지사항 등록 오류: " + e.getMessage());
		}
	}
	
	public BoardBean selectBoard(int _articleNo) {
		BoardBean bean=new BoardBean();
		
		try {
			conn=dataFactory.getConnection();
			String query= "select * from forestboardtbl where articleNo=?";
			System.out.println(query);
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, _articleNo);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				int articleNo=rs.getInt("articleNo");
				String title=rs.getString("title");
				String content=rs.getString("content");
				Date writeDate=rs.getDate("writeDate");
				
				bean.setArticleNo(articleNo);
				bean.setTitle(title);
				bean.setContent(content);
				bean.setWriteDate(writeDate);

			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("전체 공지사항 조회 중 오류: " + e.getMessage());
		}
		
		return bean;
	}
	
	public void deleteBoard(int articleNo) {
		try {
			conn=dataFactory.getConnection();
			String query = "delete from forestboardtbl where articleNo=?";
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, articleNo);
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
			
		}catch(Exception e){
			System.out.println("삭제 중 오류: " + e.getMessage());
		}
	}
	
	public void updateBoard(BoardBean bean) {
		try {
			conn=dataFactory.getConnection();
			String query = "update forestboardtbl set title=?, content=? where articleNo=?";
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, bean.getTitle());
			pstmt.setString(2, bean.getContent());
			pstmt.setInt(3, bean.getArticleNo());
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
			
		}catch(Exception e){
			System.out.println("수정 중 오류: " + e.getMessage());
		}
	}
}
