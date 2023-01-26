package com.milk.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.milk.common.model.vo.PageInfo;
import com.milk.notice.model.service.NoticeService;
import com.milk.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeSearchController
 */
@WebServlet("/search.no")
public class NoticeSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeSearchController() {
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
			
			listCount = new NoticeService().selectNoticeListCount();
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

			String searchNo=request.getParameter("searchNo");	
			
			ArrayList<Notice>list= new NoticeService().selectSearchList(pi,searchNo);
			
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
			request.getRequestDispatcher("views/notice/notice/noticeListManagerView.jsp").forward(request, response);
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
