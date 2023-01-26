package com.milk.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.milk.notice.model.service.NoticeService;
import com.milk.notice.model.vo.Attachment;
import com.milk.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeDetailViewController
 */
@WebServlet("/detail.no")
public class NoticeDetailViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDetailViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int noticeNo= Integer.parseInt(request.getParameter("no"));
		
		int result= new NoticeService().increaseCount(noticeNo);
		if(result>0) {
			Notice n= new NoticeService().selectNotice(noticeNo);
			Attachment at= new NoticeService().selectAttachment(noticeNo);
			
			request.setAttribute("n", n);
			request.setAttribute("at",at);
			request.getRequestDispatcher("views/notice/notice/noticeDetailView.jsp").forward(request, response);
			
		}else {
			
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
