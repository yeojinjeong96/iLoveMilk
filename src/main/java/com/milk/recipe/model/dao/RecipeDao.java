package com.milk.recipe.model.dao;

import static com.milk.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.milk.common.model.vo.PageInfo;
import com.milk.recipe.model.vo.Recipe;

public class RecipeDao {
	
	private Properties prop = new Properties();

	public RecipeDao() {
		try {
			prop.loadFromXML(new FileInputStream(RecipeDao.class.getResource("/db/sql/recipe-mapper.xml").getPath()));
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	// list.re
	// 총 게시글 개수
	public int selectListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
		
	}
	
	// list.re
	// 요청한 페이지에 보여질 게시글 리스트 조회
	public ArrayList<Recipe> selectRecipeList(Connection conn, PageInfo pi){
		ArrayList<Recipe> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectRecipeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Recipe r = new Recipe();
				r.setRecipeNo(rset.getInt("RECIPE_NO"));
				r.setRecipeTitle(rset.getString("RECIPE_TITLE"));
				r.setRecipeWriter(rset.getString("MEMBER_ID"));
				r.setEnrollDate(rset.getString("ENROLL_DATE"));
				r.setCount(rset.getInt("COUNT"));
				r.setMainImg(rset.getString("MAIN_IMG"));
				
				list.add(r);
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	// listR.re
	// 요청한 페이지에 보여질 게시글 리스트 조회
	public ArrayList<Recipe> selectRecipeListR(Connection conn, PageInfo pi){
		ArrayList<Recipe> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectRecipeListR");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Recipe r = new Recipe();
				r.setRecipeNo(rset.getInt("RECIPE_NO"));
				r.setRecipeTitle(rset.getString("RECIPE_TITLE"));
				r.setRecipeWriter(rset.getString("MANAGER_ID"));
				r.setEnrollDate(rset.getString("ENROLL_DATE"));
				r.setCount(rset.getInt("COUNT"));
				r.setMainImg(rset.getString("MAIN_IMG"));
				
				list.add(r);
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
}
