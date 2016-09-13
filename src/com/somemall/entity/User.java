package com.somemall.entity;

import java.io.Serializable;

public class User implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer userid;
	private String username;
	private String password;
	private String phone;
	private String email;
	private char role;// '1管理员 0普通用户'
	private char isdel;// default '0'

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public char getRole() {
		return role;
	}

	public void setRole(char role) {
		this.role = role;
	}

	public char getIsdel() {
		return isdel;
	}

	public void setIsdel(char isdelete) {
		this.isdel = isdelete;
	}

	@Override
	public String toString() {
		return "UserG [userid=" + userid + ", username=" + username
				+ ", password=" + password + ", phone=" + phone + ", email="
				+ email + ", role=" + role + ", isdelete=" + isdel + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + userid;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		if (userid != other.userid)
			return false;
		return true;
	}

}
