package com.milk.product.model.service;

import static com.milk.common.JDBCTemplate.close;
import static com.milk.common.JDBCTemplate.commit;
import static com.milk.common.JDBCTemplate.getConnection;
import static com.milk.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.milk.common.model.vo.PageInfo;
import com.milk.member.model.vo.Member;
import com.milk.member.model.vo.Order;
import com.milk.product.model.dao.ProductDao;
import com.milk.product.model.vo.Product;
import com.milk.product.model.vo.ProductLike;
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
	 * TB_PRODUCT_LIKE 에 데이터 INSERT or DELETE
	 * @author 이다혜
	 * @return int result (성공시 1 | 실패시 0)
	 */
	public int insertProductLike(ProductLike pl) {
		
		Connection conn = getConnection();
		
		int count = 0;
		int result1 = 0;
		int result2 = 0;
		
		count = new ProductDao().countProductLike(conn, pl);
		
		
		
		if(count == 0) {
			result1 = new ProductDao().insertProductLike(conn, pl);
			
			if(result1 > 0) {
				commit(conn);
			}else {
				rollback(conn);
			}
			
			
		}else if(count == 1) {
			result2 = new ProductDao().deleteProductLike(conn, pl);
			
			if(result2 > 0) {
				commit(conn);
			}else {
				rollback(conn);
			}
			
		}
		
		close(conn);
		
		return result1 + result2;
	}
	
	/**
	 * 상품검색용 갯수 조회(페이징)
	 * @author 이다혜
	 * @return listCount
	 */
	public int selectSearchCount(String keyword) {
		Connection conn = getConnection();
		int listCount = new ProductDao().selectSearchCount(conn, keyword);
		
		close(conn);
		return listCount;
	}
	
	/**
	 * 메인페이지 상품검색
	 * @param keyword
	 * @return list
	 */
	public ArrayList<Product> selectSearchList(PageInfo pi, String keyword){
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectSearchList(conn, pi, keyword);
		
		close(conn);
		return list;
	}
	
	
	/**
	 * 상품 재검색용 갯수 조회(페이징)
	 * @author 이다혜
	 * @return listCount
	 */
	public int selectReSearchCount(String keyword, String keyOption) {
		Connection conn = getConnection();
		int listCount = new ProductDao().selectReSearchCount(conn, keyword, keyOption);
		
		close(conn);
		return listCount;
	}
	
	/**
	 * 상품 재검색 리스트조회
	 * @author 이다혜
	 * @return list
	 */
	public ArrayList<Product> selectReSearchList(PageInfo pi, String keyword, String keyOption){
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectReSearchList(conn, pi, keyword, keyOption);
		
		close(conn);
		return list;
	}
	
	/**
	 * 관리자페이지 전체 구매내역조회 페이징 카운트
	 * @author 이다혜
	 * @return listCount
	 */
	public int countPurchaseList() {
		Connection conn = getConnection();
		int listCount = new ProductDao().countPurchaseList(conn);
		close(conn);
		return listCount;
	}
	
	/**
	 * 관리자페이지 전체 구매내역조회
	 * @author 이다혜
	 * @return list
	 */
	public ArrayList<Order> selectPurchaseList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Order> list = new ProductDao().selectPurchaseList(conn, pi);
		close(conn);
		return list;
	}
	
	/**
	 * 구매내역 상세조회
	 * @author 이다혜
	 * @return list
	 */
	public ArrayList<Order> selectPurchaseDetailList(int no){
		Connection conn = getConnection();
		ArrayList<Order> list = new ProductDao().selectPurchaseDetailList(conn, no);
		close(conn);
		return list;
	}
	
	/**
	 * 주문목록 페이징을 위한 카운트
	 * @author 이다혜
	 * @return listCount
	 */
	public int countOrderList() {
		Connection conn = getConnection();
		int listCount = new ProductDao().countOrderList(conn);
		close(conn);
		return listCount;
	}
	
	/**
	 * 전체 주문목록 조회
	 * @author 이다혜
	 * @return list
	 */
	public ArrayList<Order> selectOrderList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Order> list = new ProductDao().selectOrderList(conn, pi);
		close(conn);
		return list;
	}
	
	
	/**
	 * 상품 갯수 조회
	 * @author 승하
	 * @return 상품 갯수
	 */
	public int selectAllListCount(String op, String searchKey) {
		Connection conn = getConnection();
		int result = new ProductDao().selectAllListCount(conn, op, searchKey);
		close(conn);
		return result;
	}
	
	/**
	 * 상품 리스트 조회
	 * @author 승하
	 * @return ArrayList
	 */
	public ArrayList<Product> selectAllList(PageInfo pi, String op, String searchKey){
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectAllList(conn, pi, op, searchKey);
		close(conn);
		return list;
	}
	
	/**
	 * 상품 1개의 정보 조회
	 * @author 승하
	 * @return Product
	 */
	public Product productDetail(int proNo) {
		Connection conn = getConnection();
		Product p = new ProductDao().productDetail(conn, proNo);
		close(conn);
		return p;
	}
	
	/**
	 * 상품 등록
	 * @author 승하
	 * @return 성공시 1, 실패시 2
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
	 * 상품 수정
	 * @author 승하
	 * @return 성공시 1, 실패시 2
	 */
	public int updateProduct(Product p) {
		Connection conn = getConnection();
		int result = new ProductDao().updateProduct(conn, p);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	/**
	 * 상품 삭제
	 * @author 승하
	 * @return 성공시 1, 실패시 2
	 */
	public int deleteProduct(int[] arrpNo) {
		Connection conn = getConnection();
		int result = new ProductDao().deleteProduct(conn, arrpNo);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	/**
	 * 상품 입고
	 * @author 승하
	 * @return 성공시 1, 실패시 2
	 */
	public int receivingProduct(int proNo, int count) {
		Connection conn = getConnection();
		int result = new ProductDao().receivingProduct(conn, proNo, count);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	/**
	 * 상품 장바구니에 추가
	 * @author 승하
	 * @return 성공시 1, 실패시 2
	 */
	public int productCartInsert(int proNo, int memNo, int amount) {
		Connection conn = getConnection();
		int result = new ProductDao().productCartInsert(conn, proNo, memNo, amount);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	/**
	 * 장바구니 리스트 조회
	 * @author 승하
	 * @return ArrayList
	 */
	public ArrayList<Product> productCartList(int memNo) {
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().productCartList(conn, memNo);
		close(conn);
		return list;
	}
	
	/**
	 * 장바구니 수량 변경
	 * @author 승하
	 * @return 성공시 1, 실패시 2
	 */
	public int productCartAmount(int memNo, int proNo, int amount) {
		Connection conn = getConnection();
		int result = new ProductDao().productCartAmount(conn, memNo, proNo, amount);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	/**
	 * 장바구니 상품 삭제
	 * @author 승하
	 * @return 성공시 1, 실패시 2
	 */
	public int productCartDelete(int memNo, String[] proNoArr) {
		Connection conn = getConnection();
		int result = new ProductDao().productCartDelete(conn, memNo, proNoArr);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	/**
	 * 주문서 상품 리스트
	 * @author 승하
	 * @return ArrayList
	 */
	public ArrayList<Product> orderProductList(int memNo, String proNo) {
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().orderProductList(conn, memNo, proNo);
		close(conn);
		return list;
	}
	
	/**
	 * 주문서 회원 정보
	 * @author 승하
	 * @return Member
	 */
	public Member orderMember(int memNo) {
		Connection conn = getConnection();
		Member m = new ProductDao().orderMember(conn, memNo);
		close(conn);
		return m;
	}

}
