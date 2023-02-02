package com.milk.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.milk.member.model.service.MemberService;
import com.milk.member.model.vo.Point;

/**
 * Servlet implementation class ManagerMemPointChange
 */
@WebServlet("/memPointCh.ma")
public class ManagerMemPointChangeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerMemPointChangeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		request.setCharacterEncoding("UTF-8");
		int no = Integer.parseInt(request.getParameter("memPointNo"));
		String status = request.getParameter("poStatus");
		int val = Integer.parseInt(request.getParameter("memPointVal"));
		String content = request.getParameter("memPointCon");
		
		
		Point p = new Point();
		p.setAmount(val);
		p.setStatus(status);
		p.setContent(content);
		p.setMemberNo(no);
		

		
		int result = new MemberService().memberPointChange(p);
		
		if(result > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "성공적으로 회원 적립금 변경되었습니다.");
			response.sendRedirect(request.getContextPath() + "/memList.ma?cpage=1");
		}else {
			request.setAttribute("errorMsg", "적립금 변경 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp");
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
