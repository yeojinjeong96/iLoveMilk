package com.milk.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.milk.member.model.vo.Member;

/**
 * Servlet implementation class ProductCompletePaymentController
 */
@WebServlet("/completePay.pr")
public class ProductCompletePaymentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductCompletePaymentController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memNo = ((Member)request.getSession().getAttribute("loginMember")).getMemberNo();
		
		String[] proNo = request.getParameterValues("proNo");
		String[] count = request.getParameterValues("count");
		
		String orderName = request.getParameter("orderName");
		String orderPhone = request.getParameter("orderPhone");
		String orderEmail = request.getParameter("orderEmail");
		
		String addressName = request.getParameter("addressName");
		String address = request.getParameter("addressNumber")
			   + " / " + request.getParameter("address")
			   + request.getParameter("addressDetail") == null ? "" : " / " + request.getParameter("addressDetail")
			   + request.getParameter("addressPlus") == null ? "" : " / " + request.getParameter("addressPlus");
		String addressTel = request.getParameter("addressTel");
		
		String usePoint = request.getParameter("usePoint");
		System.out.println(request.getParameter("price"));
		
		int result1 = new ProductService().orderInsert();
		int result2 = new ProductService().orderDetailInsert();
		int result3 = new ProductService().paymentInsert();
		int result4 = new ProductService().pointInsert();
		request.getRequestDispatcher("views/product/productCompletePayment.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
