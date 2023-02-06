package com.milk.product.model.vo;

public class Payment {
	private int num;
	private String orderNo;
	private String paymentDate;
	private String memberId;
	private String status;
	
	public Payment() {}

	public Payment(int num, String orderNo, String paymentDate, String memberId, String status) {
		super();
		this.num = num;
		this.orderNo = orderNo;
		this.paymentDate = paymentDate;
		this.memberId = memberId;
		this.status = status;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Payment [num=" + num + ", orderNo=" + orderNo + ", paymentDate=" + paymentDate + ", memberId="
				+ memberId + ", status=" + status + "]";
	}
}
