package com.milk.product.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.milk.common.MyFileRenamePolicy;
import com.milk.product.model.service.ProductService;
import com.milk.product.model.vo.Product;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ProductInsertController
 */
@WebServlet("/insert.pr")
public class ManagerProductInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerProductInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10 * 1024 * 1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/product_upfiles/");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String pName = multiRequest.getParameter("productName");
			int price = Integer.parseInt(multiRequest.getParameter("price"));
			int capacity = Integer.parseInt(multiRequest.getParameter("capacity"));
			String brand = multiRequest.getParameter("brand");
			String pInfo = multiRequest.getParameter("productInfo");
			int stock = Integer.parseInt(multiRequest.getParameter("stock"));
			String fCate = multiRequest.getParameter("fCate");
			String sCate = multiRequest.getParameter("sCate");
			String pImg = "resources/product_upfiles/" + multiRequest.getFilesystemName("productImg");
			
			Product p = new Product(pName, price, capacity, brand, pInfo, stock, fCate, sCate, pImg);
			
			int result = new ProductService().insertProduct(p);
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "상품 등록 성공");
				response.sendRedirect(request.getContextPath() + "/listUpDeRe.pr?cp=1");
			} else {
				new File(savePath + multiRequest.getFilesystemName("productImg")).delete();
				request.getSession().setAttribute("alertMsg", "상품 등록 실패");
				response.sendRedirect(request.getContextPath() + "/listUpDeRe.pr?cp=1");
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
