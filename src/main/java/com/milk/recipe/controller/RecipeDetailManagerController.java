package com.milk.recipe.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.milk.recipe.model.service.RecipeService;
import com.milk.recipe.model.vo.Recipe;
import com.milk.recipe.model.vo.RecipeIngre;
import com.milk.recipe.model.vo.RecipeOrder;

/**
 * Servlet implementation class RecipeDetailManagerController
 */
@WebServlet("/detailM.re")
public class RecipeDetailManagerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipeDetailManagerController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int recipeNo = Integer.parseInt(request.getParameter("no"));
		
		int result = new RecipeService().increaseCount(recipeNo);
		
		if(result > 0) {
			Recipe r = new RecipeService().selectRecipeR(recipeNo);
			ArrayList<RecipeIngre> listI = new RecipeService().selectRecipeIngreList(recipeNo);
			ArrayList<RecipeOrder> listO = new RecipeService().selectRecipeOrderList(recipeNo);
		
			
			request.setAttribute("r", r);
			request.setAttribute("listI", listI);
			request.setAttribute("listO", listO);
			
			request.getRequestDispatcher("views/recipe/managerRecipeDetailView.jsp").forward(request, response);
			
		
		}else {
			
			request.setAttribute("errorMsg", "레시피 상세조회에 실패했습니다.");
			request.getRequestDispatcher("views/recipe/managerRecipeUpdateDelete.jsp").forward(request, response);
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
