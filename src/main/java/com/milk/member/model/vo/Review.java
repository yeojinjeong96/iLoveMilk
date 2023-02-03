package com.milk.member.model.vo;

import java.sql.Date;

public class Review {
	
	private int reviewNo;
	private int memberNo;
	private int productNo;
	private String reviewContent1;
	private String reviewContent;
	private int star;
	private Date rEnrollDate;
	private Date rModifyDate;
	private String rReport;
	private String rStatus;
	private String productName;
	private String productImg;
	
	
	public Review() {}
	
	

	public Review(int reviewNo, int memberNo, int productNo, String reviewContent, int star, Date rEnrollDate,
			Date rModifyDate, String rReport, String rStatus, String productName, String productImg) {
		super();
		this.reviewNo = reviewNo;
		this.memberNo = memberNo;
		this.productNo = productNo;
		this.reviewContent = reviewContent;
		this.star = star;
		this.rEnrollDate = rEnrollDate;
		this.rModifyDate = rModifyDate;
		this.rReport = rReport;
		this.rStatus = rStatus;
		this.productName = productName;
		this.productImg = productImg;
	}



	public Review(int reviewNo, String reviewContent, int star, Date rEnrollDate, Date rModifyDate, String rReport,
			String rStatus, String productName, String productImg) {
		super();
		this.reviewNo = reviewNo;
		this.reviewContent = reviewContent;
		this.star = star;
		this.rEnrollDate = rEnrollDate;
		this.rModifyDate = rModifyDate;
		this.rReport = rReport;
		this.rStatus = rStatus;
		this.productName = productName;
		this.productImg = productImg;
	}



	public Review(int reviewNo, String reviewContent1, String reviewContent, int star, Date rEnrollDate, Date rModifyDate, String productName,
			String productImg) {
		super();
		this.reviewNo = reviewNo;
		this.reviewContent1 = reviewContent1;
		this.reviewContent = reviewContent;
		this.star = star;
		this.rEnrollDate = rEnrollDate;
		this.rModifyDate = rModifyDate;
		this.productName = productName;
		this.productImg = productImg;
	}
	
	

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public Date getrEnrollDate() {
		return rEnrollDate;
	}

	public void setrEnrollDate(Date rEnrollDate) {
		this.rEnrollDate = rEnrollDate;
	}

	public Date getrModifyDate() {
		return rModifyDate;
	}

	public void setrModifyDate(Date rModifyDate) {
		this.rModifyDate = rModifyDate;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductImg() {
		return productImg;
	}

	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}
	
	

	public int getMemberNo() {
		return memberNo;
	}



	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}



	public int getProductNo() {
		return productNo;
	}



	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}



	public String getrReport() {
		return rReport;
	}



	public void setrReport(String rReport) {
		this.rReport = rReport;
	}



	public String getrStatus() {
		return rStatus;
	}



	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}



	public String getReviewContent1() {
		return reviewContent1;
	}



	public void setReviewContent1(String reviewContent1) {
		this.reviewContent1 = reviewContent1;
	}



	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", memberNo=" + memberNo + ", productNo=" + productNo
				+ ", reviewContent1=" + reviewContent1 + ", reviewContent=" + reviewContent + ", star=" + star
				+ ", rEnrollDate=" + rEnrollDate + ", rModifyDate=" + rModifyDate + ", rReport=" + rReport
				+ ", rStatus=" + rStatus + ", productName=" + productName + ", productImg=" + productImg + "]";
	}



	





	

}
