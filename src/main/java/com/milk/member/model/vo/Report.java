package com.milk.member.model.vo;

public class Report {
	
	private int reportNo;
	private int repMemNo;
	private int refNo;
	private String repContent;
	private String repDate;
	private String repType;
	private String memberId;
	private String memberGrade;
	private int count;
	
	public Report() {}

	public Report(int reportNo, int repMemNo, int refNo, String repContent, String repDate, String repType) {
		super();
		this.reportNo = reportNo;
		this.repMemNo = repMemNo;
		this.refNo = refNo;
		this.repContent = repContent;
		this.repDate = repDate;
		this.repType = repType;
	}
	
	

	public Report(int reportNo, int repMemNo, int refNo, String repContent, String repDate, String repType,
			String memberId) {
		super();
		this.reportNo = reportNo;
		this.repMemNo = repMemNo;
		this.refNo = refNo;
		this.repContent = repContent;
		this.repDate = repDate;
		this.repType = repType;
		this.memberId = memberId;
	}
	
	

	public Report(String memberId,int count, String memberGrade ) {
		super();
		this.memberId = memberId;
		this.count = count;
		this.memberGrade = memberGrade;
		
	}
	
	

	public Report(String memberId, int repMemNo, int reportNo, int refNo, String repContent, String repDate, String repType ) {
		super();
		this.memberId = memberId;
		this.repMemNo = repMemNo;
		this.reportNo = reportNo;
		this.refNo = refNo;
		this.repContent = repContent;
		this.repDate = repDate;
		this.repType = repType;
		
	}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public int getRepMemNo() {
		return repMemNo;
	}

	public void setRepMemNo(int repMemNo) {
		this.repMemNo = repMemNo;
	}

	public int getRefNo() {
		return refNo;
	}

	public void setRefNo(int refNo) {
		this.refNo = refNo;
	}

	public String getRepContent() {
		return repContent;
	}

	public void setRepContent(String repContent) {
		this.repContent = repContent;
	}

	public String getRepDate() {
		return repDate;
	}

	public void setRepDate(String repDate) {
		this.repDate = repDate;
	}

	public String getRepType() {
		return repType;
	}

	public void setRepType(String repType) {
		this.repType = repType;
	}
	
	

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	

	public String getMemberGrade() {
		return memberGrade;
	}

	public void setMemberGrade(String memberGrade) {
		this.memberGrade = memberGrade;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", repMemNo=" + repMemNo + ", refNo=" + refNo + ", repContent="
				+ repContent + ", repDate=" + repDate + ", repType=" + repType + ", memberId=" + memberId
				+ ", memberGrade=" + memberGrade + ", count=" + count + "]";
	}


	
	

}
