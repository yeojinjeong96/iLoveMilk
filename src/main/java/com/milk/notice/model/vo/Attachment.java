package com.milk.notice.model.vo;

public class Attachment {

	private int fileNo;
	private int refNo;
	private String changeName;
	private String uploadDate;
	private String status;
	private String fileType;
	
	public Attachment() {}
	public Attachment(int fileNo, int refNo, String changeName, String uploadDate, String status, String fileType) {
		super();
		this.fileNo = fileNo;
		this.refNo = refNo;
		this.changeName = changeName;
		this.uploadDate = uploadDate;
		this.status = status;
		this.fileType = fileType;
	}
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public int getRefNo() {
		return refNo;
	}
	public void setRefNo(int refNo) {
		this.refNo = refNo;
	}
	public String getChangeName() {
		return changeName;
	}
	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}
	public String getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	@Override
	public String toString() {
		return "Attachment [fileNo=" + fileNo + ", refNo=" + refNo + ", changeName=" + changeName + ", uploadDate="
				+ uploadDate + ", status=" + status + ", fileType=" + fileType + "]";
	}
	
	
}
