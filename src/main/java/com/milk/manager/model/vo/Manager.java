package com.milk.manager.model.vo;

public class Manager {
	private int managerNo;
	private String managerId;
	private String managerPwd;
	private String managerName;
	private String managerPhone;
	private String managerEmail;
	private String status;
	
	public Manager() {}

	public Manager(int managerNo, String managerId, String managerPwd, String managerName, String managerPhone,
			String managerEmail, String status) {
		super();
		this.managerNo = managerNo;
		this.managerId = managerId;
		this.managerPwd = managerPwd;
		this.managerName = managerName;
		this.managerPhone = managerPhone;
		this.managerEmail = managerEmail;
		this.status = status;
	}

	public int getManagerNo() {
		return managerNo;
	}

	public void setManagerNo(int managerNo) {
		this.managerNo = managerNo;
	}

	public String getManagerId() {
		return managerId;
	}

	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}

	public String getManagerPwd() {
		return managerPwd;
	}

	public void setManagerPwd(String managerPwd) {
		this.managerPwd = managerPwd;
	}

	public String getManagerName() {
		return managerName;
	}

	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}

	public String getManagerPhone() {
		return managerPhone;
	}

	public void setManagerPhone(String managerPhone) {
		this.managerPhone = managerPhone;
	}

	public String getManagerEmail() {
		return managerEmail;
	}

	public void setManagerEmail(String managerEmail) {
		this.managerEmail = managerEmail;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Manager [managerNo=" + managerNo + ", managerId=" + managerId + ", managerPwd=" + managerPwd
				+ ", managerName=" + managerName + ", managerPhone=" + managerPhone + ", managerEmail=" + managerEmail
				+ ", status=" + status + "]";
	}
}
