package com.milk.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.milk.member.model.service.MemberService;
import com.milk.member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdate1Controller
 */
@WebServlet("/update1.me")
public class MemberUpdate1Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdate1Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memberId = request.getParameter("memberId");
		String memberPwd = request.getParameter("memberPwd");
		
		Member updateCheck = new MemberService().updateCheckPwd(memberId, memberPwd);
		
		
		HttpSession session = request.getSession();
		if(updateCheck==null) { //조회결과 없음 
			request.getSession().setAttribute("alertMsg", "비밀번호를 확인해주세요");
			response.sendRedirect(request.getContextPath() + "/myPageUpdate.me"); 
		
		}else { //조회결과 있음 
			
			
			session.setAttribute("updateCheck", updateCheck);
			response.sendRedirect(request.getContextPath() + "/myPageUpdate2.me" );
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
