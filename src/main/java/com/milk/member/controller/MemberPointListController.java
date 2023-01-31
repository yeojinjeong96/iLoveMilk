package com.milk.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.milk.common.model.vo.PageInfo;
import com.milk.member.model.service.MemberService;
import com.milk.member.model.vo.Point;

/**
 * Servlet implementation class MemberPointListController
 */
@WebServlet("/memPoint.ma")
public class MemberPointListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberPointListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int memNo = Integer.parseInt(request.getParameter("memNo"));
		int currentPage = Integer.parseInt(request.getParameter("ppage"));
		int listCount = new MemberService().selectPointListCount(memNo);
		int pageLimit = 10;
		int boardLimit = 5;
		int maxPage = (int)Math.ceil((double)listCount/boardLimit);
		int startPage = (currentPage -1) / pageLimit * pageLimit +1;
		int endPage = startPage + pageLimit -1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		ArrayList<Point> list = new MemberService().selectPointList(pi, memNo);
		
		response.setContentType ("application/jsonl charset-UTF-8");
		new Gson().toJson(list,response.getWriter());
		new Gson().toJson(pi,response.getWriter());

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
