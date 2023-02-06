package com.milk.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.milk.member.model.vo.Member;
import com.milk.product.model.service.ProductService;
import com.milk.product.model.vo.Product;

/**
 * Servlet implementation class ProductCartInController
 */
@WebServlet("/cartIn.pr")
public class AjaxProductCartInController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxProductCartInController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memNo = ((Member)request.getSession().getAttribute("loginMember")).getMemberNo();
		ArrayList<Product> cartProList = new ProductService().productCartList(memNo);
		
		int duf = 0;
		int proNo = Integer.parseInt(request.getParameter("proNo"));
		for(Product p : cartProList) {
			if(p.getProductNo() == proNo) {
				duf++;
			}
		}
		
		int result = 0;
		if (duf == 0) {
			int amount = Integer.parseInt(request.getParameter("amount"));
			result = new ProductService().productCartInsert(proNo, memNo, amount);
		}
		
		response.getWriter().print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
