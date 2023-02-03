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
import com.milk.manager.model.vo.Manager;
import com.milk.notice.model.service.QAService;
import com.milk.notice.model.vo.QA;

/**
 * Servlet implementation class QAListManagerViewController
 */
@WebServlet("/listM.qa")
public class QAListManagerViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QAListManagerViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session= request.getSession();
		int managerNo= ((Manager)session.getAttribute("loginManager")).getManagerNo();
		
		int listCount;  
		int currentPage; 
		int pageLimit;   
		int boardLimit;  
	
		int maxPage;     
		int startPage;	 
		int endPage;	
		
		listCount = new QAService().selectQAListCount(managerNo);
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
		
		
		String value="";
		if(request.getParameter("value")!=null) {
			 value= request.getParameter("value");
		}
		
		System.out.println(value);
		ArrayList<QA>list = new QAService().selectIncompletedList(pi,value);
		request.setAttribute("list",list);
		request.setAttribute("pi", pi);
		request.getRequestDispatcher("views/notice/qa/qaListManagerView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
