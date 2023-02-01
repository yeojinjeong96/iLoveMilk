package com.milk.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.milk.member.model.service.MemberService;
import com.milk.member.model.vo.Member;
import com.milk.product.model.vo.ProductLike;

/**
 * Servlet implementation class productLikeListPageController
 */
@WebServlet("/plike.me")
public class productLikeListPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public productLikeListPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		
		HttpSession session = request.getSession();
		int memberNo = ((Member)session.getAttribute("loginMember")).getMemberNo();
		
		ArrayList<ProductLike> list = new MemberService().productLikeList(memberNo);
		request.setAttribute("list", list);
		
		
		request.getRequestDispatcher("views/member/productLikeList.jsp").forward(request, response);
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
