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
 * Servlet implementation class ProductListController
 */
@WebServlet("/listUpDeRe.pr")
public class ProductListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int listCount = new ProductService().selectAllListCount();
		int currentPage = Integer.parseInt(request.getParameter("cup"));
		int pageLimit = 10;
		int productLimit = 10;
		int maxPage = (int)Math.ceil((double)listCount / productLimit);
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1 > maxPage ? maxPage : startPage + pageLimit - 1;
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, productLimit, maxPage, startPage, endPage);
		
		ArrayList<Product> list = new ProductService().selectAllList(pi);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/product/managerProductListUpdateDeleteReceiving.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
