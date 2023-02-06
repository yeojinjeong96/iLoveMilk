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
 * Servlet implementation class ReviewInsertController
 */
@WebServlet("/RInsert.me")
public class ReviewInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		int productNo = Integer.parseInt(request.getParameter("productNo"));
		String reviewContent = request.getParameter("reviewContent");
		int star = Integer.parseInt(request.getParameter("star"));
		
		
		Review r = new Review(memberNo, productNo,reviewContent,star );
				
		int result = new MemberService().insertReview(r);
		
		HttpSession session = request.getSession();
		
		
		if(result > 0) {
			
			
			session.setAttribute("alertMsg", "성공적으로 리뷰가 등록되었습니다.");
			
			
			response.sendRedirect(request.getContextPath()+ "/review.me");
			
		}else {
			
			session.setAttribute("alertMsg", "리뷰 등록에 실패했습니다.");
			response.sendRedirect(request.getContextPath()+ "/review.me");
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
