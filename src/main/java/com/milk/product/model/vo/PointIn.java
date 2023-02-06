package com.milk.product.model.vo;

public class PointIn {
	private int amount;
	private String status;
	private int total;
	private String content;
	private String orderNo;
	private int memNo;
	
	public PointIn() {}
	public PointIn(int amount, String status, int total, String content, String orderNo, int memNo) {
		super();
		this.amount = amount;
		this.status = status;
		this.total = total;
		this.content = content;
		this.orderNo = orderNo;
		this.memNo = memNo;
	}
	
	public PointIn(int amount, String status, String content, String orderNo, int memNo) {
		super();
		this.amount = amount;
		this.status = status;
		this.content = content;
		this.orderNo = orderNo;
		this.memNo = memNo;
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
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	@Override
	public String toString() {
		return "Point [amount=" + amount + ", status=" + status + ", total=" + total + ", content=" + content
				+ ", orderNo=" + orderNo + ", memNo=" + memNo + "]";
	}
}
