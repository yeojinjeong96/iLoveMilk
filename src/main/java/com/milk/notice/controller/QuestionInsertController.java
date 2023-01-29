package com.milk.notice.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.milk.common.MyFileRenamePolicy;
import com.milk.member.model.vo.Member;
import com.milk.notice.model.service.QAService;
import com.milk.notice.model.vo.Attachment;
import com.milk.notice.model.vo.QA;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class QuestionInsertController
 */
@WebServlet("/insert.qa")
public class QuestionInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize= 10*30*1024;
			String savePath= request.getSession().getServletContext().getRealPath("/resources/question_upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request,savePath,maxSize,"UTF-8",new MyFileRenamePolicy());
			
			String qTitle=multiRequest.getParameter("title");
			String qContent= multiRequest.getParameter("content");
			HttpSession session = request.getSession();
			int memberNo=((Member)session.getAttribute("memberNo")).getMemberNo();
			String fCate = multiRequest.getParameter("fCate");
			String sCate = multiRequest.getParameter("sCate");
			
			QA q = new QA();
			q.setqTitle(qTitle);
			q.setqContent(qContent);
			q.setqWriter(memberNo);
			q.setfCategory(fCate);
			q.setsCategory(sCate);
			
			Attachment at= null;
			
			if(multiRequest.getOriginalFileName("upfile")!=null) {
				at= new Attachment();
				at.setChangeName(multiRequest.getFilesystemName("upfile"));
				at.setFilePath("resources/question_upfiles/");
				
			}
			
			int result= new QAService().insertQuestion(q,at);
			
			if(result>0) {
				session.setAttribute("alertMsg", "문의가 성공적으로 등록되었습니다.");
				response.sendRedirect(request.getContextPath());
				
			}else {
				
				 if(at!=null) {
					 new File(savePath + at.getChangeName()).delete(); 
				 }
				session.setAttribute("alertMsg", "문의 등록에 실패하였습니다.");	
				response.sendRedirect(request.getContextPath());
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
