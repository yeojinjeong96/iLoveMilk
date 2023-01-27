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
import com.milk.recipe.model.vo.RecipeIngre;
import com.milk.recipe.model.vo.RecipeOrder;

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
	
	/**
	 * list.re / listR.re
	 * 총 게시글 수 조회 요청
	 * @author 최주원
	 * @param conn
	 * @param pi
	 * @return db에서 조회 후 int에 담아주고 반환
	 */
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
	
	/**
	 * list.re
	 * 게시글 리스트 조회 요청
	 * @author 최주원
	 * @param conn
	 * @param pi
	 * @return db에서 조회 후 list에 담아주고 반환
	 */
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
	
	
	/**
	 * listR.re
	 * 게시글 리스트 조회 요청
	 * @author 최주원
	 * @param conn
	 * @param pi
	 * @return db에서 조회 후 list에 담아주고 반환
	 */
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
	
	
	public int insertRecipe(Connection conn, Recipe r) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertRecipe");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r.getRecipeWriter());
			pstmt.setString(2, r.getRecipeTitle());
			pstmt.setString(3, r.getRecipeIntro());
			pstmt.setString(4, r.getMainImg());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	public int insertRecipeIngreList(Connection conn, ArrayList<RecipeIngre> listIngre) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertRecipeIngreList");
		
		try {
			
			for(RecipeIngre listI : listIngre) {
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, listI.getIngreName());
				pstmt.setString(2, listI.getIngreAmount());
				
				result = pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	public int insertRecipeOrderList(Connection conn, ArrayList<RecipeOrder> listOrder) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertRecipeOrderList");
		
		try {
			
			for(RecipeOrder listO : listOrder) {
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, listO.getRecipeExplain());
				pstmt.setString(2, listO.getRecipeImg());
				
				
				result = pstmt.executeUpdate();
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
		
	}

}
