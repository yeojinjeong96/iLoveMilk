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
 * Servlet implementation class ProductCartController
 */
@WebServlet("/cart.pr")
public class ProductCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductCartController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("loginMember") != null) {
			int memNo = ((Member)request.getSession().getAttribute("loginMember")).getMemberNo();
			ArrayList<Product> list = new ProductService().productCartList(memNo);
			request.setAttribute("list", list);
			request.getRequestDispatcher("views/product/productCart.jsp").forward(request, response);
		} else {
			response.setContentType("text/html; charset=utf-8");
			response.getWriter().print("<script>alert('로그인 후 이용가능한 서비스입니다.');location.href='loginpage.me'</script>");
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
