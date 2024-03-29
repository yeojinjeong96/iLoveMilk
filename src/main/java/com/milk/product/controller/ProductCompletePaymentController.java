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
import com.milk.product.model.vo.OrderInfo;
import com.milk.product.model.vo.PointIn;
import com.milk.product.model.vo.Product;

/**
 * Servlet implementation class ProductCompletePaymentController
 */
@WebServlet("/completePay.pr")
public class ProductCompletePaymentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductCompletePaymentController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int memNo = ((Member)request.getSession().getAttribute("loginMember")).getMemberNo();
		String orderName = request.getParameter("orderName");
		String orderPhone = request.getParameter("orderPhone");
		String orderEmail = request.getParameter("orderEmail");
		String addressName = request.getParameter("addressName");
		String address = request.getParameter("addressNumber")
			   + "," + request.getParameter("address")
			   + (request.getParameter("addressPlus") == "" ? "" : "," + request.getParameter("addressPlus"))
			   + (request.getParameter("addressDetail") == "" ? "" : "," + request.getParameter("addressDetail"));
		String addressTel = request.getParameter("addressTel");
		int usePoint = Integer.parseInt(request.getParameter("usePoint") == "" ? "0" : request.getParameter("usePoint"));
		OrderInfo o = new OrderInfo(memNo, orderName, orderPhone, orderEmail, addressName, address, addressTel, usePoint);
		// 주문 테이블 insert
		int result1 = new ProductService().orderInsert(o);
		
		String orderNo = "";
		if(result1 > 0) {
			// 주문번호 가져오기
			orderNo = new ProductService().selectOrderNo(memNo);
		}
		String[] proNo = request.getParameterValues("proNo");
		String[] count = request.getParameterValues("count");
		ArrayList<Product> list = new ArrayList<Product>();
		Product p = null;
		for(int i=0; i<proNo.length; i++) {
			p = new Product();
			p.setProductName(orderNo); // 주문번호
			p.setProductNo(Integer.parseInt(proNo[i]));
			p.setStock(Integer.parseInt(count[i])); // 갯수
			list.add(p);
		}
		// 주문 상세 테이블 insert
		int result2 = new ProductService().orderDetailInsert(list);
				
		int price = Integer.parseInt(request.getParameter("price"));
		// 결제 테이블 insert
		int result3 = new ProductService().paymentInsert(orderNo, price-usePoint);
		
		// 회원등급 가져오기
		String memGrade = new ProductService().selectMemberGrade(memNo);
		
		PointIn minusPoint = new PointIn(-usePoint, "사용", "사용("+orderNo+")", orderNo, memNo);
		// 사용한 적립금 insert
		int result5 = new ProductService().pointInsert(minusPoint);
		
		int point = 0;
		if(memGrade.equals("GREEN")) {
			point = (int)Math.ceil((price-usePoint) * 0.02);
		} else if(memGrade.equals("SILVER")) {
			point = (int)Math.ceil((price-usePoint) * 0.04);
		} else if(memGrade.equals("GOLD")) {
			point = (int)Math.ceil((price-usePoint) * 0.06);
		} else if(memGrade.equals("VIP")) {
			point = (int)Math.ceil((price-usePoint) * 0.08);
		}
		PointIn plusPoint = new PointIn(point, "적립", "상품 구매로 인한 적립", orderNo, memNo);
		// 회원등급별 적립금 insert
		int result4 = new ProductService().pointInsert(plusPoint);

		// 구매상품 장바구니에서 삭제
		int result6 = new ProductService().productCartDelete(memNo, proNo);
		
		if(result1 * result2 * result3 * result4 * result5 * result6 > 0) {
			request.setAttribute("orderNo", orderNo);
			request.getRequestDispatcher("views/product/productCompletePayment.jsp").forward(request, response);
		} else {
			request.getSession().setAttribute("alertMsg", "결제 값 등록 실패");
			response.sendRedirect(request.getContextPath() + "/orderForm.pr");
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
