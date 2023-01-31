package com.milk.member.model.vo;

public class Report {
	
	private int reportNo;
	private int repMemNo;
	private int refNo;
	private String repContent;
	private String repDate;
	private String repType;
	private String memberId;
	
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

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", repMemNo=" + repMemNo + ", refNo=" + refNo + ", repContent="
				+ repContent + ", repDate=" + repDate + ", repType=" + repType + ", memberId=" + memberId + "]";
	}


	
	

}
