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
	
	public ArrayList<Faq> selectFaqList(PageInfo pi,String category){
		Connection conn = getConnection();
		ArrayList<Faq>list= new FaqDao().selectFaqList(conn,pi,category);
		
		close(conn);
		return list;
		
	}
	
	public ArrayList<Faq> selectBestFaqList(PageInfo pi,String category){
		Connection conn = getConnection();
		ArrayList<Faq>list= new FaqDao().selectBestFaqList(conn,pi,category);
		
		close(conn);
		return list;
		
	}
	public int selectBestFaqListCount(String category) {
		Connection conn = getConnection();
		
		int listCount = new FaqDao().selectBestFaqListCount(conn,category);
		close(conn);
		return listCount;
		
	}
	
}
