package com.milk.recipe.model.vo;

public class Reply {
	
	private int replyNo;
	private String memberNo;
	private int refNo;
	private String replyContent;
	private String enrollDate;
	private String deleteStatus;
	private String reportStatus;
	private String profileImg;
	
	
	public Reply() {}

	
	
	public Reply(int replyNo, String memberNo, int refNo, String replyContent, String enrollDate, String deleteStatus,
			String reportStatus) {
		super();
		this.replyNo = replyNo;
		this.memberNo = memberNo;
		this.refNo = refNo;
		this.replyContent = replyContent;
		this.enrollDate = enrollDate;
		this.deleteStatus = deleteStatus;
		this.reportStatus = reportStatus;
	}



	public Reply(int replyNo, String memberNo, String replyContent, String enrollDate, String profileImg) {
		super();
		this.replyNo = replyNo;
		this.memberNo = memberNo;
		this.replyContent = replyContent;
		this.enrollDate = enrollDate;
		this.profileImg = profileImg;
	}



	public int getReplyNo() {
		return replyNo;
	}



	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}



	public String getMemberNo() {
		return memberNo;
	}



	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}



	public int getRefNo() {
		return refNo;
	}



	public void setRefNo(int refNo) {
		this.refNo = refNo;
	}



	public String getReplyContent() {
		return replyContent;
	}



	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}



	public String getEnrollDate() {
		return enrollDate;
	}



	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}



	public String getDeleteStatus() {
		return deleteStatus;
	}



	public void setDeleteStatus(String deleteStatus) {
		this.deleteStatus = deleteStatus;
	}



	public String getReportStatus() {
		return reportStatus;
	}



	public void setReportStatus(String reportStatus) {
		this.reportStatus = reportStatus;
	}

	


	public String getProfileImg() {
		return profileImg;
	}



	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}



	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", memberNo=" + memberNo + ", refNo=" + refNo + ", replyContent="
				+ replyContent + ", enrollDate=" + enrollDate + ", deleteStatus=" + deleteStatus + ", reportStatus="
				+ reportStatus + "]";
	}
	
}
