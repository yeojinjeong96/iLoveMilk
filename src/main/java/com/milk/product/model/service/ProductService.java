package com.milk.product.model.service;

import static com.milk.common.JDBCTemplate.close;
import static com.milk.common.JDBCTemplate.commit;
import static com.milk.common.JDBCTemplate.getConnection;
import static com.milk.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.milk.common.model.vo.PageInfo;
import com.milk.product.model.dao.ProductDao;
import com.milk.product.model.vo.Product;
import com.milk.product.model.vo.Review;

public class ProductService {
	
	/**
	 * 상품리스트 갯수 조회(페이징)
	 * @author 이다혜
	 * @return 상품리스트갯수
	 */
	public int selectListCount(String category) {
		
		Connection conn = getConnection();
		int listCount = new ProductDao().selectListCount(conn, category);
		
		close(conn);
		return listCount;
	}
	

	/**
	 * 카테고리별 상품리스트조회
	 * @author 이다혜
	 * @return 상품 ArrayList
	 */
	public ArrayList<Product> selectProductList(PageInfo pi, String category){
		
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectProductList(conn, pi, category);
 		
		
		
		close(conn);
		return list;
		
	}
	
	/**
	 * 상품목록페이지 카테고리리스트 조회
	 * @author 이다혜
	 * @return 상품객체의 카테고리컬럼들
	 */
	public ArrayList<Product> selectCategoryList(String category){
		
		Connection conn = getConnection();
		ArrayList<Product> categoryList = new ProductDao().selectCategoryList(conn, category);
		
		close(conn);
		return categoryList;
	}
	
	
	/**
	 * 최신상품(등록일순)3가지 리스트조회
	 * @author 이다혜
	 * @return 최신 상품 ArrayList
	 */
	public ArrayList<Product> selectRecentProductList(){
		
		Connection conn = getConnection();
		ArrayList<Product>list = new ProductDao().selectRecentProductList(conn);
		
		close(conn);
		return list;
		
	}
	
	/**
	 * 상품상세페이지 리뷰조회
	 * @author 이다혜
	 * @return ArrayList<Review>
	 */
	public ArrayList<Review> selectProductReview(int no) {
		
		Connection conn = getConnection();
		ArrayList<Review> list = new ProductDao().selectProductReview(conn, no);
		
		close(conn);
		
		return list;
		
	}
	
	
	
	/**
	 * 상품 등록
	 * @author 승하
	 * @return 상품 등록 성공시 1, 실패시 2
	 */
	public int insertProduct(Product p) {
		Connection conn = getConnection();
		int result = new ProductDao().insertProduct(conn, p);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	/**
	 * 상품 전체 갯수 조회
	 * @author 승하
	 * @return 상품 전체 갯수
	 */
	public int selectAllListCount() {
		Connection conn = getConnection();
		int result = new ProductDao().selectAllListCount(conn);
		close(conn);
		return result;
	}
	
	/**
	 * 상품 전체 조회
	 * @author 승하
	 * @return 전체 상품이 들어있는 ArrayList
	 */
	public ArrayList<Product> selectAllList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectAllList(conn, pi);
		close(conn);
		return list;
	}
	
	/**
	 * 상품 1개의 정보 조회
	 * @author 승하
	 * @return 상품 정보가 들어있는 Product 객체
	 */
	public Product productDetail(int proNo) {
		Connection conn = getConnection();
		Product p = new ProductDao().productDetail(conn, proNo);
		close(conn);
		return p;
	}


}
