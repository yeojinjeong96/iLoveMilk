package com.milk.product.model.service;

import static com.milk.common.JDBCTemplate.*;

import java.sql.Connection;

import com.milk.product.model.dao.ProductDao;

public class ProductService {
	
	public int selectListCount(String category) {
		
		Connection conn = getConnection();
		int listCount = new ProductDao().selectListCount(conn, category);
		
		close(conn);
		return listCount;
		
	}
	
	public ArrayList<Product> selectProductList(PageInfo pi, String category){
		
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectProductList(conn, pi, category);
 		
		close(conn);
		return list;
		
	}
	


}
