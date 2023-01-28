package com.milk.product.model.vo;

import java.util.Date;

public class ProductLike {
	
	private int productNo;
	private int memberNo;
	private Date likeDate;
	private String likeNo;
	
	public ProductLike() {}

	public ProductLike(int productNo, int memberNo, Date likeDate, String likeNo) {
		super();
		this.productNo = productNo;
		this.memberNo = memberNo;
		this.likeDate = likeDate;
		this.likeNo = likeNo;
	}

	public ProductLike(int productNo, int memberNo, String likeNo) {
		super();
		this.productNo = productNo;
		this.memberNo = memberNo;
		this.likeNo = likeNo;
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

	public String getLikeNo() {
		return likeNo;
	}

	public void setLikeNo(String likeNo) {
		this.likeNo = likeNo;
	}

	@Override
	public String toString() {
		return "ProductLike [productNo=" + productNo + ", memberNo=" + memberNo + ", likeDate=" + likeDate + ", likeNo="
				+ likeNo + "]";
	}
	
	

}
