package com.milk.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.milk.common.model.vo.PageInfo;
import com.milk.member.model.vo.Order;
import com.milk.product.model.service.ProductService;

/**
 * Servlet implementation class ManagerOrderStatement
 */
@WebServlet("/orderStatement.ma")
public class ManagerOrderStatement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerOrderStatement() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int option = Integer.parseInt(request.getParameter("option"));
		int currentPage = Integer.parseInt(request.getParameter("cpage"));
		
		int listCount = new ProductService().countOrderStatement(option);
		int pageLimit = 10;
		int boardLimit = 5;
		int maxPage = (int)Math.ceil((double)listCount/ boardLimit);
		int startPage = (currentPage -1)/pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit -1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		ArrayList<Order> list = new ProductService().selectOrderStatement(pi, option);
		
		
		HashMap <String, Object> map = new HashMap<>();
		map.put("opi", pi);
		map.put("olist", list);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(map,response.getWriter());
			
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
