package com.milk.manager.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.milk.manager.model.vo.Manager;

import static com.milk.common.JDBCTemplate.*;

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
}
