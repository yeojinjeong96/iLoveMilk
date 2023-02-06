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
 * Servlet implementation class MemberIdFindController
 */
@WebServlet("/PwdFind.me")
public class MemberPwdFindController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberPwdFindController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("UTF-8");
		
		String memberId = request.getParameter("memberId");
		String memberName = request.getParameter("memberName");
		String email = request.getParameter("email");
		
		Member findPwd = new MemberService().findMemberPwd(memberId, memberName, email);
		
		System.out.println(findPwd);
		
		
		if(findPwd==null) { //조회결과 없음 
			request.getSession().setAttribute("alertMsg", "입력하신 정보를 다시 확인해주세요");
			response.sendRedirect(request.getContextPath() + "/pwdFindPage.me"); 
		
		}else { //조회결과 있음 
			
			HttpSession session = request.getSession();
			session.setAttribute("findPwd", findPwd);
			
			response.sendRedirect(request.getContextPath() + "/PwdFindSuccess.me"); 
			
		
			
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
