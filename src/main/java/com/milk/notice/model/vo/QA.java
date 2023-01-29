package com.milk.notice.model.vo;

public class QA {
	
	private int qNo;
	private int qWriter;
	private String qTitle;
	private String qContent;
	private String enrollDate;
	private String status;
	private int aWriter;
	private String answerStatus;
	private String answerDate;
	private String aTitle;
	private String aConent;
	private String fCategory;
	private String sCategory;
	
	public QA() {}
	public QA(int qNo, int qWriter, String qTitle, String qContent, String enrollDate, String status, int aWriter,
			String answerStatus, String answerDate, String aTitle, String aConent, String fCategory, String sCategory) {
		super();
		this.qNo = qNo;
		this.qWriter = qWriter;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.enrollDate = enrollDate;
		this.status = status;
		this.aWriter = aWriter;
		this.answerStatus = answerStatus;
		this.answerDate = answerDate;
		this.aTitle = aTitle;
		this.aConent = aConent;
		this.fCategory = fCategory;
		this.sCategory = sCategory;
	}
	
	
	public QA(int qNo, String qTitle, String enrollDate, String status, String fCategory, String sCategory) {
		super();
		this.qNo = qNo;
		this.qTitle = qTitle;
		this.enrollDate = enrollDate;
		this.status = status;
		this.fCategory = fCategory;
		this.sCategory = sCategory;
	}
	public int getqNo() {
		return qNo;
	}
	public void setqNo(int qNo) {
		this.qNo = qNo;
	}
	public int getqWriter() {
		return qWriter;
	}
	public void setqWriter(int qWriter) {
		this.qWriter = qWriter;
	}
	public String getqTitle() {
		return qTitle;
	}
	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}
	public String getqContent() {
		return qContent;
	}
	public void setqContent(String qContent) {
		this.qContent = qContent;
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
	public int getaWriter() {
		return aWriter;
	}
	public void setaWriter(int aWriter) {
		this.aWriter = aWriter;
	}
	public String getAnswerStatus() {
		return answerStatus;
	}
	public void setAnswerStatus(String answerStatus) {
		this.answerStatus = answerStatus;
	}
	public String getAnswerDate() {
		return answerDate;
	}
	public void setAnswerDate(String answerDate) {
		this.answerDate = answerDate;
	}
	public String getaTitle() {
		return aTitle;
	}
	public void setaTitle(String aTitle) {
		this.aTitle = aTitle;
	}
	public String getaConent() {
		return aConent;
	}
	public void setaConent(String aConent) {
		this.aConent = aConent;
	}
	public String getfCategory() {
		return fCategory;
	}
	public void setfCategory(String fCategory) {
		this.fCategory = fCategory;
	}
	public String getsCategory() {
		return sCategory;
	}
	public void setsCategory(String sCategory) {
		this.sCategory = sCategory;
	}
	@Override
	public String toString() {
		return "QA [qNo=" + qNo + ", qWriter=" + qWriter + ", qTitle=" + qTitle + ", qContent=" + qContent
				+ ", enrollDate=" + enrollDate + ", status=" + status + ", aWriter=" + aWriter + ", answerStatus="
				+ answerStatus + ", answerDate=" + answerDate + ", aTitle=" + aTitle + ", aConent=" + aConent
				+ ", fCategory=" + fCategory + ", sCategory=" + sCategory + "]";
	}
	
	
	
}
