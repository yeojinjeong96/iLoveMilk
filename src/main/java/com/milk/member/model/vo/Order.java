package com.milk.member.model.vo;

import java.sql.Date;

public class Order {
	
	private String orderNo;
	private Date paymentDate;
	private String productImg;
	private String productName;
	private int productCount;
	private int price;
	private int status;
	private String waybill;
	private String memberId;
	private int productNo;
	private int memberNo;
	private String orderName;
	private String orderPhone;
	private String orderEmail;
	private String addressName;
	private String address;
	private String addressTel;
	private int usePoint;
	private String courier;
	private String memberName;
	private int count;
	
	
	
	public Order() {}

	public Order(String orderNo, Date paymentDate, String productImg, String productName, int productCount, int price,
			int status, String waybill) {
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
	
	

	public Order(String orderNo, Date paymentDate, int price, String memberId) {
		super();
		this.orderNo = orderNo;
		this.paymentDate = paymentDate;
		this.price = price;
		this.memberId = memberId;
	}
	
	

	public Order(String orderNo, Date paymentDate, String productImg, String productName, int productCount, int price,
			String memberId, int productNo) {
		super();
		this.orderNo = orderNo;
		this.paymentDate = paymentDate;
		this.productImg = productImg;
		this.productName = productName;
		this.productCount = productCount;
		this.price = price;
		this.memberId = memberId;
		this.productNo = productNo;
	}
	
	

	public Order(String orderNo, int status, String waybill, String memberId, int memberNo, String orderName,
			String orderPhone, String orderEmail, String addressName, String address, String addressTel, int usePoint,
			String courier, Date paymentDate) {
		super();
		this.orderNo = orderNo;
		this.status = status;
		this.waybill = waybill;
		this.memberId = memberId;
		this.memberNo = memberNo;
		this.orderName = orderName;
		this.orderPhone = orderPhone;
		this.orderEmail = orderEmail;
		this.addressName = addressName;
		this.address = address;
		this.addressTel = addressTel;
		this.usePoint = usePoint;
		this.courier = courier;
		this.paymentDate = paymentDate;
	}
	
	public Order(String orderNo, int status, String waybill, String memberId, int memberNo, String orderName,
			String orderPhone, String orderEmail, String addressName, String address, String addressTel, int usePoint,
			String courier, Date paymentDate, String memberName) {
		super();
		this.orderNo = orderNo;
		this.status = status;
		this.waybill = waybill;
		this.memberId = memberId;
		this.memberNo = memberNo;
		this.orderName = orderName;
		this.orderPhone = orderPhone;
		this.orderEmail = orderEmail;
		this.addressName = addressName;
		this.address = address;
		this.addressTel = addressTel;
		this.usePoint = usePoint;
		this.courier = courier;
		this.paymentDate = paymentDate;
		this.memberName = memberName;
	}
	
	public Order(String orderNo, String productImg, String productName, int price, int count) {
	      super();
	      this.orderNo = orderNo;
	      this.productImg = productImg;
	      this.productName = productName;
	      this.price = price;
	      this.count = count;
	   }
	
	

	public Order(String orderNo, Date paymentDate, String productImg, String productName, int productCount, int price,
			int status, String waybill, String courier) {
		super();
		this.orderNo = orderNo;
		this.paymentDate = paymentDate;
		this.productImg = productImg;
		this.productName = productName;
		this.productCount = productCount;
		this.price = price;
		this.status = status;
		this.waybill = waybill;
		this.courier = courier;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
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

	public String getWaybill() {
		return waybill;
	}

	public void setWaybill(String waybill) {
		this.waybill = waybill;
	}
	
	

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	
	

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getOrderName() {
		return orderName;
	}

	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}

	public String getOrderPhone() {
		return orderPhone;
	}

	public void setOrderPhone(String orderPhone) {
		this.orderPhone = orderPhone;
	}

	public String getOrderEmail() {
		return orderEmail;
	}

	public void setOrderEmail(String orderEmail) {
		this.orderEmail = orderEmail;
	}

	public String getAddressName() {
		return addressName;
	}

	public void setAddressName(String addressName) {
		this.addressName = addressName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddressTel() {
		return addressTel;
	}

	public void setAddressTel(String addressTel) {
		this.addressTel = addressTel;
	}

	public int getUsePoint() {
		return usePoint;
	}

	public void setUsePoint(int usePoint) {
		this.usePoint = usePoint;
	}

	public String getCourier() {
		return courier;
	}

	public void setCourier(String courier) {
		this.courier = courier;
	}
	
	public int getCount() {
	    return count;
	}

	public void setCount(int count) {
	    this.count = count;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", paymentDate=" + paymentDate + ", productImg=" + productImg
				+ ", productName=" + productName + ", productCount=" + productCount + ", price=" + price + ", status="
				+ status + ", waybill=" + waybill + ", memberId=" + memberId + ", productNo=" + productNo
				+ ", memberNo=" + memberNo + ", orderName=" + orderName + ", orderPhone=" + orderPhone + ", orderEmail="
				+ orderEmail + ", addressName=" + addressName + ", address=" + address + ", addressTel=" + addressTel
				+ ", usePoint=" + usePoint + ", courier=" + courier + ", memberName=" + memberName + ", count=" + count
				+ "]";
	}

	

	




	
	


}
