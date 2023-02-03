package com.milk.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.milk.product.model.service.ProductService;

/**
 * Servlet implementation class ProductDeleteController
 */
@WebServlet("/delete.pr")
public class AjaxProductDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxProductDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String proNo = request.getParameter("proNo");
		proNo = proNo.substring(0, proNo.length()-1);
		
		String[] arrNo = proNo.split(",");
		
		int[] arrpNo = new int[arrNo.length];
		for(int i=0; i<arrNo.length; i++) {
			arrpNo[i] = Integer.parseInt(arrNo[i]);
		}
		
		int result = new ProductService().deleteProduct(arrpNo);
		
		response.setContentType("text/html; charset=utf-8");
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
