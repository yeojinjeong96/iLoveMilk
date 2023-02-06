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
import com.milk.product.model.vo.Stock;

/**
 * Servlet implementation class ProductStockController
 */
@WebServlet("/stock.pr")
public class ManagerProductStockController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerProductStockController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String op = request.getParameter("op");
		String key = request.getParameter("key");
		String start = null;
		if(request.getParameter("start") != null && request.getParameter("start").charAt(4) == '-') {
			start = request.getParameter("start").replace('-', '/');
		} else {
			start = request.getParameter("start");
		};
		String end = null;
		if(request.getParameter("end") != null && request.getParameter("end").charAt(4) == '-') {
			end = request.getParameter("end").replace('-', '/');
		} else {
			end = request.getParameter("end");
		};
		
		int listCount = new ProductService().selectStockListCount(op, key, start, end);
		int currentPage = Integer.parseInt(request.getParameter("cp"));
		int pageLimit = 10;
		int productLimit = 10;
		int maxPage = (int)Math.ceil((double)listCount / productLimit < 1 ? 1 : listCount / productLimit);
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1 > maxPage ? maxPage : startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, productLimit, maxPage, startPage, endPage);
		
		ArrayList<Stock> list = new ProductService().selectStockList(pi, op, key, start, end);
		if(request.getSession().getAttribute("loginManager") != null) {
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			request.setAttribute("op", op);
			request.setAttribute("key", key);
			request.setAttribute("start", start);
			request.setAttribute("end", end);
			request.getRequestDispatcher("views/product/managerProductStock.jsp").forward(request, response);
		} else {
			response.setContentType("text/html; charset=utf-8");
			response.getWriter().print("<script>alert('로그인 후 이용가능한 서비스입니다.');location.href='loginForm.ma'</script>");
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
