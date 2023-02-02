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
 * Servlet implementation class RecipeUpdateFormController
 */
@WebServlet("/updateFormM.re")
public class RecipeUpdateFormManagerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipeUpdateFormManagerController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int recipeNo = Integer.parseInt(request.getParameter("no"));
		
		RecipeService rService = new RecipeService();
		
		Recipe r = rService.selectRecipe(recipeNo);
		ArrayList<RecipeIngre> listI = rService.selectRecipeIngreList(recipeNo);
		ArrayList<RecipeOrder> listO = rService.selectRecipeOrderList(recipeNo);
		
		request.setAttribute("r", r);
		request.setAttribute("listI", listI);
		request.setAttribute("listO", listO);
		
		request.getRequestDispatcher("views/recipe/managerRecipeUpdateForm.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
