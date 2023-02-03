package com.milk.member.model.dao;

import static com.milk.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;
import java.util.Properties;

import com.milk.common.model.vo.PageInfo;
import com.milk.member.model.vo.Member;
import com.milk.member.model.vo.Order;
import com.milk.member.model.vo.Point;
import com.milk.member.model.vo.Report;
import com.milk.member.model.vo.Review;
import com.milk.product.model.vo.ProductLike;


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
	

	
	public int MemberDelete(Connection conn, String memberId, String memberPwd ) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("MemberDelete");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberPwd);
			
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
						   ));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public int selectPointListCount(Connection conn, int memNo) {
		ResultSet rset = null;
		PreparedStatement pstmt  = null;
		int listCount = 0;
		
		String sql = prop.getProperty("selectPointListCount");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	
	public ArrayList<Point> selectPointList(Connection conn, PageInfo pi, int memNo){
		ArrayList<Point>list = new ArrayList<>();
		ResultSet rset= null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectPointList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;

			pstmt.setInt(1, memNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Point(
							rset.getInt("POINT_NO"),
							rset.getInt("count"),
							rset.getString("status"),
							rset.getInt("total"),
							rset.getString("MODIFY_DATE"),
							rset.getString("content"),
							rset.getString("ORDER_NO"),
							rset.getInt("member_no")
						));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public int selectReportListCount(Connection conn) {
		int listCount = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectReportListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	
	public ArrayList<Report> selectMemberReportList(Connection conn, PageInfo pi){
		ArrayList<Report> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectMemberReportList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset= pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Report(
						rset.getInt("REPORT_NO"),
						rset.getInt("REPORTING_MEM_NO"),
						rset.getInt("REF_NO"),
						rset.getString("REPORT_CONTENT"),
						rset.getString("REPORT_DATE"),
						rset.getString("REPORT_TYPE"),
						rset.getString("MEMBER_ID")
						));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public int selectMemberSearchCount(Connection conn, String keyword) {
		int listCount = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectMemberSearchCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	
	public ArrayList<Member> selectSearchMemberList(Connection conn, PageInfo pi, String keyword){
		
		ArrayList<Member> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectSearchMemberList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() -1)* pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setString(1, keyword);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
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
						));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public int memberPointChange(Connection conn, Point p) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("memberPointChange");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p.getAmount());
			pstmt.setString(2, p.getStatus());
			pstmt.setInt(3, p.getMemberNo());
			pstmt.setInt(4, p.getAmount());
			pstmt.setString(5, p.getContent());
			pstmt.setInt(6, p.getMemberNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public Report selectReportDetail(Connection conn, int memNo) {
		
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		Report r = new Report();
		
		String sql = prop.getProperty("selectReportDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				r = new Report(
						rset.getString("MEMBER_ID"),
						rset.getInt("count"),
						rset.getString("MEMBER_GRADE")
						);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return r;
	}
	
	public int insertBlackList(Connection conn, String memId, String modifyDate) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertBlackList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, modifyDate);
			pstmt.setString(2, memId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public int deleteMemberReport(Connection conn, int no) {
		int result = 0;
		PreparedStatement pstmt =null;
		String sql = prop.getProperty("deleteMemberReport");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
	
		return result;
	}
	
	public ArrayList<Member> selectBlackList(Connection conn){
		ResultSet rset = null;
		ArrayList<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectBlackList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Member(
							rset.getString("member_id"),
							rset.getDate("modify_date")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public int UpdateProfile(Connection conn, Member m) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("UpdateProfile");
		
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
			pstmt.setString(9, m.getProfile());
			pstmt.setInt(10, m.getMemberNo());
			
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	   public ArrayList<ProductLike> productLikeList(Connection conn, int memberNo) {
		      
		      ResultSet rset = null;
		      PreparedStatement pstmt = null;
		      ArrayList<ProductLike> list = new ArrayList<>();
		      
		      String sql = prop.getProperty("productLikeList");
		      
		      try {
		         pstmt=conn.prepareStatement(sql);
		         
		         pstmt.setInt(1, memberNo);
		         
		         rset=pstmt.executeQuery();
		         
		         while(rset.next()) {
		            
		            list.add(new ProductLike (
		                  rset.getInt("PRODUCT_NO"),
		                  rset.getInt("MEMBER_NO"),
		                  rset.getDate("P_LIKE_DATE"),
		                  rset.getString("PRODUCT_IMG"),
		                  rset.getInt("PRICE"),
		                  rset.getString("PRODUCT_NAME")
		                  ));
		            
		         }
		         
		      } catch (SQLException e) {
		         e.printStackTrace();
		      } finally {
		         close(rset);
		         close(pstmt);
		      }
		      return list;
		   }
	
	   public ArrayList<Order> myOrderList(Connection conn, int memberNo) {
		   
		   ResultSet rset = null;
		   PreparedStatement pstmt = null;
		   ArrayList<Order> list = new ArrayList<>();
		   
		   String sql = prop.getProperty("myOrderList");
		   
		   try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1,memberNo);
			
			rset=pstmt.executeQuery();
			
			while (rset.next()) {
				
				list.add(new Order (
						 rset.getInt("ORDER_NO"),
						 rset.getDate("PAYMENT_DATE"),
						 rset.getString("PRODUCT_IMG"),
						 rset.getString("PRODUCT_NAME"),
						 rset.getInt("PRODUCT_COUNT"),
						 rset.getInt("PRICE"),
						 rset.getInt("STATUS"),
						 rset.getInt("WAYBILL")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	   }
	   
	   public ArrayList<Review> ReviewListY(Connection conn, int memberNo) {
		   
		   ResultSet rset = null;
		   PreparedStatement pstmt = null;
		   ArrayList<Review> list = new ArrayList<>();
		   
		   String sql = prop.getProperty("ReviewListY");
		   
		   try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Review(
						 rset.getInt("REVIEW_NO"),
						 rset.getString("REVIEW_CONTENT1"),
						 rset.getString("REVIEW_CONTENT"),
						 rset.getInt("STAR"),
						 rset.getDate("R_ENROLL_DATE"),
						 rset.getDate("R_MODIFY_DATE"),
						 rset.getString("PRODUCT_NAME"),
						 rset.getString("PRODUCT_IMG")
						)); 
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