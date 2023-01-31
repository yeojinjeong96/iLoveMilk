package com.milk.recipe.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.milk.common.MyFileRenamePolicy;
import com.milk.member.model.vo.Member;
import com.milk.recipe.model.service.RecipeService;
import com.milk.recipe.model.vo.Recipe;
import com.milk.recipe.model.vo.RecipeIngre;
import com.milk.recipe.model.vo.RecipeOrder;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class RecipeUpdateController
 */
@WebServlet("/update.re")
public class RecipeUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipeUpdateController() {
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
			String mainImg = "resources/recipe_upfiles/" + multiRequest.getFilesystemName("file1");
			
			Recipe r = new Recipe();
			
			
		
			r.setRecipeNo(recipeNo);
			r.setRecipeTitle(title);
			r.setRecipeIntro(content);
			r.setMainImg(mainImg);
			
			
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
					
					System.out.println(listIngre);
					
				}
			
			}
		
			
			ArrayList<RecipeOrder> listOrder = new ArrayList<>();
			
			
			for(int lo=1 ; lo<=10 ; lo++) {
				String orderExp = multiRequest.getParameter("order" + lo);
				int recipeNoO = Integer.parseInt(multiRequest.getParameter("no"));
				int orderNo = Integer.parseInt(multiRequest.getParameter("orderNo"));
				
				if(orderExp != null) {
					RecipeOrder listO = new RecipeOrder();
					listO.setRecipeExplain(orderExp);
					listO.setRecipeNo(recipeNoO);
					listO.setRecipeOrderNo(orderNo);
					listO.setRecipeOrder(lo);
					
					String orderFile = "resources/recipe_upfiles/" + multiRequest.getFilesystemName("file" + (lo+1));
					listO.setRecipeImg(orderFile);
					
					listOrder.add(listO);
				}
				
			}
			
			int result = new RecipeService().updateRecipe(r, listIngre, listOrder);
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "레시피 수정에 성공했습니다.");
				response.sendRedirect(request.getContextPath() + "/list.re?cpage=1");
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
