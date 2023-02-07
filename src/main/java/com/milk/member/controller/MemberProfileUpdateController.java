package com.milk.member.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.milk.member.model.vo.Attachment;
import com.milk.member.model.vo.Member;
import com.milk.member.model.service.MemberService;
import com.milk.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class MemberProfileUpdateController
 */
@WebServlet("/profile.me")
public class MemberProfileUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberProfileUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10*1024*1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/profile_upfiles/");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			
			String memberId = multiRequest.getParameter("memberId");
			String memberPwd = multiRequest.getParameter("memberPwd");
			String memberName = multiRequest.getParameter("memberName");
			String phone = multiRequest.getParameter("phone");
			String email = multiRequest.getParameter("email");
			String addressNumber = multiRequest.getParameter("addressNumber");
			String address = multiRequest.getParameter("address");
			String addressDetail = multiRequest.getParameter("addressDetail");
			String profile = "resources/profile_upfiles/" + multiRequest.getFilesystemName("profile");
			
			HttpSession session = request.getSession();
			int MemberNo = ((Member)session.getAttribute("loginMember")).getMemberNo();
			
			Member m = new Member(MemberNo, memberId, memberPwd, memberName, phone, email, addressNumber, address, addressDetail, profile);
			
			
			int result = new MemberService().UpdateProfile(m);
			
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "프로필 등록 성공");
				session.setAttribute("loginMember", m);
				response.sendRedirect(request.getContextPath() + "/myPageUpdate2.me");
			} else {
				new File(savePath + multiRequest.getFilesystemName("productImg")).delete();
				request.getSession().setAttribute("alertMsg", "프로필 등록 실패");
				response.sendRedirect(request.getContextPath());
			}
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
