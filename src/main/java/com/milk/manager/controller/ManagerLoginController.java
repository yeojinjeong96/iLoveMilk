package com.milk.manager.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.milk.manager.model.service.ManagerService;
import com.milk.manager.model.vo.Manager;

/**
 * Servlet implementation class ManagerLoginController
 */
@WebServlet("/login.ma")
public class ManagerLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerLoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String managerId = request.getParameter("managerId");
		String managerPwd = request.getParameter("managerPwd");
		
		Manager loginManager = new ManagerService().managerLogin(managerId, managerPwd);
		
		if(loginManager == null) { // 실패시
			request.getSession().setAttribute("loginFail", "F");

			response.sendRedirect(request.getContextPath() + "/loginForm.ma");
		} else { // 성공시
			request.getSession().setAttribute("loginManager", loginManager);
			
			response.sendRedirect(request.getContextPath() + "/main.ma");
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
