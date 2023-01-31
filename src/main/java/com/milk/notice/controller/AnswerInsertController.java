package com.milk.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.milk.manager.model.vo.Manager;
import com.milk.notice.model.service.QAService;
import com.milk.notice.model.vo.QA;

/**
 * Servlet implementation class AnswerInsertController
 */
@WebServlet("/enroll.a")
public class AnswerInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnswerInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int qNo= Integer.parseInt(request.getParameter("qNo"));
		String title= request.getParameter("title");
		String content= request.getParameter("content");
		HttpSession session = request.getSession();
		int managerNo= ((Manager)session.getAttribute("loginManager")).getManagerNo();
		
		QA q = new QA();
		q.setqNo(qNo);
		q.setaWriter(managerNo);
		q.setaTitle(title);
		q.setaContent(content);
		
		int result = new QAService().enrollAnswer(q);
		if(result>0) {
			
			session.setAttribute("alertMsg", "답변 입력 성공");
			response.sendRedirect(request.getContextPath()+"/listM.a?cpage=1");
		}else {
			
			session.setAttribute("alertMsg", "답변 입력 실패");
			response.sendRedirect(request.getContextPath()+"/listM.a?cpage=1");
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
