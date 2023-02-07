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
 * Servlet implementation class ProductReSearchController
 */
@WebServlet("/reSearch.pro")
public class ProductReSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductReSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String keyword = request.getParameter("keyword");	
		String keyOption = request.getParameter("keyOption"); 
		
		
		int listCount = new ProductService().selectReSearchCount(keyword, keyOption);
		
		
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

		ArrayList<Product> list = new ProductService().selectReSearchList(pi, keyword, keyOption);
		
		request.setAttribute("list", list);
		request.setAttribute("keyword", keyword);
		request.setAttribute("pi", pi);
		request.setAttribute("listCount", listCount);
		request.setAttribute("keyOption", keyOption);
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
