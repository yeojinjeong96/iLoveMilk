package com.milk.recipe.model.service;

import static com.milk.common.JDBCTemplate.close;
import static com.milk.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.milk.common.model.vo.PageInfo;
import com.milk.recipe.model.dao.RecipeDao;
import com.milk.recipe.model.vo.Recipe;

public class RecipeService {


	/**
	 * list.re / listR.re
	 * @author 최주원
	 * @return 게시글 개수
	 */
	public int selectListCount() {
		Connection conn = getConnection();
		
		int listCount = new RecipeDao().selectListCount(conn);
		
		close(conn);
		return listCount;
	}
	

	/**
	 * list.re
	 * 요청한 페이지에 보여질 게시글 리스트 조회
	 * @author 최주원
	 * @param pi 페이징처리할 데이터들이 담겨있는 PageInfo객체
	 * @return select 후 list 반환
	 */
	public ArrayList<Recipe> selectRecipeList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Recipe> list = new RecipeDao().selectRecipeList(conn, pi);
		
		close(conn);
		return list;
		
	}
	
	
	/**
	 * listR.re
	 * 요청한 페이지에 보여질 게시글 리스트 조회
	 * @author 최주원
	 * @param pi 페이징처리할 데이터들이 담겨있는 PageInfo객체
	 * @return select 후 list 반환
	 */
	public ArrayList<Recipe> selectRecipeListR(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Recipe> list = new RecipeDao().selectRecipeListR(conn, pi);
		
		close(conn);
		return list;
		
	}
}
