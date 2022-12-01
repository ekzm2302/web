package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import member.command.MemberLogin;
import member.command.MemberLogout;
import member.command.NaverCallback;
import member.command.NaverLogin;

@WebServlet("*.mb")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().removeAttribute("category");
		request.setAttribute("naver_id", "k5aQKjQS0u5RGlckCcvM");
		request.setAttribute("naver_secret", "MSJoB9tu0Y");
		
		String uri = request.getServletPath();
		String view = "";
		boolean redirect = false;
		Command cmd = null;
		if( uri.equals("/login.mb") ) {
			//로그인화면 요청
			view = "member/login.jsp";
			
		}else if( uri.equals("/smartLogin.mb") ) {
			//로그인처리 요청
			cmd = new MemberLogin();
			cmd.exec(request, response);
			
			return; //화면으로 응답하지 않고 데이터로 응답하도록 한다
			
		}else if( uri.equals("/logout.mb")) {
			//로그아웃처리 요청
			cmd = new MemberLogout();
			cmd.exec(request, response);
			
			//Object -> String
			view = (String)request.getAttribute("url");
			redirect = true;
			
		} else if ( uri.equals("/naverlogin.mb")) {
			// 네이버 로그인 처리 요청
			cmd = new NaverLogin();
			cmd.exec(request, response);
			
			view =(String) request.getAttribute("url").toString();
			redirect = true;			
			
		} else if ( uri.equals("/navercallback.mb")) {
			// 네이버콜백처리 요청
			cmd = new NaverCallback();
			cmd.exec(request, response);
			
			
		}
		
	
		if( redirect ) response.sendRedirect(view);
		else request.getRequestDispatcher(view).forward(request, response);
	
	}

}
