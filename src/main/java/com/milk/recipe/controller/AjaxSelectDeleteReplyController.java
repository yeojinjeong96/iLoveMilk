package com.milk.recipe.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.milk.notice.model.service.NoticeService;
import com.milk.recipe.model.service.RecipeService;

/**
 * Servlet implementation class RecipeDeleteController
 */
@WebServlet("/selectDeleteReply.re")
public class AjaxSelectDeleteReplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxSelectDeleteReplyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String[] replyArray = request.getParameterValues("replyArray");
		
		String deleteRe = "";
		deleteRe = String.join(",", replyArray);
		
		int result = new RecipeService().selectDelReplyM(deleteRe);
		
		response.getWriter().print(result);
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
