package com.milk.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.milk.notice.model.service.QAService;
import com.milk.notice.model.vo.Attachment;
import com.milk.notice.model.vo.QA;

/**
 * Servlet implementation class AnswerDetailManagerViewController
 */
@WebServlet("/detailM.a")
public class AnswerDetailManagerViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnswerDetailManagerViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qNo= Integer.parseInt(request.getParameter("no"));
		
		QA q= new QAService().selectQA(qNo);
		Attachment at= new QAService().selectAttachment(qNo);
		
		request.setAttribute("q", q);
		request.setAttribute("at", at);
		request.getRequestDispatcher("views/notice/qa/answerDetailManagerView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
