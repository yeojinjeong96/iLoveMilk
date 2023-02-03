package com.milk.notice.model.service;

import static com.milk.common.JDBCTemplate.*;
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
	
	public ArrayList<QA> selectQuestionList(PageInfo pi,int memberNo ){
		
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
	
	public QA selectQA(int qNo) {
		Connection conn = getConnection();
		
		QA q = new QADao().selectQA(conn, qNo);
		close(conn);
		return q;
	}
	
	public Attachment selectAttachment(int qNo) {
		Connection conn = getConnection();
		Attachment at = new QADao().selectAttachment(conn, qNo);
		close(conn);
		return at;
	}

	public ArrayList<QA> selectIncompletedList(PageInfo pi,String value){
		Connection conn= getConnection();
		
		ArrayList<QA>list= new QADao().selectIncompletedList(conn, pi,value);
		
		close(conn);
		return list;
		
	}
	
	public int enrollAnswer(QA q) {
		
		Connection conn= getConnection();
		int result = new QADao().enrollAnswer(conn, q);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}
	
	public int selectAnswerListCount(int date) {
		
		Connection conn = getConnection();
		
		int result = new QADao().selectAnswerListCount(conn,date);
		close(conn);
		return result;
	}
	
	public ArrayList<QA> selectAnswerList(PageInfo pi,int date){
		
		Connection conn= getConnection();
		
		ArrayList<QA>list= new QADao().selectAnswerList(conn, pi,date);
		
		close(conn);
		return list;
	}
	
	public int deleteQuestion(int qNo) {
		Connection conn= getConnection();
		int result = new QADao().deleteQuestion(conn, qNo);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}
	
	public int updateQuestion(QA q, Attachment at) {
		
		Connection conn= getConnection();
		int result1 = new QADao().updateQuestion(conn, q);
		
		int result2 = 1;
	
		if(at!=null) {
			
			if(at.getFileNo()!=0) {
				result2= new QADao().updateAttachment(conn, at);
			}else {
				result2= new QADao().insertNewAttachment(conn, at);
			}

		}	
	
		
		
		if(result1*result2>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result1*result2;
	}
	
}
