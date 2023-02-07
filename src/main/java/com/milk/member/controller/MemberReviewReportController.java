package com.milk.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.milk.member.model.service.MemberService;
import com.milk.member.model.vo.Member;
import com.milk.member.model.vo.Report;

/**
 * Servlet implementation class MemberReviewReportController
 */
@WebServlet("/report.rev")
public class MemberReviewReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberReviewReportController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		
		int no = Integer.parseInt(request.getParameter("repNo"));
		int memberNo = ((Member)request.getSession().getAttribute("loginMember")).getMemberNo();
		int pno = Integer.parseInt(request.getParameter("pNo"));
		
		String reportContent = request.getParameter("report-content");
		String reportEtcContent = request.getParameter("etc-content");
		
		 System.out.println(reportContent);
		 System.out.println(reportEtcContent);
		
		Report r = new Report();
		r.setRefNo(no);
		r.setRepMemNo(memberNo);
		
		if(reportContent.contains("기타")) {
			r.setRepContent(reportEtcContent);
		}else {
			r.setRepContent(reportContent);
		}
		
		int result = new MemberService().insertReviewReport(r);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "해당 게시글이 신고되었습니다.");
			response.sendRedirect(request.getContextPath() + "/proDetail.pro?pno=" + pno);
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
