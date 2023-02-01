package com.milk.product.model.vo;

import java.util.Date;

public class ProductLike {
	
	private int productNo;
	private int memberNo;
	private Date pLikeDate;
	private int count;
	private String productImg;
	private int price;
	private String productName;
	
	public ProductLike() {}

	public ProductLike(int productNo, int memberNo, Date pLikeDate, int count) {
		super();
		this.productNo = productNo;
		this.memberNo = memberNo;
		this.pLikeDate = pLikeDate;
		this.count = count;
	}

	public ProductLike(int productNo, int memberNo, int count) {
		super();
		this.productNo = productNo;
		this.memberNo = memberNo;
		this.count = count;
	}
	
	

	public ProductLike(int productNo, int memberNo, Date pLikeDate, String productImg, int price, String productName) {
		super();
		this.productNo = productNo;
		this.memberNo = memberNo;
		this.pLikeDate = pLikeDate;
		this.productImg = productImg;
		this.price = price;
		this.productName = productName;
	}

	public ProductLike(int productNo, int memberNo) {
		super();
		this.productNo = productNo;
		this.memberNo = memberNo;
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

	public Date getPLikeDate() {
		return pLikeDate;
	}

	public void setPLikeDate(Date likeDate) {
		this.pLikeDate = pLikeDate;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	

	public String getProductImg() {
		return productImg;
	}

	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	@Override
	public String toString() {
		return "ProductLike [productNo=" + productNo + ", memberNo=" + memberNo + ", pLikeDate=" + pLikeDate + ", count="
				+ count + ", productImg=" + productImg + ", price=" + price + ", productName=" + productName + "]";
	}

	
	
	
	

}
