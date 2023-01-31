package com.milk.common.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.milk.recipe.model.service.RecipeService;
import com.milk.recipe.model.vo.Recipe;

/**
 * Servlet implementation class mainRecentProductListController
 */
@WebServlet("/recentList.re")
public class mainRecentRecipeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mainRecentRecipeListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 메인화면 레시피 게시글 3개 뿌려줄 ArrayList
		ArrayList <Recipe> recentList = new RecipeService().selectRecentRecipeList();
		
		// System.out.println(recentList);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(recentList, response.getWriter());

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
