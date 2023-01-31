package com.milk.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.milk.common.MyFileRenamePolicy;
import com.milk.member.model.service.MemberService;
import com.milk.member.model.vo.Attachment;
import com.milk.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class MemberUpdate2Controller
 */
@WebServlet("/update2.me")
public class MemberUpdate2Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdate2Controller() {
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
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String addressNumber = request.getParameter("addressNumber");
		String address = request.getParameter("address");
		String addressDetail = request.getParameter("addressDetail");
		
		Member m = new Member(memberId, memberName, phone, email, addressNumber, address, addressDetail);
		
		Member updateMem = new MemberService().updateMember(m); 
		
		//System.out.println(m);
		HttpSession session = request.getSession();
		if(updateMem == null) { // 실패
			session.setAttribute("alertMsg", "다시한번 확인해주세요");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}else { // 성공
			
			
			session.setAttribute("alertMsg", "성공적으로 회원정보를 수정했습니다.");
			
			session.setAttribute("loginMember", updateMem);
			
			
			response.sendRedirect(request.getContextPath() + "/myPageUpdate2.me");
		
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
