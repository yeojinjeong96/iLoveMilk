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
 * Servlet implementation class ProductSearchListController
 */
@WebServlet("/searchList.pr")
public class ProductSearchListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductSearchListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String op = request.getParameter("searchOp");
		String searchKey = request.getParameter("searchKey");
		
		//int listCount = new ProductService().selectAllListCount(op, searchKey);
		//int currentPage = Integer.parseInt(request.getParameter("cp"));
		//int pageLimit = 10;
		//int productLimit = 10;
		//int maxPage = (int)Math.ceil((double)listCount / productLimit);
		//int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		//int endPage = startPage + pageLimit - 1 > maxPage ? maxPage : startPage + pageLimit - 1;
		
		//PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, productLimit, maxPage, startPage, endPage);
		
		//ArrayList<Product> list = new ProductService().selectAllList(pi, op, searchKey);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
