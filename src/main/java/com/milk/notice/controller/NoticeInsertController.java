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
import com.milk.manager.model.vo.Manager;
import com.milk.notice.model.service.NoticeService;
import com.milk.notice.model.vo.Attachment;
import com.milk.notice.model.vo.Notice;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class NoticeInsertController
 */
@WebServlet("/insert.no")
public class NoticeInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize= 10*10*1024;
			String savePath= request.getSession().getServletContext().getRealPath("/resources/notice_upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request,savePath,maxSize,"UTF-8",new MyFileRenamePolicy());
			
			String noticeTitle=multiRequest.getParameter("title");
			String noticeContent= multiRequest.getParameter("content");
			HttpSession session = request.getSession();
			int ManagerNo= ((Manager)session.getAttribute("loginManager")).getManagerNo();
			
			Notice n = new Notice();
			n.setNoticeTitle(noticeTitle);
			n.setNoticeContent(noticeContent);
			n.setWriterNo(ManagerNo);
			
			Attachment at= null;
			
			if(multiRequest.getOriginalFileName("upfile")!=null) {
				at= new Attachment();
				at.setChangeName(multiRequest.getFilesystemName("upfile"));
				at.setFilePath("resources/notice_upfiles/");
				
			}
			
			int result= new NoticeService().insertNotice(n,at);
			
			if(result>0) {
				session.setAttribute("alertMsg", "공지사항 입력 성공.");
				response.sendRedirect(request.getContextPath()+"/listM.no?cpage=1");
				
			}else {
				
				 if(at!=null) {
					 new File(savePath + at.getChangeName()).delete(); 
				 }
				session.setAttribute("alertMsg", "공지사항 입력에 실패하셨습니다.");	
				request.getRequestDispatcher("views/notice/notice/noticeListManagerView.jsp").forward(request, response);
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
