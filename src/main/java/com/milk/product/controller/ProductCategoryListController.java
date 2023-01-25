package com.milk.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.milk.common.model.vo.PageInfo;
import com.milk.product.model.service.ProductService;

/**
 * Servlet implementation class ProductCategoryListController
 */
@WebServlet("/proList.pro")
public class ProductCategoryListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductCategoryListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * 카테고리 클릭시 해당 제품 목록페이지 띄워
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * 
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String category = request.getParameter("category");	
		
		// 페이징처리
		int listCount; // 현재 게시글 총 갯수 : db로부터 조회해서담을 것이다. count 함수사용해서 담음
		int currentPage;  // 사용자가 요청한 페이지 : cpage (== 현재페이지)
		int pageLimit; // 페이지 하단에 보여질 페이징바의 페이지 최대갯수 (몇 개 단위씩)
		int boardLimit;  // 한 페이지 당 보여질 게시글 수 , 한 페이지 내에 보여질 게시글 최대 갯수(몇 개 단위씩)
		
		int maxPage; // 가장 마지막페이지(총 페이지 수)
		int startPage; // 사용자가 요청한 페이지 하단의 페이징바의 시작 수
		int endPage; // 사용자가 요청한 페이지 하단의 페이징바의 끝 수  
		
		listCount = new ProductService().selectListCount(category);
		
		currentPage = 1;
		
		pageLimit = 3;
		
		boardLimit = 12;
		
		maxPage = (int)Math.ceil((double)listCount/ boardLimit);
		
		startPage = (currentPage -1 )/ pageLimit * pageLimit * 1; 
		
		endPage = startPage + pageLimit -1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage,endPage);
		
		ArrayList <Product> list = new ProductService().selectProductList(pi, category);

		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
