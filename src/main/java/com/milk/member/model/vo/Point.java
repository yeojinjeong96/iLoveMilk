package com.milk.member.model.vo;

public class Point {
	
	private int pointNo;
	private int amount;
	private String status;
	private int total;
	private String modifyDate;
	private String content;
	private String orderNo;
	private int memberNo;
	
	public Point () {}

	public Point(int pointNo, int amount, String status, int total, String modifyDate, String content, String orderNo,
			int memberNo) {
		super();
		this.pointNo = pointNo;
		this.amount = amount;
		this.status = status;
		this.total = total;
		this.modifyDate = modifyDate;
		this.content = content;
		this.orderNo = orderNo;
		this.memberNo = memberNo;
	}
	
	
	

	public Point(int pointNo, int amount, String status, int total, String modifyDate, String content, int memberNo) {
		super();
		this.pointNo = pointNo;
		this.amount = amount;
		this.status = status;
		this.total = total;
		this.modifyDate = modifyDate;
		this.content = content;
		this.memberNo = memberNo;
	}

	public int getPointNo() {
		return pointNo;
	}

	public void setPointNo(int pointNo) {
		this.pointNo = pointNo;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "Point [pointNo=" + pointNo + ", amount=" + amount + ", status=" + status + ", total=" + total
				+ ", modifyDate=" + modifyDate + ", content=" + content + ", orderNo=" + orderNo + ", memberNo="
				+ memberNo + "]";
	}
	
	

}
