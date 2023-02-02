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
import com.milk.recipe.model.vo.Reply;
import com.milk.recipe.model.vo.Report;

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
				pstmt.setInt(1, listO.getRecipeOrder());
				pstmt.setString(2, listO.getRecipeExplain());
				pstmt.setString(3, listO.getRecipeImg());
			
				result = pstmt.executeUpdate();
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
		
	}
	
	
	public int increaseCount(Connection conn, int recipeNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, recipeNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	public Recipe selectRecipe(Connection conn, int recipeNo) {
		Recipe r = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectRecipe");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, recipeNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				r = new Recipe(rset.getInt("RECIPE_NO"),
							   rset.getString("MEMBER_ID"),
							   rset.getString("RECIPE_TITLE"),
							   rset.getString("RECIPE_INTRO"),
							   rset.getInt("COUNT"),
							   rset.getString("ENROLL_DATE"),
							   rset.getString("MAIN_IMG")
							   );
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return r;
	}
	
	
	public Recipe selectRecipeR(Connection conn, int recipeNo) {
		Recipe r = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectRecipeR");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, recipeNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				r = new Recipe(rset.getInt("RECIPE_NO"),
							   rset.getString("MANAGER_ID"),
							   rset.getString("RECIPE_TITLE"),
							   rset.getString("RECIPE_INTRO"),
							   rset.getInt("COUNT"),
							   rset.getString("ENROLL_DATE"),
							   rset.getString("MAIN_IMG")
							   );
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return r;
	}
	
	
	public ArrayList<RecipeIngre> selectRecipeIngreList(Connection conn, int recipeNo){
		ArrayList<RecipeIngre> listI = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectRecipeIngreList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, recipeNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				RecipeIngre ri = new RecipeIngre();
				
				ri.setIngreNo(rset.getInt("INGRE_NO"));
				ri.setIngreName(rset.getString("INGRE_NAME"));
				ri.setIngreAmount(rset.getString("INGRE_AMOUNT"));
				
				listI.add(ri);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listI;
		
	}
	
	public ArrayList<RecipeOrder> selectRecipeOrderList(Connection conn, int recipeNo){
		ArrayList<RecipeOrder> listO = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectRecipeOrderList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, recipeNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				RecipeOrder ro = new RecipeOrder();
				
				ro.setRecipeOrderNo(rset.getInt("RECIPE_ORDER_NO"));
				ro.setRecipeOrder(rset.getInt("RECIPE_ORDER"));
				ro.setRecipeExplain(rset.getString("RECIPE_EXPLN"));
				ro.setRecipeImg(rset.getString("RECIPE_IMG"));
				
				listO.add(ro);
			}
			
		} catch (SQLException e1) {
			e1.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listO;
		
	}
	
	
	public ArrayList<Reply> selectReplyList(Connection conn, int recipeNo){
		
		ArrayList<Reply> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReplyList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, recipeNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Reply(rset.getInt("REPLY_NO"),
								   rset.getString("MEMBER_ID"),
								   rset.getString("REPLY_CONTENT"),
								   rset.getString("ENROLL_DATE"),
								   rset.getString("PROFILE")
								   ));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	/*	
	public Attachment selectReplyAt(Connection conn, int recipeNo) {
		Attachment at = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReplyAt");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, recipeNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				at = new Attachment(rset.getInt("FILE_NO"),
							   		rset.getString("CHANGE_NAME"),
							   		rset.getString("FILE_PATH"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return at;
	}
	*/
	
	public int insertReply(Connection conn, Reply r) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r.getMemberNo());
			pstmt.setInt(2, r.getRefNo());
			pstmt.setString(3, r.getReplyContent());
			
			result = pstmt.executeUpdate();
					
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	

	/*
	public int insertReplyAttachment(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql= prop.getProperty("insertReplyAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getChangeName());
			pstmt.setString(2, at.getFilePath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	*/
	
	
	public int updateRecipe(Connection conn, Recipe r) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateRecipe");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r.getRecipeTitle());
			pstmt.setString(2, r.getRecipeIntro());
			pstmt.setString(3, r.getMainImg());
			pstmt.setInt(4, r.getRecipeNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	public int updateRecipeIngreList(Connection conn, ArrayList<RecipeIngre> listIngre) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateRecipeIngreList");
		
		try {
			
			for(RecipeIngre listI : listIngre) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, listI.getRecipeNo());
				pstmt.setString(2, listI.getIngreName());
				pstmt.setString(3, listI.getIngreAmount());
				
				result = pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	public int updateRecipeOrderList(Connection conn, ArrayList<RecipeOrder> listOrder) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateRecipeOrderList");
		
		try {
			
	
			for(RecipeOrder listO : listOrder) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, listO.getRecipeNo());
				pstmt.setInt(2, listO.getRecipeOrder());
				pstmt.setString(3, listO.getRecipeExplain());
				pstmt.setString(4, listO.getRecipeImg());
			
				result = pstmt.executeUpdate();
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
		
	}
	
	public int deleteRecipe(Connection conn, int recipeNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteRecipe");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, recipeNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public ArrayList<Recipe> selectRecentRecipeList(Connection conn){
		ArrayList<Recipe> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectRecentRecipeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
	
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Recipe(rset.getInt("RECIPE_NO"),
									rset.getString("RECIPE_TITLE"),
									rset.getString("MEMBER_ID"),
									rset.getString("MAIN_IMG")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	
	public ArrayList<Reply> selectReplyListM(Connection conn, PageInfo pi){
		ArrayList<Reply> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReplyListM");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Reply(rset.getInt("REPLY_NO"),
						   		   rset.getString("MEMBER_ID"),
						   		   rset.getString("REPLY_CONTENT"),
						   		   rset.getString("REPORT_STATUS"), 		   
						   		   rset.getString("RECIPE_TITLE"),
						   		   rset.getString("REPORT_CONTENT"),
						   		   rset.getInt("REF_NO")
						   		   ));
						   		   
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	public ArrayList<Recipe> selectRecipeListDeleteM(Connection conn, PageInfo pi){
		ArrayList<Recipe> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectRecipeListDeleteM");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
		
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Recipe(rset.getString("RECIPE_TITLE"),
									rset.getString("MEMBER_ID"),
									rset.getInt("RECIPE_NO"),
									rset.getString("ENROLL_DATE")));
						   		   
			}
			
			// System.out.println(list);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	
	public ArrayList<Report> selectRecipeReportDelListM(Connection conn, PageInfo pi){
		ArrayList<Report> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectRecipeReportDelListM");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
		
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Report(rset.getInt("REPORT_NO"),
									rset.getInt("REF_NO"),
									rset.getString("REPORT_CONTENT"),
									rset.getString("MEMBER_ID"),
									rset.getString("RECIPE_TITLE"),
									rset.getString("REPORT_DATE")));
						   		   
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	
	public ArrayList<Recipe> selectRecipeListRestorationM(Connection conn, PageInfo pi){
		ArrayList<Recipe> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectRecipeListRestorationM");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
		
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Recipe(rset.getString("RECIPE_TITLE"),
									rset.getString("MEMBER_ID"),
									rset.getInt("RECIPE_NO"),
									rset.getString("ENROLL_DATE")));
						   		   
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	
	public int insertRecipeM(Connection conn, Recipe r) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertRecipeM");
		
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
	
	
	public ArrayList<Recipe> selectRecipeListUpDelM(Connection conn, PageInfo pi){
		ArrayList<Recipe> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectRecipeListUpDelM");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
		
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Recipe(rset.getString("RECIPE_TITLE"),
									rset.getString("MANAGER_ID"),
									rset.getInt("RECIPE_NO"),
									rset.getString("ENROLL_DATE")));
						   		   
			}
			
		
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	
	public int selectDelRecipeM(Connection conn, String deleteRe) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql= prop.getProperty("selectDelRecipeM");
		
		sql += deleteRe + ")";
		
		// System.out.println(deleteRe);
		
		try {
			pstmt= conn.prepareStatement(sql);
			
			result= pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	public int selectRestoreRecipeM(Connection conn, String restoreRe) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql= prop.getProperty("selectRestoreRecipeM");
		
		sql += restoreRe + ")";
		
		// System.out.println(deleteRe);
		
		try {
			pstmt= conn.prepareStatement(sql);
			
			result= pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	public int deleteRecipeIngreList(Connection conn, Recipe r) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteRecipeIngreList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r.getRecipeNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int deleteRecipeOrderList(Connection conn, Recipe r) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteRecipeOrderList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r.getRecipeNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}
