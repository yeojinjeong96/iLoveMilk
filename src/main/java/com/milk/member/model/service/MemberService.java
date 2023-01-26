package com.milk.member.model.service;

import java.sql.Connection;


import static com.milk.common.JDBCTemplate.*;

import com.milk.member.model.dao.MemberDao;
import com.milk.member.model.vo.Member;


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
	
}
