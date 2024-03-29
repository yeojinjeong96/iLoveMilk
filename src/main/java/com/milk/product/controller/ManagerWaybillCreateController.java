package com.milk.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.milk.product.model.service.ProductService;

/**
 * Servlet implementation class ManagerWaybillCreateController
 */
@WebServlet("/orderWaybill.ma")
public class ManagerWaybillCreateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerWaybillCreateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String no = request.getParameter("OrderNo");
		String courier = request.getParameter("courier");
		String waybill = request.getParameter("waybill");
		
		
		int result = new ProductService().createWaybill(no, courier, waybill);
		
		HttpSession session = request.getSession();
		if(result > 0) {
			session.setAttribute("alertMsg","운송장 발급이 완료되었습니다.");
			response.sendRedirect(request.getContextPath() + "/orderList.ma?cpage=1");
		}else {
			request.setAttribute("errorMsg", "운송장발급 실패했습니다.");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);

		}
		response.getWriter();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
