package com.milk.member.model.service;

import static com.milk.common.JDBCTemplate.close;
import static com.milk.common.JDBCTemplate.commit;
import static com.milk.common.JDBCTemplate.getConnection;
import static com.milk.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.sql.Date;

import com.milk.common.model.vo.PageInfo;
import com.milk.member.model.dao.MemberDao;
import com.milk.member.model.vo.Member;
import com.milk.member.model.vo.Order;
import com.milk.member.model.vo.Point;
import com.milk.member.model.vo.Report;
import com.milk.product.model.vo.ProductLike;


public class MemberService {
	
	/**
	 * 로그인 서비스
	 */
	public Member loginMember(String memberId, String memberPwd) {
		
			Connection conn = getConnection();
			Member m = new MemberDao().loginMember(conn, memberId, memberPwd);
			close(conn);
			return m;
		}
	
	/**
	 * 아이디 찾기 서비스 
	 */
	public Member findMemberId(String memberName, String email) {
		
		Connection conn = getConnection();
		Member m = new MemberDao().findMemberId(conn, memberName, email);
		close(conn);
		return m;
	}
	
	/**
	 * 아이디 중복확인 서비스 
	 */
	
	public int idCheck(String checkId) {
		Connection conn = getConnection();
		int count = new MemberDao().idCheck(conn, checkId);
		close(conn);
		return count;
	}
	
	/**
	 * 회원가입 서비스 
	 */
	
	public int insertMember (Member m) {
		Connection conn = getConnection();
		int result = new MemberDao().insertMember(conn, m);
		
		if(result > 0) { // 성공
			commit(conn);
		}else { // 실패
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	/**
	 * 회원정보변경 비밀번호 확인 서비스 
	 */
	public Member updateCheckPwd(String memberId, String memberPwd) {
		
		Connection conn = getConnection();
		Member m = new MemberDao().updateCheckPwd(conn, memberId, memberPwd);
		close(conn);
		return m;
	}
	
	/**
	 * 회원정보변경 확인 서비스 
	 */
//	public Attachment selectAttachment(int memberNo){
//		Connection conn = getConnection();
//		Attachment at = new MemberDao().selectAttachment(conn, memberNo);
//		close(conn);
//		return at;
//	}
//	
	
	public Member updateMember(Member m){
		
		Connection conn = getConnection();
		int result = new MemberDao().updateMember(conn, m);
		
		Member updateMem = null;
		
		if(result > 0) {
			commit(conn);
			updateMem = new MemberDao().selectMember(conn, m.getMemberId());
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return updateMem;
		
	}
	
	public Member updatePwdMember(String memberId, String memberPwd, String updatePwd) {
		Connection conn = getConnection();
		int result = new MemberDao().updatePwdMember(conn, memberId, memberPwd, updatePwd);
		
		Member updateMem = null;
		
		if(result > 0) {
			commit(conn);
			updateMem = new MemberDao().selectMember(conn, memberId);
		}else {
			rollback(conn);
		}
		
		close(conn);
	
		return updateMem;
	}
	
	
	/**
	 * 회원정보삭제 서비스 
	 */
	
	public int MemberDelete(String memberId, String memberPwd) {
		Connection conn = getConnection();
		int result = new MemberDao().MemberDelete(conn, memberId, memberPwd);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
	
		return result;
		
		
		
	}
	
	/**
	 * 페이징처리를 위한 회원 리스트 수 조회
	 * @author 이다혜
	 * @return listCount
 	 */
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new MemberDao().selectListCount(conn);
		close(conn);
		return listCount;
	}
	
	/**
	 * 회원조회를 위한 전체회원 가져오기
	 * @author 이다혜
	 * @return list
	 */
	public ArrayList<Member> selectMemberList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Member> list = new MemberDao().selectMemberList(conn, pi);
		close(conn);
		return list;
	}
	
	/**
	 * 회원별 포인트적립내역 페이징처리를 위한 카운드
	 * @author 이다혜
	 * @return listCount
	 */
	public int selectPointListCount(int memNo) {
		Connection conn = getConnection();
		int listCount = new MemberDao().selectPointListCount(conn, memNo);
		close(conn);
		return listCount;
	}
	
	/**
	 * 회원별 포인트 적립내역
	 * @author 이다혜
	 * @return ArrayList<Point> list
	 */
	public ArrayList<Point> selectPointList(PageInfo pi, int memNo){
		Connection conn = getConnection();
		ArrayList<Point> list = new MemberDao().selectPointList(conn,pi, memNo);
		close(conn);
		return list;
	}
	
	/**
	 * 회원 신고내역 페이징처리를 위한 카운트
	 * @author 이다혜
	 * @return listCount
	 */
	public int selectReportListCount() {
		Connection conn = getConnection();
		int listCount = new MemberDao().selectReportListCount(conn);
		
		close(conn);
		return listCount;
	}
	
	/**
	 * 회원 신고내역 리스트 조회
	 * @author 이다혜
	 * @return
	 */
	public ArrayList<Report> selectMemberReportList(PageInfo pi){
		
		Connection conn = getConnection();
		ArrayList<Report> list = new MemberDao().selectMemberReportList(conn, pi);
		close(conn);
		return list;
	}
	
	/**
	 * 회원 아이디검색시 페이징처리를 위한 카운트
	 * @author 이다헤
	 * @return listCount
	 */
	public int selectMemberSearchCount(String keyword) {
		Connection conn = getConnection();
		int listCount = new MemberDao().selectMemberSearchCount(conn, keyword);
		close(conn);
		return listCount;
	}
	
	/**
	 * 회원 아이디 검색결과
	 * @author 이다헤
	 * @return list
	 */
	public ArrayList<Member> selectSearchMemberList (PageInfo pi, String keyword){
		Connection conn = getConnection();
		ArrayList<Member> list = new MemberDao().selectSearchMemberList(conn, pi, keyword);
		close(conn);
		return list;
	}
	
	
	/**
	 * 회원 포인트 적립액 변경
	 * @author 이다혜
	 * @return int result
	 */
	public int memberPointChange(Point p) {
		Connection conn = getConnection();
		int result = new MemberDao().memberPointChange(conn, p);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	/**
	 * 회원신고처리를 위한 회원정보 조회
	 * @author 이다혜
	 * @return Report객체
	 */
	public Report selectReportDetail(int memNo) {
		Connection conn = getConnection();
		Report r = new MemberDao().selectReportDetail(conn, memNo);
		
		close(conn);
		return r;
	}
	
	/**
	 * 회원 블랙리스트 추가
	 * @author 이다혜
	 * @return result
	 */
	public int insertBlackList(String memId, String modifyDate) {
		
		Connection conn = getConnection();
		int result = new MemberDao().insertBlackList(conn, memId, modifyDate);
		
		if(result > 0) {
			commit(conn);
		}else{
			rollback(conn);
		}
		return result;
	}
	
	
	/**
	 * 회원 신고내역 삭제
	 * @author 이다혜
 	 * @return result
	 */
	public int deleteMemberReport(int no) {
		Connection conn = getConnection();
		int result = new MemberDao().deleteMemberReport(conn, no);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}
	
	/** 블랙리스트인 회원 전체 조회
	 * @author 이다혜
	 * @return list
	 */
	public ArrayList<Member> selectBlackList(){
		Connection conn = getConnection();
		ArrayList<Member> list = new MemberDao().selectBlackList(conn);
		
		close(conn);
		return list;
	}

	 /**
	  * 회원프로필 변경 서비스 
	  */
	   
	   public int UpdateProfile(Member m) {
	      Connection conn = getConnection();
	      int result = new MemberDao().UpdateProfile(conn, m);
	      
	      if(result > 0) {
	         commit(conn);
	      }else {
	         rollback(conn);
	      }
	      
	      close(conn);
	   
	      return result;
	      }
	   
	 /**
	  * 찜한상품 조회 서비스 
	  */
	   public ArrayList<ProductLike> productLikeList(int memberNo){
			Connection conn = getConnection();
			ArrayList<ProductLike> list = new MemberDao().productLikeList(conn, memberNo);
			close(conn);
			return list;
	   }
	   
	  /**
		* 찜한상품 조회 서비스 
		*/
	   
	   public ArrayList<Order> MyOrderList(int memberNo){
			Connection conn = getConnection();
			ArrayList<Order> list = new MemberDao().myOrderList(conn, memberNo);
			close(conn);
			
			return list;
		   }
	   
	   
}
