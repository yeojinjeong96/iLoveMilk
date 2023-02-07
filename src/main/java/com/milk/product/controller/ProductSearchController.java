package com.milk.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.milk.common.model.vo.PageInfo;
import com.milk.product.model.service.ProductService;
import com.milk.product.model.vo.Product;

/**
 * Servlet implementation class ProductSearchController
 */
@WebServlet("/search.pro")
public class ProductSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String keyword = request.getParameter("keyword");
		
		
		
		int listCount = new ProductService().selectSearchCount(keyword);
		int currentPage = Integer.parseInt(request.getParameter("cpage"));
		int pageLimit = 5;
		int boardLimit = 12;
		int maxPage = (int)Math.ceil((double)listCount/ boardLimit);
		int startPage = (currentPage -1)/ pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1 > maxPage ? maxPage : startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Product> list = new ProductService().selectSearchList(pi, keyword);
				
		
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		request.setAttribute("keyword", keyword);
		request.setAttribute("listCount", listCount);
		request.getRequestDispatcher("views/product/productSearchList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
