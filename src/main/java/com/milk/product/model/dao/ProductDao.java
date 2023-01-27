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
import com.milk.product.model.vo.Product;
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

	public int selectAllListCount(Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAllListCount");
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
	
	public ArrayList<Product> selectAllList(Connection conn, PageInfo pi){
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAllList");
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1,startRow);
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
}
