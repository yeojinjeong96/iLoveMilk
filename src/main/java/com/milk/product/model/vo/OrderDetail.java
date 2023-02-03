package com.milk.product.model.vo;

public class OrderDetail {
	private int dorderNo;
	private String orderNo;
	private int productNo;
	private int count;
	private String reviewStatus;
	
	public OrderDetail() {}
	
	public OrderDetail(int dorderNo, String orderNo, int productNo, int count, String reviewStatus) {
		super();
		this.dorderNo = dorderNo;
		this.orderNo = orderNo;
		this.productNo = productNo;
		this.count = count;
		this.reviewStatus = reviewStatus;
	}

	public int getDorderNo() {
		return dorderNo;
	}

	public void setDorderNo(int dorderNo) {
		this.dorderNo = dorderNo;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getReviewStatus() {
		return reviewStatus;
	}

	public void setReviewStatus(String reviewStatus) {
		this.reviewStatus = reviewStatus;
	}

	@Override
	public String toString() {
		return "OrderDetail [dorderNo=" + dorderNo + ", orderNo=" + orderNo + ", productNo=" + productNo + ", count="
				+ count + ", reviewStatus=" + reviewStatus + "]";
	}
}
