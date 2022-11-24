package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.BoardBean;
import model.BoardDAO;

@WebServlet("/board/*")
public class BoardController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String nextPage=null;
		String action=request.getPathInfo();
		System.out.println("member 요청 경로: " + action);
		
		try {
			BoardDAO boardDAO = new BoardDAO();
			if(action.equals("/boardList.do")) {
				/*List<BoardBean> boardList =new ArrayList<BoardBean>();
				boardList = boardDAO.selectAllBoard();
				request.setAttribute("boardList", boardList);
				nextPage = "/baseweb/boardList.jsp";*/
				
				String _section=request.getParameter("section");
				String _pageNum=request.getParameter("pageNum");
				int section=Integer.parseInt(_section== null ? "1" : _section);
				int pageNum=Integer.parseInt(_pageNum== null ? "1" : _pageNum);
				
				Map<String, Integer> pagingMap=new HashMap<String, Integer>();
				pagingMap.put("section", section);
				pagingMap.put("pageNum", pageNum);
				Map boardMap = boardDAO.listArticles(pagingMap);
				//게시글 10개와 전체 글 갯수 가짐
				boardMap.put("section", section);
				boardMap.put("pageNum", pageNum);
				//클라이언트가 클릭한 페이지수
				request.setAttribute("boardMap", boardMap);
				nextPage = "/baseweb/boardList.jsp";
				
			} else if(action.equals("/addBoard.do")) {
				String title = request.getParameter("title");
				String content = request.getParameter("content");
				BoardBean boardBean = new BoardBean();
				boardBean.setTitle(title);
				boardBean.setContent(content);
				boardDAO.addBoard(boardBean);
				
				nextPage = "/board/boardList.do";
				
			} else if(action.equals("/viewBoard.do")) {
				int articleNo = Integer.parseInt(request.getParameter("articleNo"));
				int section=Integer.parseInt(request.getParameter("section"));
				int pageNum=Integer.parseInt(request.getParameter("pageNum"));
				BoardBean boardBean = new BoardBean();
				boardBean = boardDAO.selectBoard(articleNo);
				request.setAttribute("board", boardBean);
				request.setAttribute("section", section);
				request.setAttribute("pageNum", pageNum);
				nextPage = "/baseweb/viewBoard.jsp";
				
			} else if(action.equals("/modBoard.do")) { 
				String title = request.getParameter("title");
				String content = request.getParameter("content");
				int articleNo = Integer.parseInt(request.getParameter("articleNo"));
				int section=Integer.parseInt(request.getParameter("section"));
				int pageNum=Integer.parseInt(request.getParameter("pageNum"));
				System.out.println(title + "/" + content + "/" + articleNo);
				BoardBean boardBean = new BoardBean(articleNo, title, content);
				boardDAO.updateBoard(boardBean);
				nextPage = "/board/viewBoard.do?articleNo=" + articleNo + "&section=" + section + "&pageNum=" +pageNum;
				
			}else if(action.equals("/delBoard.do")) {
				int articleNo = Integer.parseInt(request.getParameter("articleNo"));
				int section=Integer.parseInt(request.getParameter("section"));
				int pageNum=Integer.parseInt(request.getParameter("pageNum"));
				
				boardDAO.deleteBoard(articleNo);
				nextPage="/board/boardList.do?section=" + section + "&pageNum=" +pageNum;
				
			}
			RequestDispatcher dispatcher=request.getRequestDispatcher(nextPage);
			dispatcher.forward(request, response);
			
		} catch (Exception e) {
			System.out.println("controller 요청 오류: " + e.getMessage());
		}
	}
}
