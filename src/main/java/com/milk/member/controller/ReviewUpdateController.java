package com.milk.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.milk.member.model.service.MemberService;
import com.milk.member.model.vo.Review;

/**
 * Servlet implementation class ReviewUpdateController
 */
@WebServlet("/ReviewUpdate.me")
public class ReviewUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		String reviewContent = request.getParameter("reviewContent");
		int star = Integer.parseInt(request.getParameter("star"));
		
		
		Review r = new Review(reviewNo, reviewContent, star);
		
		int result = new MemberService().ReviewUpdate(r);
		
		HttpSession session = request.getSession();
		if(result > 0) { // 실패
			session.setAttribute("alertMsg", "수정에 실패했습니다");
		}else { // 성공
			
			
			session.setAttribute("alertMsg", "성공적으로 리뷰를 수정했습니다.");
			response.sendRedirect(request.getContextPath() + "/reviewList.me");
		
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
