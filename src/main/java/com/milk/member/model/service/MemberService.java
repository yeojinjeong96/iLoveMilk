package com.milk.member.model.service;

import java.sql.Connection;

import static com.milk.common.JDBCTemplate.*;

import com.milk.member.model.dao.MemberDao;
import com.milk.member.model.vo.Member;


public class MemberService {
	
	public Member loginMember(String memberId, String memberPwd) {
		
			Connection conn = getConnection();
			Member m = new MemberDao().loginMember(conn, memberId, memberPwd);
			close(conn);
			return m;
		}
	
	public Member findMemberId(String memberName, String email) {
		
		Connection conn = getConnection();
		Member m = new MemberDao().findMemberId(conn, memberName, email);
		close(conn);
		return m;
	}
}
