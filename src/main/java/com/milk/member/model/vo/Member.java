package com.milk.member.model.vo;

import java.sql.Date;

public class Member {
	
	private int membeNo;
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String phone;
	private String email;
	private String addressNumber;
	private String address;
	private String addressDetail;
	private String profile;
	private Date enrollDate;
	private Date modifyDate;
	private String blackList;
	private String status;
	private String memberGrade;
	
	public Member() {}

	public Member(int membeNo, String memberId, String memberPwd, String memberName, String phone, String email,
			String addressNumber, String address, String addressDetail, String profile, Date enrollDate, Date modifyDate,
			String blackList, String status, String memberGrade) {
		super();
		this.membeNo = membeNo;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.phone = phone;
		this.email = email;
		this.addressNumber = addressNumber;
		this.address = address;
		this.addressDetail = addressDetail;
		this.profile = profile;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.blackList = blackList;
		this.status = status;
		this.memberGrade = memberGrade;
	}
	
	
	

	public Member(String memberId, String memberPwd, String memberName, String phone, String email, String addressNumber,
			String address, String addressDetail) {
		super();
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.phone = phone;
		this.email = email;
		this.addressNumber = addressNumber;
		this.address = address;
		this.addressDetail = addressDetail;
	}

	public Member(String memberId, String memberName) {
		super();
		this.memberId = memberId;
		this.memberName = memberName;
	}

	public int getMembeNo() {
		return membeNo;
	}

	public void setMembeNo(int membeNo) {
		this.membeNo = membeNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddressNumber() {
		return addressNumber;
	}

	public void setAddressNumber(String addressNumber) {
		this.addressNumber = addressNumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddressDetail() {
		return addressDetail;
	}

	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getBlackList() {
		return blackList;
	}

	public void setBlackList(String blackList) {
		this.blackList = blackList;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMemberGrade() {
		return memberGrade;
	}

	public void setMemberGrade(String memberGrade) {
		this.memberGrade = memberGrade;
	}

	@Override
	public String toString() {
		return "Member [membeNo=" + membeNo + ", memberId=" + memberId + ", memberPwd=" + memberPwd + ", memberName="
				+ memberName + ", phone=" + phone + ", email=" + email + ", addressNumber=" + addressNumber
				+ ", address=" + address + ", addressDetail=" + addressDetail + ", profile=" + profile + ", enrollDate="
				+ enrollDate + ", modifyDate=" + modifyDate + ", blackList=" + blackList + ", status=" + status
				+ ", memberGrade=" + memberGrade + "]";
	};

}
