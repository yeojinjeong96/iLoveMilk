package com.milk.product.model.vo;

public class OrderInfo {
	private String orderNo;
	private int memberNo;
	private String orderName;
	private String orderPhone;
	private String orderEmail;
	private String addressName;
	private String address;
	private String addressTel;
	private int usePoint;
	private int status;
	private String courier;
	private int waybill;
	
	public OrderInfo() {}

	public OrderInfo(String orderNo, int memberNo, String orderName, String orderPhone, String orderEmail,
			String addressName, String address, String addressTel, int usePoint, int status, String courier,
			int waybill) {
		super();
		this.orderNo = orderNo;
		this.memberNo = memberNo;
		this.orderName = orderName;
		this.orderPhone = orderPhone;
		this.orderEmail = orderEmail;
		this.addressName = addressName;
		this.address = address;
		this.addressTel = addressTel;
		this.usePoint = usePoint;
		this.status = status;
		this.courier = courier;
		this.waybill = waybill;
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

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getCourier() {
		return courier;
	}

	public void setCourier(String courier) {
		this.courier = courier;
	}

	public int getWaybill() {
		return waybill;
	}

	public void setWaybill(int waybill) {
		this.waybill = waybill;
	}

	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", memberNo=" + memberNo + ", orderName=" + orderName + ", orderPhone="
				+ orderPhone + ", orderEmail=" + orderEmail + ", addressName=" + addressName + ", address=" + address
				+ ", addressTel=" + addressTel + ", usePoint=" + usePoint + ", status=" + status + ", courier="
				+ courier + ", waybill=" + waybill + "]";
	}
}
