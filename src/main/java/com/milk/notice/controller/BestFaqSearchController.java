package com.milk.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.milk.common.model.vo.PageInfo;
import com.milk.notice.model.service.FaqService;
import com.milk.notice.model.vo.Faq;

/**
 * Servlet implementation class BestFaqSearchController
 */
@WebServlet("/search.bfaq")
public class BestFaqSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BestFaqSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	request.setCharacterEncoding("UTF-8");
		
		int listCount;  
		int currentPage; 
		int pageLimit;   
		int boardLimit;  
	
		int maxPage;     
		int startPage;	 
		int endPage;	
		
		String searchBFaq=request.getParameter("searchBFaq");	
		
		listCount = new FaqService().selectBestSearchListCount(searchBFaq);
		currentPage= Integer.parseInt(request.getParameter("cpage"));
		pageLimit= 5;
		boardLimit=10;
		
		maxPage = (int)Math.ceil((double)(listCount) / boardLimit);
		startPage =  (currentPage-1)/pageLimit * pageLimit +1 ;
		endPage = startPage + pageLimit -1;
		if(endPage>maxPage) {
			endPage = maxPage;
		}
		PageInfo pi = new PageInfo(listCount,currentPage, pageLimit, boardLimit,maxPage,startPage,endPage);

		
		ArrayList<Faq>list= new FaqService().selectBestSearchList(pi,searchBFaq);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.setAttribute("searchBFaq", searchBFaq);
		request.getRequestDispatcher("views/notice/common/serviceCenterMain.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
