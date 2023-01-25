package com.milk.product.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

import com.milk.product.model.vo.Product;

public class ProductDao {
	
	private Properties prop = new Properties();
	
	public ProductDao() {
		try {
			prop.loadFromXML(new FileInputStream(Product.class.getResource("db/sql/product-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectListCount() {
		
	}

}
