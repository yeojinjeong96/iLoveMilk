package com.milk.manager.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.milk.manager.model.vo.Manager;

/**
 * Servlet implementation class ManagerPassCheckController
 */
@WebServlet("/pwdCheck.ma")
public class ManagerPwdCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerPwdCheckController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String pwd = request.getParameter("pwd");
		String checkPwd = ((Manager)(request.getSession().getAttribute("loginManager"))).getManagerPwd();
		System.out.println(pwd + "\n" + checkPwd);
		response.setContentType("text/html; charset=utf-8");
		if(pwd.equals(checkPwd)) {
			response.getWriter().print("성공");
		} else {
			response.getWriter().print("실패");
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
