package com.milk.product.model.dao;

import static com.milk.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.milk.common.model.vo.PageInfo;
import com.milk.member.model.vo.Member;
import com.milk.member.model.vo.Order;
import com.milk.product.model.vo.Product;
import com.milk.product.model.vo.ProductLike;
import com.milk.product.model.vo.Review;

public class ProductDao {
	
	private Properties prop = new Properties();
	
	public ProductDao() {
		try {
			prop.loadFromXML(new FileInputStream(ProductDao.class.getResource("/db/sql/product-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectListCount(Connection conn, String category) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			pstmt.setString(2, category);
			
			rset = pstmt.executeQuery();

			if(rset.next()) {
				listCount = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
		
	}
	
	
	public ArrayList<Product> selectProductList(Connection conn, PageInfo pi, String category){
		
		ArrayList<Product> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectProductList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setString(1, category);
			pstmt.setString(2, category);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);	
			
			rset= pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Product(
						rset.getInt("product_no"),
						rset.getString("BRAND"),
						rset.getString("product_name"),
						rset.getInt("price"),
						rset.getString("product_img")
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
	
	
	public ArrayList<Product> selectCategoryList(Connection conn, String category){
		
		ArrayList<Product> categoryList = new ArrayList<>();
		
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectCategoryList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,  category);
			pstmt.setString(2, category);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				categoryList.add(new Product(
						rset.getString("fcategory_name"),
						rset.getString("scategory_name")
						));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return categoryList;
	}
	
	public ArrayList<Product> selectRecentProductList(Connection conn){
		
		ArrayList<Product> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectRecentProductList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Product(
						rset.getInt("product_no"),
						rset.getString("BRAND"),
						rset.getString("product_name"),
						rset.getInt("price"),
						rset.getString("product_img")
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
	
	
	public ArrayList<Review> selectProductReview(Connection conn, int no) {
		
		ArrayList<Review> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectProductReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Review(
						rset.getInt("REVIEW_NO"),
						rset.getInt("MEMBER_NO"),
						rset.getString("product_name"),
						rset.getString("REVIEW_CONTENT"),
						rset.getInt("star"),
						rset.getString("R_ENROLL_DATE"),
						rset.getString("R_MODIFY_DATE")
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
	
	public int countProductLike(Connection conn, ProductLike pl) {
		
		ResultSet rset = null;
		int count = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("countProductLike");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pl.getProductNo());
			pstmt.setInt(2, pl.getMemberNo());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("count");
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
		
	}
	
	public int insertProductLike(Connection conn, ProductLike pl) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertProductLike");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pl.getProductNo());
			pstmt.setInt(2, pl.getMemberNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	public int deleteProductLike(Connection conn, ProductLike pl) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteProductLike");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pl.getProductNo());
			pstmt.setInt(2, pl.getMemberNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int selectSearchCount(Connection conn, String keyword) {
		int listCount = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectSearchCount");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword);
			pstmt.setString(2, keyword);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	
	public ArrayList<Product> selectSearchList (Connection conn, PageInfo pi, String keyword){
		
		ArrayList<Product> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectSearchList");
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;

			pstmt.setString(1, keyword);
			pstmt.setString(2, keyword);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Product(
						rset.getInt("product_no"),
						rset.getString("BRAND"),
						rset.getString("product_name"),
						rset.getInt("price"),
						rset.getString("product_img")
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
	
	public int selectReSearchCount(Connection conn, String keyword, String keyOption) {
		int listCount = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
	
		
		String sql = prop.getProperty("selectReSearchCount");
		
		if(keyOption.equals("brand")) {
			
			sql += "AND BRAND LIKE '%' || ? || '%'";
			
		}else if(keyOption.equals("productName")) {
			
			sql += "AND PRODUCT_NAME LIKE '%' || ? || '%'";
		}

		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	
	public ArrayList<Product> selectReSearchList(Connection conn,PageInfo pi, String keyword, String keyOption){
		ArrayList<Product> list = new  ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectResearchList");
		
		
		if(keyOption.equals("brand")) {
			
			sql += " AND BRAND LIKE '%' || ? || '%'"
				 + " ORDER"
				 + " BY ENROLL_DATE DESC"
				 + "  ) A"
				 + ")"
				 + "WHERE RNUM BETWEEN ? AND ? ";
			
		}else if(keyOption.equals("productName")) {
			
			sql += " AND PRODUCT_NAME LIKE '%' || ? || '%'"
				 + " ORDER"
				 + " BY ENROLL_DATE DESC"
				 + " ) A"
				 + ")"
				 + "WHERE RNUM BETWEEN ? AND ? ";
		}
		
		try {
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Product(
						rset.getInt("product_no"),
						rset.getString("BRAND"),
						rset.getString("product_name"),
						rset.getInt("price"),
						rset.getString("product_img")	
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
	
	public int countPurchaseList(Connection conn) {
		int listCount = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("countPurchaseList");	
		
		try {
			pstmt= conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	
	public ArrayList<Order> selectPurchaseList(Connection conn, PageInfo pi){
		ResultSet rset  = null;
		ArrayList<Order> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectPurchaseList");
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Order(
                        rset.getInt("ORDER_NO"),
                        rset.getDate("PAYMENT_DATE"),
                        rset.getInt("PRICE"),
                        rset.getString("MEMBER_ID")
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
	
	public ArrayList<Order> selectPurchaseDetailList(Connection conn, int no){
		ArrayList<Order> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectPurchaseDetailList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Order(
							rset.getInt("order_no"),
							rset.getDate("payment_date"),
							rset.getString("product_img"),
							rset.getString("product_name"),
							rset.getInt("count"),
							rset.getInt("price"),
							rset.getString("member_id"),
							rset.getInt("product_no")
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
	
	public int countOrderList(Connection conn) {
		ResultSet rset = null;
		int listCount = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("countOrderList");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return listCount;
	}
	
	public ArrayList<Order> selectOrderList(Connection conn, PageInfo pi){
		ArrayList<Order> list  = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectOrderList");
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Order(
							rset.getInt("ORDER_NO"),
							rset.getInt("STATUS"),
							rset.getInt("WAYBILL"),
							rset.getString("MEMBER_ID"),
							rset.getInt("MEMBER_NO"),
							rset.getString("ORDER_NAME"),
							rset.getString("ORDER_PHONE"),
							rset.getString("ORDER_EMAIL"),
							rset.getString("ADDRESS_NAME"),
							rset.getString("ADDRESS"),
							rset.getString("ADDRESS_TEL"),
							rset.getInt("USE_POINT"),
							rset.getString("COURIER"),
							rset.getDate("PAYMENT_DATE")
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
	
	public Order selectOrderDetail(Connection conn, int no) {
		Order o = new Order();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectOrderDetail");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				o = new Order(
						rset.getInt("ORDER_NO"),
						rset.getInt("STATUS"),
						rset.getInt("WAYBILL"),
						rset.getString("MEMBER_ID"),
						rset.getInt("MEMBER_NO"),
						rset.getString("ORDER_NAME"),
						rset.getString("ORDER_PHONE"),
						rset.getString("ORDER_EMAIL"),
						rset.getString("ADDRESS_NAME"),
						rset.getString("ADDRESS"),
						rset.getString("ADDRESS_TEL"),
						rset.getInt("USE_POINT"),
						rset.getString("COURIER"),
						rset.getDate("PAYMENT_DATE"),
						rset.getString("member_name")
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return o;
	}
	
	
	public int createWaybill(Connection conn,int no, String courier, int waybill) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int insertProduct(Connection conn, Product p) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertProduct");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p.getProductName());
			pstmt.setInt(2, p.getPrice());
			pstmt.setInt(3, p.getCapacity());
			pstmt.setString(4, p.getBrand());
			pstmt.setInt(5, p.getStock());
			pstmt.setString(6, p.getProductInfo());
			pstmt.setString(7, p.getfCategory());
			pstmt.setString(8, p.getsCategory());
			pstmt.setString(9, p.getProductImg());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateProduct(Connection conn, Product p) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateProduct");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p.getProductName());
			pstmt.setInt(2, p.getPrice());
			pstmt.setInt(3, p.getCapacity());
			pstmt.setString(4, p.getBrand());
			pstmt.setString(5, p.getProductInfo());
			pstmt.setString(6, p.getfCategory());
			pstmt.setString(7, p.getsCategory());
			pstmt.setString(8, p.getProductImg());
			pstmt.setInt(9, p.getProductNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteProduct(Connection conn, int[] arrpNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteProduct");
		
		for(int i=0; i<arrpNo.length-1; i++) {
			sql += "OR STATUS = 'Y' AND PRODUCT_NO = ?";
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			for(int i=0; i<arrpNo.length; i++) {
				pstmt.setInt(i+1, arrpNo[i]);
			}
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int receivingProduct(Connection conn, int proNo, int count) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("stockProduct");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, proNo);
			pstmt.setInt(2, count);
			pstmt.setString(3, "입고");
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int selectAllListCount(Connection conn, String op, String searchKey) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAllListCount");
		
		if(op != null && op.equals("상품명")) {
			sql += "AND PRODUCT_NAME LIKE '%" + searchKey + "%'";
		} else if(op != null && op.equals("상품코드")) {
			sql += "AND PRODUCT_NO =" + searchKey;
		} else if(op != null && op.equals("브랜드")) {
			sql += "AND BRAND LIKE '%" + searchKey + "%'";
		}
				
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	
	public ArrayList<Product> selectAllList(Connection conn, PageInfo pi, String op, String searchKey){
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAllList");
		
		if(op != null && op.equals("상품명")) {
			sql += "AND PRODUCT_NAME LIKE '%" + searchKey + "%'";
		} else if(op != null && op.equals("상품코드")) {
			sql += "AND PRODUCT_NO =" + searchKey;
		} else if(op != null && op.equals("브랜드")) {
			sql += "AND BRAND LIKE '%" + searchKey + "%'";
		}
		sql += "ORDER BY PRODUCT_NO DESC) A) WHERE RNUM BETWEEN ? AND ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Product p = new Product();
				p.setProductNo(rset.getInt("product_no"));
				p.setProductName(rset.getString("product_name"));
				p.setCapacity(rset.getInt("capacity"));
				p.setStock(rset.getInt("stock"));
				p.setBrand(rset.getString("brand"));
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;	
	}
	
	public Product productDetail(Connection conn, int proNo) {
		Product p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("productDetail");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, proNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				p = new Product();
				p.setProductImg(rset.getString("product_img"));
				p.setProductNo(rset.getInt("product_no"));
				p.setfCategory(rset.getString("fcategory_name"));
				p.setsCategory(rset.getString("scategory_name"));
				p.setProductName(rset.getString("product_name"));
				p.setCapacity(rset.getInt("capacity"));
				p.setBrand(rset.getString("brand"));
				p.setPrice(rset.getInt("price"));
				p.setStock(rset.getInt("stock"));
				p.setProductInfo(rset.getString("product_info"));
				p.setEnrollDate(rset.getString("enroll_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return p;
	}
	
	public int productCartInsert(Connection conn, int proNo, int memNo, int amount) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("productCartInsert");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, proNo);
			pstmt.setInt(2, memNo);
			pstmt.setInt(3, amount);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public ArrayList<Product> productCartList(Connection conn, int memNo) {
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("productCartList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Product p = new Product();
				p.setProductNo(rset.getInt("product_no"));
				p.setProductImg(rset.getString("product_img"));
				p.setProductName(rset.getString("product_name"));
				p.setCapacity(rset.getInt("count")); // 상품갯수
				p.setPrice(rset.getInt("price"));
				p.setStock(rset.getInt("stock"));
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int productCartAmount(Connection conn, int memNo, int proNo, int amount) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("productCartAmount");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, amount);
			pstmt.setInt(2, proNo);
			pstmt.setInt(3, memNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int productCartDelete(Connection conn, int memNo, String[] proNoArr) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("productCartDelete");
		sql += "WHERE MEMBER_NO = " + memNo + " AND PRODUCT_NO IN (" + String.join(",", proNoArr) + ")";
		try {
			pstmt = conn.prepareStatement(sql);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public ArrayList<Product> orderProductList(Connection conn, int memNo, String proNo) {
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("orderProductList");
		sql += memNo + " AND PRODUCT_NO IN (" + proNo + ")";
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Product p = new Product();
				p.setProductNo(rset.getInt("product_no"));
				p.setProductImg(rset.getString("product_img"));
				p.setProductName(rset.getString("product_name"));
				p.setCapacity(rset.getInt("count")); // 상품갯수
				p.setPrice(rset.getInt("price"));
				p.setStock(rset.getInt("stock"));
				list.add(p);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public Member orderMember(Connection conn, int memNo) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("orderMember");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m = new Member();
				m.setMemberName(rset.getString("member_name"));
				m.setPhone(rset.getString("phone"));
				m.setEmail(rset.getString("email"));
				m.setMemberNo(rset.getInt("total")); // 총 적립금
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}
	/*
	public int orderInsert(Connection conn, OrderInfo o) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("orderInsert");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, o.getMemberNo());
			pstmt.setString(2, o.getOrderName());
			pstmt.setString(3, o.getOrderPhone());
			pstmt.setString(4, o.getOrderEmail());
			pstmt.setString(5, o.getAddressName());
			pstmt.setString(6, o.getAddress());
			pstmt.setString(7, o.getAddressTel());
			pstmt.setInt(8, o.getUsePoint());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int orderDetailInsert(Connection conn, ArrayList<OrderDetail> odList) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("orderDetailInsert");
		try {
			for(OrderDetail od : odList) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, od.getProductNo());
				pstmt.setInt(2, od.getCount());
				//result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	*/
}
