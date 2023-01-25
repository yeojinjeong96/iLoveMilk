package com.milk.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.milk.notice.model.service.NoticeService;
import com.milk.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeListViewController
 */
@WebServlet("/list.no")
public class NoticeListViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeListViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int listCount;  
		int currentPage; 
		int pageLimit;   
		int boardLimit;  
	
		int maxPage;     
		int startPage;	 
		int endPage;	
		
		listCount = new NoticeService().selectNoticeListCount();
		currentPage= Integer.parseInt(request.getParameter("cpage"));
		
		
		ArrayList<Notice>list= new NoticeService().selectNoticeList();
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/notice/notice/noticeListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}