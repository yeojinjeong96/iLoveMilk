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
@WebServlet("/reinsert.re")
public class AjaxReplyInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxReplyInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize= 10 * 1024 * 1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/recipe_upfiles/");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			
			String replyContent = multiRequest.getParameter("content");
			int recipeNo = Integer.parseInt(multiRequest.getParameter("no"));
			int memberNo = ((Member)request.getSession().getAttribute("loginMember")).getMembeNo();
		
			Reply r = new Reply();
			r.setReplyContent(replyContent);
			r.setRefNo(recipeNo);
			r.setMemberNo(String.valueOf(memberNo));
			
			Attachment at = null;
			
			if(multiRequest.getOriginalFileName("img") != null) {
				at = new Attachment();
				at.setChangeName(multiRequest.getFilesystemName("img"));
				at.setFilePath("resources/recipe_upfiles/");
			}
			
			int result = new RecipeService().insertReply(r, at);
			
			response.getWriter().print(result);
		}
		*/
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
