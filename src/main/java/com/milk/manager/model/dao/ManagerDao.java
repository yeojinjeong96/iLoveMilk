package com.milk.manager.model.dao;

import static com.milk.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.milk.manager.model.vo.Manager;
import com.milk.product.model.vo.Payment;
import com.milk.product.model.vo.Product;

public class ManagerDao {
	private Properties prop = new Properties();
	
	public ManagerDao() {
		try {
			prop.loadFromXML(new FileInputStream(ManagerDao.class.getResource("/db/sql/manager-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public Manager managerLogin(Connection conn, String managerId, String managerPwd) {
		Manager m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("managerLogin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, managerId);
			pstmt.setString(2, managerPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Manager(rset.getInt("manager_no"),
								rset.getString("manager_id"),
								rset.getString("manager_pwd"),
								rset.getString("manager_name"),
								rset.getString("manager_phone"),
								rset.getString("manager_email"),
								rset.getString("status"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
	}
	
	public ArrayList<Product> needReceivingProduct(Connection conn){
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("needReceivingProduct");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Product p = new Product();
				p.setPrice(rset.getInt("rownum")); // 번호
				p.setProductNo(rset.getInt("product_no"));
				p.setProductName(rset.getString("product_name"));
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
	
	public ArrayList<Payment> recentPayment(Connection conn){
		ArrayList<Payment> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("recentPayment");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Payment p = new Payment();
				p.setNum(rset.getInt("rownum"));
				p.setOrderNo(rset.getString("order_no"));
				p.setPaymentDate(rset.getString("payment_date"));
				p.setMemberId(rset.getString("member_id"));
				switch(rset.getInt("status")) {
				case 1: p.setStatus("상품준비중"); break;
				case 2: p.setStatus("배송중"); break;
				case 3: p.setStatus("배송완료"); break;
				}
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
}
