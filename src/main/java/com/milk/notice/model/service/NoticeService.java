package com.milk.notice.model.service;

import static com.milk.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.milk.common.model.vo.PageInfo;
import com.milk.notice.model.dao.NoticeDao;
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
}
