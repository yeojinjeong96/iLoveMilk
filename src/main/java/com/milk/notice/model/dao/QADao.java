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
import com.milk.notice.model.vo.QA;

public class QADao {
	
	Properties prop= new Properties();
	
	public QADao() {
		
		try {
			prop.loadFromXML(new FileInputStream(QADao.class.getResource("/db/sql/qa-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	public int insertQuestion(Connection conn, QA q) {
		PreparedStatement pstmt= null;
		int result=0;
		String sql= prop.getProperty("insertQuestion");
		
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, q.getqWriter());
			pstmt.setString(2, q.getqTitle());
			pstmt.setString(3, q.getqContent());
			pstmt.setString(4, q.getfCategory());
			pstmt.setString(5, q.getsCategory());
			
			result= pstmt.executeUpdate();
			
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
	public ArrayList<QA> selectQuestionList(Connection conn, PageInfo pi,int memberNo){
		
		ArrayList<QA>list = new ArrayList<>();
		ResultSet rset= null;
		PreparedStatement pstmt= null;
		String sql= prop.getProperty("selectQuestionList");
		
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			int startRow= (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
			int endRow= startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset= pstmt.executeQuery();
			while(rset.next()) {
				
				list.add(new QA(
						rset.getInt("q_no")
					   ,rset.getString("q_title")
					   ,rset.getString("enroll_date")
					   ,rset.getString("answer_status")
					   ,rset.getString("fcategory_name")
					   ,rset.getString("scategory_name")
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
	
	public int selectQAListCount(Connection conn,int memberNo) {
		int listCount =0;
		ResultSet rset= null;
		PreparedStatement pstmt= null;
		String sql= prop.getProperty("selectQAListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			rset= pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(conn);
		}
		
		return listCount;
	}
	
	public QA selectQA(Connection conn, int qNo) {
		QA q = null;
		ResultSet rset= null;
		PreparedStatement pstmt= null;
		String sql= prop.getProperty("selectQA");
		
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, qNo);
			rset= pstmt.executeQuery();
			if(rset.next()) {
			q=	new QA(
					rset.getInt("q_no")
			       ,rset.getString("member_name")
			       ,rset.getString("q_title")
			       ,rset.getString("q_content")
			       ,rset.getString("enroll_date")
			       ,rset.getString("manager_name")
			       ,rset.getString("answer_status")
			       ,rset.getString("a_title")
			       ,rset.getString("answer_date")
			       ,rset.getString("a_content")
			       ,rset.getString("fcategory_name")
			       ,rset.getString("scategory_name")

					);
	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
			
		}
		return q;
		

	}
	
	public Attachment selectAttachment(Connection conn, int qNo) {
		
		Attachment at= null;
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		String sql= prop.getProperty("selectAttachment");
		
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, qNo);
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
	
	public ArrayList<QA> selectIncompletedList(Connection conn, PageInfo pi){
		
		ArrayList<QA>list = new ArrayList<>();
		ResultSet rset= null;
		PreparedStatement pstmt= null;
		String sql= prop.getProperty("selectIncompletedList");
		
		try {
			pstmt= conn.prepareStatement(sql);
			int startRow= (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
			int endRow= startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset= pstmt.executeQuery();
			while(rset.next()) {
				
				list.add(new QA(
						rset.getInt("q_no")
					   ,rset.getString("member_Id")
					   ,rset.getString("q_title")
					   ,rset.getString("q_content")
					   ,rset.getString("enroll_date")
					   ,rset.getString("answer_status")
					   ,rset.getString("fcategory_name")
					   ,rset.getString("scategory_name")
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
	
	public int enrollAnswer(Connection conn, QA q) {
		int result= 0;
		PreparedStatement pstmt= null;
		String sql= prop.getProperty("enrollAnswer");
		
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, q.getaWriter());
			pstmt.setString(2, q.getaTitle());
			pstmt.setString(3, q.getaContent());
			pstmt.setInt(4,q.getqNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}

}
