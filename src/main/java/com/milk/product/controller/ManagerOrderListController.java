package com.milk.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.milk.common.model.vo.PageInfo;
import com.milk.member.model.vo.Order;
import com.milk.product.model.service.ProductService;

/**
 * Servlet implementation class ManagerOrderListController
 */
@WebServlet("/orderList.ma")
public class ManagerOrderListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerOrderListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int currentPage = Integer.parseInt(request.getParameter("cpage"));
		int listCount = new ProductService().countOrderList();
		int pageLimit = 10;
		int boardLimit = 5;
		int maxPage = (int)Math.ceil((double)listCount/ boardLimit);
		int startPage = (currentPage -1)/pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit -1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		ArrayList<Order> list = new ProductService().selectOrderList(pi);
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		request.getRequestDispatcher("views/product/managerDelivaryList.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
