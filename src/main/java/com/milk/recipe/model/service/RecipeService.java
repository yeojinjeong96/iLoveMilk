package com.milk.recipe.model.service;

import static com.milk.common.JDBCTemplate.close;
import static com.milk.common.JDBCTemplate.commit;
import static com.milk.common.JDBCTemplate.getConnection;
import static com.milk.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.milk.common.model.vo.PageInfo;
import com.milk.recipe.model.dao.RecipeDao;
import com.milk.recipe.model.vo.Recipe;
import com.milk.recipe.model.vo.RecipeIngre;
import com.milk.recipe.model.vo.RecipeOrder;
import com.milk.recipe.model.vo.Reply;
import com.milk.recipe.model.vo.Report;

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
	
	
	public int insertRecipe(Recipe r, ArrayList<RecipeIngre> listIngre, ArrayList<RecipeOrder> listOrder) {
		Connection conn = getConnection();
		
		int result1 = new RecipeDao().insertRecipe(conn, r);
		
		int result2 = new RecipeDao().insertRecipeIngreList(conn, listIngre);
		
		int result3 = new RecipeDao().insertRecipeOrderList(conn, listOrder);
		
		
		if(result1 > 0 && result2 > 0 && result3 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		
		return result1 * result2 * result3;
	}
	
	
	public int increaseCount(int recipeNo) {
		Connection conn = getConnection();
		
		int result = new RecipeDao().increaseCount(conn, recipeNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	
	public Recipe selectRecipe(int recipeNo) {
		Connection conn = getConnection();
		
		Recipe r = new RecipeDao().selectRecipe(conn, recipeNo);
		
		close(conn);
		return r;
	}
	
	public Recipe selectRecipeR(int recipeNo) {
		Connection conn = getConnection();
		
		Recipe r = new RecipeDao().selectRecipeR(conn, recipeNo);
		
		close(conn);
		return r;
	}
	
	public ArrayList<RecipeIngre> selectRecipeIngreList(int recipeNo){
		Connection conn = getConnection();
		
		ArrayList<RecipeIngre> listI = new RecipeDao().selectRecipeIngreList(conn, recipeNo);
		
		close(conn);
		return listI;
	}
	
	public ArrayList<RecipeOrder> selectRecipeOrderList(int recipeNo){
		Connection conn = getConnection();
		
		ArrayList<RecipeOrder> listO = new RecipeDao().selectRecipeOrderList(conn, recipeNo);
		
		close(conn);
		return listO;
	}
	
	
	public ArrayList<Reply> selectReplyList(int recipeNo){
		Connection conn = getConnection();
		
		ArrayList<Reply> list = new RecipeDao().selectReplyList(conn, recipeNo);
		
		close(conn);
		return list;
	}
	
	
	/*
	public Attachment selectReplyAt(int recipeNo) {
		Connection conn = getConnection();
		
		Attachment at = new RecipeDao().selectReplyAt(conn, recipeNo);
		
		close(conn);
		return at;
	}
	*/
	
	
	
	public int insertReply(Reply r) {
		
		Connection conn = getConnection();
		
		
		int result = new RecipeDao().insertReply(conn, r);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	
	public int updateRecipe(Recipe r, ArrayList<RecipeIngre> listIngre, ArrayList<RecipeOrder> listOrder) {
		Connection conn = getConnection();
		
		int result1 = new RecipeDao().updateRecipe(conn, r);
		
		int result2 = new RecipeDao().updateRecipeIngreList(conn, listIngre);
		
		int result3 = new RecipeDao().updateRecipeOrderList(conn, listOrder);
		
		
		if(result1 > 0 && result2 > 0 && result3 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		
		return result1 * result2 * result3;
	}
	
	
	public int deleteRecipe(int recipeNo) {
		Connection conn = getConnection();
		
		int result = new RecipeDao().deleteRecipe(conn, recipeNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	
	public ArrayList<Recipe> selectRecentRecipeList(){
		Connection conn = getConnection();
		
		ArrayList<Recipe> list = new RecipeDao().selectRecentRecipeList(conn);
		
		close(conn);
		return list;
	}
	
	
	public ArrayList<Reply> selectReplyListM(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Reply> list = new RecipeDao().selectReplyListM(conn, pi);
		
		close(conn);
		return list;
	}
	
	public ArrayList<Recipe> selectRecipeListDeleteM(PageInfo pi) {
		Connection conn = getConnection();
		
		
		ArrayList<Recipe> list = new RecipeDao().selectRecipeListDeleteM(conn, pi);
		
		close(conn);
		return list;
	}
	
	
	public ArrayList<Report> selectRecipeReportDelListM(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Report> list = new RecipeDao().selectRecipeReportDelListM(conn, pi);
		
		close(conn);
		return list;
	}
	
	public ArrayList<Recipe> selectRecipeListRestorationM(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Recipe> list = new RecipeDao().selectRecipeListRestorationM(conn, pi);
		
		close(conn);
		return list;
	}
	
	public int insertRecipeM(Recipe r, ArrayList<RecipeIngre> listIngre, ArrayList<RecipeOrder> listOrder) {
		Connection conn = getConnection();
		
		int result1 = new RecipeDao().insertRecipeM(conn, r);
		
		int result2 = new RecipeDao().insertRecipeIngreList(conn, listIngre);
		
		int result3 = new RecipeDao().insertRecipeOrderList(conn, listOrder);
		
		
		if(result1 > 0 && result2 > 0 && result3 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		
		return result1 * result2 * result3;
	}
	
	
	public ArrayList<Recipe> selectRecipeListUpDelM(PageInfo pi) {
		Connection conn = getConnection();
		
		
		ArrayList<Recipe> list = new RecipeDao().selectRecipeListUpDelM(conn, pi);
		
		close(conn);
		return list;
	}
	
	
	public int selectDelRecipeM(String deleteRe) {
		Connection conn = getConnection();
		
		int result = new RecipeDao().selectDelRecipeM(conn, deleteRe);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	
	public int selectRestoreRecipeM(String restoreRe) {
		Connection conn = getConnection();
		
		int result = new RecipeDao().selectRestoreRecipeM(conn, restoreRe);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
}
