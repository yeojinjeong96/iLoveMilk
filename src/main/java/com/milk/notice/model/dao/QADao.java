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
	public ArrayList<QA> selectQuestionList(Connection conn, int memberNo){
		
		ArrayList<QA>list = new ArrayList<>();
		ResultSet rset= null;
		PreparedStatement pstmt= null;
		String sql= prop.getProperty("selectQuestionList");
		
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			
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

}
