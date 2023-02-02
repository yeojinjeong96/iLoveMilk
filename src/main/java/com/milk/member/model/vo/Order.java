package com.milk.member.model.vo;

import java.sql.Date;

public class Order {
	
	private int orderNo;
	private Date paymentDate;
	private String productImg;
	private String productName;
	private int productCount;
	private int price;
	private int status;
	private int waybill;
	
	public Order() {}

	public Order(int orderNo, Date paymentDate, String productImg, String productName, int productCount, int price,
			int status, int waybill) {
		super();
		this.orderNo = orderNo;
		this.paymentDate = paymentDate;
		this.productImg = productImg;
		this.productName = productName;
		this.productCount = productCount;
		this.price = price;
		this.status = status;
		this.waybill = waybill;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public Date getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}

	public String getProductImg() {
		return productImg;
	}

	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductCount() {
		return productCount;
	}

	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getWaybill() {
		return waybill;
	}

	public void setWaybill(int waybill) {
		this.waybill = waybill;
	}

	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", paymentDate=" + paymentDate + ", productImg=" + productImg
				+ ", productName=" + productName + ", productCount=" + productCount + ", price=" + price + ", status="
				+ status + ", waybill=" + waybill + "]";
	};
	
	
	


}
