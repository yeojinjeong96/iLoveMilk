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
 * Servlet implementation class RecipeInsertController
 */
@WebServlet("/insert.re")
public class RecipeInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipeInsertController() {
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
			
			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			String mainImg = "resources/recipe_upfiles/" + multiRequest.getFilesystemName("file1");
			
			HttpSession session = request.getSession();
			int memberNo = ((Member)session.getAttribute("loginMember")).getMemberNo();
			
			Recipe r = new Recipe();
			r.setRecipeTitle(title);
			r.setRecipeIntro(content);
			r.setMainImg(mainImg);
			r.setRecipeWriter(String.valueOf(memberNo));
			
			
			ArrayList<RecipeIngre> listIngre = new ArrayList<>();
			for(int li=1; li<=10 ; li++) {
				String ingreName = multiRequest.getParameter("ingre-name" + li);
				String ingreAmount = multiRequest.getParameter("ingre-amount" + li);
				
				if(ingreName != null) {
					RecipeIngre listI = new RecipeIngre();
					listI.setIngreName(ingreName);
					listI.setIngreAmount(ingreAmount);
			
					listIngre.add(listI);
				}
			
			}
			
			// System.out.println(listIngre);
			
			ArrayList<RecipeOrder> listOrder = new ArrayList<>();
			
			for(int lo=2 ; lo<=11 ; lo++) {
				String orderExp = multiRequest.getParameter("order" + (lo-1));
				
				
				if(orderExp != null) {
					RecipeOrder listO = new RecipeOrder();
					listO.setRecipeExplain(orderExp);
					listO.setRecipeOrder(lo-1);
					
					String orderFile = "resources/recipe_upfiles/" + multiRequest.getFilesystemName("file" + lo);
					listO.setRecipeImg(orderFile);
					
					listOrder.add(listO);
				}
				
			}
			
			//System.out.println(listOrder);
			
			int result = new RecipeService().insertRecipe(r, listIngre, listOrder);
			
			if(result > 0) {
				session.setAttribute("alertMsg", "레시피 등록이 완료되었습니다.");
				response.sendRedirect(request.getContextPath() + "/list.re?cpage=1");
			}else {
				session.setAttribute("errorMsg", "레시피 등록에 실패했습니다.");
				response.sendRedirect(request.getContextPath() + "/enrollForm.re");
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
