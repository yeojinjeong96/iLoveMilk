package com.milk.notice.model.service;

import static com.milk.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.milk.notice.model.dao.NoticeDao;

public class NoticeService {
	
	
	public int selectNoticeListCount() {
		
		Connection conn = getConnection();
		int listCount= new NoticeDao().selectNoticeListCount(conn);
		
		return listCount;
		
	}

}
