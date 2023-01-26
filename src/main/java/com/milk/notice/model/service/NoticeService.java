package com.milk.notice.model.service;

import static com.milk.common.JDBCTemplate.*;
import static com.milk.common.JDBCTemplate.commit;
import static com.milk.common.JDBCTemplate.getConnection;
import static com.milk.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.milk.common.model.vo.PageInfo;
import com.milk.notice.model.dao.NoticeDao;
import com.milk.notice.model.vo.Attachment;
import com.milk.notice.model.vo.Notice;

public class NoticeService {
	
	
	public int selectNoticeListCount() {
		
		Connection conn = getConnection();
		int listCount= new NoticeDao().selectNoticeListCount(conn);
		close(conn);
		return listCount;
		
	}
	
	public ArrayList<Notice> selectNoticeList(PageInfo pi){
		
		Connection conn= getConnection();
		ArrayList<Notice>list= new NoticeDao().selectNoticeList(conn,pi);
		close(conn);
		return list;
	}
	
	public int increaseCount(int noticeNo) {
		Connection conn = getConnection();
		int result= new NoticeDao().increaseCount(conn, noticeNo);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public Notice selectNotice(int noticeNo) {
		Connection conn = getConnection();
		Notice n = new NoticeDao().selectNotice(conn, noticeNo);
		close(conn);
		return n;
	}
	
	public Attachment selectAttachment(int noticeNo) {
		Connection conn = getConnection();
		Attachment at = new NoticeDao().selectAttachment(conn, noticeNo);
		close(conn);
		return at;
	}
	
	public int insertNotice(Notice n, Attachment at) {
		
		Connection conn = getConnection();
		int result1= new NoticeDao().insertNotice(conn,n);
		
		int result2=1;
		if(at != null) {
			 result2= new NoticeDao().insertAttachment(conn,at);
		}
		
		if(result1*result2>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result1 * result2;
		
	}
	
	public ArrayList<Notice> selectSearchList(PageInfo pi,String searchNo){
		
		Connection conn= getConnection();
		ArrayList<Notice>list= new NoticeDao().selectSearchList(conn,pi,searchNo);
		close(conn);
		return list;
		
	}
	

}
