package com.milk.member.model.dao;

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
	
public Member updateCheckPwd(Connection conn, String memberId, String memberPwd) {
		
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("updateCheckPwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getString("member_id"),
							   rset.getString("member_pwd")
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
	

//	public Attachment selectAttachment(Connection conn, int memberNo) {
//		
//		Attachment at = null;
//		PreparedStatement pstmt = null;
//		ResultSet rset = null;
//		String sql = prop.getPrpperty("selectAttachment");
//	}

	public int updateMember(Connection conn, Member m) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getMemberName());
			pstmt.setString(2, m.getPhone());
			pstmt.setString(3, m.getEmail());
			pstmt.setString(4, m.getAddressNumber());
			pstmt.setString(5, m.getAddress());
			pstmt.setString(6, m.getAddressDetail());
			pstmt.setString(7, m.getMemberId());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public Member selectMember (Connection conn, String MemberId) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, MemberId);
			rset=pstmt.executeQuery();
			
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
	
	public int updatePwdMember(Connection conn, String memberId, String memberPwd, String updatePwd) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePwdMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, updatePwd);
			pstmt.setString(2, memberId);
			pstmt.setString(3, memberPwd);
			
			result=pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public int selectListCount(Connection conn) {
		ResultSet rset= null;
		PreparedStatement pstmt = null;
		int listCount = 0;
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
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
	
	public ArrayList<Member> selectMemberList(Connection conn, PageInfo pi){
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		ArrayList<Member> list = new ArrayList<>();
		String sql = prop.getProperty("selectMemberList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Member(
						rset.getInt("member_no"),
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
						   rset.getString("member_grade"),
						   rset.getInt("total"),
						   rset.getInt("totalpay")
						);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
	

}
