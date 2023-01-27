package com.milk.notice.model.service;

import static com.milk.common.JDBCTemplate.close;
import static com.milk.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.milk.common.model.vo.PageInfo;
import com.milk.notice.model.dao.FaqDao;
import com.milk.notice.model.vo.Faq;

public class FaqService {
	
	public int selectFaqListCount() {
		Connection conn = getConnection();
		
		int listCount = new FaqDao().selectFaqListCount(conn);
		close(conn);
		return listCount;
		
	}
	
	public ArrayList<Faq> selectFaqList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Faq>list= new FaqDao().selectFaqList(conn,pi);
		
		close(conn);
		return list;
		
	}
}
