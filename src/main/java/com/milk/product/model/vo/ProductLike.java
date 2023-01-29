package com.milk.product.model.vo;

import java.util.Date;

public class ProductLike {
	
	private int productNo;
	private int memberNo;
	private Date likeDate;
	private int count;
	
	public ProductLike() {}

	public ProductLike(int productNo, int memberNo, Date likeDate, int count) {
		super();
		this.productNo = productNo;
		this.memberNo = memberNo;
		this.likeDate = likeDate;
		this.count = count;
	}

	public ProductLike(int productNo, int memberNo, int count) {
		super();
		this.productNo = productNo;
		this.memberNo = memberNo;
		this.count = count;
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

	public Date getLikeDate() {
		return likeDate;
	}

	public void setLikeDate(Date likeDate) {
		this.likeDate = likeDate;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "ProductLike [productNo=" + productNo + ", memberNo=" + memberNo + ", likeDate=" + likeDate + ", count="
				+ count + "]";
	}
	
	

}
