package com.milk.recipe.model.service;

import static com.milk.common.JDBCTemplate.close;
import static com.milk.common.JDBCTemplate.commit;
import static com.milk.common.JDBCTemplate.getConnection;
import static com.milk.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.milk.common.model.vo.PageInfo;
import com.milk.product.model.dao.ProductDao;
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
	 * @return 자유게시판 레시피 list 반환
	 */
	public ArrayList<Recipe> selectRecipeList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Recipe> list = new RecipeDao().selectRecipeList(conn, pi);
		
		close(conn);
		return list;
		
	}
	
	
	/**
	 * oldestlist.re
	 * 오래된순 정렬해서 게시글 리스트 조회
	 * @author 최주원
	 * @param pi 페이징처리할 데이터들이 담겨있는 PageInfo객체
	 * @return 자유게시판 레시피 오래된순으로 list 반환
	 */
	public ArrayList<Recipe> selectRecipeOldestList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Recipe> list = new RecipeDao().selectRecipeOldestList(conn, pi);
		
		close(conn);
		return list;
		
	}
	
	/**
	 * countlist.re
	 * 조회순 정렬해서 게시글 리스트 조회
	 * @author 최주원
	 * @param pi 페이징처리할 데이터들이 담겨있는 PageInfo객체
	 * @return 자유게시판 레시피 조회순으로 list 반환
	 */
	public ArrayList<Recipe> selectRecipeCountList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Recipe> list = new RecipeDao().selectRecipeCountList(conn, pi);
		
		close(conn);
		return list;
		
	}
	
	
	/**
	 * listR.re
	 * 요청한 페이지에 보여질 게시글 리스트 조회
	 * @author 최주원
	 * @param pi 페이징처리할 데이터들이 담겨있는 PageInfo객체
	 * @return 추천레시피 list 반환
	 */
	public ArrayList<Recipe> selectRecipeListR(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Recipe> list = new RecipeDao().selectRecipeListR(conn, pi);
		
		close(conn);
		return list;
		
	}
	
	
	/**
	 * oldestlistR.re
	 * 오래된순 정렬해서 게시글 리스트 조회
	 * @author 최주원
	 * @param pi 페이징처리할 데이터들이 담겨있는 PageInfo객체
	 * @return 추천레시피 오래된순으로 list 반환
	 */
	public ArrayList<Recipe> selectRecipeOldestListR(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Recipe> list = new RecipeDao().selectRecipeOldestListR(conn, pi);
		
		close(conn);
		return list;
		
	}
	
	
	/**
	 * countlistR.re
	 * 조회순 정렬해서 게시글 리스트 조회
	 * @author 최주원
	 * @param pi 페이징처리할 데이터들이 담겨있는 PageInfo객체
	 * @return 추천레시피 조회순으로 list 반환
	 */
	public ArrayList<Recipe> selectRecipeCountListR(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Recipe> list = new RecipeDao().selectRecipeCountListR(conn, pi);
		
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
	
	public int deleteReply(Reply r) {
		
		Connection conn = getConnection();
		
		
		int result = new RecipeDao().deleteReply(conn, r);
		
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
		
		int result2 = new RecipeDao().deleteRecipeIngreList(conn, r);
		int result3 = new RecipeDao().deleteRecipeOrderList(conn, r);
		
		//System.out.println("삭제 재료 수 : " + result2);
		//System.out.println("삭제 순서 수 : " + result3);
		
		//System.out.println("리스트에 담긴 재료 수 : " + listIngre.size());
		//System.out.println("리스트에 담긴 순서 수 : " + listOrder.size());
		
		int result4 = new RecipeDao().updateRecipeIngreList(conn, listIngre);
		int result5 = new RecipeDao().updateRecipeOrderList(conn, listOrder);
		
		//System.out.println("추가 재료 수 : " + result4);
		//System.out.println("추가 순서 수 : " + result5);
		
		if(result1 > 0 && result2 > 0 && result3 > 0 && result4 > 0 && result5 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		
		return result1 * result2 * result3 * result4 * result5;
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
	
	public int selectDelReplyM(String deleteRe) {
		Connection conn = getConnection();
		
		int result = new RecipeDao().selectDelReplyM(conn, deleteRe);
		
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
	
	
	public int insertReport(Report r) {
		
		Connection conn = getConnection();
		
		
		int result = new RecipeDao().insertReport(conn, r);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	public int insertReportReply(Report r, Reply re) {
		
		Connection conn = getConnection();
		
		
		int result1 = new RecipeDao().insertReportReply(conn, r);
		int result2 = new RecipeDao().updateReply(conn, re);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result1 * result2;
	}
	
	public ArrayList<Reply> selectReply(int recipeNo){
		Connection conn = getConnection();
		
		ArrayList<Reply> list = new RecipeDao().selectReplyList(conn, recipeNo);
		
		close(conn);
		return list;
	}
	
	public int selectSearchListCount(String keyword, String select) {
		Connection conn = getConnection();
		
		int listCount = new RecipeDao().selectSearchListCount(conn, keyword, select);
		
		close(conn);
		return listCount;
	}
	
	public ArrayList<Recipe> selectSearchRecipeList(PageInfo pi, String keyword, String select){
		Connection conn = getConnection();
		
		ArrayList<Recipe> list = new RecipeDao().selectSearchRecipeList(conn, pi, keyword, select);
		
		close(conn);
		return list;
		
	}
	
	public int selectSearchRecListCount(String keyword, String select) {
		Connection conn = getConnection();
		
		int listCount = new RecipeDao().selectSearchRecListCount(conn, keyword, select);
		
		close(conn);
		return listCount;
	}
	
	public ArrayList<Recipe> selectSearchRecipeRecList(PageInfo pi, String keyword, String select){
		Connection conn = getConnection();
		
		ArrayList<Recipe> list = new RecipeDao().selectSearchRecipeRecList(conn, pi, keyword, select);
		
		close(conn);
		return list;
		
	}
	

	public int selectSearchListCountUpDelM(String keyword, String select) {
		Connection conn = getConnection();
		
		int listCount = new RecipeDao().selectSearchListCountUpDelM(conn, keyword, select);
		
		close(conn);
		return listCount;
	}
	
	public ArrayList<Recipe> selectSearchRecipeListUpDelM(PageInfo pi, String keyword, String select){
		Connection conn = getConnection();
		
		ArrayList<Recipe> list = new RecipeDao().selectSearchRecipeListUpDelM(conn, pi, keyword, select);
		
		close(conn);
		return list;
		
	}
	
	public int selectSearchListCountDelM(String keyword, String select) {
		Connection conn = getConnection();
		
		int listCount = new RecipeDao().selectSearchListCountDelM(conn, keyword, select);
		
		close(conn);
		return listCount;
	}
	
	public ArrayList<Recipe> selectSearchRecipeListDelM(PageInfo pi, String keyword, String select){
		Connection conn = getConnection();
		
		ArrayList<Recipe> list = new RecipeDao().selectSearchRecipeListDelM(conn, pi, keyword, select);
		
		close(conn);
		return list;
		
	}
	
	public int selectSearchListRestoreCount(String keyword, String select) {
		Connection conn = getConnection();
		
		int listCount = new RecipeDao().selectSearchListRestoreCount(conn, keyword, select);
		
		close(conn);
		return listCount;
	}
	
	public ArrayList<Recipe> selectSearchRecipeListRestoreM(PageInfo pi, String keyword, String select){
		Connection conn = getConnection();
		
		ArrayList<Recipe> list = new RecipeDao().selectSearchRecipeListRestoreM(conn, pi, keyword, select);
		
		close(conn);
		return list;
		
	}
	
	public int selectSearchReportListCount(String keyword, String select) {
		Connection conn = getConnection();
		
		int listCount = new RecipeDao().selectSearchReportListCount(conn, keyword, select);
		
		close(conn);
		return listCount;
	}
	
	public ArrayList<Report> selectSearchReportRecipeListM(PageInfo pi, String keyword, String select){
		Connection conn = getConnection();
		
		ArrayList<Report> list = new RecipeDao().selectSearchReportRecipeListM(conn, pi, keyword, select);
		
		close(conn);
		return list;
		
	}
	
	public int replyCount(int recipeNo) {
		Connection conn = getConnection();
		
		int replyCount = new RecipeDao().replyCount(conn, recipeNo);
		
		close(conn);
		return replyCount;
	}
	
	public ArrayList<Reply> selectSearchReplyListM(PageInfo pi, String select, String keyword, String option){
		Connection conn = getConnection();
		
		ArrayList<Reply> list = new RecipeDao().selectSearchReplyListM(conn, pi, select, keyword, option);
		
		close(conn);
		return list;
	}
}
