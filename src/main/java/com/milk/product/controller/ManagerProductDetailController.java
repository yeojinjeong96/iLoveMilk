package com.milk.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.milk.product.model.service.ProductService;
import com.milk.product.model.vo.Product;

/**
 * Servlet implementation class ProductmDetailController
 */
@WebServlet("/detail.pr")
public class ManagerProductDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerProductDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int proNo = Integer.parseInt(request.getParameter("no"));
		Product p = new ProductService().productDetail(proNo);
		
		if(request.getSession().getAttribute("loginManager") != null) {
			if(p != null) {
				request.setAttribute("p", p);
				request.getRequestDispatcher("views/product/managerProductDetail.jsp").forward(request, response);
			} else {
				request.getSession().setAttribute("alertMsg", "상품 상세조회 실패");
				response.sendRedirect(request.getContextPath() + "/listUpDeRe.pr?cp=1");
			}
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
