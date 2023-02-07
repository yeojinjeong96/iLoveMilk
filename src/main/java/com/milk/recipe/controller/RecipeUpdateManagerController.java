package com.milk.recipe.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.milk.common.MyFileRenamePolicy;
import com.milk.recipe.model.service.RecipeService;
import com.milk.recipe.model.vo.Recipe;
import com.milk.recipe.model.vo.RecipeIngre;
import com.milk.recipe.model.vo.RecipeOrder;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class RecipeUpdateManagerController
 */
@WebServlet("/updateM.re")
public class RecipeUpdateManagerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipeUpdateManagerController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10 * 1024 * 1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/recipe_upfiles/");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			int recipeNo = Integer.parseInt(multiRequest.getParameter("no"));
			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			
			String mainImg = multiRequest.getParameter("mainFile");
			String changeImg = "resources/recipe_upfiles/" + multiRequest.getFilesystemName("file1");
			
			//System.out.println(mainImg);
			//System.out.println(changeImg);
			
			Recipe r = new Recipe();
			r.setRecipeNo(recipeNo);
			r.setRecipeTitle(title);
			r.setRecipeIntro(content);
			
			if(multiRequest.getFilesystemName("file1") == null) {
				r.setMainImg(mainImg);
			}else {
				r.setMainImg(changeImg);
			}
			
			
			ArrayList<RecipeIngre> listIngre = new ArrayList<>();
			
			for(int i=1 ; i<=10 ; i++) {
				
				int recipeNoI = Integer.parseInt(multiRequest.getParameter("no"));
				int ingreNo = Integer.parseInt(multiRequest.getParameter("ingreNo"));
				String ingreName = multiRequest.getParameter("ingre-name" + i);
				String ingreAmount = multiRequest.getParameter("ingre-amount" + i);
				

				if(ingreName != null) {
					RecipeIngre listI = new RecipeIngre();
					listI.setRecipeNo(recipeNoI);
					listI.setIngreNo(ingreNo);
					listI.setIngreName(ingreName);
					listI.setIngreAmount(ingreAmount);
			
					listIngre.add(listI);
					
					
				}
			
			}
		
			
			ArrayList<RecipeOrder> listOrder = new ArrayList<>();
			
		
			for(int lo=2 ; lo<=11 ; lo++) {
				String orderExp = multiRequest.getParameter("order" + (lo-1));
				int recipeNoO = Integer.parseInt(multiRequest.getParameter("no"));
				int orderNo = Integer.parseInt(multiRequest.getParameter("orderNo"));
				
				String orderImg = multiRequest.getParameter("orderFile" + (lo-1));
				String changeOrderImg = "resources/recipe_upfiles/" + multiRequest.getFilesystemName("file" + lo);
				
			
				if(orderExp != null) {
					RecipeOrder listO = new RecipeOrder();
					listO.setRecipeExplain(orderExp);
					listO.setRecipeNo(recipeNoO);
					listO.setRecipeOrderNo(orderNo);
					listO.setRecipeOrder(lo-1);
					
					if(multiRequest.getFilesystemName("file" + lo) != null) {
						listO.setRecipeImg(changeOrderImg);
					}else {
						listO.setRecipeImg(orderImg);
					}
					
				
					listOrder.add(listO);
					
				}
				
			}
			
			int result = new RecipeService().updateRecipe(r, listIngre, listOrder);
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "레시피 수정에 성공했습니다.");
				response.sendRedirect(request.getContextPath() + "/detailM.re?no=" + r.getRecipeNo());
			}else {
				
			}
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
