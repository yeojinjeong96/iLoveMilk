package com.milk.notice.model.service;

import static com.milk.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.milk.common.model.vo.PageInfo;
import com.milk.notice.model.dao.FaqDao;
import com.milk.notice.model.vo.Faq;


public class FaqService {
	
	public int selectFaqListCount(String category) {
		Connection conn = getConnection();
		
		int listCount = new FaqDao().selectFaqListCount(conn,category);
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
	
	public ArrayList<Faq> selectManagerFaqList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Faq>list= new FaqDao().selectManagerFaqList(conn,pi);
		
		close(conn);
		return list;
		
	}
	
	public int deleteFaq(String delNo) {
		
		Connection conn= getConnection();
		
		int result = new FaqDao().deleteFaq(conn, delNo);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	public int selectSearchListCount(String searchFaq) {
		Connection conn = getConnection();
		
		int listCount = new FaqDao().selectSearchListCount(conn,searchFaq);
		close(conn);
		return listCount;
		
	}
	
	public ArrayList<Faq> selectSearchList(PageInfo pi, String searchFaq){
		Connection conn= getConnection();
		ArrayList<Faq>list= new FaqDao().selectSearchList(conn,pi,searchFaq);
		close(conn);
		return list;
	}
	
	public int insertFaq(Faq f) {
		
		Connection conn = getConnection();
		int result = new FaqDao().insertFaq(conn, f);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}
	
	public Faq selectFaq(int faqNo) {
		
		Connection conn= getConnection();
		Faq f = new FaqDao().selectFaq(conn,faqNo);
		
		close(conn);
		return f;
	}
	
}
