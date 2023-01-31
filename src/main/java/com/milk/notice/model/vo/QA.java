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
	private String aContent;
	private String fCategory;
	private String sCategory;
	private String memberName;
	private String managerName;
	private String memberId;
	private int managerNo;
	
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
		this.aContent = aConent;
		this.fCategory = fCategory;
		this.sCategory = sCategory;
	}
	
	
	
	
	
	public QA(int qNo, String memberName, String qTitle, String qContent, String enrollDate,
			String managerName, String answerStatus, String aTitle, String answerDate, String aContent, String fCategory, String sCategory) {
		super();
		this.qNo = qNo;
		this.memberName = memberName;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.enrollDate= enrollDate;
		this.managerName = managerName;
		this.answerStatus = answerStatus;
		this.aTitle = aTitle;
		this.answerDate = answerDate;
		this.aContent = aContent;
		this.fCategory = fCategory;
		this.sCategory = sCategory;
		
	}
	
	
	public QA(int qNo,String memberId, String qTitle,String qContent, String enrollDate, String answerStatus, String fCategory, String sCategory) {
		super();
		this.qNo = qNo;
		this.memberId=memberId;
		this.qTitle = qTitle;
		this.qContent= qContent;
		this.enrollDate = enrollDate;
		this.answerStatus = answerStatus;
		this.fCategory = fCategory;
		this.sCategory = sCategory;
	}
	
	
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getManagerName() {
		return managerName;
	}
	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}
	public QA(int qNo, String qTitle, String enrollDate, String answerStatus, String fCategory, String sCategory) {
		super();
		this.qNo = qNo;
		this.qTitle = qTitle;
		this.enrollDate = enrollDate;
		this.answerStatus = answerStatus;
		this.fCategory = fCategory;
		this.sCategory = sCategory;
	}
	
	public QA(int qNo, String qContent, String aContent,String answerDate, String answerStatus, String fCategory, String sCategory,String managerName, int managerNo) {
		super();
		this.qNo = qNo;
		this.qContent = qContent;
		this.aContent= aContent;
		this.answerDate = answerDate;
		this.answerStatus = answerStatus;
		this.fCategory = fCategory;
		this.sCategory = sCategory;
		this.managerName= managerName;
		this.managerNo =managerNo;

	}
	
	
	
	public int getManagerNo() {
		return managerNo;
	}
	public void setManagerNo(int managerNo) {
		this.managerNo = managerNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
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
	public String getaContent() {
		return aContent;
	}
	public void setaContent(String aContent) {
		this.aContent = aContent;
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
				+ answerStatus + ", answerDate=" + answerDate + ", aTitle=" + aTitle + ", aConent=" + aContent
				+ ", fCategory=" + fCategory + ", sCategory=" + sCategory + "]";
	}
	
	
	
}
