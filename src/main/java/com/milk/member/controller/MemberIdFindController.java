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
@WebServlet("/idFind.me")
public class MemberIdFindController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberIdFindController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memberName = request.getParameter("memberName");
		String email = request.getParameter("email");
		
		Member findId = new MemberService().findMemberId(memberName, email);
		
		
		
		
		if(findId==null) { //조회결과 없음 
			
			request.setAttribute("alertMsg", "아이디가 존재하지 않습니다");
			  
			response.sendRedirect(request.getContextPath()+"/idFindPage.me"); 
			
		}else { //조회결과 있음 
			
			request.setAttribute("alertMsg", findId.getMemberId());
			  
			response.sendRedirect(request.getContextPath()+"/idFindPage.me");      
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
