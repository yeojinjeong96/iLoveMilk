package com.milk.recipe.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.milk.member.model.vo.Member;
import com.milk.recipe.model.service.RecipeService;
import com.milk.recipe.model.vo.Report;

/**
 * Servlet implementation class RecipeReportController
 */
@WebServlet("/report.re")
public class RecipeReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipeReportController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int recipeNo = Integer.parseInt(request.getParameter("no"));
		int memberNo = ((Member)request.getSession().getAttribute("loginMember")).getMemberNo();
		
		String reportContent = request.getParameter("selectReport");
		String reportEtcContent = request.getParameter("etc");
		
		// System.out.println(reportContent);
		// System.out.println(reportEtcContent);
		
		Report r = new Report();
		r.setRefNo(recipeNo);
		r.setReportingMemberNo(String.valueOf(memberNo));
		
		if(reportContent.contains("기타")) {
			r.setReportContent(reportEtcContent);
		}else {
			r.setReportContent(reportContent);
		}
		
		int result = new RecipeService().insertReport(r);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "해당 게시글이 신고되었습니다.");
			response.sendRedirect(request.getContextPath() + "/detail.re?no=" + r.getRefNo());
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
