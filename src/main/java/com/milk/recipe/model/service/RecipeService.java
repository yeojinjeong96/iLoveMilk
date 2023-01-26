package com.milk.recipe.model.service;

import static com.milk.common.JDBCTemplate.close;
import static com.milk.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.milk.common.model.vo.PageInfo;
import com.milk.recipe.model.dao.RecipeDao;
import com.milk.recipe.model.vo.Recipe;

public class RecipeService {

	// list.re
	// 게시글 개수
	public int selectListCount() {
		Connection conn = getConnection();
		
		int listCount = new RecipeDao().selectListCount(conn);
		
		close(conn);
		return listCount;
	}
	
	// list.re
	// 요청한 페이지에 보여질 게시글 리스트 조회
	public ArrayList<Recipe> selectRecipeList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Recipe> list = new RecipeDao().selectRecipeList(conn, pi);
		
		close(conn);
		return list;
		
	}
}
