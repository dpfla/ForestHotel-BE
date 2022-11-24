package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.MemberBean;
import model.MemberDAO;

@WebServlet("/member/*")
public class MemberController extends HttpServlet {
	MemberDAO memberDAO;
	
	@Override
	public void init() throws ServletException {
		memberDAO = new MemberDAO();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		HttpSession session;
		String nextPage=null;
		String action=request.getPathInfo();
		System.out.println("member 요청 경로: " + action);
		
		try {
			
			if(action == null || action.equals("/")) {
				nextPage = "/baseweb/index.jsp";
				
			} else if(action.equals("/joinForm.do")) {
				nextPage="/baseweb/join.jsp";
				
			} else if(action.equals("logoutMember.do")) {
				session = request.getSession();
				session.removeAttribute("isLogin");
				
			} else if(action.equals("/addMemeber.do")) {
				String id=request.getParameter("id");
				String password=request.getParameter("password");
				String name=request.getParameter("name");
				String birthY=request.getParameter("birthY");
				String birthM=request.getParameter("birthM");
				String birthD=request.getParameter("birthD");
				Date birth=Date.valueOf(birthY+"-"+birthM+"-"+birthD);
				int tel=Integer.parseInt(request.getParameter("tel"));
				String email=request.getParameter("email");
				String receiveEmail = request.getParameter("receiveEmail") != null ? "1" : "0";
				String receiveSMS = request.getParameter("receiveSMS") !=null ? "1" : "0";
				
				MemberBean memberBean=new MemberBean(id, password, name, birth, tel, email, receiveEmail, receiveSMS);
				memberDAO.addMember(memberBean);
				
				request.setAttribute("msg", "addMember");
				nextPage="/member/";
				
			} else if(action.equals("/idCheck.do")) {
				String id=(String)request.getParameter("id");
				System.out.println(id);
				
				boolean overlappedID=memberDAO.overlappedID(id);
				if(overlappedID == true) {
					out.print("not_usable,"+id);
				} else {
					out.print("usable,"+id);
				}
				return ;
				
			} else if(action.equals("/loginMember.do")) {
				String curPage=(String)request.getParameter("curPage");
				
				String id=(String)request.getParameter("user_id");
				String pw=(String)request.getParameter("user_pw");
				boolean result = memberDAO.findMember(id, pw);
				if(result == true) {
					request.setAttribute("msg", "loginTrue");
					session = request.getSession();
					session.setAttribute("isLogin", true);
					session.setAttribute("id", id);
				} else {
					request.setAttribute("msg", "loginFalse");
				}
				
				if(curPage.equals("/baseweb/join.jsp")) {
					curPage = "/member/";
				} else if(curPage.equals("/baseweb/boardList.jsp")) {
					curPage="/board/boardList.do";
				}
				nextPage=curPage;
				
			} else if(action.equals("/logoutMember.do")) {
				String curPage=(String)request.getParameter("curPage");
				
				session = request.getSession();
				session.removeAttribute("isLogin");
				session.removeAttribute("id");
				
				if(curPage.equals("/baseweb/mypage.jsp")) {
					curPage = "/member/";
				} else if(curPage.equals("/baseweb/boardList.jsp")) {
					curPage="/board/boardList.do";
				}			
				nextPage=curPage;

			} else if(action.equals("/mypage.do")) {
				session = request.getSession();
				String id = (String)session.getAttribute("id");
				MemberBean bean = memberDAO.getMemberInfo(id);
				request.setAttribute("member", bean);
				
				nextPage="/baseweb/mypage.jsp";
				
			} else if(action.equals("/modMember.do")) {
				String id=request.getParameter("id");
				String password=request.getParameter("password");
				int tel=Integer.parseInt(request.getParameter("tel"));
				String email=request.getParameter("email");
				String receiveEmail = request.getParameter("receiveEmail") != null ? "1" : "0";
				String receiveSMS = request.getParameter("receiveSMS") != null ? "1" : "0";
				System.out.println(receiveEmail+ receiveSMS);
				MemberBean memberBean=new MemberBean(id, password, tel, email, receiveEmail, receiveSMS);
				boolean result = memberDAO.updateMember(memberBean);
				
				if(result == true) {
					request.setAttribute("msg", "updateTrue");
				} else {
					request.setAttribute("msg", "updateFalse");
				}
				nextPage = "/member/mypage.do";
			} else if(action.equals("/delMember.do")) {
				session = request.getSession();
				String id=(String) session.getAttribute("id");
				memberDAO.deleteMember(id);
				session.removeAttribute("isLogin");
				session.removeAttribute("id");
				request.setAttribute("msg", "deleteTrue");
				nextPage = "/member/";
			}
			RequestDispatcher dispatcher=request.getRequestDispatcher(nextPage);
			dispatcher.forward(request, response);
			
		} catch (Exception e) {
			System.out.println("controller 요청 오류: " + e.getMessage());
		}
		
	}
}
