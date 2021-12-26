package com.gr.farming.member.model;

import java.sql.Timestamp;

public class MemberVO {
	private int memberNo;
	private String name;
	private String email;
	private String pwd;
	private Timestamp regdate;
	private String address1;
	private String address2;
	private String zipcode;
	
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	@Override
	public String toString() {
		return "MemberVO [memberNo=" + memberNo + ", name=" + name + ", email=" + email + ", pwd=" + pwd + ", regdate="
				+ regdate + ", address1=" + address1 + ", address2=" + address2 + ", zipcode=" + zipcode + "]";
	}
	
}
