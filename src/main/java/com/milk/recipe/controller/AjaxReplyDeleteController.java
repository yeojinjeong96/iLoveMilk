package com.milk.recipe.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.milk.common.MyFileRenamePolicy;
import com.milk.member.model.vo.Member;
import com.milk.recipe.model.service.RecipeService;
import com.milk.recipe.model.vo.Attachment;
import com.milk.recipe.model.vo.Reply;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class AjaxReplyInsertController
 */
@WebServlet("/reDelete.re")
public class AjaxReplyDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxReplyDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int replyNo = Integer.parseInt(request.getParameter("no"));
		
		Reply r = new Reply();
		r.setReplyNo(replyNo);

		int result = new RecipeService().deleteReply(r);
		
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
