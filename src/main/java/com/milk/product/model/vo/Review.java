package com.milk.product.model.vo;

public class Review {
	
	private int reviewNo;
	private int memberNo;
	private int productNo;
	private String content;
	private int star;
	private String rEnrollDate;
	private String rModifyDate;
	private String rReport;
	private String rStatus;
	
	
	public Review(int reviewNo, int memberNo, int productNo, String content, int star, String rEnrollDate,
			String rModifyDate, String rReport, String rStatus) {
		super();
		this.reviewNo = reviewNo;
		this.memberNo = memberNo;
		this.productNo = productNo;
		this.content = content;
		this.star = star;
		this.rEnrollDate = rEnrollDate;
		this.rModifyDate = rModifyDate;
		this.rReport = rReport;
		this.rStatus = rStatus;
	}


	public int getReviewNo() {
		return reviewNo;
	}


	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
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


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public int getStar() {
		return star;
	}


	public void setStar(int star) {
		this.star = star;
	}


	public String getrEnrollDate() {
		return rEnrollDate;
	}


	public void setrEnrollDate(String rEnrollDate) {
		this.rEnrollDate = rEnrollDate;
	}


	public String getrModifyDate() {
		return rModifyDate;
	}


	public void setrModifyDate(String rModifyDate) {
		this.rModifyDate = rModifyDate;
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


	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", memberNo=" + memberNo + ", productNo=" + productNo + ", content="
				+ content + ", star=" + star + ", rEnrollDate=" + rEnrollDate + ", rModifyDate=" + rModifyDate
				+ ", rReport=" + rReport + ", rStatus=" + rStatus + "]";
	}
	
	
	
	

}
