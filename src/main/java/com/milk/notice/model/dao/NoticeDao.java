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
import com.milk.notice.model.vo.Attachment;
import com.milk.notice.model.vo.Notice;

public class NoticeDao {
	
	Properties prop= new Properties();
	
	public  NoticeDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(NoticeDao.class.getResource("/db/sql/notice-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public int selectNoticeListCount(Connection conn) {
		int listCount =0;
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		
		String sql= prop.getProperty("selectNoticeListCount");
		
		try {
			pstmt= conn.prepareStatement(sql);
			rset=pstmt.executeQuery();
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
		
	}
	
	public ArrayList<Notice> selectNoticeList(Connection conn, PageInfo pi){
		
		ArrayList<Notice>list = new ArrayList<>();
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		String sql= prop.getProperty("selectNoticeList");
		
		try {
			pstmt= conn.prepareStatement(sql);
			
			int startRow= (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
			int endRow= startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Notice(
						rset.getInt("notice_no")
					   ,rset.getString("notice_title")
					   ,rset.getInt("count")
					   ,rset.getString("enroll_date")
					   ,rset.getString("manager_name")
						
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return list;
		
		
	}
	public int increaseCount(Connection conn, int noticeNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql= prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}
	
	public Notice selectNotice(Connection conn, int noticeNo) {
		Notice n = null;
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		String sql= prop.getProperty("selectNotice");
		
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			
			rset= pstmt.executeQuery();
			if(rset.next()) {
				n = new Notice(
						rset.getInt("notice_no")
					   ,rset.getString("notice_title")
					   ,rset.getString("notice_content")
					   ,rset.getInt("count")
					   ,rset.getString("enroll_date")
					   ,rset.getString("manager_name")
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return n;
		
	}
	
	public Attachment selectAttachment(Connection conn, int noticeNo) {
		Attachment at= null;
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		String sql= prop.getProperty("selectAttachment");
		
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			rset= pstmt.executeQuery();
			
			if(rset.next()) {
				at = new Attachment(
						rset.getInt("file_no")
					   ,rset.getString("change_name")
					   ,rset.getString("file_path")
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return at;
		
	}
	
	public int insertNotice(Connection conn,Notice n) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql= prop.getProperty("insertNotice");
		
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContent());
			pstmt.setInt(3, n.getWriterNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;

		
	}
	public int insertAttachment(Connection conn , Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql= prop.getProperty("insertAttachment");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, at.getChangeName());
			pstmt.setString(2, at.getFilePath());
			
			result= pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public ArrayList<Notice> selectSearchList(Connection conn,PageInfo pi, String searchNo){
		
		ArrayList<Notice>list = new ArrayList<>();
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		String sql= prop.getProperty("selectSearchList");
		
		try {
			
			pstmt= conn.prepareStatement(sql);
			int startRow= (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
			int endRow= startRow + pi.getBoardLimit() -1;
			
			pstmt.setString(1, searchNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Notice(
						rset.getInt("notice_no")
					   ,rset.getString("notice_title")
					   ,rset.getInt("count")
					   ,rset.getString("enroll_date")
					   ,rset.getString("manager_name")
						
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
	
	public int updateNotice(Connection conn, Notice n) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContent());
			pstmt.setInt(3, n.getNoticeNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateAttachment(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getChangeName());
			pstmt.setString(2, at.getFilePath());
			pstmt.setInt(3, at.getFileNo());
			
			result= pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			
			close(pstmt);
		}
		
		return result;
		
	}
	
	public int insertNewAttachment (Connection conn, Attachment at) {
		int result= 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNewAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, at.getRefNo());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
	 
		return result;
	}
	
	
	public int selectSearchListCount(Connection conn, String searchNo) {
		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql= prop.getProperty("selectSearchListCount");
		
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, searchNo);
			
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
	
	public int deleteNotice(Connection conn,String delNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql= prop.getProperty("deleteNotice");
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
}

