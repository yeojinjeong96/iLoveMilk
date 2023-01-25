package com.milk.notice.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import static com.milk.common.JDBCTemplate.*;

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
	

}
