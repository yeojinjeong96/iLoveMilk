package com.milk.manager.model.service;

import static com.milk.common.JDBCTemplate.close;
import static com.milk.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.milk.manager.model.dao.ManagerDao;
import com.milk.manager.model.vo.Manager;
import com.milk.member.model.dao.MemberDao;
import com.milk.product.model.vo.Payment;
import com.milk.product.model.vo.Product;

public class ManagerService {
	/**
	 * 매니저 로그인
	 * @author 승하
	 * @return 로그인 한 Manager 객체
	 */
	public Manager managerLogin(String managerId, String managerPwd) {
		Connection conn = getConnection();
		Manager m = new ManagerDao().managerLogin(conn, managerId, managerPwd);
		close(conn);
		return m;
	}
	
	/**
	 * 메인페이지 재고부족상품 리스트
	 * @author 승하
	 * @return ArrayList
	 */
	public ArrayList<Product> needReceivingProduct(){
		Connection conn = getConnection();
		ArrayList<Product> list = new ManagerDao().needReceivingProduct(conn);
		close(conn);
		return list;
	}
	
	/**
	 * 메인페이지 최근주문목록 리스트
	 * @author 승하
	 * @return ArrayList
	 */
	public ArrayList<Payment> recentPayment(){
		Connection conn = getConnection();
		ArrayList<Payment> list = new ManagerDao().recentPayment(conn);
		close(conn);
		return list;
	}
}
