package com.milk.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.milk.common.MyFileRenamePolicy;
import com.milk.notice.model.service.NoticeService;
import com.milk.notice.model.vo.Attachment;
import com.milk.notice.model.vo.Notice;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class NoticeUpdateController
 */
@WebServlet("/update.no")
public class NoticeUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize= 10*30*1024;
			String savePath= request.getSession().getServletContext().getRealPath("/resources/notice_upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request,savePath,maxSize,"UTF-8",new MyFileRenamePolicy());
			
			
			
			int noticeNo= Integer.parseInt( multiRequest.getParameter("noticeNo"));
			String title=multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			
			Notice n= new Notice();
			n.setNoticeNo(noticeNo);
			n.setNoticeTitle(title);
			n.setNoticeContent(content);
			
			
			Attachment at =null;
			
			if(multiRequest.getOriginalFileName("upfile")!=null) {//넘어온파일있음
				at= new Attachment();
				at.setChangeName(multiRequest.getFilesystemName("upfile"));
				at.setFilePath("resources/notice_upfiles/");
				
				if(multiRequest.getParameter("changeName")!=null) {//기존파일있음
					at.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
				}else {//기존파일없음
					at.setRefNo(noticeNo);
				}
			
			}
		
			
			
			int result= new NoticeService().updateNotice(n,at);
			
			if(result>0) {
				request.getSession().setAttribute("alertMsg", "공지사항 수정 성공");
				response.sendRedirect(request.getContextPath()+"/listM.no?cpage=1");
			}else {
				
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
