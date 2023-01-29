package com.milk.notice.model.service;

import static com.milk.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

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
		
		return result1*result2;
	}
	
	public ArrayList<QA> selectQuestionList(int memberNo){
		
		Connection conn= getConnection();
		
		ArrayList<QA>list= new QADao().selectQuestionList(conn, memberNo);
		
		close(conn);
		return list;
	}

}
