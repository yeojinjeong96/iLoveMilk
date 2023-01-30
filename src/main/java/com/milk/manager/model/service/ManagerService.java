package com.milk.manager.model.service;

import static com.milk.common.JDBCTemplate.close;
import static com.milk.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.milk.manager.model.dao.ManagerDao;
import com.milk.manager.model.vo.Manager;

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
}
