package com.milk.manager.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.milk.manager.model.service.ManagerService;
import com.milk.notice.model.service.QAService;
import com.milk.notice.model.vo.QA;
import com.milk.product.model.vo.Payment;
import com.milk.product.model.vo.Product;

/**
 * Servlet implementation class ManagerMainPageController
 */
@WebServlet("/main.ma")
public class ManagerMainPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerMainPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("loginManager") != null) {
			ArrayList<Product> stockList = new ManagerService().needReceivingProduct();
			ArrayList<Payment> recentPayList = new ManagerService().recentPayment();
			ArrayList<QA>list = new QAService().selectManagerQList();
			

		
			request.setAttribute("stockList", stockList);
			request.setAttribute("recentPayList", recentPayList);
			
			request.setAttribute("qList",list);
			request.getRequestDispatcher("views/manager/managerMainPage.jsp").forward(request, response);
		
		} else {
			response.setContentType("text/html; charset=utf-8");
			response.getWriter().print("<script>alert('로그인 후 이용가능한 서비스입니다.');location.href='loginForm.ma'</script>");
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
