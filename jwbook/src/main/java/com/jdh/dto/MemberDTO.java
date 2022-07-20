package com.jdh.dto;

public class MemberDTO {

	private String name = null;

	private String userid = null;

	private String pwd = null;

	private String email = null;

	private String phone = null;

	private int gender = 0;

	public MemberDTO() {

	}

	public String getName() {

		return name;

	}

	public void setName(String name) {

		this.name = name;

	}

	public String getUserid() {

		return userid;

	}

	public void setUserid(String userid) {

		this.userid = userid;

	}

	public String getPwd() {

		return pwd;

	}

	public void setPwd(String pwd) {

		this.pwd = pwd;

	}

	public String getEmail() {

		return email;

	}

	public void setEmail(String email) {

		this.email = email;

	}

	public String getPhone() {

		return phone;

	}

	public void setPhone(String phone) {

		this.phone = phone;

	}

	public int getGender() {

		return gender;

	}

	public void setGender(int gender) {
	
		this.gender = gender;

	}

	@Override

	public String toString() {

		return "MemberDTO [name=" + name + ", userid=" + userid + ", pwd=" + pwd + ", email=" + email + ", phone=" + phone + ", gender=" + gender + "]";

	}

}