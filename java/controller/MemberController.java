package controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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
		
		String nextPage=null;
		String action=request.getPathInfo();
		System.out.println("요청 경로: " + action);
		
		if(action == null || action.equals("/")) {
			nextPage = "/baseweb/index.jsp";
			
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
			nextPage="/baseweb/index.jsp";
			
		}
		
		RequestDispatcher dispatcher=request.getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
	}
}
