package com.milk.notice.model.vo;

public class Notice {
	
	
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private int noticeType;
	private int count;
	private String enrollDate;
	private String status;
	private int writerNo;
	
	private String managerName;
	private String titleImg;
	
	
	
	
	public Notice() {}
	
	


	public Notice(int noticeNo, String noticeTitle, int count, String enrollDate,
			String managerName) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
	
		this.count = count;
		this.enrollDate = enrollDate;
		this.managerName = managerName;
	}




	public Notice(int noticeNo, String noticeTitle, String noticeContent, int noticeType, int count, String enrollDate,
			String status, int writerNo, String managerName) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeType = noticeType;
		this.count = count;
		this.enrollDate = enrollDate;
		this.status = status;
		this.writerNo = writerNo;
		this.managerName = managerName;
	}



	



	



	public Notice(int noticeNo, String noticeTitle, String noticeContent, int count, String enrollDate,
			String managerName) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.count = count;
		this.enrollDate = enrollDate;
		this.managerName = managerName;
	}




	public String getTitleImg() {
		return titleImg;
	}




	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}




	public String getNoticeContent() {
		return noticeContent;
	}




	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}




	public String getManagerName() {
		return managerName;
	}


	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}


	
	

	
	
	public int getNoticeNo() {
		return noticeNo;
	}



	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}



	public String getNoticeTitle() {
		return noticeTitle;
	}



	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}



	public int getNoticeType() {
		return noticeType;
	}



	public void setNoticeType(int noticeType) {
		this.noticeType = noticeType;
	}



	public int getCount() {
		return count;
	}



	public void setCount(int count) {
		this.count = count;
	}



	public String getEnrollDate() {
		return enrollDate;
	}



	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	public int getWriterNo() {
		return writerNo;
	}



	public void setWriterNo(int writerNo) {
		this.writerNo = writerNo;
	}




	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", noticeType=" + noticeType + ", count=" + count + ", enrollDate=" + enrollDate + ", status="
				+ status + ", writerNo=" + writerNo + ", managerName=" + managerName + "]";
	}




	
	
}
