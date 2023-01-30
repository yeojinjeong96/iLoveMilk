package com.milk.notice.model.service;

import static com.milk.common.JDBCTemplate.close;
import static com.milk.common.JDBCTemplate.commit;
import static com.milk.common.JDBCTemplate.getConnection;
import static com.milk.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.milk.common.model.vo.PageInfo;
import com.milk.notice.model.dao.QADao;
import com.milk.notice.model.vo.Attachment;
import com.milk.notice.model.vo.QA;
public class QAService {
	
	public int insertQuestion(QA q, Attachment at) {
			
		
		Connection conn= getConnection();
		
		int result1= new QADao().insertQuestion(conn, q);
		int result2= 1;
		if(at!=null) {
		 	result2= new QADao().insertAttachment(conn,at);
		}
		if(result1>0 && result2>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1*result2;
	}
	
	public ArrayList<QA> selectQuestionList(PageInfo pi,int memberNo){
		
		Connection conn= getConnection();
		
		ArrayList<QA>list= new QADao().selectQuestionList(conn, pi, memberNo);
		
		close(conn);
		return list;
	}
	
	public int selectQAListCount(int memberNo) {
		
		Connection conn = getConnection();
		
		int result = new QADao().selectQAListCount(conn,memberNo);
		close(conn);
		return result;
	}

}
