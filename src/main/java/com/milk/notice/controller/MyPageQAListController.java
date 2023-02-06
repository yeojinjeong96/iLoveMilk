package com.milk.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.milk.common.model.vo.PageInfo;
import com.milk.member.model.vo.Member;
import com.milk.notice.model.service.QAService;
import com.milk.notice.model.vo.QA;

/**
 * Servlet implementation class myPageQAListController
 */
@WebServlet("/mypage.qa")
public class MyPageQAListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageQAListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session= request.getSession();
		int memberNo= ((Member)session.getAttribute("loginMember")).getMemberNo();
		String fDate = request.getParameter("fDate");
		String sDate = request.getParameter("sDate");
		int listCount;  
		int currentPage; 
		int pageLimit;   
		int boardLimit;  
	
		int maxPage;     
		int startPage;	 
		int endPage;	
		
		listCount = new QAService().selectQAListCount(memberNo,fDate,sDate);
		currentPage= Integer.parseInt(request.getParameter("cpage"));
		pageLimit= 5;
		boardLimit=5;
		
		maxPage = (int)Math.ceil((double)(listCount) / boardLimit);
		startPage =  (currentPage-1)/pageLimit * pageLimit +1 ;
		endPage = startPage + pageLimit -1;
		if(endPage>maxPage) {
			endPage = maxPage;
		}
		PageInfo pi = new PageInfo(listCount,currentPage, pageLimit, boardLimit,maxPage,startPage,endPage);
		
		
		request.setAttribute("pi", pi);
		
		
		
		ArrayList<QA>list = new QAService().selectQuestionList(pi,memberNo,fDate,sDate);
		request.setAttribute("list",list);
	
		request.getRequestDispatcher("views/notice/qa/myPageQAListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
