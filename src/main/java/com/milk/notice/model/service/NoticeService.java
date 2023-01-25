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
		
		return listCount;
		
	}
	
	public ArrayList<Notice> selectNoticeList(PageInfo pi){
		
		Connection conn= getConnection();
		ArrayList<Notice>list= new NoticeDao().selectNoticeList(conn,pi);
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
}
