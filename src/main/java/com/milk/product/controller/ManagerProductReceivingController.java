package com.milk.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.milk.product.model.service.ProductService;

/**
 * Servlet implementation class ProductReceivingController
 */
@WebServlet("/receiving.pr")
public class ManagerProductReceivingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerProductReceivingController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int proNo = Integer.parseInt(request.getParameter("proNo"));
		int count = Integer.parseInt(request.getParameter("count"));
		
		int result = new ProductService().receivingProduct(proNo, count);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "상품 입고 성공");
		} else {
			request.getSession().setAttribute("alertMsg", "상품 입고 실패");
		}
		response.sendRedirect(request.getContextPath() + "/listUpDeRe.pr?cp=1");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
