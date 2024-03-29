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
		sql+="order by faq_no desc) E) WHERE RNUM BETWEEN ? AND ? ";
		
		
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
	
	public ArrayList<Faq> selectManagerFaqList(Connection conn, PageInfo pi){
		PreparedStatement pstmt= null;
		ResultSet rset= null;
		ArrayList<Faq>list = new ArrayList<>();
		String sql= prop.getProperty("selectManagerFaqList");
		
		int startRow= (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
		int endRow= startRow + pi.getBoardLimit() -1;
		
		
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
	
	public int deleteFaq(Connection conn,String delNo) {
		
		int result =0;
		PreparedStatement pstmt = null;
		String sql= prop.getProperty("deleteFaq");
		sql+= delNo +")";
		
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
	
	public int selectSearchListCount(Connection conn, String searchFaq) {
		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql= prop.getProperty("selectSearchListCount");
		
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, searchFaq);
			
			rset= pstmt.executeQuery();
			if(rset.next()) {
				listCount=  rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
		
		
	}
	
	public ArrayList<Faq> selectSearchList(Connection conn,PageInfo pi, String searchFaq){
		
		ArrayList<Faq>list = new ArrayList<>();
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		String sql= prop.getProperty("selectSearchList");
		
		try {
			
			pstmt= conn.prepareStatement(sql);
			int startRow= (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
			int endRow= startRow + pi.getBoardLimit() -1;
			
			pstmt.setString(1, searchFaq);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Faq(
						rset.getInt("FAQ_NO")	
					   ,rset.getString("QUESTION")
					   ,rset.getString("answer")
					   ,rset.getString("CATEGORY_NAME")			
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
		
	}
	
	public int selectBestSearchListCount(Connection conn, String searchBFaq) {
		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql= prop.getProperty("selectBestSearchListCount");
		
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, searchBFaq);
			
			rset= pstmt.executeQuery();
			if(rset.next()) {
				listCount=  rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
		
		
	}
	
	public ArrayList<Faq> selectBestSearchList(Connection conn,PageInfo pi, String searchBFaq){
		
		ArrayList<Faq>list = new ArrayList<>();
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		String sql= prop.getProperty("selectBestSearchList");
		
		try {
			
			pstmt= conn.prepareStatement(sql);
			int startRow= (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
			int endRow= startRow + pi.getBoardLimit() -1;
			
			pstmt.setString(1, searchBFaq);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Faq(
						rset.getInt("FAQ_NO")
					   ,rset.getString("QUESTION")
					   ,rset.getString("answer")
					   ,rset.getString("CATEGORY_NAME")			
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
		
	}
	
	
	public int insertFaq(Connection conn, Faq f) {
		int result= 0;
		PreparedStatement pstmt = null;
		String sql= prop.getProperty("insertFaq");
		
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, f.getQuestion());
			pstmt.setString(2, f.getAnswer());
			pstmt.setString(3, f.getBestFaq());
			pstmt.setInt(4, f.getFaqWriter());
			pstmt.setString(5, f.getCategoryName());
			
			result= pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		return result;
		
	}
	
	public Faq selectFaq(Connection conn,int faqNo) {
		ResultSet rset = null;
		PreparedStatement pstmt =null;
		Faq f = new Faq();
		String sql= prop.getProperty("selectFaq");
		
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, faqNo);
			
			rset= pstmt.executeQuery();
			
			if(rset.next()) {
				 f= new Faq(
						rset.getInt("FAQ_NO")
						,rset.getString("QUESTION")
						,rset.getString("ANSWER")
						,rset.getString("BEST_FAQ")
						,rset.getInt("FAQ_WRITER")
						,rset.getString("CATEGORY_NAME")
						
						);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return f;
	
		
	}
	
	public int updateFaq(Connection conn, Faq f) {
		int result= 0;
		PreparedStatement pstmt = null;
		String sql= prop.getProperty("updateFaq");
		
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, f.getQuestion());
			pstmt.setString(2, f.getAnswer());
			pstmt.setString(3, f.getBestFaq());
			pstmt.setInt(4, f.getFaqWriter());
			pstmt.setString(5, f.getCategoryName());
			pstmt.setInt(6, f.getFaqNo());
			
			result= pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		return result;
	
	}

}