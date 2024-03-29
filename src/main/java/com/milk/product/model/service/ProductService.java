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
import com.milk.product.model.vo.OrderInfo;
import com.milk.product.model.vo.PointIn;
import com.milk.product.model.vo.Product;
import com.milk.product.model.vo.ProductLike;
import com.milk.product.model.vo.Review;
import com.milk.product.model.vo.Stock;

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
	public ArrayList<Product> selectProductList(PageInfo pi, String category, int order){
		
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectProductList(conn, pi, category, order);
 		
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
	public ArrayList<Order> selectPurchaseDetailList(String no){
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
	 * 운송장발급창 주문상세조회
	 * @author 이다혜
	 * @return Order
	 */
	public Order selectOrderDetail(String no) {
		Connection conn = getConnection();
		Order o = new ProductDao().selectOrderDetail(conn, no);
		close(conn);
		return o;
	}
	
	/**
	 * 운송장발급과 제품출고
	 * @author 이다혜
	 * @return result
	 */
	public int createWaybill(String no, String courier, String waybill) {
		Connection conn = getConnection();
		int result1 = new ProductDao().createWaybill(conn,no, courier, waybill);
		
		if(result1 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		
		
		int result2 = new ProductDao().releaseStock(conn, no);
		
		if(result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
	}
	
	/**
	 * 운송장번호 중복체크
	 * @author 이다혜
	 * @return count
	 */
	public int wayCheck(String wn) {
		
		Connection conn = getConnection();
		
		int count = new ProductDao().wayCheck(conn, wn);
		close(conn);
		return count;
		
	}
	
	/**
	 * 배송상태별 페이징처리를 위한 카운트
	 * @author 이다혜
	 * @return listCount
	 */
	public int countOrderStatement(int option) {
		Connection conn = getConnection();
		int listCount = new ProductDao().countOrderStatement(conn, option);
		close(conn);
		return listCount;
	}
	
	/**
	 * 배송상태별 리스트 조회
	 * @author 이다혜
	 * @return listCount
	 */
	public ArrayList<Order> selectOrderStatement(PageInfo pi, int option){
		Connection conn = getConnection();
		ArrayList<Order> list = new ProductDao().selectOrderStatement(conn, pi, option);
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
	 * @return 성공시 1, 실패시 0
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
	 * @return 성공시 1, 실패시 0
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
	 * @return 성공시 1, 실패시 0
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
	 * @return 성공시 1, 실패시 0
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
	 * @return 성공시 1, 실패시 0
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
	 * @return 성공시 1, 실패시 0
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
	 * @return 성공시 1, 실패시 0
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
	
	/**
	 * 주문 테이블 insert
	 * @author 승하
	 * @return 성공시 1, 실패시 0
	 */
	public int orderInsert(OrderInfo o) {
		Connection conn = getConnection();
		int result = new ProductDao().orderInsert(conn, o);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	/**
	 * 주문 상세 테이블 insert
	 * @author 승하
	 * @return 성공시 1, 실패시 0
	 */
	public int orderDetailInsert(ArrayList<Product> list) {
		Connection conn = getConnection();
		int result = new ProductDao().orderDetailInsert(conn, list);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	/**
	 * 결제 테이블 insert
	 * @author 승하
	 * @return 성공시 1, 실패시 0
	 */
	public int paymentInsert(String orderNo, int price) {
		Connection conn = getConnection();
		int result = new ProductDao().paymentInsert(conn, orderNo, price);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	/**
	 * 회원등급 가져오기
	 * @author 승하
	 * @return 회원등급(String)
	 */
	public String selectMemberGrade(int memNo) {
		Connection conn = getConnection();
		String memGrade = new ProductDao().selectMemberGrade(conn, memNo);
		close(conn);
		return memGrade;
	}
	
	/**
	 * 회원등급별 적립금 insert
	 * @author 승하
	 * @return 성공시 1, 실패시 0
	 */
	public int pointInsert(PointIn point) {
		Connection conn = getConnection();
		int result = new ProductDao().pointInsert(conn, point);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	/**
	 * 주문번호 가져오기
	 * @author 승하
	 * @return 주문번호(String)
	 */
	public String selectOrderNo(int memNo) {
		Connection conn = getConnection();
		String orderNo = new ProductDao().selectOrderNo(conn, memNo);
		close(conn);
		return orderNo;
	}
	
	/**
	 * 입출고현황 갯수 조회
	 * @author 승하
	 * @return 입출고현황 갯수
	 */
	public int selectStockListCount(String op, String key, String start, String end) {
		Connection conn = getConnection();
		int count = new ProductDao().selectStockListCount(conn, op, key, start, end);
		close(conn);
		return count;
	}
	
	/**
	 * 입출고현황 리스트
	 * @author 승하
	 * @return ArrayList
	 */
	public ArrayList<Stock> selectStockList(PageInfo pi, String op, String key, String start, String end) {
		Connection conn = getConnection();
		ArrayList<Stock> list = new ProductDao().selectStockList(conn, pi, op, key, start, end);
		close(conn);
		return list;
	}

}
