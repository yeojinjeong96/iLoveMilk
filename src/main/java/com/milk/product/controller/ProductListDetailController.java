package com.milk.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.milk.product.model.service.ProductService;
import com.milk.product.model.vo.Product;
import com.milk.product.model.vo.Review;

/**
 * Servlet implementation class ProductListDetailController
 */
@WebServlet("/proDetail.pro")
public class ProductListDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductListDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int no = Integer.parseInt(request.getParameter("pno"));
		// 상품1개의 정보 조회
		Product p = new ProductService().productDetail(no);
		// 상품번호에 해당되는 리뷰 가져오기
		ArrayList<Review> list = new ProductService().selectProductReview(no); 

		request.setAttribute("p", p);
		request.setAttribute("list", list);
		
		for(Review r : list) {
			System.out.println(r);
		} 
		
		request.getRequestDispatcher("views/product/productDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
