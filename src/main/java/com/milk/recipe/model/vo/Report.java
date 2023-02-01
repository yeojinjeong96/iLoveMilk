package com.milk.recipe.model.vo;

public class Report {

	private int reportNo;
	private String reportingMemberNo;
	private int refNo;
	private String reportContent;
	private String reportDate;
	private String reportType;
	private String refTitle;
	
	
	public Report() {}

	
	
	public Report(int reportNo, String reportingMemberNo, int refNo, String reportContent, String reportDate,
			String reportType) {
		super();
		this.reportNo = reportNo;
		this.reportingMemberNo = reportingMemberNo;
		this.refNo = refNo;
		this.reportContent = reportContent;
		this.reportDate = reportDate;
		this.reportType = reportType;
	}

	

	public Report(int reportNo, int refNo, String reportContent, String reportingMemberNo, String refTitle,
			String reportDate) {
		super();
		this.reportNo = reportNo;
		this.refNo = refNo;
		this.reportContent = reportContent;
		this.reportingMemberNo = reportingMemberNo;
		this.refTitle = refTitle;
		this.reportDate = reportDate;
	}



	public int getReportNo() {
		return reportNo;
	}



	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}



	public String getReportingMemberNo() {
		return reportingMemberNo;
	}



	public void setReportingMemberNo(String reportingMemberNo) {
		this.reportingMemberNo = reportingMemberNo;
	}



	public int getRefNo() {
		return refNo;
	}



	public void setRefNo(int refNo) {
		this.refNo = refNo;
	}



	public String getReportContent() {
		return reportContent;
	}



	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}



	public String getReportDate() {
		return reportDate;
	}



	public void setReportDate(String reportDate) {
		this.reportDate = reportDate;
	}



	public String getReportType() {
		return reportType;
	}



	public void setReportType(String reportType) {
		this.reportType = reportType;
	}

	


	public String getRefTitle() {
		return refTitle;
	}



	public void setRefTitle(String refTitle) {
		this.refTitle = refTitle;
	}



	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", reportingMemberNo=" + reportingMemberNo + ", refNo=" + refNo
				+ ", reportContent=" + reportContent + ", reportDate=" + reportDate + ", reportType=" + reportType
				+ ", refTitle=" + refTitle + "]";
	}



	
	
	
	
	
}
