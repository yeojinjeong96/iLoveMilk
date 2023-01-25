package com.milk.product.model.service;

import static com.milk.common.JDBCTemplate.*;

import com.milk.product.model.dao.ProductDao;

public class ProductService {
	
	public int selectListCount(String category) {
		
		Connection conn = getConnction();
		int listCount = new ProductDao().selectListCount(conn, category);
		
	}

}
