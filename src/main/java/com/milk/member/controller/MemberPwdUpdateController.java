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
 * Servlet implementation class MemberPwdUpdateController
 */
@WebServlet("/updatePwd.me")
public class MemberPwdUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberPwdUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			String memberId = request.getParameter("memberId");
			String memberPwd = request.getParameter("memberPwd");
			String updatePwd = request.getParameter("updatePwd");
			
			Member updateMem = new MemberService().updatePwdMember(memberId, memberPwd, updatePwd);
			
			HttpSession session = request.getSession();
			if(updateMem == null) { // 실패 (현재비밀번호를 잘못입력했을경우)
									// => 마이페이지
				session.setAttribute("alertMsg", "현재 비밀번호를 다시 확인해주세요.");
				
			}else { // 성공 => 마이페이지
				session.setAttribute("alertMsg", "성공적으로 비밀번호를 수정했습니다.");
				session.setAttribute("loginMember", updateMem);
			}
			
			response.sendRedirect(request.getContextPath() + "/myPageUpdate2.me");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
