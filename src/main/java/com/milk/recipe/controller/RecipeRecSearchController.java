package com.milk.recipe.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.milk.common.model.vo.PageInfo;
import com.milk.recipe.model.service.RecipeService;
import com.milk.recipe.model.vo.Recipe;

/**
 * Servlet implementation class RecipeSearchController
 */
@WebServlet("/searchR.re")
public class RecipeRecSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipeRecSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String select = request.getParameter("search-select");
		String keyword = request.getParameter("keyword");
		
		//System.out.println(select);
		//System.out.println(keyword);
		
		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit;
		int maxPage;
		int startPage;
		int endPage;
		
		// 총 게시글 개수
		listCount = new RecipeService().selectSearchRecListCount(keyword, select);
		
		// 사용자가 요청한 페이지 (현재 페이지)
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		
		pageLimit = 5;
		
		boardLimit = 9;
		
		maxPage = (int)Math.ceil( (double)listCount / boardLimit );
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		

		ArrayList<Recipe> list = new RecipeService().selectSearchRecipeRecList(pi, keyword, select);
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		request.setAttribute("keyword", keyword);
		request.setAttribute("listCount", listCount);
		request.setAttribute("select", select);
		
		
		
		request.getRequestDispatcher("views/recipe/recommendRecipeSearchListView.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
