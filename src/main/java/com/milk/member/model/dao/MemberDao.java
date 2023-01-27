package com.milk.member.model.dao;

import static com.milk.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.milk.member.model.vo.Member;


public class MemberDao {
	
private Properties prop = new Properties();
	

	public MemberDao() {
		
		String filePath = MemberDao.class.getResource("/db/sql/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
	
	public Member loginMember(Connection conn, String memberId, String memberPwd) {
		//select
		
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("member_no"),
							   rset.getString("member_id"),
							   rset.getString("member_pwd"),
							   rset.getString("member_name"),
							   rset.getString("phone"),
							   rset.getString("email"),
							   rset.getString("address_number"),
							   rset.getString("address"),
							   rset.getString("address_detail"),
							   rset.getString("profile"),
							   rset.getDate("enroll_date"),
							   rset.getDate("modify_date"),
							   rset.getString("black_list"),
							   rset.getString("status"),
							   rset.getString("member_grade")
							  );
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(rset);
			close(pstmt);
		}
		
		return m;
	}
	
	public Member findMemberId(Connection conn, String memberName, String email) {
		
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("findMemberId");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberName);
			pstmt.setString(2, email);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getString("member_id"),
							   rset.getString("member_name")
							  );
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
		
	}
	
	public int idCheck(Connection conn, String checkId) {
		int count= 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql= prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, checkId);
			
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
	
	public int insertMember(Connection conn, Member m) {
		
		//System.out.println(m);
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberPwd());
			pstmt.setString(3, m.getMemberName());
			pstmt.setString(4, m.getPhone());
			pstmt.setString(5, m.getEmail());
			pstmt.setString(6, m.getAddressNumber());
			pstmt.setString(7, m.getAddress());
			pstmt.setString(8, m.getAddressDetail());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	

}
