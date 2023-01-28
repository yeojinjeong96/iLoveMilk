package com.milk.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.milk.product.model.service.ProductService;
import com.milk.product.model.vo.ProductLike;

/**
 * Servlet implementation class ProductLikeController
 */
@WebServlet("/likeProduct.pro")
public class ProductLikeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductLikeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int pno = Integer.parseInt(request.getParameter("pno"));
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		String likeNo = String.valueOf(pno) + String.valueOf(memberNo);		
		

		ProductLike pl = new ProductLike();
		pl.setProductNo(pno);
		pl.setMemberNo(memberNo);
		pl.setLikeNo(likeNo);
		
		int result1 = new ProductService().insertProductLike(pl);
		
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(result1);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
