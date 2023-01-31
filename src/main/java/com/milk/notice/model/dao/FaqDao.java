package com.milk.notice.model.dao;

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
import com.milk.notice.model.vo.Faq;

public class FaqDao {
	
	Properties prop = new Properties();
	
	public FaqDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(FaqDao.class.getResource("/db/sql/faq-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public int selectFaqListCount(Connection conn,String category) {
		ResultSet rset= null;
		int result = 0;
		PreparedStatement pstmt= null;
		
		String sql= prop.getProperty("selectFaqListCount");
		
		if(category!=null) {
			sql+= "where category_name ='"+category +"'";
		}
		try {
			pstmt= conn.prepareStatement(sql);
			
			rset= pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
		
		
	}
	public ArrayList<Faq> selectFaqList(Connection conn, PageInfo pi,String category){
		PreparedStatement pstmt= null;
		ResultSet rset= null;
		ArrayList<Faq>list = new ArrayList<>();
		String sql= prop.getProperty("selectFaqList");
		
		int startRow= (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
		int endRow= startRow + pi.getBoardLimit() -1;
		
		if(category != null) {
			sql+=" WHERE CATEGORY_NAME = '"+category+"'";
		}
		sql+="ORDER BY CATEGORY_NAME)E)E  WHERE RNUM BETWEEN ? AND ?";
		
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset= pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Faq(rset.getInt("faq_no")
								,rset.getString("question")
								,rset.getString("answer")
								,rset.getInt("faq_writer")
								,rset.getString("category_name"))
	
						);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	public ArrayList<Faq> selectBestFaqList(Connection conn, PageInfo pi,String category){
		PreparedStatement pstmt= null;
		ResultSet rset= null;
		ArrayList<Faq>list = new ArrayList<>();
		String sql= prop.getProperty("selectBestFaqList");
		
		int startRow= (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
		int endRow= startRow + pi.getBoardLimit() -1;
		if(category != null) {
			
			sql+= "and category_name = '" + category+"'";
		}
		sql+=")E)E WHERE RNUM BETWEEN ? AND ?";
		try {
			pstmt= conn.prepareStatement(sql);
		
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset= pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Faq(rset.getInt("faq_no")
								,rset.getString("question")
								,rset.getString("answer")
								,rset.getInt("faq_writer")
								,rset.getString("category_name"))
	
						);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	public int selectBestFaqListCount(Connection conn,String category) {
		ResultSet rset= null;
		int result = 0;
		PreparedStatement pstmt= null;
		
		String sql= prop.getProperty("selectBestFaqListCount");
		if(category!=null) {
			sql+= "AND CATEGORY_NAME='"+category+"'";
		}
		
		try {
			pstmt= conn.prepareStatement(sql);
			
			rset= pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
		
		
	}

}
