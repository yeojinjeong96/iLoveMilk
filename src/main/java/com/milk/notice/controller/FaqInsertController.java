package com.milk.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.milk.manager.model.vo.Manager;
import com.milk.notice.model.service.FaqService;
import com.milk.notice.model.vo.Faq;

/**
 * Servlet implementation class FaqInsertController
 */
@WebServlet("/insert.faq")
public class FaqInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String question = request.getParameter("question");
		String answer = request.getParameter("answer");
		String bestFaq= request.getParameter("best-faq");
		String category= request.getParameter("category");
		HttpSession session = request.getSession();
		int managerNo= ((Manager)session.getAttribute("loginManager")).getManagerNo();
		
		Faq f = new Faq();
		f.setQuestion(question);
		f.setAnswer(answer);
		f.setBestFaq(bestFaq);
		f.setFaqWriter(managerNo);
		f.setCategoryName(category);
		
		int result=  new FaqService().insertFaq(f);
		if(result>0) {
			session.setAttribute("alertMsg", "FAQ 등록 성공");
			response.sendRedirect(request.getContextPath()+"/listM.faq?cpage=1");
			
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
